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
INSERT INTO `cylinder_inventory` VALUES (6,'2026-11-14 00:29:48.936988',0.889473684210526,'CYLINDER_EN_USO','2026-11-15 00:31:55.293834',1,1,1),(7,'2026-11-14 00:29:48.936988',1,'CYLINDER_LLENO',NULL,1,1,1),(8,'2026-11-14 00:29:48.936988',0.9473684210526315,'CYLINDER_EN_USO','2026-11-15 00:32:05.426226',1,3,1),(9,'2026-11-14 00:29:48.936988',1,'CYLINDER_LLENO',NULL,1,3,1),(10,'2026-11-14 00:29:48.936988',0.9894736842105263,'CYLINDER_EN_USO',NULL,1,2,1),(11,'2026-11-14 00:29:48.936988',0.9947368421052631,'CYLINDER_EN_USO',NULL,1,16,1),(12,'2026-11-14 00:29:48.936988',0.4684210526315789,'CYLINDER_EN_USO','2026-11-15 00:31:37.144343',1,15,1),(13,'2026-11-14 00:29:48.936988',0.9789473684210526,'CYLINDER_EN_USO',NULL,1,8,1),(14,'2026-11-14 00:29:48.936988',0.9473684210526314,'CYLINDER_EN_USO',NULL,1,11,1),(15,'2026-11-14 00:29:48.936988',0.463157894736842,'CYLINDER_EN_USO','2026-11-15 00:33:33.626669',1,10,1),(16,'2026-11-14 00:29:48.936988',0.9842105263157894,'CYLINDER_EN_USO',NULL,1,18,1),(17,'2026-11-14 00:29:48.936988',0.9894736842105263,'CYLINDER_EN_USO',NULL,1,24,1),(18,'2026-11-14 00:29:48.936988',0.9894736842105263,'CYLINDER_EN_USO',NULL,1,9,1),(19,'2026-11-14 00:29:48.936988',0.9842105263157894,'CYLINDER_EN_USO',NULL,1,6,1),(20,'2026-11-14 00:29:48.936988',0.46842105263157885,'CYLINDER_EN_USO',NULL,1,4,1),(21,'2026-11-14 00:29:48.936988',0.4473684210526314,'CYLINDER_EN_USO',NULL,1,13,1),(22,'2026-11-14 00:29:48.936988',0.4842105263157894,'CYLINDER_EN_USO',NULL,1,7,1),(23,'2026-11-14 00:29:48.936988',0.9947368421052631,'CYLINDER_EN_USO',NULL,1,19,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (32,0.65,'2026-11-15 01:11:58.808170','SERVILLETAS','2026-11-15 01:11:58.808313',1,1,'GASTO_VARIABLE'),(33,15.25,'2026-11-15 18:11:03.950196','48 sodas','2026-11-15 18:11:03.950229',1,1,'GASTO_VARIABLE'),(34,3.50,'2026-11-15 18:11:34.830164','agua 12 pack','2026-11-15 18:11:34.830215',1,1,'GASTO_VARIABLE'),(35,5.40,'2026-11-15 18:12:00.460933','crema batida','2026-11-15 18:12:00.460954',1,1,'GASTO_VARIABLE'),(36,1.50,'2026-11-15 18:12:29.126208','galleta oreo','2026-11-15 18:12:29.126232',1,1,'GASTO_VARIABLE'),(37,1.50,'2026-11-15 18:13:08.594534','crispi','2026-11-15 18:13:08.594563',1,1,'GASTO_VARIABLE'),(38,2.00,'2026-11-15 18:13:37.531587','guineos','2026-11-15 18:13:37.531614',1,1,'GASTO_VARIABLE'),(39,0.90,'2026-11-16 14:01:36.786341','cucharas','2026-11-16 14:01:36.786357',1,2,'GASTO_VARIABLE'),(40,0.45,'2026-11-16 14:02:28.647803','jabon','2026-11-16 14:02:28.647833',1,2,'GASTO_VARIABLE'),(41,0.65,'2026-11-18 14:13:48.954730','1paquete de servilleta','2026-11-18 14:13:48.954750',1,2,'GASTO_VARIABLE');
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
INSERT INTO `product` VALUES (1,0,'BE',NULL,_binary '\0','SODA',1.00,NULL,'BEBIDA',15,0.61,'ACTIVO'),(2,0,'BRQ',NULL,_binary '\0','BARQUILLO',0.25,NULL,'CONO',200,0.10,'ACTIVO'),(3,0,'MIEL',NULL,_binary '\0','MIEL',0.25,NULL,'TOPPING',NULL,9.00,'ACTIVO'),(4,0,'AG',NULL,_binary '\0','AGUA',1.00,NULL,'BEBIDA',12,0.33,'ACTIVO'),(5,1,'SE',NULL,_binary '','SENCILLO',1.25,NULL,'HELADO',NULL,NULL,'ACTIVO'),(6,2,'DO',NULL,_binary '','DOBLE',1.75,NULL,'HELADO',NULL,NULL,'ACTIVO'),(7,3,'TR',NULL,_binary '','TRIPLE',2.25,NULL,'HELADO',NULL,NULL,'ACTIVO'),(8,3,'VT',NULL,_binary '','VASO TRIPLE',2.25,NULL,'HELADO',NULL,NULL,'ACTIVO'),(9,6,'PI',NULL,_binary '','PINTA',3.50,NULL,'HELADO',NULL,NULL,'ACTIVO'),(11,0,'CON',NULL,_binary '\0','CONO',0.05,NULL,'CONO',12,0.10,'ACTIVO'),(12,0,'V5',NULL,_binary '\0','VASO N° 5',0.05,NULL,'DEPOSITO',24,0.07,'ACTIVO'),(13,0,'V8',NULL,_binary '\0','VASO N° 8',0.05,NULL,'DEPOSITO',24,0.07,'ACTIVO'),(14,0,'DVT',NULL,_binary '\0','RECIPIENTE VASO TRIPLE',0.10,NULL,'DEPOSITO',30,0.35,'ACTIVO'),(15,0,'DPI',NULL,_binary '\0','RECIPIENTE PINTA',0.20,NULL,'DEPOSITO',15,0.35,'ACTIVO'),(20,12,'H14',NULL,_binary '','HELADO 1/4',5.50,NULL,'HELADO',NULL,NULL,'ACTIVO'),(21,24,'H12',NULL,_binary '','HELADO 1/2',10.00,NULL,'HELADO',NULL,NULL,'ACTIVO'),(22,0,'R14',NULL,_binary '\0','RECIPIENTE 1/4',0.20,NULL,'DEPOSITO',15,0.37,'ACTIVO'),(23,0,'R12',NULL,_binary '\0','RECIPIENTE 1/2',0.30,NULL,'DEPOSITO',15,0.85,'ACTIVO'),(24,0,'TGA',NULL,_binary '\0','TOPPING GALLETA',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(25,0,'TMA',NULL,_binary '\0','TOPPING MANI',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(26,0,'TPI',NULL,_binary '\0','TOPPING PIXI',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(27,0,'TCR',NULL,_binary '\0','TOPPING CRISPI',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(28,NULL,'ROL',NULL,_binary '\0','ROLLITO',0.25,NULL,'CONO',0,0.10,'ACTIVO'),(29,NULL,'RBA',NULL,_binary '\0','RECIPIENTE BANANA',0.25,NULL,'DEPOSITO',0,0.20,'ACTIVO'),(30,NULL,'RSU',NULL,_binary '\0','RECIPIENTE SUNDAE',0.25,NULL,'DEPOSITO',0,0.20,'ACTIVO'),(31,NULL,'RSJ',NULL,_binary '\0','RECIPIENTE SUNDAE JR',0.25,NULL,'DEPOSITO',0,0.20,'ACTIVO'),(32,NULL,'TVPC',NULL,_binary '\0','TAPADERA V3, PIN, 1/4',0.10,NULL,'DEPOSITO',15,0.10,'ACTIVO'),(33,NULL,'TME',NULL,_binary '\0','TAPADERA DE 1/2',0.20,NULL,'DEPOSITO',15,0.10,'ACTIVO'),(34,3,'BA',NULL,_binary '','BANANA',2.75,NULL,'HELADO',0,1.00,'ACTIVO'),(35,3,'SUN',NULL,_binary '','SUNDAE',2.75,NULL,'HELADO',0,1.00,'ACTIVO'),(36,1,'SUNJ',NULL,_binary '','SUNDAE JR',1.50,NULL,'HELADO',0,1.00,'ACTIVO');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory`
--

LOCK TABLES `product_inventory` WRITE;
/*!40000 ALTER TABLE `product_inventory` DISABLE KEYS */;
INSERT INTO `product_inventory` VALUES (17,'2026-11-15 00:17:08.232426',462,'2026-11-15 00:17:08.232611',1,2),(18,'2026-11-15 00:17:40.972874',499,'2026-11-15 00:17:40.973099',1,3),(19,'2026-11-15 00:18:02.045469',200,'2026-11-15 00:18:02.045632',1,28),(20,'2026-11-15 00:19:00.547243',46,'2026-11-15 00:19:00.547381',1,15),(22,'2026-11-15 00:20:28.236355',27,'2026-11-15 00:20:28.236531',1,23),(23,'2026-11-15 00:21:14.728681',43,'2026-11-15 00:21:14.728800',1,22),(24,'2026-11-15 00:21:42.692161',36,'2026-11-15 00:21:42.692300',1,14),(25,'2026-11-15 00:42:52.970229',30,'2026-11-15 00:22:47.057724',1,12),(26,'2026-11-15 00:22:29.742714',11,'2026-11-15 00:22:29.743507',1,13),(27,'2026-11-15 00:25:43.229844',74,'2026-11-15 00:25:43.229989',1,29),(28,'2026-11-15 00:26:10.929493',37,'2026-11-15 00:26:10.929639',1,30),(29,'2026-11-15 00:26:24.651321',38,'2026-11-15 00:26:24.651354',1,31),(30,'2026-11-15 18:05:55.063161',200,'2026-11-15 18:05:55.063186',1,27),(31,'2026-11-15 18:06:16.018393',198,'2026-11-15 18:06:16.018416',1,24),(32,'2026-11-15 18:09:45.869544',48,'2026-11-15 18:09:45.869573',1,1),(33,'2026-11-15 18:09:57.268468',11,'2026-11-15 18:09:57.268495',1,4),(34,'2026-11-15 00:42:52.970229',164,'2026-11-16 00:43:41.681209',1,32),(35,'2026-11-15 00:42:52.970229',30,'2026-11-16 00:42:52.970249',1,33);
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (23,0.00,'2026-11-14 01:08:59.212283',_binary '\0',1.25,1.25,NULL,1,1),(24,1.25,'2026-11-14 01:09:37.775429',_binary '\0',5.00,3.75,NULL,1,1),(25,2.00,'2026-11-14 02:20:28.652585',_binary '\0',5.00,3.00,NULL,1,1),(26,0.00,'2026-11-14 02:29:43.593121',_binary '\0',3.50,3.50,NULL,1,2),(27,0.00,'2026-11-15 17:02:43.475507',_binary '\0',1.25,1.25,NULL,1,2),(28,1.25,'2026-11-15 17:14:24.753899',_binary '\0',5.00,3.75,NULL,1,2),(29,2.50,'2026-11-15 19:44:05.872804',_binary '\0',10.00,7.50,NULL,1,2),(30,0.00,'2026-11-15 19:46:07.171490',_binary '\0',0.25,0.25,NULL,1,2),(31,3.25,'2026-11-15 20:06:01.272683',_binary '\0',5.00,1.75,NULL,1,2),(32,8.75,'2026-11-15 22:18:12.232045',_binary '\0',10.00,1.25,NULL,1,2),(33,1.25,'2026-11-15 22:31:10.244651',_binary '\0',5.00,3.75,NULL,1,2),(34,14.75,'2026-11-15 00:09:50.714208',_binary '\0',20.00,5.25,NULL,1,2),(35,1.50,'2026-11-15 00:14:01.061061',_binary '\0',5.00,3.50,NULL,1,2),(36,0.00,'2026-11-15 00:38:03.839478',_binary '\0',1.25,1.25,NULL,1,2),(37,0.00,'2026-11-15 00:44:32.282057',_binary '\0',2.25,2.25,NULL,1,2),(38,0.00,'2026-11-16 11:30:46.619532',_binary '\0',1.25,1.25,NULL,1,2),(39,0.00,'2026-11-16 14:41:33.032977',_binary '\0',1.25,1.25,NULL,1,2),(40,0.00,'2026-11-16 15:33:57.894616',_binary '\0',1.25,1.25,NULL,1,2),(41,0.00,'2026-11-16 19:29:03.887341',_binary '\0',5.00,5.00,NULL,1,2),(42,0.00,'2026-11-17 13:05:31.283241',_binary '\0',1.25,1.25,NULL,1,2),(43,2.25,'2026-11-17 13:15:57.378693',_binary '\0',5.00,2.75,NULL,1,2),(44,0.00,'2026-11-17 16:11:43.232035',_binary '\0',1.25,1.25,NULL,1,2),(45,0.75,'2026-11-17 18:55:26.045998',_binary '\0',2.00,1.25,NULL,1,2),(46,0.00,'2026-11-17 19:49:48.359281',_binary '\0',2.25,2.25,NULL,1,2),(47,0.00,'2026-11-18 11:26:58.745096',_binary '\0',1.25,1.25,NULL,1,2),(48,16.50,'2026-11-18 13:02:48.959564',_binary '\0',20.00,3.50,NULL,1,2),(49,0.75,'2026-11-18 13:23:41.804727',_binary '\0',2.00,1.25,NULL,1,2),(50,0.00,'2026-11-18 13:52:40.795500',_binary '\0',1.25,1.25,NULL,1,2),(51,0.00,'2026-11-18 16:02:32.367091',_binary '\0',1.25,1.25,NULL,1,2),(52,0.00,'2026-11-18 16:03:28.900214',_binary '\0',1.25,1.25,NULL,1,2),(53,0.00,'2026-11-18 16:10:45.620188',_binary '\0',1.25,1.25,NULL,1,2),(54,0.00,'2026-11-18 16:12:34.886532',_binary '\0',3.50,3.50,NULL,1,2),(55,1.25,'2026-11-18 16:49:29.671077',_binary '\0',5.00,3.75,NULL,1,2),(56,1.25,'2026-11-18 17:04:22.457364',_binary '\0',5.00,3.75,NULL,1,2),(57,3.00,'2026-11-18 17:08:52.503371',_binary '\0',10.00,7.00,NULL,1,2),(58,2.75,'2026-11-18 18:38:09.129354',_binary '\0',5.00,2.25,NULL,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_flavor_selections`
--

LOCK TABLES `sale_flavor_selections` WRITE;
/*!40000 ALTER TABLE `sale_flavor_selections` DISABLE KEYS */;
INSERT INTO `sale_flavor_selections` VALUES (1,1,19,6,41),(2,1,6,1,43),(3,1,6,1,45),(4,1,14,11,47),(5,1,15,10,49),(6,1,21,13,50),(7,1,12,15,51),(8,1,22,7,51),(9,1,6,1,53),(10,1,21,13,53),(11,1,14,11,55),(12,1,6,1,57),(13,1,6,1,59),(14,1,6,1,61),(15,1,14,11,63),(16,2,6,1,65),(17,2,6,1,67),(18,2,6,1,69),(19,1,6,1,73),(20,1,20,4,73),(21,1,22,7,75),(22,1,6,1,77),(23,1,13,8,79),(24,1,11,16,81),(25,2,14,11,83),(26,1,18,9,85),(27,1,13,8,85),(28,1,15,10,87),(29,1,14,11,87),(30,1,14,11,89),(31,1,15,10,89),(32,1,19,6,91),(33,1,21,13,91),(34,1,8,3,93),(35,1,6,1,95),(36,1,15,10,95),(37,1,17,24,95),(38,1,21,13,96),(39,1,21,13,98),(40,1,15,10,100),(41,1,20,4,102),(42,1,16,18,104),(43,1,20,4,106),(44,1,12,15,108),(45,1,19,6,110),(46,1,18,9,112),(47,1,14,11,112),(48,1,20,4,112),(49,1,6,1,114),(50,1,16,18,116),(51,1,23,19,118),(52,1,20,4,118),(53,1,16,18,118),(54,1,21,13,120),(55,1,6,1,122),(56,1,8,3,122),(57,1,20,4,124),(58,1,12,15,124),(59,1,8,3,126),(60,1,8,3,128),(61,1,21,13,130),(62,1,21,13,132),(63,1,17,24,134),(64,6,8,3,136),(65,1,14,11,138),(66,1,13,8,138),(67,2,12,15,140),(68,1,6,1,143),(69,1,15,10,145),(70,1,6,1,147),(71,1,10,2,149),(72,1,13,8,149),(73,1,21,13,151),(74,1,10,2,151),(75,1,14,11,153),(76,1,21,13,153),(77,1,12,15,155),(78,1,15,10,155),(79,2,6,1,157),(80,1,22,7,157);
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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_item`
--

LOCK TABLES `sale_item` WRITE;
/*!40000 ALTER TABLE `sale_item` DISABLE KEYS */;
INSERT INTO `sale_item` VALUES (41,1.25,1,5,23,NULL),(42,0.00,1,2,23,_binary ''),(43,1.25,1,5,24,NULL),(44,0.00,1,2,24,_binary ''),(45,1.25,1,5,24,NULL),(46,0.00,1,2,24,_binary ''),(47,1.25,1,5,24,NULL),(48,0.00,1,2,24,_binary ''),(49,1.50,1,36,25,NULL),(50,1.50,1,36,25,NULL),(51,1.75,1,6,26,NULL),(52,0.00,1,12,26,_binary ''),(53,1.75,1,6,26,NULL),(54,0.00,1,12,26,_binary ''),(55,1.25,1,5,27,NULL),(56,0.00,1,2,27,_binary ''),(57,1.25,1,5,28,NULL),(58,0.00,1,2,28,_binary ''),(59,1.25,1,5,28,NULL),(60,0.00,1,2,28,_binary ''),(61,1.25,1,5,28,NULL),(62,0.00,1,12,28,_binary ''),(63,1.25,1,5,29,NULL),(64,0.00,1,12,29,_binary ''),(65,1.75,1,6,29,NULL),(66,0.00,1,2,29,_binary ''),(67,1.75,1,6,29,NULL),(68,0.00,1,2,29,_binary ''),(69,1.75,1,6,29,NULL),(70,0.00,1,2,29,_binary ''),(71,1.00,1,4,29,NULL),(72,0.25,1,24,30,NULL),(73,1.75,1,6,31,NULL),(74,0.00,1,12,31,_binary ''),(75,1.25,1,5,32,NULL),(76,0.00,1,12,32,_binary ''),(77,1.25,1,5,33,NULL),(78,0.00,1,2,33,_binary ''),(79,1.25,1,5,33,NULL),(80,0.00,1,2,33,_binary ''),(81,1.25,1,5,33,NULL),(82,0.00,1,2,33,_binary ''),(83,1.75,1,6,34,NULL),(84,0.00,1,12,34,_binary ''),(85,1.75,1,6,34,NULL),(86,0.00,1,12,34,_binary ''),(87,1.75,1,6,34,NULL),(88,0.00,1,12,34,_binary ''),(89,1.75,1,6,35,NULL),(90,0.00,1,12,35,_binary ''),(91,1.75,1,6,35,NULL),(92,0.00,1,12,35,_binary ''),(93,1.25,1,5,36,NULL),(94,0.00,1,2,36,_binary ''),(95,2.25,1,8,37,NULL),(96,1.25,1,5,38,NULL),(97,0.00,1,2,38,_binary ''),(98,1.25,1,5,39,NULL),(99,0.00,1,2,39,_binary ''),(100,1.25,1,5,40,NULL),(101,0.00,1,2,40,_binary ''),(102,1.25,1,5,41,NULL),(103,0.00,1,12,41,_binary ''),(104,1.25,1,5,41,NULL),(105,0.00,1,12,41,_binary ''),(106,1.25,1,5,41,NULL),(107,0.00,1,2,41,_binary ''),(108,1.25,1,5,41,NULL),(109,0.00,1,12,41,_binary ''),(110,1.25,1,5,42,NULL),(111,0.00,1,2,42,_binary ''),(112,2.75,1,34,43,NULL),(113,0.00,1,2,43,_binary ''),(114,1.25,1,5,44,NULL),(115,0.00,1,2,44,_binary ''),(116,1.25,1,5,45,NULL),(117,0.00,1,2,45,_binary ''),(118,2.25,1,8,46,NULL),(119,0.00,1,2,46,_binary ''),(120,1.25,1,5,47,NULL),(121,0.00,1,2,47,_binary ''),(122,1.75,1,6,48,NULL),(123,0.00,1,2,48,_binary ''),(124,1.75,1,6,48,NULL),(125,0.00,1,2,48,_binary ''),(126,1.25,1,5,49,NULL),(127,0.00,1,2,49,_binary ''),(128,1.25,1,5,50,NULL),(129,0.00,1,2,50,_binary ''),(130,1.25,1,5,51,NULL),(131,0.00,1,2,51,_binary ''),(132,1.25,1,5,52,NULL),(133,0.00,1,2,52,_binary ''),(134,1.25,1,5,53,NULL),(135,0.00,1,2,53,_binary ''),(136,3.50,1,9,54,NULL),(137,0.00,1,2,54,_binary ''),(138,1.75,1,6,55,NULL),(139,0.00,1,12,55,_binary ''),(140,1.75,1,6,55,NULL),(141,0.00,1,12,55,_binary ''),(142,0.25,1,24,55,NULL),(143,1.25,1,5,56,NULL),(144,0.00,1,2,56,_binary ''),(145,1.25,1,5,56,NULL),(146,0.00,1,2,56,_binary ''),(147,1.25,1,5,56,NULL),(148,0.00,1,2,56,_binary ''),(149,1.75,1,6,57,NULL),(150,0.00,1,12,57,_binary ''),(151,1.75,1,6,57,NULL),(152,0.00,1,12,57,_binary ''),(153,1.75,1,6,57,NULL),(154,0.00,1,12,57,_binary ''),(155,1.75,1,6,57,NULL),(156,0.00,1,2,57,_binary ''),(157,2.25,1,8,58,NULL),(158,0.00,1,2,58,_binary '');
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

-- Dump completed on 2026-11-18 23:34:23
