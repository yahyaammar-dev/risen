@extends('admin::layouts.content')

@section('page_title')
{{ __('admin::app.catalog.products.add-title') }}
@stop

@push('css')
<style>
    .table td .label {
        margin-right: 10px;
    }

    .table td .label:last-child {
        margin-right: 0;
    }

    .table td .label .icon {
        vertical-align: middle;
        cursor: pointer;
    }
</style>
@endpush

@section('content')
<div class="content">
    <form method="POST"
              enctype="multipart/form-data"
              action="uploadproducts"
              @submit.prevent="onSubmit">
        <div class="page-header">
            <div class="page-title">
                <h1>
                    <i class="icon angle-left-icon back-link"
                              onclick="window.location = '{{ route('admin.catalog.products.index') }}'"></i>
                    Upload Product
                </h1>
            </div>

            <div class="page-action">
                <button type="submit"
                          class="btn btn-lg btn-primary">
                    Upload Products
                </button>
            </div>
        </div>

        <div class="page-content">
            @csrf()
            @php
            $familyId = request()->input('family');
            @endphp

            {!! view_render_event('bagisto.admin.catalog.product.create_form_accordian.general.before') !!}

            <accordian :title="'Upload Your Products'"
                      :active="true">
                <div slot="body">
                    {!! view_render_event('bagisto.admin.catalog.product.create_form_accordian.general.controls.before')
                    !!}
                    <div class="control-group"
                              :class="[errors.has('type') ? 'has-error' : '']">
                        <label for="type"
                                  class="required"> Upload your File </label>

                        <input type="file"
                                  class="required"
                                  name="product_file"
                                  style="padding: 10px; margin-top: 0.5rem; background: #0041ff; border-radius: 5px; color: white;"
                                  accept=".xls,.xlsx" />

                        @if ($familyId)
                        <input type="hidden"
                                  name="type"
                                  value="{{ app('request')->input('type') }}" />
                        @endif

                        <span class="control-error"
                                  v-if="errors.has('type')">@{{ errors.first('type') }}</span>

                    </div>

                    @if ($familyId)
                    <input type="hidden"
                              name="attribute_family_id"
                              value="{{ $familyId }}" />
                    @endif

                </div>




                {!! view_render_event('bagisto.admin.catalog.product.create_form_accordian.general.controls.after') !!}
        </div>
        </accordian>

        {!! view_render_event('bagisto.admin.catalog.product.create_form_accordian.general.after') !!}

        @if ($familyId)
        {!! view_render_event('bagisto.admin.catalog.product.create_form_accordian.configurable_attributes.before') !!}

        <accordian :title="'{{ __('admin::app.catalog.products.configurable-attributes') }}'"
                  :active="true">
            <div slot="body">
                {!!
                view_render_event('bagisto.admin.catalog.product.create_form_accordian.configurable_attributes.controls.before')
                !!}

                <div class="table">
                    <table>
                        <thead>
                            <tr>
                                <th>{{ __('admin::app.catalog.products.attribute-header') }}</th>
                                <th>{{ __('admin::app.catalog.products.attribute-option-header') }}</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach ($configurableFamily->configurable_attributes as $attribute)
                            <tr>
                                <td>
                                    {{ $attribute->admin_name }}
                                </td>

                                <td>
                                    @foreach ($attribute->options as $option)
                                    <span class="label">
                                        <input type="hidden"
                                                  name="super_attributes[{{$attribute->code}}][]"
                                                  value="{{ $option->id }}" />
                                        {{ $option->admin_name }}

                                        <i class="icon cross-icon"></i>
                                    </span>
                                    @endforeach
                                </td>

                                <td class="actions">
                                    <i class="icon trash-icon"></i>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                {!!
                view_render_event('bagisto.admin.catalog.product.create_form_accordian.configurable_attributes.controls.after')
                !!}
            </div>
        </accordian>

        {!! view_render_event('bagisto.admin.catalog.product.create_form_accordian.configurable_attributes.after') !!}
        @endif
</div>
</form>
</div>
@stop

@push('scripts')
<script>    ocument).ready(function () {
              ss-icon').on('click', function (e) {
                          .remove();
        })        '.        con'        , function (e) {
             $(e.t             tr').              })
    });
</script>
@endpush