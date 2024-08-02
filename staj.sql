-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: staj
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
  `price` double DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SellerID` (`SellerID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `sellers` (`SellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Televizyon A','55 inch 4K Ultra HD Televizyon',1,1200),(2,'Televizyon B','40 inch Full HD Televizyon',2,800),(3,'Tablet A','10 inch Tablet with Streaming Capabilities',3,1000),(4,'Bilgisayar A','15 inch Laptop with 8GB RAM',4,500),(5,'Headphone','Wireless Noise Cancelling Headphones',5,1500),(6,'Televizyon C','43 inch 4K Ultra HD Televizyon',1,950),(7,'Tablet B','10 inch Tablet with AI Features',3,1100),(8,'Televizyon D','65 inch 8K Ultra HD Televizyon',2,2000),(9,'Tablet C','10 inch Tablet with Voice Control',1,850),(10,'Bilgisayar B','14 inch Laptop with 256GB SSD',4,300),(11,'Tablet D','10 inch Tablet with Dolby Vision',5,900),(12,'Televizyon E','50 inch 4K Ultra HD Televizyon',3,1050),(13,'Klima A','12.000 BTU Dış Ünite Kliması - Yüksek kapasiteli klima, ideal soğutma performansı.',2,950),(14,'Televizyon F','75 inch 4K Ultra HD Televizyon',4,1800),(15,'Klima B','18.000 BTU Dış Ünite Kliması - Güçlü soğutma kapasitesi ile geniş alanlar için uygun.',5,1300),(16,'Bilgisayar A','15 inch Laptop with 8GB RAM',3,700),(17,'Klima C','16.000 BTU Dış Ünite Kliması - Sessiz çalışabilen ve etkili soğutma sağlayan klima.',1,1400),(18,'Televizyon G','48 inch 4K TV',2,900),(19,'Klima D','8.000 BTU Dış Ünite Kliması - Küçük ve orta büyüklükteki odalar için ekonomik soğutma',4,400),(20,'Televizyon H','55 inch 4K UHD Televizyon',5,1100);
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
  `PromotionValue` decimal(10,2) DEFAULT NULL,
  `promotion_value` double DEFAULT NULL,
  PRIMARY KEY (`PromotionID`),
  KEY `SellerID` (`SellerID`),
  CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `sellers` (`SellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES (1,1,200.00,NULL),(2,2,0.00,NULL),(3,3,100.00,NULL),(4,4,50.00,NULL),(5,5,0.00,NULL);
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
  `RatingValue` decimal(3,2) NOT NULL,
  `rating_value` double DEFAULT NULL,
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
INSERT INTO `ratings` VALUES (1,1,4.50,NULL),(2,2,4.80,NULL),(3,3,4.20,NULL),(4,4,4.75,NULL),(5,5,3.60,NULL);
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
  `PromotionStatus` tinyint(1) DEFAULT '0',
  `rating` double DEFAULT NULL,
  `promotion_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`SellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'Tech Store',1,4.5,NULL),(2,'ElectroWorld',0,3.8,NULL),(3,'Gadget Hub',1,4.2,NULL),(4,'SmartHome',1,4.75,NULL),(5,'DigitalZone',0,3.6,NULL);
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

-- Dump completed on 2024-08-02 19:24:34
