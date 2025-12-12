CREATE DATABASE  IF NOT EXISTS `EconomyApp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `EconomyApp`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: EconomyApp
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `parent_category_id` bigint DEFAULT NULL,
  `is_saving` tinyint(1) NOT NULL DEFAULT '0',
  `goal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_category_id` (`parent_category_id`),
  CONSTRAINT `Categories_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `Categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'Gastos Fijos','Categoría para registrar los gastos del hogar como la luz, el agua, etc.',NULL,NULL,0,NULL),(2,'Supermercados','Categoría para registrar los gastos de los supermercados.',NULL,NULL,0,NULL),(3,'Compras del hogar','Categoría pera registrar los gastos de mobiliario, electrodomésticos, decoración, etc.',NULL,NULL,0,NULL),(4,'Ocio','Gastos que realizamos en restaurantes y bares, cines, teatros, etc.',NULL,NULL,0,NULL),(5,'Otors Gastos','Categoría para registrar cualquier gasto que no tenga una periodicidad fija.',NULL,NULL,0,NULL),(6,'Ahorros','Categoría para registrar los ahorros que se quieran generar.',NULL,NULL,0,NULL),(7,'Hipoteca','Letra mensual de la hipoteca.','assets/icons/alquiler.png',1,0,80000.00),(8,'Luz','Mensualidad de las cuotas de luz','assets/icons/luz.png',1,0,NULL),(9,'Mercadona','Supermerado habial de compras de comida','assets/icons/mercadona.png',2,0,NULL),(10,'Ikea','Tienda Sueca de mobiliario para el hogar','assets/icons/ikea.png',3,0,NULL),(11,'Restaurantes','Gastos en comidas fuera de casa, en bares, restaurantes y cafeterias','assets/icons/restaurante.png',4,0,NULL),(12,'Viajes','Bote de ahorros para usar en viages','assets/icons/viajes.png',6,1,1000.00),(13,'Agua','Factura mensual del agua','assets/icons/agua.png',1,0,NULL),(14,'Internet','Cuota mensual de Internet y teléfono','assets/icons/streaming.png',1,0,NULL),(15,'Gasolina','Gastos de combustible del coche','assets/icons/fuel.png',5,0,NULL),(16,'Cine','Entradas de cine y espectáculos','assets/icons/streaming.png',4,0,NULL),(17,'Ahorro emergencia','Fondo para imprevistos','assets/icons/ahorros2.png',6,1,3000.00);
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Expenses`
--

DROP TABLE IF EXISTS `Expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Expenses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `expense_date` date NOT NULL,
  `description` text,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `Expenses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `Expenses_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `Categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Expenses`
--

LOCK TABLES `Expenses` WRITE;
/*!40000 ALTER TABLE `Expenses` DISABLE KEYS */;
INSERT INTO `Expenses` VALUES (1,1,7,500.00,'2025-12-01','Mensualidad de la letra de la hipoteca','2025-12-12 17:23:39.357138','2025-12-12 17:23:39.357189'),(2,1,8,80.00,'2025-12-05','Mensualidad de la luz del mes de noviembre','2025-12-12 17:24:10.743706','2025-12-12 17:24:10.743723'),(3,1,12,100.00,'2025-12-01','Cantidad destinada para el bote de viages','2025-12-12 17:25:17.280045','2025-12-12 17:25:17.280062'),(4,1,9,120.45,'2025-11-10','Compra mensual en Mercadona','2025-12-12 17:40:14.000000','2025-12-12 17:40:14.000000'),(5,1,11,45.00,'2025-11-15','Cena en restaurante italiano','2025-12-12 17:40:14.000000','2025-12-12 17:40:14.000000'),(6,2,9,60.30,'2025-12-02','Compra semanal supermercado','2025-12-12 17:40:14.000000','2025-12-12 17:40:14.000000'),(7,2,14,35.00,'2025-12-03','Entradas de cine','2025-12-12 17:40:14.000000','2025-12-12 17:40:14.000000'),(8,3,5,20.00,'2025-12-05','Gasto puntual invitado','2025-12-12 17:40:14.000000','2025-12-12 17:40:14.000000');
/*!40000 ALTER TABLE `Expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Incomes`
--

DROP TABLE IF EXISTS `Incomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Incomes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `incomes_date` date NOT NULL,
  `description` text,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Incomes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Incomes`
--

LOCK TABLES `Incomes` WRITE;
/*!40000 ALTER TABLE `Incomes` DISABLE KEYS */;
INSERT INTO `Incomes` VALUES (1,1,5000.00,'2025-12-01','Ingreso inicial','2025-12-12 17:24:41.329870','2025-12-12 17:24:41.329886'),(2,1,2500.00,'2025-12-01','Nómina diciembre','2025-12-12 17:40:23.000000','2025-12-12 17:40:23.000000'),(3,2,1800.00,'2025-12-01','Nómina diciembre','2025-12-12 17:40:23.000000','2025-12-12 17:40:23.000000'),(4,2,300.00,'2025-12-10','Ingreso extra freelance','2025-12-12 17:40:23.000000','2025-12-12 17:40:23.000000');
/*!40000 ALTER TABLE `Incomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (2,'ADMIN'),(4,'GUEST'),(1,'SUPERADMIN'),(3,'USER');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `profile_image` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Admin','$2a$10$Rj/VwhY/JZ.V21WlHXhsPus3uVZNTu2AnHqWjYegG1wdm1Fg5zToO',1,'admin@iadmin.es',NULL,NULL,NULL),(2,'maria','$2a$10$Rj/VwhY/JZ.V21WlHXhsPus3uVZNTu2AnHqWjYegG1wdm1Fg5zToO',3,'maria@email.es','María','García',NULL),(3,'pepe','$2a$10$Rj/VwhY/JZ.V21WlHXhsPus3uVZNTu2AnHqWjYegG1wdm1Fg5zToO',3,'pepe@email.es','Pepe','López',NULL),(4,'invitado1','$2a$10$Rj/VwhY/JZ.V21WlHXhsPus3uVZNTu2AnHqWjYegG1wdm1Fg5zToO',4,'guest@email.es',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-12 17:44:28
