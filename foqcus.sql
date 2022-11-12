/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.29 : Database - foqcus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2022_11_12_135516_create_user_scan_tracks_by_users_table',2),
(6,'2022_11_12_163251_create_scan_tracks_by_ips_table',3),
(7,'2022_11_12_163340_create_scan_tracks_by_browsers_table',4);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `scan_tracks_by_browsers` */

DROP TABLE IF EXISTS `scan_tracks_by_browsers`;

CREATE TABLE `scan_tracks_by_browsers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scan_count` smallint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scan_tracks_by_browsers_user_id_foreign` (`user_id`),
  CONSTRAINT `scan_tracks_by_browsers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `scan_tracks_by_browsers` */

insert  into `scan_tracks_by_browsers`(`id`,`date`,`user_id`,`browser`,`scan_count`,`created_at`,`updated_at`) values 
(1,'2022-11-13',7,'Safari',NULL,'2022-11-12 16:36:34','2022-11-12 16:36:34'),
(2,'2022-11-13',3,'Firefox',NULL,'2022-11-12 16:36:47','2022-11-12 16:36:47'),
(3,'2022-11-13',3,'Firefox',NULL,'2022-11-12 16:36:55','2022-11-12 16:36:55'),
(4,'2022-11-13',2,'Chrome',NULL,'2022-11-12 16:38:02','2022-11-12 16:38:02'),
(5,'2022-11-13',2,'Chrome',NULL,'2022-11-12 16:38:13','2022-11-12 16:38:13'),
(6,'2022-11-11',4,'Safari',NULL,'2022-11-12 16:38:27','2022-11-12 16:38:27');

/*Table structure for table `scan_tracks_by_ips` */

DROP TABLE IF EXISTS `scan_tracks_by_ips`;

CREATE TABLE `scan_tracks_by_ips` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scan_count` smallint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scan_tracks_by_ips_user_id_foreign` (`user_id`),
  CONSTRAINT `scan_tracks_by_ips_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `scan_tracks_by_ips` */

insert  into `scan_tracks_by_ips`(`id`,`date`,`user_id`,`ip_address`,`scan_count`,`created_at`,`updated_at`) values 
(1,'2022-11-13',7,'127.0.001',NULL,'2022-11-12 16:36:34','2022-11-12 16:36:34'),
(2,'2022-11-13',3,'127.0.001',NULL,'2022-11-12 16:36:47','2022-11-12 16:36:47'),
(3,'2022-11-13',3,'127.0.001',NULL,'2022-11-12 16:36:55','2022-11-12 16:36:55'),
(4,'2022-11-13',2,'127.0.001',NULL,'2022-11-12 16:38:02','2022-11-12 16:38:02'),
(5,'2022-11-13',2,'127.0.001',NULL,'2022-11-12 16:38:13','2022-11-12 16:38:13'),
(6,'2022-11-11',4,'192.155.001',NULL,'2022-11-12 16:38:27','2022-11-12 16:38:27');

/*Table structure for table `scan_tracks_by_users` */

DROP TABLE IF EXISTS `scan_tracks_by_users`;

CREATE TABLE `scan_tracks_by_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `scan_count` smallint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_scan_tracks_by_users_user_id_foreign` (`user_id`),
  CONSTRAINT `user_scan_tracks_by_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `scan_tracks_by_users` */

insert  into `scan_tracks_by_users`(`id`,`date`,`user_id`,`scan_count`,`created_at`,`updated_at`) values 
(1,'2022-11-12',2,NULL,'2022-11-12 15:04:24','2022-11-12 15:04:24'),
(2,'2022-11-12',6,NULL,'2022-11-12 15:11:24','2022-11-12 15:11:24'),
(3,'2022-11-12',5,NULL,'2022-11-12 15:16:13','2022-11-12 15:16:13'),
(4,'2022-11-12',5,NULL,'2022-11-12 15:16:22','2022-11-12 15:16:22'),
(5,'2022-11-12',2,NULL,'2022-11-12 15:16:29','2022-11-12 15:16:29'),
(6,'2022-11-12',11,NULL,'2022-11-12 15:16:39','2022-11-12 15:16:39'),
(7,'2022-11-11',3,NULL,'2022-11-12 15:16:50','2022-11-12 15:16:50'),
(8,'2022-11-11',3,NULL,'2022-11-12 15:16:55','2022-11-12 15:16:55'),
(9,'2022-11-11',2,NULL,NULL,NULL),
(10,'2022-11-13',7,NULL,'2022-11-12 16:36:34','2022-11-12 16:36:34'),
(11,'2022-11-13',3,NULL,'2022-11-12 16:36:47','2022-11-12 16:36:47'),
(12,'2022-11-13',3,NULL,'2022-11-12 16:36:55','2022-11-12 16:36:55'),
(13,'2022-11-13',2,NULL,'2022-11-12 16:38:02','2022-11-12 16:38:02'),
(14,'2022-11-13',2,NULL,'2022-11-12 16:38:13','2022-11-12 16:38:13'),
(15,'2022-11-11',4,NULL,'2022-11-12 16:38:27','2022-11-12 16:38:27');

/*Table structure for table `user_scan_tracks` */

DROP TABLE IF EXISTS `user_scan_tracks`;

CREATE TABLE `user_scan_tracks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `user_scan_id` bigint unsigned NOT NULL,
  `scan_device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(11,6) DEFAULT NULL,
  `latitude` decimal(11,6) DEFAULT NULL,
  `location_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_geolocation_allowed` tinyint(1) DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_scan_tracks_user_id_foreign` (`user_id`),
  KEY `user_scan_tracks_user_scan_id_foreign` (`user_scan_id`),
  CONSTRAINT `user_scan_tracks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_scan_tracks_user_scan_id_foreign` FOREIGN KEY (`user_scan_id`) REFERENCES `user_scans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_scan_tracks` */

insert  into `user_scan_tracks`(`id`,`user_id`,`user_scan_id`,`scan_device`,`ip_address`,`longitude`,`latitude`,`location_address`,`browser`,`is_geolocation_allowed`,`status`,`created_at`,`updated_at`) values 
(1,NULL,1,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 14:46:08','2022-03-28 14:46:08'),
(2,NULL,1,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 14:47:17','2022-03-28 14:47:17'),
(3,NULL,2,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 14:58:27','2022-03-28 14:58:27'),
(4,NULL,3,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 15:01:12','2022-03-28 15:01:12'),
(5,NULL,2,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 15:33:37','2022-03-28 15:33:37'),
(6,NULL,2,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 15:34:00','2022-03-28 15:34:00'),
(7,NULL,2,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 15:35:44','2022-03-28 15:35:44'),
(8,1,3,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 15:37:34','2022-03-28 15:37:34'),
(9,NULL,2,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 15:38:47','2022-03-28 15:38:47'),
(10,NULL,4,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 16:51:15','2022-03-28 16:51:15'),
(11,2,5,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 17:04:26','2022-03-28 17:04:26'),
(12,NULL,2,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 17:08:11','2022-03-28 17:08:11'),
(13,NULL,2,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 17:14:25','2022-03-28 17:14:25'),
(14,NULL,2,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 17:16:15','2022-03-28 17:16:15'),
(15,4,6,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 17:18:14','2022-03-28 17:18:14'),
(16,2,7,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 18:01:10','2022-03-28 18:01:10'),
(17,2,8,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 18:05:52','2022-03-28 18:05:52'),
(18,2,9,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-28 18:19:00','2022-03-28 18:19:00'),
(19,2,10,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-29 10:27:51','2022-03-29 10:27:51'),
(20,NULL,11,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-29 10:31:15','2022-03-29 10:31:15'),
(21,NULL,2,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-30 15:14:34','2022-03-30 15:14:34'),
(22,NULL,5,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'suspend','2022-03-30 16:27:34','2022-03-30 16:27:34'),
(23,NULL,7,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'suspend','2022-03-30 16:27:55','2022-03-30 16:27:55'),
(24,NULL,8,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'suspend','2022-03-30 16:28:24','2022-03-30 16:28:24'),
(25,NULL,9,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'suspend','2022-03-30 16:28:30','2022-03-30 16:28:30'),
(26,NULL,12,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-30 16:28:45','2022-03-30 16:28:45'),
(27,NULL,2,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-03-31 16:26:08','2022-03-31 16:26:08'),
(28,NULL,2,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-04-01 12:52:45','2022-04-01 12:52:45'),
(29,NULL,13,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-04-06 09:42:51','2022-04-06 09:42:51'),
(30,5,13,'mac',NULL,101.743845,3.091358,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-06 09:54:07','2022-04-06 09:54:07'),
(31,5,14,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',1,'active','2022-04-06 10:42:33','2022-04-06 10:42:33'),
(32,3,14,'windows',NULL,101.741006,3.082128,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-06 10:43:58','2022-04-06 10:43:58'),
(33,6,15,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',1,'active','2022-04-06 10:46:34','2022-04-06 10:46:34'),
(34,3,14,'windows',NULL,101.741006,3.082128,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-06 11:00:45','2022-04-06 11:00:45'),
(35,3,14,'windows',NULL,101.744002,3.091272,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-06 11:04:38','2022-04-06 11:04:38'),
(36,6,14,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',1,'active','2022-04-06 11:05:48','2022-04-06 11:05:48'),
(37,7,16,'mac',NULL,101.743844,3.091428,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-06 12:00:14','2022-04-06 12:00:14'),
(38,8,17,'mac',NULL,101.743850,3.091377,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-06 12:01:09','2022-04-06 12:01:09'),
(39,11,19,'linux',NULL,101.752414,3.099099,'Hulu Langat,Selangor,Malaysia','Google Chrome',1,'active','2022-04-06 12:02:34','2022-04-06 12:02:34'),
(40,12,20,'linux','2404:160:8051:a101:bf70:328f:29d2:9f43',101.710500,3.038400,'Seri Kembangan, Selangor, Malaysia','Google Chrome',1,'active','2022-04-06 12:02:42','2022-04-06 12:02:42'),
(41,5,18,'mac',NULL,101.743866,3.091277,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-06 12:04:39','2022-04-06 12:04:39'),
(42,13,21,'mac',NULL,101.743830,3.091399,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-06 12:05:50','2022-04-06 12:05:50'),
(43,14,22,'mac',NULL,101.743852,3.091395,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-06 12:06:32','2022-04-06 12:06:32'),
(44,15,23,'linux',NULL,101.734370,3.099099,'Kuala Lumpur,Federal Territory of Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-06 12:07:09','2022-04-06 12:07:09'),
(45,16,24,'mac',NULL,101.787828,3.056712,'Cheras,Selangor,Malaysia','Apple Safari',1,'active','2022-04-06 12:07:31','2022-04-06 12:07:31'),
(46,17,25,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Apple Safari',1,'active','2022-04-06 12:07:47','2022-04-06 12:07:47'),
(47,18,26,'linux',NULL,101.743939,3.091195,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-06 12:09:08','2022-04-06 12:09:08'),
(48,19,27,'linux','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-04-06 12:09:40','2022-04-06 12:09:40'),
(49,20,28,'mac',NULL,101.743861,3.091337,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-06 12:09:46','2022-04-06 12:09:46'),
(50,21,29,'linux',NULL,101.743947,3.091237,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-06 12:10:58','2022-04-06 12:10:58'),
(51,22,30,'linux','113.211.132.150',101.674700,3.119100,'Kuala Lumpur, Kuala Lumpur, Malaysia','Google Chrome',1,'active','2022-04-06 12:13:11','2022-04-06 12:13:11'),
(52,NULL,12,'linux','2402:1980:828a:24c:54b2:de7e:87ae:28c7',101.533000,3.085070,'Shah Alam, Selangor, Malaysia','Google Chrome',0,'suspend','2022-04-06 13:09:27','2022-04-06 13:09:27'),
(53,NULL,4,'linux','2402:1980:828a:24c:54b2:de7e:87ae:28c7',101.533000,3.085070,'Shah Alam, Selangor, Malaysia','Google Chrome',0,'suspend','2022-04-06 13:11:11','2022-04-06 13:11:11'),
(54,NULL,4,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya, Selangor, Malaysia','Google Chrome',0,'active','2022-04-06 13:12:10','2022-04-06 13:12:10'),
(55,NULL,31,'windows','2001:ee0:4fb7:490:80d4:cc9d:9cc8:3535',106.658100,10.832600,'Ho Chi Minh City, Ho Chi Minh, Vietnam','Google Chrome',0,'active','2022-04-06 14:25:38','2022-04-06 14:25:38'),
(56,NULL,31,'windows','2001:ee0:4fb7:490:80d4:cc9d:9cc8:3535',106.658100,10.832600,'Ho Chi Minh City, Ho Chi Minh, Vietnam','Google Chrome',0,'suspend','2022-04-06 14:26:21','2022-04-06 14:26:21'),
(57,NULL,32,'windows','2001:ee0:4fb7:490:89b8:f450:93c:9fa1',106.658100,10.832600,'Ho Chi Minh City, Ho Chi Minh, Vietnam','Google Chrome',0,'active','2022-04-06 14:30:46','2022-04-06 14:30:46'),
(58,NULL,4,'linux',NULL,101.743992,3.091275,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-06 15:37:05','2022-04-06 15:37:05'),
(59,3,33,'windows',NULL,101.741006,3.082167,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'suspend','2022-04-08 11:25:27','2022-04-08 11:25:27'),
(60,23,30,'mac','115.164.202.25',101.707035,3.148114,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-15 14:06:12','2022-04-15 14:06:12'),
(61,23,21,'mac','115.164.202.25',101.707003,3.148113,'Kuala Lumpur,Selangor,Malaysia','Apple Safari',1,'active','2022-04-15 14:18:25','2022-04-15 14:18:25'),
(62,23,24,'mac','115.164.202.25',101.707100,3.148110,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-15 14:38:17','2022-04-15 14:38:17'),
(63,2,4,'windows','121.122.44.133',101.741006,3.082128,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-18 10:59:37','2022-04-18 11:08:41'),
(64,5,24,'mac','121.122.44.133',101.743879,3.091144,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-18 11:56:25','2022-04-18 11:56:25'),
(65,24,34,'mac','121.122.44.133',101.743856,3.091419,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-18 14:51:43','2022-04-18 14:51:43'),
(66,24,35,'mac','121.122.44.133',101.743891,3.091393,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-18 14:53:28','2022-04-18 14:53:28'),
(67,NULL,36,'windows','121.122.44.133',101.741006,3.101036,'Kuala Lumpur,Federal Territory of Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-20 10:42:22','2022-04-20 10:42:22'),
(68,24,37,'mac','121.122.44.133',101.743873,3.091314,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-20 10:49:41','2022-04-20 10:49:41'),
(69,NULL,36,'linux','27.125.249.6',101.744009,3.091269,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-20 10:57:33','2022-04-20 10:57:33'),
(70,3,38,'windows','121.122.44.133',101.741006,3.082128,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-20 11:03:33','2022-04-20 11:03:33'),
(71,24,39,'mac','121.122.44.133',101.743878,3.091403,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-20 11:09:26','2022-04-20 11:09:26'),
(72,3,40,'windows','121.122.44.133',101.741006,3.082128,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-20 11:24:07','2022-04-20 11:24:07'),
(73,3,40,'linux','121.122.44.133',101.743994,3.091262,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-20 11:29:09','2022-04-20 11:29:09'),
(74,3,40,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-04-20 12:12:03','2022-04-20 12:12:03'),
(75,5,24,'mac','121.122.44.133',101.743837,3.091333,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-20 12:33:27','2022-04-20 12:33:27'),
(76,3,24,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-04-20 13:42:44','2022-04-20 13:42:44'),
(77,3,24,'windows','121.122.44.133',101.741006,3.082128,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'suspend','2022-04-20 13:43:15','2022-04-20 13:43:15'),
(78,3,40,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-04-20 14:42:45','2022-04-20 14:42:45'),
(79,3,41,'windows','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-04-20 14:43:11','2022-04-20 14:43:11'),
(80,5,21,'mac','121.122.44.133',101.743838,3.091258,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-04-20 14:55:31','2022-04-20 14:55:31'),
(81,NULL,42,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-04-25 10:35:14','2022-04-25 10:35:14'),
(82,3,38,'windows','121.122.44.133',101.741006,3.101075,'Kuala Lumpur,Federal Territory of Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-26 15:18:31','2022-04-26 15:18:31'),
(83,5,14,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'suspend','2022-04-27 12:04:16','2022-04-27 12:04:16'),
(84,5,43,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-04-27 12:04:40','2022-04-27 12:04:40'),
(85,3,43,'windows','121.122.44.133',101.743982,3.091287,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-04-27 12:06:07','2022-04-27 12:06:07'),
(86,5,44,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-04-27 12:28:42','2022-04-27 12:28:42'),
(87,5,44,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Apple Safari',1,'active','2022-04-28 11:45:52','2022-04-28 11:45:52'),
(88,24,45,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-04-28 11:46:54','2022-04-28 11:46:54'),
(89,24,46,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-05-05 12:24:07','2022-05-05 12:24:07'),
(90,24,47,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-05-05 12:58:36','2022-05-05 12:58:36'),
(91,24,48,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-05-05 12:59:18','2022-05-05 12:59:18'),
(92,5,49,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-05-11 16:02:08','2022-05-11 16:02:08'),
(93,2,50,'windows','121.122.44.133',101.741006,3.101094,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-05-11 16:04:34','2022-05-11 16:04:34'),
(94,5,51,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-05-11 16:07:12','2022-05-11 16:07:12'),
(95,26,52,'linux','183.171.88.158',101.743953,3.091253,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-05-11 16:53:19','2022-05-11 16:53:19'),
(96,10,53,'mac','121.122.44.133',101.743825,3.091662,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-05-11 16:59:52','2022-05-11 16:59:52'),
(97,26,54,'linux','183.171.88.158',101.743934,3.091241,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-05-11 17:02:31','2022-05-11 17:02:31'),
(98,5,52,'mac','121.122.44.133',101.743825,3.091294,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-05-11 17:03:04','2022-05-11 17:03:04'),
(99,10,52,'mac','121.122.44.133',101.743825,3.091662,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'suspend','2022-05-11 17:04:20','2022-05-11 17:04:20'),
(100,5,26,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-05-17 15:47:11','2022-05-17 15:47:11'),
(101,NULL,55,'mac','121.122.44.133',101.598100,3.120100,'Petaling Jaya,Selangor,Malaysia','Google Chrome',1,'active','2022-05-18 17:45:05','2022-05-18 17:45:05'),
(102,NULL,56,'mac','115.132.37.237',101.713609,3.059875,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-06-12 23:27:00','2022-06-12 23:27:00'),
(103,NULL,57,'mac','121.122.44.133',101.743998,3.091160,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-07-04 13:47:10','2022-07-04 13:47:10'),
(104,NULL,58,'mac','121.122.44.133',101.744001,3.091162,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-07-04 14:08:56','2022-07-04 14:08:56'),
(105,NULL,59,'mac','121.122.44.133',101.744010,3.091124,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'suspend','2022-07-04 14:16:53','2022-07-04 14:16:53'),
(106,28,60,'mac','121.122.44.133',101.744019,3.091144,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Google Chrome',1,'active','2022-07-04 14:21:45','2022-07-04 14:23:40'),
(107,5,30,'mac','121.122.44.133',101.743925,3.091412,'Kuala Lumpur,Wilayah Persekutuan Kuala Lumpur,Malaysia','Apple Safari',1,'active','2022-07-05 15:38:25','2022-07-05 15:38:25');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'admin','admin@example.com',NULL,'$2y$10$JUD69EzfgrWRR/qaCmHpkOorY2X0NxIuYDqw/SGCXwAbEHnzw5JlK',NULL,'2022-11-12 13:43:57','2022-11-12 13:43:57'),
(2,'Hudson Goyette','ellen.bahringer@example.com','2022-11-12 14:18:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','YITXjx88MR','2022-11-12 14:18:45','2022-11-12 14:18:45'),
(3,'Jacques Thiel','uzboncak@example.org','2022-11-12 14:18:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','3w88rI37Mo','2022-11-12 14:18:45','2022-11-12 14:18:45'),
(4,'Isabel Bruen','johann.braun@example.org','2022-11-12 14:18:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','zmzasVgaKA','2022-11-12 14:18:45','2022-11-12 14:18:45'),
(5,'Aletha Rippin','batz.alivia@example.org','2022-11-12 14:18:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','93A5VrbaXE','2022-11-12 14:18:45','2022-11-12 14:18:45'),
(6,'Estell Pagac','cweimann@example.net','2022-11-12 14:18:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','GSzKJebRuQ','2022-11-12 14:18:45','2022-11-12 14:18:45'),
(7,'Mr. Taurean Cremin','fred.nitzsche@example.org','2022-11-12 14:18:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bV7N4d8nW9','2022-11-12 14:18:45','2022-11-12 14:18:45'),
(8,'Nellie Mills','ritchie.emely@example.org','2022-11-12 14:18:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4NgAdc05ov','2022-11-12 14:18:45','2022-11-12 14:18:45'),
(9,'Bernadette Hagenes','shaina64@example.org','2022-11-12 14:18:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','yyuZ1XRmpl','2022-11-12 14:18:45','2022-11-12 14:18:45'),
(10,'Brando Herzog','estelle.stark@example.org','2022-11-12 14:18:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','WFBdLBITID','2022-11-12 14:18:45','2022-11-12 14:18:45'),
(11,'Mrs. Zoila Reilly DDS','fritsch.bryon@example.com','2022-11-12 14:18:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','1EweAAHB5G','2022-11-12 14:18:45','2022-11-12 14:18:45');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
