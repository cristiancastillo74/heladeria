-- MySQL dump 10.13  Distrib 8.4.13, for Linux (aarch64)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cylinder_inventory`
--

LOCK TABLES `cylinder_inventory` WRITE;
/*!40000 ALTER TABLE `cylinder_inventory` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,0,'BE',NULL,_binary '\0','SODA',1.00,NULL,'BEBIDA',24,0.70,'ACTIVO'),(2,0,'BRQ',NULL,_binary '\0','BARQUILLO',0.25,NULL,'CONO',200,0.10,'ACTIVO'),(3,0,'MIEL',NULL,_binary '\0','MIEL',0.25,NULL,'TOPPING',NULL,9.00,'ACTIVO'),(4,0,'AG',NULL,_binary '\0','AGUA',1.00,NULL,'BEBIDA',24,0.45,'ACTIVO'),(5,1,'SE',NULL,_binary '','SENCILLO',1.25,NULL,'HELADO',NULL,NULL,'ACTIVO'),(6,2,'DO',NULL,_binary '','DOBLE',1.75,NULL,'HELADO',NULL,NULL,'ACTIVO'),(7,3,'TR',NULL,_binary '','TRIPLE',2.25,NULL,'HELADO',NULL,NULL,'ACTIVO'),(8,3,'VT',NULL,_binary '','VASO TRIPLE',2.25,NULL,'HELADO',NULL,NULL,'ACTIVO'),(9,6,'PI',NULL,_binary '','PINTA',3.50,NULL,'HELADO',NULL,NULL,'ACTIVO'),(11,0,'CON',NULL,_binary '\0','CONO',0.05,NULL,'CONO',24,0.10,'ACTIVO'),(12,0,'V5',NULL,_binary '\0','VASO N° 5',0.05,NULL,'DEPOSITO',24,0.07,'ACTIVO'),(13,0,'V8',NULL,_binary '\0','VASO N° 8',0.05,NULL,'DEPOSITO',24,0.07,'ACTIVO'),(14,0,'DVT',NULL,_binary '\0','RECIPIENTE VASO TRIPLE',0.10,NULL,'DEPOSITO',50,0.35,'ACTIVO'),(15,0,'DPI',NULL,_binary '\0','RECIPIENTE PINTA',0.20,NULL,'DEPOSITO',30,0.35,'ACTIVO'),(20,12,'H14',NULL,_binary '','HELADO 1/4',5.50,NULL,'HELADO',NULL,NULL,'ACTIVO'),(21,24,'H12',NULL,_binary '','HELADO 1/2',10.00,NULL,'HELADO',NULL,NULL,'ACTIVO'),(22,0,'R14',NULL,_binary '\0','RECIPIENTE 1/4',0.20,NULL,'DEPOSITO',30,0.37,'ACTIVO'),(23,0,'R12',NULL,_binary '\0','RECIPIENTE 1/2',0.30,NULL,'DEPOSITO',30,0.85,'ACTIVO'),(24,0,'TGA',NULL,_binary '\0','TOPPING GALLETA',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(25,0,'TMA',NULL,_binary '\0','TOPPING MANI',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(26,0,'TPI',NULL,_binary '\0','TOPPING PIXI',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(27,0,'TCR',NULL,_binary '\0','TOPPING CRISPI',0.25,NULL,'TOPPING',NULL,NULL,'ACTIVO'),(28,NULL,'ROL',NULL,_binary '\0','ROLLITO',0.25,NULL,'CONO',0,0.10,'ACTIVO');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory`
--

LOCK TABLES `product_inventory` WRITE;
/*!40000 ALTER TABLE `product_inventory` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_flavor_selections`
--

LOCK TABLES `sale_flavor_selections` WRITE;
/*!40000 ALTER TABLE `sale_flavor_selections` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_item`
--

LOCK TABLES `sale_item` WRITE;
/*!40000 ALTER TABLE `sale_item` DISABLE KEYS */;
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
INSERT INTO `user` VALUES (1,'PLANES DE RENDEROS',NULL,'04876875-7','CRISTIAN','CASTILLO','$2a$10$ADnNM.K4Hyzjbg.XjjhogeF4AL9gJ4JQTej2NfWqkncWVWVr7HbZm','79206620','ADMIN_GLOBAL',500.00,NULL,'ccastillo','domingos',1,_binary '\0'),(2,'PLANES DE RENDEROS',NULL,'00211521-7','MARIA','MENJIVAR','$2a$10$0N.JhnoCF3M77pN4MGyEC.3CP9Kt6DrcjQodyDP/Vc0EfC3.KvOQi','71227130','ADMIN_BRANCH',300.00,NULL,'mmenjivar','lunes - sabado',1,_binary '\0');
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

-- Dump completed on 2026-11-12 23:36:29
