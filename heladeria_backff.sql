-- MySQL dump 10.13  Distrib 8.4.13, for Linux (x86_64)
--
-- Host: localhost    Database: heladeria
-- ------------------------------------------------------
-- Server version	8.4.13

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
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,NULL,'PLANES DE RENDEROS','EL SIN RIVAL PLANES DE RENDEROS','79206620');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cylinder`
--

DROP TABLE IF EXISTS `cylinder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cylinder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `estimated_balls` double DEFAULT NULL,
  `flavor` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `low_fraction_threshold` double DEFAULT NULL,
  `purchase_price` decimal(38,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cylinder`
--

LOCK TABLES `cylinder` WRITE;
/*!40000 ALTER TABLE `cylinder` DISABLE KEYS */;
INSERT INTO `cylinder` VALUES (1,NULL,190,'COCO',NULL,0.2,40.00),(2,NULL,190,'FRESA',NULL,0.2,40.00),(3,NULL,190,'TAMARINDO',NULL,0.2,40.00),(4,NULL,190,'MORA',NULL,0.2,40.00),(5,NULL,190,'LECHE',NULL,0.2,40.00),(6,NULL,190,'TRES LECHES',NULL,0.2,40.00),(7,NULL,190,'RON CON PASAS',NULL,0.2,40.00),(8,NULL,190,'GUINEO CON LECHE',NULL,0.2,40.00),(9,NULL,190,'FRESA CON CREMA',NULL,0.2,40.00),(10,NULL,190,'CAFE CON LECHE',NULL,0.2,40.00),(11,NULL,190,'CHOCOLATE',NULL,0.2,40.00),(12,NULL,190,'ENSALADA',NULL,0.2,40.00),(13,NULL,190,'PISTACHIO',NULL,0.2,40.00),(14,NULL,190,'NANCE',NULL,0.2,40.00),(15,NULL,190,'JOCOTE',NULL,0.2,40.00),(16,NULL,190,'MARACUYA',NULL,0.2,40.00),(17,NULL,190,'MARANON',NULL,0.2,40.00),(18,NULL,190,'NARANJA MAMEY',NULL,0.2,40.00),(19,NULL,190,'ARRAYAN',NULL,0.2,40.00),(20,NULL,190,'ZAPOTE CON LECHE',NULL,0.2,40.00),(21,NULL,190,'LIMON',NULL,0.2,40.00),(22,NULL,190,'MANDARINA',NULL,0.2,40.00),(23,NULL,190,'PINA COLADA',NULL,0.2,40.00),(24,NULL,190,'MANGO',NULL,0.2,40.00);
/*!40000 ALTER TABLE `cylinder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cylinder_inventory`
--

DROP TABLE IF EXISTS `cylinder_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cylinder_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `fraction` double DEFAULT NULL,
  `status` enum('CYLINDER_EN_USO','CYLINDER_LLENO','CYLINDER_VACIO') DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `cylinder_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK103qdlkii1wly11a8vb22v6ev` (`branch_id`),
  KEY `FKiuocimu3yxc4vupxn5p26qf9c` (`cylinder_id`),
  KEY `FK2karxdf09avmcdxun6h7qscgf` (`user_id`),
  CONSTRAINT `FK103qdlkii1wly11a8vb22v6ev` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `FK2karxdf09avmcdxun6h7qscgf` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`),
  CONSTRAINT `FKiuocimu3yxc4vupxn5p26qf9c` FOREIGN KEY (`cylinder_id`) REFERENCES `cylinder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cylinder_inventory`
--

LOCK TABLES `cylinder_inventory` WRITE;
/*!40000 ALTER TABLE `cylinder_inventory` DISABLE KEYS */;
INSERT INTO `cylinder_inventory` VALUES (6,'2026-11-14 00:29:48.936988',0.6789473684210519,'CYLINDER_EN_USO','2026-11-15 00:31:55.293834',1,1,1),(7,'2026-11-14 00:29:48.936988',1,'CYLINDER_LLENO',NULL,1,1,1),(8,'2026-11-14 00:29:48.936988',0.8315789473684209,'CYLINDER_EN_USO','2026-11-15 00:32:05.426226',1,3,1),(9,'2026-11-14 00:29:48.936988',1,'CYLINDER_LLENO',NULL,1,3,1),(10,'2026-11-14 00:29:48.936988',0.9052631578947365,'CYLINDER_EN_USO',NULL,1,2,1),(11,'2026-11-14 00:29:48.936988',0.963157894736842,'CYLINDER_EN_USO',NULL,1,16,1),(12,'2026-11-14 00:29:48.936988',0.3789473684210524,'CYLINDER_EN_USO','2026-11-15 00:31:37.144343',1,15,1),(13,'2026-11-14 00:29:48.936988',0.8947368421052628,'CYLINDER_EN_USO',NULL,1,8,1),(14,'2026-11-14 00:29:48.936988',0.8421052631578944,'CYLINDER_EN_USO',NULL,1,11,1),(15,'2026-11-14 00:29:48.936988',0.2631578947368418,'CYLINDER_EN_USO','2026-11-15 00:33:33.626669',1,10,1),(16,'2026-11-14 00:29:48.936988',0.9526315789473683,'CYLINDER_EN_USO',NULL,1,18,1),(17,'2026-11-14 00:29:48.936988',0.9052631578947365,'CYLINDER_EN_USO',NULL,1,24,1),(18,'2026-11-14 00:29:48.936988',0.9368421052631577,'CYLINDER_EN_USO',NULL,1,9,1),(19,'2026-11-14 00:29:48.936988',0.9473684210526314,'CYLINDER_EN_USO',NULL,1,6,1),(20,'2026-11-14 00:29:48.936988',0.3684210526315787,'CYLINDER_EN_USO',NULL,1,4,1),(21,'2026-11-14 00:29:48.936988',0.352631578947368,'CYLINDER_EN_USO',NULL,1,13,1),(22,'2026-11-14 00:29:48.936988',0.32105263157894703,'CYLINDER_EN_USO',NULL,1,7,1),(23,'2026-11-14 00:29:48.936988',0.9052631578947365,'CYLINDER_EN_USO',NULL,1,19,1);
/*!40000 ALTER TABLE `cylinder_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cylinder_types`
--

DROP TABLE IF EXISTS `cylinder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cylinder_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fraction` double NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmkduercsgmorc9wt407drawdn` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cylinder_types`
--

LOCK TABLES `cylinder_types` WRITE;
/*!40000 ALTER TABLE `cylinder_types` DISABLE KEYS */;
INSERT INTO `cylinder_types` VALUES (1,1,'CILINDRO_COMPLETO'),(2,0.5,'CILINDRO_MEDIO'),(3,0,'CILINDRO_VACIO');
/*!40000 ALTER TABLE `cylinder_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(38,2) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `type_expense` enum('GASTO_FIJO','GASTO_VARIABLE') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqwri4gppy010h9xwwcwnaqe6t` (`branch_id`),
  KEY `FK758h5dgdblrpwoaaycbmn29i0` (`user_id`),
  CONSTRAINT `FK758h5dgdblrpwoaaycbmn29i0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`),
  CONSTRAINT `FKqwri4gppy010h9xwwcwnaqe6t` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (32,0.65,'2026-11-15 01:11:58.808170','SERVILLETAS','2026-11-15 01:11:58.808313',1,1,'GASTO_VARIABLE'),(33,15.25,'2026-11-15 18:11:03.950196','48 sodas','2026-11-15 18:11:03.950229',1,1,'GASTO_VARIABLE'),(34,3.50,'2026-11-15 18:11:34.830164','agua 12 pack','2026-11-15 18:11:34.830215',1,1,'GASTO_VARIABLE'),(35,5.40,'2026-11-15 18:12:00.460933','crema batida','2026-11-15 18:12:00.460954',1,1,'GASTO_VARIABLE'),(36,1.50,'2026-11-15 18:12:29.126208','galleta oreo','2026-11-15 18:12:29.126232',1,1,'GASTO_VARIABLE'),(37,1.50,'2026-11-15 18:13:08.594534','crispi','2026-11-15 18:13:08.594563',1,1,'GASTO_VARIABLE'),(38,2.00,'2026-11-15 18:13:37.531587','guineos','2026-11-15 18:13:37.531614',1,1,'GASTO_VARIABLE'),(39,0.90,'2026-11-16 14:01:36.786341','cucharas','2026-11-16 14:01:36.786357',1,2,'GASTO_VARIABLE'),(40,0.45,'2026-11-16 14:02:28.647803','jabon','2026-11-16 14:02:28.647833',1,2,'GASTO_VARIABLE'),(41,0.65,'2026-11-18 14:13:48.954730','1paquete de servilleta','2026-11-18 14:13:48.954750',1,2,'GASTO_VARIABLE'),(42,0.65,'2026-11-21 17:37:33.764094','paquete de servi{{etas','2026-11-21 17:37:33.764126',1,2,'GASTO_VARIABLE'),(44,0.90,'2026-11-21 17:40:26.566463','paquetes de cucharitas 2','2026-11-21 17:40:26.566490',1,2,'GASTO_VARIABLE'),(45,1.00,'2026-11-21 18:14:35.810268','Vasos V5','2026-11-21 18:14:35.810284',1,2,'GASTO_VARIABLE'),(46,2.50,'2026-11-21 18:15:15.170374','Vasos V10','2026-11-21 18:15:15.170400',1,2,'GASTO_VARIABLE'),(47,0.50,'2026-11-22 15:42:22.427601','050 ctvs de guineos','2026-11-22 15:42:22.427626',1,2,'GASTO_VARIABLE'),(49,7.00,'2026-11-22 21:29:49.846973','almuerzo madre y yo','2026-11-22 21:29:49.847014',1,1,'GASTO_VARIABLE');
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` enum('CREATE_SALE','CREATE_USER','DELETE_SALE','DELETE_USER','EDIT_SALE','LOGIN','LOGOUT','UPDATE_USER') DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3wxdofviqe2smmvh1w1yf98o1` (`user_id`),
  CONSTRAINT `FK3wxdofviqe2smmvh1w1yf98o1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `balls_per_unit` int DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_ice_cream` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `low_stock_threshold` int DEFAULT NULL,
  `purchase_price` decimal(38,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKh3w5r1mx6d0e5c6um32dgyjej` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,0,'BE',NULL,_binary '\0','SODA',1.00,NULL,'BEBIDA',15,0.61,'ACTIVO'),(2,0,'BRQ',NULL,_binary '\0','BARQUILLO',0.25,NULL,'CONO',200,0.10,'ACTIVO'),(3,0,'MIEL',NULL,_binary '\0','MIEL',0.25,NULL,'TOPPING',NULL,9.00,'ACTIVO'),(4,0,'AG',NULL,_binary '\0','AGUA',1.00,NULL,'BEBIDA',12,0.33,'ACTIVO'),(5,1,'SE',NULL,_binary '','SENCILLO',1.50,NULL,'HELADO',NULL,1.00,'ACTIVO'),(6,2,'DO',NULL,_binary '','DOBLE',2.00,NULL,'HELADO',NULL,1.00,'ACTIVO'),(7,3,'TR',NULL,_binary '','TRIPLE',2.50,NULL,'HELADO',NULL,1.00,'ACTIVO'),(8,3,'VT',NULL,_binary '','VASO TRIPLE',2.50,NULL,'HELADO',NULL,2.00,'ACTIVO'),(9,6,'PI',NULL,_binary '','PINTA',3.75,NULL,'HELADO',NULL,2.50,'ACTIVO'),(11,0,'CON',NULL,_binary '\0','CONO',0.05,NULL,'CONO',12,0.10,'ACTIVO'),(12,0,'V5',NULL,_binary '\0','VASO N° 5',0.05,NULL,'DEPOSITO',24,0.07,'ACTIVO'),(13,0,'V8',NULL,_binary '\0','VASO N° 8',0.05,NULL,'DEPOSITO',24,0.07,'ACTIVO'),(14,0,'DVT',NULL,_binary '\0','RECIPIENTE VASO TRIPLE',0.10,NULL,'DEPOSITO',30,0.35,'ACTIVO'),(15,0,'DPI',NULL,_binary '\0','RECIPIENTE PINTA',0.20,NULL,'DEPOSITO',15,0.35,'ACTIVO'),(20,12,'H14',NULL,_binary '','HELADO 1/4',6.00,NULL,'HELADO',NULL,4.00,'ACTIVO'),(21,24,'H12',NULL,_binary '','HELADO 1/2',10.00,NULL,'HELADO',NULL,7.00,'ACTIVO'),(22,0,'R14',NULL,_binary '\0','RECIPIENTE 1/4',0.20,NULL,'DEPOSITO',15,0.37,'ACTIVO'),(23,0,'R12',NULL,_binary '\0','RECIPIENTE 1/2',0.30,NULL,'DEPOSITO',15,0.85,'ACTIVO'),(24,0,'TGA',NULL,_binary '\0','TOPPING GALLETA',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(25,0,'TMA',NULL,_binary '\0','TOPPING MANI',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(26,0,'TPI',NULL,_binary '\0','TOPPING PIXI',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(27,0,'TCR',NULL,_binary '\0','TOPPING CRISPI',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(28,NULL,'ROL',NULL,_binary '\0','ROLLITO',0.25,NULL,'CONO',0,0.10,'ACTIVO'),(29,NULL,'RBA',NULL,_binary '\0','RECIPIENTE BANANA',0.25,NULL,'DEPOSITO',0,0.20,'ACTIVO'),(30,NULL,'RSU',NULL,_binary '\0','RECIPIENTE SUNDAE',0.25,NULL,'DEPOSITO',0,0.20,'ACTIVO'),(31,NULL,'RSJ',NULL,_binary '\0','RECIPIENTE SUNDAE JR',0.25,NULL,'DEPOSITO',0,0.20,'ACTIVO'),(32,NULL,'TVPC',NULL,_binary '\0','TAPADERA V3, PIN, 1/4',0.10,NULL,'DEPOSITO',15,0.10,'ACTIVO'),(33,NULL,'TME',NULL,_binary '\0','TAPADERA DE 1/2',0.20,NULL,'DEPOSITO',15,0.10,'ACTIVO'),(34,3,'BA',NULL,_binary '','BANANA',3.00,NULL,'HELADO',0,1.00,'ACTIVO'),(35,3,'SUN',NULL,_binary '','SUNDAE',3.00,NULL,'HELADO',0,1.00,'ACTIVO'),(36,1,'SUNJ',NULL,_binary '','SUNDAE JR',1.75,NULL,'HELADO',0,1.00,'ACTIVO');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKfl075bwasjwsxybk4x174befx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (5,'BANANA'),(2,'BEBIDA'),(3,'CONO'),(6,'DEPOSITO'),(1,'HELADO'),(4,'SERVILLETA'),(7,'TOPPING');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventory`
--

DROP TABLE IF EXISTS `product_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1ixxflp63j2t37vkjfoyl0onj` (`branch_id`),
  KEY `FK8echmjvoete36r6q97dr6pl7j` (`product_id`),
  CONSTRAINT `FK1ixxflp63j2t37vkjfoyl0onj` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `FK8echmjvoete36r6q97dr6pl7j` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory`
--

LOCK TABLES `product_inventory` WRITE;
/*!40000 ALTER TABLE `product_inventory` DISABLE KEYS */;
INSERT INTO `product_inventory` VALUES (17,NULL,391,'2026-11-19 19:45:41.027657',1,2),(18,'2026-11-15 00:17:40.972874',491,'2026-11-15 00:17:40.973099',1,3),(19,'2026-11-15 00:18:02.045469',200,'2026-11-15 00:18:02.045632',1,28),(20,'2026-11-15 00:19:00.547243',39,'2026-11-15 00:19:00.547381',1,15),(22,'2026-11-15 00:20:28.236355',26,'2026-11-15 00:20:28.236531',1,23),(23,'2026-11-15 00:21:14.728681',40,'2026-11-15 00:21:14.728800',1,22),(24,'2026-11-15 00:21:42.692161',27,'2026-11-15 00:21:42.692300',1,14),(25,NULL,4,'2026-11-21 22:56:32.650311',1,12),(26,NULL,33,'2026-11-21 22:56:52.546296',1,13),(27,'2026-11-15 00:25:43.229844',72,'2026-11-15 00:25:43.229989',1,29),(28,'2026-11-15 00:26:10.929493',36,'2026-11-15 00:26:10.929639',1,30),(29,'2026-11-15 00:26:24.651321',36,'2026-11-15 00:26:24.651354',1,31),(30,'2026-11-15 18:05:55.063161',195,'2026-11-15 18:05:55.063186',1,27),(31,'2026-11-15 18:06:16.018393',192,'2026-11-15 18:06:16.018416',1,24),(32,'2026-11-15 18:09:45.869544',45,'2026-11-15 18:09:45.869573',1,1),(33,'2026-11-15 18:09:57.268468',4,'2026-11-15 18:09:57.268495',1,4),(34,'2026-11-15 00:42:52.970229',145,'2026-11-16 00:43:41.681209',1,32),(35,'2026-11-15 00:42:52.970229',29,'2026-11-16 00:42:52.970249',1,33),(36,'2026-11-21 22:58:41.928463',500,'2026-11-21 22:58:41.928488',1,26);
/*!40000 ALTER TABLE `product_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_statuses`
--

DROP TABLE IF EXISTS `product_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_statuses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKgskuhjgstlf4cxvb4m1jfl883` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_statuses`
--

LOCK TABLES `product_statuses` WRITE;
/*!40000 ALTER TABLE `product_statuses` DISABLE KEYS */;
INSERT INTO `product_statuses` VALUES (1,'ACTIVO'),(2,'INACTIVO');
/*!40000 ALTER TABLE `product_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_items`
--

DROP TABLE IF EXISTS `purchase_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `current_stock` double DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `requested_quantity` decimal(38,2) DEFAULT NULL,
  `unit_price` decimal(38,2) DEFAULT NULL,
  `cylinder_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `purchase_order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqorpfndsg3q0utbiwos1n1615` (`cylinder_id`),
  KEY `FKcem52jllktkwt4qcwk0wtjq5h` (`product_id`),
  KEY `FKo3yj8ocbw2kav38548t22hgh8` (`purchase_order_id`),
  CONSTRAINT `FKcem52jllktkwt4qcwk0wtjq5h` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKo3yj8ocbw2kav38548t22hgh8` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`),
  CONSTRAINT `FKqorpfndsg3q0utbiwos1n1615` FOREIGN KEY (`cylinder_id`) REFERENCES `cylinder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_items`
--

LOCK TABLES `purchase_order_items` WRITE;
/*!40000 ALTER TABLE `purchase_order_items` DISABLE KEYS */;
INSERT INTO `purchase_order_items` VALUES (17,0,'BARQUILLO',500.00,0.10,NULL,2,2),(18,0,'MIEL',1.00,9.00,NULL,3,2),(19,0,'ROLLITO',200.00,0.10,NULL,28,2),(20,0,'RECIPIENTE 1/2',15.00,0.85,NULL,23,2),(21,0,'RECIPIENTE 1/4',15.00,0.37,NULL,22,2),(22,0,'RECIPIENTE PINTA',15.00,0.35,NULL,15,2),(23,0,'RECIPIENTE VASO TRIPLE',15.00,0.35,NULL,14,2),(88,0,'COCO',2.00,40.00,1,NULL,1),(89,0,'TAMARINDO',2.00,40.00,3,NULL,1),(90,0,'FRESA',1.00,40.00,2,NULL,1),(91,0,'MARACUYA',1.00,40.00,16,NULL,1),(92,0,'JOCOTE',0.50,40.00,15,NULL,1),(93,0,'GUINEO CON LECHE',1.00,40.00,8,NULL,1),(94,0,'CHOCOLATE',1.00,40.00,11,NULL,1),(95,0,'CAFE CON LECHE',0.50,40.00,10,NULL,1),(96,0,'NARANJA MAMEY',1.00,40.00,18,NULL,1),(97,0,'MANGO',1.00,40.00,24,NULL,1),(98,0,'FRESA CON CREMA',1.00,40.00,9,NULL,1),(99,0,'MORA',0.50,40.00,4,NULL,1),(100,0,'TRES LECHES',1.00,40.00,6,NULL,1),(101,0,'PISTACHIO',0.50,40.00,13,NULL,1),(102,0,'RON CON PASAS',0.50,40.00,7,NULL,1),(103,0,'ARRAYAN',1.00,40.00,19,NULL,1);
/*!40000 ALTER TABLE `purchase_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `include_prices` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` enum('ICE_CREAM','PRODUCT') DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `branch_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcro9u222fvejvt89euowf35pq` (`branch_id`),
  KEY `FKq2i0flttyj55449j8cci8lmuk` (`created_by`),
  CONSTRAINT `FKcro9u222fvejvt89euowf35pq` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `FKq2i0flttyj55449j8cci8lmuk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_orders`
--

LOCK TABLES `purchase_orders` WRITE;
/*!40000 ALTER TABLE `purchase_orders` DISABLE KEYS */;
INSERT INTO `purchase_orders` VALUES (1,'2026-11-12 05:49:20.051575',_binary '','pedido01-11-2026','ICE_CREAM','2026-11-12 23:35:27.340927',1,1),(2,'2026-11-12 06:01:47.289040',_binary '','pedido-01-11-26','PRODUCT','2026-11-12 06:01:47.289040',1,1);
/*!40000 ALTER TABLE `purchase_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `change_amount` decimal(38,2) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `day_closed` bit(1) DEFAULT NULL,
  `payment_amount` decimal(38,2) DEFAULT NULL,
  `total_amount` decimal(38,2) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKorbdw0epdrh8k46pvugwmabdy` (`branch_id`),
  KEY `FKck1t4noryw58a6jcju0pmj38` (`user_id`),
  CONSTRAINT `FKck1t4noryw58a6jcju0pmj38` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`),
  CONSTRAINT `FKorbdw0epdrh8k46pvugwmabdy` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (23,0.00,'2026-11-14 01:08:59.212283',_binary '\0',1.25,1.25,NULL,1,1),(24,1.25,'2026-11-14 01:09:37.775429',_binary '\0',5.00,3.75,NULL,1,1),(25,2.00,'2026-11-14 02:20:28.652585',_binary '\0',5.00,3.00,NULL,1,1),(26,0.00,'2026-11-14 02:29:43.593121',_binary '\0',3.50,3.50,NULL,1,2),(27,0.00,'2026-11-15 17:02:43.475507',_binary '\0',1.25,1.25,NULL,1,2),(28,1.25,'2026-11-15 17:14:24.753899',_binary '\0',5.00,3.75,NULL,1,2),(29,2.50,'2026-11-15 19:44:05.872804',_binary '\0',10.00,7.50,NULL,1,2),(30,0.00,'2026-11-15 19:46:07.171490',_binary '\0',0.25,0.25,NULL,1,2),(31,3.25,'2026-11-15 20:06:01.272683',_binary '\0',5.00,1.75,NULL,1,2),(32,8.75,'2026-11-15 22:18:12.232045',_binary '\0',10.00,1.25,NULL,1,2),(33,1.25,'2026-11-15 22:31:10.244651',_binary '\0',5.00,3.75,NULL,1,2),(34,14.75,'2026-11-15 00:09:50.714208',_binary '\0',20.00,5.25,NULL,1,2),(35,1.50,'2026-11-15 00:14:01.061061',_binary '\0',5.00,3.50,NULL,1,2),(36,0.00,'2026-11-15 00:38:03.839478',_binary '\0',1.25,1.25,NULL,1,2),(37,0.00,'2026-11-15 00:44:32.282057',_binary '\0',2.25,2.25,NULL,1,2),(38,0.00,'2026-11-16 11:30:46.619532',_binary '\0',1.25,1.25,NULL,1,2),(39,0.00,'2026-11-16 14:41:33.032977',_binary '\0',1.25,1.25,NULL,1,2),(40,0.00,'2026-11-16 15:33:57.894616',_binary '\0',1.25,1.25,NULL,1,2),(41,0.00,'2026-11-16 19:29:03.887341',_binary '\0',5.00,5.00,NULL,1,2),(42,0.00,'2026-11-17 13:05:31.283241',_binary '\0',1.25,1.25,NULL,1,2),(43,2.25,'2026-11-17 13:15:57.378693',_binary '\0',5.00,2.75,NULL,1,2),(44,0.00,'2026-11-17 16:11:43.232035',_binary '\0',1.25,1.25,NULL,1,2),(45,0.75,'2026-11-17 18:55:26.045998',_binary '\0',2.00,1.25,NULL,1,2),(46,0.00,'2026-11-17 19:49:48.359281',_binary '\0',2.25,2.25,NULL,1,2),(47,0.00,'2026-11-18 11:26:58.745096',_binary '\0',1.25,1.25,NULL,1,2),(48,16.50,'2026-11-18 13:02:48.959564',_binary '\0',20.00,3.50,NULL,1,2),(49,0.75,'2026-11-18 13:23:41.804727',_binary '\0',2.00,1.25,NULL,1,2),(50,0.00,'2026-11-18 13:52:40.795500',_binary '\0',1.25,1.25,NULL,1,2),(51,0.00,'2026-11-18 16:02:32.367091',_binary '\0',1.25,1.25,NULL,1,2),(52,0.00,'2026-11-18 16:03:28.900214',_binary '\0',1.25,1.25,NULL,1,2),(53,0.00,'2026-11-18 16:10:45.620188',_binary '\0',1.25,1.25,NULL,1,2),(54,0.00,'2026-11-18 16:12:34.886532',_binary '\0',3.50,3.50,NULL,1,2),(55,1.25,'2026-11-18 16:49:29.671077',_binary '\0',5.00,3.75,NULL,1,2),(56,1.25,'2026-11-18 17:04:22.457364',_binary '\0',5.00,3.75,NULL,1,2),(57,3.00,'2026-11-18 17:08:52.503371',_binary '\0',10.00,7.00,NULL,1,2),(58,2.75,'2026-11-18 18:38:09.129354',_binary '\0',5.00,2.25,NULL,1,2),(59,0.00,'2026-11-19 17:34:00.115862',_binary '\0',5.00,5.00,NULL,1,2),(60,0.00,'2026-11-19 17:46:04.541818',_binary '\0',3.00,3.00,NULL,1,2),(61,0.00,'2026-11-19 18:08:50.499496',_binary '\0',1.50,1.50,NULL,1,2),(62,0.00,'2026-11-19 18:09:26.625849',_binary '\0',1.00,1.00,NULL,1,2),(63,0.00,'2026-11-19 18:10:44.466814',_binary '\0',2.00,2.00,NULL,1,2),(64,0.00,'2026-11-19 18:16:38.115950',_binary '\0',2.00,2.00,NULL,1,2),(65,6.00,'2026-11-19 18:18:54.318202',_binary '\0',10.00,4.00,NULL,1,2),(66,0.50,'2026-11-19 18:21:32.473401',_binary '\0',2.00,1.50,NULL,1,2),(67,0.00,'2026-11-19 18:22:51.920459',_binary '\0',2.00,2.00,NULL,1,2),(68,1.50,'2026-11-19 18:27:00.328773',_binary '\0',5.00,3.50,NULL,1,2),(69,3.00,'2026-11-19 18:28:50.379844',_binary '\0',5.00,2.00,NULL,1,2),(70,1.00,'2026-11-19 18:35:15.723558',_binary '\0',5.00,4.00,NULL,1,2),(71,0.00,'2026-11-19 18:36:28.759993',_binary '\0',2.00,2.00,NULL,1,2),(72,16.00,'2026-11-19 18:38:30.502261',_binary '\0',20.00,4.00,NULL,1,2),(73,0.00,'2026-11-19 18:40:45.025621',_binary '\0',2.00,2.00,NULL,1,2),(74,0.00,'2026-11-20 11:18:19.167942',_binary '\0',2.00,2.00,NULL,1,2),(75,6.00,'2026-11-20 12:19:58.156440',_binary '\0',20.00,14.00,NULL,1,2),(76,0.00,'2026-11-20 14:18:58.582441',_binary '\0',3.75,3.75,NULL,1,2),(77,0.00,'2026-11-20 14:48:32.323764',_binary '\0',2.25,2.25,NULL,1,2),(78,3.50,'2026-11-20 17:02:14.876873',_binary '\0',5.00,1.50,NULL,1,2),(79,0.00,'2026-11-20 17:52:23.837590',_binary '\0',4.00,4.00,NULL,1,2),(80,0.00,'2026-11-20 18:18:47.792942',_binary '\0',4.00,4.00,NULL,1,2),(81,2.75,'2026-11-21 09:54:14.579740',_binary '\0',5.00,2.25,NULL,1,2),(82,0.00,'2026-11-21 10:17:35.775556',_binary '\0',2.00,2.00,NULL,1,2),(83,2.00,'2026-11-21 10:18:35.377876',_binary '\0',5.00,3.00,NULL,1,2),(84,0.00,'2026-11-21 10:39:51.593193',_binary '\0',6.00,6.00,NULL,1,2),(85,2.75,'2026-11-21 14:40:08.294874',_binary '\0',5.00,2.25,NULL,1,2),(86,2.50,'2026-11-21 15:13:39.842633',_binary '\0',5.00,2.50,NULL,1,2),(87,4.75,'2026-11-21 15:14:11.591210',_binary '\0',5.00,0.25,NULL,1,2),(88,2.25,'2026-11-21 15:15:19.012932',_binary '\0',5.00,2.75,NULL,1,2),(89,0.00,'2026-11-21 15:44:22.757247',_binary '\0',1.00,1.00,NULL,1,2),(90,0.00,'2026-11-21 16:33:58.739685',_binary '\0',6.00,6.00,NULL,1,2),(91,0.00,'2026-11-21 16:40:28.343430',_binary '\0',3.50,3.50,NULL,1,2),(92,0.00,'2026-11-21 16:48:27.332159',_binary '\0',1.00,1.00,NULL,1,2),(93,0.00,'2026-11-21 16:51:43.793640',_binary '\0',2.00,2.00,NULL,1,2),(94,17.00,'2026-11-21 17:00:50.683728',_binary '\0',20.00,3.00,NULL,1,2),(95,0.50,'2026-11-21 17:27:31.608510',_binary '\0',2.00,1.50,NULL,1,2),(96,0.00,'2026-11-21 17:31:39.014577',_binary '\0',6.00,6.00,NULL,1,2),(97,0.00,'2026-11-21 17:34:39.377730',_binary '\0',1.50,1.50,NULL,1,2),(98,0.00,'2026-11-21 18:33:47.839309',_binary '\0',1.50,1.50,NULL,1,2),(99,0.00,'2026-11-21 19:07:13.123274',_binary '\0',1.50,1.50,NULL,1,2),(100,1.00,'2026-11-21 19:08:31.055720',_binary '\0',5.00,4.00,NULL,1,2),(101,2.00,'2026-11-21 20:07:14.408242',_binary '\0',5.00,3.00,NULL,1,2),(102,0.00,'2026-11-21 22:51:21.147121',_binary '\0',7.50,7.50,NULL,1,2),(103,0.00,'2026-11-21 22:52:39.479579',_binary '\0',3.75,3.75,NULL,1,2),(104,3.50,'2026-11-22 09:55:15.403856',_binary '\0',5.00,1.50,NULL,1,2),(105,0.50,'2026-11-22 10:33:12.420388',_binary '\0',2.00,1.50,NULL,1,2),(106,0.00,'2026-11-22 11:03:43.007534',_binary '\0',1.50,1.50,NULL,1,2),(107,0.00,'2026-11-22 11:38:04.089302',_binary '\0',2.00,2.00,NULL,1,2),(108,15.75,'2026-11-22 11:52:05.521644',_binary '\0',20.00,4.25,NULL,1,2),(109,0.00,'2026-11-22 12:27:49.904968',_binary '\0',3.75,3.75,NULL,1,2),(110,0.00,'2026-11-22 12:29:09.087170',_binary '\0',2.50,2.50,NULL,1,2),(111,3.00,'2026-11-22 12:46:50.224860',_binary '\0',5.00,2.00,NULL,1,2),(112,0.00,'2026-11-22 12:51:33.852720',_binary '\0',2.00,2.00,NULL,1,2),(113,44.75,'2026-11-22 13:01:58.341764',_binary '\0',50.00,5.25,NULL,1,2),(114,5.00,'2026-11-22 13:15:49.715563',_binary '\0',10.00,5.00,NULL,1,2),(115,0.00,'2026-11-22 13:49:52.934429',_binary '\0',1.00,1.00,NULL,1,2),(116,0.00,'2026-11-22 13:57:37.925777',_binary '\0',1.00,1.00,NULL,1,2),(117,0.50,'2026-11-22 15:08:34.810838',_binary '\0',5.00,4.50,NULL,1,2),(118,0.50,'2026-11-22 15:12:41.950443',_binary '\0',5.00,4.50,NULL,1,2),(119,0.00,'2026-11-22 15:31:56.929807',_binary '\0',5.00,5.00,NULL,1,2),(120,13.25,'2026-11-22 16:55:58.746668',_binary '\0',20.00,6.75,NULL,1,2),(121,2.00,'2026-11-22 16:57:49.869942',_binary '\0',5.00,3.00,NULL,1,2),(122,0.00,'2026-11-22 17:53:05.137883',_binary '\0',6.00,6.00,NULL,1,2),(123,1.00,'2026-11-22 18:53:37.895569',_binary '\0',15.00,14.00,NULL,1,2),(124,0.00,'2026-11-22 18:55:04.934757',_binary '\0',12.00,12.00,NULL,1,2),(125,3.50,'2026-11-22 18:56:09.764049',_binary '\0',5.00,1.50,NULL,1,2),(126,0.50,'2026-11-22 19:18:59.416595',_binary '\0',10.00,9.50,NULL,1,2),(127,2.00,'2026-11-22 19:40:23.487592',_binary '\0',5.00,3.00,NULL,1,2),(128,0.00,'2026-11-22 20:09:33.275751',_binary '\0',1.00,1.00,NULL,1,2),(129,0.00,'2026-11-22 20:12:50.704590',_binary '\0',2.00,2.00,NULL,1,2),(130,0.00,'2026-11-22 20:34:37.030392',_binary '\0',6.00,6.00,NULL,1,2),(131,0.00,'2026-11-22 20:47:30.609159',_binary '\0',2.50,2.50,NULL,1,2),(132,9.00,'2026-11-22 21:14:09.597055',_binary '\0',20.00,11.00,NULL,1,2),(133,10.25,'2026-11-22 22:01:34.119896',_binary '\0',20.00,9.75,NULL,1,1);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_flavor_selections`
--

DROP TABLE IF EXISTS `sale_flavor_selections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_flavor_selections` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `balls` int DEFAULT NULL,
  `cylinder_inventory_id` bigint DEFAULT NULL,
  `cylinder_id` bigint NOT NULL,
  `sale_item_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5em6xnqilfsw5dxvrgyf83s4l` (`cylinder_id`),
  KEY `FK8lrixsqi1np5jl6ic78i43cno` (`sale_item_id`),
  CONSTRAINT `FK5em6xnqilfsw5dxvrgyf83s4l` FOREIGN KEY (`cylinder_id`) REFERENCES `cylinder` (`id`),
  CONSTRAINT `FK8lrixsqi1np5jl6ic78i43cno` FOREIGN KEY (`sale_item_id`) REFERENCES `sale_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_flavor_selections`
--

LOCK TABLES `sale_flavor_selections` WRITE;
/*!40000 ALTER TABLE `sale_flavor_selections` DISABLE KEYS */;
INSERT INTO `sale_flavor_selections` VALUES (1,1,19,6,41),(2,1,6,1,43),(3,1,6,1,45),(4,1,14,11,47),(5,1,15,10,49),(6,1,21,13,50),(7,1,12,15,51),(8,1,22,7,51),(9,1,6,1,53),(10,1,21,13,53),(11,1,14,11,55),(12,1,6,1,57),(13,1,6,1,59),(14,1,6,1,61),(15,1,14,11,63),(16,2,6,1,65),(17,2,6,1,67),(18,2,6,1,69),(19,1,6,1,73),(20,1,20,4,73),(21,1,22,7,75),(22,1,6,1,77),(23,1,13,8,79),(24,1,11,16,81),(25,2,14,11,83),(26,1,18,9,85),(27,1,13,8,85),(28,1,15,10,87),(29,1,14,11,87),(30,1,14,11,89),(31,1,15,10,89),(32,1,19,6,91),(33,1,21,13,91),(34,1,8,3,93),(35,1,6,1,95),(36,1,15,10,95),(37,1,17,24,95),(38,1,21,13,96),(39,1,21,13,98),(40,1,15,10,100),(41,1,20,4,102),(42,1,16,18,104),(43,1,20,4,106),(44,1,12,15,108),(45,1,19,6,110),(46,1,18,9,112),(47,1,14,11,112),(48,1,20,4,112),(49,1,6,1,114),(50,1,16,18,116),(51,1,23,19,118),(52,1,20,4,118),(53,1,16,18,118),(54,1,21,13,120),(55,1,6,1,122),(56,1,8,3,122),(57,1,20,4,124),(58,1,12,15,124),(59,1,8,3,126),(60,1,8,3,128),(61,1,21,13,130),(62,1,21,13,132),(63,1,17,24,134),(64,6,8,3,136),(65,1,14,11,138),(66,1,13,8,138),(67,2,12,15,140),(68,1,6,1,143),(69,1,15,10,145),(70,1,6,1,147),(71,1,10,2,149),(72,1,13,8,149),(73,1,21,13,151),(74,1,10,2,151),(75,1,14,11,153),(76,1,21,13,153),(77,1,12,15,155),(78,1,15,10,155),(79,2,6,1,157),(80,1,22,7,157),(81,1,19,6,159),(82,1,15,10,159),(83,1,13,8,159),(84,2,6,1,160),(85,1,19,6,160),(86,1,21,13,163),(87,1,12,15,165),(88,1,13,8,167),(89,1,6,1,170),(90,1,12,15,170),(91,1,6,1,172),(92,1,12,15,172),(93,1,20,4,174),(94,1,12,15,174),(95,1,12,15,176),(96,1,16,18,176),(97,1,13,8,178),(98,1,6,1,180),(99,1,21,13,180),(100,1,6,1,182),(101,1,12,15,182),(102,1,21,13,184),(103,1,14,11,186),(104,1,22,7,186),(105,2,6,1,188),(106,1,14,11,190),(107,1,14,11,190),(108,1,6,1,192),(109,1,12,15,192),(110,1,6,1,194),(111,1,12,15,194),(112,1,23,19,196),(113,1,11,16,196),(114,1,14,11,198),(115,1,14,11,198),(116,1,20,4,200),(117,1,20,4,200),(118,6,14,11,202),(119,6,22,7,202),(120,6,15,10,202),(121,6,20,4,202),(122,1,15,10,204),(123,1,20,4,204),(124,1,14,11,206),(125,1,15,10,206),(126,3,23,19,208),(127,3,17,24,208),(128,1,14,11,210),(129,1,22,7,210),(130,1,20,4,213),(131,1,15,10,215),(132,1,13,8,215),(133,1,23,19,217),(134,1,16,18,217),(135,1,15,10,219),(136,1,22,7,219),(137,1,6,1,221),(138,1,8,3,221),(139,1,17,24,223),(140,1,16,18,223),(141,1,11,16,226),(142,1,16,18,226),(143,1,6,1,228),(144,1,22,7,230),(145,1,6,1,232),(146,1,6,1,232),(147,1,6,1,234),(148,1,6,1,234),(149,1,6,1,236),(150,1,12,15,236),(151,1,13,8,238),(152,1,10,2,238),(153,1,10,2,241),(154,1,13,8,241),(155,1,22,7,241),(156,1,10,2,244),(157,1,13,8,244),(158,1,22,7,244),(159,1,14,11,248),(160,1,10,2,248),(161,1,10,2,250),(162,1,22,7,250),(163,1,13,8,252),(164,1,21,13,252),(165,1,17,24,254),(166,1,17,24,254),(167,1,23,19,256),(168,1,22,7,259),(169,1,22,7,259),(170,1,18,9,261),(171,1,18,9,263),(172,1,21,13,265),(173,1,10,2,267),(174,1,22,7,267),(175,1,22,7,269),(176,1,20,4,269),(177,1,6,1,271),(178,1,19,6,271),(179,1,8,3,273),(180,1,21,13,275),(181,1,21,13,277),(182,1,6,1,279),(183,1,8,3,279),(184,1,6,1,281),(185,1,8,3,281),(186,1,21,13,283),(187,1,21,13,285),(188,2,20,4,287),(189,2,21,13,287),(190,2,18,9,287),(191,2,15,10,288),(192,2,22,7,288),(193,2,14,11,288),(194,2,15,10,289),(195,2,18,9,289),(196,2,22,7,289),(197,1,20,4,290),(198,1,10,2,292),(199,1,13,8,294),(200,1,16,18,296),(201,1,12,15,296),(202,1,6,1,298),(203,1,22,7,298),(204,1,6,1,300),(205,1,22,7,300),(206,2,23,19,303),(207,2,17,24,303),(208,2,12,15,303),(209,1,10,2,305),(210,2,12,15,305),(211,1,10,2,307),(212,1,13,8,307),(213,1,13,8,309),(214,1,14,11,309),(215,1,10,2,311),(216,2,15,10,313),(217,2,13,8,313),(218,2,19,6,313),(219,1,18,9,315),(220,1,18,9,315),(221,1,21,13,317),(222,1,19,6,317),(223,1,6,1,322),(224,1,22,7,322),(225,1,12,15,324),(226,1,21,13,327),(227,1,21,13,327),(228,1,21,13,329),(229,1,21,13,329),(230,1,22,7,332),(231,1,20,4,332),(232,1,21,13,332),(233,1,10,2,334),(234,1,14,11,335),(235,1,10,2,337),(236,1,15,10,339),(237,1,8,3,339),(238,1,15,10,341),(239,1,10,2,343),(240,1,8,3,345),(241,1,15,10,347),(242,1,12,15,347),(243,1,10,2,347),(244,1,15,10,349),(245,1,22,7,349),(246,1,21,13,349),(247,1,23,19,351),(248,1,11,16,351),(249,1,15,10,351),(250,1,14,11,353),(251,1,20,4,353),(252,1,6,1,353),(253,1,10,2,355),(254,1,22,7,355),(255,1,12,15,355),(256,1,22,7,357),(257,1,17,24,357),(258,1,11,16,357),(259,1,22,7,359),(260,1,17,24,359),(261,12,15,10,362),(262,12,6,1,364),(263,1,15,10,366),(264,1,6,1,368),(265,1,8,3,370),(266,1,17,24,370),(267,1,23,19,372),(268,1,17,24,372),(269,1,23,19,374),(270,1,17,24,374),(271,1,23,19,376),(272,1,8,3,376),(273,1,15,10,378),(274,1,16,18,380),(275,1,22,7,383),(276,1,13,8,383),(277,1,23,19,385),(278,1,17,24,385),(279,1,6,1,387),(280,1,6,1,387),(281,1,18,9,389),(282,1,23,19,389),(283,1,15,10,391),(284,1,13,8,391),(285,1,19,6,391),(286,1,18,9,393),(287,1,13,8,393),(288,1,15,10,393),(289,1,23,19,395),(290,1,22,7,395),(291,1,20,4,395),(292,1,14,11,397),(293,1,6,1,397),(294,1,17,24,399),(295,1,17,24,399),(296,1,10,2,401),(297,1,20,4,401),(298,2,8,3,403),(299,2,11,16,403),(300,2,23,19,403),(301,12,8,3,404);
/*!40000 ALTER TABLE `sale_flavor_selections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_item`
--

DROP TABLE IF EXISTS `sale_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(38,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `sale_id` bigint DEFAULT NULL,
  `ignore_price` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKih76x9f1o1asbp51c70hin53n` (`product_id`),
  KEY `FKar9qqr4n69xw1shum20oflleo` (`sale_id`),
  CONSTRAINT `FKar9qqr4n69xw1shum20oflleo` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`),
  CONSTRAINT `FKih76x9f1o1asbp51c70hin53n` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_item`
--

LOCK TABLES `sale_item` WRITE;
/*!40000 ALTER TABLE `sale_item` DISABLE KEYS */;
INSERT INTO `sale_item` VALUES (41,1.25,1,5,23,NULL),(42,0.00,1,2,23,_binary ''),(43,1.25,1,5,24,NULL),(44,0.00,1,2,24,_binary ''),(45,1.25,1,5,24,NULL),(46,0.00,1,2,24,_binary ''),(47,1.25,1,5,24,NULL),(48,0.00,1,2,24,_binary ''),(49,1.50,1,36,25,NULL),(50,1.50,1,36,25,NULL),(51,1.75,1,6,26,NULL),(52,0.00,1,12,26,_binary ''),(53,1.75,1,6,26,NULL),(54,0.00,1,12,26,_binary ''),(55,1.25,1,5,27,NULL),(56,0.00,1,2,27,_binary ''),(57,1.25,1,5,28,NULL),(58,0.00,1,2,28,_binary ''),(59,1.25,1,5,28,NULL),(60,0.00,1,2,28,_binary ''),(61,1.25,1,5,28,NULL),(62,0.00,1,12,28,_binary ''),(63,1.25,1,5,29,NULL),(64,0.00,1,12,29,_binary ''),(65,1.75,1,6,29,NULL),(66,0.00,1,2,29,_binary ''),(67,1.75,1,6,29,NULL),(68,0.00,1,2,29,_binary ''),(69,1.75,1,6,29,NULL),(70,0.00,1,2,29,_binary ''),(71,1.00,1,4,29,NULL),(72,0.25,1,24,30,NULL),(73,1.75,1,6,31,NULL),(74,0.00,1,12,31,_binary ''),(75,1.25,1,5,32,NULL),(76,0.00,1,12,32,_binary ''),(77,1.25,1,5,33,NULL),(78,0.00,1,2,33,_binary ''),(79,1.25,1,5,33,NULL),(80,0.00,1,2,33,_binary ''),(81,1.25,1,5,33,NULL),(82,0.00,1,2,33,_binary ''),(83,1.75,1,6,34,NULL),(84,0.00,1,12,34,_binary ''),(85,1.75,1,6,34,NULL),(86,0.00,1,12,34,_binary ''),(87,1.75,1,6,34,NULL),(88,0.00,1,12,34,_binary ''),(89,1.75,1,6,35,NULL),(90,0.00,1,12,35,_binary ''),(91,1.75,1,6,35,NULL),(92,0.00,1,12,35,_binary ''),(93,1.25,1,5,36,NULL),(94,0.00,1,2,36,_binary ''),(95,2.25,1,8,37,NULL),(96,1.25,1,5,38,NULL),(97,0.00,1,2,38,_binary ''),(98,1.25,1,5,39,NULL),(99,0.00,1,2,39,_binary ''),(100,1.25,1,5,40,NULL),(101,0.00,1,2,40,_binary ''),(102,1.25,1,5,41,NULL),(103,0.00,1,12,41,_binary ''),(104,1.25,1,5,41,NULL),(105,0.00,1,12,41,_binary ''),(106,1.25,1,5,41,NULL),(107,0.00,1,2,41,_binary ''),(108,1.25,1,5,41,NULL),(109,0.00,1,12,41,_binary ''),(110,1.25,1,5,42,NULL),(111,0.00,1,2,42,_binary ''),(112,2.75,1,34,43,NULL),(113,0.00,1,2,43,_binary ''),(114,1.25,1,5,44,NULL),(115,0.00,1,2,44,_binary ''),(116,1.25,1,5,45,NULL),(117,0.00,1,2,45,_binary ''),(118,2.25,1,8,46,NULL),(119,0.00,1,2,46,_binary ''),(120,1.25,1,5,47,NULL),(121,0.00,1,2,47,_binary ''),(122,1.75,1,6,48,NULL),(123,0.00,1,2,48,_binary ''),(124,1.75,1,6,48,NULL),(125,0.00,1,2,48,_binary ''),(126,1.25,1,5,49,NULL),(127,0.00,1,2,49,_binary ''),(128,1.25,1,5,50,NULL),(129,0.00,1,2,50,_binary ''),(130,1.25,1,5,51,NULL),(131,0.00,1,2,51,_binary ''),(132,1.25,1,5,52,NULL),(133,0.00,1,2,52,_binary ''),(134,1.25,1,5,53,NULL),(135,0.00,1,2,53,_binary ''),(136,3.50,1,9,54,NULL),(137,0.00,1,2,54,_binary ''),(138,1.75,1,6,55,NULL),(139,0.00,1,12,55,_binary ''),(140,1.75,1,6,55,NULL),(141,0.00,1,12,55,_binary ''),(142,0.25,1,24,55,NULL),(143,1.25,1,5,56,NULL),(144,0.00,1,2,56,_binary ''),(145,1.25,1,5,56,NULL),(146,0.00,1,2,56,_binary ''),(147,1.25,1,5,56,NULL),(148,0.00,1,2,56,_binary ''),(149,1.75,1,6,57,NULL),(150,0.00,1,12,57,_binary ''),(151,1.75,1,6,57,NULL),(152,0.00,1,12,57,_binary ''),(153,1.75,1,6,57,NULL),(154,0.00,1,12,57,_binary ''),(155,1.75,1,6,57,NULL),(156,0.00,1,2,57,_binary ''),(157,2.25,1,8,58,NULL),(158,0.00,1,2,58,_binary ''),(159,2.25,1,8,59,NULL),(160,2.25,1,8,59,NULL),(161,0.25,1,27,59,NULL),(162,0.25,1,24,59,NULL),(163,1.50,1,5,60,NULL),(164,0.00,1,2,60,_binary ''),(165,1.50,1,5,60,NULL),(166,0.00,1,2,60,_binary ''),(167,1.50,1,5,61,NULL),(168,0.00,1,2,61,_binary ''),(169,1.00,1,4,62,NULL),(170,2.00,1,6,63,NULL),(171,0.00,1,2,63,_binary ''),(172,2.00,1,6,64,NULL),(173,0.00,1,2,64,_binary ''),(174,2.00,1,6,65,NULL),(175,0.00,1,12,65,_binary ''),(176,2.00,1,6,65,NULL),(177,0.00,1,12,65,_binary ''),(178,1.50,1,5,66,NULL),(179,0.00,1,12,66,_binary ''),(180,2.00,1,6,67,NULL),(181,0.00,1,2,67,_binary ''),(182,2.00,1,6,68,NULL),(183,0.00,1,2,68,_binary ''),(184,1.50,1,5,68,NULL),(185,0.00,1,2,68,_binary ''),(186,2.00,1,6,69,NULL),(187,0.00,1,12,69,_binary ''),(188,2.00,1,6,70,NULL),(189,0.00,1,12,70,_binary ''),(190,2.00,1,6,70,NULL),(191,0.00,1,12,70,_binary ''),(192,2.00,1,6,71,NULL),(193,0.00,1,2,71,_binary ''),(194,2.00,1,6,72,NULL),(195,0.00,1,12,72,_binary ''),(196,2.00,1,6,72,NULL),(197,0.00,1,12,72,_binary ''),(198,2.00,1,6,73,NULL),(199,0.00,1,12,73,_binary ''),(200,2.00,1,6,74,NULL),(201,0.00,1,12,74,_binary ''),(202,10.00,1,21,75,NULL),(203,0.00,1,12,75,_binary ''),(204,2.00,1,6,75,NULL),(205,0.00,1,2,75,_binary ''),(206,2.00,1,6,75,NULL),(207,0.00,1,2,75,_binary ''),(208,3.75,1,9,76,NULL),(209,0.00,1,2,76,_binary ''),(210,2.00,1,6,77,NULL),(211,0.00,1,2,77,_binary ''),(212,0.25,1,24,77,NULL),(213,1.50,1,5,78,NULL),(214,0.00,1,12,78,_binary ''),(215,2.00,1,6,79,NULL),(216,0.00,1,2,79,_binary ''),(217,2.00,1,6,79,NULL),(218,0.00,1,2,79,_binary ''),(219,2.00,1,6,80,NULL),(220,0.00,1,12,80,_binary ''),(221,2.00,1,6,80,NULL),(222,0.00,1,12,80,_binary ''),(223,2.00,1,6,81,NULL),(224,0.00,1,12,81,_binary ''),(225,0.25,1,27,81,NULL),(226,2.00,1,6,82,NULL),(227,0.00,1,12,82,_binary ''),(228,1.50,1,5,83,NULL),(229,0.00,1,2,83,_binary ''),(230,1.50,1,5,83,NULL),(231,0.00,1,2,83,_binary ''),(232,2.00,1,6,84,NULL),(233,0.00,1,2,84,_binary ''),(234,2.00,1,6,84,NULL),(235,0.00,1,2,84,_binary ''),(236,2.00,1,6,84,NULL),(237,0.00,1,2,84,_binary ''),(238,2.00,1,6,85,NULL),(239,0.00,1,2,85,_binary ''),(240,0.25,1,27,85,NULL),(241,2.50,1,8,86,NULL),(242,0.00,1,2,86,_binary ''),(243,0.25,1,27,87,NULL),(244,2.50,1,8,88,NULL),(245,0.00,1,2,88,_binary ''),(246,0.25,1,27,88,NULL),(247,1.00,1,4,89,NULL),(248,2.00,1,6,90,NULL),(249,0.00,1,12,90,_binary ''),(250,2.00,1,6,90,NULL),(251,0.00,1,12,90,_binary ''),(252,2.00,1,6,90,NULL),(253,0.00,1,12,90,_binary ''),(254,2.00,1,6,91,NULL),(255,0.00,1,12,91,_binary ''),(256,1.50,1,5,91,NULL),(257,0.00,1,2,91,_binary ''),(258,1.00,1,4,92,NULL),(259,2.00,1,6,93,NULL),(260,0.00,1,12,93,_binary ''),(261,1.50,1,5,94,NULL),(262,0.00,1,2,94,_binary ''),(263,1.50,1,5,94,NULL),(264,0.00,1,2,94,_binary ''),(265,1.50,1,5,95,NULL),(266,0.00,1,12,95,_binary ''),(267,2.00,1,6,96,NULL),(268,0.00,1,12,96,_binary ''),(269,2.00,1,6,96,NULL),(270,0.00,1,12,96,_binary ''),(271,2.00,1,6,96,NULL),(272,0.00,1,12,96,_binary ''),(273,1.50,1,5,97,NULL),(274,0.00,1,2,97,_binary ''),(275,1.50,1,5,98,NULL),(276,0.00,1,12,98,_binary ''),(277,1.50,1,5,99,NULL),(278,0.00,1,12,99,_binary ''),(279,2.00,1,6,100,NULL),(280,0.00,1,2,100,_binary ''),(281,2.00,1,6,100,NULL),(282,0.00,1,12,100,_binary ''),(283,1.50,1,5,101,NULL),(284,0.00,1,12,101,_binary ''),(285,1.50,1,5,101,NULL),(286,0.00,1,12,101,_binary ''),(287,3.75,1,9,102,NULL),(288,3.75,1,9,102,NULL),(289,3.75,1,9,103,NULL),(290,1.50,1,5,104,NULL),(291,0.00,1,2,104,_binary ''),(292,1.50,1,5,105,NULL),(293,0.00,1,2,105,_binary ''),(294,1.50,1,5,106,NULL),(295,0.00,1,2,106,_binary ''),(296,2.00,1,6,107,NULL),(297,0.00,1,2,107,_binary ''),(298,2.00,1,6,108,NULL),(299,0.00,1,2,108,_binary ''),(300,2.00,1,6,108,NULL),(301,0.00,1,2,108,_binary ''),(302,0.25,1,24,108,NULL),(303,3.75,1,9,109,NULL),(304,0.00,1,2,109,_binary ''),(305,2.50,1,8,110,NULL),(306,0.00,1,2,110,_binary ''),(307,2.00,1,6,111,NULL),(308,0.00,1,2,111,_binary ''),(309,2.00,1,6,112,NULL),(310,0.00,1,2,112,_binary ''),(311,1.50,1,5,113,NULL),(312,0.00,1,2,113,_binary ''),(313,3.75,1,9,113,NULL),(314,0.00,1,2,113,_binary ''),(315,2.00,1,6,114,NULL),(316,0.00,1,2,114,_binary ''),(317,2.00,1,6,114,NULL),(318,0.00,1,2,114,_binary ''),(319,1.00,1,4,114,NULL),(320,1.00,1,1,115,NULL),(321,1.00,1,1,116,NULL),(322,2.00,1,6,117,NULL),(323,0.00,1,12,117,_binary ''),(324,1.50,1,5,117,NULL),(325,0.00,1,12,117,_binary ''),(326,1.00,1,4,117,NULL),(327,2.00,1,6,118,NULL),(328,0.00,1,2,118,_binary ''),(329,2.00,1,6,118,NULL),(330,0.00,1,2,118,_binary ''),(331,0.25,2,24,118,NULL),(332,3.00,1,35,119,NULL),(333,0.25,1,24,119,NULL),(334,1.75,1,36,119,NULL),(335,1.50,1,5,120,NULL),(336,0.00,1,12,120,_binary ''),(337,1.50,1,5,120,NULL),(338,0.00,1,12,120,_binary ''),(339,2.00,1,6,120,NULL),(340,0.00,1,2,120,_binary ''),(341,1.75,1,36,120,NULL),(342,0.00,1,2,120,_binary ''),(343,1.50,1,5,121,NULL),(344,0.00,1,12,121,_binary ''),(345,1.50,1,5,121,NULL),(346,0.00,1,12,121,_binary ''),(347,3.00,1,34,122,NULL),(348,0.00,1,12,122,_binary ''),(349,3.00,1,34,122,NULL),(350,0.00,1,12,122,_binary ''),(351,2.50,1,8,123,NULL),(352,0.00,1,12,123,_binary ''),(353,2.50,1,8,123,NULL),(354,0.00,1,12,123,_binary ''),(355,2.50,1,8,123,NULL),(356,0.00,1,12,123,_binary ''),(357,2.50,1,8,123,NULL),(358,0.00,1,12,123,_binary ''),(359,2.00,1,6,123,NULL),(360,0.00,1,2,123,_binary ''),(361,1.00,2,4,123,NULL),(362,6.00,1,20,124,NULL),(363,0.00,1,2,124,_binary ''),(364,6.00,1,20,124,NULL),(365,0.00,1,2,124,_binary ''),(366,1.50,1,5,125,NULL),(367,0.00,1,2,125,_binary ''),(368,1.50,1,5,126,NULL),(369,0.00,1,2,126,_binary ''),(370,2.00,1,6,126,NULL),(371,0.00,1,2,126,_binary ''),(372,2.00,1,6,126,NULL),(373,0.00,1,2,126,_binary ''),(374,2.00,1,6,126,NULL),(375,0.00,1,2,126,_binary ''),(376,2.00,1,6,126,NULL),(377,0.00,1,2,126,_binary ''),(378,1.50,1,5,127,NULL),(379,0.00,1,12,127,_binary ''),(380,1.50,1,5,127,NULL),(381,0.00,1,12,127,_binary ''),(382,1.00,1,1,128,NULL),(383,2.00,1,6,129,NULL),(384,0.00,1,12,129,_binary ''),(385,2.00,1,6,130,NULL),(386,0.00,1,12,130,_binary ''),(387,2.00,1,6,130,NULL),(388,0.00,1,12,130,_binary ''),(389,2.00,1,6,130,NULL),(390,0.00,1,12,130,_binary ''),(391,2.50,1,7,131,NULL),(392,0.00,1,13,131,_binary ''),(393,2.50,1,7,132,NULL),(394,0.00,1,13,132,_binary ''),(395,2.50,1,7,132,NULL),(396,0.00,1,13,132,_binary ''),(397,2.00,1,6,132,NULL),(398,0.00,1,12,132,_binary ''),(399,2.00,1,6,132,NULL),(400,0.00,1,12,132,_binary ''),(401,2.00,1,6,132,NULL),(402,0.00,1,12,132,_binary ''),(403,3.75,1,9,133,NULL),(404,6.00,1,20,133,NULL);
/*!40000 ALTER TABLE `sale_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `dui` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN_BRANCH','ADMIN_GLOBAL','EMPLOYEE') DEFAULT NULL,
  `salary` decimal(38,2) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `work_days` varchar(255) DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `can_view_inventory` bit(1) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `FKaftx1bh7bj6t066aw94nfr6rm` (`branch_id`),
  CONSTRAINT `FKaftx1bh7bj6t066aw94nfr6rm` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'PLANES DE RENDEROS',NULL,'04876875-7','CRISTIAN','CASTILLO','$2a$10$ADnNM.K4Hyzjbg.XjjhogeF4AL9gJ4JQTej2NfWqkncWVWVr7HbZm','79206620','ADMIN_GLOBAL',500.00,NULL,'ccastillo','domingos',1,_binary '\0'),(2,'PLANES DE RENDEROS',NULL,'00211521-7','MARIA','MENJIVAR','$2a$10$TOKhcF7SXnKlxREkCsULZeQqzLwsh.fI0GVQECErJia.Kt0/ecmaa','71227130','EMPLOYEE',300.00,NULL,'mmenjivar','lunes - sabado',1,_binary '\0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-22 22:03:10
