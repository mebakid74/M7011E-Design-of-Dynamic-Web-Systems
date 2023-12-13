-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
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
-- Table structure for table `account_user`
--

DROP TABLE IF EXISTS `account_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(128) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `role` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `account_user_chk_1` CHECK ((`role` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user`
--

LOCK TABLES `account_user` WRITE;
/*!40000 ALTER TABLE `account_user` DISABLE KEYS */;
INSERT INTO `account_user` VALUES (1,'2023-12-12 18:01:55.077524',1,'Meba Admin','meba@gmail.com','pbkdf2_sha256$600000$Kln2gGqy8Q9vGe2XSiZn3S$isSLu7FQOWSfoPAxW2IkR3dfiAP0wYNiV2pmxI+DsMk=','2023-12-12 18:01:18.687009','',1,1,'',1),(2,NULL,0,'Dr. Amanda Johnson','amanda.johnson@examiner.com','pbkdf2_sha256$600000$IaUN5XzGGWFwxsejlmC8QC$553zf23UE3DPKbxYGZXxxRrLnDyO9b9bZILwR3saBPw=','2023-12-12 18:09:38.650294','',1,0,'',2),(3,NULL,0,'Professor Mark Roberts','mark.roberts@examiner.com','pbkdf2_sha256$600000$Sb6EcpvTVCcTIrFaWEi1h8$i73P4FRr7Qmd3sYiTEvXfzUkB8S3XRWF8Bs8sUZEanE=','2023-12-12 18:11:03.972201','',1,0,'',2),(4,NULL,0,'Sarah Lee','sarah.lee@examiner.com','pbkdf2_sha256$600000$e6OcgrYtIOU5fRyfjVACww$DH/69wk4bYPI4QQpofQTV7ix+dRVl/CiQvXqBvV0ZQQ=','2023-12-12 18:12:06.491634','',1,0,'',2),(5,NULL,0,'John Smithson','john.smithson@examiner.com','pbkdf2_sha256$600000$lW4gu4QdGARvDioI8hswoT$puoqOrO2G9XQPz7SeI2Tgu8PTP/I2WCEjjf4vQL2ccw=','2023-12-12 18:12:34.991398','',1,0,'',2),(6,NULL,0,'Dr. Emily Chang','emily.chang@examiner.com','pbkdf2_sha256$600000$IVvFRy63wbm5ahPyOXKmnf$vzwl//uoG+dmJS+4Zr944q1NAX59j2RMsTJVS8b9esI=','2023-12-12 18:13:02.093903','',1,0,'',2),(7,NULL,0,'Alice Johnson','student1@student.com','pbkdf2_sha256$600000$Ino53FHeZGTszD9AsFgJfV$G/FJEqj5YyE0fMuLpEDpxV0pQ4Wr0yzAbHWWIC5/JQU=','2023-12-12 18:19:22.640928','',1,0,'',3),(8,NULL,0,'Michael Rodriguez','student2@student.com','pbkdf2_sha256$600000$aioB9ZMGvVNAZg74WFyznp$QuE+ga6unjmZZ9C+MjaoUJTs73Dx1xryANdJa6MtVJI=','2023-12-12 18:19:36.939413','',1,0,'',3),(9,NULL,0,'Sophia Patel','student3@student.com','pbkdf2_sha256$600000$lSyewCBVb3OerMLry0p0zH$PeJANGi/Nd6tM6KgQ/ZId5NjQdCHBvG1szyVtUs2roY=','2023-12-12 18:20:25.410458','',1,0,'',3),(10,NULL,0,'Daniel Nguyen','student4@student.com','pbkdf2_sha256$600000$lxuZm2w5dMMwlRMaGM17Yo$A6X8mZVvVMCqfsbZfpwXTXSYjYulgZ42d2ZCyZOQVPY=','2023-12-12 18:20:50.079282','',1,0,'',3),(11,NULL,0,'Olivia Smith','student5@student.com','pbkdf2_sha256$600000$FlOoXB3mlU36rr5cc3ynKt$6kJngYgWOyKTCvVqsjVDuh13RAcGwQjGh2cMFpfWJiM=','2023-12-12 18:21:07.313253','',1,0,'',3),(12,NULL,0,'test','test@gmail.com','pbkdf2_sha256$600000$ED38GridovBeI4WIvoKwab$2ZL4zNEYaL5Cr8SEoY47XvFKd7JgOOyz6EaQ+7iNTsw=','2023-12-12 18:22:43.102170','',1,0,'',NULL),(13,NULL,0,'test','test2@gmail.com','pbkdf2_sha256$600000$7EQVTe45TwzzVTv928WkUP$p1baTfHPM9nHzr8mlvznt3Ghq+SVBQECPJAFaG5IMhE=','2023-12-12 18:22:55.752407','',1,0,'',NULL),(14,NULL,0,'Alexander Breth','student6@student.com','pbkdf2_sha256$600000$y6gGTvE4jO5AvrAeO4dvYH$X73n2UUztaV0aHGaMg+lHxAz3WMjUa7s1HSngAoh650=','2023-12-12 19:04:26.789333','',1,0,'',3);
/*!40000 ALTER TABLE `account_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_groups`
--

DROP TABLE IF EXISTS `account_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_groups_user_id_group_id_4d09af3e_uniq` (`user_id`,`group_id`),
  KEY `account_user_groups_group_id_6c71f749_fk_auth_group_id` (`group_id`),
  CONSTRAINT `account_user_groups_group_id_6c71f749_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `account_user_groups_user_id_14345e7b_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_groups`
--

LOCK TABLES `account_user_groups` WRITE;
/*!40000 ALTER TABLE `account_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_user_permissions`
--

DROP TABLE IF EXISTS `account_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_user_permis_user_id_permission_id_48bdd28b_uniq` (`user_id`,`permission_id`),
  KEY `account_user_user_pe_permission_id_66c44191_fk_auth_perm` (`permission_id`),
  CONSTRAINT `account_user_user_pe_permission_id_66c44191_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `account_user_user_pe_user_id_cc42d270_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_user_permissions`
--

LOCK TABLES `account_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Token',6,'add_token'),(22,'Can change Token',6,'change_token'),(23,'Can delete Token',6,'delete_token'),(24,'Can view Token',6,'view_token'),(25,'Can add token',7,'add_tokenproxy'),(26,'Can change token',7,'change_tokenproxy'),(27,'Can delete token',7,'delete_tokenproxy'),(28,'Can view token',7,'view_tokenproxy'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add course',9,'add_course'),(34,'Can change course',9,'change_course'),(35,'Can delete course',9,'delete_course'),(36,'Can view course',9,'view_course'),(37,'Can add categories',10,'add_categories'),(38,'Can change categories',10,'change_categories'),(39,'Can delete categories',10,'delete_categories'),(40,'Can view categories',10,'view_categories'),(41,'Can add student',11,'add_student'),(42,'Can change student',11,'change_student'),(43,'Can delete student',11,'delete_student'),(44,'Can view student',11,'view_student'),(45,'Can add examiner',12,'add_examiner'),(46,'Can change examiner',12,'change_examiner'),(47,'Can delete examiner',12,'delete_examiner'),(48,'Can view examiner',12,'view_examiner');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_categories`
--

DROP TABLE IF EXISTS `category_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_categories`
--

LOCK TABLES `category_categories` WRITE;
/*!40000 ALTER TABLE `category_categories` DISABLE KEYS */;
INSERT INTO `category_categories` VALUES (1,'Data Science/Analytics'),(2,'Marketing/Digital Marketing'),(3,'Web Development/Programming'),(4,'Artificial Intelligence/Health'),(5,'Entrepreneurship/Business');
/*!40000 ALTER TABLE `category_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_name` varchar(30) NOT NULL,
  `course_description` longtext NOT NULL,
  `course_date` date NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_category_id_42ca7f0b_fk_category_categories_id` (`category_id`),
  CONSTRAINT `course_category_id_42ca7f0b_fk_category_categories_id` FOREIGN KEY (`category_id`) REFERENCES `category_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Introduction to Data Science','This course covers the basics of data science, including data analysis, statistics, and data visualization using tools like Python and R.','2023-02-06',1),(2,'Social Media Marketing Strateg','This course focuses on leveraging social media platforms for marketing purposes, covering content creation, audience engagement, and analytics.','2023-04-10',2),(3,'Full-Stack Web Development Boo','An immersive bootcamp covering front-end and back-end web development, including HTML, CSS, JavaScript, React, Node.js, and databases.','2023-06-05',3),(4,'Entrepreneurship and Startup','Covers startup fundamentals, business planning, funding options, market analysis, and growth strategies for new ventures.','2023-08-14',5),(5,'AI Applications in Healthcare','Explores AI\'s applications in healthcare, including predictive analytics, medical imaging, and personalized treatment recommendations.','2023-10-09',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-12-12 18:02:17.989674','1','Data Science/Analytics',1,'[{\"added\": {}}]',10,1),(2,'2023-12-12 18:02:25.545994','2','Marketing/Digital Marketing',1,'[{\"added\": {}}]',10,1),(3,'2023-12-12 18:02:33.125180','3','Web Development/Programming',1,'[{\"added\": {}}]',10,1),(4,'2023-12-12 18:02:49.875335','4','Artificial Intelligence/Health',1,'[{\"added\": {}}]',10,1),(5,'2023-12-12 18:03:46.964935','1','Introduction to Data Science',1,'[{\"added\": {}}]',9,1),(6,'2023-12-12 18:04:13.048279','2','Social Media Marketing Strateg',1,'[{\"added\": {}}]',9,1),(7,'2023-12-12 18:04:39.053773','3','Full-Stack Web Development Boo',1,'[{\"added\": {}}]',9,1),(8,'2023-12-12 18:05:34.666871','5','Entrepreneurship/Business',1,'[{\"added\": {}}]',10,1),(9,'2023-12-12 18:06:05.687647','4','Entrepreneurship and Startup',1,'[{\"added\": {}}]',9,1),(10,'2023-12-12 18:06:28.293559','5','AI Applications in Healthcare',1,'[{\"added\": {}}]',9,1),(11,'2023-12-12 18:10:37.999211','1','Examiner: amanda.johnson@examiner.com',1,'[{\"added\": {}}]',12,1),(12,'2023-12-12 18:11:44.944033','2','Examiner: mark.roberts@examiner.com',1,'[{\"added\": {}}]',12,1),(13,'2023-12-12 18:14:06.983659','3','Examiner: sarah.lee@examiner.com',1,'[{\"added\": {}}]',12,1),(14,'2023-12-12 18:14:46.048223','4','Examiner: john.smithson@examiner.com',1,'[{\"added\": {}}]',12,1),(15,'2023-12-12 18:15:19.867638','5','Examiner: emily.chang@examiner.com',1,'[{\"added\": {}}]',12,1),(16,'2023-12-12 18:21:30.452462','1','Student: student1@student.com',1,'[{\"added\": {}}]',11,1),(17,'2023-12-12 18:21:36.533619','2','Student: student2@student.com',1,'[{\"added\": {}}]',11,1),(18,'2023-12-12 18:21:41.591260','3','Student: student3@student.com',1,'[{\"added\": {}}]',11,1),(19,'2023-12-12 18:21:47.110020','4','Student: student4@student.com',1,'[{\"added\": {}}]',11,1),(20,'2023-12-12 18:21:53.470784','5','Student: student5@student.com',1,'[{\"added\": {}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(7,'authtoken','tokenproxy'),(10,'category','categories'),(4,'contenttypes','contenttype'),(9,'course','course'),(12,'examiner','examiner'),(5,'sessions','session'),(11,'student','student');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-12 17:52:41.916951'),(2,'contenttypes','0002_remove_content_type_name','2023-12-12 17:52:42.073181'),(3,'auth','0001_initial','2023-12-12 17:52:43.088852'),(4,'auth','0002_alter_permission_name_max_length','2023-12-12 17:52:43.273593'),(5,'auth','0003_alter_user_email_max_length','2023-12-12 17:52:43.304809'),(6,'auth','0004_alter_user_username_opts','2023-12-12 17:52:43.320429'),(7,'auth','0005_alter_user_last_login_null','2023-12-12 17:52:43.336085'),(8,'auth','0006_require_contenttypes_0002','2023-12-12 17:52:43.367350'),(9,'auth','0007_alter_validators_add_error_messages','2023-12-12 17:52:43.382975'),(10,'auth','0008_alter_user_username_max_length','2023-12-12 17:52:43.398597'),(11,'auth','0009_alter_user_last_name_max_length','2023-12-12 17:52:43.414178'),(12,'auth','0010_alter_group_name_max_length','2023-12-12 17:52:43.476688'),(13,'auth','0011_update_proxy_permissions','2023-12-12 17:52:43.492308'),(14,'auth','0012_alter_user_first_name_max_length','2023-12-12 17:52:43.523577'),(15,'account','0001_initial','2023-12-12 17:52:44.132931'),(16,'account','0002_alter_user_options_alter_user_managers_and_more','2023-12-12 17:52:44.414220'),(17,'account','0003_alter_user_options_alter_user_managers_and_more','2023-12-12 17:52:44.742322'),(18,'account','0004_alter_user_managers_alter_user_password','2023-12-12 17:52:44.851677'),(19,'account','0005_user_created_by_user_created_date_user_modified_by_and_more','2023-12-12 17:52:45.664218'),(20,'account','0006_remove_user_uid','2023-12-12 17:52:45.804838'),(21,'account','0007_remove_user_created_by','2023-12-12 17:52:46.101727'),(22,'account','0008_remove_user_created_date_remove_user_modified_by_and_more','2023-12-12 17:52:46.507964'),(23,'account','0009_remove_user_role','2023-12-12 17:52:46.554845'),(24,'account','0010_user_role','2023-12-12 17:52:46.711153'),(25,'account','0011_alter_user_role','2023-12-12 17:52:46.726778'),(26,'account','0012_remove_user_role','2023-12-12 17:52:46.804812'),(27,'account','0013_user_role','2023-12-12 17:52:46.914177'),(28,'admin','0001_initial','2023-12-12 17:52:47.257972'),(29,'admin','0002_logentry_remove_auto_add','2023-12-12 17:52:47.351727'),(30,'admin','0003_logentry_add_action_flag_choices','2023-12-12 17:52:47.398562'),(31,'authtoken','0001_initial','2023-12-12 17:52:47.601719'),(32,'authtoken','0002_auto_20160226_1747','2023-12-12 17:52:47.648598'),(33,'authtoken','0003_tokenproxy','2023-12-12 17:52:47.664219'),(34,'category','0001_initial','2023-12-12 17:52:47.820516'),(35,'category','0002_remove_categories_parent_category','2023-12-12 17:52:47.945473'),(36,'course','0001_initial','2023-12-12 17:52:48.021855'),(37,'course','0002_course_for_admins_course_for_examiners_and_more','2023-12-12 17:52:48.162706'),(38,'course','0003_remove_course_for_admins_remove_course_for_examiners_and_more','2023-12-12 17:52:48.350142'),(39,'course','0004_course_category','2023-12-12 17:52:48.459517'),(40,'examiner','0001_initial','2023-12-12 17:52:48.912600'),(41,'sessions','0001_initial','2023-12-12 17:52:48.990842'),(42,'student','0001_initial','2023-12-12 17:52:49.553338');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('sbfxsbfpsojj57lkx2hmjwgo6594x8d1','.eJxVjDsOwjAQBe_iGlmOvf5R0nMGa7Ne4wBypDipEHeHSCmgfTPzXiLhtta0dV7SlMVZDOL0u41ID247yHdst1nS3NZlGuWuyIN2eZ0zPy-H-3dQsddvTcEBRsKCWpNx2hTvORT2hYIhb5R2HNEyABsbOQJm5GyDAq3cACjeH_asOA8:1rD74t:CUSJ6TMbVhXwUp7_hsy3N5QpQ5FT-TGRv9F2IlRf3us','2023-12-26 18:01:55.118437');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examiner`
--

DROP TABLE IF EXISTS `examiner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examiner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `course_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `examiner_course_id_843c2af9_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `examiner_user_id_d81ddd55_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examiner`
--

LOCK TABLES `examiner` WRITE;
/*!40000 ALTER TABLE `examiner` DISABLE KEYS */;
INSERT INTO `examiner` VALUES (1,'Data Science Specialist','+1 (555) 123-4567','2020-02-12',1,2),(2,'Marketing Analysis Expert','+1 (555) 987-6543','2019-04-12',2,3),(3,'Web Development Consultant','+1 (555) 876-5432','2022-08-12',3,4),(4,'Business Startup Advisor','+1 (555) 234-5678','2018-10-12',4,5),(5,'AI in Healthcare Expert','+1 (555) 789-0123','2023-06-12',5,6);
/*!40000 ALTER TABLE `examiner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `student_user_id_dcc2526f_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,7),(2,8),(3,9),(4,10),(5,11);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` bigint NOT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_courses_student_id_course_id_c791c3fd_uniq` (`student_id`,`course_id`),
  KEY `student_courses_course_id_ce17ed61_fk_course_id` (`course_id`),
  CONSTRAINT `student_courses_course_id_ce17ed61_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `student_courses_student_id_cf7a0670_fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courses`
--

LOCK TABLES `student_courses` WRITE;
/*!40000 ALTER TABLE `student_courses` DISABLE KEYS */;
INSERT INTO `student_courses` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `student_courses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-13 11:17:37
