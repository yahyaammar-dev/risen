<?php

namespace Webkul\Velocity\Http\Controllers\Shop;

use Webkul\Product\Facades\ProductImage;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class ShopController extends Controller
{
    /**
     * Index to handle the view loaded with the search results.
     *
     * @return \Illuminate\View\View
     */
    public function search()
    {
        $results = $this->velocityProductRepository->searchProductsFromCategory(request()->all());

        return view($this->_config['view'])->with('results', $results ? $results : null);
    }

    /**
     * Fetch product details.
     *
     * @param  string  $slug
     * @return \Illuminate\Http\Response
     */
    public function fetchProductDetails($slug)
    {
        $product = $this->productRepository->findBySlug($slug);

        if ($product) {
            $productReviewHelper = app('Webkul\Product\Helpers\Review');

            $galleryImages = ProductImage::getProductBaseImage($product);

            $response = [
                'status' => true,
                'details' => [
                    'name' => $product->name,
                    'urlKey' => $product->url_key,
                    'priceHTML' => view('shop::products.price', ['product' => $product])->render(),
                    'totalReviews' => $productReviewHelper->getTotalReviews($product),
                    'rating' => ceil($productReviewHelper->getAverageRating($product)),
                    'image' => $galleryImages['small_image_url'],
                ],
            ];
        } else {
            $response = [
                'status' => false,
                'slug' => $slug,
            ];
        }

        return $response;
    }



    /**
     * Fetch product details.
     *
     * @param  string  $slug
     * @return \Illuminate\Http\Response
     */
    public function fetchProductDetails2($id)
    {
        $product = $this->productRepository->find($id);

        if ($product) {

            $galleryImages = ProductImage::getProductBaseImage($product);

            $product['gallery'] = $galleryImages;

            $response = [
                'status' => true,
                'details' => [
                    'product' => $product
                ],
            ];
        } else {
            $response = [
                'status' => false,
                'slug' => $id,
            ];
        }

        return $response;
    }





    /**
     * Fetch category details.
     *
     * @return \Illuminate\Http\Response
     */
    public function categoryDetails()
    {
        $slug = request()->get('category-slug');

        if (!$slug) {
            abort(404);
        }

        switch ($slug) {
            case 'new-products':
            case 'featured-products':
                $count = request()->get('count');

                if ($slug == 'new-products') {
                    $products = $this->velocityProductRepository->getNewProducts($count);
                } else if ($slug == 'featured-products') {
                    $products = $this->velocityProductRepository->getFeaturedProducts($count);
                }

                $response = [
                    'status' => true,
                    'products' => $products->map(function ($product) {
                        if (core()->getConfigData('catalog.products.homepage.out_of_stock_items')) {
                            return $this->velocityHelper->formatProduct($product);
                        } else {
                            if ($product->isSaleable()) {
                                return $this->velocityHelper->formatProduct($product);
                            }
                        }
                    })->reject(function ($product) {
                        return is_null($product);
                    })->values(),
                ];

                break;
            default:
                $categoryDetails = $this->categoryRepository->findByPath($slug);

                if ($categoryDetails) {
                    $list = false;
                    $customizedProducts = [];
                    $products = $this->productRepository->getAll($categoryDetails->id);

                    foreach ($products as $product) {
                        $productDetails = [];

                        $productDetails = array_merge($productDetails, $this->velocityHelper->formatProduct($product));

                        array_push($customizedProducts, $productDetails);
                    }

                    $response = [
                        'status' => true,
                        'list' => $list,
                        'categoryDetails' => $categoryDetails,
                        'categoryProducts' => $customizedProducts,
                    ];
                }

                break;
        }

        return $response ?? [
            'status' => false,
        ];
    }

    /**
     * Fetch categories.
     *
     * @return array
     */
    public function fetchCategories()
    {
        $formattedCategories = [];

        $categories = $this->categoryRepository->getVisibleCategoryTree(core()->getCurrentChannel()->root_category_id);

        foreach ($categories as $category) {
            $formattedCategories[] = $this->getCategoryFilteredData($category);
        }

        return [
            'categories' => $formattedCategories,
        ];
    }

    /**
     * Fetch fancy category.
     *
     * @param  string  $slug
     * @return array
     */
    public function fetchFancyCategoryDetails($slug)
    {
        $categoryDetails = $this->categoryRepository->findByPath($slug);

        if ($categoryDetails) {
            $response = [
                'status' => true,
                'categoryDetails' => $this->getCategoryFilteredData($categoryDetails),
            ];
        }

        return $response ?? [
            'status' => false,
        ];
    }

    /**
     * Get wishlist.
     *
     * @return \Illuminate\View\View
     */
    public function getWishlistList()
    {
        return view($this->_config['view']);
    }

    /**
     * This function will provide the count of wishlist and comparison for logged in user.
     *
     * @return \Illuminate\Http\Response
     */
    public function getItemsCount()
    {
        if ($customer = auth()->guard('customer')->user()) {

            if (!core()->getConfigData('catalog.products.homepage.out_of_stock_items')) {
                $wishlistItemsCount = $this->wishlistRepository->getModel()
                    ->leftJoin('products as ps', 'wishlist.product_id', '=', 'ps.id')
                    ->leftJoin('product_inventories as pv', 'ps.id', '=', 'pv.product_id')
                    ->where(function ($qb) {
                        $qb
                            ->WhereIn('ps.type', ['configurable', 'grouped', 'downloadable', 'bundle', 'booking'])
                            ->orwhereIn('ps.type', ['simple', 'virtual'])->where('pv.qty', '>', 0);
                    })
                    ->where('wishlist.customer_id', $customer->id)
                    ->where('wishlist.channel_id', core()->getCurrentChannel()->id)
                    ->count('wishlist.id');
            } else {
                $wishlistItemsCount = $this->wishlistRepository->count([
                    'customer_id' => $customer->id,
                    'channel_id' => core()->getCurrentChannel()->id,
                ]);
            }

            $comparedItemsCount = $this->compareProductsRepository->count([
                'customer_id' => $customer->id,
            ]);

            $response = [
                'status' => true,
                'compareProductsCount' => $comparedItemsCount,
                'wishlistedProductsCount' => $wishlistItemsCount,
            ];
        }

        return response()->json($response ?? [
            'status' => false,
        ]);
    }

    /**
     * This method will provide details of multiple product.
     *
     * @return \Illuminate\Http\Response
     */
    public function getDetailedProducts()
    {
        if ($items = request()->get('items')) {
            $moveToCart = request()->get('moveToCart');

            $productCollection = $this->velocityHelper->fetchProductCollection($items, $moveToCart);

            $response = [
                'status' => 'success',
                'products' => $productCollection,
            ];
        }

        return response()->json($response ?? [
            'status' => false,
        ]);
    }

    /**
     * This method will fetch products from category.
     *
     * @param  int  $categoryId
     *
     * @return \Illuminate\Http\Response
     */
    public function getCategoryProducts($categoryId)
    {
        /* fetch category details */
        $categoryDetails = $this->categoryRepository->find($categoryId);

        /* if category not found then return empty response */
        if (!$categoryDetails) {
            return response()->json([
                'products' => [],
                'paginationHTML' => '',
            ]);
        }

        /* fetching products */
        $products = $this->productRepository->getAll($categoryId);
        $products->withPath($categoryDetails->slug);

        /* sending response */
        return response()->json([
            'products' => $products
        ]);
    }






    /**
     * This method will fetch products from category.
     *
     *
     * @return \Illuminate\Http\Response
     */
    public function getProducts()
    {
        /* fetch category details */
        $products = $this->productRepository->getAll();

        return $products;
    }






    /**
     * This method will fetch products from category.
     *
     * @param  int  $categoryId
     *
     * @return \Illuminate\Http\Response
     */
    public function getCategoryProducts2($categoryId)
    {
        /* fetch category details */
        $categoryDetails = $this->categoryRepository->find($categoryId);

        /* if category not found then return empty response */
        if (!$categoryDetails) {
            return response()->json([
                'products' => [],
                'paginationHTML' => '',
            ]);
        }

        /* fetching products */
        $products = $this->productRepository->getAll($categoryId);
        // $products->withPath($categoryDetails->slug);
        return $products;
    }


    /**
     * This method will fetch products from category.
     *
     * @param  int  $categoryId
     *
     * @return \Illuminate\Http\Response
     */
    public function createUser()
    {
        DB::table('users')->insert([
            'name' => request()->input('first_name') . request()->input('last_name'),
            'email' => request()->input('email'),
            'password' => Hash::make(request()->input('password')),
        ]);


        return response()->json(['message' => 'User created successfully'], 201);
    }





    /**
     * This method will fetch products from category.
     *
     * @param  int  $categoryId
     *
     * @return \Illuminate\Http\Response
     */
    public function loginUser()
    {
        // Retrieve the user from the database based on email
        $user = DB::table('users')->where('email', request()->input('email'))->first();

        // Check if user exists
        if ($user) {
            // Verify the password
            if (Hash::check(request()->input('password'), $user->password)) {
               

                return response()->json(['message' => 'Login successful'], 200);
            }
        }

        // If user does not exist or password is incorrect, return an error response
        return response()->json(['message' => 'Unauthorized'], 401);

    }





    /**
     * Get category filtered data.
     *
     * @param  \Webkul\Category\Contracts\Category  $category
     * @return array
     */
    private function getCategoryFilteredData($category)
    {
        $formattedChildCategory = [];

        foreach ($category->children as $child) {
            $formattedChildCategory[] = $this->getCategoryFilteredData($child);
        }

        return [
            'id' => $category->id,
            'slug' => $category->slug,
            'name' => $category->name,
            'children' => $formattedChildCategory,
            'category_icon_url' => $category->category_icon_url,
            'image_url' => $category->image_url,
        ];
    }
}
