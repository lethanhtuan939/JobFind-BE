-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jobfind
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Hà Nội',NULL,NULL),(2,'TP.HCM',NULL,NULL),(3,'Đà Nẵng',NULL,NULL),(4,'Cần Thơ','2024-11-30 23:34:32','2024-11-30 23:34:32'),(5,'Quy Nhơn','2024-11-30 23:34:38','2024-11-30 23:34:38'),(6,'Hải Phòng','2024-11-30 23:34:44','2024-11-30 23:34:44');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,NULL,NULL,'Công nghệ thông tin',NULL),(2,NULL,NULL,'Makerting',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_of_employee` int DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Tech Solutions','https://img.freepik.com/free-vector/abstract-company-logo_53876-120501.jpg',NULL,'test',200,'1234','Active','https://www.techsolutions.com','2024-11-26 20:54:49','2024-11-30 05:55:27',NULL,NULL,NULL,NULL),(2,'Techzen','https://res.cloudinary.com/dxrfmq2ru/image/upload/v1733028100/cv_uploads/iqgntdghgpggfrctdp8c.png','https://res.cloudinary.com/dxrfmq2ru/image/upload/v1733028103/cv_uploads/kupecpk2luohskyoasrd.png','tech',200,'12344321','Verified','https://techzen.vn/','2024-11-30 21:41:50','2024-12-01 06:04:25','06 Trần Phú, Thạch Thang, Hải Châu, Đà Nẵng','1234567890','techzen@contact.com','https://www.dropbox.com/scl/fi/dy01ozix0bqy6ifbozqxu/674be90805298.pdf?rlkey=m2a5qsh3fwy9nremz7kjsdb2n&raw=1'),(3,'CÔNG TY TNHH OUTCUBATOR VIỆT NAM','https://res.cloudinary.com/dxrfmq2ru/image/upload/v1733028662/cv_uploads/ocvl9zx8x7kejirk8dzc.webp','https://res.cloudinary.com/dxrfmq2ru/image/upload/v1733028665/cv_uploads/xotogrqr8ewabbw1zidm.webp','<p>Building the next-generation tech products</p><p><br></p><p><strong>We are a global product team focused on building payment and e-commerce solutions that make an impact. We have dedicated our efforts to assist businesses in running online businesses and reaching customers in every country in the world.&nbsp;</strong></p><p><br></p><p><strong>Headquarter is in San Francisco, we have different offices all around the world. If you are global minded, enthusiastic, energetic and ambitious, come and join us!</strong></p>',100,'12344321','Verified','https://outcubator.com/','2024-11-30 21:51:13','2024-12-01 06:05:33','TP.HCM','1234567890','tuanng@gmail.com','https://www.dropbox.com/scl/fi/982lw1643sm6yvi6q53f9/674beb3ac0fa3.pdf?rlkey=w77g52hoo31ythchc4hyvkrem&raw=1'),(4,'GLO-TECH','https://res.cloudinary.com/dxrfmq2ru/image/upload/v1733133301/cv_uploads/lz9q4i6uvt2skqpnoevj.webp','https://res.cloudinary.com/dxrfmq2ru/image/upload/v1733133304/cv_uploads/br25z0pauqxoudiqjw7r.png','<p><span style=\"color: rgb(51, 51, 51);\">Công ty Glotech đã tiến hành các hoạt động kinh doanh và tích cực hỗ trợ Người lao động Việt nam có tay nghề cao đi làm việc ở nhiều quốc gia trên thế giới. Đặc biệt, được sự cấp phép của Tổ chức Hợp tác Đào tạo Quốc Tế Nhật Bản (JITCO), toàn thể ban lãnh đạo cũng như đội ngũ nhân viên của Công ty đã và đang dành tâm huyết, nỗ lực thúc đẩy hoạt động tư vấn du học và đưa thực tập sinh kỹ năng sang sinh sống, học tập và làm việc tại Nhật Bản, một thị trường tiềm năng đầy hứa hẹn và phát triển.</span></p>',100,'1234554321','Verified','http://glotech.com.vn/','2024-12-02 02:55:13','2024-12-02 22:53:55','03-OCT2-Khu đô thị RESCO P. Cổ Nhuế 2- Q. Bắc Từ Liêm – TP. Hà Nội','1234567890','doe@gmail.com','https://www.dropbox.com/scl/fi/dg2930mvhch523gi9rfcc/674d83f9e3d2a.pdf?rlkey=gawkxfafddm97jahf6hmwracw&raw=1'),(5,'Tập đoàn FPT','https://res.cloudinary.com/dxrfmq2ru/image/upload/v1733216915/cv_uploads/ccaz8lsiwlahkcu4wjmq.webp','https://res.cloudinary.com/dxrfmq2ru/image/upload/v1733216917/cv_uploads/k5x7hpmsubseygiqsvbx.webp','<p>FPT tự hào là tập đoàn công nghệ hàng đầu Việt Nam.</p><p><br></p><p>Thành lập ngày 13/09/1988, FPT hoạt động trong 03 lĩnh vực kinh doanh cốt lõi gồm: Công nghệ, Viễn thông và Giáo dục. FPT sở hữu hạ tầng viễn thông phủ khắp 59/63 tỉnh thành tại Việt Nam và không ngừng mở rộng hoạt động trên thị trường toàn cầu với 48 văn phòng tại 26 quốc gia và vùng lãnh thổ bên ngoài Việt Nam.</p><p>Trong suốt quá trình hoạt động, FPT luôn nỗ lực với mục tiêu cao nhất là mang lại sự hài lòng cho khách hàng thông qua những dịch vụ, sản phẩm và giải pháp công nghệ tối ưu nhất. Đồng thời, FPT không ngừng nghiên cứu và tiên phong trong các xu hướng công nghệ mới góp phần khẳng định vị thế của Việt Nam trong cuộc cách mạng công nghiệp lần thứ 4 - Cuộc cách mạng số. FPT sẽ tiên phong cung cấp dịch vụ chuyển đổi số toàn diện cho các tổ chức, doanh nghiệp trên quy mô toàn cầu.</p>',10,'467','Verified','https://tuyendung.fpt.com/','2024-12-03 02:08:43','2024-12-03 02:10:05','Số 10 Phạm Văn Bạch, Cầu Giấy, Hà Nội','0849706640','tuyendungfpt@gmail.com','https://www.dropbox.com/scl/fi/pyog0ua5fbvpktf6nsr7a/674eca96ee43a.pdf?rlkey=a5i9aar7j1q7alcw4r8xq6rdz&raw=1');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropbox_tokens`
--

DROP TABLE IF EXISTS `dropbox_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dropbox_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `expires_in` datetime NOT NULL,
  `token_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropbox_tokens`
--

LOCK TABLES `dropbox_tokens` WRITE;
/*!40000 ALTER TABLE `dropbox_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropbox_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_of_work`
--

DROP TABLE IF EXISTS `form_of_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_of_work` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_of_work`
--

LOCK TABLES `form_of_work` WRITE;
/*!40000 ALTER TABLE `form_of_work` DISABLE KEYS */;
INSERT INTO `form_of_work` VALUES (1,'Full-time',NULL,NULL,NULL),(2,'Part-time',NULL,NULL,NULL),(3,'Remote','Làm việc từ xa','2024-11-30 23:34:59','2024-11-30 23:34:59'),(4,'Hybrid','Kết hợp remote và on-site','2024-11-30 23:35:34','2024-11-30 23:35:34'),(5,'on-site','làm việc tại văn phòng','2024-11-30 23:35:46','2024-11-30 23:35:46');
/*!40000 ALTER TABLE `form_of_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'Intern',NULL,NULL),(2,'Fresher',NULL,NULL),(3,'Junior',NULL,NULL),(4,'Middle',NULL,NULL),(5,'Senior',NULL,NULL),(6,'Techlead',NULL,NULL),(7,'PM',NULL,NULL);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1),(2,'2024_11_16_022523_create_roles_table',1),(3,'2024_11_16_022921_create_positions_table',1),(4,'2024_11_16_022957_create_level_table',1),(5,'2024_11_16_023020_create_tags_table',1),(6,'2024_11_16_023045_create_area_table',1),(7,'2024_11_16_023059_create_categories_table',1),(8,'2024_11_16_023200_create_form_of_work_table',1),(9,'2024_11_16_023220_create_company_table',1),(10,'2024_11_16_023250_create_posts_table',1),(11,'2024_11_16_023420_create_user_table',1),(12,'2024_11_16_023432_create_users_posts_table',1),(13,'2024_11_16_023818_create_user_role_table',1),(14,'2024_11_16_023915_create_post_position_table',1),(15,'2024_11_16_024005_create_post_tag_table',1),(16,'2024_11_16_024043_create_post_level_table',1),(17,'2024_11_16_024924_create_user_company_table',1),(18,'2024_11_20_071717_add_many_field_on_user_table',1),(19,'2024_11_20_125716_create_user_verifications_table',1),(20,'2024_11_21_132935_add_google_facebook_id_on_user_table',2),(21,'2024_11_29_031114_add_field_on_post_table',3),(22,'2024_11_29_031657_drop_user_company_table',3),(23,'2024_11_29_031831_add_company_id_to_users_table',4),(24,'2024_11_29_052721_modify_data_type_on_post_table',5),(25,'2024_11_29_063613_add_field_on_user_post_table',6),(26,'2024_11_29_120748_create_dropbox_tokens_table',7),(27,'2024_12_01_032958_add_field_on_company_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,NULL,'2024-12-01 07:34:43','BE Developer','Back-end Developer'),(2,NULL,'2024-12-01 07:36:34','FE Developer','Front-end Developer'),(3,NULL,NULL,'Fullstack Developer',NULL),(4,NULL,NULL,'Devops',NULL),(5,NULL,'2024-12-01 07:31:29','Cloud Engineer','Cloud'),(8,NULL,NULL,'Embedded Engineer',NULL),(9,NULL,'2024-12-01 07:35:37','BA','Business Analytist');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `area_id` bigint unsigned DEFAULT NULL,
  `due_at` timestamp NULL DEFAULT NULL,
  `benefit` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `form_of_work_id` bigint unsigned DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `qualification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `post_company_id_foreign` (`company_id`),
  KEY `post_area_id_foreign` (`area_id`),
  KEY `post_form_of_work_id_foreign` (`form_of_work_id`),
  KEY `post_category_id_foreign` (`category_id`),
  CONSTRAINT `post_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_form_of_work_id_foreign` FOREIGN KEY (`form_of_work_id`) REFERENCES `form_of_work` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2024-11-26 21:18:17','2024-12-01 23:17:06','D-Soft open vị trí FRONTEND DEVELOPER','<p><strong>Chi tiết tại đây:</strong></p><p><a href=\"https://d-soft.com.vn/job/frontend-developer?fbclid=IwZXh0bgNhZW0CMTAAAR1xv205m158kCxwPiMpgvW0xeM0ql3lhfu1u1XU012S6QuWlvuA2uYpjQo_aem__2vZUzDRRCLj60Nys1qkqA\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"background-color: transparent; color: var(--blue-link);\">https://d-soft.com.vn/job/frontend-developer</a></p><p><br></p><p>Gửi CV về email: recruitment@d-soft.com.vn</p>','published',1,1,'2024-11-28 17:00:00','<p><strong>Vì sao nên gia nhập D-Soft?</strong></p><ul><li>   Môi trường chuyên nghiệp và năng động, tập trung vào phát triển bản thân và thăng tiến.</li><li>   Lương thưởng cạnh tranh cùng chính sách phúc lợi hấp dẫn.</li></ul>',1,5,25000000.00,1,'<p><strong>YÊU CẦU ỨNG VIÊN:</strong></p><ul><li>- Có ít nhất từ 1.5 năm kinh nghiệm lập trình Frontend với Vuejs, HTML, Javascript, Typescript, SCSS.</li><li>- Đã từng sử dụng hoặc có hiểu biết về PHP Laravel, Database (MySQL/Oracle/NoSQL) là 1 lợi thế.</li><li>- Có hiểu biết về RESTful service, functional programming, clean code, design pattern.</li><li>- Có khả năng tối ưu hiệu năng các ứng dụng web.</li><li>- Có kinh nghiệm xây dựng các ứng dụng responsive web, hiểu biết về UI/UX.</li><li>- Kinh nghiệm làm việc với các công cụ quản lý dự án: Redmine, Backlog...</li><li>- Công cụ quản lý source code: GitLab, GitHub.</li><li>- Có kinh nghiệm làm việc theo mô hình Agile/Scrum.</li></ul>'),(4,'2024-11-27 00:27:47','2024-11-30 06:10:45','BE Developer Recruitment','This is a description of the new job post.','open',1,3,'2024-12-30 17:00:00','Health insurance, Paid time off',2,5,25000000.00,2,NULL),(5,'2024-11-28 23:31:28','2024-11-30 06:27:56','INTERN LARAVEL DEVELOPER','<p>&nbsp;Mô tả công việc:</p><ul><li>Tham gia phát triển và bảo trì các dự án web ứng dụng sử dụng framework Laravel.</li><li>Hỗ trợ triển khai các tính năng mới, tối ưu code và fix lỗi.</li><li>Tìm hiểu và áp dụng các công nghệ mới nhằm cải thiện hiệu suất hệ thống.</li><li>Làm việc theo sự phân công và hướng dẫn của mentor/leader.</li></ul><p><br></p>','published',1,3,'2024-12-29 17:00:00','<p>Quyền lợi:</p><ul><li>Được đào tạo chuyên sâu về Laravel và các công nghệ liên quan.</li><li>Được tham gia vào dự án thực tế và cơ hội làm việc lâu dài sau khi ra trường.</li><li>Môi trường làm việc trẻ trung, năng động, hỗ trợ tối đa để phát triển kỹ năng.</li><li>Được hỗ trợ chi phí trong quá trình thực tập.</li></ul>',1,5,2500000.00,1,'<p><strong>Yêu cầu:</strong></p><ul><li>Sinh viên năm cuối hoặc vừa tốt nghiệp các trường đại học CNTT</li><li>Có kiến thức cơ bản về Php, OOP, Git, ...</li><li>Có kiến thức về Vue.js, React là 1 lợi thế</li><li>Có tinh thần ham học hỏi</li><li>Có thái độ làm việc tốt</li></ul>'),(6,'2024-11-29 02:19:52','2024-11-30 20:53:24','REACTJS MID/SENIOR DEVELOPERS (FRONT-END)','<p>Mô tả công việc:</p><p>- Lập trình web bằng Reactjs các sản phẩm tài chính, chứng khoán, ngân hàng, thương mại điện tử theo thiết kế</p><p>- Code và unittest theo mô hình CICD, deploy lên các nền tảng khác nhau</p><p>- Tích hợp nhiều công nghệ khác nhau vào web để đáp ứng bài toán tài chính, chứng khoán: Restful, Web Socket, Firebase, Grpc,…</p><p>- Xử lý các bài toán streaming, realtime data, realtime UI</p><p>- Tối ưu hóa performance, hướng tới tốc độ xử lý tối ưu nhất</p><p>- Phát triển chuyên sâu về công nghệ Web và Front nói chung</p>','published',1,2,'2024-11-28 17:00:00','<p>Quyền lợi:</p><p> - Làm việc trong môi trường năng động, chuyên nghiệp.</p><p> - Cơ hội thăng tiến và phát triển kỹ năng chuyên môn.</p>',1,5,45000000.00,1,NULL),(7,'2024-11-29 02:33:16','2024-12-01 06:09:36','Full-Stack Systems Developer','<p><span style=\"color: var(--primary-text);\">Trách nhiệm của bạn:</span></p><ul><li><span style=\"color: var(--primary-text);\">Thiết kế hệ thống mạng dựa trên thiết kế cấp cao.</span></li><li><span style=\"color: var(--primary-text);\">Triển khai và duy trì cơ sở hạ tầng trong mọi môi trường.</span></li><li><span style=\"color: var(--primary-text);\">Thiết lập và tối ưu hóa CI/CD pipelines cho ứng dụng.</span></li><li><span style=\"color: var(--primary-text);\">Phát hiện và khắc phục các lỗ hổng bảo mật trong hạ tầng.</span></li><li><span style=\"color: var(--primary-text);\">Giám sát chỉ số và cải thiện chất lượng cơ sở hạ tầng.</span></li></ul>','published',1,3,'2024-12-29 17:00:00','<p>Lợi ích</p><ul><li>Tiêu chuẩn lương 13 tháng</li><li>Đánh giá: 2 lần một năm và 14 tháng xét thưởng KPI</li><li>Kiểm tra sức khỏe hàng năm &amp; bảo hiểm y tế</li><li>Sự kiện thể thao và nghệ thuật (Câu lạc bộ tiếng Anh/bóng đá... )</li><li>Chuyến đi công ty, lễ kỷ niệm, ngày lễ...</li></ul>',1,10,45000000.00,1,'<p> Yêu cầu</p><ul><li>Thành thạo các ngôn ngữ lập trình như JavaScript, HTML, CSS, PHP, PowerShell, Python và SQL</li><li>Thông thạo tiếng Anh, cả viết lẫn nói</li><li>Các chứng nhận liên quan trong Microsoft Power Platform, SharePoint hoặc các công nghệ liên quan là lợi thế</li></ul>'),(8,'2024-11-30 05:12:54','2024-11-30 05:16:34','TUYỂN DỤNG BACKEND DEVOLOPER','<p><strong>CÁCH ỨNG TUYỂN: </strong></p><ul><li>Gửi hồ sơ qua email: khaidangtuyendung@gmail.com (Vị trí ứng tuyển - Họ và tên)</li></ul><p><br></p><p><strong style=\"color: var(--primary-text);\">THỜI GIAN LÀM VIỆC:</strong></p><ul><li><span style=\"color: var(--primary-text);\">8.5 giờ/ngày (Tháng được off 4 ngày có lương)</span></li></ul>','published',1,1,'2024-12-29 17:00:00','<p><span style=\"color: var(--primary-text);\">QUYỀN LỢI:</span></p><ul><li><span style=\"color: var(--primary-text);\">Thu nhập hấp dẫn, lên đến 60.000.000 VNĐ tùy vào năng lực (LBC + Thưởng)</span></li><li><span style=\"color: var(--primary-text);\">Lương tháng 13, thưởng thâm niên</span></li></ul>',5,5,30000000.00,1,'<p><span style=\"color: var(--primary-text);\">YÊU CẦU:</span></p><ul><li><span style=\"color: var(--primary-text);\">Tối thiểu 1 năm kinh nghiệm thực tế với NodeJS/.NET</span></li><li><span style=\"color: var(--primary-text);\">Nắm vững HTML5, CSS3, JavaScript (ES6), và cơ sở dữ liệu (SQLServer, MongoDB, MySQL).</span></li><li><span style=\"color: var(--primary-text);\">Hiểu rõ MVC, OOP, RESTful API và các framework phổ biến như .NET Core.</span></li><li><span style=\"color: var(--primary-text);\">Có tư duy logic, khả năng làm việc nhóm, và đọc hiểu tiếng Anh tốt.</span></li><li><span style=\"color: var(--primary-text);\">Ưu tiên: Ứng viên có nền tảng IT vững hoặc thành thạo nhiều ngôn ngữ lập trình.</span></li></ul><p><br></p>'),(9,'2024-11-30 22:29:53','2024-11-30 22:29:53','TUYỂN DỤNG BACKEND DEVOLOPER','<p><span style=\"color: var(--primary-text);\">THỜI GIAN LÀM VIỆC:</span></p><p><span style=\"color: var(--primary-text);\">• 8.5 giờ/ngày (Tháng được off 4 ngày có lương)</span></p><p><span style=\"color: var(--primary-text);\"><span class=\"ql-cursor\">﻿</span></span><img src=\"https://scontent.fdad3-5.fna.fbcdn.net/v/t39.30808-6/468936795_122105436698644023_4020596009076601871_n.jpg?_nc_cat=107&amp;ccb=1-7&amp;_nc_sid=aa7b47&amp;_nc_eui2=AeGkOdvUnVSqb2tGOBqoQmvQSf7FFZ6S_ThJ_sUVnpL9OCTlL8FkqskBK9PpqCCMXM_N8Dj4cpstCo88EWXoEpSa&amp;_nc_ohc=kJdOW07hj-wQ7kNvgFIAGL1&amp;_nc_zt=23&amp;_nc_ht=scontent.fdad3-5.fna&amp;_nc_gid=AdolFCXUVQ72g81CvE4TW79&amp;oh=00_AYCM2o04lUQT9xHF22-OAZlUBfrtAENH_WXR_JNlDeuRAQ&amp;oe=6751D570\" alt=\"Có thể là đồ họa về văn bản\"></p>','published',3,3,'2024-12-28 17:00:00','<p><span style=\"color: var(--primary-text);\">QUYỀN LỢI:</span></p><p><span style=\"color: var(--primary-text);\">• Thu nhập hấp dẫn, lên đến 60.000.000 VNĐ tùy vào năng lực (LBC + Thưởng)</span></p><p><span style=\"color: var(--primary-text);\">• Lương tháng 13, thưởng thâm niên</span></p>',5,4,16000000.00,1,'<p><span style=\"color: var(--primary-text);\">YÊU CẦU:</span></p><p><span style=\"color: var(--primary-text);\">• Tối thiểu 1 năm kinh nghiệm thực tế với NodeJS/.NET</span></p><p><span style=\"color: var(--primary-text);\">• Nắm vững HTML5, CSS3, JavaScript (ES6), và cơ sở dữ liệu (SQLServer, MongoDB, MySQL).</span></p><p><span style=\"color: var(--primary-text);\">• Hiểu rõ MVC, OOP, RESTful API và các framework phổ biến như .NET Core.</span></p><p><span style=\"color: var(--primary-text);\">• Có tư duy logic, khả năng làm việc nhóm, và đọc hiểu tiếng Anh tốt.</span></p><p><span style=\"color: var(--primary-text);\">• Ưu tiên: Ứng viên có nền tảng IT vững hoặc thành thạo nhiều ngôn ngữ lập trình.</span></p>'),(10,'2024-12-02 05:27:17','2024-12-02 05:27:17','Sartoro - Tuyển dụng Website Development','<ul><li><span style=\"color: var(--primary-text);\">Thu nhập: 25tr/tháng (Gross)</span></li><li><span style=\"color: var(--primary-text);\">Thời gian làm việc: Thứ 2 - Thứ 7</span></li><li><span style=\"color: var(--primary-text);\">Địa điểm làm việc: 119 Lý Thường Kiệt, Phường Sơn Phong, Thành phố Hội An</span></li></ul><p><img src=\"https://scontent.fdad3-3.fna.fbcdn.net/v/t39.30808-6/469141134_1849518612644328_2788720586800642887_n.jpg?stp=dst-jpg_p526x296_tt6&amp;_nc_cat=106&amp;ccb=1-7&amp;_nc_sid=aa7b47&amp;_nc_eui2=AeEuIsa4XGTfQ4AP9y_OH3wN89MuZmMFswfz0y5mYwWzB5qx1xnf9ecG8r_MU0ZvOuKWF17gYvKgWZH7SrqHnOyA&amp;_nc_ohc=VXEoSCntnJYQ7kNvgF677Bm&amp;_nc_zt=23&amp;_nc_ht=scontent.fdad3-3.fna&amp;_nc_gid=ASMGSznc96du2mkUGBO8MZY&amp;oh=00_AYASQ1c6d0lCdRNFE5JrzH01d5YhQd3M3aVFKLh690ViNg&amp;oe=67538BD5\" alt=\"Có thể là đồ họa về văn bản cho biết \'SARTORO We Are Hiring! WEBSITE DEVELOPER D Fluent English At least 2 years of website experience, preferably with Shopify experience Gross salary: 25 mil/month Ho An city minhnth@talentnetgroup.com 0333 585 335 (zalo)\'\"></p><p><br></p><p>Ứng tuyển bằng cách gửi CV Tiếng Anh về mail minhnth@talentnetgroup.com với tiêu đề [Website Developer_Full Name] hoặc liên hệ qua Zalo - 0333 585 335 để có thêm thông tin chi tiết.</p>','published',4,3,'2024-12-23 17:00:00','<p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tf1/1/16/1f4af.png\" alt=\"?\" height=\"16\" width=\"16\"> Chỉ 1 round technical interview cùng với Tech Team</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tf1/1/16/1f4af.png\" alt=\"?\" height=\"16\" width=\"16\"> Offer cuối năm vô cùng hấp dẫn, support Ứng viên onboard đầu năm</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tf1/1/16/1f4af.png\" alt=\"?\" height=\"16\" width=\"16\"> Nhận Full lương trong thời gian probation</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tf1/1/16/1f4af.png\" alt=\"?\" height=\"16\" width=\"16\"> Được tham gia làm việc cùng team dày dặn kinh nghiệm, tha hồ trao đổi và học hỏi thêm được nhiều kiến thức</p>',1,5,25000000.00,1,'<blockquote><span style=\"color: var(--primary-text);\">Kinh nghiệm từ 2 năm về phát triển Frontend (JavaScript/HTML/CSS/SCSS)</span></blockquote><p><br></p><blockquote><strong style=\"color: var(--primary-text);\">Kinh nghiệm về VanillaJS</strong></blockquote><p><br></p><blockquote><span style=\"color: var(--primary-text);\">Không yêu cầu ngoại ngữ</span></blockquote><p><br></p>'),(11,'2024-12-03 02:14:46','2024-12-03 02:15:51','Senior Business Analyst','<ul><li>Acting as the bridge between customer and stakeholder to clarify requirements with tech team (data teams, developers, QC, UI designer,..) both business and system analysis view as well as the bridge among internal team</li><li>Collaborate with internal and external stakeholders to do user research, analyze and derive business, analyze functional and non-functional requirements for data products, write SRS (Software Requirement Specification), user stories, mockup,.. and managing product change requests with different priority</li></ul><p><br></p>','published',5,1,'2024-12-10 17:00:00','<ul><li>You’ll love working in our dynamic environment with &gt;80.000 young &amp; active employees, Honor &amp; Award for the best employees who have great contribution to the company’s success, especially the awards night for 50 best employees each year will be held overseas</li><li>Unique culture with many exciting activities: rookie training, 72 hours experience, team building, status quo, village festival ...</li></ul><p><br></p>',1,2,25000000.00,1,'<ul><li>Being trained by professionals, having many promoting opportunities to become managers in the leading technology groups in Vietnam, with more than 80,000 people and a professional environment</li><li>Obtaining full legal insurance coverage for yourself and your family with FPT-Care</li></ul><p><br></p>');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_level`
--

DROP TABLE IF EXISTS `post_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_level` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned DEFAULT NULL,
  `level_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_level_post_id_foreign` (`post_id`),
  KEY `post_level_level_id_foreign` (`level_id`),
  CONSTRAINT `post_level_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_level_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_level`
--

LOCK TABLES `post_level` WRITE;
/*!40000 ALTER TABLE `post_level` DISABLE KEYS */;
INSERT INTO `post_level` VALUES (5,4,1,NULL,NULL),(6,4,2,NULL,NULL),(7,6,4,NULL,NULL),(8,6,5,NULL,NULL),(9,7,4,NULL,NULL),(10,7,5,NULL,NULL),(11,8,3,NULL,NULL),(12,8,4,NULL,NULL),(13,1,3,NULL,NULL),(14,1,4,NULL,NULL),(15,5,1,NULL,NULL),(16,5,2,NULL,NULL),(17,9,5,NULL,NULL),(18,10,3,NULL,NULL),(19,10,4,NULL,NULL),(20,11,5,NULL,NULL);
/*!40000 ALTER TABLE `post_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_position`
--

DROP TABLE IF EXISTS `post_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_position` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `position_id` bigint unsigned DEFAULT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_position_position_id_foreign` (`position_id`),
  KEY `post_position_post_id_foreign` (`post_id`),
  CONSTRAINT `post_position_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_position_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_position`
--

LOCK TABLES `post_position` WRITE;
/*!40000 ALTER TABLE `post_position` DISABLE KEYS */;
INSERT INTO `post_position` VALUES (2,1,1,NULL,NULL),(3,1,4,NULL,NULL),(4,2,6,NULL,NULL),(7,1,7,NULL,NULL),(8,2,7,NULL,NULL),(9,1,8,NULL,NULL),(10,1,5,NULL,NULL),(11,1,9,NULL,NULL),(12,1,10,NULL,NULL),(13,2,10,NULL,NULL),(14,3,10,NULL,NULL),(15,1,11,NULL,NULL),(16,2,11,NULL,NULL);
/*!40000 ALTER TABLE `post_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned DEFAULT NULL,
  `tag_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_post_id_foreign` (`post_id`),
  KEY `post_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (2,1,4,NULL,NULL),(3,1,5,NULL,NULL),(6,4,4,NULL,NULL),(7,4,5,NULL,NULL),(8,7,4,NULL,NULL),(9,7,5,NULL,NULL),(10,7,9,NULL,NULL),(11,7,10,NULL,NULL),(12,7,11,NULL,NULL),(13,8,4,NULL,NULL),(14,8,5,NULL,NULL),(15,8,13,NULL,NULL),(16,5,5,NULL,NULL),(17,5,10,NULL,NULL),(18,9,4,NULL,NULL),(19,9,5,NULL,NULL),(20,9,8,NULL,NULL),(21,10,4,NULL,NULL),(22,10,5,NULL,NULL),(23,10,10,NULL,NULL),(24,10,11,NULL,NULL),(25,11,7,NULL,NULL);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'2024-11-22 19:51:59','2024-11-25 05:37:23','USER','Role for Candidate'),(2,'2024-11-22 19:51:59','2024-11-25 05:38:32','HR','Role for HR of company\nOne account per company'),(3,'2024-11-22 19:51:59','2024-11-25 05:39:00','ADMIN','Admin can access everything!'),(4,'2024-11-25 05:41:08','2024-11-28 07:50:31','TEST','testtttttttttttt');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (4,'nodejs','2024-11-24 23:40:18','2024-11-24 23:53:46'),(5,'php/laravel','2024-11-24 23:46:54','2024-11-24 23:53:56'),(7,'java/spring boot','2024-11-25 00:13:34','2024-11-26 20:08:42'),(8,'c#/.net','2024-11-25 00:18:50','2024-11-25 00:18:50'),(9,'aws/cloud','2024-11-25 00:18:59','2024-11-25 04:00:13'),(10,'reactjs','2024-11-25 00:19:29','2024-11-25 00:19:29'),(11,'nextjs','2024-11-25 00:19:42','2024-11-25 00:19:42'),(12,'ruby on rails','2024-11-25 00:19:59','2024-11-25 00:19:59'),(13,'nestjs','2024-11-25 00:20:20','2024-11-25 00:20:20'),(15,'angular','2024-11-25 00:21:10','2024-11-25 00:21:10'),(17,'c/c++','2024-11-25 01:02:41','2024-11-25 01:02:41');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_letter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `apply_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_post_user_id_foreign` (`user_id`),
  KEY `user_post_post_id_foreign` (`post_id`),
  CONSTRAINT `user_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post`
--

LOCK TABLES `user_post` WRITE;
/*!40000 ALTER TABLE `user_post` DISABLE KEYS */;
INSERT INTO `user_post` VALUES (3,19,4,'','test','Applied','Apply job','2024-11-27 08:34:37','2024-11-27 08:34:37',NULL),(4,19,1,'','test','Applied','Apply job','2024-11-27 08:35:01','2024-11-27 08:35:01',NULL),(5,13,4,'','test','Applied','BE Developer Recruitment','2024-11-27 16:08:09','2024-11-27 16:08:09',NULL),(6,16,5,NULL,NULL,'posted',NULL,'2024-11-28 23:31:28','2024-11-28 23:31:28',NULL),(7,16,6,NULL,NULL,'posted',NULL,'2024-11-29 02:19:52','2024-11-29 02:19:52',NULL),(8,16,7,NULL,NULL,'posted',NULL,'2024-11-29 02:33:16','2024-11-29 02:33:16',NULL),(9,12,1,'','test','Applied','Apply job','2024-11-29 04:46:41','2024-11-29 04:46:41',NULL),(11,12,1,'https://www.dropbox.com/scl/fi/fub8t5qgyryesu3hr6kxl/6749ba24250b7.pdf?rlkey=uoh0j45oe32spuelrp3w6h1t3&raw=1','test','Applied','Apply job','2024-11-29 05:57:11','2024-11-29 05:57:11',NULL),(12,12,7,'https://www.dropbox.com/scl/fi/fye4s80da6q1aue7czyfk/6749bb4735701.pdf?rlkey=646yguzhy7w7ejygq85qis3bx&raw=1','test','Applied','Apply job','2024-11-29 06:02:03','2024-11-29 06:02:03',NULL),(13,13,7,'https://www.dropbox.com/scl/fi/6vbrib0n0ejsq6hko1agd/6749bbce1ec65.pdf?rlkey=s80mhs45qkgdaiatghxzz7hbu&raw=1','I\'m preciated to apply this job','Applied','Full-Stack Systems Developer | 3+ YOE | Up to 42M','2024-11-29 06:04:18','2024-11-29 06:04:18',NULL),(14,13,6,'https://www.dropbox.com/scl/fi/k49i6xrdd3jqnc8rlj38l/6749bc4695e31.pdf?rlkey=4rv7pkuca9su7cs79fhfgg2ho&raw=1','I\'m preciated to apply this job','Applied','REACTJS MID/SENIOR DEVELOPERS (FRONT-END)','2024-11-29 06:06:18','2024-11-29 06:06:18',NULL),(15,16,8,NULL,NULL,'posted',NULL,'2024-11-30 05:12:55','2024-11-30 05:12:55',NULL),(16,4,9,NULL,NULL,'posted',NULL,'2024-11-30 22:29:53','2024-11-30 22:29:53',NULL),(17,13,1,'https://www.dropbox.com/scl/fi/7avkp0tkmrn1igi77frig/674c25e68adb7.pdf?rlkey=x0hu3t4ohyyg50xopgs1i7yx7&raw=1','Applied','Applied','D-Soft open vị trí FRONTEND DEVELOPER','2024-12-01 02:01:33','2024-12-01 02:01:33','2024-12-01'),(18,3,10,NULL,NULL,'posted',NULL,'2024-12-02 05:27:18','2024-12-02 05:27:18',NULL),(19,21,9,'https://www.dropbox.com/scl/fi/3ka2fdtwokpiqrfzosjkm/674ec8920d43b.pdf?rlkey=grpr6rer4skr7a3m1a7v4ebbl&raw=1','dev django','Applied','TUYỂN DỤNG BACKEND DEVOLOPER','2024-12-03 02:00:06','2024-12-03 02:00:06','2024-12-03'),(20,21,11,NULL,NULL,'posted',NULL,'2024-12-03 02:14:46','2024-12-03 02:14:46',NULL),(21,13,11,'https://www.dropbox.com/scl/fi/o0iy99t6qctkenwotwjfd/674ecd0068c55.pdf?rlkey=4sp67079fojhqjim4n6by2p6w&raw=1','back-end java','Applied','Senior Business Analyst','2024-12-03 02:18:59','2024-12-03 02:18:59','2024-12-03');
/*!40000 ALTER TABLE `user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role_role_id_foreign` (`role_id`),
  KEY `user_role_user_id_foreign` (`user_id`),
  CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (2,1,19,NULL,NULL),(4,3,16,NULL,NULL),(7,2,4,NULL,NULL),(9,2,8,NULL,NULL),(10,1,8,NULL,NULL),(12,1,13,NULL,NULL),(13,1,16,NULL,NULL),(15,2,12,NULL,NULL),(23,2,3,NULL,NULL),(24,1,20,NULL,NULL),(26,2,21,NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_verifications`
--

DROP TABLE IF EXISTS `user_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `otp_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_verifications_user_id_foreign` (`user_id`),
  CONSTRAINT `user_verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_verifications`
--

LOCK TABLES `user_verifications` WRITE;
/*!40000 ALTER TABLE `user_verifications` DISABLE KEYS */;
INSERT INTO `user_verifications` VALUES (3,3,'325680','2024-11-20 06:58:52',1,'2024-11-20 06:53:52','2024-11-20 06:55:22'),(5,4,'699726','2024-11-20 07:09:29',1,'2024-11-20 07:04:29','2024-11-20 07:05:26'),(10,8,'313380','2024-11-21 00:42:14',1,'2024-11-21 00:41:14','2024-11-21 00:41:56'),(13,19,'469670','2024-11-22 20:15:31',1,'2024-11-22 20:14:31','2024-11-22 20:14:47'),(14,20,'497188','2024-12-03 01:50:57',0,'2024-12-03 01:49:57','2024-12-03 01:49:57'),(15,21,'656409','2024-12-03 01:56:32',1,'2024-12-03 01:55:32','2024-12-03 01:55:55');
/*!40000 ALTER TABLE `user_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` text COLLATE utf8mb4_unicode_ci,
  `experience` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_company_id_foreign` (`company_id`),
  CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'John Doe','john@example.com','$2y$10$x54YufEijoqmGaG9gTSx.eARnIaKLT2UQ/LhkS9brKjpuBbN1C3Me','active',1,NULL,NULL,NULL,NULL,'2024-11-20 06:53:52','2024-12-02 19:14:15',NULL,NULL,NULL,4),(4,'thanhtuanle','thanhtuan@gmail.com','$2y$10$08eLna6cOzslmwA0l0acXOoodpVSwPCarAZgI0q8fX1g4HWouuPbS','active',1,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT__BJvvAeHzW_wrz94DrwcozBCnYdyEyRMiw&s',NULL,NULL,NULL,'2024-11-20 07:03:35','2024-12-02 19:14:32',NULL,NULL,NULL,3),(8,'ThanhTuanLe_IAM','doe@gmail.com','$2y$10$DPqNmyE9uEo5AmArE5bhC.bOy1A/0GYD6dP7SMRi3ffCNupsym8a6','inactive',0,NULL,NULL,NULL,NULL,'2024-11-21 00:39:48','2024-11-26 07:13:49',NULL,NULL,NULL,NULL),(12,'Lê Thanh Tuấn','thanhtuanle399@gmail.com','$2y$10$wKZ.Tv42Qn9XUoYRJ6lRIepMyJ/Gsa7zJQsFoivJUNlmP8ZyCeyD2','active',0,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1088277979430797&height=200&width=200&ext=1735712857&hash=AbZ1E6CE1R0EEmsPwP4REo6y',NULL,NULL,NULL,'2024-11-21 23:16:25','2024-12-01 23:27:38',NULL,NULL,'1088277979430797',2),(13,'tuan lethanh','thanhtuanle0209@gmail.com','$2y$10$Q/XhKrmbWWmid8LNm1nC9.RuxnP095wqdHd6o7px.Oyfg3ywkfP2i','active',0,'https://lh3.googleusercontent.com/a/ACg8ocK3G4u6_dGvlyclMGiHxMZG2pACSh_osL9X8vtxIu1Vr9ebwtWB=s96-c',NULL,NULL,'other','2024-11-21 23:17:24','2024-12-01 23:24:32',NULL,'106925391457372337585',NULL,NULL),(16,'Thanhtuan Lê','thanhtuanle939@gmail.com','$2y$10$TVZoT2E1quDw/zqQ5XdWbOVvscdgJ2fYvb5o/Eku3RfTuIJBrhhWm','active',0,'https://lh3.googleusercontent.com/a/ACg8ocJeFSKKBMzsThe0us-LVao3tQlTT6U24QRqbh661Cq9VOzCEMZz=s96-c',NULL,NULL,NULL,'2024-11-22 20:02:10','2024-12-03 02:45:44',NULL,'112248274275698442374',NULL,3),(19,'thanhtuanle123','thanhtuan123@gmail.com','$2y$10$Dt0rWx/Stz0NZNA5xbvxq.tijuIjfbyrd8NBrgg8cYFXG/RU8Hl/y','active',0,NULL,NULL,NULL,NULL,'2024-11-22 20:07:53','2024-11-22 20:14:47',NULL,NULL,NULL,1),(20,'user1','user1@gmail.com','$2y$10$MXkNXrfeozyqz9hMe5UkQeyEciIWxD97Pz3LVyxM/qJdQYyHkUGfK','pending',0,NULL,NULL,NULL,NULL,'2024-12-03 01:49:57','2024-12-03 01:49:57',NULL,NULL,NULL,NULL),(21,'user2','user2@gmail.com','$2y$10$1NiWDQ8zoq7WbWtPQYMcgezjKqJp4DJ6TxUoqL.UwisbSV9ONE9g.','active',0,NULL,NULL,NULL,NULL,'2024-12-03 01:55:32','2024-12-03 02:08:43',NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03 20:49:28
