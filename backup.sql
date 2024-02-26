-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: ecom
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Example','admin@example.com','$2y$10$NFTrrE6EVNQs5s1bjc0bu.Bi7CPLQ7MrVzGQqdNBkblGUidNyVwr.','BAaZjPXJfySNW0wfJMTBZPnx6j2KXc49jCUUIXUcdx0Z7uNePGi8xCOvflaHHqmfUZsHltuW0SulmJfq',1,1,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_families`
--

DROP TABLE IF EXISTS `attribute_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_families` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_families`
--

LOCK TABLES `attribute_families` WRITE;
/*!40000 ALTER TABLE `attribute_families` DISABLE KEYS */;
INSERT INTO `attribute_families` VALUES (1,'default','Default',0,1);
/*!40000 ALTER TABLE `attribute_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_group_mappings`
--

DROP TABLE IF EXISTS `attribute_group_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int unsigned NOT NULL,
  `attribute_group_id` int unsigned NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_group_mappings`
--

LOCK TABLES `attribute_group_mappings` WRITE;
/*!40000 ALTER TABLE `attribute_group_mappings` DISABLE KEYS */;
INSERT INTO `attribute_group_mappings` VALUES (1,1,1),(2,1,3),(3,1,4),(4,1,5),(5,1,6),(6,1,7),(7,1,8),(8,1,10),(9,2,1),(10,2,2),(11,4,1),(12,4,2),(13,4,3),(14,4,4),(15,4,5),(16,3,1),(17,3,2),(18,3,3),(19,5,1),(20,5,2),(21,5,3),(22,5,4),(23,1,11),(24,1,12),(25,1,13),(26,1,9),(27,1,2);
/*!40000 ALTER TABLE `attribute_group_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_groups`
--

DROP TABLE IF EXISTS `attribute_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `attribute_family_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_groups`
--

LOCK TABLES `attribute_groups` WRITE;
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` VALUES (1,'General',1,0,1),(2,'Description',2,0,1),(3,'Meta Description',3,0,1),(4,'Price',4,0,1),(5,'Shipping',5,0,1);
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translations`
--

DROP TABLE IF EXISTS `attribute_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `attribute_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES (1,'en','Red',1),(2,'en','Green',2),(3,'en','Yellow',3),(4,'en','Black',4),(5,'en','White',5),(6,'en','S',6),(7,'en','M',7),(8,'en','L',8),(9,'en','XL',9);
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `attribute_id` int unsigned NOT NULL,
  `swatch_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (1,'Red',1,23,NULL),(2,'Green',2,23,NULL),(3,'Yellow',3,23,NULL),(4,'Black',4,23,NULL),(5,'White',5,23,NULL),(6,'S',1,24,NULL),(7,'M',2,24,NULL),(8,'L',3,24,NULL),(9,'XL',4,24,NULL);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `attribute_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` VALUES (1,'en','SKU',1),(2,'en','Name',2),(3,'en','URL Key',3),(4,'en','Tax Category',4),(5,'en','New',5),(6,'en','Featured',6),(7,'en','Visible Individually',7),(8,'en','Status',8),(9,'en','Short Description',9),(10,'en','Description',10),(11,'en','Price',11),(12,'en','Cost',12),(13,'en','Special Price',13),(14,'en','Special Price From',14),(15,'en','Special Price To',15),(16,'en','Meta Description',16),(17,'en','Meta Keywords',17),(18,'en','Meta Description',18),(19,'en','Width',19),(20,'en','Height',20),(21,'en','Depth',21),(22,'en','Weight',22),(23,'en','Color',23),(24,'en','Size',24),(25,'en','Brand',25),(26,'en','Allow Guest Checkout',26),(27,'en','Product Number',27);
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `swatch_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_in_flat` tinyint(1) NOT NULL DEFAULT '1',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'sku','SKU','text',NULL,1,1,1,0,0,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(2,'name','Name','text',NULL,3,1,0,1,1,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,1,0),(3,'url_key','URL Key','text',NULL,4,1,1,0,0,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(4,'tax_category_id','Tax Category','select',NULL,5,0,0,0,1,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(5,'new','New','boolean',NULL,6,0,0,0,0,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(6,'featured','Featured','boolean',NULL,7,0,0,0,0,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(7,'visible_individually','Visible Individually','boolean',NULL,9,1,0,0,0,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(8,'status','Status','boolean',NULL,10,1,0,0,0,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(9,'short_description','Short Description','textarea',NULL,11,1,0,1,1,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(10,'description','Description','textarea',NULL,12,1,0,1,1,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,1,0),(11,'price','Price','price','decimal',13,1,0,0,0,1,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,1,0),(12,'cost','Cost','price','decimal',14,0,0,0,1,0,0,1,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(13,'special_price','Special Price','price','decimal',15,0,0,0,0,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(14,'special_price_from','Special Price From','date',NULL,16,0,0,0,1,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(15,'special_price_to','Special Price To','date',NULL,17,0,0,0,1,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(16,'meta_title','Meta Title','textarea',NULL,18,0,0,1,1,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(17,'meta_keywords','Meta Keywords','textarea',NULL,20,0,0,1,1,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(18,'meta_description','Meta Description','textarea',NULL,21,0,0,1,1,0,0,1,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(19,'length','Length','text','decimal',22,0,0,0,0,0,0,1,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(20,'width','Width','text','decimal',23,0,0,0,0,0,0,1,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(21,'height','Height','text','decimal',24,0,0,0,0,0,0,1,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(22,'weight','Weight','text','decimal',25,1,0,0,0,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(23,'color','Color','select',NULL,26,0,0,0,0,1,1,1,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(24,'size','Size','select',NULL,27,0,0,0,0,1,1,1,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(25,'brand','Brand','select',NULL,28,0,0,0,0,1,0,1,1,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(26,'guest_checkout','Guest Checkout','boolean',NULL,8,1,0,0,0,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0),(27,'product_number','Product Number','text',NULL,2,0,1,0,0,0,0,0,0,'2024-02-01 11:42:45','2024-02-01 11:42:45',NULL,1,0,0);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_appointment_slots`
--

DROP TABLE IF EXISTS `booking_product_appointment_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_appointment_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_appointment_slots`
--

LOCK TABLES `booking_product_appointment_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_appointment_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_appointment_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_default_slots`
--

DROP TABLE IF EXISTS `booking_product_default_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_default_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `booking_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_default_slots`
--

LOCK TABLES `booking_product_default_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_default_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_default_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_event_ticket_translations`
--

DROP TABLE IF EXISTS `booking_product_event_ticket_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_event_ticket_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `booking_product_event_ticket_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_product_event_ticket_translations_locale_unique` (`booking_product_event_ticket_id`,`locale`),
  CONSTRAINT `booking_product_event_ticket_translations_locale_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_event_ticket_translations`
--

LOCK TABLES `booking_product_event_ticket_translations` WRITE;
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_event_tickets`
--

DROP TABLE IF EXISTS `booking_product_event_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_event_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int DEFAULT '0',
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_event_tickets`
--

LOCK TABLES `booking_product_event_tickets` WRITE;
/*!40000 ALTER TABLE `booking_product_event_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_rental_slots`
--

DROP TABLE IF EXISTS `booking_product_rental_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_rental_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `renting_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_rental_slots`
--

LOCK TABLES `booking_product_rental_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_rental_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_rental_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_table_slots`
--

DROP TABLE IF EXISTS `booking_product_table_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_table_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int NOT NULL DEFAULT '0',
  `duration` int NOT NULL,
  `break_time` int NOT NULL,
  `prevent_scheduling_before` int NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_table_slots`
--

LOCK TABLES `booking_product_table_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_table_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_table_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_products`
--

DROP TABLE IF EXISTS `booking_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int DEFAULT '0',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_products_product_id_foreign` (`product_id`),
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_products`
--

LOCK TABLES `booking_products` WRITE;
/*!40000 ALTER TABLE `booking_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int DEFAULT '0',
  `from` int DEFAULT NULL,
  `to` int DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `booking_product_event_ticket_id` int unsigned DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_order_id_foreign` (`order_id`),
  KEY `bookings_product_id_foreign` (`product_id`),
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `conversion_time` datetime DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2,'yahyaammar4807@gmail.com','Yahya','Ammar',NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',89.0000,89.0000,89.0000,89.0000,0.0000,0.0000,0.0000,0.0000,NULL,0,1,NULL,2,1,'2024-02-19 01:18:31','2024-02-19 01:18:35','');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item_inventories`
--

DROP TABLE IF EXISTS `cart_item_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned DEFAULT NULL,
  `cart_item_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item_inventories`
--

LOCK TABLES `cart_item_inventories` WRITE;
/*!40000 ALTER TABLE `cart_item_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `additional` json DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (2,1,'900','simple','testtestste',NULL,1.0000,1.0000,1.0000,89.0000,89.0000,89.0000,89.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'{\"_token\": \"BBEiUqSIx3J7fpZdHDTi9VPwhEGwNxCh1qpokGMM\", \"quantity\": 1, \"product_id\": \"10\"}',NULL,10,2,NULL,'2024-02-19 01:18:31','2024-02-19 01:18:35',NULL,'');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_payment`
--

DROP TABLE IF EXISTS `cart_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_payment`
--

LOCK TABLES `cart_payment` WRITE;
/*!40000 ALTER TABLE `cart_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_channels`
--

DROP TABLE IF EXISTS `cart_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_channels`
--

LOCK TABLES `cart_rule_channels` WRITE;
/*!40000 ALTER TABLE `cart_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupon_usage`
--

DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_coupon_usage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupon_usage`
--

LOCK TABLES `cart_rule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupons`
--

DROP TABLE IF EXISTS `cart_rule_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int unsigned NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupons`
--

LOCK TABLES `cart_rule_coupons` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customer_groups`
--

DROP TABLE IF EXISTS `cart_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customer_groups`
--

LOCK TABLES `cart_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `cart_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customers`
--

DROP TABLE IF EXISTS `cart_rule_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint unsigned NOT NULL DEFAULT '0',
  `cart_rule_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customers`
--

LOCK TABLES `cart_rule_customers` WRITE;
/*!40000 ALTER TABLE `cart_rule_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_translations`
--

DROP TABLE IF EXISTS `cart_rule_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_translations`
--

LOCK TABLES `cart_rule_translations` WRITE;
/*!40000 ALTER TABLE `cart_rule_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rules`
--

DROP TABLE IF EXISTS `cart_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rules`
--

LOCK TABLES `cart_rules` WRITE;
/*!40000 ALTER TABLE `cart_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_shipping_rates`
--

DROP TABLE IF EXISTS `cart_shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_shipping_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `cart_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_address_id_foreign` (`cart_address_id`),
  CONSTRAINT `cart_shipping_rates_cart_address_id_foreign` FOREIGN KEY (`cart_address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shipping_rates`
--

LOCK TABLES `cart_shipping_rates` WRITE;
/*!40000 ALTER TABLE `cart_shipping_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_channels`
--

DROP TABLE IF EXISTS `catalog_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_channels`
--

LOCK TABLES `catalog_rule_channels` WRITE;
/*!40000 ALTER TABLE `catalog_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_customer_groups`
--

DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_customer_groups`
--

LOCK TABLES `catalog_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_product_prices`
--

DROP TABLE IF EXISTS `catalog_rule_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_product_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_product_prices`
--

LOCK TABLES `catalog_rule_product_prices` WRITE;
/*!40000 ALTER TABLE `catalog_rule_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_products`
--

DROP TABLE IF EXISTS `catalog_rule_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_products`
--

LOCK TABLES `catalog_rule_products` WRITE;
/*!40000 ALTER TABLE `catalog_rule_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rules`
--

DROP TABLE IF EXISTS `catalog_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rules`
--

LOCK TABLES `catalog_rules` WRITE;
/*!40000 ALTER TABLE `catalog_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `_lft` int unsigned NOT NULL DEFAULT '0',
  `_rgt` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_mode` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'products_and_description',
  `category_icon_path` text COLLATE utf8mb4_general_ci,
  `additional` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,1,14,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45','products_and_description',NULL,NULL),(2,1,NULL,1,15,16,NULL,'2024-02-04 18:20:18','2024-02-04 18:20:18','products_and_description',NULL,NULL),(3,1,NULL,1,17,18,NULL,'2024-02-19 01:35:35','2024-02-19 01:35:35','products_only',NULL,NULL),(4,3,NULL,1,19,20,NULL,'2024-02-19 01:36:20','2024-02-19 01:36:20','products_only',NULL,NULL),(5,10,NULL,1,21,22,NULL,'2024-02-19 01:41:25','2024-02-19 01:41:25','products_only',NULL,NULL),(6,12,NULL,1,23,24,NULL,'2024-02-19 01:44:08','2024-02-19 01:44:08','products_only',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `ecom` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER `trig_categories_insert` AFTER INSERT ON `categories` FOR EACH ROW BEGIN
                            DECLARE urlPath VARCHAR(255);
            DECLARE localeCode VARCHAR(255);
            DECLARE done INT;
            DECLARE curs CURSOR FOR (SELECT category_translations.locale
                    FROM category_translations
                    WHERE category_id = NEW.id);
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


            IF EXISTS (
                SELECT *
                FROM category_translations
                WHERE category_id = NEW.id
            )
            THEN

                OPEN curs;

            	SET done = 0;
                REPEAT
                	FETCH curs INTO localeCode;

                    SELECT get_url_path_of_category(NEW.id, localeCode) INTO urlPath;

                    IF NEW.parent_id IS NULL
                    THEN
                        SET urlPath = '';
                    END IF;

                    UPDATE category_translations
                    SET url_path = urlPath
                    WHERE
                        category_translations.category_id = NEW.id
                        AND category_translations.locale = localeCode;

                UNTIL done END REPEAT;

                CLOSE curs;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `ecom` CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci ;
ALTER DATABASE `ecom` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER `trig_categories_update` AFTER UPDATE ON `categories` FOR EACH ROW BEGIN
                            DECLARE urlPath VARCHAR(255);
            DECLARE localeCode VARCHAR(255);
            DECLARE done INT;
            DECLARE curs CURSOR FOR (SELECT category_translations.locale
                    FROM category_translations
                    WHERE category_id = NEW.id);
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


            IF EXISTS (
                SELECT *
                FROM category_translations
                WHERE category_id = NEW.id
            )
            THEN

                OPEN curs;

            	SET done = 0;
                REPEAT
                	FETCH curs INTO localeCode;

                    SELECT get_url_path_of_category(NEW.id, localeCode) INTO urlPath;

                    IF NEW.parent_id IS NULL
                    THEN
                        SET urlPath = '';
                    END IF;

                    UPDATE category_translations
                    SET url_path = urlPath
                    WHERE
                        category_translations.category_id = NEW.id
                        AND category_translations.locale = localeCode;

                UNTIL done END REPEAT;

                CLOSE curs;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `ecom` CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci ;

--
-- Table structure for table `category_filterable_attributes`
--

DROP TABLE IF EXISTS `category_filterable_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_filterable_attributes` (
  `category_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_filterable_attributes`
--

LOCK TABLES `category_filterable_attributes` WRITE;
/*!40000 ALTER TABLE `category_filterable_attributes` DISABLE KEYS */;
INSERT INTO `category_filterable_attributes` VALUES (2,11),(1,11);
/*!40000 ALTER TABLE `category_filterable_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `category_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale_id` int unsigned DEFAULT NULL,
  `url_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'maintained by database triggers',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (6,'Root','root','<p>Root</p>','','','',1,'en',NULL,''),(7,'Raíz','root','Raíz','','','',1,'es',NULL,''),(8,'Racine','root','Racine','','','',1,'fr',NULL,''),(9,'Hoofdcategorie','root','Hoofdcategorie','','','',1,'nl',NULL,''),(10,'Kök','root','Kök','','','',1,'tr',NULL,''),(11,'test','test','<p>this is description</p>','','','',2,'en',1,''),(12,'test','test','<p>this is description</p>','','','',2,'fr',2,''),(13,'test','test','<p>this is description</p>','','','',2,'nl',3,''),(14,'test','test','<p>this is description</p>','','','',2,'tr',4,''),(15,'test','test','<p>this is description</p>','','','',2,'es',5,''),(16,'tsetasdf','tsetasdf','','','','',3,'en',1,''),(17,'tsetasdf','tsetasdf','','','','',3,'fr',2,''),(18,'tsetasdf','tsetasdf','','','','',3,'nl',3,''),(19,'tsetasdf','tsetasdf','','','','',3,'tr',4,''),(20,'tsetasdf','tsetasdf','','','','',3,'es',5,''),(21,'testas','testas','','','','',4,'en',1,''),(22,'testas','testas','','','','',4,'fr',2,''),(23,'testas','testas','','','','',4,'nl',3,''),(24,'testas','testas','','','','',4,'tr',4,''),(25,'testas','testas','','','','',4,'es',5,''),(26,'asdfzxcvc','asdfzxcvc','','','','',5,'en',1,''),(27,'asdfzxcvc','asdfzxcvc','','','','',5,'fr',2,''),(28,'asdfzxcvc','asdfzxcvc','','','','',5,'nl',3,''),(29,'asdfzxcvc','asdfzxcvc','','','','',5,'tr',4,''),(30,'asdfzxcvc','asdfzxcvc','','','','',5,'es',5,''),(31,'testsafds','testsafds','','','','',6,'en',1,''),(32,'testsafds','testsafds','','','','',6,'fr',2,''),(33,'testsafds','testsafds','','','','',6,'nl',3,''),(34,'testsafds','testsafds','','','','',6,'tr',4,''),(35,'testsafds','testsafds','','','','',6,'es',5,'');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `ecom` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER `trig_category_translations_insert` BEFORE INSERT ON `category_translations` FOR EACH ROW BEGIN
                            DECLARE parentUrlPath varchar(255);
            DECLARE urlPath varchar(255);

            IF NOT EXISTS (
                SELECT id
                FROM categories
                WHERE
                    id = NEW.category_id
                    AND parent_id IS NULL
            )
            THEN

                SELECT
                    GROUP_CONCAT(parent_translations.slug SEPARATOR '/') INTO parentUrlPath
                FROM
                    categories AS node,
                    categories AS parent
                    JOIN category_translations AS parent_translations ON parent.id = parent_translations.category_id
                WHERE
                    node._lft >= parent._lft
                    AND node._rgt <= parent._rgt
                    AND node.id = (SELECT parent_id FROM categories WHERE id = NEW.category_id)
                    AND node.parent_id IS NOT NULL
                    AND parent.parent_id IS NOT NULL
                    AND parent_translations.locale = NEW.locale
                GROUP BY
                    node.id;

                IF parentUrlPath IS NULL
                THEN
                    SET urlPath = NEW.slug;
                ELSE
                    SET urlPath = concat(parentUrlPath, '/', NEW.slug);
                END IF;

                SET NEW.url_path = urlPath;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `ecom` CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci ;
ALTER DATABASE `ecom` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER `trig_category_translations_update` BEFORE UPDATE ON `category_translations` FOR EACH ROW BEGIN
                            DECLARE parentUrlPath varchar(255);
            DECLARE urlPath varchar(255);

            IF NOT EXISTS (
                SELECT id
                FROM categories
                WHERE
                    id = NEW.category_id
                    AND parent_id IS NULL
            )
            THEN

                SELECT
                    GROUP_CONCAT(parent_translations.slug SEPARATOR '/') INTO parentUrlPath
                FROM
                    categories AS node,
                    categories AS parent
                    JOIN category_translations AS parent_translations ON parent.id = parent_translations.category_id
                WHERE
                    node._lft >= parent._lft
                    AND node._rgt <= parent._rgt
                    AND node.id = (SELECT parent_id FROM categories WHERE id = NEW.category_id)
                    AND node.parent_id IS NOT NULL
                    AND parent.parent_id IS NOT NULL
                    AND parent_translations.locale = NEW.locale
                GROUP BY
                    node.id;

                IF parentUrlPath IS NULL
                THEN
                    SET urlPath = NEW.slug;
                ELSE
                    SET urlPath = concat(parentUrlPath, '/', NEW.slug);
                END IF;

                SET NEW.url_path = urlPath;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `ecom` CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci ;

--
-- Table structure for table `channel_currencies`
--

DROP TABLE IF EXISTS `channel_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_currencies` (
  `channel_id` int unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_currencies`
--

LOCK TABLES `channel_currencies` WRITE;
/*!40000 ALTER TABLE `channel_currencies` DISABLE KEYS */;
INSERT INTO `channel_currencies` VALUES (1,1);
/*!40000 ALTER TABLE `channel_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_inventory_sources`
--

DROP TABLE IF EXISTS `channel_inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_inventory_sources` (
  `channel_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_inventory_sources`
--

LOCK TABLES `channel_inventory_sources` WRITE;
/*!40000 ALTER TABLE `channel_inventory_sources` DISABLE KEYS */;
INSERT INTO `channel_inventory_sources` VALUES (1,1);
/*!40000 ALTER TABLE `channel_inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_locales`
--

DROP TABLE IF EXISTS `channel_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_locales` (
  `channel_id` int unsigned NOT NULL,
  `locale_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_locales`
--

LOCK TABLES `channel_locales` WRITE;
/*!40000 ALTER TABLE `channel_locales` DISABLE KEYS */;
INSERT INTO `channel_locales` VALUES (1,1);
/*!40000 ALTER TABLE `channel_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_translations`
--

DROP TABLE IF EXISTS `channel_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `home_page_content` text COLLATE utf8mb4_unicode_ci,
  `footer_content` text COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_translations`
--

LOCK TABLES `channel_translations` WRITE;
/*!40000 ALTER TABLE `channel_translations` DISABLE KEYS */;
INSERT INTO `channel_translations` VALUES (1,1,'en','Default','','<p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\r\n<div class=\"banner-container\">\r\n<div class=\"left-banner\"><img src=\"http://localhost/themes/default/assets/images/1.webp\" data-src=\"http://localhost/themes/default/assets/images/1.webp\" class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" /></div>\r\n<div class=\"right-banner\"><img src=\"http://localhost/themes/default/assets/images/2.webp\" data-src=\"http://localhost/themes/default/assets/images/2.webp\" class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" /> <img src=\"http://localhost/themes/default/assets/images/3.webp\" data-src=\"http://localhost/themes/default/assets/images/3.webp\" class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" /></div>\r\n</div>','<div class=\"list-container\"><span class=\"list-heading\">Quick Links</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"http://localhost/page/about-us\">About Us</a></li>\r\n<li><a href=\"http://localhost/page/return-policy\">Return Policy</a></li>\r\n<li><a href=\"http://localhost/page/refund-policy\">Refund Policy</a></li>\r\n<li><a href=\"http://localhost/page/terms-conditions\">Terms and conditions</a></li>\r\n<li><a href=\"http://localhost/page/terms-of-use\">Terms of Use</a></li>\r\n<li><a href=\"http://localhost/page/contact-us\">Contact Us</a></li>\r\n</ul>\r\n</div>\r\n<div class=\"list-container\"><span class=\"list-heading\">Connect With Us x</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\r\n</ul>\r\n</div>','','{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}',NULL,'2024-02-19 01:05:41'),(2,1,'fr','Default',NULL,'\n                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\n                        <div class=\"banner-container\">\n                        <div class=\"left-banner\">\n                            <img src=http://localhost/themes/default/assets/images/1.webp data-src=http://localhost/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\n                        </div>\n                        <div class=\"right-banner\">\n                            <img src=http://localhost/themes/default/assets/images/2.webp data-src=http://localhost/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                            <img src=http://localhost/themes/default/assets/images/3.webp data-src=http://localhost/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                        </div>\n                    </div>\n                ','\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Quick Links</span>\n                        <ul class=\"list-group\">\n                            <li><a href=\"http://localhost/page/about-us\">About Us</a></li>\n                            <li><a href=\"http://localhost/page/return-policy\">Return Policy</a></li>\n                            <li><a href=\"http://localhost/page/refund-policy\">Refund Policy</a></li>\n                            <li><a href=\"http://localhost/page/terms-conditions\">Terms and conditions</a></li>\n                            <li><a href=\"http://localhost/page/terms-of-use\">Terms of Use</a></li>\n                            <li><a href=\"http://localhost/page/contact-us\">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Connect With Us</span>\n                            <ul class=\"list-group\">\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ',NULL,'{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}',NULL,NULL),(3,1,'nl','Default',NULL,'\n                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\n                        <div class=\"banner-container\">\n                        <div class=\"left-banner\">\n                            <img src=http://localhost/themes/default/assets/images/1.webp data-src=http://localhost/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\n                        </div>\n                        <div class=\"right-banner\">\n                            <img src=http://localhost/themes/default/assets/images/2.webp data-src=http://localhost/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                            <img src=http://localhost/themes/default/assets/images/3.webp data-src=http://localhost/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                        </div>\n                    </div>\n                ','\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Quick Links</span>\n                        <ul class=\"list-group\">\n                            <li><a href=\"http://localhost/page/about-us\">About Us</a></li>\n                            <li><a href=\"http://localhost/page/return-policy\">Return Policy</a></li>\n                            <li><a href=\"http://localhost/page/refund-policy\">Refund Policy</a></li>\n                            <li><a href=\"http://localhost/page/terms-conditions\">Terms and conditions</a></li>\n                            <li><a href=\"http://localhost/page/terms-of-use\">Terms of Use</a></li>\n                            <li><a href=\"http://localhost/page/contact-us\">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Connect With Us</span>\n                            <ul class=\"list-group\">\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ',NULL,'{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}',NULL,NULL),(4,1,'tr','Default',NULL,'\n                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\n                        <div class=\"banner-container\">\n                        <div class=\"left-banner\">\n                            <img src=http://localhost/themes/default/assets/images/1.webp data-src=http://localhost/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\n                        </div>\n                        <div class=\"right-banner\">\n                            <img src=http://localhost/themes/default/assets/images/2.webp data-src=http://localhost/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                            <img src=http://localhost/themes/default/assets/images/3.webp data-src=http://localhost/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                        </div>\n                    </div>\n                ','\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Quick Links</span>\n                        <ul class=\"list-group\">\n                            <li><a href=\"http://localhost/page/about-us\">About Us</a></li>\n                            <li><a href=\"http://localhost/page/return-policy\">Return Policy</a></li>\n                            <li><a href=\"http://localhost/page/refund-policy\">Refund Policy</a></li>\n                            <li><a href=\"http://localhost/page/terms-conditions\">Terms and conditions</a></li>\n                            <li><a href=\"http://localhost/page/terms-of-use\">Terms of Use</a></li>\n                            <li><a href=\"http://localhost/page/contact-us\">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Connect With Us</span>\n                            <ul class=\"list-group\">\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ',NULL,'{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}',NULL,NULL),(5,1,'es','Default',NULL,'\n                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\n                        <div class=\"banner-container\">\n                        <div class=\"left-banner\">\n                            <img src=http://localhost/themes/default/assets/images/1.webp data-src=http://localhost/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\n                        </div>\n                        <div class=\"right-banner\">\n                            <img src=http://localhost/themes/default/assets/images/2.webp data-src=http://localhost/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                            <img src=http://localhost/themes/default/assets/images/3.webp data-src=http://localhost/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                        </div>\n                    </div>\n                ','\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Quick Links</span>\n                        <ul class=\"list-group\">\n                            <li><a href=\"http://localhost/page/about-us\">About Us</a></li>\n                            <li><a href=\"http://localhost/page/return-policy\">Return Policy</a></li>\n                            <li><a href=\"http://localhost/page/refund-policy\">Refund Policy</a></li>\n                            <li><a href=\"http://localhost/page/terms-conditions\">Terms and conditions</a></li>\n                            <li><a href=\"http://localhost/page/terms-of-use\">Terms of Use</a></li>\n                            <li><a href=\"http://localhost/page/contact-us\">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Connect With Us</span>\n                            <ul class=\"list-group\">\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ',NULL,'{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}',NULL,NULL);
/*!40000 ALTER TABLE `channel_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text COLLATE utf8mb4_unicode_ci,
  `default_locale_id` int unsigned NOT NULL,
  `base_currency_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `root_category_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'default',NULL,'velocity','http://localhost',NULL,NULL,0,'',1,1,NULL,'2024-02-19 01:05:41',1);
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_channels`
--

DROP TABLE IF EXISTS `cms_page_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_channels` (
  `cms_page_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_channels`
--

LOCK TABLES `cms_page_channels` WRITE;
/*!40000 ALTER TABLE `cms_page_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_page_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_translations`
--

DROP TABLE IF EXISTS `cms_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_translations`
--

LOCK TABLES `cms_page_translations` WRITE;
/*!40000 ALTER TABLE `cms_page_translations` DISABLE KEYS */;
INSERT INTO `cms_page_translations` VALUES (12,'About Us','about-us','<div class=\"static-container\"><div class=\"mb-5\">About us page content</div></div>','about us','','aboutus','en',1),(13,'Return Policy','return-policy','<div class=\"static-container\"><div class=\"mb-5\">Return policy page content</div></div>','return policy','','return, policy','en',2),(14,'Refund Policy','refund-policy','<div class=\"static-container\"><div class=\"mb-5\">Refund policy page content</div></div>','Refund policy','','refund, policy','en',3),(15,'Terms & Conditions','terms-conditions','<div class=\"static-container\"><div class=\"mb-5\">Terms & conditions page content</div></div>','Terms & Conditions','','term, conditions','en',4),(16,'Terms of use','terms-of-use','<div class=\"static-container\"><div class=\"mb-5\">Terms of use page content</div></div>','Terms of use','','term, use','en',5),(17,'Contact Us','contact-us','<div class=\"static-container\"><div class=\"mb-5\">Contact us page content</div></div>','Contact Us','','contact, us','en',6),(18,'Customer Service','cutomer-service','<div class=\"static-container\"><div class=\"mb-5\">Customer service  page content</div></div>','Customer Service','','customer, service','en',7),(19,'What\'s New','whats-new','<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>','What\'s New','','new','en',8),(20,'Payment Policy','payment-policy','<div class=\"static-container\"><div class=\"mb-5\">Payment Policy page content</div></div>','Payment Policy','','payment, policy','en',9),(21,'Shipping Policy','shipping-policy','<div class=\"static-container\"><div class=\"mb-5\">Shipping Policy  page content</div></div>','Shipping Policy','','shipping, policy','en',10),(22,'Privacy Policy','privacy-policy','<div class=\"static-container\"><div class=\"mb-5\">Privacy Policy  page content</div></div>','Privacy Policy','','privacy, policy','en',11);
/*!40000 ALTER TABLE `cms_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages`
--

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
INSERT INTO `cms_pages` VALUES (1,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(2,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(3,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(4,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(5,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(6,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(7,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(8,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(9,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(10,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(11,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45');
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config`
--

DROP TABLE IF EXISTS `core_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_config_channel_id_foreign` (`channel_code`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config`
--

LOCK TABLES `core_config` WRITE;
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` VALUES (1,'catalog.products.guest-checkout.allow-guest-checkout','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(2,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(3,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(4,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(5,'emails.general.notifications.emails.general.notifications.new-order','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(6,'emails.general.notifications.emails.general.notifications.new-admin','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(7,'emails.general.notifications.emails.general.notifications.new-invoice','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(8,'emails.general.notifications.emails.general.notifications.new-refund','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(9,'emails.general.notifications.emails.general.notifications.new-shipment','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(10,'emails.general.notifications.emails.general.notifications.new-inventory-source','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(11,'emails.general.notifications.emails.general.notifications.cancel-order','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(12,'catalog.products.homepage.out_of_stock_items','1',NULL,NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(54,'customer.settings.social_login.enable_facebook','1','default',NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(55,'customer.settings.social_login.enable_twitter','1','default',NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(56,'customer.settings.social_login.enable_google','1','default',NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(57,'customer.settings.social_login.enable_linkedin','1','default',NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(58,'customer.settings.social_login.enable_github','1','default',NULL,'2024-02-01 11:42:45','2024-02-01 11:42:45'),(59,'general.content.shop.compare_option','1','default','en','2024-02-01 11:42:45','2024-02-01 11:42:45'),(60,'general.content.shop.compare_option','1','default','fr','2024-02-01 11:42:45','2024-02-01 11:42:45'),(61,'general.content.shop.compare_option','1','default','ar','2024-02-01 11:42:45','2024-02-01 11:42:45'),(62,'general.content.shop.compare_option','1','default','de','2024-02-01 11:42:45','2024-02-01 11:42:45'),(63,'general.content.shop.compare_option','1','default','es','2024-02-01 11:42:45','2024-02-01 11:42:45'),(64,'general.content.shop.compare_option','1','default','fa','2024-02-01 11:42:45','2024-02-01 11:42:45'),(65,'general.content.shop.compare_option','1','default','it','2024-02-01 11:42:45','2024-02-01 11:42:45'),(66,'general.content.shop.compare_option','1','default','ja','2024-02-01 11:42:45','2024-02-01 11:42:45'),(67,'general.content.shop.compare_option','1','default','nl','2024-02-01 11:42:45','2024-02-01 11:42:45'),(68,'general.content.shop.compare_option','1','default','pl','2024-02-01 11:42:45','2024-02-01 11:42:45'),(69,'general.content.shop.compare_option','1','default','pt_BR','2024-02-01 11:42:45','2024-02-01 11:42:45'),(70,'general.content.shop.compare_option','1','default','tr','2024-02-01 11:42:45','2024-02-01 11:42:45'),(71,'general.content.shop.wishlist_option','1','default','en','2024-02-01 11:42:45','2024-02-01 11:42:45'),(72,'general.content.shop.wishlist_option','1','default','fr','2024-02-01 11:42:45','2024-02-01 11:42:45'),(73,'general.content.shop.wishlist_option','1','default','ar','2024-02-01 11:42:45','2024-02-01 11:42:45'),(74,'general.content.shop.wishlist_option','1','default','de','2024-02-01 11:42:45','2024-02-01 11:42:45'),(75,'general.content.shop.wishlist_option','1','default','es','2024-02-01 11:42:45','2024-02-01 11:42:45'),(76,'general.content.shop.wishlist_option','1','default','fa','2024-02-01 11:42:45','2024-02-01 11:42:45'),(77,'general.content.shop.wishlist_option','1','default','it','2024-02-01 11:42:45','2024-02-01 11:42:45'),(78,'general.content.shop.wishlist_option','1','default','ja','2024-02-01 11:42:45','2024-02-01 11:42:45'),(79,'general.content.shop.wishlist_option','1','default','nl','2024-02-01 11:42:45','2024-02-01 11:42:45'),(80,'general.content.shop.wishlist_option','1','default','pl','2024-02-01 11:42:45','2024-02-01 11:42:45'),(81,'general.content.shop.wishlist_option','1','default','pt_BR','2024-02-01 11:42:45','2024-02-01 11:42:45'),(82,'general.content.shop.wishlist_option','1','default','tr','2024-02-01 11:42:45','2024-02-01 11:42:45'),(83,'general.content.shop.image_search','1','default','en','2024-02-01 11:42:45','2024-02-01 11:42:45'),(84,'general.content.shop.image_search','1','default','fr','2024-02-01 11:42:45','2024-02-01 11:42:45'),(85,'general.content.shop.image_search','1','default','ar','2024-02-01 11:42:45','2024-02-01 11:42:45'),(86,'general.content.shop.image_search','1','default','de','2024-02-01 11:42:45','2024-02-01 11:42:45'),(87,'general.content.shop.image_search','1','default','es','2024-02-01 11:42:45','2024-02-01 11:42:45'),(88,'general.content.shop.image_search','1','default','fa','2024-02-01 11:42:45','2024-02-01 11:42:45'),(89,'general.content.shop.image_search','1','default','it','2024-02-01 11:42:45','2024-02-01 11:42:45'),(90,'general.content.shop.image_search','1','default','ja','2024-02-01 11:42:45','2024-02-01 11:42:45'),(91,'general.content.shop.image_search','1','default','nl','2024-02-01 11:42:45','2024-02-01 11:42:45'),(92,'general.content.shop.image_search','1','default','pl','2024-02-01 11:42:45','2024-02-01 11:42:45'),(93,'general.content.shop.image_search','1','default','pt_BR','2024-02-01 11:42:45','2024-02-01 11:42:45'),(94,'general.content.shop.image_search','1','default','tr','2024-02-01 11:42:45','2024-02-01 11:42:45');
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan'),(2,'AX','Åland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua & Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AC','Ascension Island'),(15,'AU','Australia'),(16,'AT','Austria'),(17,'AZ','Azerbaijan'),(18,'BS','Bahamas'),(19,'BH','Bahrain'),(20,'BD','Bangladesh'),(21,'BB','Barbados'),(22,'BY','Belarus'),(23,'BE','Belgium'),(24,'BZ','Belize'),(25,'BJ','Benin'),(26,'BM','Bermuda'),(27,'BT','Bhutan'),(28,'BO','Bolivia'),(29,'BA','Bosnia & Herzegovina'),(30,'BW','Botswana'),(31,'BR','Brazil'),(32,'IO','British Indian Ocean Territory'),(33,'VG','British Virgin Islands'),(34,'BN','Brunei'),(35,'BG','Bulgaria'),(36,'BF','Burkina Faso'),(37,'BI','Burundi'),(38,'KH','Cambodia'),(39,'CM','Cameroon'),(40,'CA','Canada'),(41,'IC','Canary Islands'),(42,'CV','Cape Verde'),(43,'BQ','Caribbean Netherlands'),(44,'KY','Cayman Islands'),(45,'CF','Central African Republic'),(46,'EA','Ceuta & Melilla'),(47,'TD','Chad'),(48,'CL','Chile'),(49,'CN','China'),(50,'CX','Christmas Island'),(51,'CC','Cocos (Keeling) Islands'),(52,'CO','Colombia'),(53,'KM','Comoros'),(54,'CG','Congo - Brazzaville'),(55,'CD','Congo - Kinshasa'),(56,'CK','Cook Islands'),(57,'CR','Costa Rica'),(58,'CI','Côte d’Ivoire'),(59,'HR','Croatia'),(60,'CU','Cuba'),(61,'CW','Curaçao'),(62,'CY','Cyprus'),(63,'CZ','Czechia'),(64,'DK','Denmark'),(65,'DG','Diego Garcia'),(66,'DJ','Djibouti'),(67,'DM','Dominica'),(68,'DO','Dominican Republic'),(69,'EC','Ecuador'),(70,'EG','Egypt'),(71,'SV','El Salvador'),(72,'GQ','Equatorial Guinea'),(73,'ER','Eritrea'),(74,'EE','Estonia'),(75,'ET','Ethiopia'),(76,'EZ','Eurozone'),(77,'FK','Falkland Islands'),(78,'FO','Faroe Islands'),(79,'FJ','Fiji'),(80,'FI','Finland'),(81,'FR','France'),(82,'GF','French Guiana'),(83,'PF','French Polynesia'),(84,'TF','French Southern Territories'),(85,'GA','Gabon'),(86,'GM','Gambia'),(87,'GE','Georgia'),(88,'DE','Germany'),(89,'GH','Ghana'),(90,'GI','Gibraltar'),(91,'GR','Greece'),(92,'GL','Greenland'),(93,'GD','Grenada'),(94,'GP','Guadeloupe'),(95,'GU','Guam'),(96,'GT','Guatemala'),(97,'GG','Guernsey'),(98,'GN','Guinea'),(99,'GW','Guinea-Bissau'),(100,'GY','Guyana'),(101,'HT','Haiti'),(102,'HN','Honduras'),(103,'HK','Hong Kong SAR China'),(104,'HU','Hungary'),(105,'IS','Iceland'),(106,'IN','India'),(107,'ID','Indonesia'),(108,'IR','Iran'),(109,'IQ','Iraq'),(110,'IE','Ireland'),(111,'IM','Isle of Man'),(112,'IL','Israel'),(113,'IT','Italy'),(114,'JM','Jamaica'),(115,'JP','Japan'),(116,'JE','Jersey'),(117,'JO','Jordan'),(118,'KZ','Kazakhstan'),(119,'KE','Kenya'),(120,'KI','Kiribati'),(121,'XK','Kosovo'),(122,'KW','Kuwait'),(123,'KG','Kyrgyzstan'),(124,'LA','Laos'),(125,'LV','Latvia'),(126,'LB','Lebanon'),(127,'LS','Lesotho'),(128,'LR','Liberia'),(129,'LY','Libya'),(130,'LI','Liechtenstein'),(131,'LT','Lithuania'),(132,'LU','Luxembourg'),(133,'MO','Macau SAR China'),(134,'MK','Macedonia'),(135,'MG','Madagascar'),(136,'MW','Malawi'),(137,'MY','Malaysia'),(138,'MV','Maldives'),(139,'ML','Mali'),(140,'MT','Malta'),(141,'MH','Marshall Islands'),(142,'MQ','Martinique'),(143,'MR','Mauritania'),(144,'MU','Mauritius'),(145,'YT','Mayotte'),(146,'MX','Mexico'),(147,'FM','Micronesia'),(148,'MD','Moldova'),(149,'MC','Monaco'),(150,'MN','Mongolia'),(151,'ME','Montenegro'),(152,'MS','Montserrat'),(153,'MA','Morocco'),(154,'MZ','Mozambique'),(155,'MM','Myanmar (Burma)'),(156,'NA','Namibia'),(157,'NR','Nauru'),(158,'NP','Nepal'),(159,'NL','Netherlands'),(160,'NC','New Caledonia'),(161,'NZ','New Zealand'),(162,'NI','Nicaragua'),(163,'NE','Niger'),(164,'NG','Nigeria'),(165,'NU','Niue'),(166,'NF','Norfolk Island'),(167,'KP','North Korea'),(168,'MP','Northern Mariana Islands'),(169,'NO','Norway'),(170,'OM','Oman'),(171,'PK','Pakistan'),(172,'PW','Palau'),(173,'PS','Palestinian Territories'),(174,'PA','Panama'),(175,'PG','Papua New Guinea'),(176,'PY','Paraguay'),(177,'PE','Peru'),(178,'PH','Philippines'),(179,'PN','Pitcairn Islands'),(180,'PL','Poland'),(181,'PT','Portugal'),(182,'PR','Puerto Rico'),(183,'QA','Qatar'),(184,'RE','Réunion'),(185,'RO','Romania'),(186,'RU','Russia'),(187,'RW','Rwanda'),(188,'WS','Samoa'),(189,'SM','San Marino'),(190,'ST','São Tomé & Príncipe'),(191,'SA','Saudi Arabia'),(192,'SN','Senegal'),(193,'RS','Serbia'),(194,'SC','Seychelles'),(195,'SL','Sierra Leone'),(196,'SG','Singapore'),(197,'SX','Sint Maarten'),(198,'SK','Slovakia'),(199,'SI','Slovenia'),(200,'SB','Solomon Islands'),(201,'SO','Somalia'),(202,'ZA','South Africa'),(203,'GS','South Georgia & South Sandwich Islands'),(204,'KR','South Korea'),(205,'SS','South Sudan'),(206,'ES','Spain'),(207,'LK','Sri Lanka'),(208,'BL','St. Barthélemy'),(209,'SH','St. Helena'),(210,'KN','St. Kitts & Nevis'),(211,'LC','St. Lucia'),(212,'MF','St. Martin'),(213,'PM','St. Pierre & Miquelon'),(214,'VC','St. Vincent & Grenadines'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard & Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TL','Timor-Leste'),(227,'TG','Togo'),(228,'TK','Tokelau'),(229,'TO','Tonga'),(230,'TT','Trinidad & Tobago'),(231,'TA','Tristan da Cunha'),(232,'TN','Tunisia'),(233,'TR','Turkey'),(234,'TM','Turkmenistan'),(235,'TC','Turks & Caicos Islands'),(236,'TV','Tuvalu'),(237,'UM','U.S. Outlying Islands'),(238,'VI','U.S. Virgin Islands'),(239,'UG','Uganda'),(240,'UA','Ukraine'),(241,'AE','United Arab Emirates'),(242,'GB','United Kingdom'),(243,'UN','United Nations'),(244,'US','United States'),(245,'UY','Uruguay'),(246,'UZ','Uzbekistan'),(247,'VU','Vanuatu'),(248,'VA','Vatican City'),(249,'VE','Venezuela'),(250,'VN','Vietnam'),(251,'WF','Wallis & Futuna'),(252,'EH','Western Sahara'),(253,'YE','Yemen'),(254,'ZM','Zambia'),(255,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state_translations`
--

DROP TABLE IF EXISTS `country_state_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_state_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci,
  `country_state_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4581 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state_translations`
--

LOCK TABLES `country_state_translations` WRITE;
/*!40000 ALTER TABLE `country_state_translations` DISABLE KEYS */;
INSERT INTO `country_state_translations` VALUES (2291,'ar','ألاباما',1),(2292,'ar','ألاسكا',2),(2293,'ar','ساموا الأمريكية',3),(2294,'ar','أريزونا',4),(2295,'ar','أركنساس',5),(2296,'ar','القوات المسلحة أفريقيا',6),(2297,'ar','القوات المسلحة الأمريكية',7),(2298,'ar','القوات المسلحة الكندية',8),(2299,'ar','القوات المسلحة أوروبا',9),(2300,'ar','القوات المسلحة الشرق الأوسط',10),(2301,'ar','القوات المسلحة في المحيط الهادئ',11),(2302,'ar','كاليفورنيا',12),(2303,'ar','كولورادو',13),(2304,'ar','كونيتيكت',14),(2305,'ar','ديلاوير',15),(2306,'ar','مقاطعة كولومبيا',16),(2307,'ar','ولايات ميكرونيزيا الموحدة',17),(2308,'ar','فلوريدا',18),(2309,'ar','جورجيا',19),(2310,'ar','غوام',20),(2311,'ar','هاواي',21),(2312,'ar','ايداهو',22),(2313,'ar','إلينوي',23),(2314,'ar','إنديانا',24),(2315,'ar','أيوا',25),(2316,'ar','كانساس',26),(2317,'ar','كنتاكي',27),(2318,'ar','لويزيانا',28),(2319,'ar','مين',29),(2320,'ar','جزر مارشال',30),(2321,'ar','ماريلاند',31),(2322,'ar','ماساتشوستس',32),(2323,'ar','ميشيغان',33),(2324,'ar','مينيسوتا',34),(2325,'ar','ميسيسيبي',35),(2326,'ar','ميسوري',36),(2327,'ar','مونتانا',37),(2328,'ar','نبراسكا',38),(2329,'ar','نيفادا',39),(2330,'ar','نيو هامبشاير',40),(2331,'ar','نيو جيرسي',41),(2332,'ar','المكسيك جديدة',42),(2333,'ar','نيويورك',43),(2334,'ar','شمال كارولينا',44),(2335,'ar','شمال داكوتا',45),(2336,'ar','جزر مريانا الشمالية',46),(2337,'ar','أوهايو',47),(2338,'ar','أوكلاهوما',48),(2339,'ar','ولاية أوريغون',49),(2340,'ar','بالاو',50),(2341,'ar','بنسلفانيا',51),(2342,'ar','بورتوريكو',52),(2343,'ar','جزيرة رود',53),(2344,'ar','كارولينا الجنوبية',54),(2345,'ar','جنوب داكوتا',55),(2346,'ar','تينيسي',56),(2347,'ar','تكساس',57),(2348,'ar','يوتا',58),(2349,'ar','فيرمونت',59),(2350,'ar','جزر فيرجن',60),(2351,'ar','فرجينيا',61),(2352,'ar','واشنطن',62),(2353,'ar','فرجينيا الغربية',63),(2354,'ar','ولاية ويسكونسن',64),(2355,'ar','وايومنغ',65),(2356,'ar','ألبرتا',66),(2357,'ar','كولومبيا البريطانية',67),(2358,'ar','مانيتوبا',68),(2359,'ar','نيوفاوندلاند ولابرادور',69),(2360,'ar','برونزيك جديد',70),(2361,'ar','مقاطعة نفوفا سكوشيا',71),(2362,'ar','الاقاليم الشمالية الغربية',72),(2363,'ar','نونافوت',73),(2364,'ar','أونتاريو',74),(2365,'ar','جزيرة الأمير ادوارد',75),(2366,'ar','كيبيك',76),(2367,'ar','ساسكاتشوان',77),(2368,'ar','إقليم يوكون',78),(2369,'ar','Niedersachsen',79),(2370,'ar','بادن فورتمبيرغ',80),(2371,'ar','بايرن ميونيخ',81),(2372,'ar','برلين',82),(2373,'ar','براندنبورغ',83),(2374,'ar','بريمن',84),(2375,'ar','هامبورغ',85),(2376,'ar','هيسن',86),(2377,'ar','مكلنبورغ-فوربومرن',87),(2378,'ar','نوردراين فيستفالن',88),(2379,'ar','راينلاند-بفالز',89),(2380,'ar','سارلاند',90),(2381,'ar','ساكسن',91),(2382,'ar','سكسونيا أنهالت',92),(2383,'ar','شليسفيغ هولشتاين',93),(2384,'ar','تورنغن',94),(2385,'ar','فيينا',95),(2386,'ar','النمسا السفلى',96),(2387,'ar','النمسا العليا',97),(2388,'ar','سالزبورغ',98),(2389,'ar','Каринтия',99),(2390,'ar','STEIERMARK',100),(2391,'ar','تيرول',101),(2392,'ar','بورغنلاند',102),(2393,'ar','فورارلبرغ',103),(2394,'ar','أرجاو',104),(2395,'ar','Appenzell Innerrhoden',105),(2396,'ar','أبنزل أوسيرهودن',106),(2397,'ar','برن',107),(2398,'ar','كانتون ريف بازل',108),(2399,'ar','بازل شتات',109),(2400,'ar','فرايبورغ',110),(2401,'ar','Genf',111),(2402,'ar','جلاروس',112),(2403,'ar','غراوبوندن',113),(2404,'ar','العصر الجوارسي أو الجوري',114),(2405,'ar','لوزيرن',115),(2406,'ar','في Neuenburg',116),(2407,'ar','نيدوالدن',117),(2408,'ar','أوبوالدن',118),(2409,'ar','سانت غالن',119),(2410,'ar','شافهاوزن',120),(2411,'ar','سولوتورن',121),(2412,'ar','شفيتس',122),(2413,'ar','ثورجو',123),(2414,'ar','تيتشينو',124),(2415,'ar','أوري',125),(2416,'ar','وادت',126),(2417,'ar','اليس',127),(2418,'ar','زوغ',128),(2419,'ar','زيورخ',129),(2420,'ar','Corunha',130),(2421,'ar','ألافا',131),(2422,'ar','الباسيتي',132),(2423,'ar','اليكانتي',133),(2424,'ar','الميريا',134),(2425,'ar','أستورياس',135),(2426,'ar','أفيلا',136),(2427,'ar','بطليوس',137),(2428,'ar','البليار',138),(2429,'ar','برشلونة',139),(2430,'ar','برغش',140),(2431,'ar','كاسيريس',141),(2432,'ar','كاديز',142),(2433,'ar','كانتابريا',143),(2434,'ar','كاستيلون',144),(2435,'ar','سبتة',145),(2436,'ar','سيوداد ريال',146),(2437,'ar','قرطبة',147),(2438,'ar','كوينكا',148),(2439,'ar','جيرونا',149),(2440,'ar','غرناطة',150),(2441,'ar','غوادالاخارا',151),(2442,'ar','بجويبوزكوا',152),(2443,'ar','هويلفا',153),(2444,'ar','هويسكا',154),(2445,'ar','خاين',155),(2446,'ar','لاريوخا',156),(2447,'ar','لاس بالماس',157),(2448,'ar','ليون',158),(2449,'ar','يدا',159),(2450,'ar','لوغو',160),(2451,'ar','مدريد',161),(2452,'ar','ملقة',162),(2453,'ar','مليلية',163),(2454,'ar','مورسيا',164),(2455,'ar','نافارا',165),(2456,'ar','أورينس',166),(2457,'ar','بلنسية',167),(2458,'ar','بونتيفيدرا',168),(2459,'ar','سالامانكا',169),(2460,'ar','سانتا كروز دي تينيريفي',170),(2461,'ar','سيغوفيا',171),(2462,'ar','اشبيلية',172),(2463,'ar','سوريا',173),(2464,'ar','تاراغونا',174),(2465,'ar','تيرويل',175),(2466,'ar','توليدو',176),(2467,'ar','فالنسيا',177),(2468,'ar','بلد الوليد',178),(2469,'ar','فيزكايا',179),(2470,'ar','زامورا',180),(2471,'ar','سرقسطة',181),(2472,'ar','عين',182),(2473,'ar','أيسن',183),(2474,'ar','اليي',184),(2475,'ar','ألب البروفنس العليا',185),(2476,'ar','أوتس ألب',186),(2477,'ar','ألب ماريتيم',187),(2478,'ar','ARDECHE',188),(2479,'ar','Ardennes',189),(2480,'ar','آردن',190),(2481,'ar','أوب',191),(2482,'ar','اود',192),(2483,'ar','أفيرون',193),(2484,'ar','بوكاس دو رون',194),(2485,'ar','كالفادوس',195),(2486,'ar','كانتال',196),(2487,'ar','شارانت',197),(2488,'ar','سيين إت مارن',198),(2489,'ar','شير',199),(2490,'ar','كوريز',200),(2491,'ar','سود كورس-دو-',201),(2492,'ar','هوت كورس',202),(2493,'ar','كوستا دوركوريز',203),(2494,'ar','كوتس دورمور',204),(2495,'ar','كروز',205),(2496,'ar','دوردوني',206),(2497,'ar','دوبس',207),(2498,'ar','DrômeFinistère',208),(2499,'ar','أور',209),(2500,'ar','أور ولوار',210),(2501,'ar','فينيستير',211),(2502,'ar','جارد',212),(2503,'ar','هوت غارون',213),(2504,'ar','الخيام',214),(2505,'ar','جيروند',215),(2506,'ar','هيرولت',216),(2507,'ar','إيل وفيلان',217),(2508,'ar','إندر',218),(2509,'ar','أندر ولوار',219),(2510,'ar','إيسر',220),(2511,'ar','العصر الجوارسي أو الجوري',221),(2512,'ar','اندز',222),(2513,'ar','لوار وشير',223),(2514,'ar','لوار',224),(2515,'ar','هوت-لوار',225),(2516,'ar','وار أتلانتيك',226),(2517,'ar','لورا',227),(2518,'ar','كثيرا',228),(2519,'ar','الكثير غارون',229),(2520,'ar','لوزر',230),(2521,'ar','مين-إي-لوار',231),(2522,'ar','المانش',232),(2523,'ar','مارن',233),(2524,'ar','هوت مارن',234),(2525,'ar','مايين',235),(2526,'ar','مورت وموزيل',236),(2527,'ar','ميوز',237),(2528,'ar','موربيهان',238),(2529,'ar','موسيل',239),(2530,'ar','نيفر',240),(2531,'ar','نورد',241),(2532,'ar','إيل دو فرانس',242),(2533,'ar','أورن',243),(2534,'ar','با-دو-كاليه',244),(2535,'ar','بوي دي دوم',245),(2536,'ar','البرانيس ​​الأطلسية',246),(2537,'ar','أوتس-بيرينيهs',247),(2538,'ar','بيرينيه-أورينتال',248),(2539,'ar','بس رين',249),(2540,'ar','أوت رين',250),(2541,'ar','رون [3]',251),(2542,'ar','هوت-سون',252),(2543,'ar','سون ولوار',253),(2544,'ar','سارت',254),(2545,'ar','سافوا',255),(2546,'ar','هاوت سافوي',256),(2547,'ar','باريس',257),(2548,'ar','سين البحرية',258),(2549,'ar','سيين إت مارن',259),(2550,'ar','إيفلين',260),(2551,'ar','دوكس سفرس',261),(2552,'ar','السوم',262),(2553,'ar','تارن',263),(2554,'ar','تارن وغارون',264),(2555,'ar','فار',265),(2556,'ar','فوكلوز',266),(2557,'ar','تارن',267),(2558,'ar','فيين',268),(2559,'ar','هوت فيين',269),(2560,'ar','الفوج',270),(2561,'ar','يون',271),(2562,'ar','تيريتوير-دي-بلفور',272),(2563,'ar','إيسون',273),(2564,'ar','هوت دو سين',274),(2565,'ar','سين سان دوني',275),(2566,'ar','فال دو مارن',276),(2567,'ar','فال دواز',277),(2568,'ar','ألبا',278),(2569,'ar','اراد',279),(2570,'ar','ARGES',280),(2571,'ar','باكاو',281),(2572,'ar','بيهور',282),(2573,'ar','بيستريتا ناسود',283),(2574,'ar','بوتوساني',284),(2575,'ar','براشوف',285),(2576,'ar','برايلا',286),(2577,'ar','بوخارست',287),(2578,'ar','بوزاو',288),(2579,'ar','كاراس سيفيرين',289),(2580,'ar','كالاراسي',290),(2581,'ar','كلوج',291),(2582,'ar','كونستانتا',292),(2583,'ar','كوفاسنا',293),(2584,'ar','دامبوفيتا',294),(2585,'ar','دولج',295),(2586,'ar','جالاتي',296),(2587,'ar','Giurgiu',297),(2588,'ar','غيورغيو',298),(2589,'ar','هارغيتا',299),(2590,'ar','هونيدوارا',300),(2591,'ar','ايالوميتا',301),(2592,'ar','ياشي',302),(2593,'ar','إيلفوف',303),(2594,'ar','مارامريس',304),(2595,'ar','MEHEDINTI',305),(2596,'ar','موريس',306),(2597,'ar','نيامتس',307),(2598,'ar','أولت',308),(2599,'ar','براهوفا',309),(2600,'ar','ساتو ماري',310),(2601,'ar','سالاج',311),(2602,'ar','سيبيو',312),(2603,'ar','سوسيفا',313),(2604,'ar','تيليورمان',314),(2605,'ar','تيم هو',315),(2606,'ar','تولسيا',316),(2607,'ar','فاسلوي',317),(2608,'ar','فالسيا',318),(2609,'ar','فرانتشا',319),(2610,'ar','Lappi',320),(2611,'ar','Pohjois-Pohjanmaa',321),(2612,'ar','كاينو',322),(2613,'ar','Pohjois-كارجالا',323),(2614,'ar','Pohjois-سافو',324),(2615,'ar','Etelä-سافو',325),(2616,'ar','Etelä-Pohjanmaa',326),(2617,'ar','Pohjanmaa',327),(2618,'ar','بيركنما',328),(2619,'ar','ساتا كونتا',329),(2620,'ar','كسكي-Pohjanmaa',330),(2621,'ar','كسكي-سومي',331),(2622,'ar','Varsinais-سومي',332),(2623,'ar','Etelä-كارجالا',333),(2624,'ar','Päijät-Häme',334),(2625,'ar','كانتا-HAME',335),(2626,'ar','أوسيما',336),(2627,'ar','أوسيما',337),(2628,'ar','كومنلاكسو',338),(2629,'ar','Ahvenanmaa',339),(2630,'ar','Harjumaa',340),(2631,'ar','هيوما',341),(2632,'ar','المؤسسة الدولية للتنمية فيروما',342),(2633,'ar','جوغفما',343),(2634,'ar','يارفا',344),(2635,'ar','انيما',345),(2636,'ar','اني فيريوما',346),(2637,'ar','بولفاما',347),(2638,'ar','بارنوما',348),(2639,'ar','Raplamaa',349),(2640,'ar','Saaremaa',350),(2641,'ar','Tartumaa',351),(2642,'ar','Valgamaa',352),(2643,'ar','Viljandimaa',353),(2644,'ar','روايات Salacgr novvas',354),(2645,'ar','داوجافبيلس',355),(2646,'ar','يلغافا',356),(2647,'ar','يكاب',357),(2648,'ar','يورمال',358),(2649,'ar','يابايا',359),(2650,'ar','ليباج أبريس',360),(2651,'ar','ريزكن',361),(2652,'ar','ريغا',362),(2653,'ar','مقاطعة ريغا',363),(2654,'ar','فالميرا',364),(2655,'ar','فنتسبيلز',365),(2656,'ar','روايات Aglonas',366),(2657,'ar','Aizkraukles novads',367),(2658,'ar','Aizkraukles novads',368),(2659,'ar','Aknīstes novads',369),(2660,'ar','Alojas novads',370),(2661,'ar','روايات Alsungas',371),(2662,'ar','ألكسنس أبريز',372),(2663,'ar','روايات أماتاس',373),(2664,'ar','قرود الروايات',374),(2665,'ar','روايات أوسيس',375),(2666,'ar','بابيت الروايات',376),(2667,'ar','Baldones الروايات',377),(2668,'ar','بالتينافاس الروايات',378),(2669,'ar','روايات بالفو',379),(2670,'ar','Bauskas الروايات',380),(2671,'ar','Beverīnas novads',381),(2672,'ar','Novads Brocēnu',382),(2673,'ar','Novads Burtnieku',383),(2674,'ar','Carnikavas novads',384),(2675,'ar','Cesvaines novads',385),(2676,'ar','Ciblas novads',386),(2677,'ar','تسو أبريس',387),(2678,'ar','Dagdas novads',388),(2679,'ar','Daugavpils novads',389),(2680,'ar','روايات دوبيليس',390),(2681,'ar','ديربيس الروايات',391),(2682,'ar','ديربيس الروايات',392),(2683,'ar','يشرك الروايات',393),(2684,'ar','Garkalnes novads',394),(2685,'ar','Grobiņas novads',395),(2686,'ar','غولبينيس الروايات',396),(2687,'ar','إيكافاس روايات',397),(2688,'ar','Ikškiles novads',398),(2689,'ar','Ilūkstes novads',399),(2690,'ar','روايات Inčukalna',400),(2691,'ar','Jaunjelgavas novads',401),(2692,'ar','Jaunpiebalgas novads',402),(2693,'ar','روايات Jaunpiebalgas',403),(2694,'ar','Jelgavas novads',404),(2695,'ar','جيكابيلس أبريز',405),(2696,'ar','روايات كاندافاس',406),(2697,'ar','Kokneses الروايات',407),(2698,'ar','Krimuldas novads',408),(2699,'ar','Krustpils الروايات',409),(2700,'ar','Krāslavas Apriņķis',410),(2701,'ar','كولدوغاس أبريز',411),(2702,'ar','Kārsavas novads',412),(2703,'ar','روايات ييلفاريس',413),(2704,'ar','ليمباو أبريز',414),(2705,'ar','روايات لباناس',415),(2706,'ar','روايات لودزاس',416),(2707,'ar','مقاطعة ليجاتني',417),(2708,'ar','مقاطعة ليفاني',418),(2709,'ar','مادونا روايات',419),(2710,'ar','Mazsalacas novads',420),(2711,'ar','روايات مالبلز',421),(2712,'ar','Mārupes novads',422),(2713,'ar','نوفاو نوكشنو',423),(2714,'ar','روايات نيريتاس',424),(2715,'ar','روايات نيكاس',425),(2716,'ar','أغنام الروايات',426),(2717,'ar','أولينيس الروايات',427),(2718,'ar','روايات Ozolnieku',428),(2719,'ar','بريسيو أبرييس',429),(2720,'ar','Priekules الروايات',430),(2721,'ar','كوندادو دي بريكوي',431),(2722,'ar','Pärgaujas novads',432),(2723,'ar','روايات بافيلوستاس',433),(2724,'ar','بلافيناس مقاطعة',434),(2725,'ar','روناس روايات',435),(2726,'ar','Riebiņu novads',436),(2727,'ar','روجاس روايات',437),(2728,'ar','Novads روباو',438),(2729,'ar','روكافاس روايات',439),(2730,'ar','روغاجو روايات',440),(2731,'ar','رندلس الروايات',441),(2732,'ar','Radzeknes novads',442),(2733,'ar','Rūjienas novads',443),(2734,'ar','بلدية سالاسغريفا',444),(2735,'ar','روايات سالاس',445),(2736,'ar','Salaspils novads',446),(2737,'ar','روايات سالدوس',447),(2738,'ar','Novuls Saulkrastu',448),(2739,'ar','سيغولداس روايات',449),(2740,'ar','Skrundas novads',450),(2741,'ar','مقاطعة Skrīveri',451),(2742,'ar','يبتسم الروايات',452),(2743,'ar','روايات Stopiņu',453),(2744,'ar','روايات Stren novu',454),(2745,'ar','سجاس روايات',455),(2746,'ar','روايات تالسو',456),(2747,'ar','توكوما الروايات',457),(2748,'ar','Tērvetes novads',458),(2749,'ar','Vaiņodes novads',459),(2750,'ar','فالكاس الروايات',460),(2751,'ar','فالميراس الروايات',461),(2752,'ar','مقاطعة فاكلاني',462),(2753,'ar','Vecpiebalgas novads',463),(2754,'ar','روايات Vecumnieku',464),(2755,'ar','فنتسبيلس الروايات',465),(2756,'ar','Viesītes Novads',466),(2757,'ar','Viļakas novads',467),(2758,'ar','روايات فيناو',468),(2759,'ar','Vārkavas novads',469),(2760,'ar','روايات زيلوبس',470),(2761,'ar','مقاطعة أدازي',471),(2762,'ar','مقاطعة Erglu',472),(2763,'ar','مقاطعة كيغمس',473),(2764,'ar','مقاطعة كيكافا',474),(2765,'ar','Alytaus Apskritis',475),(2766,'ar','كاونو ابكريتيس',476),(2767,'ar','Klaipėdos apskritis',477),(2768,'ar','Marijampol\'s apskritis',478),(2769,'ar','Panevėžio apskritis',479),(2770,'ar','uliaulių apskritis',480),(2771,'ar','Taurag\'s apskritis',481),(2772,'ar','Telšių apskritis',482),(2773,'ar','Utenos apskritis',483),(2774,'ar','فيلنياوس ابكريتيس',484),(2775,'ar','فدان',485),(2776,'ar','ألاغواس',486),(2777,'ar','أمابا',487),(2778,'ar','أمازوناس',488),(2779,'ar','باهيا',489),(2780,'ar','سيارا',490),(2781,'ar','إسبيريتو سانتو',491),(2782,'ar','غوياس',492),(2783,'ar','مارانهاو',493),(2784,'ar','ماتو جروسو',494),(2785,'ar','ماتو جروسو دو سول',495),(2786,'ar','ميناس جريس',496),(2787,'ar','بارا',497),(2788,'ar','بارايبا',498),(2789,'ar','بارانا',499),(2790,'ar','بيرنامبوكو',500),(2791,'ar','بياوي',501),(2792,'ar','ريو دي جانيرو',502),(2793,'ar','ريو غراندي دو نورتي',503),(2794,'ar','ريو غراندي دو سول',504),(2795,'ar','روندونيا',505),(2796,'ar','رورايما',506),(2797,'ar','سانتا كاتارينا',507),(2798,'ar','ساو باولو',508),(2799,'ar','سيرغيبي',509),(2800,'ar','توكانتينز',510),(2801,'ar','وفي مقاطعة الاتحادية',511),(2802,'ar','Zagrebačka زوبانيا',512),(2803,'ar','Krapinsko-zagorska زوبانيا',513),(2804,'ar','Sisačko-moslavačka زوبانيا',514),(2805,'ar','كارلوفيتش شوبانيا',515),(2806,'ar','فارادينسكا زوبانيجا',516),(2807,'ar','Koprivničko-križevačka زوبانيجا',517),(2808,'ar','بيلوفارسكو-بيلوجورسكا',518),(2809,'ar','بريمورسكو غورانسكا سوبانيا',519),(2810,'ar','ليكو سينيسكا زوبانيا',520),(2811,'ar','Virovitičko-podravska زوبانيا',521),(2812,'ar','Požeško-slavonska županija',522),(2813,'ar','Brodsko-posavska županija',523),(2814,'ar','زادارسكا زوبانيجا',524),(2815,'ar','Osječko-baranjska županija',525),(2816,'ar','شيبنسكو-كنينسكا سوبانيا',526),(2817,'ar','Virovitičko-podravska زوبانيا',527),(2818,'ar','Splitsko-dalmatinska زوبانيا',528),(2819,'ar','Istarska زوبانيا',529),(2820,'ar','Dubrovačko-neretvanska زوبانيا',530),(2821,'ar','Međimurska زوبانيا',531),(2822,'ar','غراد زغرب',532),(2823,'ar','جزر أندامان ونيكوبار',533),(2824,'ar','ولاية اندرا براديش',534),(2825,'ar','اروناتشال براديش',535),(2826,'ar','أسام',536),(2827,'ar','بيهار',537),(2828,'ar','شانديغار',538),(2829,'ar','تشهاتيسجاره',539),(2830,'ar','دادرا ونجار هافيلي',540),(2831,'ar','دامان وديو',541),(2832,'ar','دلهي',542),(2833,'ar','غوا',543),(2834,'ar','غوجارات',544),(2835,'ar','هاريانا',545),(2836,'ar','هيماشال براديش',546),(2837,'ar','جامو وكشمير',547),(2838,'ar','جهارخاند',548),(2839,'ar','كارناتاكا',549),(2840,'ar','ولاية كيرالا',550),(2841,'ar','اكشادويب',551),(2842,'ar','ماديا براديش',552),(2843,'ar','ماهاراشترا',553),(2844,'ar','مانيبور',554),(2845,'ar','ميغالايا',555),(2846,'ar','ميزورام',556),(2847,'ar','ناجالاند',557),(2848,'ar','أوديشا',558),(2849,'ar','بودوتشيري',559),(2850,'ar','البنجاب',560),(2851,'ar','راجستان',561),(2852,'ar','سيكيم',562),(2853,'ar','تاميل نادو',563),(2854,'ar','تيلانجانا',564),(2855,'ar','تريبورا',565),(2856,'ar','ولاية اوتار براديش',566),(2857,'ar','أوتارانتشال',567),(2858,'ar','البنغال الغربية',568),(2859,'es','Alabama',1),(2860,'es','Alaska',2),(2861,'es','American Samoa',3),(2862,'es','Arizona',4),(2863,'es','Arkansas',5),(2864,'es','Armed Forces Africa',6),(2865,'es','Armed Forces Americas',7),(2866,'es','Armed Forces Canada',8),(2867,'es','Armed Forces Europe',9),(2868,'es','Armed Forces Middle East',10),(2869,'es','Armed Forces Pacific',11),(2870,'es','California',12),(2871,'es','Colorado',13),(2872,'es','Connecticut',14),(2873,'es','Delaware',15),(2874,'es','District of Columbia',16),(2875,'es','Federated States Of Micronesia',17),(2876,'es','Florida',18),(2877,'es','Georgia',19),(2878,'es','Guam',20),(2879,'es','Hawaii',21),(2880,'es','Idaho',22),(2881,'es','Illinois',23),(2882,'es','Indiana',24),(2883,'es','Iowa',25),(2884,'es','Kansas',26),(2885,'es','Kentucky',27),(2886,'es','Louisiana',28),(2887,'es','Maine',29),(2888,'es','Marshall Islands',30),(2889,'es','Maryland',31),(2890,'es','Massachusetts',32),(2891,'es','Michigan',33),(2892,'es','Minnesota',34),(2893,'es','Mississippi',35),(2894,'es','Missouri',36),(2895,'es','Montana',37),(2896,'es','Nebraska',38),(2897,'es','Nevada',39),(2898,'es','New Hampshire',40),(2899,'es','New Jersey',41),(2900,'es','New Mexico',42),(2901,'es','New York',43),(2902,'es','North Carolina',44),(2903,'es','North Dakota',45),(2904,'es','Northern Mariana Islands',46),(2905,'es','Ohio',47),(2906,'es','Oklahoma',48),(2907,'es','Oregon',49),(2908,'es','Palau',50),(2909,'es','Pennsylvania',51),(2910,'es','Puerto Rico',52),(2911,'es','Rhode Island',53),(2912,'es','South Carolina',54),(2913,'es','South Dakota',55),(2914,'es','Tennessee',56),(2915,'es','Texas',57),(2916,'es','Utah',58),(2917,'es','Vermont',59),(2918,'es','Virgin Islands',60),(2919,'es','Virginia',61),(2920,'es','Washington',62),(2921,'es','West Virginia',63),(2922,'es','Wisconsin',64),(2923,'es','Wyoming',65),(2924,'es','Alberta',66),(2925,'es','British Columbia',67),(2926,'es','Manitoba',68),(2927,'es','Newfoundland and Labrador',69),(2928,'es','New Brunswick',70),(2929,'es','Nova Scotia',71),(2930,'es','Northwest Territories',72),(2931,'es','Nunavut',73),(2932,'es','Ontario',74),(2933,'es','Prince Edward Island',75),(2934,'es','Quebec',76),(2935,'es','Saskatchewan',77),(2936,'es','Yukon Territory',78),(2937,'es','Niedersachsen',79),(2938,'es','Baden-Württemberg',80),(2939,'es','Bayern',81),(2940,'es','Berlin',82),(2941,'es','Brandenburg',83),(2942,'es','Bremen',84),(2943,'es','Hamburg',85),(2944,'es','Hessen',86),(2945,'es','Mecklenburg-Vorpommern',87),(2946,'es','Nordrhein-Westfalen',88),(2947,'es','Rheinland-Pfalz',89),(2948,'es','Saarland',90),(2949,'es','Sachsen',91),(2950,'es','Sachsen-Anhalt',92),(2951,'es','Schleswig-Holstein',93),(2952,'es','Thüringen',94),(2953,'es','Wien',95),(2954,'es','Niederösterreich',96),(2955,'es','Oberösterreich',97),(2956,'es','Salzburg',98),(2957,'es','Kärnten',99),(2958,'es','Steiermark',100),(2959,'es','Tirol',101),(2960,'es','Burgenland',102),(2961,'es','Vorarlberg',103),(2962,'es','Aargau',104),(2963,'es','Appenzell Innerrhoden',105),(2964,'es','Appenzell Ausserrhoden',106),(2965,'es','Bern',107),(2966,'es','Basel-Landschaft',108),(2967,'es','Basel-Stadt',109),(2968,'es','Freiburg',110),(2969,'es','Genf',111),(2970,'es','Glarus',112),(2971,'es','Graubünden',113),(2972,'es','Jura',114),(2973,'es','Luzern',115),(2974,'es','Neuenburg',116),(2975,'es','Nidwalden',117),(2976,'es','Obwalden',118),(2977,'es','St. Gallen',119),(2978,'es','Schaffhausen',120),(2979,'es','Solothurn',121),(2980,'es','Schwyz',122),(2981,'es','Thurgau',123),(2982,'es','Tessin',124),(2983,'es','Uri',125),(2984,'es','Waadt',126),(2985,'es','Wallis',127),(2986,'es','Zug',128),(2987,'es','Zürich',129),(2988,'es','La Coruña',130),(2989,'es','Álava',131),(2990,'es','Albacete',132),(2991,'es','Alicante',133),(2992,'es','Almería',134),(2993,'es','Asturias',135),(2994,'es','Ávila',136),(2995,'es','Badajoz',137),(2996,'es','Baleares',138),(2997,'es','Barcelona',139),(2998,'es','Burgos',140),(2999,'es','Cáceres',141),(3000,'es','Cádiz',142),(3001,'es','Cantabria',143),(3002,'es','Castellón',144),(3003,'es','Ceuta',145),(3004,'es','Ciudad Real',146),(3005,'es','Córdoba',147),(3006,'es','Cuenca',148),(3007,'es','Gerona',149),(3008,'es','Granada',150),(3009,'es','Guadalajara',151),(3010,'es','Guipúzcoa',152),(3011,'es','Huelva',153),(3012,'es','Huesca',154),(3013,'es','Jaén',155),(3014,'es','La Rioja',156),(3015,'es','Las Palmas',157),(3016,'es','León',158),(3017,'es','Lérida',159),(3018,'es','Lugo',160),(3019,'es','Madrid',161),(3020,'es','Málaga',162),(3021,'es','Melilla',163),(3022,'es','Murcia',164),(3023,'es','Navarra',165),(3024,'es','Orense',166),(3025,'es','Palencia',167),(3026,'es','Pontevedra',168),(3027,'es','Salamanca',169),(3028,'es','Santa Cruz de Tenerife',170),(3029,'es','Segovia',171),(3030,'es','Sevilla',172),(3031,'es','Soria',173),(3032,'es','Tarragona',174),(3033,'es','Teruel',175),(3034,'es','Toledo',176),(3035,'es','Valencia',177),(3036,'es','Valladolid',178),(3037,'es','Vizcaya',179),(3038,'es','Zamora',180),(3039,'es','Zaragoza',181),(3040,'es','Ain',182),(3041,'es','Aisne',183),(3042,'es','Allier',184),(3043,'es','Alpes-de-Haute-Provence',185),(3044,'es','Hautes-Alpes',186),(3045,'es','Alpes-Maritimes',187),(3046,'es','Ardèche',188),(3047,'es','Ardennes',189),(3048,'es','Ariège',190),(3049,'es','Aube',191),(3050,'es','Aude',192),(3051,'es','Aveyron',193),(3052,'es','Bouches-du-Rhône',194),(3053,'es','Calvados',195),(3054,'es','Cantal',196),(3055,'es','Charente',197),(3056,'es','Charente-Maritime',198),(3057,'es','Cher',199),(3058,'es','Corrèze',200),(3059,'es','Corse-du-Sud',201),(3060,'es','Haute-Corse',202),(3061,'es','Côte-d\'Or',203),(3062,'es','Côtes-d\'Armor',204),(3063,'es','Creuse',205),(3064,'es','Dordogne',206),(3065,'es','Doubs',207),(3066,'es','Drôme',208),(3067,'es','Eure',209),(3068,'es','Eure-et-Loir',210),(3069,'es','Finistère',211),(3070,'es','Gard',212),(3071,'es','Haute-Garonne',213),(3072,'es','Gers',214),(3073,'es','Gironde',215),(3074,'es','Hérault',216),(3075,'es','Ille-et-Vilaine',217),(3076,'es','Indre',218),(3077,'es','Indre-et-Loire',219),(3078,'es','Isère',220),(3079,'es','Jura',221),(3080,'es','Landes',222),(3081,'es','Loir-et-Cher',223),(3082,'es','Loire',224),(3083,'es','Haute-Loire',225),(3084,'es','Loire-Atlantique',226),(3085,'es','Loiret',227),(3086,'es','Lot',228),(3087,'es','Lot-et-Garonne',229),(3088,'es','Lozère',230),(3089,'es','Maine-et-Loire',231),(3090,'es','Manche',232),(3091,'es','Marne',233),(3092,'es','Haute-Marne',234),(3093,'es','Mayenne',235),(3094,'es','Meurthe-et-Moselle',236),(3095,'es','Meuse',237),(3096,'es','Morbihan',238),(3097,'es','Moselle',239),(3098,'es','Nièvre',240),(3099,'es','Nord',241),(3100,'es','Oise',242),(3101,'es','Orne',243),(3102,'es','Pas-de-Calais',244),(3103,'es','Puy-de-Dôme',245),(3104,'es','Pyrénées-Atlantiques',246),(3105,'es','Hautes-Pyrénées',247),(3106,'es','Pyrénées-Orientales',248),(3107,'es','Bas-Rhin',249),(3108,'es','Haut-Rhin',250),(3109,'es','Rhône',251),(3110,'es','Haute-Saône',252),(3111,'es','Saône-et-Loire',253),(3112,'es','Sarthe',254),(3113,'es','Savoie',255),(3114,'es','Haute-Savoie',256),(3115,'es','Paris',257),(3116,'es','Seine-Maritime',258),(3117,'es','Seine-et-Marne',259),(3118,'es','Yvelines',260),(3119,'es','Deux-Sèvres',261),(3120,'es','Somme',262),(3121,'es','Tarn',263),(3122,'es','Tarn-et-Garonne',264),(3123,'es','Var',265),(3124,'es','Vaucluse',266),(3125,'es','Vendée',267),(3126,'es','Vienne',268),(3127,'es','Haute-Vienne',269),(3128,'es','Vosges',270),(3129,'es','Yonne',271),(3130,'es','Territoire-de-Belfort',272),(3131,'es','Essonne',273),(3132,'es','Hauts-de-Seine',274),(3133,'es','Seine-Saint-Denis',275),(3134,'es','Val-de-Marne',276),(3135,'es','Val-d\'Oise',277),(3136,'es','Alba',278),(3137,'es','Arad',279),(3138,'es','Argeş',280),(3139,'es','Bacău',281),(3140,'es','Bihor',282),(3141,'es','Bistriţa-Năsăud',283),(3142,'es','Botoşani',284),(3143,'es','Braşov',285),(3144,'es','Brăila',286),(3145,'es','Bucureşti',287),(3146,'es','Buzău',288),(3147,'es','Caraş-Severin',289),(3148,'es','Călăraşi',290),(3149,'es','Cluj',291),(3150,'es','Constanţa',292),(3151,'es','Covasna',293),(3152,'es','Dâmboviţa',294),(3153,'es','Dolj',295),(3154,'es','Galaţi',296),(3155,'es','Giurgiu',297),(3156,'es','Gorj',298),(3157,'es','Harghita',299),(3158,'es','Hunedoara',300),(3159,'es','Ialomiţa',301),(3160,'es','Iaşi',302),(3161,'es','Ilfov',303),(3162,'es','Maramureş',304),(3163,'es','Mehedinţi',305),(3164,'es','Mureş',306),(3165,'es','Neamţ',307),(3166,'es','Olt',308),(3167,'es','Prahova',309),(3168,'es','Satu-Mare',310),(3169,'es','Sălaj',311),(3170,'es','Sibiu',312),(3171,'es','Suceava',313),(3172,'es','Teleorman',314),(3173,'es','Timiş',315),(3174,'es','Tulcea',316),(3175,'es','Vaslui',317),(3176,'es','Vâlcea',318),(3177,'es','Vrancea',319),(3178,'es','Lappi',320),(3179,'es','Pohjois-Pohjanmaa',321),(3180,'es','Kainuu',322),(3181,'es','Pohjois-Karjala',323),(3182,'es','Pohjois-Savo',324),(3183,'es','Etelä-Savo',325),(3184,'es','Etelä-Pohjanmaa',326),(3185,'es','Pohjanmaa',327),(3186,'es','Pirkanmaa',328),(3187,'es','Satakunta',329),(3188,'es','Keski-Pohjanmaa',330),(3189,'es','Keski-Suomi',331),(3190,'es','Varsinais-Suomi',332),(3191,'es','Etelä-Karjala',333),(3192,'es','Päijät-Häme',334),(3193,'es','Kanta-Häme',335),(3194,'es','Uusimaa',336),(3195,'es','Itä-Uusimaa',337),(3196,'es','Kymenlaakso',338),(3197,'es','Ahvenanmaa',339),(3198,'es','Harjumaa',340),(3199,'es','Hiiumaa',341),(3200,'es','country_state_ida-Virumaa',342),(3201,'es','Jõgevamaa',343),(3202,'es','Järvamaa',344),(3203,'es','Läänemaa',345),(3204,'es','Lääne-Virumaa',346),(3205,'es','Põlvamaa',347),(3206,'es','Pärnumaa',348),(3207,'es','Raplamaa',349),(3208,'es','Saaremaa',350),(3209,'es','Tartumaa',351),(3210,'es','Valgamaa',352),(3211,'es','Viljandimaa',353),(3212,'es','Võrumaa',354),(3213,'es','Daugavpils',355),(3214,'es','Jelgava',356),(3215,'es','Jēkabpils',357),(3216,'es','Jūrmala',358),(3217,'es','Liepāja',359),(3218,'es','Liepājas novads',360),(3219,'es','Rēzekne',361),(3220,'es','Rīga',362),(3221,'es','Rīgas novads',363),(3222,'es','Valmiera',364),(3223,'es','Ventspils',365),(3224,'es','Aglonas novads',366),(3225,'es','Aizkraukles novads',367),(3226,'es','Aizputes novads',368),(3227,'es','Aknīstes novads',369),(3228,'es','Alojas novads',370),(3229,'es','Alsungas novads',371),(3230,'es','Alūksnes novads',372),(3231,'es','Amatas novads',373),(3232,'es','Apes novads',374),(3233,'es','Auces novads',375),(3234,'es','Babītes novads',376),(3235,'es','Baldones novads',377),(3236,'es','Baltinavas novads',378),(3237,'es','Balvu novads',379),(3238,'es','Bauskas novads',380),(3239,'es','Beverīnas novads',381),(3240,'es','Brocēnu novads',382),(3241,'es','Burtnieku novads',383),(3242,'es','Carnikavas novads',384),(3243,'es','Cesvaines novads',385),(3244,'es','Ciblas novads',386),(3245,'es','Cēsu novads',387),(3246,'es','Dagdas novads',388),(3247,'es','Daugavpils novads',389),(3248,'es','Dobeles novads',390),(3249,'es','Dundagas novads',391),(3250,'es','Durbes novads',392),(3251,'es','Engures novads',393),(3252,'es','Garkalnes novads',394),(3253,'es','Grobiņas novads',395),(3254,'es','Gulbenes novads',396),(3255,'es','Iecavas novads',397),(3256,'es','Ikšķiles novads',398),(3257,'es','Ilūkstes novads',399),(3258,'es','Inčukalna novads',400),(3259,'es','Jaunjelgavas novads',401),(3260,'es','Jaunpiebalgas novads',402),(3261,'es','Jaunpils novads',403),(3262,'es','Jelgavas novads',404),(3263,'es','Jēkabpils novads',405),(3264,'es','Kandavas novads',406),(3265,'es','Kokneses novads',407),(3266,'es','Krimuldas novads',408),(3267,'es','Krustpils novads',409),(3268,'es','Krāslavas novads',410),(3269,'es','Kuldīgas novads',411),(3270,'es','Kārsavas novads',412),(3271,'es','Lielvārdes novads',413),(3272,'es','Limbažu novads',414),(3273,'es','Lubānas novads',415),(3274,'es','Ludzas novads',416),(3275,'es','Līgatnes novads',417),(3276,'es','Līvānu novads',418),(3277,'es','Madonas novads',419),(3278,'es','Mazsalacas novads',420),(3279,'es','Mālpils novads',421),(3280,'es','Mārupes novads',422),(3281,'es','Naukšēnu novads',423),(3282,'es','Neretas novads',424),(3283,'es','Nīcas novads',425),(3284,'es','Ogres novads',426),(3285,'es','Olaines novads',427),(3286,'es','Ozolnieku novads',428),(3287,'es','Preiļu novads',429),(3288,'es','Priekules novads',430),(3289,'es','Priekuļu novads',431),(3290,'es','Pārgaujas novads',432),(3291,'es','Pāvilostas novads',433),(3292,'es','Pļaviņu novads',434),(3293,'es','Raunas novads',435),(3294,'es','Riebiņu novads',436),(3295,'es','Rojas novads',437),(3296,'es','Ropažu novads',438),(3297,'es','Rucavas novads',439),(3298,'es','Rugāju novads',440),(3299,'es','Rundāles novads',441),(3300,'es','Rēzeknes novads',442),(3301,'es','Rūjienas novads',443),(3302,'es','Salacgrīvas novads',444),(3303,'es','Salas novads',445),(3304,'es','Salaspils novads',446),(3305,'es','Saldus novads',447),(3306,'es','Saulkrastu novads',448),(3307,'es','Siguldas novads',449),(3308,'es','Skrundas novads',450),(3309,'es','Skrīveru novads',451),(3310,'es','Smiltenes novads',452),(3311,'es','Stopiņu novads',453),(3312,'es','Strenču novads',454),(3313,'es','Sējas novads',455),(3314,'es','Talsu novads',456),(3315,'es','Tukuma novads',457),(3316,'es','Tērvetes novads',458),(3317,'es','Vaiņodes novads',459),(3318,'es','Valkas novads',460),(3319,'es','Valmieras novads',461),(3320,'es','Varakļānu novads',462),(3321,'es','Vecpiebalgas novads',463),(3322,'es','Vecumnieku novads',464),(3323,'es','Ventspils novads',465),(3324,'es','Viesītes novads',466),(3325,'es','Viļakas novads',467),(3326,'es','Viļānu novads',468),(3327,'es','Vārkavas novads',469),(3328,'es','Zilupes novads',470),(3329,'es','Ādažu novads',471),(3330,'es','Ērgļu novads',472),(3331,'es','Ķeguma novads',473),(3332,'es','Ķekavas novads',474),(3333,'es','Alytaus Apskritis',475),(3334,'es','Kauno Apskritis',476),(3335,'es','Klaipėdos Apskritis',477),(3336,'es','Marijampolės Apskritis',478),(3337,'es','Panevėžio Apskritis',479),(3338,'es','Šiaulių Apskritis',480),(3339,'es','Tauragės Apskritis',481),(3340,'es','Telšių Apskritis',482),(3341,'es','Utenos Apskritis',483),(3342,'es','Vilniaus Apskritis',484),(3343,'es','Acre',485),(3344,'es','Alagoas',486),(3345,'es','Amapá',487),(3346,'es','Amazonas',488),(3347,'es','Bahía',489),(3348,'es','Ceará',490),(3349,'es','Espíritu Santo',491),(3350,'es','Goiás',492),(3351,'es','Maranhão',493),(3352,'es','Mato Grosso',494),(3353,'es','Mato Grosso del Sur',495),(3354,'es','Minas Gerais',496),(3355,'es','Pará',497),(3356,'es','Paraíba',498),(3357,'es','Paraná',499),(3358,'es','Pernambuco',500),(3359,'es','Piauí',501),(3360,'es','Río de Janeiro',502),(3361,'es','Río Grande del Norte',503),(3362,'es','Río Grande del Sur',504),(3363,'es','Rondônia',505),(3364,'es','Roraima',506),(3365,'es','Santa Catarina',507),(3366,'es','São Paulo',508),(3367,'es','Sergipe',509),(3368,'es','Tocantins',510),(3369,'es','Distrito Federal',511),(3370,'es','Zagrebačka županija',512),(3371,'es','Krapinsko-zagorska županija',513),(3372,'es','Sisačko-moslavačka županija',514),(3373,'es','Karlovačka županija',515),(3374,'es','Varaždinska županija',516),(3375,'es','Koprivničko-križevačka županija',517),(3376,'es','Bjelovarsko-bilogorska županija',518),(3377,'es','Primorsko-goranska županija',519),(3378,'es','Ličko-senjska županija',520),(3379,'es','Virovitičko-podravska županija',521),(3380,'es','Požeško-slavonska županija',522),(3381,'es','Brodsko-posavska županija',523),(3382,'es','Zadarska županija',524),(3383,'es','Osječko-baranjska županija',525),(3384,'es','Šibensko-kninska županija',526),(3385,'es','Vukovarsko-srijemska županija',527),(3386,'es','Splitsko-dalmatinska županija',528),(3387,'es','Istarska županija',529),(3388,'es','Dubrovačko-neretvanska županija',530),(3389,'es','Međimurska županija',531),(3390,'es','Grad Zagreb',532),(3391,'es','Andaman and Nicobar Islands',533),(3392,'es','Andhra Pradesh',534),(3393,'es','Arunachal Pradesh',535),(3394,'es','Assam',536),(3395,'es','Bihar',537),(3396,'es','Chandigarh',538),(3397,'es','Chhattisgarh',539),(3398,'es','Dadra and Nagar Haveli',540),(3399,'es','Daman and Diu',541),(3400,'es','Delhi',542),(3401,'es','Goa',543),(3402,'es','Gujarat',544),(3403,'es','Haryana',545),(3404,'es','Himachal Pradesh',546),(3405,'es','Jammu and Kashmir',547),(3406,'es','Jharkhand',548),(3407,'es','Karnataka',549),(3408,'es','Kerala',550),(3409,'es','Lakshadweep',551),(3410,'es','Madhya Pradesh',552),(3411,'es','Maharashtra',553),(3412,'es','Manipur',554),(3413,'es','Meghalaya',555),(3414,'es','Mizoram',556),(3415,'es','Nagaland',557),(3416,'es','Odisha',558),(3417,'es','Puducherry',559),(3418,'es','Punjab',560),(3419,'es','Rajasthan',561),(3420,'es','Sikkim',562),(3421,'es','Tamil Nadu',563),(3422,'es','Telangana',564),(3423,'es','Tripura',565),(3424,'es','Uttar Pradesh',566),(3425,'es','Uttarakhand',567),(3426,'es','West Bengal',568),(3427,'es','Alto Paraguay',569),(3428,'es','Alto Paraná',570),(3429,'es','Amambay',571),(3430,'es','Asunción',572),(3431,'es','Boquerón',573),(3432,'es','Caaguazú',574),(3433,'es','Caazapá',575),(3434,'es','Canindeyú',576),(3435,'es','Central',577),(3436,'es','Concepción',578),(3437,'es','Cordillera',579),(3438,'es','Guairá',580),(3439,'es','Itapúa',581),(3440,'es','Misiones',582),(3441,'es','Paraguarí',583),(3442,'es','Presidente Hayes',584),(3443,'es','San Pedro',585),(3444,'es','Ñeembucú',586),(3445,'fa','آلاباما',1),(3446,'fa','آلاسکا',2),(3447,'fa','ساموآ آمریکایی',3),(3448,'fa','آریزونا',4),(3449,'fa','آرکانزاس',5),(3450,'fa','نیروهای مسلح آفریقا',6),(3451,'fa','Armed Forces America',7),(3452,'fa','نیروهای مسلح کانادا',8),(3453,'fa','نیروهای مسلح اروپا',9),(3454,'fa','نیروهای مسلح خاورمیانه',10),(3455,'fa','نیروهای مسلح اقیانوس آرام',11),(3456,'fa','کالیفرنیا',12),(3457,'fa','کلرادو',13),(3458,'fa','کانکتیکات',14),(3459,'fa','دلاور',15),(3460,'fa','منطقه کلمبیا',16),(3461,'fa','ایالات فدرال میکرونزی',17),(3462,'fa','فلوریدا',18),(3463,'fa','جورجیا',19),(3464,'fa','گوام',20),(3465,'fa','هاوایی',21),(3466,'fa','آیداهو',22),(3467,'fa','ایلینویز',23),(3468,'fa','ایندیانا',24),(3469,'fa','آیووا',25),(3470,'fa','کانزاس',26),(3471,'fa','کنتاکی',27),(3472,'fa','لوئیزیانا',28),(3473,'fa','ماین',29),(3474,'fa','مای',30),(3475,'fa','مریلند',31),(3476,'fa',' ',32),(3477,'fa','میشیگان',33),(3478,'fa','مینه سوتا',34),(3479,'fa','می سی سی پی',35),(3480,'fa','میسوری',36),(3481,'fa','مونتانا',37),(3482,'fa','نبراسکا',38),(3483,'fa','نواد',39),(3484,'fa','نیوهمپشایر',40),(3485,'fa','نیوجرسی',41),(3486,'fa','نیومکزیکو',42),(3487,'fa','نیویورک',43),(3488,'fa','کارولینای شمالی',44),(3489,'fa','داکوتای شمالی',45),(3490,'fa','جزایر ماریانای شمالی',46),(3491,'fa','اوهایو',47),(3492,'fa','اوکلاهما',48),(3493,'fa','اورگان',49),(3494,'fa','پالائو',50),(3495,'fa','پنسیلوانیا',51),(3496,'fa','پورتوریکو',52),(3497,'fa','رود آیلند',53),(3498,'fa','کارولینای جنوبی',54),(3499,'fa','داکوتای جنوبی',55),(3500,'fa','تنسی',56),(3501,'fa','تگزاس',57),(3502,'fa','یوتا',58),(3503,'fa','ورمونت',59),(3504,'fa','جزایر ویرجین',60),(3505,'fa','ویرجینیا',61),(3506,'fa','واشنگتن',62),(3507,'fa','ویرجینیای غربی',63),(3508,'fa','ویسکانسین',64),(3509,'fa','وایومینگ',65),(3510,'fa','آلبرتا',66),(3511,'fa','بریتیش کلمبیا',67),(3512,'fa','مانیتوبا',68),(3513,'fa','نیوفاندلند و لابرادور',69),(3514,'fa','نیوبرانزویک',70),(3515,'fa','نوا اسکوشیا',71),(3516,'fa','سرزمینهای شمال غربی',72),(3517,'fa','نوناووت',73),(3518,'fa','انتاریو',74),(3519,'fa','جزیره پرنس ادوارد',75),(3520,'fa','کبک',76),(3521,'fa','ساسکاتچوان',77),(3522,'fa','قلمرو یوکان',78),(3523,'fa','نیدرزاکسن',79),(3524,'fa','بادن-وورتمبرگ',80),(3525,'fa','بایرن',81),(3526,'fa','برلین',82),(3527,'fa','براندنبورگ',83),(3528,'fa','برمن',84),(3529,'fa','هامبور',85),(3530,'fa','هسن',86),(3531,'fa','مکلنبورگ-وورپومرن',87),(3532,'fa','نوردراین-وستفالن',88),(3533,'fa','راینلاند-پلاتینات',89),(3534,'fa','سارلند',90),(3535,'fa','ساچسن',91),(3536,'fa','ساچسن-آنهالت',92),(3537,'fa','شلسویگ-هولشتاین',93),(3538,'fa','تورینگی',94),(3539,'fa','وین',95),(3540,'fa','اتریش پایین',96),(3541,'fa','اتریش فوقانی',97),(3542,'fa','سالزبورگ',98),(3543,'fa','کارنتا',99),(3544,'fa','Steiermar',100),(3545,'fa','تیرول',101),(3546,'fa','بورگنلن',102),(3547,'fa','Vorarlber',103),(3548,'fa','آرگ',104),(3549,'fa','',105),(3550,'fa','اپنزلسرهودن',106),(3551,'fa','بر',107),(3552,'fa','بازل-لندشفت',108),(3553,'fa','بازل استاد',109),(3554,'fa','فرایبورگ',110),(3555,'fa','گنف',111),(3556,'fa','گلاروس',112),(3557,'fa','Graubünde',113),(3558,'fa','ژورا',114),(3559,'fa','لوزرن',115),(3560,'fa','نوینبور',116),(3561,'fa','نیدالد',117),(3562,'fa','اوبولدن',118),(3563,'fa','سنت گالن',119),(3564,'fa','شافهاوز',120),(3565,'fa','سولوتور',121),(3566,'fa','شووی',122),(3567,'fa','تورگاو',123),(3568,'fa','تسسی',124),(3569,'fa','اوری',125),(3570,'fa','وادت',126),(3571,'fa','والی',127),(3572,'fa','ز',128),(3573,'fa','زوریخ',129),(3574,'fa','کورونا',130),(3575,'fa','آلاوا',131),(3576,'fa','آلبوم',132),(3577,'fa','آلیکانت',133),(3578,'fa','آلمریا',134),(3579,'fa','آستوریا',135),(3580,'fa','آویلا',136),(3581,'fa','باداژوز',137),(3582,'fa','ضرب و شتم',138),(3583,'fa','بارسلون',139),(3584,'fa','بورگو',140),(3585,'fa','کاسر',141),(3586,'fa','کادی',142),(3587,'fa','کانتابریا',143),(3588,'fa','کاستلون',144),(3589,'fa','سوت',145),(3590,'fa','سیوداد واقعی',146),(3591,'fa','کوردوب',147),(3592,'fa','Cuenc',148),(3593,'fa','جیرون',149),(3594,'fa','گراناد',150),(3595,'fa','گوادالاجار',151),(3596,'fa','Guipuzcoa',152),(3597,'fa','هولوا',153),(3598,'fa','هوسک',154),(3599,'fa','جی',155),(3600,'fa','لا ریوجا',156),(3601,'fa','لاس پالماس',157),(3602,'fa','لئو',158),(3603,'fa','Lleid',159),(3604,'fa','لوگ',160),(3605,'fa','مادری',161),(3606,'fa','مالاگ',162),(3607,'fa','ملیلی',163),(3608,'fa','مورسیا',164),(3609,'fa','ناوار',165),(3610,'fa','اورنس',166),(3611,'fa','پالنسی',167),(3612,'fa','پونتوودر',168),(3613,'fa','سالامانک',169),(3614,'fa','سانتا کروز د تنریفه',170),(3615,'fa','سوگویا',171),(3616,'fa','سوی',172),(3617,'fa','سوریا',173),(3618,'fa','تاراگونا',174),(3619,'fa','ترئو',175),(3620,'fa','تولدو',176),(3621,'fa','والنسیا',177),(3622,'fa','والادولی',178),(3623,'fa','ویزکایا',179),(3624,'fa','زامور',180),(3625,'fa','ساراگوز',181),(3626,'fa','عی',182),(3627,'fa','آیز',183),(3628,'fa','آلی',184),(3629,'fa','آلپ-دو-هاوت-پرووانس',185),(3630,'fa','هاوتس آلپ',186),(3631,'fa','Alpes-Maritime',187),(3632,'fa','اردچه',188),(3633,'fa','آرد',189),(3634,'fa','محاصر',190),(3635,'fa','آبه',191),(3636,'fa','Aud',192),(3637,'fa','آویرون',193),(3638,'fa','BOCAS DO Rhône',194),(3639,'fa','نوعی عرق',195),(3640,'fa','کانتینال',196),(3641,'fa','چارنت',197),(3642,'fa','چارنت-دریایی',198),(3643,'fa','چ',199),(3644,'fa','کور',200),(3645,'fa','کرس دو ساد',201),(3646,'fa','هاوت کورس',202),(3647,'fa','کوستا دورکرز',203),(3648,'fa','تخت دارمور',204),(3649,'fa','درهم',205),(3650,'fa','دوردگن',206),(3651,'fa','دوب',207),(3652,'fa','تعریف اول',208),(3653,'fa','یور',209),(3654,'fa','Eure-et-Loi',210),(3655,'fa','فمینیست',211),(3656,'fa','باغ',212),(3657,'fa','اوت-گارون',213),(3658,'fa','گر',214),(3659,'fa','جیروند',215),(3660,'fa','هیر',216),(3661,'fa','هشدار داده می شود',217),(3662,'fa','ایندور',218),(3663,'fa','Indre-et-Loir',219),(3664,'fa','ایزر',220),(3665,'fa','یور',221),(3666,'fa','لندز',222),(3667,'fa','Loir-et-Che',223),(3668,'fa','وام گرفتن',224),(3669,'fa','Haute-Loir',225),(3670,'fa','Loire-Atlantiqu',226),(3671,'fa','لیرت',227),(3672,'fa','لوط',228),(3673,'fa','لوت و گارون',229),(3674,'fa','لوزر',230),(3675,'fa','ماین et-Loire',231),(3676,'fa','مانچ',232),(3677,'fa','مارن',233),(3678,'fa','هاوت-مارن',234),(3679,'fa','مایین',235),(3680,'fa','مورته-et-Moselle',236),(3681,'fa','مسخره کردن',237),(3682,'fa','موربیان',238),(3683,'fa','موزل',239),(3684,'fa','Nièvr',240),(3685,'fa','نورد',241),(3686,'fa','اوی',242),(3687,'fa','ارن',243),(3688,'fa','پاس-کاله',244),(3689,'fa','Puy-de-Dôm',245),(3690,'fa','Pyrénées-Atlantiques',246),(3691,'fa','Hautes-Pyrénée',247),(3692,'fa','Pyrénées-Orientales',248),(3693,'fa','بس راین',249),(3694,'fa','هاوت-رین',250),(3695,'fa','رو',251),(3696,'fa','Haute-Saône',252),(3697,'fa','Saône-et-Loire',253),(3698,'fa','سارته',254),(3699,'fa','ساووی',255),(3700,'fa','هاو-ساووی',256),(3701,'fa','پاری',257),(3702,'fa','Seine-Maritime',258),(3703,'fa','Seine-et-Marn',259),(3704,'fa','ایولینز',260),(3705,'fa','Deux-Sèvres',261),(3706,'fa','سمی',262),(3707,'fa','ضعف',263),(3708,'fa','Tarn-et-Garonne',264),(3709,'fa','وار',265),(3710,'fa','ووکلوز',266),(3711,'fa','وندیه',267),(3712,'fa','وین',268),(3713,'fa','هاوت-وین',269),(3714,'fa','رأی دادن',270),(3715,'fa','یون',271),(3716,'fa','سرزمین-دو-بلفورت',272),(3717,'fa','اسون',273),(3718,'fa','هاوتز دی سی',274),(3719,'fa','Seine-Saint-Deni',275),(3720,'fa','والد مارن',276),(3721,'fa','Val-d\'Ois',277),(3722,'fa','آلبا',278),(3723,'fa','آرا',279),(3724,'fa','Argeș',280),(3725,'fa','باکو',281),(3726,'fa','بیهور',282),(3727,'fa','بیستریا-نسوود',283),(3728,'fa','بوتانی',284),(3729,'fa','برازوف',285),(3730,'fa','Brăila',286),(3731,'fa','București',287),(3732,'fa','بوز',288),(3733,'fa','کارا- Severin',289),(3734,'fa','کالیراسی',290),(3735,'fa','كلوژ',291),(3736,'fa','کنستانس',292),(3737,'fa','کواسنا',293),(3738,'fa','Dâmbovița',294),(3739,'fa','دال',295),(3740,'fa','گالشی',296),(3741,'fa','جورجیو',297),(3742,'fa','گور',298),(3743,'fa','هارگیتا',299),(3744,'fa','هوندهار',300),(3745,'fa','ایالومیشا',301),(3746,'fa','Iași',302),(3747,'fa','Ilfo',303),(3748,'fa','Maramureș',304),(3749,'fa','Mehedinți',305),(3750,'fa','Mureș',306),(3751,'fa','Neamț',307),(3752,'fa','اولت',308),(3753,'fa','پرهوا',309),(3754,'fa','ستو ماره',310),(3755,'fa','سلاج',311),(3756,'fa','سیبیو',312),(3757,'fa','سوساو',313),(3758,'fa','تلورمان',314),(3759,'fa','تیمیچ',315),(3760,'fa','تولسا',316),(3761,'fa','واسلوئی',317),(3762,'fa','Vâlcea',318),(3763,'fa','ورانسا',319),(3764,'fa','لاپی',320),(3765,'fa','Pohjois-Pohjanmaa',321),(3766,'fa','کائینو',322),(3767,'fa','Pohjois-Karjala',323),(3768,'fa','Pohjois-Savo',324),(3769,'fa','اتل-ساوو',325),(3770,'fa','کسکی-پوهانما',326),(3771,'fa','Pohjanmaa',327),(3772,'fa','پیرکانما',328),(3773,'fa','ساتاکونتا',329),(3774,'fa','کسکی-پوهانما',330),(3775,'fa','کسکی-سوومی',331),(3776,'fa','Varsinais-Suomi',332),(3777,'fa','اتلی کرجالا',333),(3778,'fa','Päijät-HAM',334),(3779,'fa','کانتا-هوم',335),(3780,'fa','یوسیما',336),(3781,'fa','اوسیم',337),(3782,'fa','کیمنلاکو',338),(3783,'fa','آونوانما',339),(3784,'fa','هارژوم',340),(3785,'fa','سلا',341),(3786,'fa','آیدا-ویروما',342),(3787,'fa','Jõgevamaa',343),(3788,'fa','جوروماا',344),(3789,'fa','لونما',345),(3790,'fa','لون-ویروما',346),(3791,'fa','پالوماا',347),(3792,'fa','پورنوما',348),(3793,'fa','Raplama',349),(3794,'fa','ساارما',350),(3795,'fa','تارتوما',351),(3796,'fa','والگام',352),(3797,'fa','ویلجاندیم',353),(3798,'fa','Võrumaa',354),(3799,'fa','داگاوپیل',355),(3800,'fa','جلگاو',356),(3801,'fa','جکابیل',357),(3802,'fa','جرمل',358),(3803,'fa','لیپجا',359),(3804,'fa','شهرستان لیپاج',360),(3805,'fa','روژن',361),(3806,'fa','راگ',362),(3807,'fa','شهرستان ریگ',363),(3808,'fa','والمییرا',364),(3809,'fa','Ventspils',365),(3810,'fa','آگلوناس نوادا',366),(3811,'fa','تازه کاران آیزکرایکلس',367),(3812,'fa','تازه واردان',368),(3813,'fa','شهرستا',369),(3814,'fa','نوازندگان آلوجاس',370),(3815,'fa','تازه های آلسونگاس',371),(3816,'fa','شهرستان آلوکس',372),(3817,'fa','تازه کاران آماتاس',373),(3818,'fa','میمون های تازه',374),(3819,'fa','نوادا را آویز می کند',375),(3820,'fa','شهرستان بابی',376),(3821,'fa','Baldones novad',377),(3822,'fa','نوین های بالتیناوا',378),(3823,'fa','Balvu novad',379),(3824,'fa','نوازندگان باسکاس',380),(3825,'fa','شهرستان بورین',381),(3826,'fa','شهرستان بروچن',382),(3827,'fa','بوردنیکو نوآوران',383),(3828,'fa','تازه کارنیکاوا',384),(3829,'fa','نوازان سزوینس',385),(3830,'fa','نوادگان Cibla',386),(3831,'fa','شهرستان Cesis',387),(3832,'fa','تازه های داگدا',388),(3833,'fa','داوگاوپیلز نوادا',389),(3834,'fa','دابل نوادی',390),(3835,'fa','تازه کارهای دنداگاس',391),(3836,'fa','نوباد دوربس',392),(3837,'fa','مشغول تازه کارها است',393),(3838,'fa','گرکالنس نواد',394),(3839,'fa','یا شهرستان گروبی',395),(3840,'fa','تازه های گلبنس',396),(3841,'fa','Iecavas novads',397),(3842,'fa','شهرستان ایسکل',398),(3843,'fa','ایالت ایلکست',399),(3844,'fa','کنددو د اینچوکالن',400),(3845,'fa','نوجواد Jaunjelgavas',401),(3846,'fa','تازه های Jaunpiebalgas',402),(3847,'fa','شهرستان جونپیلس',403),(3848,'fa','شهرستان جگلو',404),(3849,'fa','شهرستان جکابیل',405),(3850,'fa','شهرستان کنداوا',406),(3851,'fa','شهرستان کوکنز',407),(3852,'fa','شهرستان کریمولد',408),(3853,'fa','شهرستان کرستپیل',409),(3854,'fa','شهرستان کراسلاو',410),(3855,'fa','کاندادو د کلدیگا',411),(3856,'fa','کاندادو د کارساوا',412),(3857,'fa','شهرستان لیولوارد',413),(3858,'fa','شهرستان لیمباشی',414),(3859,'fa','ای ولسوالی لوبون',415),(3860,'fa','شهرستان لودزا',416),(3861,'fa','شهرستان لیگات',417),(3862,'fa','شهرستان لیوانی',418),(3863,'fa','شهرستان مادونا',419),(3864,'fa','شهرستان مازسال',420),(3865,'fa','شهرستان مالپیلس',421),(3866,'fa','شهرستان Mārupe',422),(3867,'fa','ا کنددو د نوکشنی',423),(3868,'fa','کاملاً یک شهرستان',424),(3869,'fa','شهرستان نیکا',425),(3870,'fa','شهرستان اوگر',426),(3871,'fa','شهرستان اولین',427),(3872,'fa','شهرستان اوزولنیکی',428),(3873,'fa','شهرستان پرلیلی',429),(3874,'fa','شهرستان Priekule',430),(3875,'fa','Condado de Priekuļi',431),(3876,'fa','شهرستان در حال حرکت',432),(3877,'fa','شهرستان پاویلوستا',433),(3878,'fa','شهرستان Plavinas',4),(3879,'fa','شهرستان راونا',435),(3880,'fa','شهرستان ریبیشی',436),(3881,'fa','شهرستان روجا',437),(3882,'fa','شهرستان روپازی',438),(3883,'fa','شهرستان روساوا',439),(3884,'fa','شهرستان روگی',440),(3885,'fa','شهرستان راندل',441),(3886,'fa','شهرستان ریزکن',442),(3887,'fa','شهرستان روژینا',443),(3888,'fa','شهرداری Salacgriva',444),(3889,'fa','منطقه جزیره',445),(3890,'fa','شهرستان Salaspils',446),(3891,'fa','شهرستان سالدوس',447),(3892,'fa','شهرستان ساولکرستی',448),(3893,'fa','شهرستان سیگولدا',449),(3894,'fa','شهرستان Skrunda',450),(3895,'fa','شهرستان Skrīveri',451),(3896,'fa','شهرستان Smiltene',452),(3897,'fa','شهرستان ایستینی',453),(3898,'fa','شهرستان استرنشی',454),(3899,'fa','منطقه کاشت',455),(3900,'fa','شهرستان تالسی',456),(3901,'fa','توکومس',457),(3902,'fa','شهرستان تورت',458),(3903,'fa','یا شهرستان وایودود',459),(3904,'fa','شهرستان والکا',460),(3905,'fa','شهرستان Valmiera',461),(3906,'fa','شهرستان وارکانی',462),(3907,'fa','شهرستان Vecpiebalga',463),(3908,'fa','شهرستان وکومنیکی',464),(3909,'fa','شهرستان ونتسپیل',465),(3910,'fa','کنددو د بازدید',466),(3911,'fa','شهرستان ویلاکا',467),(3912,'fa','شهرستان ویلانی',468),(3913,'fa','شهرستان واركاوا',469),(3914,'fa','شهرستان زیلوپ',470),(3915,'fa','شهرستان آدازی',471),(3916,'fa','شهرستان ارگلو',472),(3917,'fa','شهرستان کگومس',473),(3918,'fa','شهرستان ککاوا',474),(3919,'fa','شهرستان Alytus',475),(3920,'fa','شهرستان Kaunas',476),(3921,'fa','شهرستان کلایپدا',477),(3922,'fa','شهرستان ماریجامپولی',478),(3923,'fa','شهرستان پانویسیز',479),(3924,'fa','شهرستان سیاولیا',480),(3925,'fa','شهرستان تاجیج',481),(3926,'fa','شهرستان تلشیا',482),(3927,'fa','شهرستان اوتنا',483),(3928,'fa','شهرستان ویلنیوس',484),(3929,'fa','جریب',485),(3930,'fa','حالت',486),(3931,'fa','آمپá',487),(3932,'fa','آمازون',488),(3933,'fa','باهی',489),(3934,'fa','سارا',490),(3935,'fa','روح القدس',491),(3936,'fa','برو',492),(3937,'fa','مارانهائ',493),(3938,'fa','ماتو گروسو',494),(3939,'fa','Mato Grosso do Sul',495),(3940,'fa','ایالت میناس گرایس',496),(3941,'fa','پار',497),(3942,'fa','حالت',498),(3943,'fa','پارانا',499),(3944,'fa','حال',500),(3945,'fa','پیازو',501),(3946,'fa','ریو دوژانیرو',502),(3947,'fa','ریو گراند دو نورته',503),(3948,'fa','ریو گراند دو سول',504),(3949,'fa','Rondôni',505),(3950,'fa','Roraim',506),(3951,'fa','سانتا کاتارینا',507),(3952,'fa','پ',508),(3953,'fa','Sergip',509),(3954,'fa','توکانتین',510),(3955,'fa','منطقه فدرال',511),(3956,'fa','شهرستان زاگرب',512),(3957,'fa','Condado de Krapina-Zagorj',513),(3958,'fa','شهرستان سیساک-موسلاوینا',514),(3959,'fa','شهرستان کارلوواک',515),(3960,'fa','شهرداری واراžدین',516),(3961,'fa','Condo de Koprivnica-Križevci',517),(3962,'fa','محل سکونت د بیلوار-بلوگورا',518),(3963,'fa','Condado de Primorje-Gorski kotar',519),(3964,'fa','شهرستان لیکا-سنج',520),(3965,'fa','Condado de Virovitica-Podravina',521),(3966,'fa','شهرستان پوژگا-اسلاونیا',522),(3967,'fa','Condado de Brod-Posavina',523),(3968,'fa','شهرستان زجر',524),(3969,'fa','Condado de Osijek-Baranja',525),(3970,'fa','Condo de Sibenik-Knin',526),(3971,'fa','Condado de Vukovar-Srijem',527),(3972,'fa','شهرستان اسپلیت-Dalmatia',528),(3973,'fa','شهرستان ایستیا',529),(3974,'fa','Condado de Dubrovnik-Neretva',530),(3975,'fa','شهرستان Međimurje',531),(3976,'fa','شهر زاگرب',532),(3977,'fa','جزایر آندامان و نیکوبار',533),(3978,'fa','آندرا پرادش',534),(3979,'fa','آروناچال پرادش',535),(3980,'fa','آسام',536),(3981,'fa','Biha',537),(3982,'fa','چاندیگار',538),(3983,'fa','چاتیسگار',539),(3984,'fa','دادرا و نگار هاولی',540),(3985,'fa','دامان و دیو',541),(3986,'fa','دهلی',542),(3987,'fa','گوا',543),(3988,'fa','گجرات',544),(3989,'fa','هاریانا',545),(3990,'fa','هیماچال پرادش',546),(3991,'fa','جامو و کشمیر',547),(3992,'fa','جهخند',548),(3993,'fa','کارناتاکا',549),(3994,'fa','کرال',550),(3995,'fa','لاکشادوپ',551),(3996,'fa','مادیا پرادش',552),(3997,'fa','ماهاراشترا',553),(3998,'fa','مانی پور',554),(3999,'fa','مگالایا',555),(4000,'fa','مزورام',556),(4001,'fa','ناگلند',557),(4002,'fa','ادیشا',558),(4003,'fa','میناکاری',559),(4004,'fa','پنجا',560),(4005,'fa','راجستان',561),(4006,'fa','سیکیم',562),(4007,'fa','تامیل نادو',563),(4008,'fa','تلنگانا',564),(4009,'fa','تریپورا',565),(4010,'fa','اوتار پرادش',566),(4011,'fa','اوتاراکند',567),(4012,'fa','بنگال غرب',568),(4013,'pt_BR','Alabama',1),(4014,'pt_BR','Alaska',2),(4015,'pt_BR','Samoa Americana',3),(4016,'pt_BR','Arizona',4),(4017,'pt_BR','Arkansas',5),(4018,'pt_BR','Forças Armadas da África',6),(4019,'pt_BR','Forças Armadas das Américas',7),(4020,'pt_BR','Forças Armadas do Canadá',8),(4021,'pt_BR','Forças Armadas da Europa',9),(4022,'pt_BR','Forças Armadas do Oriente Médio',10),(4023,'pt_BR','Forças Armadas do Pacífico',11),(4024,'pt_BR','California',12),(4025,'pt_BR','Colorado',13),(4026,'pt_BR','Connecticut',14),(4027,'pt_BR','Delaware',15),(4028,'pt_BR','Distrito de Columbia',16),(4029,'pt_BR','Estados Federados da Micronésia',17),(4030,'pt_BR','Florida',18),(4031,'pt_BR','Geórgia',19),(4032,'pt_BR','Guam',20),(4033,'pt_BR','Havaí',21),(4034,'pt_BR','Idaho',22),(4035,'pt_BR','Illinois',23),(4036,'pt_BR','Indiana',24),(4037,'pt_BR','Iowa',25),(4038,'pt_BR','Kansas',26),(4039,'pt_BR','Kentucky',27),(4040,'pt_BR','Louisiana',28),(4041,'pt_BR','Maine',29),(4042,'pt_BR','Ilhas Marshall',30),(4043,'pt_BR','Maryland',31),(4044,'pt_BR','Massachusetts',32),(4045,'pt_BR','Michigan',33),(4046,'pt_BR','Minnesota',34),(4047,'pt_BR','Mississippi',35),(4048,'pt_BR','Missouri',36),(4049,'pt_BR','Montana',37),(4050,'pt_BR','Nebraska',38),(4051,'pt_BR','Nevada',39),(4052,'pt_BR','New Hampshire',40),(4053,'pt_BR','Nova Jersey',41),(4054,'pt_BR','Novo México',42),(4055,'pt_BR','Nova York',43),(4056,'pt_BR','Carolina do Norte',44),(4057,'pt_BR','Dakota do Norte',45),(4058,'pt_BR','Ilhas Marianas do Norte',46),(4059,'pt_BR','Ohio',47),(4060,'pt_BR','Oklahoma',48),(4061,'pt_BR','Oregon',4),(4062,'pt_BR','Palau',50),(4063,'pt_BR','Pensilvânia',51),(4064,'pt_BR','Porto Rico',52),(4065,'pt_BR','Rhode Island',53),(4066,'pt_BR','Carolina do Sul',54),(4067,'pt_BR','Dakota do Sul',55),(4068,'pt_BR','Tennessee',56),(4069,'pt_BR','Texas',57),(4070,'pt_BR','Utah',58),(4071,'pt_BR','Vermont',59),(4072,'pt_BR','Ilhas Virgens',60),(4073,'pt_BR','Virginia',61),(4074,'pt_BR','Washington',62),(4075,'pt_BR','West Virginia',63),(4076,'pt_BR','Wisconsin',64),(4077,'pt_BR','Wyoming',65),(4078,'pt_BR','Alberta',66),(4079,'pt_BR','Colúmbia Britânica',67),(4080,'pt_BR','Manitoba',68),(4081,'pt_BR','Terra Nova e Labrador',69),(4082,'pt_BR','New Brunswick',70),(4083,'pt_BR','Nova Escócia',7),(4084,'pt_BR','Territórios do Noroeste',72),(4085,'pt_BR','Nunavut',73),(4086,'pt_BR','Ontario',74),(4087,'pt_BR','Ilha do Príncipe Eduardo',75),(4088,'pt_BR','Quebec',76),(4089,'pt_BR','Saskatchewan',77),(4090,'pt_BR','Território yukon',78),(4091,'pt_BR','Niedersachsen',79),(4092,'pt_BR','Baden-Wurttemberg',80),(4093,'pt_BR','Bayern',81),(4094,'pt_BR','Berlim',82),(4095,'pt_BR','Brandenburg',83),(4096,'pt_BR','Bremen',84),(4097,'pt_BR','Hamburgo',85),(4098,'pt_BR','Hessen',86),(4099,'pt_BR','Mecklenburg-Vorpommern',87),(4100,'pt_BR','Nordrhein-Westfalen',88),(4101,'pt_BR','Renânia-Palatinado',8),(4102,'pt_BR','Sarre',90),(4103,'pt_BR','Sachsen',91),(4104,'pt_BR','Sachsen-Anhalt',92),(4105,'pt_BR','Schleswig-Holstein',93),(4106,'pt_BR','Turíngia',94),(4107,'pt_BR','Viena',95),(4108,'pt_BR','Baixa Áustria',96),(4109,'pt_BR','Oberösterreich',97),(4110,'pt_BR','Salzburg',98),(4111,'pt_BR','Caríntia',99),(4112,'pt_BR','Steiermark',100),(4113,'pt_BR','Tirol',101),(4114,'pt_BR','Burgenland',102),(4115,'pt_BR','Vorarlberg',103),(4116,'pt_BR','Aargau',104),(4117,'pt_BR','Appenzell Innerrhoden',105),(4118,'pt_BR','Appenzell Ausserrhoden',106),(4119,'pt_BR','Bern',107),(4120,'pt_BR','Basel-Landschaft',108),(4121,'pt_BR','Basel-Stadt',109),(4122,'pt_BR','Freiburg',110),(4123,'pt_BR','Genf',111),(4124,'pt_BR','Glarus',112),(4125,'pt_BR','Grisons',113),(4126,'pt_BR','Jura',114),(4127,'pt_BR','Luzern',115),(4128,'pt_BR','Neuenburg',116),(4129,'pt_BR','Nidwalden',117),(4130,'pt_BR','Obwalden',118),(4131,'pt_BR','St. Gallen',119),(4132,'pt_BR','Schaffhausen',120),(4133,'pt_BR','Solothurn',121),(4134,'pt_BR','Schwyz',122),(4135,'pt_BR','Thurgau',123),(4136,'pt_BR','Tessin',124),(4137,'pt_BR','Uri',125),(4138,'pt_BR','Waadt',126),(4139,'pt_BR','Wallis',127),(4140,'pt_BR','Zug',128),(4141,'pt_BR','Zurique',129),(4142,'pt_BR','Corunha',130),(4143,'pt_BR','Álava',131),(4144,'pt_BR','Albacete',132),(4145,'pt_BR','Alicante',133),(4146,'pt_BR','Almeria',134),(4147,'pt_BR','Astúrias',135),(4148,'pt_BR','Avila',136),(4149,'pt_BR','Badajoz',137),(4150,'pt_BR','Baleares',138),(4151,'pt_BR','Barcelona',139),(4152,'pt_BR','Burgos',140),(4153,'pt_BR','Caceres',141),(4154,'pt_BR','Cadiz',142),(4155,'pt_BR','Cantábria',143),(4156,'pt_BR','Castellon',144),(4157,'pt_BR','Ceuta',145),(4158,'pt_BR','Ciudad Real',146),(4159,'pt_BR','Cordoba',147),(4160,'pt_BR','Cuenca',148),(4161,'pt_BR','Girona',149),(4162,'pt_BR','Granada',150),(4163,'pt_BR','Guadalajara',151),(4164,'pt_BR','Guipuzcoa',152),(4165,'pt_BR','Huelva',153),(4166,'pt_BR','Huesca',154),(4167,'pt_BR','Jaen',155),(4168,'pt_BR','La Rioja',156),(4169,'pt_BR','Las Palmas',157),(4170,'pt_BR','Leon',158),(4171,'pt_BR','Lleida',159),(4172,'pt_BR','Lugo',160),(4173,'pt_BR','Madri',161),(4174,'pt_BR','Málaga',162),(4175,'pt_BR','Melilla',163),(4176,'pt_BR','Murcia',164),(4177,'pt_BR','Navarra',165),(4178,'pt_BR','Ourense',166),(4179,'pt_BR','Palencia',167),(4180,'pt_BR','Pontevedra',168),(4181,'pt_BR','Salamanca',169),(4182,'pt_BR','Santa Cruz de Tenerife',170),(4183,'pt_BR','Segovia',171),(4184,'pt_BR','Sevilla',172),(4185,'pt_BR','Soria',173),(4186,'pt_BR','Tarragona',174),(4187,'pt_BR','Teruel',175),(4188,'pt_BR','Toledo',176),(4189,'pt_BR','Valencia',177),(4190,'pt_BR','Valladolid',178),(4191,'pt_BR','Vizcaya',179),(4192,'pt_BR','Zamora',180),(4193,'pt_BR','Zaragoza',181),(4194,'pt_BR','Ain',182),(4195,'pt_BR','Aisne',183),(4196,'pt_BR','Allier',184),(4197,'pt_BR','Alpes da Alta Provença',185),(4198,'pt_BR','Altos Alpes',186),(4199,'pt_BR','Alpes-Maritimes',187),(4200,'pt_BR','Ardèche',188),(4201,'pt_BR','Ardennes',189),(4202,'pt_BR','Ariege',190),(4203,'pt_BR','Aube',191),(4204,'pt_BR','Aude',192),(4205,'pt_BR','Aveyron',193),(4206,'pt_BR','BOCAS DO Rhône',194),(4207,'pt_BR','Calvados',195),(4208,'pt_BR','Cantal',196),(4209,'pt_BR','Charente',197),(4210,'pt_BR','Charente-Maritime',198),(4211,'pt_BR','Cher',199),(4212,'pt_BR','Corrèze',200),(4213,'pt_BR','Corse-du-Sud',201),(4214,'pt_BR','Alta Córsega',202),(4215,'pt_BR','Costa d\'OrCorrèze',203),(4216,'pt_BR','Cotes d\'Armor',204),(4217,'pt_BR','Creuse',205),(4218,'pt_BR','Dordogne',206),(4219,'pt_BR','Doubs',207),(4220,'pt_BR','DrômeFinistère',208),(4221,'pt_BR','Eure',209),(4222,'pt_BR','Eure-et-Loir',210),(4223,'pt_BR','Finistère',211),(4224,'pt_BR','Gard',212),(4225,'pt_BR','Haute-Garonne',213),(4226,'pt_BR','Gers',214),(4227,'pt_BR','Gironde',215),(4228,'pt_BR','Hérault',216),(4229,'pt_BR','Ille-et-Vilaine',217),(4230,'pt_BR','Indre',218),(4231,'pt_BR','Indre-et-Loire',219),(4232,'pt_BR','Isère',220),(4233,'pt_BR','Jura',221),(4234,'pt_BR','Landes',222),(4235,'pt_BR','Loir-et-Cher',223),(4236,'pt_BR','Loire',224),(4237,'pt_BR','Haute-Loire',22),(4238,'pt_BR','Loire-Atlantique',226),(4239,'pt_BR','Loiret',227),(4240,'pt_BR','Lot',228),(4241,'pt_BR','Lot e Garona',229),(4242,'pt_BR','Lozère',230),(4243,'pt_BR','Maine-et-Loire',231),(4244,'pt_BR','Manche',232),(4245,'pt_BR','Marne',233),(4246,'pt_BR','Haute-Marne',234),(4247,'pt_BR','Mayenne',235),(4248,'pt_BR','Meurthe-et-Moselle',236),(4249,'pt_BR','Meuse',237),(4250,'pt_BR','Morbihan',238),(4251,'pt_BR','Moselle',239),(4252,'pt_BR','Nièvre',240),(4253,'pt_BR','Nord',241),(4254,'pt_BR','Oise',242),(4255,'pt_BR','Orne',243),(4256,'pt_BR','Pas-de-Calais',244),(4257,'pt_BR','Puy-de-Dôme',24),(4258,'pt_BR','Pirineus Atlânticos',246),(4259,'pt_BR','Hautes-Pyrénées',247),(4260,'pt_BR','Pirineus Orientais',248),(4261,'pt_BR','Bas-Rhin',249),(4262,'pt_BR','Alto Reno',250),(4263,'pt_BR','Rhône',251),(4264,'pt_BR','Haute-Saône',252),(4265,'pt_BR','Saône-et-Loire',253),(4266,'pt_BR','Sarthe',25),(4267,'pt_BR','Savoie',255),(4268,'pt_BR','Alta Sabóia',256),(4269,'pt_BR','Paris',257),(4270,'pt_BR','Seine-Maritime',258),(4271,'pt_BR','Seine-et-Marne',259),(4272,'pt_BR','Yvelines',260),(4273,'pt_BR','Deux-Sèvres',261),(4274,'pt_BR','Somme',262),(4275,'pt_BR','Tarn',263),(4276,'pt_BR','Tarn-et-Garonne',264),(4277,'pt_BR','Var',265),(4278,'pt_BR','Vaucluse',266),(4279,'pt_BR','Compradora',267),(4280,'pt_BR','Vienne',268),(4281,'pt_BR','Haute-Vienne',269),(4282,'pt_BR','Vosges',270),(4283,'pt_BR','Yonne',271),(4284,'pt_BR','Território de Belfort',272),(4285,'pt_BR','Essonne',273),(4286,'pt_BR','Altos do Sena',274),(4287,'pt_BR','Seine-Saint-Denis',275),(4288,'pt_BR','Val-de-Marne',276),(4289,'pt_BR','Val-d\'Oise',277),(4290,'pt_BR','Alba',278),(4291,'pt_BR','Arad',279),(4292,'pt_BR','Arges',280),(4293,'pt_BR','Bacau',281),(4294,'pt_BR','Bihor',282),(4295,'pt_BR','Bistrita-Nasaud',283),(4296,'pt_BR','Botosani',284),(4297,'pt_BR','Brașov',285),(4298,'pt_BR','Braila',286),(4299,'pt_BR','Bucareste',287),(4300,'pt_BR','Buzau',288),(4301,'pt_BR','Caras-Severin',289),(4302,'pt_BR','Călărași',290),(4303,'pt_BR','Cluj',291),(4304,'pt_BR','Constanta',292),(4305,'pt_BR','Covasna',29),(4306,'pt_BR','Dambovita',294),(4307,'pt_BR','Dolj',295),(4308,'pt_BR','Galati',296),(4309,'pt_BR','Giurgiu',297),(4310,'pt_BR','Gorj',298),(4311,'pt_BR','Harghita',299),(4312,'pt_BR','Hunedoara',300),(4313,'pt_BR','Ialomita',301),(4314,'pt_BR','Iasi',302),(4315,'pt_BR','Ilfov',303),(4316,'pt_BR','Maramures',304),(4317,'pt_BR','Maramures',305),(4318,'pt_BR','Mures',306),(4319,'pt_BR','alemão',307),(4320,'pt_BR','Olt',308),(4321,'pt_BR','Prahova',309),(4322,'pt_BR','Satu-Mare',310),(4323,'pt_BR','Salaj',311),(4324,'pt_BR','Sibiu',312),(4325,'pt_BR','Suceava',313),(4326,'pt_BR','Teleorman',314),(4327,'pt_BR','Timis',315),(4328,'pt_BR','Tulcea',316),(4329,'pt_BR','Vaslui',317),(4330,'pt_BR','dale',318),(4331,'pt_BR','Vrancea',319),(4332,'pt_BR','Lappi',320),(4333,'pt_BR','Pohjois-Pohjanmaa',321),(4334,'pt_BR','Kainuu',322),(4335,'pt_BR','Pohjois-Karjala',323),(4336,'pt_BR','Pohjois-Savo',324),(4337,'pt_BR','Sul Savo',325),(4338,'pt_BR','Ostrobothnia do sul',326),(4339,'pt_BR','Pohjanmaa',327),(4340,'pt_BR','Pirkanmaa',328),(4341,'pt_BR','Satakunta',329),(4342,'pt_BR','Keski-Pohjanmaa',330),(4343,'pt_BR','Keski-Suomi',331),(4344,'pt_BR','Varsinais-Suomi',332),(4345,'pt_BR','Carélia do Sul',333),(4346,'pt_BR','Päijät-Häme',334),(4347,'pt_BR','Kanta-Häme',335),(4348,'pt_BR','Uusimaa',336),(4349,'pt_BR','Uusimaa',337),(4350,'pt_BR','Kymenlaakso',338),(4351,'pt_BR','Ahvenanmaa',339),(4352,'pt_BR','Harjumaa',340),(4353,'pt_BR','Hiiumaa',341),(4354,'pt_BR','Ida-Virumaa',342),(4355,'pt_BR','Condado de Jõgeva',343),(4356,'pt_BR','Condado de Järva',344),(4357,'pt_BR','Läänemaa',345),(4358,'pt_BR','Condado de Lääne-Viru',346),(4359,'pt_BR','Condado de Põlva',347),(4360,'pt_BR','Condado de Pärnu',348),(4361,'pt_BR','Raplamaa',349),(4362,'pt_BR','Saaremaa',350),(4363,'pt_BR','Tartumaa',351),(4364,'pt_BR','Valgamaa',352),(4365,'pt_BR','Viljandimaa',353),(4366,'pt_BR','Võrumaa',354),(4367,'pt_BR','Daugavpils',355),(4368,'pt_BR','Jelgava',356),(4369,'pt_BR','Jekabpils',357),(4370,'pt_BR','Jurmala',358),(4371,'pt_BR','Liepaja',359),(4372,'pt_BR','Liepaja County',360),(4373,'pt_BR','Rezekne',361),(4374,'pt_BR','Riga',362),(4375,'pt_BR','Condado de Riga',363),(4376,'pt_BR','Valmiera',364),(4377,'pt_BR','Ventspils',365),(4378,'pt_BR','Aglonas novads',366),(4379,'pt_BR','Aizkraukles novads',367),(4380,'pt_BR','Aizputes novads',368),(4381,'pt_BR','Condado de Akniste',369),(4382,'pt_BR','Alojas novads',370),(4383,'pt_BR','Alsungas novads',371),(4384,'pt_BR','Aluksne County',372),(4385,'pt_BR','Amatas novads',373),(4386,'pt_BR','Macacos novads',374),(4387,'pt_BR','Auces novads',375),(4388,'pt_BR','Babītes novads',376),(4389,'pt_BR','Baldones novads',377),(4390,'pt_BR','Baltinavas novads',378),(4391,'pt_BR','Balvu novads',379),(4392,'pt_BR','Bauskas novads',380),(4393,'pt_BR','Condado de Beverina',381),(4394,'pt_BR','Condado de Broceni',382),(4395,'pt_BR','Burtnieku novads',383),(4396,'pt_BR','Carnikavas novads',384),(4397,'pt_BR','Cesvaines novads',385),(4398,'pt_BR','Ciblas novads',386),(4399,'pt_BR','Cesis county',387),(4400,'pt_BR','Dagdas novads',388),(4401,'pt_BR','Daugavpils novads',389),(4402,'pt_BR','Dobeles novads',390),(4403,'pt_BR','Dundagas novads',391),(4404,'pt_BR','Durbes novads',392),(4405,'pt_BR','Engad novads',393),(4406,'pt_BR','Garkalnes novads',394),(4407,'pt_BR','O condado de Grobiņa',395),(4408,'pt_BR','Gulbenes novads',396),(4409,'pt_BR','Iecavas novads',397),(4410,'pt_BR','Ikskile county',398),(4411,'pt_BR','Ilūkste county',399),(4412,'pt_BR','Condado de Inčukalns',400),(4413,'pt_BR','Jaunjelgavas novads',401),(4414,'pt_BR','Jaunpiebalgas novads',402),(4415,'pt_BR','Jaunpils novads',403),(4416,'pt_BR','Jelgavas novads',404),(4417,'pt_BR','Jekabpils county',405),(4418,'pt_BR','Kandavas novads',406),(4419,'pt_BR','Kokneses novads',407),(4420,'pt_BR','Krimuldas novads',408),(4421,'pt_BR','Krustpils novads',409),(4422,'pt_BR','Condado de Kraslava',410),(4423,'pt_BR','Condado de Kuldīga',411),(4424,'pt_BR','Condado de Kārsava',412),(4425,'pt_BR','Condado de Lielvarde',413),(4426,'pt_BR','Condado de Limbaži',414),(4427,'pt_BR','O distrito de Lubāna',415),(4428,'pt_BR','Ludzas novads',416),(4429,'pt_BR','Ligatne county',417),(4430,'pt_BR','Livani county',418),(4431,'pt_BR','Madonas novads',419),(4432,'pt_BR','Mazsalacas novads',420),(4433,'pt_BR','Mālpils county',421),(4434,'pt_BR','Mārupe county',422),(4435,'pt_BR','O condado de Naukšēni',423),(4436,'pt_BR','Neretas novads',424),(4437,'pt_BR','Nīca county',425),(4438,'pt_BR','Ogres novads',426),(4439,'pt_BR','Olaines novads',427),(4440,'pt_BR','Ozolnieku novads',428),(4441,'pt_BR','Preiļi county',429),(4442,'pt_BR','Priekules novads',430),(4443,'pt_BR','Condado de Priekuļi',431),(4444,'pt_BR','Moving county',432),(4445,'pt_BR','Condado de Pavilosta',433),(4446,'pt_BR','Condado de Plavinas',434),(4447,'pt_BR','Raunas novads',435),(4448,'pt_BR','Condado de Riebiņi',436),(4449,'pt_BR','Rojas novads',437),(4450,'pt_BR','Ropazi county',438),(4451,'pt_BR','Rucavas novads',439),(4452,'pt_BR','Rugāji county',440),(4453,'pt_BR','Rundāle county',441),(4454,'pt_BR','Rezekne county',442),(4455,'pt_BR','Rūjiena county',443),(4456,'pt_BR','O município de Salacgriva',444),(4457,'pt_BR','Salas novads',445),(4458,'pt_BR','Salaspils novads',446),(4459,'pt_BR','Saldus novads',447),(4460,'pt_BR','Saulkrastu novads',448),(4461,'pt_BR','Siguldas novads',449),(4462,'pt_BR','Skrundas novads',450),(4463,'pt_BR','Skrīveri county',451),(4464,'pt_BR','Smiltenes novads',452),(4465,'pt_BR','Condado de Stopini',453),(4466,'pt_BR','Condado de Strenči',454),(4467,'pt_BR','Região de semeadura',455),(4468,'pt_BR','Talsu novads',456),(4469,'pt_BR','Tukuma novads',457),(4470,'pt_BR','Condado de Tērvete',458),(4471,'pt_BR','O condado de Vaiņode',459),(4472,'pt_BR','Valkas novads',460),(4473,'pt_BR','Valmieras novads',461),(4474,'pt_BR','Varaklani county',462),(4475,'pt_BR','Vecpiebalgas novads',463),(4476,'pt_BR','Vecumnieku novads',464),(4477,'pt_BR','Ventspils novads',465),(4478,'pt_BR','Condado de Viesite',466),(4479,'pt_BR','Condado de Vilaka',467),(4480,'pt_BR','Vilani county',468),(4481,'pt_BR','Condado de Varkava',469),(4482,'pt_BR','Zilupes novads',470),(4483,'pt_BR','Adazi county',471),(4484,'pt_BR','Erglu county',472),(4485,'pt_BR','Kegums county',473),(4486,'pt_BR','Kekava county',474),(4487,'pt_BR','Alytaus Apskritis',475),(4488,'pt_BR','Kauno Apskritis',476),(4489,'pt_BR','Condado de Klaipeda',477),(4490,'pt_BR','Marijampolė county',478),(4491,'pt_BR','Panevezys county',479),(4492,'pt_BR','Siauliai county',480),(4493,'pt_BR','Taurage county',481),(4494,'pt_BR','Telšiai county',482),(4495,'pt_BR','Utenos Apskritis',483),(4496,'pt_BR','Vilniaus Apskritis',484),(4497,'pt_BR','Acre',485),(4498,'pt_BR','Alagoas',486),(4499,'pt_BR','Amapá',487),(4500,'pt_BR','Amazonas',488),(4501,'pt_BR','Bahia',489),(4502,'pt_BR','Ceará',490),(4503,'pt_BR','Espírito Santo',491),(4504,'pt_BR','Goiás',492),(4505,'pt_BR','Maranhão',493),(4506,'pt_BR','Mato Grosso',494),(4507,'pt_BR','Mato Grosso do Sul',495),(4508,'pt_BR','Minas Gerais',496),(4509,'pt_BR','Pará',497),(4510,'pt_BR','Paraíba',498),(4511,'pt_BR','Paraná',499),(4512,'pt_BR','Pernambuco',500),(4513,'pt_BR','Piauí',501),(4514,'pt_BR','Rio de Janeiro',502),(4515,'pt_BR','Rio Grande do Norte',503),(4516,'pt_BR','Rio Grande do Sul',504),(4517,'pt_BR','Rondônia',505),(4518,'pt_BR','Roraima',506),(4519,'pt_BR','Santa Catarina',507),(4520,'pt_BR','São Paulo',508),(4521,'pt_BR','Sergipe',509),(4522,'pt_BR','Tocantins',510),(4523,'pt_BR','Distrito Federal',511),(4524,'pt_BR','Condado de Zagreb',512),(4525,'pt_BR','Condado de Krapina-Zagorje',513),(4526,'pt_BR','Condado de Sisak-Moslavina',514),(4527,'pt_BR','Condado de Karlovac',515),(4528,'pt_BR','Concelho de Varaždin',516),(4529,'pt_BR','Condado de Koprivnica-Križevci',517),(4530,'pt_BR','Condado de Bjelovar-Bilogora',518),(4531,'pt_BR','Condado de Primorje-Gorski kotar',519),(4532,'pt_BR','Condado de Lika-Senj',520),(4533,'pt_BR','Condado de Virovitica-Podravina',521),(4534,'pt_BR','Condado de Požega-Slavonia',522),(4535,'pt_BR','Condado de Brod-Posavina',523),(4536,'pt_BR','Condado de Zadar',524),(4537,'pt_BR','Condado de Osijek-Baranja',525),(4538,'pt_BR','Condado de Šibenik-Knin',526),(4539,'pt_BR','Condado de Vukovar-Srijem',527),(4540,'pt_BR','Condado de Split-Dalmácia',528),(4541,'pt_BR','Condado de Ístria',529),(4542,'pt_BR','Condado de Dubrovnik-Neretva',530),(4543,'pt_BR','Međimurska županija',531),(4544,'pt_BR','Grad Zagreb',532),(4545,'pt_BR','Ilhas Andaman e Nicobar',533),(4546,'pt_BR','Andhra Pradesh',534),(4547,'pt_BR','Arunachal Pradesh',535),(4548,'pt_BR','Assam',536),(4549,'pt_BR','Bihar',537),(4550,'pt_BR','Chandigarh',538),(4551,'pt_BR','Chhattisgarh',539),(4552,'pt_BR','Dadra e Nagar Haveli',540),(4553,'pt_BR','Daman e Diu',541),(4554,'pt_BR','Delhi',542),(4555,'pt_BR','Goa',543),(4556,'pt_BR','Gujarat',544),(4557,'pt_BR','Haryana',545),(4558,'pt_BR','Himachal Pradesh',546),(4559,'pt_BR','Jammu e Caxemira',547),(4560,'pt_BR','Jharkhand',548),(4561,'pt_BR','Karnataka',549),(4562,'pt_BR','Kerala',550),(4563,'pt_BR','Lakshadweep',551),(4564,'pt_BR','Madhya Pradesh',552),(4565,'pt_BR','Maharashtra',553),(4566,'pt_BR','Manipur',554),(4567,'pt_BR','Meghalaya',555),(4568,'pt_BR','Mizoram',556),(4569,'pt_BR','Nagaland',557),(4570,'pt_BR','Odisha',558),(4571,'pt_BR','Puducherry',559),(4572,'pt_BR','Punjab',560),(4573,'pt_BR','Rajasthan',561),(4574,'pt_BR','Sikkim',562),(4575,'pt_BR','Tamil Nadu',563),(4576,'pt_BR','Telangana',564),(4577,'pt_BR','Tripura',565),(4578,'pt_BR','Uttar Pradesh',566),(4579,'pt_BR','Uttarakhand',567),(4580,'pt_BR','Bengala Ocidental',568);
/*!40000 ALTER TABLE `country_state_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_states`
--

DROP TABLE IF EXISTS `country_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_states`
--

LOCK TABLES `country_states` WRITE;
/*!40000 ALTER TABLE `country_states` DISABLE KEYS */;
INSERT INTO `country_states` VALUES (1,'US','AL','Alabama',244),(2,'US','AK','Alaska',244),(3,'US','AS','American Samoa',244),(4,'US','AZ','Arizona',244),(5,'US','AR','Arkansas',244),(6,'US','AE','Armed Forces Africa',244),(7,'US','AA','Armed Forces Americas',244),(8,'US','AE','Armed Forces Canada',244),(9,'US','AE','Armed Forces Europe',244),(10,'US','AE','Armed Forces Middle East',244),(11,'US','AP','Armed Forces Pacific',244),(12,'US','CA','California',244),(13,'US','CO','Colorado',244),(14,'US','CT','Connecticut',244),(15,'US','DE','Delaware',244),(16,'US','DC','District of Columbia',244),(17,'US','FM','Federated States Of Micronesia',244),(18,'US','FL','Florida',244),(19,'US','GA','Georgia',244),(20,'US','GU','Guam',244),(21,'US','HI','Hawaii',244),(22,'US','ID','Idaho',244),(23,'US','IL','Illinois',244),(24,'US','IN','Indiana',244),(25,'US','IA','Iowa',244),(26,'US','KS','Kansas',244),(27,'US','KY','Kentucky',244),(28,'US','LA','Louisiana',244),(29,'US','ME','Maine',244),(30,'US','MH','Marshall Islands',244),(31,'US','MD','Maryland',244),(32,'US','MA','Massachusetts',244),(33,'US','MI','Michigan',244),(34,'US','MN','Minnesota',244),(35,'US','MS','Mississippi',244),(36,'US','MO','Missouri',244),(37,'US','MT','Montana',244),(38,'US','NE','Nebraska',244),(39,'US','NV','Nevada',244),(40,'US','NH','New Hampshire',244),(41,'US','NJ','New Jersey',244),(42,'US','NM','New Mexico',244),(43,'US','NY','New York',244),(44,'US','NC','North Carolina',244),(45,'US','ND','North Dakota',244),(46,'US','MP','Northern Mariana Islands',244),(47,'US','OH','Ohio',244),(48,'US','OK','Oklahoma',244),(49,'US','OR','Oregon',244),(50,'US','PW','Palau',244),(51,'US','PA','Pennsylvania',244),(52,'US','PR','Puerto Rico',244),(53,'US','RI','Rhode Island',244),(54,'US','SC','South Carolina',244),(55,'US','SD','South Dakota',244),(56,'US','TN','Tennessee',244),(57,'US','TX','Texas',244),(58,'US','UT','Utah',244),(59,'US','VT','Vermont',244),(60,'US','VI','Virgin Islands',244),(61,'US','VA','Virginia',244),(62,'US','WA','Washington',244),(63,'US','WV','West Virginia',244),(64,'US','WI','Wisconsin',244),(65,'US','WY','Wyoming',244),(66,'CA','AB','Alberta',40),(67,'CA','BC','British Columbia',40),(68,'CA','MB','Manitoba',40),(69,'CA','NL','Newfoundland and Labrador',40),(70,'CA','NB','New Brunswick',40),(71,'CA','NS','Nova Scotia',40),(72,'CA','NT','Northwest Territories',40),(73,'CA','NU','Nunavut',40),(74,'CA','ON','Ontario',40),(75,'CA','PE','Prince Edward Island',40),(76,'CA','QC','Quebec',40),(77,'CA','SK','Saskatchewan',40),(78,'CA','YT','Yukon Territory',40),(79,'DE','NDS','Niedersachsen',88),(80,'DE','BAW','Baden-Württemberg',88),(81,'DE','BAY','Bayern',88),(82,'DE','BER','Berlin',88),(83,'DE','BRG','Brandenburg',88),(84,'DE','BRE','Bremen',88),(85,'DE','HAM','Hamburg',88),(86,'DE','HES','Hessen',88),(87,'DE','MEC','Mecklenburg-Vorpommern',88),(88,'DE','NRW','Nordrhein-Westfalen',88),(89,'DE','RHE','Rheinland-Pfalz',88),(90,'DE','SAR','Saarland',88),(91,'DE','SAS','Sachsen',88),(92,'DE','SAC','Sachsen-Anhalt',88),(93,'DE','SCN','Schleswig-Holstein',88),(94,'DE','THE','Thüringen',88),(95,'AT','WI','Wien',16),(96,'AT','NO','Niederösterreich',16),(97,'AT','OO','Oberösterreich',16),(98,'AT','SB','Salzburg',16),(99,'AT','KN','Kärnten',16),(100,'AT','ST','Steiermark',16),(101,'AT','TI','Tirol',16),(102,'AT','BL','Burgenland',16),(103,'AT','VB','Vorarlberg',16),(104,'CH','AG','Aargau',220),(105,'CH','AI','Appenzell Innerrhoden',220),(106,'CH','AR','Appenzell Ausserrhoden',220),(107,'CH','BE','Bern',220),(108,'CH','BL','Basel-Landschaft',220),(109,'CH','BS','Basel-Stadt',220),(110,'CH','FR','Freiburg',220),(111,'CH','GE','Genf',220),(112,'CH','GL','Glarus',220),(113,'CH','GR','Graubünden',220),(114,'CH','JU','Jura',220),(115,'CH','LU','Luzern',220),(116,'CH','NE','Neuenburg',220),(117,'CH','NW','Nidwalden',220),(118,'CH','OW','Obwalden',220),(119,'CH','SG','St. Gallen',220),(120,'CH','SH','Schaffhausen',220),(121,'CH','SO','Solothurn',220),(122,'CH','SZ','Schwyz',220),(123,'CH','TG','Thurgau',220),(124,'CH','TI','Tessin',220),(125,'CH','UR','Uri',220),(126,'CH','VD','Waadt',220),(127,'CH','VS','Wallis',220),(128,'CH','ZG','Zug',220),(129,'CH','ZH','Zürich',220),(130,'ES','A Coruсa','A Coruña',206),(131,'ES','Alava','Alava',206),(132,'ES','Albacete','Albacete',206),(133,'ES','Alicante','Alicante',206),(134,'ES','Almeria','Almeria',206),(135,'ES','Asturias','Asturias',206),(136,'ES','Avila','Avila',206),(137,'ES','Badajoz','Badajoz',206),(138,'ES','Baleares','Baleares',206),(139,'ES','Barcelona','Barcelona',206),(140,'ES','Burgos','Burgos',206),(141,'ES','Caceres','Caceres',206),(142,'ES','Cadiz','Cadiz',206),(143,'ES','Cantabria','Cantabria',206),(144,'ES','Castellon','Castellon',206),(145,'ES','Ceuta','Ceuta',206),(146,'ES','Ciudad Real','Ciudad Real',206),(147,'ES','Cordoba','Cordoba',206),(148,'ES','Cuenca','Cuenca',206),(149,'ES','Girona','Girona',206),(150,'ES','Granada','Granada',206),(151,'ES','Guadalajara','Guadalajara',206),(152,'ES','Guipuzcoa','Guipuzcoa',206),(153,'ES','Huelva','Huelva',206),(154,'ES','Huesca','Huesca',206),(155,'ES','Jaen','Jaen',206),(156,'ES','La Rioja','La Rioja',206),(157,'ES','Las Palmas','Las Palmas',206),(158,'ES','Leon','Leon',206),(159,'ES','Lleida','Lleida',206),(160,'ES','Lugo','Lugo',206),(161,'ES','Madrid','Madrid',206),(162,'ES','Malaga','Malaga',206),(163,'ES','Melilla','Melilla',206),(164,'ES','Murcia','Murcia',206),(165,'ES','Navarra','Navarra',206),(166,'ES','Ourense','Ourense',206),(167,'ES','Palencia','Palencia',206),(168,'ES','Pontevedra','Pontevedra',206),(169,'ES','Salamanca','Salamanca',206),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife',206),(171,'ES','Segovia','Segovia',206),(172,'ES','Sevilla','Sevilla',206),(173,'ES','Soria','Soria',206),(174,'ES','Tarragona','Tarragona',206),(175,'ES','Teruel','Teruel',206),(176,'ES','Toledo','Toledo',206),(177,'ES','Valencia','Valencia',206),(178,'ES','Valladolid','Valladolid',206),(179,'ES','Vizcaya','Vizcaya',206),(180,'ES','Zamora','Zamora',206),(181,'ES','Zaragoza','Zaragoza',206),(182,'FR','1','Ain',81),(183,'FR','2','Aisne',81),(184,'FR','3','Allier',81),(185,'FR','4','Alpes-de-Haute-Provence',81),(186,'FR','5','Hautes-Alpes',81),(187,'FR','6','Alpes-Maritimes',81),(188,'FR','7','Ardèche',81),(189,'FR','8','Ardennes',81),(190,'FR','9','Ariège',81),(191,'FR','10','Aube',81),(192,'FR','11','Aude',81),(193,'FR','12','Aveyron',81),(194,'FR','13','Bouches-du-Rhône',81),(195,'FR','14','Calvados',81),(196,'FR','15','Cantal',81),(197,'FR','16','Charente',81),(198,'FR','17','Charente-Maritime',81),(199,'FR','18','Cher',81),(200,'FR','19','Corrèze',81),(201,'FR','2A','Corse-du-Sud',81),(202,'FR','2B','Haute-Corse',81),(203,'FR','21','Côte-d\'Or',81),(204,'FR','22','Côtes-d\'Armor',81),(205,'FR','23','Creuse',81),(206,'FR','24','Dordogne',81),(207,'FR','25','Doubs',81),(208,'FR','26','Drôme',81),(209,'FR','27','Eure',81),(210,'FR','28','Eure-et-Loir',81),(211,'FR','29','Finistère',81),(212,'FR','30','Gard',81),(213,'FR','31','Haute-Garonne',81),(214,'FR','32','Gers',81),(215,'FR','33','Gironde',81),(216,'FR','34','Hérault',81),(217,'FR','35','Ille-et-Vilaine',81),(218,'FR','36','Indre',81),(219,'FR','37','Indre-et-Loire',81),(220,'FR','38','Isère',81),(221,'FR','39','Jura',81),(222,'FR','40','Landes',81),(223,'FR','41','Loir-et-Cher',81),(224,'FR','42','Loire',81),(225,'FR','43','Haute-Loire',81),(226,'FR','44','Loire-Atlantique',81),(227,'FR','45','Loiret',81),(228,'FR','46','Lot',81),(229,'FR','47','Lot-et-Garonne',81),(230,'FR','48','Lozère',81),(231,'FR','49','Maine-et-Loire',81),(232,'FR','50','Manche',81),(233,'FR','51','Marne',81),(234,'FR','52','Haute-Marne',81),(235,'FR','53','Mayenne',81),(236,'FR','54','Meurthe-et-Moselle',81),(237,'FR','55','Meuse',81),(238,'FR','56','Morbihan',81),(239,'FR','57','Moselle',81),(240,'FR','58','Nièvre',81),(241,'FR','59','Nord',81),(242,'FR','60','Oise',81),(243,'FR','61','Orne',81),(244,'FR','62','Pas-de-Calais',81),(245,'FR','63','Puy-de-Dôme',81),(246,'FR','64','Pyrénées-Atlantiques',81),(247,'FR','65','Hautes-Pyrénées',81),(248,'FR','66','Pyrénées-Orientales',81),(249,'FR','67','Bas-Rhin',81),(250,'FR','68','Haut-Rhin',81),(251,'FR','69','Rhône',81),(252,'FR','70','Haute-Saône',81),(253,'FR','71','Saône-et-Loire',81),(254,'FR','72','Sarthe',81),(255,'FR','73','Savoie',81),(256,'FR','74','Haute-Savoie',81),(257,'FR','75','Paris',81),(258,'FR','76','Seine-Maritime',81),(259,'FR','77','Seine-et-Marne',81),(260,'FR','78','Yvelines',81),(261,'FR','79','Deux-Sèvres',81),(262,'FR','80','Somme',81),(263,'FR','81','Tarn',81),(264,'FR','82','Tarn-et-Garonne',81),(265,'FR','83','Var',81),(266,'FR','84','Vaucluse',81),(267,'FR','85','Vendée',81),(268,'FR','86','Vienne',81),(269,'FR','87','Haute-Vienne',81),(270,'FR','88','Vosges',81),(271,'FR','89','Yonne',81),(272,'FR','90','Territoire-de-Belfort',81),(273,'FR','91','Essonne',81),(274,'FR','92','Hauts-de-Seine',81),(275,'FR','93','Seine-Saint-Denis',81),(276,'FR','94','Val-de-Marne',81),(277,'FR','95','Val-d\'Oise',81),(278,'RO','AB','Alba',185),(279,'RO','AR','Arad',185),(280,'RO','AG','Argeş',185),(281,'RO','BC','Bacău',185),(282,'RO','BH','Bihor',185),(283,'RO','BN','Bistriţa-Năsăud',185),(284,'RO','BT','Botoşani',185),(285,'RO','BV','Braşov',185),(286,'RO','BR','Brăila',185),(287,'RO','B','Bucureşti',185),(288,'RO','BZ','Buzău',185),(289,'RO','CS','Caraş-Severin',185),(290,'RO','CL','Călăraşi',185),(291,'RO','CJ','Cluj',185),(292,'RO','CT','Constanţa',185),(293,'RO','CV','Covasna',185),(294,'RO','DB','Dâmboviţa',185),(295,'RO','DJ','Dolj',185),(296,'RO','GL','Galaţi',185),(297,'RO','GR','Giurgiu',185),(298,'RO','GJ','Gorj',185),(299,'RO','HR','Harghita',185),(300,'RO','HD','Hunedoara',185),(301,'RO','IL','Ialomiţa',185),(302,'RO','IS','Iaşi',185),(303,'RO','IF','Ilfov',185),(304,'RO','MM','Maramureş',185),(305,'RO','MH','Mehedinţi',185),(306,'RO','MS','Mureş',185),(307,'RO','NT','Neamţ',185),(308,'RO','OT','Olt',185),(309,'RO','PH','Prahova',185),(310,'RO','SM','Satu-Mare',185),(311,'RO','SJ','Sălaj',185),(312,'RO','SB','Sibiu',185),(313,'RO','SV','Suceava',185),(314,'RO','TR','Teleorman',185),(315,'RO','TM','Timiş',185),(316,'RO','TL','Tulcea',185),(317,'RO','VS','Vaslui',185),(318,'RO','VL','Vâlcea',185),(319,'RO','VN','Vrancea',185),(320,'FI','Lappi','Lappi',80),(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa',80),(322,'FI','Kainuu','Kainuu',80),(323,'FI','Pohjois-Karjala','Pohjois-Karjala',80),(324,'FI','Pohjois-Savo','Pohjois-Savo',80),(325,'FI','Etelä-Savo','Etelä-Savo',80),(326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa',80),(327,'FI','Pohjanmaa','Pohjanmaa',80),(328,'FI','Pirkanmaa','Pirkanmaa',80),(329,'FI','Satakunta','Satakunta',80),(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa',80),(331,'FI','Keski-Suomi','Keski-Suomi',80),(332,'FI','Varsinais-Suomi','Varsinais-Suomi',80),(333,'FI','Etelä-Karjala','Etelä-Karjala',80),(334,'FI','Päijät-Häme','Päijät-Häme',80),(335,'FI','Kanta-Häme','Kanta-Häme',80),(336,'FI','Uusimaa','Uusimaa',80),(337,'FI','Itä-Uusimaa','Itä-Uusimaa',80),(338,'FI','Kymenlaakso','Kymenlaakso',80),(339,'FI','Ahvenanmaa','Ahvenanmaa',80),(340,'EE','EE-37','Harjumaa',74),(341,'EE','EE-39','Hiiumaa',74),(342,'EE','EE-44','Ida-Virumaa',74),(343,'EE','EE-49','Jõgevamaa',74),(344,'EE','EE-51','Järvamaa',74),(345,'EE','EE-57','Läänemaa',74),(346,'EE','EE-59','Lääne-Virumaa',74),(347,'EE','EE-65','Põlvamaa',74),(348,'EE','EE-67','Pärnumaa',74),(349,'EE','EE-70','Raplamaa',74),(350,'EE','EE-74','Saaremaa',74),(351,'EE','EE-78','Tartumaa',74),(352,'EE','EE-82','Valgamaa',74),(353,'EE','EE-84','Viljandimaa',74),(354,'EE','EE-86','Võrumaa',74),(355,'LV','LV-DGV','Daugavpils',125),(356,'LV','LV-JEL','Jelgava',125),(357,'LV','Jēkabpils','Jēkabpils',125),(358,'LV','LV-JUR','Jūrmala',125),(359,'LV','LV-LPX','Liepāja',125),(360,'LV','LV-LE','Liepājas novads',125),(361,'LV','LV-REZ','Rēzekne',125),(362,'LV','LV-RIX','Rīga',125),(363,'LV','LV-RI','Rīgas novads',125),(364,'LV','Valmiera','Valmiera',125),(365,'LV','LV-VEN','Ventspils',125),(366,'LV','Aglonas novads','Aglonas novads',125),(367,'LV','LV-AI','Aizkraukles novads',125),(368,'LV','Aizputes novads','Aizputes novads',125),(369,'LV','Aknīstes novads','Aknīstes novads',125),(370,'LV','Alojas novads','Alojas novads',125),(371,'LV','Alsungas novads','Alsungas novads',125),(372,'LV','LV-AL','Alūksnes novads',125),(373,'LV','Amatas novads','Amatas novads',125),(374,'LV','Apes novads','Apes novads',125),(375,'LV','Auces novads','Auces novads',125),(376,'LV','Babītes novads','Babītes novads',125),(377,'LV','Baldones novads','Baldones novads',125),(378,'LV','Baltinavas novads','Baltinavas novads',125),(379,'LV','LV-BL','Balvu novads',125),(380,'LV','LV-BU','Bauskas novads',125),(381,'LV','Beverīnas novads','Beverīnas novads',125),(382,'LV','Brocēnu novads','Brocēnu novads',125),(383,'LV','Burtnieku novads','Burtnieku novads',125),(384,'LV','Carnikavas novads','Carnikavas novads',125),(385,'LV','Cesvaines novads','Cesvaines novads',125),(386,'LV','Ciblas novads','Ciblas novads',125),(387,'LV','LV-CE','Cēsu novads',125),(388,'LV','Dagdas novads','Dagdas novads',125),(389,'LV','LV-DA','Daugavpils novads',125),(390,'LV','LV-DO','Dobeles novads',125),(391,'LV','Dundagas novads','Dundagas novads',125),(392,'LV','Durbes novads','Durbes novads',125),(393,'LV','Engures novads','Engures novads',125),(394,'LV','Garkalnes novads','Garkalnes novads',125),(395,'LV','Grobiņas novads','Grobiņas novads',125),(396,'LV','LV-GU','Gulbenes novads',125),(397,'LV','Iecavas novads','Iecavas novads',125),(398,'LV','Ikšķiles novads','Ikšķiles novads',125),(399,'LV','Ilūkstes novads','Ilūkstes novads',125),(400,'LV','Inčukalna novads','Inčukalna novads',125),(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads',125),(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads',125),(403,'LV','Jaunpils novads','Jaunpils novads',125),(404,'LV','LV-JL','Jelgavas novads',125),(405,'LV','LV-JK','Jēkabpils novads',125),(406,'LV','Kandavas novads','Kandavas novads',125),(407,'LV','Kokneses novads','Kokneses novads',125),(408,'LV','Krimuldas novads','Krimuldas novads',125),(409,'LV','Krustpils novads','Krustpils novads',125),(410,'LV','LV-KR','Krāslavas novads',125),(411,'LV','LV-KU','Kuldīgas novads',125),(412,'LV','Kārsavas novads','Kārsavas novads',125),(413,'LV','Lielvārdes novads','Lielvārdes novads',125),(414,'LV','LV-LM','Limbažu novads',125),(415,'LV','Lubānas novads','Lubānas novads',125),(416,'LV','LV-LU','Ludzas novads',125),(417,'LV','Līgatnes novads','Līgatnes novads',125),(418,'LV','Līvānu novads','Līvānu novads',125),(419,'LV','LV-MA','Madonas novads',125),(420,'LV','Mazsalacas novads','Mazsalacas novads',125),(421,'LV','Mālpils novads','Mālpils novads',125),(422,'LV','Mārupes novads','Mārupes novads',125),(423,'LV','Naukšēnu novads','Naukšēnu novads',125),(424,'LV','Neretas novads','Neretas novads',125),(425,'LV','Nīcas novads','Nīcas novads',125),(426,'LV','LV-OG','Ogres novads',125),(427,'LV','Olaines novads','Olaines novads',125),(428,'LV','Ozolnieku novads','Ozolnieku novads',125),(429,'LV','LV-PR','Preiļu novads',125),(430,'LV','Priekules novads','Priekules novads',125),(431,'LV','Priekuļu novads','Priekuļu novads',125),(432,'LV','Pārgaujas novads','Pārgaujas novads',125),(433,'LV','Pāvilostas novads','Pāvilostas novads',125),(434,'LV','Pļaviņu novads','Pļaviņu novads',125),(435,'LV','Raunas novads','Raunas novads',125),(436,'LV','Riebiņu novads','Riebiņu novads',125),(437,'LV','Rojas novads','Rojas novads',125),(438,'LV','Ropažu novads','Ropažu novads',125),(439,'LV','Rucavas novads','Rucavas novads',125),(440,'LV','Rugāju novads','Rugāju novads',125),(441,'LV','Rundāles novads','Rundāles novads',125),(442,'LV','LV-RE','Rēzeknes novads',125),(443,'LV','Rūjienas novads','Rūjienas novads',125),(444,'LV','Salacgrīvas novads','Salacgrīvas novads',125),(445,'LV','Salas novads','Salas novads',125),(446,'LV','Salaspils novads','Salaspils novads',125),(447,'LV','LV-SA','Saldus novads',125),(448,'LV','Saulkrastu novads','Saulkrastu novads',125),(449,'LV','Siguldas novads','Siguldas novads',125),(450,'LV','Skrundas novads','Skrundas novads',125),(451,'LV','Skrīveru novads','Skrīveru novads',125),(452,'LV','Smiltenes novads','Smiltenes novads',125),(453,'LV','Stopiņu novads','Stopiņu novads',125),(454,'LV','Strenču novads','Strenču novads',125),(455,'LV','Sējas novads','Sējas novads',125),(456,'LV','LV-TA','Talsu novads',125),(457,'LV','LV-TU','Tukuma novads',125),(458,'LV','Tērvetes novads','Tērvetes novads',125),(459,'LV','Vaiņodes novads','Vaiņodes novads',125),(460,'LV','LV-VK','Valkas novads',125),(461,'LV','LV-VM','Valmieras novads',125),(462,'LV','Varakļānu novads','Varakļānu novads',125),(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads',125),(464,'LV','Vecumnieku novads','Vecumnieku novads',125),(465,'LV','LV-VE','Ventspils novads',125),(466,'LV','Viesītes novads','Viesītes novads',125),(467,'LV','Viļakas novads','Viļakas novads',125),(468,'LV','Viļānu novads','Viļānu novads',125),(469,'LV','Vārkavas novads','Vārkavas novads',125),(470,'LV','Zilupes novads','Zilupes novads',125),(471,'LV','Ādažu novads','Ādažu novads',125),(472,'LV','Ērgļu novads','Ērgļu novads',125),(473,'LV','Ķeguma novads','Ķeguma novads',125),(474,'LV','Ķekavas novads','Ķekavas novads',125),(475,'LT','LT-AL','Alytaus Apskritis',131),(476,'LT','LT-KU','Kauno Apskritis',131),(477,'LT','LT-KL','Klaipėdos Apskritis',131),(478,'LT','LT-MR','Marijampolės Apskritis',131),(479,'LT','LT-PN','Panevėžio Apskritis',131),(480,'LT','LT-SA','Šiaulių Apskritis',131),(481,'LT','LT-TA','Tauragės Apskritis',131),(482,'LT','LT-TE','Telšių Apskritis',131),(483,'LT','LT-UT','Utenos Apskritis',131),(484,'LT','LT-VL','Vilniaus Apskritis',131),(485,'BR','AC','Acre',31),(486,'BR','AL','Alagoas',31),(487,'BR','AP','Amapá',31),(488,'BR','AM','Amazonas',31),(489,'BR','BA','Bahia',31),(490,'BR','CE','Ceará',31),(491,'BR','ES','Espírito Santo',31),(492,'BR','GO','Goiás',31),(493,'BR','MA','Maranhão',31),(494,'BR','MT','Mato Grosso',31),(495,'BR','MS','Mato Grosso do Sul',31),(496,'BR','MG','Minas Gerais',31),(497,'BR','PA','Pará',31),(498,'BR','PB','Paraíba',31),(499,'BR','PR','Paraná',31),(500,'BR','PE','Pernambuco',31),(501,'BR','PI','Piauí',31),(502,'BR','RJ','Rio de Janeiro',31),(503,'BR','RN','Rio Grande do Norte',31),(504,'BR','RS','Rio Grande do Sul',31),(505,'BR','RO','Rondônia',31),(506,'BR','RR','Roraima',31),(507,'BR','SC','Santa Catarina',31),(508,'BR','SP','São Paulo',31),(509,'BR','SE','Sergipe',31),(510,'BR','TO','Tocantins',31),(511,'BR','DF','Distrito Federal',31),(512,'HR','HR-01','Zagrebačka županija',59),(513,'HR','HR-02','Krapinsko-zagorska županija',59),(514,'HR','HR-03','Sisačko-moslavačka županija',59),(515,'HR','HR-04','Karlovačka županija',59),(516,'HR','HR-05','Varaždinska županija',59),(517,'HR','HR-06','Koprivničko-križevačka županija',59),(518,'HR','HR-07','Bjelovarsko-bilogorska županija',59),(519,'HR','HR-08','Primorsko-goranska županija',59),(520,'HR','HR-09','Ličko-senjska županija',59),(521,'HR','HR-10','Virovitičko-podravska županija',59),(522,'HR','HR-11','Požeško-slavonska županija',59),(523,'HR','HR-12','Brodsko-posavska županija',59),(524,'HR','HR-13','Zadarska županija',59),(525,'HR','HR-14','Osječko-baranjska županija',59),(526,'HR','HR-15','Šibensko-kninska županija',59),(527,'HR','HR-16','Vukovarsko-srijemska županija',59),(528,'HR','HR-17','Splitsko-dalmatinska županija',59),(529,'HR','HR-18','Istarska županija',59),(530,'HR','HR-19','Dubrovačko-neretvanska županija',59),(531,'HR','HR-20','Međimurska županija',59),(532,'HR','HR-21','Grad Zagreb',59),(533,'IN','AN','Andaman and Nicobar Islands',106),(534,'IN','AP','Andhra Pradesh',106),(535,'IN','AR','Arunachal Pradesh',106),(536,'IN','AS','Assam',106),(537,'IN','BR','Bihar',106),(538,'IN','CH','Chandigarh',106),(539,'IN','CT','Chhattisgarh',106),(540,'IN','DN','Dadra and Nagar Haveli',106),(541,'IN','DD','Daman and Diu',106),(542,'IN','DL','Delhi',106),(543,'IN','GA','Goa',106),(544,'IN','GJ','Gujarat',106),(545,'IN','HR','Haryana',106),(546,'IN','HP','Himachal Pradesh',106),(547,'IN','JK','Jammu and Kashmir',106),(548,'IN','JH','Jharkhand',106),(549,'IN','KA','Karnataka',106),(550,'IN','KL','Kerala',106),(551,'IN','LD','Lakshadweep',106),(552,'IN','MP','Madhya Pradesh',106),(553,'IN','MH','Maharashtra',106),(554,'IN','MN','Manipur',106),(555,'IN','ML','Meghalaya',106),(556,'IN','MZ','Mizoram',106),(557,'IN','NL','Nagaland',106),(558,'IN','OR','Odisha',106),(559,'IN','PY','Puducherry',106),(560,'IN','PB','Punjab',106),(561,'IN','RJ','Rajasthan',106),(562,'IN','SK','Sikkim',106),(563,'IN','TN','Tamil Nadu',106),(564,'IN','TG','Telangana',106),(565,'IN','TR','Tripura',106),(566,'IN','UP','Uttar Pradesh',106),(567,'IN','UT','Uttarakhand',106),(568,'IN','WB','West Bengal',106),(569,'PY','PY-16','Alto Paraguay',176),(570,'PY','PY-10','Alto Paraná',176),(571,'PY','PY-13','Amambay',176),(572,'PY','PY-ASU','Asunción',176),(573,'PY','PY-19','Boquerón',176),(574,'PY','PY-5','Caaguazú',176),(575,'PY','PY-6','Caazapá',176),(576,'PY','PY-14','Canindeyú',176),(577,'PY','PY-11','Central',176),(578,'PY','PY-1','Concepción',176),(579,'PY','PY-3','Cordillera',176),(580,'PY','PY-4','Guairá',176),(581,'PY','PY-7','Itapúa',176),(582,'PY','PY-8','Misiones',176),(583,'PY','PY-9','Paraguarí',176),(584,'PY','PY-15','Presidente Hayes',176),(585,'PY','PY-2','San Pedro',176),(586,'PY','PY-12','Ñeembucú',176);
/*!40000 ALTER TABLE `country_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_translations`
--

DROP TABLE IF EXISTS `country_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `country_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2041 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_translations`
--

LOCK TABLES `country_translations` WRITE;
/*!40000 ALTER TABLE `country_translations` DISABLE KEYS */;
INSERT INTO `country_translations` VALUES (1021,'ar','أفغانستان',1),(1022,'ar','جزر آلاند',2),(1023,'ar','ألبانيا',3),(1024,'ar','الجزائر',4),(1025,'ar','ساموا الأمريكية',5),(1026,'ar','أندورا',6),(1027,'ar','أنغولا',7),(1028,'ar','أنغيلا',8),(1029,'ar','القارة القطبية الجنوبية',9),(1030,'ar','أنتيغوا وبربودا',10),(1031,'ar','الأرجنتين',11),(1032,'ar','أرمينيا',12),(1033,'ar','أروبا',13),(1034,'ar','جزيرة الصعود',14),(1035,'ar','أستراليا',15),(1036,'ar','النمسا',16),(1037,'ar','أذربيجان',17),(1038,'ar','الباهاما',18),(1039,'ar','البحرين',19),(1040,'ar','بنغلاديش',20),(1041,'ar','بربادوس',21),(1042,'ar','روسيا البيضاء',22),(1043,'ar','بلجيكا',23),(1044,'ar','بليز',24),(1045,'ar','بنين',25),(1046,'ar','برمودا',26),(1047,'ar','بوتان',27),(1048,'ar','بوليفيا',28),(1049,'ar','البوسنة والهرسك',29),(1050,'ar','بوتسوانا',30),(1051,'ar','البرازيل',31),(1052,'ar','إقليم المحيط البريطاني الهندي',32),(1053,'ar','جزر فيرجن البريطانية',33),(1054,'ar','بروناي',34),(1055,'ar','بلغاريا',35),(1056,'ar','بوركينا فاسو',36),(1057,'ar','بوروندي',37),(1058,'ar','كمبوديا',38),(1059,'ar','الكاميرون',39),(1060,'ar','كندا',40),(1061,'ar','جزر الكناري',41),(1062,'ar','الرأس الأخضر',42),(1063,'ar','الكاريبي هولندا',43),(1064,'ar','جزر كايمان',44),(1065,'ar','جمهورية افريقيا الوسطى',45),(1066,'ar','سبتة ومليلية',46),(1067,'ar','تشاد',47),(1068,'ar','تشيلي',48),(1069,'ar','الصين',49),(1070,'ar','جزيرة الكريسماس',50),(1071,'ar','جزر كوكوس (كيلينغ)',51),(1072,'ar','كولومبيا',52),(1073,'ar','جزر القمر',53),(1074,'ar','الكونغو - برازافيل',54),(1075,'ar','الكونغو - كينشاسا',55),(1076,'ar','جزر كوك',56),(1077,'ar','كوستاريكا',57),(1078,'ar','ساحل العاج',58),(1079,'ar','كرواتيا',59),(1080,'ar','كوبا',60),(1081,'ar','كوراساو',61),(1082,'ar','قبرص',62),(1083,'ar','التشيك',63),(1084,'ar','الدنمارك',64),(1085,'ar','دييغو غارسيا',65),(1086,'ar','جيبوتي',66),(1087,'ar','دومينيكا',67),(1088,'ar','جمهورية الدومنيكان',68),(1089,'ar','الإكوادور',69),(1090,'ar','مصر',70),(1091,'ar','السلفادور',71),(1092,'ar','غينيا الإستوائية',72),(1093,'ar','إريتريا',73),(1094,'ar','استونيا',74),(1095,'ar','أثيوبيا',75),(1096,'ar','منطقة اليورو',76),(1097,'ar','جزر فوكلاند',77),(1098,'ar','جزر فاروس',78),(1099,'ar','فيجي',79),(1100,'ar','فنلندا',80),(1101,'ar','فرنسا',81),(1102,'ar','غيانا الفرنسية',82),(1103,'ar','بولينيزيا الفرنسية',83),(1104,'ar','المناطق الجنوبية لفرنسا',84),(1105,'ar','الغابون',85),(1106,'ar','غامبيا',86),(1107,'ar','جورجيا',87),(1108,'ar','ألمانيا',88),(1109,'ar','غانا',89),(1110,'ar','جبل طارق',90),(1111,'ar','اليونان',91),(1112,'ar','الأرض الخضراء',92),(1113,'ar','غرينادا',93),(1114,'ar','جوادلوب',94),(1115,'ar','غوام',95),(1116,'ar','غواتيمالا',96),(1117,'ar','غيرنسي',97),(1118,'ar','غينيا',98),(1119,'ar','غينيا بيساو',99),(1120,'ar','غيانا',100),(1121,'ar','هايتي',101),(1122,'ar','هندوراس',102),(1123,'ar','هونج كونج SAR الصين',103),(1124,'ar','هنغاريا',104),(1125,'ar','أيسلندا',105),(1126,'ar','الهند',106),(1127,'ar','إندونيسيا',107),(1128,'ar','إيران',108),(1129,'ar','العراق',109),(1130,'ar','أيرلندا',110),(1131,'ar','جزيرة آيل أوف مان',111),(1132,'ar','إسرائيل',112),(1133,'ar','إيطاليا',113),(1134,'ar','جامايكا',114),(1135,'ar','اليابان',115),(1136,'ar','جيرسي',116),(1137,'ar','الأردن',117),(1138,'ar','كازاخستان',118),(1139,'ar','كينيا',119),(1140,'ar','كيريباس',120),(1141,'ar','كوسوفو',121),(1142,'ar','الكويت',122),(1143,'ar','قرغيزستان',123),(1144,'ar','لاوس',124),(1145,'ar','لاتفيا',125),(1146,'ar','لبنان',126),(1147,'ar','ليسوتو',127),(1148,'ar','ليبيريا',128),(1149,'ar','ليبيا',129),(1150,'ar','ليختنشتاين',130),(1151,'ar','ليتوانيا',131),(1152,'ar','لوكسمبورغ',132),(1153,'ar','ماكاو SAR الصين',133),(1154,'ar','مقدونيا',134),(1155,'ar','مدغشقر',135),(1156,'ar','مالاوي',136),(1157,'ar','ماليزيا',137),(1158,'ar','جزر المالديف',138),(1159,'ar','مالي',139),(1160,'ar','مالطا',140),(1161,'ar','جزر مارشال',141),(1162,'ar','مارتينيك',142),(1163,'ar','موريتانيا',143),(1164,'ar','موريشيوس',144),(1165,'ar','ضائع',145),(1166,'ar','المكسيك',146),(1167,'ar','ميكرونيزيا',147),(1168,'ar','مولدوفا',148),(1169,'ar','موناكو',149),(1170,'ar','منغوليا',150),(1171,'ar','الجبل الأسود',151),(1172,'ar','مونتسيرات',152),(1173,'ar','المغرب',153),(1174,'ar','موزمبيق',154),(1175,'ar','ميانمار (بورما)',155),(1176,'ar','ناميبيا',156),(1177,'ar','ناورو',157),(1178,'ar','نيبال',158),(1179,'ar','نيبال',159),(1180,'ar','كاليدونيا الجديدة',160),(1181,'ar','نيوزيلاندا',161),(1182,'ar','نيكاراغوا',162),(1183,'ar','النيجر',163),(1184,'ar','نيجيريا',164),(1185,'ar','نيوي',165),(1186,'ar','جزيرة نورفولك',166),(1187,'ar','كوريا الشماليه',167),(1188,'ar','جزر مريانا الشمالية',168),(1189,'ar','النرويج',169),(1190,'ar','سلطنة عمان',170),(1191,'ar','باكستان',171),(1192,'ar','بالاو',172),(1193,'ar','الاراضي الفلسطينية',173),(1194,'ar','بناما',174),(1195,'ar','بابوا غينيا الجديدة',175),(1196,'ar','باراغواي',176),(1197,'ar','بيرو',177),(1198,'ar','الفلبين',178),(1199,'ar','جزر بيتكيرن',179),(1200,'ar','بولندا',180),(1201,'ar','البرتغال',181),(1202,'ar','بورتوريكو',182),(1203,'ar','دولة قطر',183),(1204,'ar','جمع شمل',184),(1205,'ar','رومانيا',185),(1206,'ar','روسيا',186),(1207,'ar','رواندا',187),(1208,'ar','ساموا',188),(1209,'ar','سان مارينو',189),(1210,'ar','سانت كيتس ونيفيس',190),(1211,'ar','المملكة العربية السعودية',191),(1212,'ar','السنغال',192),(1213,'ar','صربيا',193),(1214,'ar','سيشيل',194),(1215,'ar','سيراليون',195),(1216,'ar','سنغافورة',196),(1217,'ar','سينت مارتن',197),(1218,'ar','سلوفاكيا',198),(1219,'ar','سلوفينيا',199),(1220,'ar','جزر سليمان',200),(1221,'ar','الصومال',201),(1222,'ar','جنوب أفريقيا',202),(1223,'ar','جورجيا الجنوبية وجزر ساندويتش الجنوبية',203),(1224,'ar','كوريا الجنوبية',204),(1225,'ar','جنوب السودان',205),(1226,'ar','إسبانيا',206),(1227,'ar','سيريلانكا',207),(1228,'ar','سانت بارتيليمي',208),(1229,'ar','سانت هيلانة',209),(1230,'ar','سانت كيتس ونيفيس',210),(1231,'ar','شارع لوسيا',211),(1232,'ar','سانت مارتن',212),(1233,'ar','سانت بيير وميكلون',213),(1234,'ar','سانت فنسنت وجزر غرينادين',214),(1235,'ar','السودان',215),(1236,'ar','سورينام',216),(1237,'ar','سفالبارد وجان ماين',217),(1238,'ar','سوازيلاند',218),(1239,'ar','السويد',219),(1240,'ar','سويسرا',220),(1241,'ar','سوريا',221),(1242,'ar','تايوان',222),(1243,'ar','طاجيكستان',223),(1244,'ar','تنزانيا',224),(1245,'ar','تايلاند',225),(1246,'ar','تيمور',226),(1247,'ar','توجو',227),(1248,'ar','توكيلاو',228),(1249,'ar','تونغا',229),(1250,'ar','ترينيداد وتوباغو',230),(1251,'ar','تريستان دا كونها',231),(1252,'ar','تونس',232),(1253,'ar','ديك رومي',233),(1254,'ar','تركمانستان',234),(1255,'ar','جزر تركس وكايكوس',235),(1256,'ar','توفالو',236),(1257,'ar','جزر الولايات المتحدة البعيدة',237),(1258,'ar','جزر فيرجن الأمريكية',238),(1259,'ar','أوغندا',239),(1260,'ar','أوكرانيا',240),(1261,'ar','الإمارات العربية المتحدة',241),(1262,'ar','المملكة المتحدة',242),(1263,'ar','الأمم المتحدة',243),(1264,'ar','الولايات المتحدة الأمريكية',244),(1265,'ar','أوروغواي',245),(1266,'ar','أوزبكستان',246),(1267,'ar','فانواتو',247),(1268,'ar','مدينة الفاتيكان',248),(1269,'ar','فنزويلا',249),(1270,'ar','فيتنام',250),(1271,'ar','واليس وفوتونا',251),(1272,'ar','الصحراء الغربية',252),(1273,'ar','اليمن',253),(1274,'ar','زامبيا',254),(1275,'ar','زيمبابوي',255),(1276,'es','Afganistán',1),(1277,'es','Islas Åland',2),(1278,'es','Albania',3),(1279,'es','Argelia',4),(1280,'es','Samoa Americana',5),(1281,'es','Andorra',6),(1282,'es','Angola',7),(1283,'es','Anguila',8),(1284,'es','Antártida',9),(1285,'es','Antigua y Barbuda',10),(1286,'es','Argentina',11),(1287,'es','Armenia',12),(1288,'es','Aruba',13),(1289,'es','Isla Ascensión',14),(1290,'es','Australia',15),(1291,'es','Austria',16),(1292,'es','Azerbaiyán',17),(1293,'es','Bahamas',18),(1294,'es','Bahrein',19),(1295,'es','Bangladesh',20),(1296,'es','Barbados',21),(1297,'es','Bielorrusia',22),(1298,'es','Bélgica',23),(1299,'es','Belice',24),(1300,'es','Benín',25),(1301,'es','Islas Bermudas',26),(1302,'es','Bhután',27),(1303,'es','Bolivia',28),(1304,'es','Bosnia y Herzegovina',29),(1305,'es','Botsuana',30),(1306,'es','Brasil',31),(1307,'es','Territorio Británico del Océano índico',32),(1308,'es','Islas Vírgenes Británicas',33),(1309,'es','Brunéi',34),(1310,'es','Bulgaria',35),(1311,'es','Burkina Faso',36),(1312,'es','Burundi',37),(1313,'es','Camboya',38),(1314,'es','Camerún',39),(1315,'es','Canadá',40),(1316,'es','Islas Canarias',41),(1317,'es','Cabo Verde',42),(1318,'es','Caribe Neerlandés',43),(1319,'es','Islas Caimán',44),(1320,'es','República Centroafricana',45),(1321,'es','Ceuta y Melilla',46),(1322,'es','Chad',47),(1323,'es','Chile',48),(1324,'es','China',49),(1325,'es','Isla de Navidad',50),(1326,'es','Islas Cocos',51),(1327,'es','Colombia',52),(1328,'es','Comoras',53),(1329,'es','República del Congo',54),(1330,'es','República Democrática del Congo',55),(1331,'es','Islas Cook',56),(1332,'es','Costa Rica',57),(1333,'es','Costa de Marfil',58),(1334,'es','Croacia',59),(1335,'es','Cuba',60),(1336,'es','Curazao',61),(1337,'es','Chipre',62),(1338,'es','República Checa',63),(1339,'es','Dinamarca',64),(1340,'es','Diego García',65),(1341,'es','Yibuti',66),(1342,'es','Dominica',67),(1343,'es','República Dominicana',68),(1344,'es','Ecuador',69),(1345,'es','Egipto',70),(1346,'es','El Salvador',71),(1347,'es','Guinea Ecuatorial',72),(1348,'es','Eritrea',73),(1349,'es','Estonia',74),(1350,'es','Etiopía',75),(1351,'es','Europa',76),(1352,'es','Islas Malvinas',77),(1353,'es','Islas Feroe',78),(1354,'es','Fiyi',79),(1355,'es','Finlandia',80),(1356,'es','Francia',81),(1357,'es','Guayana Francesa',82),(1358,'es','Polinesia Francesa',83),(1359,'es','Territorios Australes y Antárticas Franceses',84),(1360,'es','Gabón',85),(1361,'es','Gambia',86),(1362,'es','Georgia',87),(1363,'es','Alemania',88),(1364,'es','Ghana',89),(1365,'es','Gibraltar',90),(1366,'es','Grecia',91),(1367,'es','Groenlandia',92),(1368,'es','Granada',93),(1369,'es','Guadalupe',94),(1370,'es','Guam',95),(1371,'es','Guatemala',96),(1372,'es','Guernsey',97),(1373,'es','Guinea',98),(1374,'es','Guinea-Bisáu',99),(1375,'es','Guyana',100),(1376,'es','Haití',101),(1377,'es','Honduras',102),(1378,'es','Hong Kong',103),(1379,'es','Hungría',104),(1380,'es','Islandia',105),(1381,'es','India',106),(1382,'es','Indonesia',107),(1383,'es','Irán',108),(1384,'es','Irak',109),(1385,'es','Irlanda',110),(1386,'es','Isla de Man',111),(1387,'es','Israel',112),(1388,'es','Italia',113),(1389,'es','Jamaica',114),(1390,'es','Japón',115),(1391,'es','Jersey',116),(1392,'es','Jordania',117),(1393,'es','Kazajistán',118),(1394,'es','Kenia',119),(1395,'es','Kiribati',120),(1396,'es','Kosovo',121),(1397,'es','Kuwait',122),(1398,'es','Kirguistán',123),(1399,'es','Laos',124),(1400,'es','Letonia',125),(1401,'es','Líbano',126),(1402,'es','Lesoto',127),(1403,'es','Liberia',128),(1404,'es','Libia',129),(1405,'es','Liechtenstein',130),(1406,'es','Lituania',131),(1407,'es','Luxemburgo',132),(1408,'es','Macao',133),(1409,'es','Macedonia',134),(1410,'es','Madagascar',135),(1411,'es','Malaui',136),(1412,'es','Malasia',137),(1413,'es','Maldivas',138),(1414,'es','Malí',139),(1415,'es','Malta',140),(1416,'es','Islas Marshall',141),(1417,'es','Martinica',142),(1418,'es','Mauritania',143),(1419,'es','Mauricio',144),(1420,'es','Mayotte',145),(1421,'es','México',146),(1422,'es','Micronesia',147),(1423,'es','Moldavia',148),(1424,'es','Mónaco',149),(1425,'es','Mongolia',150),(1426,'es','Montenegro',151),(1427,'es','Montserrat',152),(1428,'es','Marruecos',153),(1429,'es','Mozambique',154),(1430,'es','Birmania',155),(1431,'es','Namibia',156),(1432,'es','Nauru',157),(1433,'es','Nepal',158),(1434,'es','Holanda',159),(1435,'es','Nueva Caledonia',160),(1436,'es','Nueva Zelanda',161),(1437,'es','Nicaragua',162),(1438,'es','Níger',163),(1439,'es','Nigeria',164),(1440,'es','Niue',165),(1441,'es','Isla Norfolk',166),(1442,'es','Corea del Norte',167),(1443,'es','Islas Marianas del Norte',168),(1444,'es','Noruega',169),(1445,'es','Omán',170),(1446,'es','Pakistán',171),(1447,'es','Palaos',172),(1448,'es','Palestina',173),(1449,'es','Panamá',174),(1450,'es','Papúa Nueva Guinea',175),(1451,'es','Paraguay',176),(1452,'es','Perú',177),(1453,'es','Filipinas',178),(1454,'es','Islas Pitcairn',179),(1455,'es','Polonia',180),(1456,'es','Portugal',181),(1457,'es','Puerto Rico',182),(1458,'es','Catar',183),(1459,'es','Reunión',184),(1460,'es','Rumania',185),(1461,'es','Rusia',186),(1462,'es','Ruanda',187),(1463,'es','Samoa',188),(1464,'es','San Marino',189),(1465,'es','Santo Tomé y Príncipe',190),(1466,'es','Arabia Saudita',191),(1467,'es','Senegal',192),(1468,'es','Serbia',193),(1469,'es','Seychelles',194),(1470,'es','Sierra Leona',195),(1471,'es','Singapur',196),(1472,'es','San Martín',197),(1473,'es','Eslovaquia',198),(1474,'es','Eslovenia',199),(1475,'es','Islas Salomón',200),(1476,'es','Somalia',201),(1477,'es','Sudáfrica',202),(1478,'es','Islas Georgias del Sur y Sandwich del Sur',203),(1479,'es','Corea del Sur',204),(1480,'es','Sudán del Sur',205),(1481,'es','España',206),(1482,'es','Sri Lanka',207),(1483,'es','San Bartolomé',208),(1484,'es','Santa Elena',209),(1485,'es','San Cristóbal y Nieves',210),(1486,'es','Santa Lucía',211),(1487,'es','San Martín',212),(1488,'es','San Pedro y Miquelón',213),(1489,'es','San Vicente y las Granadinas',214),(1490,'es','Sudán',215),(1491,'es','Surinam',216),(1492,'es','Svalbard y Jan Mayen',217),(1493,'es','Suazilandia',218),(1494,'es','Suecia',219),(1495,'es','Suiza',220),(1496,'es','Siri',221),(1497,'es','Taiwán',222),(1498,'es','Tayikistán',223),(1499,'es','Tanzania',224),(1500,'es','Tailandia',225),(1501,'es','Timor Oriental',226),(1502,'es','Togo',227),(1503,'es','Tokelau',228),(1504,'es','Tonga',229),(1505,'es','Trinidad y Tobago',230),(1506,'es','Tristán de Acuña',231),(1507,'es','Túnez',232),(1508,'es','Turquía',233),(1509,'es','Turkmenistán',234),(1510,'es','Islas Turcas y Caicos',235),(1511,'es','Tuvalu',236),(1512,'es','Islas Ultramarinas Menores de los Estados Unidos',237),(1513,'es','Islas Vírgenes de los Estados Unidos',238),(1514,'es','Uganda',239),(1515,'es','Ucrania',240),(1516,'es','Emiratos árabes Unidos',241),(1517,'es','Reino Unido',242),(1518,'es','Naciones Unidas',243),(1519,'es','Estados Unidos',244),(1520,'es','Uruguay',245),(1521,'es','Uzbekistán',246),(1522,'es','Vanuatu',247),(1523,'es','Ciudad del Vaticano',248),(1524,'es','Venezuela',249),(1525,'es','Vietnam',250),(1526,'es','Wallis y Futuna',251),(1527,'es','Sahara Occidental',252),(1528,'es','Yemen',253),(1529,'es','Zambia',254),(1530,'es','Zimbabue',255),(1531,'fa','افغانستان',1),(1532,'fa','جزایر الند',2),(1533,'fa','آلبانی',3),(1534,'fa','الجزایر',4),(1535,'fa','ساموآ آمریکایی',5),(1536,'fa','آندورا',6),(1537,'fa','آنگولا',7),(1538,'fa','آنگولا',8),(1539,'fa','جنوبگان',9),(1540,'fa','آنتیگوا و باربودا',10),(1541,'fa','آرژانتین',11),(1542,'fa','ارمنستان',12),(1543,'fa','آروبا',13),(1544,'fa','جزیره صعود',14),(1545,'fa','استرالیا',15),(1546,'fa','اتریش',16),(1547,'fa','آذربایجان',17),(1548,'fa','باهاما',18),(1549,'fa','بحرین',19),(1550,'fa','بنگلادش',20),(1551,'fa','باربادوس',21),(1552,'fa','بلاروس',22),(1553,'fa','بلژیک',23),(1554,'fa','بلژیک',24),(1555,'fa','بنین',25),(1556,'fa','برمودا',26),(1557,'fa','بوتان',27),(1558,'fa','بولیوی',28),(1559,'fa','بوسنی و هرزگوین',29),(1560,'fa','بوتسوانا',30),(1561,'fa','برزیل',31),(1562,'fa','قلمرو اقیانوس هند انگلیس',32),(1563,'fa','جزایر ویرجین انگلیس',33),(1564,'fa','برونئی',34),(1565,'fa','بلغارستان',35),(1566,'fa','بورکینا فاسو',36),(1567,'fa','بوروندی',37),(1568,'fa','کامبوج',38),(1569,'fa','کامرون',39),(1570,'fa','کانادا',40),(1571,'fa','جزایر قناری',41),(1572,'fa','کیپ ورد',42),(1573,'fa','کارائیب هلند',43),(1574,'fa','Cayman Islands',44),(1575,'fa','جمهوری آفریقای مرکزی',45),(1576,'fa','سوتا و ملیلا',46),(1577,'fa','چاد',47),(1578,'fa','شیلی',48),(1579,'fa','چین',49),(1580,'fa','جزیره کریسمس',50),(1581,'fa','جزایر کوکو (Keeling)',51),(1582,'fa','کلمبیا',52),(1583,'fa','کومور',53),(1584,'fa','کنگو - برزاویل',54),(1585,'fa','کنگو - کینشاسا',55),(1586,'fa','جزایر کوک',56),(1587,'fa','کاستاریکا',57),(1588,'fa','ساحل عاج',58),(1589,'fa','کرواسی',59),(1590,'fa','کوبا',60),(1591,'fa','کوراسائو',61),(1592,'fa','قبرس',62),(1593,'fa','چک',63),(1594,'fa','دانمارک',64),(1595,'fa','دیگو گارسیا',65),(1596,'fa','جیبوتی',66),(1597,'fa','دومینیکا',67),(1598,'fa','جمهوری دومینیکن',68),(1599,'fa','اکوادور',69),(1600,'fa','مصر',70),(1601,'fa','السالوادور',71),(1602,'fa','گینه استوایی',72),(1603,'fa','اریتره',73),(1604,'fa','استونی',74),(1605,'fa','اتیوپی',75),(1606,'fa','منطقه یورو',76),(1607,'fa','جزایر فالکلند',77),(1608,'fa','جزایر فارو',78),(1609,'fa','فیجی',79),(1610,'fa','فنلاند',80),(1611,'fa','فرانسه',81),(1612,'fa','گویان فرانسه',82),(1613,'fa','پلی‌نزی فرانسه',83),(1614,'fa','سرزمین های جنوبی فرانسه',84),(1615,'fa','گابن',85),(1616,'fa','گامبیا',86),(1617,'fa','جورجیا',87),(1618,'fa','آلمان',88),(1619,'fa','غنا',89),(1620,'fa','جبل الطارق',90),(1621,'fa','یونان',91),(1622,'fa','گرینلند',92),(1623,'fa','گرنادا',93),(1624,'fa','گوادلوپ',94),(1625,'fa','گوام',95),(1626,'fa','گواتمالا',96),(1627,'fa','گورنسی',97),(1628,'fa','گینه',98),(1629,'fa','گینه بیسائو',99),(1630,'fa','گویان',100),(1631,'fa','هائیتی',101),(1632,'fa','هندوراس',102),(1633,'fa','هنگ کنگ SAR چین',103),(1634,'fa','مجارستان',104),(1635,'fa','ایسلند',105),(1636,'fa','هند',106),(1637,'fa','اندونزی',107),(1638,'fa','ایران',108),(1639,'fa','عراق',109),(1640,'fa','ایرلند',110),(1641,'fa','جزیره من',111),(1642,'fa','اسرائيل',112),(1643,'fa','ایتالیا',113),(1644,'fa','جامائیکا',114),(1645,'fa','ژاپن',115),(1646,'fa','پیراهن ورزشی',116),(1647,'fa','اردن',117),(1648,'fa','قزاقستان',118),(1649,'fa','کنیا',119),(1650,'fa','کیریباتی',120),(1651,'fa','کوزوو',121),(1652,'fa','کویت',122),(1653,'fa','قرقیزستان',123),(1654,'fa','لائوس',124),(1655,'fa','لتونی',125),(1656,'fa','لبنان',126),(1657,'fa','لسوتو',127),(1658,'fa','لیبریا',128),(1659,'fa','لیبی',129),(1660,'fa','لیختن اشتاین',130),(1661,'fa','لیتوانی',131),(1662,'fa','لوکزامبورگ',132),(1663,'fa','ماکائو SAR چین',133),(1664,'fa','مقدونیه',134),(1665,'fa','ماداگاسکار',135),(1666,'fa','مالاوی',136),(1667,'fa','مالزی',137),(1668,'fa','مالدیو',138),(1669,'fa','مالی',139),(1670,'fa','مالت',140),(1671,'fa','جزایر مارشال',141),(1672,'fa','مارتینیک',142),(1673,'fa','موریتانی',143),(1674,'fa','موریس',144),(1675,'fa','گمشده',145),(1676,'fa','مکزیک',146),(1677,'fa','میکرونزی',147),(1678,'fa','مولداوی',148),(1679,'fa','موناکو',149),(1680,'fa','مغولستان',150),(1681,'fa','مونته نگرو',151),(1682,'fa','مونتسرات',152),(1683,'fa','مراکش',153),(1684,'fa','موزامبیک',154),(1685,'fa','میانمار (برمه)',155),(1686,'fa','ناميبيا',156),(1687,'fa','نائورو',157),(1688,'fa','نپال',158),(1689,'fa','هلند',159),(1690,'fa','کالدونیای جدید',160),(1691,'fa','نیوزلند',161),(1692,'fa','نیکاراگوئه',162),(1693,'fa','نیجر',163),(1694,'fa','نیجریه',164),(1695,'fa','نیو',165),(1696,'fa','جزیره نورفولک',166),(1697,'fa','کره شمالی',167),(1698,'fa','جزایر ماریانای شمالی',168),(1699,'fa','نروژ',169),(1700,'fa','عمان',170),(1701,'fa','پاکستان',171),(1702,'fa','پالائو',172),(1703,'fa','سرزمین های فلسطینی',173),(1704,'fa','پاناما',174),(1705,'fa','پاپوا گینه نو',175),(1706,'fa','پاراگوئه',176),(1707,'fa','پرو',177),(1708,'fa','فیلیپین',178),(1709,'fa','جزایر پیکریرن',179),(1710,'fa','لهستان',180),(1711,'fa','کشور پرتغال',181),(1712,'fa','پورتوریکو',182),(1713,'fa','قطر',183),(1714,'fa','تجدید دیدار',184),(1715,'fa','رومانی',185),(1716,'fa','روسیه',186),(1717,'fa','رواندا',187),(1718,'fa','ساموآ',188),(1719,'fa','سان مارینو',189),(1720,'fa','سنت کیتس و نوویس',190),(1721,'fa','عربستان سعودی',191),(1722,'fa','سنگال',192),(1723,'fa','صربستان',193),(1724,'fa','سیشل',194),(1725,'fa','سیرالئون',195),(1726,'fa','سنگاپور',196),(1727,'fa','سینت ماارتن',197),(1728,'fa','اسلواکی',198),(1729,'fa','اسلوونی',199),(1730,'fa','جزایر سلیمان',200),(1731,'fa','سومالی',201),(1732,'fa','آفریقای جنوبی',202),(1733,'fa','جزایر جورجیا جنوبی و جزایر ساندویچ جنوبی',203),(1734,'fa','کره جنوبی',204),(1735,'fa','سودان جنوبی',205),(1736,'fa','اسپانیا',206),(1737,'fa','سری لانکا',207),(1738,'fa','سنت بارتلی',208),(1739,'fa','سنت هلنا',209),(1740,'fa','سنت کیتز و نوویس',210),(1741,'fa','سنت لوسیا',211),(1742,'fa','سنت مارتین',212),(1743,'fa','سنت پیر و میکلون',213),(1744,'fa','سنت وینسنت و گرنادینها',214),(1745,'fa','سودان',215),(1746,'fa','سورینام',216),(1747,'fa','اسوالبارد و جان ماین',217),(1748,'fa','سوازیلند',218),(1749,'fa','سوئد',219),(1750,'fa','سوئیس',220),(1751,'fa','سوریه',221),(1752,'fa','تایوان',222),(1753,'fa','تاجیکستان',223),(1754,'fa','تانزانیا',224),(1755,'fa','تایلند',225),(1756,'fa','تیمور-لست',226),(1757,'fa','رفتن',227),(1758,'fa','توکلو',228),(1759,'fa','تونگا',229),(1760,'fa','ترینیداد و توباگو',230),(1761,'fa','تریستان دا کانونا',231),(1762,'fa','تونس',232),(1763,'fa','بوقلمون',233),(1764,'fa','ترکمنستان',234),(1765,'fa','جزایر تورکس و کایکوس',235),(1766,'fa','تووالو',236),(1767,'fa','جزایر دور افتاده ایالات متحده آمریکا',237),(1768,'fa','جزایر ویرجین ایالات متحده',238),(1769,'fa','اوگاندا',239),(1770,'fa','اوکراین',240),(1771,'fa','امارات متحده عربی',241),(1772,'fa','انگلستان',242),(1773,'fa','سازمان ملل',243),(1774,'fa','ایالات متحده',244),(1775,'fa','اروگوئه',245),(1776,'fa','ازبکستان',246),(1777,'fa','وانواتو',247),(1778,'fa','شهر واتیکان',248),(1779,'fa','ونزوئلا',249),(1780,'fa','ویتنام',250),(1781,'fa','والیس و فوتونا',251),(1782,'fa','صحرای غربی',252),(1783,'fa','یمن',253),(1784,'fa','زامبیا',254),(1785,'fa','زیمبابوه',255),(1786,'pt_BR','Afeganistão',1),(1787,'pt_BR','Ilhas Åland',2),(1788,'pt_BR','Albânia',3),(1789,'pt_BR','Argélia',4),(1790,'pt_BR','Samoa Americana',5),(1791,'pt_BR','Andorra',6),(1792,'pt_BR','Angola',7),(1793,'pt_BR','Angola',8),(1794,'pt_BR','Antártico',9),(1795,'pt_BR','Antígua e Barbuda',10),(1796,'pt_BR','Argentina',11),(1797,'pt_BR','Armênia',12),(1798,'pt_BR','Aruba',13),(1799,'pt_BR','Ilha de escalada',14),(1800,'pt_BR','Austrália',15),(1801,'pt_BR','Áustria',16),(1802,'pt_BR','Azerbaijão',17),(1803,'pt_BR','Bahamas',18),(1804,'pt_BR','Bahrain',19),(1805,'pt_BR','Bangladesh',20),(1806,'pt_BR','Barbados',21),(1807,'pt_BR','Bielorrússia',22),(1808,'pt_BR','Bélgica',23),(1809,'pt_BR','Bélgica',24),(1810,'pt_BR','Benin',25),(1811,'pt_BR','Bermuda',26),(1812,'pt_BR','Butão',27),(1813,'pt_BR','Bolívia',28),(1814,'pt_BR','Bósnia e Herzegovina',29),(1815,'pt_BR','Botsuana',30),(1816,'pt_BR','Brasil',31),(1817,'pt_BR','Território Britânico do Oceano Índico',32),(1818,'pt_BR','Ilhas Virgens Britânicas',33),(1819,'pt_BR','Brunei',34),(1820,'pt_BR','Bulgária',35),(1821,'pt_BR','Burkina Faso',36),(1822,'pt_BR','Burundi',37),(1823,'pt_BR','Camboja',38),(1824,'pt_BR','Camarões',39),(1825,'pt_BR','Canadá',40),(1826,'pt_BR','Ilhas Canárias',41),(1827,'pt_BR','Cabo Verde',42),(1828,'pt_BR','Holanda do Caribe',43),(1829,'pt_BR','Ilhas Cayman',44),(1830,'pt_BR','República Centro-Africana',45),(1831,'pt_BR','Ceuta e Melilla',46),(1832,'pt_BR','Chade',47),(1833,'pt_BR','Chile',48),(1834,'pt_BR','China',49),(1835,'pt_BR','Ilha Christmas',50),(1836,'pt_BR','Ilhas Cocos (Keeling)',51),(1837,'pt_BR','Colômbia',52),(1838,'pt_BR','Comores',53),(1839,'pt_BR','Congo - Brazzaville',54),(1840,'pt_BR','Congo - Kinshasa',55),(1841,'pt_BR','Ilhas Cook',56),(1842,'pt_BR','Costa Rica',57),(1843,'pt_BR','Costa do Marfim',58),(1844,'pt_BR','Croácia',59),(1845,'pt_BR','Cuba',60),(1846,'pt_BR','Curaçao',61),(1847,'pt_BR','Chipre',62),(1848,'pt_BR','Czechia',63),(1849,'pt_BR','Dinamarca',64),(1850,'pt_BR','Diego Garcia',65),(1851,'pt_BR','Djibuti',66),(1852,'pt_BR','Dominica',67),(1853,'pt_BR','República Dominicana',68),(1854,'pt_BR','Equador',69),(1855,'pt_BR','Egito',70),(1856,'pt_BR','El Salvador',71),(1857,'pt_BR','Guiné Equatorial',72),(1858,'pt_BR','Eritreia',73),(1859,'pt_BR','Estônia',74),(1860,'pt_BR','Etiópia',75),(1861,'pt_BR','Zona Euro',76),(1862,'pt_BR','Ilhas Malvinas',77),(1863,'pt_BR','Ilhas Faroe',78),(1864,'pt_BR','Fiji',79),(1865,'pt_BR','Finlândia',80),(1866,'pt_BR','França',81),(1867,'pt_BR','Guiana Francesa',82),(1868,'pt_BR','Polinésia Francesa',83),(1869,'pt_BR','Territórios Franceses do Sul',84),(1870,'pt_BR','Gabão',85),(1871,'pt_BR','Gâmbia',86),(1872,'pt_BR','Geórgia',87),(1873,'pt_BR','Alemanha',88),(1874,'pt_BR','Gana',89),(1875,'pt_BR','Gibraltar',90),(1876,'pt_BR','Grécia',91),(1877,'pt_BR','Gronelândia',92),(1878,'pt_BR','Granada',93),(1879,'pt_BR','Guadalupe',94),(1880,'pt_BR','Guam',95),(1881,'pt_BR','Guatemala',96),(1882,'pt_BR','Guernsey',97),(1883,'pt_BR','Guiné',98),(1884,'pt_BR','Guiné-Bissau',99),(1885,'pt_BR','Guiana',100),(1886,'pt_BR','Haiti',101),(1887,'pt_BR','Honduras',102),(1888,'pt_BR','Região Administrativa Especial de Hong Kong, China',103),(1889,'pt_BR','Hungria',104),(1890,'pt_BR','Islândia',105),(1891,'pt_BR','Índia',106),(1892,'pt_BR','Indonésia',107),(1893,'pt_BR','Irã',108),(1894,'pt_BR','Iraque',109),(1895,'pt_BR','Irlanda',110),(1896,'pt_BR','Ilha de Man',111),(1897,'pt_BR','Israel',112),(1898,'pt_BR','Itália',113),(1899,'pt_BR','Jamaica',114),(1900,'pt_BR','Japão',115),(1901,'pt_BR','Jersey',116),(1902,'pt_BR','Jordânia',117),(1903,'pt_BR','Cazaquistão',118),(1904,'pt_BR','Quênia',119),(1905,'pt_BR','Quiribati',120),(1906,'pt_BR','Kosovo',121),(1907,'pt_BR','Kuwait',122),(1908,'pt_BR','Quirguistão',123),(1909,'pt_BR','Laos',124),(1910,'pt_BR','Letônia',125),(1911,'pt_BR','Líbano',126),(1912,'pt_BR','Lesoto',127),(1913,'pt_BR','Libéria',128),(1914,'pt_BR','Líbia',129),(1915,'pt_BR','Liechtenstein',130),(1916,'pt_BR','Lituânia',131),(1917,'pt_BR','Luxemburgo',132),(1918,'pt_BR','Macau SAR China',133),(1919,'pt_BR','Macedônia',134),(1920,'pt_BR','Madagascar',135),(1921,'pt_BR','Malawi',136),(1922,'pt_BR','Malásia',137),(1923,'pt_BR','Maldivas',138),(1924,'pt_BR','Mali',139),(1925,'pt_BR','Malta',140),(1926,'pt_BR','Ilhas Marshall',141),(1927,'pt_BR','Martinica',142),(1928,'pt_BR','Mauritânia',143),(1929,'pt_BR','Maurício',144),(1930,'pt_BR','Maiote',145),(1931,'pt_BR','México',146),(1932,'pt_BR','Micronésia',147),(1933,'pt_BR','Moldávia',148),(1934,'pt_BR','Mônaco',149),(1935,'pt_BR','Mongólia',150),(1936,'pt_BR','Montenegro',151),(1937,'pt_BR','Montserrat',152),(1938,'pt_BR','Marrocos',153),(1939,'pt_BR','Moçambique',154),(1940,'pt_BR','Mianmar (Birmânia)',155),(1941,'pt_BR','Namíbia',156),(1942,'pt_BR','Nauru',157),(1943,'pt_BR','Nepal',158),(1944,'pt_BR','Holanda',159),(1945,'pt_BR','Nova Caledônia',160),(1946,'pt_BR','Nova Zelândia',161),(1947,'pt_BR','Nicarágua',162),(1948,'pt_BR','Níger',163),(1949,'pt_BR','Nigéria',164),(1950,'pt_BR','Niue',165),(1951,'pt_BR','Ilha Norfolk',166),(1952,'pt_BR','Coréia do Norte',167),(1953,'pt_BR','Ilhas Marianas do Norte',168),(1954,'pt_BR','Noruega',169),(1955,'pt_BR','Omã',170),(1956,'pt_BR','Paquistão',171),(1957,'pt_BR','Palau',172),(1958,'pt_BR','Territórios Palestinos',173),(1959,'pt_BR','Panamá',174),(1960,'pt_BR','Papua Nova Guiné',175),(1961,'pt_BR','Paraguai',176),(1962,'pt_BR','Peru',177),(1963,'pt_BR','Filipinas',178),(1964,'pt_BR','Ilhas Pitcairn',179),(1965,'pt_BR','Polônia',180),(1966,'pt_BR','Portugal',181),(1967,'pt_BR','Porto Rico',182),(1968,'pt_BR','Catar',183),(1969,'pt_BR','Reunião',184),(1970,'pt_BR','Romênia',185),(1971,'pt_BR','Rússia',186),(1972,'pt_BR','Ruanda',187),(1973,'pt_BR','Samoa',188),(1974,'pt_BR','São Marinho',189),(1975,'pt_BR','São Cristóvão e Nevis',190),(1976,'pt_BR','Arábia Saudita',191),(1977,'pt_BR','Senegal',192),(1978,'pt_BR','Sérvia',193),(1979,'pt_BR','Seychelles',194),(1980,'pt_BR','Serra Leoa',195),(1981,'pt_BR','Cingapura',196),(1982,'pt_BR','São Martinho',197),(1983,'pt_BR','Eslováquia',198),(1984,'pt_BR','Eslovênia',199),(1985,'pt_BR','Ilhas Salomão',200),(1986,'pt_BR','Somália',201),(1987,'pt_BR','África do Sul',202),(1988,'pt_BR','Ilhas Geórgia do Sul e Sandwich do Sul',203),(1989,'pt_BR','Coréia do Sul',204),(1990,'pt_BR','Sudão do Sul',205),(1991,'pt_BR','Espanha',206),(1992,'pt_BR','Sri Lanka',207),(1993,'pt_BR','São Bartolomeu',208),(1994,'pt_BR','Santa Helena',209),(1995,'pt_BR','São Cristóvão e Nevis',210),(1996,'pt_BR','Santa Lúcia',211),(1997,'pt_BR','São Martinho',212),(1998,'pt_BR','São Pedro e Miquelon',213),(1999,'pt_BR','São Vicente e Granadinas',214),(2000,'pt_BR','Sudão',215),(2001,'pt_BR','Suriname',216),(2002,'pt_BR','Svalbard e Jan Mayen',217),(2003,'pt_BR','Suazilândia',218),(2004,'pt_BR','Suécia',219),(2005,'pt_BR','Suíça',220),(2006,'pt_BR','Síria',221),(2007,'pt_BR','Taiwan',222),(2008,'pt_BR','Tajiquistão',223),(2009,'pt_BR','Tanzânia',224),(2010,'pt_BR','Tailândia',225),(2011,'pt_BR','Timor-Leste',226),(2012,'pt_BR','Togo',227),(2013,'pt_BR','Tokelau',228),(2014,'pt_BR','Tonga',229),(2015,'pt_BR','Trinidad e Tobago',230),(2016,'pt_BR','Tristan da Cunha',231),(2017,'pt_BR','Tunísia',232),(2018,'pt_BR','Turquia',233),(2019,'pt_BR','Turquemenistão',234),(2020,'pt_BR','Ilhas Turks e Caicos',235),(2021,'pt_BR','Tuvalu',236),(2022,'pt_BR','Ilhas periféricas dos EUA',237),(2023,'pt_BR','Ilhas Virgens dos EUA',238),(2024,'pt_BR','Uganda',239),(2025,'pt_BR','Ucrânia',240),(2026,'pt_BR','Emirados Árabes Unidos',241),(2027,'pt_BR','Reino Unido',242),(2028,'pt_BR','Nações Unidas',243),(2029,'pt_BR','Estados Unidos',244),(2030,'pt_BR','Uruguai',245),(2031,'pt_BR','Uzbequistão',246),(2032,'pt_BR','Vanuatu',247),(2033,'pt_BR','Cidade do Vaticano',248),(2034,'pt_BR','Venezuela',249),(2035,'pt_BR','Vietnã',250),(2036,'pt_BR','Wallis e Futuna',251),(2037,'pt_BR','Saara Ocidental',252),(2038,'pt_BR','Iêmen',253),(2039,'pt_BR','Zâmbia',254),(2040,'pt_BR','Zimbábue',255);
/*!40000 ALTER TABLE `country_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'USD','US Dollar',NULL,NULL,'$'),(2,'EUR','Euro',NULL,NULL,'€');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_exchange_rates`
--

DROP TABLE IF EXISTS `currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_exchange_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_exchange_rates`
--

LOCK TABLES `currency_exchange_rates` WRITE;
/*!40000 ALTER TABLE `currency_exchange_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
INSERT INTO `customer_groups` VALUES (1,'Guest',0,NULL,NULL,'guest'),(2,'General',0,NULL,NULL,'general'),(3,'Wholesale',0,NULL,NULL,'wholesale');
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password_resets`
--

DROP TABLE IF EXISTS `customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password_resets`
--

LOCK TABLES `customer_password_resets` WRITE;
/*!40000 ALTER TABLE `customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_social_accounts`
--

DROP TABLE IF EXISTS `customer_social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_social_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_social_accounts`
--

LOCK TABLES `customer_social_accounts` WRITE;
/*!40000 ALTER TABLE `customer_social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspended` tinyint unsigned NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Yahya','Ammar',NULL,NULL,'yahyaammar4807x@gmail.com',NULL,1,'$2y$10$25.U.zndscdQiU8AmpOjI.bjseWXsSKVrfXjLDVL0CyMGGlCKdUYy','NAg1TZupVvYE886de5PA8wBY9ZalmAMilSx8kNsIVy2Ql1tH4qwjhXC5knbzIlguh1UCQZPKsTRqfCQ9',2,0,NULL,'2024-02-01 11:43:53','2024-02-01 11:43:53',1,0,'cd651936d6df6906e3242aeeba54d48c',NULL,NULL),(2,'Yahya','Ammar',NULL,NULL,'yahyaammar4807@gmail.com',NULL,1,'$2y$10$XbKY9.KyYp4jdsZrZ321s.CYlvvnyVaFiBM7w.YXrH8AI.5jMspYy','RFMbNNWSAQZ9XeK59i31uygDLme6YgnAPlZcW0GCu26Xn62DiWs4nDoSayOrRTGSwWAd4cWlwYuBW5Q1',2,0,NULL,'2024-02-19 01:01:20','2024-02-19 01:01:20',1,0,'b99a62594c0e9335309510b9a4d1cf06',NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_purchased` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `order_item_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `download_canceled` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_sources`
--

DROP TABLE IF EXISTS `inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_sources`
--

LOCK TABLES `inventory_sources` WRITE;
/*!40000 ALTER TABLE `inventory_sources` DISABLE KEYS */;
INSERT INTO `inventory_sources` VALUES (1,'default','Default',NULL,'Detroit Warehouse','warehouse@example.com','1234567899',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `invoice_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminders` int NOT NULL DEFAULT '0',
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  KEY `invoices_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `locale_image` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'en','English',NULL,NULL,'ltr',NULL),(2,'fr','French',NULL,NULL,'ltr',NULL),(3,'nl','Dutch',NULL,NULL,'ltr',NULL),(4,'tr','Türkçe',NULL,NULL,'ltr',NULL),(5,'es','Español',NULL,NULL,'ltr',NULL);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_campaigns`
--

DROP TABLE IF EXISTS `marketing_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `marketing_template_id` int unsigned DEFAULT NULL,
  `marketing_event_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_campaigns`
--

LOCK TABLES `marketing_campaigns` WRITE;
/*!40000 ALTER TABLE `marketing_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_events`
--

DROP TABLE IF EXISTS `marketing_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_events`
--

LOCK TABLES `marketing_events` WRITE;
/*!40000 ALTER TABLE `marketing_events` DISABLE KEYS */;
INSERT INTO `marketing_events` VALUES (1,'Birthday','Birthday',NULL,NULL,NULL);
/*!40000 ALTER TABLE `marketing_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_templates`
--

DROP TABLE IF EXISTS `marketing_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_templates`
--

LOCK TABLES `marketing_templates` WRITE;
/*!40000 ALTER TABLE `marketing_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_admin_password_resets_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2018_06_12_111907_create_admins_table',1),(5,'2018_06_13_055341_create_roles_table',1),(6,'2018_07_05_130148_create_attributes_table',1),(7,'2018_07_05_132854_create_attribute_translations_table',1),(8,'2018_07_05_135150_create_attribute_families_table',1),(9,'2018_07_05_135152_create_attribute_groups_table',1),(10,'2018_07_05_140832_create_attribute_options_table',1),(11,'2018_07_05_140856_create_attribute_option_translations_table',1),(12,'2018_07_05_142820_create_categories_table',1),(13,'2018_07_10_055143_create_locales_table',1),(14,'2018_07_20_054426_create_countries_table',1),(15,'2018_07_20_054502_create_currencies_table',1),(16,'2018_07_20_054542_create_currency_exchange_rates_table',1),(17,'2018_07_20_064849_create_channels_table',1),(18,'2018_07_21_142836_create_category_translations_table',1),(19,'2018_07_23_110040_create_inventory_sources_table',1),(20,'2018_07_24_082635_create_customer_groups_table',1),(21,'2018_07_24_082930_create_customers_table',1),(22,'2018_07_24_083025_create_customer_addresses_table',1),(23,'2018_07_27_065727_create_products_table',1),(24,'2018_07_27_070011_create_product_attribute_values_table',1),(25,'2018_07_27_092623_create_product_reviews_table',1),(26,'2018_07_27_113941_create_product_images_table',1),(27,'2018_07_27_113956_create_product_inventories_table',1),(28,'2018_08_03_114203_create_sliders_table',1),(29,'2018_08_30_064755_create_tax_categories_table',1),(30,'2018_08_30_065042_create_tax_rates_table',1),(31,'2018_08_30_065840_create_tax_mappings_table',1),(32,'2018_09_05_150444_create_cart_table',1),(33,'2018_09_05_150915_create_cart_items_table',1),(34,'2018_09_11_064045_customer_password_resets',1),(35,'2018_09_19_092845_create_cart_address',1),(36,'2018_09_19_093453_create_cart_payment',1),(37,'2018_09_19_093508_create_cart_shipping_rates_table',1),(38,'2018_09_20_060658_create_core_config_table',1),(39,'2018_09_27_113154_create_orders_table',1),(40,'2018_09_27_113207_create_order_items_table',1),(41,'2018_09_27_113405_create_order_address_table',1),(42,'2018_09_27_115022_create_shipments_table',1),(43,'2018_09_27_115029_create_shipment_items_table',1),(44,'2018_09_27_115135_create_invoices_table',1),(45,'2018_09_27_115144_create_invoice_items_table',1),(46,'2018_10_01_095504_create_order_payment_table',1),(47,'2018_10_03_025230_create_wishlist_table',1),(48,'2018_10_12_101803_create_country_translations_table',1),(49,'2018_10_12_101913_create_country_states_table',1),(50,'2018_10_12_101923_create_country_state_translations_table',1),(51,'2018_11_15_153257_alter_order_table',1),(52,'2018_11_15_163729_alter_invoice_table',1),(53,'2018_11_16_173504_create_subscribers_list_table',1),(54,'2018_11_17_165758_add_is_verified_column_in_customers_table',1),(55,'2018_11_21_144411_create_cart_item_inventories_table',1),(56,'2018_11_26_110500_change_gender_column_in_customers_table',1),(57,'2018_11_27_174449_change_content_column_in_sliders_table',1),(58,'2018_12_05_132625_drop_foreign_key_core_config_table',1),(59,'2018_12_05_132629_alter_core_config_table',1),(60,'2018_12_06_185202_create_product_flat_table',1),(61,'2018_12_21_101307_alter_channels_table',1),(62,'2018_12_24_123812_create_channel_inventory_sources_table',1),(63,'2018_12_24_184402_alter_shipments_table',1),(64,'2018_12_26_165327_create_product_ordered_inventories_table',1),(65,'2018_12_31_161114_alter_channels_category_table',1),(66,'2019_01_11_122452_add_vendor_id_column_in_product_inventories_table',1),(67,'2019_01_25_124522_add_updated_at_column_in_product_flat_table',1),(68,'2019_01_29_123053_add_min_price_and_max_price_column_in_product_flat_table',1),(69,'2019_01_31_164117_update_value_column_type_to_text_in_core_config_table',1),(70,'2019_02_21_145238_alter_product_reviews_table',1),(71,'2019_02_21_152709_add_swatch_type_column_in_attributes_table',1),(72,'2019_02_21_153035_alter_customer_id_in_product_reviews_table',1),(73,'2019_02_21_153851_add_swatch_value_columns_in_attribute_options_table',1),(74,'2019_03_15_123337_add_display_mode_column_in_categories_table',1),(75,'2019_03_28_103658_add_notes_column_in_customers_table',1),(76,'2019_04_24_155820_alter_product_flat_table',1),(77,'2019_05_13_024320_remove_tables',1),(78,'2019_05_13_024321_create_cart_rules_table',1),(79,'2019_05_13_024322_create_cart_rule_channels_table',1),(80,'2019_05_13_024323_create_cart_rule_customer_groups_table',1),(81,'2019_05_13_024324_create_cart_rule_translations_table',1),(82,'2019_05_13_024325_create_cart_rule_customers_table',1),(83,'2019_05_13_024326_create_cart_rule_coupons_table',1),(84,'2019_05_13_024327_create_cart_rule_coupon_usage_table',1),(85,'2019_05_22_165833_update_zipcode_column_type_to_varchar_in_cart_address_table',1),(86,'2019_05_23_113407_add_remaining_column_in_product_flat_table',1),(87,'2019_05_23_155520_add_discount_columns_in_invoice_items_table',1),(88,'2019_05_23_184029_rename_discount_columns_in_cart_table',1),(89,'2019_06_04_114009_add_phone_column_in_customers_table',1),(90,'2019_06_06_195905_update_custom_price_to_nullable_in_cart_items',1),(91,'2019_06_15_183412_add_code_column_in_customer_groups_table',1),(92,'2019_06_17_180258_create_product_downloadable_samples_table',1),(93,'2019_06_17_180314_create_product_downloadable_sample_translations_table',1),(94,'2019_06_17_180325_create_product_downloadable_links_table',1),(95,'2019_06_17_180346_create_product_downloadable_link_translations_table',1),(96,'2019_06_19_162817_remove_unique_in_phone_column_in_customers_table',1),(97,'2019_06_21_130512_update_weight_column_deafult_value_in_cart_items_table',1),(98,'2019_06_21_202249_create_downloadable_link_purchased_table',1),(99,'2019_07_02_180307_create_booking_products_table',1),(100,'2019_07_05_114157_add_symbol_column_in_currencies_table',1),(101,'2019_07_05_154415_create_booking_product_default_slots_table',1),(102,'2019_07_05_154429_create_booking_product_appointment_slots_table',1),(103,'2019_07_05_154440_create_booking_product_event_tickets_table',1),(104,'2019_07_05_154451_create_booking_product_rental_slots_table',1),(105,'2019_07_05_154502_create_booking_product_table_slots_table',1),(106,'2019_07_11_151210_add_locale_id_in_category_translations',1),(107,'2019_07_23_033128_alter_locales_table',1),(108,'2019_07_23_174708_create_velocity_contents_table',1),(109,'2019_07_23_175212_create_velocity_contents_translations_table',1),(110,'2019_07_29_142734_add_use_in_flat_column_in_attributes_table',1),(111,'2019_07_30_153530_create_cms_pages_table',1),(112,'2019_07_31_143339_create_category_filterable_attributes_table',1),(113,'2019_08_02_105320_create_product_grouped_products_table',1),(114,'2019_08_12_184925_add_additional_cloumn_in_wishlist_table',1),(115,'2019_08_20_170510_create_product_bundle_options_table',1),(116,'2019_08_20_170520_create_product_bundle_option_translations_table',1),(117,'2019_08_20_170528_create_product_bundle_option_products_table',1),(118,'2019_08_21_123707_add_seo_column_in_channels_table',1),(119,'2019_09_11_184511_create_refunds_table',1),(120,'2019_09_11_184519_create_refund_items_table',1),(121,'2019_09_26_163950_remove_channel_id_from_customers_table',1),(122,'2019_10_03_105451_change_rate_column_in_currency_exchange_rates_table',1),(123,'2019_10_21_105136_order_brands',1),(124,'2019_10_24_173358_change_postcode_column_type_in_order_address_table',1),(125,'2019_10_24_173437_change_postcode_column_type_in_cart_address_table',1),(126,'2019_10_24_173507_change_postcode_column_type_in_customer_addresses_table',1),(127,'2019_11_21_194541_add_column_url_path_to_category_translations',1),(128,'2019_11_21_194608_add_stored_function_to_get_url_path_of_category',2),(129,'2019_11_21_194627_add_trigger_to_category_translations',2),(130,'2019_11_21_194648_add_url_path_to_existing_category_translations',2),(131,'2019_11_21_194703_add_trigger_to_categories',2),(132,'2019_11_25_171136_add_applied_cart_rule_ids_column_in_cart_table',2),(133,'2019_11_25_171208_add_applied_cart_rule_ids_column_in_cart_items_table',2),(134,'2019_11_30_124437_add_applied_cart_rule_ids_column_in_orders_table',2),(135,'2019_11_30_165644_add_discount_columns_in_cart_shipping_rates_table',2),(136,'2019_12_03_175253_create_remove_catalog_rule_tables',2),(137,'2019_12_03_184613_create_catalog_rules_table',2),(138,'2019_12_03_184651_create_catalog_rule_channels_table',2),(139,'2019_12_03_184732_create_catalog_rule_customer_groups_table',2),(140,'2019_12_06_101110_create_catalog_rule_products_table',2),(141,'2019_12_06_110507_create_catalog_rule_product_prices_table',2),(142,'2019_12_14_000001_create_personal_access_tokens_table',2),(143,'2019_12_30_155256_create_velocity_meta_data',2),(144,'2020_01_02_201029_add_api_token_columns',2),(145,'2020_01_06_173505_alter_trigger_category_translations',2),(146,'2020_01_06_173524_alter_stored_function_url_path_category',2),(147,'2020_01_06_195305_alter_trigger_on_categories',2),(148,'2020_01_09_154851_add_shipping_discount_columns_in_orders_table',2),(149,'2020_01_09_202815_add_inventory_source_name_column_in_shipments_table',2),(150,'2020_01_10_122226_update_velocity_meta_data',2),(151,'2020_01_10_151902_customer_address_improvements',2),(152,'2020_01_13_131431_alter_float_value_column_type_in_product_attribute_values_table',2),(153,'2020_01_13_155803_add_velocity_locale_icon',2),(154,'2020_01_13_192149_add_category_velocity_meta_data',2),(155,'2020_01_14_191854_create_cms_page_translations_table',2),(156,'2020_01_14_192206_remove_columns_from_cms_pages_table',2),(157,'2020_01_15_130209_create_cms_page_channels_table',2),(158,'2020_01_15_145637_add_product_policy',2),(159,'2020_01_15_152121_add_banner_link',2),(160,'2020_01_28_102422_add_new_column_and_rename_name_column_in_customer_addresses_table',2),(161,'2020_01_29_124748_alter_name_column_in_country_state_translations_table',2),(162,'2020_02_18_165639_create_bookings_table',2),(163,'2020_02_21_121201_create_booking_product_event_ticket_translations_table',2),(164,'2020_02_24_190025_add_is_comparable_column_in_attributes_table',2),(165,'2020_02_25_181902_propagate_company_name',2),(166,'2020_02_26_163908_change_column_type_in_cart_rules_table',2),(167,'2020_02_28_105104_fix_order_columns',2),(168,'2020_02_28_111958_create_customer_compare_products_table',2),(169,'2020_03_23_201431_alter_booking_products_table',2),(170,'2020_04_13_224524_add_locale_in_sliders_table',2),(171,'2020_04_16_130351_remove_channel_from_tax_category',2),(172,'2020_04_16_185147_add_table_addresses',2),(173,'2020_05_06_171638_create_order_comments_table',2),(174,'2020_05_21_171500_create_product_customer_group_prices_table',2),(175,'2020_06_08_161708_add_sale_prices_to_booking_product_event_tickets',2),(176,'2020_06_10_201453_add_locale_velocity_meta_data',2),(177,'2020_06_25_162154_create_customer_social_accounts_table',2),(178,'2020_06_25_162340_change_email_password_columns_in_customers_table',2),(179,'2020_06_30_163510_remove_unique_name_in_tax_categories_table',2),(180,'2020_07_31_142021_update_cms_page_translations_table_field_html_content',2),(181,'2020_08_01_132239_add_header_content_count_velocity_meta_data_table',2),(182,'2020_08_12_114128_removing_foriegn_key',2),(183,'2020_08_17_104228_add_channel_to_velocity_meta_data_table',2),(184,'2020_09_07_120413_add_unique_index_to_increment_id_in_orders_table',2),(185,'2020_09_07_195157_add_additional_to_category',2),(186,'2020_11_10_174816_add_product_number_column_in_product_flat_table',2),(187,'2020_11_19_112228_create_product_videos_table',2),(188,'2020_11_20_105353_add_columns_in_channels_table',2),(189,'2020_11_26_141455_create_marketing_templates_table',2),(190,'2020_11_26_150534_create_marketing_events_table',2),(191,'2020_11_26_150644_create_marketing_campaigns_table',2),(192,'2020_12_18_122826_add_is_tax_calculation_column_to_cart_shipping_rates_table',2),(193,'2020_12_21_000200_create_channel_translations_table',2),(194,'2020_12_21_140151_remove_columns_from_channels_table',2),(195,'2020_12_24_131004_add_customer_id_column_in_subscribers_list_table',2),(196,'2020_12_27_121950_create_jobs_table',2),(197,'2021_02_03_104907_add_adittional_data_to_order_payment_table',2),(198,'2021_02_04_150033_add_download_canceled_column_in_downloadable_link_purchased_table',2),(199,'2021_03_11_212124_create_order_transactions_table',2),(200,'2021_03_19_184538_add_expired_at_and_sort_order_column_in_sliders_table',2),(201,'2021_04_07_132010_create_product_review_images_table',2),(202,'2021_06_17_103057_alter_products_table',2),(203,'2021_10_14_122221_add_image_column_to_customers_table',2),(204,'2021_10_23_125017_add_transaction_amount_column',2),(205,'2021_10_29_030610_add_reminders_on_invoices_table',2),(206,'2021_10_30_112900_add_next_reminder_at_on_invoices_table',2),(207,'2021_12_15_104544_notifications',2),(208,'2022_01_25_160015_update_country_state_and_zip_code_in_addresses_table',2),(209,'2022_02_01_185800_add_position_column_to_product_images_table',2),(210,'2022_02_02_142616_add_is_suspended_column_to_customers_table',2),(211,'2022_02_03_120502_add_position_column_to_product_videos_table',2),(212,'2022_03_11_133408_add_enable_wysiwyg_column_in_attributes_table',2),(213,'2022_03_15_160510_create_failed_jobs_table',2),(214,'2024_02_08_120502_edit the products_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_order_id_foreign` (`order_id`),
  CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_brands`
--

DROP TABLE IF EXISTS `order_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `brand` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_brands_order_id_foreign` (`order_id`),
  KEY `order_brands_order_item_id_foreign` (`order_item_id`),
  KEY `order_brands_product_id_foreign` (`product_id`),
  KEY `order_brands_brand_foreign` (`brand`),
  CONSTRAINT `order_brands_brand_foreign` FOREIGN KEY (`brand`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_brands`
--

LOCK TABLES `order_brands` WRITE;
/*!40000 ALTER TABLE `order_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_comments`
--

DROP TABLE IF EXISTS `order_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_comments`
--

LOCK TABLES `order_comments` WRITE;
/*!40000 ALTER TABLE `order_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment`
--

DROP TABLE IF EXISTS `order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transactions`
--

DROP TABLE IF EXISTS `order_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `invoice_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `order_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transactions`
--

LOCK TABLES `order_transactions` WRITE;
/*!40000 ALTER TABLE `order_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `channel_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` VALUES (53,'en','default','this',NULL,NULL,NULL,NULL,NULL,NULL,8,9),(54,'en','default','hsaf',NULL,NULL,NULL,NULL,NULL,NULL,8,10),(55,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,8,1),(56,'en','default','test',NULL,NULL,NULL,NULL,NULL,NULL,8,2),(57,NULL,NULL,'testwqe',NULL,NULL,NULL,NULL,NULL,NULL,8,3),(58,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,8,4),(59,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,8,5),(60,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,8,6),(61,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,8,7),(62,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,8,8),(63,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,8,23),(64,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,8,24),(65,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,8,26),(66,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,27),(67,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,8,16),(68,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,8,17),(69,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,8,18),(70,NULL,NULL,NULL,NULL,NULL,12.0000,NULL,NULL,NULL,8,11),(71,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,12),(72,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,13),(73,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,14),(74,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,15),(75,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,19),(76,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,20),(77,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,21),(78,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,8,22),(79,'en','default','asfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsaf  asfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsafasfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsaf',NULL,NULL,NULL,NULL,NULL,NULL,10,9),(80,'en','default','asfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsafasfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsafasfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsafasfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsaf',NULL,NULL,NULL,NULL,NULL,NULL,10,10),(81,NULL,NULL,'900',NULL,NULL,NULL,NULL,NULL,NULL,10,1),(82,'en','default','testtestste',NULL,NULL,NULL,NULL,NULL,NULL,10,2),(83,NULL,NULL,'testtestste',NULL,NULL,NULL,NULL,NULL,NULL,10,3),(84,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,10,4),(85,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10,5),(86,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10,6),(87,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10,7),(88,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10,8),(89,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,10,23),(90,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,10,24),(91,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10,26),(92,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,10,27),(93,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,10,16),(94,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,10,17),(95,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,10,18),(96,NULL,NULL,NULL,NULL,NULL,89.0000,NULL,NULL,NULL,10,11),(97,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,12),(98,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,13),(99,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,14),(100,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,15),(101,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,10,19),(102,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,10,20),(103,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,10,21),(104,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,10,22);
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_products`
--

DROP TABLE IF EXISTS `product_bundle_option_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_option_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_bundle_option_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`),
  KEY `product_bundle_option_products_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_products`
--

LOCK TABLES `product_bundle_option_products` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_translations`
--

DROP TABLE IF EXISTS `product_bundle_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `product_bundle_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_translations`
--

LOCK TABLES `product_bundle_option_translations` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_options`
--

DROP TABLE IF EXISTS `product_bundle_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_options`
--

LOCK TABLES `product_bundle_options` WRITE;
/*!40000 ALTER TABLE `product_bundle_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `product_categories_product_id_foreign` (`product_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (10,1),(10,2);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cross_sells`
--

DROP TABLE IF EXISTS `product_cross_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_cross_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  KEY `product_cross_sells_parent_id_foreign` (`parent_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cross_sells`
--

LOCK TABLES `product_cross_sells` WRITE;
/*!40000 ALTER TABLE `product_cross_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_customer_group_prices`
--

DROP TABLE IF EXISTS `product_customer_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_customer_group_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_customer_group_prices`
--

LOCK TABLES `product_customer_group_prices` WRITE;
/*!40000 ALTER TABLE `product_customer_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_customer_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_link_translations`
--

DROP TABLE IF EXISTS `product_downloadable_link_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_link_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_link_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_link_translations`
--

LOCK TABLES `product_downloadable_link_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_link_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_link_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_links`
--

DROP TABLE IF EXISTS `product_downloadable_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_links`
--

LOCK TABLES `product_downloadable_links` WRITE;
/*!40000 ALTER TABLE `product_downloadable_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_sample_translations`
--

DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_sample_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_sample_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_sample_translations`
--

LOCK TABLES `product_downloadable_sample_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_samples`
--

DROP TABLE IF EXISTS `product_downloadable_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_samples` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_samples`
--

LOCK TABLES `product_downloadable_samples` WRITE;
/*!40000 ALTER TABLE `product_downloadable_samples` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_flat`
--

DROP TABLE IF EXISTS `product_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_flat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `cost` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `color` int DEFAULT NULL,
  `color_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `size_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `width` decimal(12,4) DEFAULT NULL,
  `height` decimal(12,4) DEFAULT NULL,
  `depth` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_flat`
--

LOCK TABLES `product_flat` WRITE;
/*!40000 ALTER TABLE `product_flat` DISABLE KEYS */;
INSERT INTO `product_flat` VALUES (8,'1','','test','hsaf','testwqe',0,0,1,NULL,12.0000,NULL,NULL,NULL,NULL,1.0000,1,'Red',6,'S','2024-02-08 13:36:18','en','default',8,'2024-02-08 13:36:18',NULL,1,12.0000,12.0000,'this','','','',0.0000,0.0000,NULL),(9,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-08 13:40:22','en','default',9,'2024-02-08 13:40:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'900','12','testtestste','asfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsafasfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsafasfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsafasfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsaf','testtestste',1,1,1,NULL,89.0000,NULL,NULL,NULL,NULL,1.0000,1,'Red',6,'S','2024-02-08 14:02:27','en','default',10,'2024-02-08 14:02:27',NULL,1,89.0000,89.0000,'asfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsaf  asfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsafasfdsafdsaf asfdsafdsaf asfdsafdsaf asfdsafdsafasfdsafdsafasfdsafdsaf','','','',0.0000,0.0000,NULL);
/*!40000 ALTER TABLE `product_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_grouped_products`
--

DROP TABLE IF EXISTS `product_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_grouped_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `associated_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_grouped_products_product_id_foreign` (`product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_grouped_products`
--

LOCK TABLES `product_grouped_products` WRITE;
/*!40000 ALTER TABLE `product_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventories`
--

LOCK TABLES `product_inventories` WRITE;
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
INSERT INTO `product_inventories` VALUES (3,0,8,1,0),(4,10,10,1,0);
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ordered_inventories`
--

DROP TABLE IF EXISTS `product_ordered_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_ordered_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ordered_inventories`
--

LOCK TABLES `product_ordered_inventories` WRITE;
/*!40000 ALTER TABLE `product_ordered_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_ordered_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relations`
--

DROP TABLE IF EXISTS `product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_relations` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  KEY `product_relations_parent_id_foreign` (`parent_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relations`
--

LOCK TABLES `product_relations` WRITE;
/*!40000 ALTER TABLE `product_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review_images`
--

DROP TABLE IF EXISTS `product_review_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_review_images_review_id_foreign` (`review_id`),
  CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review_images`
--

LOCK TABLES `product_review_images` WRITE;
/*!40000 ALTER TABLE `product_review_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  KEY `product_reviews_customer_id_foreign` (`customer_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_super_attributes`
--

DROP TABLE IF EXISTS `product_super_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_super_attributes` (
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `product_super_attributes_product_id_foreign` (`product_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_super_attributes`
--

LOCK TABLES `product_super_attributes` WRITE;
/*!40000 ALTER TABLE `product_super_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_super_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_up_sells`
--

DROP TABLE IF EXISTS `product_up_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_up_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  KEY `product_up_sells_parent_id_foreign` (`parent_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_up_sells`
--

LOCK TABLES `product_up_sells` WRITE;
/*!40000 ALTER TABLE `product_up_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_up_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_videos`
--

DROP TABLE IF EXISTS `product_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_videos_product_id_foreign` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_videos`
--

LOCK TABLES `product_videos` WRITE;
/*!40000 ALTER TABLE `product_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'branch01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (8,'1','simple','2024-02-08 08:36:18','2024-02-08 08:36:18',NULL,1,NULL,'branch01'),(9,'14','simple','2024-02-08 08:40:22','2024-02-08 08:40:22',NULL,1,NULL,'branch01'),(10,'900','simple','2024-02-08 09:02:27','2024-02-08 09:02:27',NULL,1,NULL,'branch02');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_items`
--

DROP TABLE IF EXISTS `refund_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `refund_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_items`
--

LOCK TABLES `refund_items` WRITE;
/*!40000 ALTER TABLE `refund_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','Administrator role','all',NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_items`
--

DROP TABLE IF EXISTS `shipment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_items`
--

LOCK TABLES `shipment_items` WRITE;
/*!40000 ALTER TABLE `shipment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` int DEFAULT NULL,
  `carrier_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `inventory_source_id` int unsigned DEFAULT NULL,
  `inventory_source_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  KEY `shipments_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slider_path` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` date DEFAULT NULL,
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sliders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `sliders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers_list`
--

DROP TABLE IF EXISTS `subscribers_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers_list`
--

LOCK TABLES `subscribers_list` WRITE;
/*!40000 ALTER TABLE `subscribers_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories`
--

DROP TABLE IF EXISTS `tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories`
--

LOCK TABLES `tax_categories` WRITE;
/*!40000 ALTER TABLE `tax_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories_tax_rates`
--

DROP TABLE IF EXISTS `tax_categories_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_categories_tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int unsigned NOT NULL,
  `tax_rate_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories_tax_rates`
--

LOCK TABLES `tax_categories_tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_categories_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_contents`
--

DROP TABLE IF EXISTS `velocity_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `velocity_contents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_contents`
--

LOCK TABLES `velocity_contents` WRITE;
/*!40000 ALTER TABLE `velocity_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_contents_translations`
--

DROP TABLE IF EXISTS `velocity_contents_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `velocity_contents_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int unsigned DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_heading` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_target` tinyint(1) NOT NULL DEFAULT '0',
  `catalog_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_contents_translations_content_id_foreign` (`content_id`),
  CONSTRAINT `velocity_contents_translations_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `velocity_contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_contents_translations`
--

LOCK TABLES `velocity_contents_translations` WRITE;
/*!40000 ALTER TABLE `velocity_contents_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_contents_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_customer_compare_products`
--

DROP TABLE IF EXISTS `velocity_customer_compare_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `velocity_customer_compare_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_flat_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_customer_compare_products_product_flat_id_foreign` (`product_flat_id`),
  KEY `velocity_customer_compare_products_customer_id_foreign` (`customer_id`),
  CONSTRAINT `velocity_customer_compare_products_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `velocity_customer_compare_products_product_flat_id_foreign` FOREIGN KEY (`product_flat_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_customer_compare_products`
--

LOCK TABLES `velocity_customer_compare_products` WRITE;
/*!40000 ALTER TABLE `velocity_customer_compare_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_customer_compare_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_meta_data`
--

DROP TABLE IF EXISTS `velocity_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `velocity_meta_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `home_page_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_left_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_middle_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT '0',
  `advertisement` json DEFAULT NULL,
  `sidebar_category_count` int NOT NULL DEFAULT '9',
  `featured_product_count` int NOT NULL DEFAULT '10',
  `new_products_count` int NOT NULL DEFAULT '10',
  `subscription_bar_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_view_images` json DEFAULT NULL,
  `product_policy` text COLLATE utf8mb4_unicode_ci,
  `locale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_content_count` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_meta_data`
--

LOCK TABLES `velocity_meta_data` WRITE;
/*!40000 ALTER TABLE `velocity_meta_data` DISABLE KEYS */;
INSERT INTO `velocity_meta_data` VALUES (1,'<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>','<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>','<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\">\r\n<ul type=\"none\">\r\n<li><a href=\"{!! url(\'page/about-us\') !!}\">About Us</a></li>\r\n<li><a href=\"{!! url(\'page/cutomer-service\') !!}\">Customer Service</a></li>\r\n<li><a href=\"{!! url(\'page/whats-new\') !!}\">What&rsquo;s New</a></li>\r\n<li><a href=\"{!! url(\'page/contact-us\') !!}\">Contact Us </a></li>\r\n</ul>\r\n</div>\r\n<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\">\r\n<ul type=\"none\">\r\n<li><a href=\"{!! url(\'page/return-policy\') !!}\"> Order and Returns </a></li>\r\n<li><a href=\"{!! url(\'page/payment-policy\') !!}\"> Payment Policy </a></li>\r\n<li><a href=\"{!! url(\'page/shipping-policy\') !!}\"> Shipping Policy</a></li>\r\n<li><a href=\"{!! url(\'page/privacy-policy\') !!}\"> Privacy and Cookies Policy </a></li>\r\n</ul>\r\n</div>',1,'[]',9,10,10,'<div class=\"social-icons col-lg-6\"><a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>',NULL,'2024-02-19 01:09:05',NULL,'<div class=\"row col-12 remove-padding-margin\">\r\n<div class=\"col-lg-4 col-sm-12 product-policy-wrapper\">\r\n<div class=\"card\">\r\n<div class=\"policy\">\r\n<div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div>\r\n<div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-4 col-sm-12 product-policy-wrapper\">\r\n<div class=\"card\">\r\n<div class=\"policy\">\r\n<div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div>\r\n<div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-4 col-sm-12 product-policy-wrapper\">\r\n<div class=\"card\">\r\n<div class=\"policy\">\r\n<div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div>\r\n<div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>','en','default','5');
/*!40000 ALTER TABLE `velocity_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `additional` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-19  6:16:57
