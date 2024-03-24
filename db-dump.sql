CREATE DATABASE  IF NOT EXISTS `real_estate_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `real_estate_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: real_estate_db
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street_no` varchar(64) NOT NULL,
  `street_name` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `zip` char(5) NOT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `unique_address` (`street_no`,`street_name`,`city`,`zip`),
  KEY `zip` (`zip`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`zip`) REFERENCES `zip_state` (`zip`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (22,'1','Nassau St APT 607','Boston','2111'),(23,'1','Nassau St APT 806','Boston','2111'),(39,'1 E','Pier Dr #C','Boston','2128'),(2,'101','Broadway','Boston','02108'),(19,'101','Pine Street','Boston','02115'),(12,'111','Cedar Street','Boston','02108'),(38,'119','Williams Ave','Hyde Park','2136'),(16,'123','Main Street','Boston','02115'),(44,'1243','Commonwealth Ave','Allston','02134'),(27,'128','Roxbury St','Boston','2119'),(24,'130-140','Bowdoin St #1407','Boston','2108'),(45,'141','Brighton Ave','Allston','02134'),(49,'1429','Centre St','West Roxbury','02132'),(37,'19','Laurie Ave','West Roxbury','2132'),(46,'190','Old Colony Ave','Boston','02127'),(13,'222','Maple Street','Boston','02108'),(28,'23-25','Rockledge St #1','Boston','2119'),(4,'234','Beacon Street','Boston','02108'),(26,'31','Bullard St APT 2','Dorchester','2121'),(30,'31','Wabon St #1','Dorchester','2121'),(6,'321','Newbury Street','Boston','02108'),(31,'327','Commonwealth Ave APT 1','Boston','2115'),(14,'333','Oak Street','Boston','02108'),(36,'36','Grampian Way #36','Dorchester','2125'),(48,'375','Neponset Ave','Dorchester','02122'),(35,'39','Linnet St','West Roxbury','2132'),(29,'41','Pratt St','Allston','2134'),(34,'417','Bunker Hill St UNIT 2','Charlestown','2129'),(8,'444','Commonwealth Avenue','Boston','02108'),(15,'444','Pine Street','Boston','02108'),(17,'456','Elm Street','Boston','02115'),(32,'50','Draper St #1','Dorchester','2122'),(5,'555','Boylston Street','Boston','02108'),(50,'571','Worcester Rd Suite 3','Framingham','01701'),(43,'6','Bremen St suite a','Boston','02128'),(25,'6','Imbaro Rd','Hyde Park','2136'),(42,'607','Boylston St #500','Boston','02116'),(11,'666','Charles Street','Boston','02108'),(9,'777','Huntington Avenue','Boston','02108'),(40,'78','Charles St #1','Boston','02114'),(18,'789','Oak Avenue','Boston','02115'),(3,'789','Washington Street','Boston','02108'),(33,'8','Garrison St APT 711','Boston','2116'),(41,'867','Boylston St','Boston','02116'),(7,'888','Tremont Street','Boston','02108'),(20,'9','Burney St UNIT 407','Roxbury Crossing','2120'),(47,'90',' Canal St','Boston','02114'),(21,'95','Saint Alphonsus St #604','Roxbury Crossing','2120'),(10,'999','Franklin Street','Boston','02108'),(1,'Default','Address','Default','02108');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency` (
  `agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(64) NOT NULL,
  `address_id` int DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`agency_id`),
  UNIQUE KEY `agency_name` (`agency_name`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (1,'Default Agency',1,'(123) 456-789'),(2,'Boston Real Estate Group',1,'123-456-7890'),(3,'Metro Boston Properties',2,'987-654-3210'),(4,'Premier Realty Boston',3,'111-222-3333'),(5,'Boston Elite Realty',4,'555-555-5555'),(6,'Downtown Boston Realty',5,'777-888-9999'),(7,'Beantown Homes',6,'444-333-2222'),(8,'Boston Harbor Real Estate',7,'888-999-1111'),(9,'Back Bay Properties',8,'222-444-6666'),(10,'Fenway Real Estate Agency',9,'333-777-8888'),(11,'South End Realty',10,'666-999-3333'),(12,'Street & Company',40,'(617) 742-3787'),(13,'Charlesgate Realty Group',41,'(617) 587-0100'),(14,'Keller Williams',42,'(617) 542-0012'),(15,'Ezzi Property Group',43,'(617) 329-1012'),(16,'NextGen Realty',44,'(617) 208-2100'),(17,'Modern Real Estate Inc.',45,'(617) 782-7500'),(18,'EVO Real Estate Group, LLC',46,'(617) 517-9755'),(19,'Garzone Real Estate, Inc',47,'(617) 875-6443'),(20,'Coldwell Banker Dorchester',48,'(617) 839-6571'),(21,'CBC Realty LLC',NULL,''),(22,'Coldwell Banker',NULL,''),(23,'Insight Realty Group',49,''),(24,'Coldwell Banker Realty - Framingham',50,'(508) 872-0084'),(25,'Custom Home Realty',NULL,''),(26,'eXp Realty',NULL,''),(27,'Coldwell Banker Residential Brokerage',NULL,'');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `address_cleanup_after_delete_agency` AFTER DELETE ON `agency` FOR EACH ROW BEGIN
	DELETE FROM address WHERE address_id = OLD.address_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `app_client`
--

DROP TABLE IF EXISTS `app_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('M','F','T') NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `app_client_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_client`
--

LOCK TABLES `app_client` WRITE;
/*!40000 ALTER TABLE `app_client` DISABLE KEYS */;
INSERT INTO `app_client` VALUES (1,'857-456-7890','1990-05-15','M',7),(2,'857-654-3210','1985-10-20','M',8);
/*!40000 ALTER TABLE `app_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_role`
--

DROP TABLE IF EXISTS `app_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_role`
--

LOCK TABLES `app_role` WRITE;
/*!40000 ALTER TABLE `app_role` DISABLE KEYS */;
INSERT INTO `app_role` VALUES (2,'Broker'),(3,'Client'),(1,'Owner');
/*!40000 ALTER TABLE `app_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `userpassword` varchar(255) NOT NULL,
  `fname` varchar(64) NOT NULL,
  `lname` varchar(64) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `app_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `email_format` CHECK (regexp_like(`email`,_utf8mb4'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'default.broker','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','Default','Broker','deafult.broker@outlook.net',2),(2,'briana.roger','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','Briana','Roger','shanny.pacocha@outlook.net',1),(3,'delia68','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','Delia','Bombay','delia.bombay@gmail.net',1),(4,'samuel.jackson','5efc2b017da4f7736d192a74dde5891369e0685d4d38f2a455b6fcdab282df9c','Samuel','Jackson','samuel.jackson@example.com',1),(5,'michael.johnson','478a7da128a2875a1484798da2010d8f518ab4f341000da93c59fc5c201ded2c','Michael','Johnson','michael.johnson@example.com',1),(6,'richard.baker','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','Richard J','Baker','rick.baker@hotmail.net',2),(7,'jane.smith','c6ba91b90d922e159893f46c387e5dc1b3dc5c101a5a4522f03b987177a24a91','Jane','Smith','jane.smith@example.com',2),(8,'pushkar.sadphal','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','Pushkar','Sadphal','pushkar.sadphal@neu.edu',3),(9,'brijesh.giri','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','Brijesh','Giri','giri.b@neu.edu',3),(10,'leasing_agent','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','Leasing Agent','','leasing.agent@gmail.com',2),(11,'paul_campano','54b688a517f7654563a6c64d945a3670880a4c602ec67a065bbebbcd2b22edd5','Paul Campano','','paul.campano@gmail.com',2),(12,'georges_awad','e6757959da8eff84c42d4df125b44eb40143dff452afd56aea5cfa058f245028','Georges Awad','','georges.awad@gmail.com',2),(13,'daniel_wong','3fb0a50e69a3bd10bd006726cf744fa50e779bd652b0dda9733137d78af42de5','Daniel Wong','','daniel.wong@gmail.com',2),(14,'roxanne_sarotic','37dcbe95bb1c85c6ba4a40f0a6eaa6eba46466b666d5b47faaa660c66179be84','Roxanne Sarotic','','roxanne.sarotic@gmail.com',2),(15,'modern_real_estate_inc','939522318b738f86e2a1ad2f1b290de97be66c42f3644d4ea9af9cab476b67a4','Modern Real Estate Inc.','','modernrealestate.inc@gmail.com',2),(16,'the_legacy_group','74087a60271b79b517b79d062cba1601377d1bfa1cff8415803ca9997f6bb7a1','The Legacy Group','','thelegacy.group@gmail.com',2),(17,'allen_a_garzone','e5db8c0826e5478a0e433044d77b9b1654c54c6d4c846f6261c917315e08031c','Allen A. Garzone','','allen.a.garzone@gmail.com',2),(18,'anne_galvin','cdb7a70dc7f62bece115efc18f8c40610411766512da21c18aa75eb24d6b7b49','Anne Galvin','','anne.galvin@gmail.com',2),(19,'albert_liu','52f1476494897c64f417deb7ef7cd690f1cea9edce638746c420f1240d3d39dc','Albert Liu','','albert.liu@gmail.com',2),(20,'martha_toti','9387dad42b0069f8946fe26d2c9b4d7ac7a14a3f443317384afae30198a10bda','Martha Toti','','martha.toti@gmail.com',2),(21,'mary_forde','c010cab4e46b823eb75438baf7eb105ac497f00d9c6689b6be6b2aab72522741','Mary Forde','','mary.forde@gmail.com',2),(22,'brian_t_mccarthy','ab313774d734988849e9eccf49bec9de3b1a33ae4a2760e426be7ebd91b48480','Brian T. McCarthy','','brian.t.mccarthy@gmail.com',2),(23,'shannon_hurley','143056c41fe77e6215af36bb11601c327c510a2bf82a3f12af11a95151e53d9f','Shannon Hurley','','shannon.hurley@gmail.com',2),(24,'nao_rouhana','c4a2439f0314870a5465f1804fd7a590fda5ca76d36a7d40a44de9fe1ab48181','Nao Rouhana','','nao.rouhana@gmail.com',2),(25,'sarah_fillmann','89fae6a37843b87aaee632ce3a62fa694ff116dd6216907548abb66cad52c339','Sarah Fillmann','','sarah.fillmann@gmail.com',2),(26,'associates_llc','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','AAM ASSOCIATES LLC','','mptqk2ge@gmail.com',1),(27,'metropolitan_primary','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','METROPOLITAN PRIMARY CONDO','','7wpfnl9z@hotmail.com',1),(28,'bowdoin_realty_llc','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','HAT 9 BOWDOIN REALTY LLC A MASS LLC','','s2vq5loj@yahoo.com',1),(29,'papadopoulos_d','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','PAPADOPOULOS DEMETRI','','8b3yjghp@gmail.com',1),(30,'boston_housing_auth','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','BOSTON HOUSING AUTHORITY','','ptlhz4xk@hotmail.com',1),(31,'buff_bay_assoc','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','BUFF BAY ASSOCIATES','','4nbfwqjv@example.com',1),(32,'broadway_land','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','BROADWAY LAND CO LLC','','vyq2g5rl@gmail.com',1),(33,'z_t_realty','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','Z & T REALTY CORP','','y3znfhw9@yahoo.com',1),(34,'smyth_timothy','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','SMYTH TIMOTHY J','','6i4pcnva@hotmail.com',1),(35,'oneill_pat','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','ONEILL PATRICIA','','c3ghu9ti@example.com',1),(36,'pagan_roberto','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','PAGAN ROBERTO','','k8d2ufm7@gmail.com',1),(37,'grsn_realty','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','13 GRSN REALTY LLC','','psv8o6jz@yahoo.com',1),(38,'bunker_hill_trust','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','BUNKER HILL CONDO TRUST','','x4u9k3qn@hotmail.com',1),(39,'belliveau_ken','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','BELLIVEAU KENNETH','','mrv3y1ps@example.com',1),(40,'obrien_chris_s','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','OBRIEN CHRISTOPHER S','','1sfm8k5u@gmail.com',1),(41,'gavini_katherine','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','GAVINI KATHERINE E','','d9bv8zns@yahoo.com',1),(42,'city_boston','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','CITY OF BOSTON','','7eijtd6l@hotmail.com',1),(43,'boston_llc','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','BOSTON LLC','','8ub3pdjv@example.com',1);
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_request`
--

DROP TABLE IF EXISTS `application_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_request` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `listing_id` int NOT NULL,
  `client_id` int NOT NULL,
  `application_date` date NOT NULL,
  `application_status` enum('Draft','In Review','Accepted','Rejected','Cancelled') NOT NULL DEFAULT 'Draft',
  `document_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`application_id`),
  KEY `listing_id` (`listing_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `application_request_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`listing_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `application_request_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `app_client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_request`
--

LOCK TABLES `application_request` WRITE;
/*!40000 ALTER TABLE `application_request` DISABLE KEYS */;
INSERT INTO `application_request` VALUES (1,1,1,'2023-12-28','Draft','https://example.com/document1.pdf'),(2,2,2,'2023-12-30','In Review','https://example.com/document2.pdf'),(3,3,1,'2024-01-02','Accepted','https://example.com/document3.pdf');
/*!40000 ALTER TABLE `application_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker`
--

DROP TABLE IF EXISTS `broker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broker` (
  `broker_id` int NOT NULL AUTO_INCREMENT,
  `license_reg_no` varchar(10) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `agency_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`broker_id`),
  UNIQUE KEY `license_reg_no` (`license_reg_no`),
  KEY `agency_id` (`agency_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `broker_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `broker_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker`
--

LOCK TABLES `broker` WRITE;
/*!40000 ALTER TABLE `broker` DISABLE KEYS */;
INSERT INTO `broker` VALUES (1,'MADefaul','857-456-7890',1,1),(2,'MA123456','857-456-7890',1,5),(3,'MA654321','857-654-3210',2,6),(4,'MA987654','(617) 207-6167',13,10),(5,'MA456789','(617) 362-4427',14,11),(6,'MA234567','(781) 776-7927',15,12),(7,'MA876543','(617) 712-2880',16,13),(8,'MA543210','(339) 217-5807',NULL,14),(9,'MA345678','(774) 214-2858',17,15),(10,'MA789012','(617) 888-1217',18,16),(11,'MA567890','(617) 875-6443',19,17),(12,'MA321098','(617) 839-6571',20,18),(13,'MA6543da','(857) 707-2198',21,19),(14,'MA789654','(413) 883-6711',22,20),(15,'MA234890','(617) 823-3146',23,21),(16,'MA567432','(617) 797-1492',24,22),(17,'MA109876','(508) 455-7420',25,23),(18,'MA543289','(617) 372-7221',26,24),(19,'MA987210','(617) 797-5199',27,25);
/*!40000 ALTER TABLE `broker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing`
--

DROP TABLE IF EXISTS `listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listing` (
  `listing_id` int NOT NULL AUTO_INCREMENT,
  `listing_type` enum('Sale','Rent') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `summary` text,
  `date_listed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `property_id` int NOT NULL,
  `broker_id` int NOT NULL,
  PRIMARY KEY (`listing_id`),
  UNIQUE KEY `unique_weak_entity` (`property_id`,`date_listed`,`listing_type`),
  KEY `broker_id` (`broker_id`),
  CONSTRAINT `listing_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `listing_ibfk_2` FOREIGN KEY (`broker_id`) REFERENCES `broker` (`broker_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing`
--

LOCK TABLES `listing` WRITE;
/*!40000 ALTER TABLE `listing` DISABLE KEYS */;
INSERT INTO `listing` VALUES (1,'Sale',250000.00,1,'Beautiful house for sale','2023-01-15 00:00:00',1,1),(2,'Rent',5200.00,1,'Beautiful house for rent','2023-01-15 00:00:00',1,1),(3,'Rent',1500.00,1,'Spacious apartment for rent','2023-02-20 00:00:00',2,2),(4,'Sale',300000.00,1,'Charming house with a garden','2023-03-10 00:00:00',3,2),(5,'Rent',3175.00,1,'','2023-01-19 00:19:32',4,4),(6,'Rent',4257.00,1,'','2023-09-03 20:50:10',5,4),(7,'Rent',3995.00,1,'','2023-03-22 07:12:17',6,4),(8,'Rent',5125.00,1,'','2023-01-29 21:30:57',7,4),(9,'Rent',2850.00,1,'','2023-09-26 13:57:56',8,4),(10,'Rent',3600.00,1,'','2023-06-11 05:16:53',9,5),(11,'Rent',3600.00,1,'','2023-01-01 08:30:37',10,6),(12,'Rent',7000.00,1,'','2023-09-06 02:42:26',11,7),(13,'Rent',4800.00,1,'','2023-05-25 12:00:22',12,8),(14,'Rent',4900.00,1,'','2023-12-10 03:54:32',13,9),(15,'Sale',579900.00,1,'','2023-07-07 07:31:40',14,10),(16,'Sale',1275000.00,1,'','2023-09-30 01:54:43',15,11),(17,'Sale',669000.00,1,'','2023-03-10 10:58:38',16,12),(18,'Sale',639500.00,1,'','2023-09-14 01:09:02',17,13),(19,'Sale',1050000.00,1,'','2023-12-11 20:49:20',18,14),(20,'Sale',750000.00,1,'','2023-08-15 04:39:35',19,15),(21,'Sale',1249000.00,1,'','2023-04-07 08:49:58',20,16),(22,'Sale',595000.00,1,'','2023-06-18 06:11:04',21,17),(23,'Sale',599000.00,1,'','2023-07-07 04:25:29',22,18),(24,'Sale',299000.00,1,'','2023-03-08 03:34:16',23,19);
/*!40000 ALTER TABLE `listing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_feature`
--

DROP TABLE IF EXISTS `listing_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listing_feature` (
  `listing_feature_id` int NOT NULL AUTO_INCREMENT,
  `feature` varchar(100) NOT NULL,
  `listing_id` int NOT NULL,
  PRIMARY KEY (`listing_feature_id`),
  UNIQUE KEY `feature_property_unique` (`listing_id`,`feature`),
  CONSTRAINT `listing_feature_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`listing_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_feature`
--

LOCK TABLES `listing_feature` WRITE;
/*!40000 ALTER TABLE `listing_feature` DISABLE KEYS */;
INSERT INTO `listing_feature` VALUES (2,'Garden',1),(1,'Swimming Pool',1),(3,'Balcony',2),(4,'Fireplace',3),(5,'24-Hour Emergency Maintenance',5),(6,'Eat-In Kitchens',6),(7,'Off Street Parking',7),(8,'Dishwasher',8),(9,'Garbage disposal',9),(10,'Hardwood flooring',10),(11,'Air conditioning',11),(12,'24-Hour Emergency Maintenance',12),(13,'Eat-In Kitchens',13),(14,'Off Street Parking',14),(15,'Dishwasher',15),(16,'Garbage disposal',16),(17,'Hardwood flooring',17),(18,'Air conditioning',18),(19,'24-Hour Emergency Maintenance',19),(20,'Eat-In Kitchens',20),(21,'Off Street Parking',21),(22,'Dishwasher',22),(23,'Garbage disposal',23),(24,'Hardwood flooring',24);
/*!40000 ALTER TABLE `listing_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_media`
--

DROP TABLE IF EXISTS `listing_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listing_media` (
  `media_id` int NOT NULL AUTO_INCREMENT,
  `media_url` varchar(255) NOT NULL,
  `listing_id` int NOT NULL,
  PRIMARY KEY (`media_id`),
  UNIQUE KEY `media_url` (`media_url`),
  KEY `listing_id` (`listing_id`),
  CONSTRAINT `listing_media_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`listing_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `check_valid_url` CHECK (regexp_like(`media_url`,_utf8mb4'^(https?|ftp)://[\\w-]+(\\.[\\w-]+)+([\\w.,@?^=%&:/~+#-]*[\\w@?^=%&/~+#-])?$'))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_media`
--

LOCK TABLES `listing_media` WRITE;
/*!40000 ALTER TABLE `listing_media` DISABLE KEYS */;
INSERT INTO `listing_media` VALUES (1,'https://example.com/image1.jpg',1),(2,'https://example.com/image2.jpg',1),(3,'https://example.com/image3.jpg',2),(4,'https://example.com/image4.jpg',3),(5,'https://example.com/image5.jpg',4),(6,'https://photos.zillowstatic.com/fp/033348a35e5b3603ea003b1a585db831-p_e.jpg',5),(7,'https://photos.zillowstatic.com/fp/d260ec5b4adf230152c375e72f0611b7-p_e.jpg',6),(8,'https://photos.zillowstatic.com/fp/e909f56a9f19eca83e64cad3cc75a2eb-p_e.jpg',7),(9,'https://photos.zillowstatic.com/fp/a93dd53f0ba7bc46bb2cc2203b96eacd-p_e.jpg',8),(10,'https://photos.zillowstatic.com/fp/c14e99edce2325798a3c02bd945ac137-p_e.jpg',9),(11,'https://photos.zillowstatic.com/fp/6f14c95c9dcf0560db7742f7b368671a-p_e.jpg',10),(12,'https://photos.zillowstatic.com/fp/bf334a14aaad702dd5477692059da3c2-p_e.jpg',11),(13,'https://photos.zillowstatic.com/fp/5a2b2a78831949fe3ded911f7c662167-p_e.jpg',12),(14,'https://photos.zillowstatic.com/fp/685e766d4787080fdf9658ff86085873-p_e.jpg',13),(15,'https://maps.googleapis.com/maps/api/staticmap?mobile=false&sensor=true&maptype=satellite&size=575x242&zoom=17&center=42.354976654052734,-71.12779998779297&key=AIzaSyBJsNQO5ZeG-XAbqqWLKwG08fWITSxg33w&signature=hONM9ovVmgPQ4QZNsZ3dGkdJvKE=',14),(16,'https://photos.zillowstatic.com/fp/11e7df2223221407a39df27b3c8d2602-p_e.jpg',15),(17,'https://photos.zillowstatic.com/fp/e6af61dd6a3cf61320583967d36cdb76-p_e.jpg',16),(18,'https://photos.zillowstatic.com/fp/854eac5093f2dc90748d3e733bc2ccfb-p_e.jpg',17),(20,'https://photos.zillowstatic.com/fp/6580d462fcb055ed9bccdc5be015b1ab-p_e.jpg',19),(21,'https://photos.zillowstatic.com/fp/f29e48e61f306e138234c09483507b3e-p_e.jpg',20),(22,'https://photos.zillowstatic.com/fp/71cc8f4be28bdce2143d3b1561052e23-p_e.jpg',21),(23,'https://photos.zillowstatic.com/fp/6a836c730d0a7a472b604d76d6dbd29d-p_e.jpg',22),(24,'https://photos.zillowstatic.com/fp/1e6d3a5e08e0e4ce1639361f3e3e9161-p_e.jpg',23),(25,'https://photos.zillowstatic.com/fp/8afe3970b3f70137dcbc136462690794-p_e.jpg',24);
/*!40000 ALTER TABLE `listing_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_policy`
--

DROP TABLE IF EXISTS `listing_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listing_policy` (
  `listing_policy_id` int NOT NULL AUTO_INCREMENT,
  `policy` varchar(100) NOT NULL,
  `listing_id` int NOT NULL,
  PRIMARY KEY (`listing_policy_id`),
  UNIQUE KEY `policy_property_unique` (`listing_id`,`policy`),
  CONSTRAINT `listing_policy_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`listing_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_policy`
--

LOCK TABLES `listing_policy` WRITE;
/*!40000 ALTER TABLE `listing_policy` DISABLE KEYS */;
INSERT INTO `listing_policy` VALUES (1,'No pets allowed',1),(2,'Security deposit required',1),(3,'Smoking not allowed',2),(4,'Utilities included',3),(6,'Available months 12',5),(5,'Flexible Parking available',5),(8,'Available months 12',6),(7,'Flexible Parking available',6),(10,'Available months 12',7),(9,'Flexible Parking available',7),(12,'Available months 12',8),(11,'Flexible Parking available',8),(14,'Available months 12',9),(13,'Flexible Parking available',9),(16,'Available months 12',10),(15,'Flexible Parking available',10),(18,'Available months 12',11),(17,'Flexible Parking available',11),(20,'Available months 12',12),(19,'Flexible Parking available',12),(22,'Available months 12',13),(21,'Flexible Parking available',13),(24,'Available months 12',14),(23,'Flexible Parking available',14),(26,'Available months 12',15),(25,'Flexible Parking available',15),(28,'Available months 12',16),(27,'Flexible Parking available',16),(30,'Available months 12',17),(29,'Flexible Parking available',17),(32,'Available months 12',18),(31,'Flexible Parking available',18),(34,'Available months 12',19),(33,'Flexible Parking available',19),(36,'Available months 12',20),(35,'Flexible Parking available',20),(37,'Flexible Parking available',21),(38,'Available months 12',22),(39,'Flexible Parking available',22),(40,'Flexible Parking available',23),(41,'Available months 12',24);
/*!40000 ALTER TABLE `listing_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `property_id` int NOT NULL AUTO_INCREMENT,
  `address_id` int NOT NULL,
  `num_baths` decimal(2,1) NOT NULL,
  `num_beds` decimal(2,1) NOT NULL,
  `area` int NOT NULL,
  `property_type` enum('House','Apartment') DEFAULT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `owner_id` int NOT NULL,
  `broker_id` int DEFAULT NULL,
  `agency_id` int DEFAULT NULL,
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `address_id` (`address_id`),
  UNIQUE KEY `location_unique` (`latitude`,`longitude`),
  KEY `agency_id` (`agency_id`),
  KEY `broker_id` (`broker_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `property_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `property_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `property_ibfk_3` FOREIGN KEY (`broker_id`) REFERENCES `broker` (`broker_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `property_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `property_owner` (`owner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,1,2.5,3.5,2000,'House',42.36010000,-71.05890000,1,1,1),(2,2,1.5,2.5,1500,'Apartment',42.35260000,-71.06690000,2,2,2),(3,3,3.5,4.5,2500,'House',42.36120000,-71.05730000,3,2,3),(4,20,1.0,1.0,577,'Apartment',42.33185600,-71.09955600,5,4,12),(5,21,1.0,1.0,630,'Apartment',42.33385500,-71.10081000,6,4,13),(6,22,1.5,2.0,1090,'Apartment',42.34882700,-71.06344600,7,4,12),(7,23,2.0,3.0,1298,'Apartment',42.34854000,-71.06293500,7,4,13),(8,24,1.0,1.0,570,'Apartment',42.35863500,-71.06247000,8,4,13),(9,25,1.5,3.0,1400,'House',42.24411400,-71.13592000,9,5,14),(10,26,1.0,4.0,1350,'House',42.30234000,-71.07378400,10,6,15),(11,27,2.5,4.0,9999,'House',42.33026000,-71.08848000,11,7,16),(12,28,1.0,3.0,1100,'House',42.32624000,-71.08976000,12,8,17),(13,29,2.5,5.0,2100,'House',42.35497700,-71.12780000,13,9,17),(14,30,3.0,3.0,1237,'Apartment',42.31488800,-71.08649400,14,10,18),(15,31,2.0,2.0,1300,'Apartment',42.34990000,-71.08722000,15,11,19),(16,32,3.0,3.0,1359,'Apartment',42.30305000,-71.06429000,16,12,20),(17,33,1.0,2.0,540,'Apartment',42.34619000,-71.07961000,17,13,21),(18,34,2.0,3.0,1387,'Apartment',42.38296000,-71.07038000,18,14,22),(19,35,2.0,3.0,1426,'House',42.27887300,-71.15365000,19,15,23),(20,36,4.0,4.0,2060,'House',42.31171000,-71.05102000,20,16,24),(21,37,1.0,3.0,1310,'House',42.26936700,-71.17078400,21,17,25),(22,38,2.0,2.0,1305,'House',42.24676500,-71.11554000,22,18,26),(23,39,1.0,0.0,500,'House',42.37579700,-71.04985000,6,19,27);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `address_cleanup_after_delete_property` AFTER DELETE ON `property` FOR EACH ROW BEGIN
	DELETE FROM address WHERE address_id = OLD.address_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `property_apartment`
--

DROP TABLE IF EXISTS `property_apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_apartment` (
  `property_id` int NOT NULL AUTO_INCREMENT,
  `unit_no` varchar(100) DEFAULT NULL,
  `floor_no` int DEFAULT NULL,
  `block_no` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`property_id`),
  CONSTRAINT `property_apartment_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_apartment`
--

LOCK TABLES `property_apartment` WRITE;
/*!40000 ALTER TABLE `property_apartment` DISABLE KEYS */;
INSERT INTO `property_apartment` VALUES (4,'Unit 407',1,'4',NULL),(5,'# 604',6,'5',NULL),(6,'Apt 607',2,'3',NULL),(7,'Apt 806',10,'3',NULL),(8,'# 1407',8,'4',NULL),(14,'# 1',7,'10',NULL),(15,'Apt 1',6,'3',NULL),(16,'# 1',4,'5',NULL),(17,'Apt 711',3,'4',NULL),(18,'Unit 2',7,'2',NULL);
/*!40000 ALTER TABLE `property_apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_owner`
--

DROP TABLE IF EXISTS `property_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_owner` (
  `owner_id` int NOT NULL AUTO_INCREMENT,
  `state_id` varchar(9) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`owner_id`),
  UNIQUE KEY `state_id` (`state_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `property_owner_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_owner`
--

LOCK TABLES `property_owner` WRITE;
/*!40000 ALTER TABLE `property_owner` DISABLE KEYS */;
INSERT INTO `property_owner` VALUES (1,'MA-123456',1),(2,'MA-789012',2),(3,'MA-345678',3),(4,'MA-901234',4),(5,'MA54231',10),(6,'MA87654',11),(7,'MA12398',12),(8,'MA65478',13),(9,'MA23987',14),(10,'MA98765',15),(11,'MA34521',16),(12,'MA89012',17),(13,'MA45678',18),(14,'MA98701',19),(15,'MA23456',20),(16,'MA78903',21),(17,'MA56789',22),(18,'MA90123',23),(19,'MA67890',24),(20,'MA43210',25),(21,'MA10987',26),(22,'MA87601',27);
/*!40000 ALTER TABLE `property_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_request`
--

DROP TABLE IF EXISTS `tour_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_request` (
  `tour_id` int NOT NULL AUTO_INCREMENT,
  `listing_id` int NOT NULL,
  `client_id` int NOT NULL,
  `request_status` enum('Draft','In Review','Accepted','Rejected','Cancelled') NOT NULL DEFAULT 'Draft',
  `tour_date` date NOT NULL,
  `tour_time_of_day` time NOT NULL,
  `tour_instructions` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tour_id`),
  KEY `listing_id` (`listing_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `tour_request_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`listing_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tour_request_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `app_client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_request`
--

LOCK TABLES `tour_request` WRITE;
/*!40000 ALTER TABLE `tour_request` DISABLE KEYS */;
INSERT INTO `tour_request` VALUES (1,1,1,'Draft','2023-12-15','09:00:00','Please ring the bell when you arrive.'),(2,2,2,'Draft','2023-12-20','13:30:00','Meet at the front gate.'),(3,3,1,'Draft','2023-12-25','18:00:00','Access code: 1234');
/*!40000 ALTER TABLE `tour_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zip_state`
--

DROP TABLE IF EXISTS `zip_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zip_state` (
  `zip` char(5) NOT NULL,
  `state` char(2) NOT NULL,
  PRIMARY KEY (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zip_state`
--

LOCK TABLES `zip_state` WRITE;
/*!40000 ALTER TABLE `zip_state` DISABLE KEYS */;
INSERT INTO `zip_state` VALUES ('01701','MA'),('02108','MA'),('02114','MA'),('02115','MA'),('02116','MA'),('02119','MA'),('02122','MA'),('02127','MA'),('02128','MA'),('02132','MA'),('02134','MA'),('2108','MA'),('2111','MA'),('2115','MA'),('2116','MA'),('2119','MA'),('2120','MA'),('2121','MA'),('2122','MA'),('2125','MA'),('2128','MA'),('2129','MA'),('2132','MA'),('2134','MA'),('2136','MA');
/*!40000 ALTER TABLE `zip_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'real_estate_db'
--

--
-- Dumping routines for database 'real_estate_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_application_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_application_request`(
	IN client_user_id INT,
    IN listing_id INT,
    IN document_url VARCHAR(255)
    )
BEGIN
	DECLARE p_client_id INT;
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		SELECT client_id INTO p_client_id FROM app_client WHERE user_id = client_user_id;

        -- If given user_id does not exist as a broker, return error
        IF ISNULL(p_client_id) THEN
            SIGNAL custom_error SET MESSAGE_TEXT = 'This user is not allowed to create application request';
        END IF;
        
        IF NOT EXISTS (SELECT 1 FROM listing WHERE listing_id = listing_id AND isactive = 1) THEN
			SIGNAL custom_error SET MESSAGE_TEXT = 'Cannot create an application against this listing';	
		END IF;
		
        -- Insert listing header data
        INSERT INTO application_request(listing_id, client_id, application_date, application_status, document_url)
        VALUES (listing_id, p_client_id, CURDATE(), 'In Review', document_url);
        
        SELECT LAST_INSERT_ID() AS application_id;
    COMMIT; -- Commit changes if no error occurred
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_listing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_listing`(
	IN p_broker_user_id INT,
    IN p_listing_type ENUM('Sale', 'Rent'),
    IN p_price DECIMAL(10,2),
    IN p_isactive BOOLEAN,
    IN p_summary TEXT,
    IN p_property_id INT,
    IN p_media_urls VARCHAR(255),
    IN p_features VARCHAR(255),
    IN p_policies VARCHAR(255)
    )
BEGIN
	DECLARE p_broker_id INT;
    DECLARE p_listing_id INT;
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);
    -- For parsing csv of features, policies, and urls
    DECLARE current_value VARCHAR(100);
    DECLARE comma_position INT;
    DECLARE loop_finished BOOLEAN DEFAULT FALSE;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		SELECT broker_id INTO p_broker_id FROM broker WHERE user_id = p_broker_user_id;

        -- If given user_id does not exist as a broker, return error
        IF ISNULL(p_broker_id) THEN
            SIGNAL custom_error SET MESSAGE_TEXT = 'This user is not allowed to create listing';
        END IF;
		
        -- Insert listing header data
        INSERT INTO listing(listing_type, price, isactive, summary, date_listed, property_id, broker_id)
        VALUES (p_listing_type, p_price, p_isactive, p_summary, NOW(), p_property_id, p_broker_id);
        
        SELECT LAST_INSERT_ID() INTO p_listing_id;
        
        -- Insert listing features
		-- Loop through the comma-separated values
		WHILE NOT loop_finished DO
			-- Find the position of the first comma
			SET comma_position = LOCATE(',', p_features);

			IF comma_position > 0 THEN
				-- Extract the current value from the start to the first comma
				SET current_value = TRIM(SUBSTRING(p_features, 1, comma_position - 1));
				-- Remove the processed value from the string
				SET p_features = SUBSTRING(p_features, comma_position + 1);
			ELSE
				-- Process the last value
				SET current_value = TRIM(p_features);
				SET loop_finished = TRUE;
			END IF;

			-- Insert the current value into features
			INSERT INTO listing_feature(feature, listing_id) VALUES (current_value, p_listing_id);
		END WHILE;
		-- Reset the iterators
		SET loop_finished = FALSE;
		SET current_value = NULL;
		SET comma_position = NULL;
		
		-- Insert listing policies
        WHILE NOT loop_finished DO
			-- Find the position of the first comma
			SET comma_position = LOCATE(',', p_policies);

			IF comma_position > 0 THEN
				-- Extract the current value from the start to the first comma
				SET current_value = TRIM(SUBSTRING(p_policies, 1, comma_position - 1));
				-- Remove the processed value from the string
				SET p_policies = SUBSTRING(p_policies, comma_position + 1);
			ELSE
				-- Process the last value
				SET current_value = TRIM(p_policies);
				SET loop_finished = TRUE;
			END IF;

			-- Insert the current value into features
			INSERT INTO listing_policy(policy, listing_id) VALUES (current_value, p_listing_id);
		END WHILE;
		-- Reset the iterators
		SET loop_finished = FALSE;
		SET current_value = NULL;
		SET comma_position = NULL;
        
        -- Inser the listing urls
        WHILE NOT loop_finished DO
			-- Find the position of the first comma
			SET comma_position = LOCATE(',', p_media_urls);

			IF comma_position > 0 THEN
				-- Extract the current value from the start to the first comma
				SET current_value = TRIM(SUBSTRING(p_media_urls, 1, comma_position - 1));
				-- Remove the processed value from the string
				SET p_media_urls = SUBSTRING(p_media_urls, comma_position + 1);
			ELSE
				-- Process the last value
				SET current_value = TRIM(p_media_urls);
				SET loop_finished = TRUE;
			END IF;

			-- Insert the current value into features
			INSERT INTO listing_media(media_url, listing_id) VALUES (current_value, p_listing_id);
		END WHILE;
    COMMIT; -- Commit changes if no error occurred
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_property` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_property`(
    IN p_num_beds INT,
    IN p_num_baths INT,
    IN p_area INT,
    IN p_property_type ENUM('House', 'Apartment'),
    IN p_latitude DECIMAL(10,8),
    IN p_longitude DECIMAL(11,8),
    IN p_owner_user_id INT,
    IN p_street_no VARCHAR(64),
    IN p_street_name VARCHAR(64),
    IN p_city VARCHAR(64),
    IN p_zip CHAR(5),
    IN p_state CHAR(2)
    )
BEGIN
	DECLARE p_owner_id INT;
    DECLARE p_address_id INT;
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);
    DECLARE error_code INT;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT, error_code = MYSQL_ERRNO;
        ROLLBACK; -- Rollback changes if an error occurs
        -- Duplicate key error means property already exists, (Since only 1 insert query in the SP)
        IF error_code = 1062 THEN
			SET error_msg = 'Property already exists';
		END IF;
			
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		SELECT owner_id INTO p_owner_id FROM property_owner WHERE user_id = p_owner_user_id;

        -- If given user_id does not exist as an owner, return error
        IF ISNULL(p_owner_id) THEN
            SIGNAL custom_error SET MESSAGE_TEXT = 'This user is not allowed to create property';
        END IF;
        			
        -- Check if address exists
        SELECT address_id INTO p_address_id FROM address a INNER JOIN zip_state zs ON a.zip = zs.zip
		WHERE street_no = p_street_no AND street_name = p_street_name AND city = p_city AND a.zip = p_zip;
        
        -- If address does not exist create new
        IF ISNULL(p_address_id) THEN
			-- Do the zip and state exist? If not, then add it
            IF NOT EXISTS (SELECT 1 FROM zip_state WHERE zip = p_zip) THEN
				INSERT INTO zip_state(zip, state) VALUES (p_zip, p_state);
			END IF;
            INSERT INTO address(street_no, street_name, city, zip) 
            VALUES(p_street_no, p_street_name, p_city, p_zip);
            -- Select the newly added address
            SELECT LAST_INSERT_ID() INTO p_address_id;
		END IF;
        
		INSERT INTO property(address_id, num_baths, num_beds, area, property_type, latitude, longitude, owner_id) 
        VALUES (p_address_id, p_num_baths, p_num_beds, p_area, p_property_type, p_latitude, p_longitude, p_owner_id);
        
        -- Set default broker, In future version have some heuristic to assign brokers within our platform based on ratings
        UPDATE property SET broker_id=1, agency_id=1 WHERE property_id=LAST_INSERT_ID();
    COMMIT; -- Commit changes if no error occurred
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_tour_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_tour_request`(
	IN client_user_id INT,
    IN listing_id INT,
	IN tour_date DATE,
    IN tour_time_of_day TIME,
    IN tour_instructions VARCHAR(100)
    )
BEGIN
	DECLARE p_client_id INT;
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		SELECT client_id INTO p_client_id FROM app_client WHERE user_id = client_user_id;

        -- If given user_id does not exist as a broker, return error
        IF ISNULL(p_client_id) THEN
            SIGNAL custom_error SET MESSAGE_TEXT = 'This user is not allowed to create tour request';
        END IF;
        
        IF NOT EXISTS (SELECT 1 FROM listing WHERE listing_id = listing_id AND isactive = 1) THEN
			SIGNAL custom_error SET MESSAGE_TEXT = 'Cannot create a tour request against this listing';	
		END IF;
		
        -- Insert listing header data
        INSERT INTO tour_request(listing_id, client_id, request_status, tour_date, tour_time_of_day, tour_instructions)
        VALUES (listing_id, p_client_id, 'In Review', tour_date, tour_time_of_day, tour_instructions);
        
        SELECT LAST_INSERT_ID() AS tour_id;
    COMMIT; -- Commit changes if no error occurred
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_listing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_listing`(IN p_listing_id INT)
BEGIN
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		DELETE FROM listing WHERE listing_id = p_listing_id;
    COMMIT; -- Commit changes if no error occurred
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_property` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_property`(IN p_property_id INT)
BEGIN
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		DELETE FROM property WHERE property_id = p_property_id;
    COMMIT; -- Commit changes if no error occurred
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(IN p_user_id INT)
BEGIN
	DECLARE p_role_type INT;
	SELECT role_id INTO p_role_type FROM app_user WHERE user_id = p_user_id;
    
    IF p_role_type = 1 THEN
		DELETE FROM property_owner WHERE user_id = p_user_id;
	ELSEIF p_role_type = 2 THEN
		DELETE FROM broker WHERE user_id = p_user_id;
	ELSEIF p_role_type = 3 THEN
		DELETE FROM app_client WHERE user_id = p_user_id;
    END IF;
    
    DELETE FROM app_user WHERE user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_applications_for_broker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_applications_for_broker`(IN broker_user_id INT)
BEGIN
    SELECT ar.*
    FROM application_request ar 
	INNER JOIN listing l ON l.listing_id = ar.listing_id
    INNER JOIN broker b ON b.broker_id = l.broker_id
    INNER JOIN app_user buser ON b.user_id = buser.user_id
    WHERE buser.user_id = broker_user_id 
    AND ar.application_status = 'In Review';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_applications_for_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_applications_for_client`(IN p_client_user_id INT)
BEGIN
	SELECT ar.*
    FROM application_request ar 
    INNER JOIN app_client c ON ar.client_id = c.client_id
    WHERE c.user_id = p_client_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_applications_for_listing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_applications_for_listing`(IN p_listing_id INT)
BEGIN
	SELECT ar.*
    FROM application_request ar 
    WHERE ar.listing_id = p_listing_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_available_areas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_available_areas`()
BEGIN
    SELECT city FROM address;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_listings_for_broker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_listings_for_broker`(IN p_user_id INT)
BEGIN
	
    -- Get the required listings in a CTE
    WITH cte_listing AS (
		SELECT l.listing_id 
		FROM broker b
		INNER JOIN listing l ON b.broker_id = l.broker_id
		WHERE b.user_id = p_user_id AND l.isactive = 1		-- Condition to get required listings
    ),
    -- Get all features of required listing
    cte_listing_features AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lf.feature), '') AS features
        FROM cte_listing l
        LEFT JOIN listing_feature lf ON l.listing_id = lf.listing_id
        GROUP BY l.listing_id
    ),
    -- Get all policies of required listing
    cte_listing_policy AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lp.policy), '') AS policies
        FROM cte_listing l
        LEFT JOIN listing_policy lp ON l.listing_id = lp.listing_id
        GROUP BY l.listing_id
    ),
    -- Get all media of required listing
    cte_listing_media AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lm.media_url), '') AS media_urls
        FROM cte_listing l
        LEFT JOIN listing_media lm ON l.listing_id = lm.listing_id
        GROUP BY l.listing_id
    )
	
	-- Return the data of the required listings
	SELECT l.*, -- Listing details
		a.*, -- Property Address
		prop.*, -- Property data
		lf.features, lp.policies, lm.media_urls,  -- Listing features, policies, pictures,etc.
        b.*, ag.*	-- Broker and brokerage agency details	
    FROM cte_listing lcte
	INNER JOIN listing l ON l.listing_id = lcte.listing_id
    INNER JOIN property prop ON l.property_id = prop.property_id
    INNER JOIN address a ON prop.address_id = a.address_id
    INNER JOIN broker b ON l.broker_id = b.broker_id
    INNER JOIN agency ag ON b.agency_id = ag.agency_id
    INNER JOIN cte_listing_features lf ON l.listing_id = lf.listing_id
    INNER JOIN cte_listing_policy lp ON l.listing_id = lp.listing_id
    INNER JOIN cte_listing_media lm ON l.listing_id = lm.listing_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_listings_for_owner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_listings_for_owner`(IN p_user_id INT)
BEGIN
    -- Get the required listings in a CTE
    WITH cte_listing AS (
		SELECT l.listing_id 
		FROM property_owner own
		INNER JOIN property prop ON own.owner_id = prop.owner_id
		INNER JOIN listing l ON prop.property_id = l.property_id
		WHERE own.user_id = p_user_id AND l.isactive = 1		-- Condition to get required listings
    ),
    -- Get all features of required listing
    cte_listing_features AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lf.feature), '') AS features
        FROM cte_listing l
        LEFT JOIN listing_feature lf ON l.listing_id = lf.listing_id
        GROUP BY l.listing_id
    ),
    -- Get all policies of required listing
    cte_listing_policy AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lp.policy), '') AS policies
        FROM cte_listing l
        LEFT JOIN listing_policy lp ON l.listing_id = lp.listing_id
        GROUP BY l.listing_id
    ),
    -- Get all media of required listing
    cte_listing_media AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lm.media_url), '') AS media_urls
        FROM cte_listing l
        LEFT JOIN listing_media lm ON l.listing_id = lm.listing_id
        GROUP BY l.listing_id
    )
	
	-- Return the data of the required listings
	SELECT l.*, -- Listing details
		a.*, -- Property Address
		prop.*, -- Property data
		lf.features, lp.policies, lm.media_urls,  -- Listing features, policies, pictures,etc.
        b.*, ag.*	-- Broker and brokerage agency details	
    FROM cte_listing lcte
	INNER JOIN listing l ON l.listing_id = lcte.listing_id
    INNER JOIN property prop ON l.property_id = prop.property_id
    INNER JOIN address a ON prop.address_id = a.address_id
    INNER JOIN broker b ON l.broker_id = b.broker_id
    INNER JOIN agency ag ON b.agency_id = ag.agency_id
    INNER JOIN cte_listing_features lf ON l.listing_id = lf.listing_id
    INNER JOIN cte_listing_policy lp ON l.listing_id = lp.listing_id
    INNER JOIN cte_listing_media lm ON l.listing_id = lm.listing_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_listings_for_property` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_listings_for_property`(IN p_property_id INT)
BEGIN
	-- Get the required listings in a CTE
    WITH cte_listing AS (
		SELECT l.listing_id 
		FROM property prop
		INNER JOIN listing l ON prop.property_id = l.property_id
		WHERE prop.property_id = p_property_id		-- Condition to get required listings
    ),
    -- Get all features of required listing
    cte_listing_features AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lf.feature), '') AS features
        FROM cte_listing l
        LEFT JOIN listing_feature lf ON l.listing_id = lf.listing_id
        GROUP BY l.listing_id
    ),
    -- Get all policies of required listing
    cte_listing_policy AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lp.policy), '') AS policies
        FROM cte_listing l
        LEFT JOIN listing_policy lp ON l.listing_id = lp.listing_id
        GROUP BY l.listing_id
    ),
    -- Get all media of required listing
    cte_listing_media AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lm.media_url), '') AS media_urls
        FROM cte_listing l
        LEFT JOIN listing_media lm ON l.listing_id = lm.listing_id
        GROUP BY l.listing_id
    )
	
	-- Return the data of the required listings
	SELECT l.*, -- Listing details
		a.*, -- Property Address
		prop.*, -- Property data
		lf.features, lp.policies, lm.media_urls,  -- Listing features, policies, pictures,etc.
        b.*, ag.*	-- Broker and brokerage agency details	
    FROM cte_listing lcte
	INNER JOIN listing l ON l.listing_id = lcte.listing_id
    INNER JOIN property prop ON l.property_id = prop.property_id
    INNER JOIN address a ON prop.address_id = a.address_id
    INNER JOIN broker b ON l.broker_id = b.broker_id
    INNER JOIN agency ag ON b.agency_id = ag.agency_id
    INNER JOIN cte_listing_features lf ON l.listing_id = lf.listing_id
    INNER JOIN cte_listing_policy lp ON l.listing_id = lp.listing_id
    INNER JOIN cte_listing_media lm ON l.listing_id = lm.listing_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_listing_by_area` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_listing_by_area`(
	IN city VARCHAR(64), 
	IN listing_type ENUM('Sale', 'Rent')
    )
BEGIN

	WITH cte_listing AS (
		SELECT l.listing_id
		FROM listing l
		INNER JOIN property prop ON l.property_id = prop.property_id
		INNER JOIN address a ON prop.address_id = a.address_id
        WHERE l.isactive = 1 AND a.city = city AND l.listing_type = listing_type
    ),
    -- Get all features of required listing
    cte_listing_features AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lf.feature), '') AS features
        FROM cte_listing l
        LEFT JOIN listing_feature lf ON l.listing_id = lf.listing_id
        GROUP BY l.listing_id
    ),
    -- Get all policies of required listing
    cte_listing_policy AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lp.policy), '') AS policies
        FROM cte_listing l
        LEFT JOIN listing_policy lp ON l.listing_id = lp.listing_id
        GROUP BY l.listing_id
    ),
    -- Get all media of required listing
    cte_listing_media AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lm.media_url), '') AS media_urls
        FROM cte_listing l
        LEFT JOIN listing_media lm ON l.listing_id = lm.listing_id
        GROUP BY l.listing_id
    )
    
    -- Return the data of the required listings
	SELECT l.*, -- Listing details
		a.*, -- Property Address
		prop.*, -- Property data
		lf.features, lp.policies, lm.media_urls,  -- Listing features, policies, pictures,etc.
        b.*, ag.*	-- Broker and brokerage agency details	
    FROM cte_listing lcte
	INNER JOIN listing l ON l.listing_id = lcte.listing_id
    INNER JOIN property prop ON l.property_id = prop.property_id
    INNER JOIN address a ON prop.address_id = a.address_id
    INNER JOIN broker b ON l.broker_id = b.broker_id
    INNER JOIN agency ag ON b.agency_id = ag.agency_id
    INNER JOIN cte_listing_features lf ON l.listing_id = lf.listing_id
    INNER JOIN cte_listing_policy lp ON l.listing_id = lp.listing_id
    INNER JOIN cte_listing_media lm ON l.listing_id = lm.listing_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_listing_by_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_listing_by_search`(
	IN search_address VARCHAR(200),
    IN listing_type ENUM('Sale', 'Rent')
    )
BEGIN
	SET search_address = REGEXP_REPLACE(REPLACE(TRIM(search_address), ',', ''), '[[:space:]]+', ' '); -- Replace multiple spaces with a single space
    
    WITH cte_listing AS (
		SELECT l.listing_id 
		FROM listing l
        INNER JOIN property prop ON l.property_id = prop.property_id
		INNER JOIN address a ON prop.address_id = a.address_id
		WHERE l.isactive = 1 
        AND CONCAT(a.street_no, ' ', a.street_name, ' ', a.city, ' ', a.zip) LIKE CONCAT('%', search_address, '%')
        AND l.listing_type = listing_type
    ),
    -- Get all features of required listing
    cte_listing_features AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lf.feature), '') AS features
        FROM cte_listing l
        LEFT JOIN listing_feature lf ON l.listing_id = lf.listing_id
        GROUP BY l.listing_id
    ),
    -- Get all policies of required listing
    cte_listing_policy AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lp.policy), '') AS policies
        FROM cte_listing l
        LEFT JOIN listing_policy lp ON l.listing_id = lp.listing_id
        GROUP BY l.listing_id
    ),
    -- Get all media of required listing
    cte_listing_media AS (
		SELECT l.listing_id, IFNULL(GROUP_CONCAT(lm.media_url), '') AS media_urls
        FROM cte_listing l
        LEFT JOIN listing_media lm ON l.listing_id = lm.listing_id
        GROUP BY l.listing_id
    )
    -- Return the data of the required listings
	SELECT l.*, -- Listing details
		a.*, -- Property Address
		prop.*, -- Property data
		lf.features, lp.policies, lm.media_urls,  -- Listing features, policies, pictures,etc.
        b.*, ag.*	-- Broker and brokerage agency details	
    FROM cte_listing lcte
	INNER JOIN listing l ON l.listing_id = lcte.listing_id
    INNER JOIN property prop ON l.property_id = prop.property_id
    INNER JOIN address a ON prop.address_id = a.address_id
    INNER JOIN broker b ON l.broker_id = b.broker_id
    INNER JOIN agency ag ON b.agency_id = ag.agency_id
    INNER JOIN cte_listing_features lf ON l.listing_id = lf.listing_id
    INNER JOIN cte_listing_policy lp ON l.listing_id = lp.listing_id
    INNER JOIN cte_listing_media lm ON l.listing_id = lm.listing_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_properties_for_broker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_properties_for_broker`(IN p_user_id INT)
BEGIN
	SELECT a.*, -- Property Address
		prop.* -- Property data
    FROM broker b
    INNER JOIN property prop ON b.broker_id = prop.broker_id
    INNER JOIN address a ON prop.address_id = a.address_id
    WHERE b.user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_properties_for_owner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_properties_for_owner`(IN p_user_id INT)
BEGIN
	SELECT a.*, -- Property Address
		prop.* -- Property data
    FROM property_owner own
    INNER JOIN property prop ON own.owner_id = prop.owner_id
    INNER JOIN address a ON prop.address_id = a.address_id
    WHERE own.user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_tour_requests_for_broker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tour_requests_for_broker`(IN broker_user_id INT)
BEGIN
	SELECT tr.*
    FROM tour_request tr 
    INNER JOIN listing l ON l.listing_id = tr.listing_id
    INNER JOIN broker b ON b.broker_id = l.broker_id
    INNER JOIN app_user buser ON b.user_id = buser.user_id
    WHERE buser.user_id = broker_user_id 
    AND tr.request_status = 'In Review';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_tour_requests_for_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tour_requests_for_client`(IN p_client_user_id INT)
BEGIN
	SELECT tr.*
    FROM tour_request tr 
    INNER JOIN app_client c ON tr.client_id = c.client_id
    WHERE c.user_id = p_client_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_tour_requests_for_listing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tour_requests_for_listing`(IN p_listing_id INT)
BEGIN
	SELECT tr.*
    FROM tour_request tr 
    WHERE tr.listing_id = p_listing_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_role`(IN p_user_id INT)
BEGIN
	SELECT r.role_name
    FROM app_user u 
    INNER JOIN app_role r ON u.role_id = r.role_id
    WHERE u.user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(
	IN p_username VARCHAR(50),
    IN p_password VARCHAR(255) -- unhashed password
	)
BEGIN
	DECLARE o_user_id INT;
	SELECT user_id INTO o_user_id FROM app_user WHERE username = p_username AND userpassword = SHA2(p_password, 256);
	IF ISNULL(o_user_id) THEN
		-- Unsuccessful login logic (e.g., return a failure message)
		SELECT -1;
	ELSE
		-- Successful login logic (e.g., return a success message or perform further actions)
		SELECT o_user_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signup_broker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `signup_broker`(
	IN p_username VARCHAR(50),
    IN p_userpassword VARCHAR(255), -- unhashed
    IN p_fname VARCHAR(64),
    IN p_lname VARCHAR(64),
    IN p_email VARCHAR(100),
	IN p_license_reg_no VARCHAR(10),
    IN p_phone VARCHAR(15),
    IN p_agency_name VARCHAR(64)
	)
BEGIN
	DECLARE p_user_id INT;
    DECLARE p_agency_id INT;
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;

    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		INSERT INTO app_user(username, userpassword, fname, lname, email, role_id)
		VALUES (p_username, SHA2(p_userpassword, 256), p_fname, p_lname, p_email, 2); -- Role Id for Broker
        -- Get the inserted user id
		SELECT LAST_INSERT_ID() INTO p_user_id;
        
        -- Get the agency id, NULLs are allowed
        SELECT agency_id INTO p_agency_id FROM agency WHERE agency_name = p_agency_name;
		-- Insert the broker
		INSERT INTO broker(license_reg_no, phone, agency_id, user_id) 
		VALUES (p_license_reg_no, p_phone, p_agency_id, p_user_id);
    COMMIT; -- Commit changes if no error occurred
	END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signup_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `signup_client`(
	IN p_username VARCHAR(50),
    IN p_userpassword VARCHAR(255), -- unhashed
    IN p_fname VARCHAR(64),
    IN p_lname VARCHAR(64),
    IN p_email VARCHAR(100),
	IN p_phone VARCHAR(15),
    IN p_dob DATE,
    IN p_gender CHAR(1)
	)
BEGIN
	DECLARE p_user_id INT;
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;

    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		INSERT INTO app_user(username, userpassword, fname, lname, email, role_id)
		VALUES (p_username, SHA2(p_userpassword, 256), p_fname, p_lname, p_email, 3); -- Role Id for Client
        -- Get the inserted user id
		SELECT LAST_INSERT_ID() INTO p_user_id;
        
		INSERT INTO app_client(phone, dob, gender, user_id) 
		VALUES(p_phone, p_dob, p_gender, p_user_id);
    COMMIT; -- Commit changes if no error occurred
	END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signup_owner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `signup_owner`(
	IN p_username VARCHAR(50),
    IN p_userpassword VARCHAR(255), -- unhashed
    IN p_fname VARCHAR(64),
    IN p_lname VARCHAR(64),
    IN p_email VARCHAR(100),
	IN p_state_id VARCHAR(9)
	)
BEGIN
	DECLARE p_user_id INT;
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;

    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		INSERT INTO app_user(username, userpassword, fname, lname, email, role_id)
		VALUES (p_username, SHA2(p_userpassword, 256), p_fname, p_lname, p_email, 1); -- Role Id for Owner
        -- Get the inserted user id
		SELECT LAST_INSERT_ID() INTO p_user_id;
        
		INSERT INTO property_owner(state_id, user_id) VALUES (p_state_id, p_user_id);
    COMMIT; -- Commit changes if no error occurred
	END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_application_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_application_request`(
	IN p_application_id INT,
    IN p_application_status VARCHAR(200)
    )
BEGIN
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		IF NOT EXISTS(SELECT 1 FROM application_request WHERE application_id = p_application_id) THEN
			SIGNAL custom_error SET MESSAGE_TEXT = 'The application request does not exist';
		END IF;
        			
        UPDATE application_request SET application_status = p_application_status
		WHERE application_id = p_application_id;
    COMMIT; -- Commit changes if no error occurred
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_listing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_listing`(
	IN p_listing_id INT,
    IN p_listing_type ENUM('Sale', 'Rent'),
    IN p_price DECIMAL(10,2),
    IN p_isactive BOOLEAN,
    IN p_summary TEXT
    )
BEGIN
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		IF NOT EXISTS(SELECT 1 FROM listing WHERE listing_id = p_listing_id) THEN
			SIGNAL custom_error SET MESSAGE_TEXT = 'The listing does not exist';
		END IF;
        			
        UPDATE listing SET
			listing_type = p_listing_type,
            price = p_price,
            isactive = p_isactive,
            summary = p_summary 
		WHERE listing_id = p_listing_id;
    COMMIT; -- Commit changes if no error occurred
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_property` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_property`(
	IN p_property_id INT,
    IN p_num_beds INT,
    IN p_num_baths INT,
    IN p_area INT,
    IN p_property_type ENUM('House', 'Apartment')
    )
BEGIN
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		IF NOT EXISTS(SELECT 1 FROM property WHERE property_id = p_property_id) THEN
			SIGNAL custom_error SET MESSAGE_TEXT = 'The property does not exist';
		END IF;
        			
        UPDATE property SET
			num_baths = p_num_baths,
            num_beds = p_num_beds,
            area = p_area,
            property_type = p_property_type 
		WHERE property_id = p_property_id;
    COMMIT; -- Commit changes if no error occurred
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_tour_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_tour_request`(
	IN p_tour_id INT,
    IN p_request_status VARCHAR(200)
    )
BEGIN
	DECLARE custom_error CONDITION FOR SQLSTATE '45000';
	DECLARE error_msg VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        ROLLBACK; -- Rollback changes if an error occurs
        SIGNAL custom_error SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION; -- Start transaction to handle potential errors
    BEGIN
		IF NOT EXISTS(SELECT 1 FROM tour_request WHERE tour_id = p_tour_id) THEN
			SIGNAL custom_error SET MESSAGE_TEXT = 'The tour request does not exist';
		END IF;
        			
        UPDATE tour_request SET request_status = p_request_status
		WHERE tour_id = p_tour_id;
    COMMIT; -- Commit changes if no error occurred
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-09  7:40:26
