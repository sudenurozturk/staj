-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: new
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `SellerID` int DEFAULT NULL,
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SellerID` (`SellerID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `sellers` (`SellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Televizyon A','42 inch 4K UHD TV with smart features',1,499.99),(2,'Televizyon H','50 inch LED TV with full HD resolution',1,399.99),(3,'Bilgisayar A','Gaming laptop with high performance',2,1299.99),(4,'Bilgisayar B','High-speed laptop with SSD',2,1199.99),(5,'Televizyon F','32 inch HD TV with built-in speakers',3,299.99),(6,'Tablet A','10 inch Android Tablet with 64GB storage',4,199.99),(7,'Televizyon C','55 inch 4K UHD TV with HDR',4,549.99),(8,'Tablet B','8 inch tablet with stylus support',4,179.99),(9,'Tablet C','12 inch tablet with detachable keyboard',4,299.99),(10,'Tablet D','10 inch Windows tablet with 128GB storage',4,229.99),(11,'Klima A','Inverter Air Conditioner with remote control',5,699.99),(12,'Televizyon E','43 inch smart TV with voice control',4,429.99),(13,'Televizyon B','60 inch 4K TV with Dolby sound',2,599.99),(14,'Televizyon D','40 inch LED TV with low energy consumption',2,349.99),(15,'Klima B','Portable air conditioner with cooling and dehumidifying',5,599.99),(16,'Televizyon G','65 inch 4K OLED TV with ultra-thin design',5,899.99),(17,'Headphone','Noise-cancelling over-ear headphones',3,149.99),(18,'Klima C','Split Air Conditioner with Wi-Fi connectivity',5,749.99),(19,'Klima D','Window air conditioner with energy-saving mode',5,399.99);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `PromotionID` int NOT NULL AUTO_INCREMENT,
  `SellerID` int DEFAULT NULL,
  `PromotionValue` double DEFAULT NULL,
  PRIMARY KEY (`PromotionID`),
  KEY `SellerID` (`SellerID`),
  CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `sellers` (`SellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES (1,1,20,NULL),(2,3,15,NULL),(3,5,10,NULL);
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `RatingID` int NOT NULL AUTO_INCREMENT,
  `SellerID` int DEFAULT NULL,
  `RatingValue` double DEFAULT NULL,
  PRIMARY KEY (`RatingID`),
  KEY `SellerID` (`SellerID`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `sellers` (`SellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,1,4.8,NULL),(2,2,4.8,NULL),(3,3,4.2,NULL),(4,4,3.6,NULL),(5,5,4.1,NULL);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `SellerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `PromotionStatus` int DEFAULT '0',
  `Rating` double DEFAULT NULL,
  PRIMARY KEY (`SellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'John Electronics',1,4.8,NULL),(2,'Alice Gadgets',0,4.8,NULL),(3,'Bob Tech',1,4.2,NULL),(4,'Clara Electronics',0,3.6,NULL),(5,'Eve Home Appliances',1,4.1,NULL);
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-04 15:46:59
