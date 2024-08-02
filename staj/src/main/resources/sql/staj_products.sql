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
INSERT INTO `products` VALUES (1,'Televizyon A','55 inch 4K Ultra HD',1,1200),(2,'Televizyon B','40 inch Full HD',2,800),(3,'Smart TV X','50 inch Smart TV with streaming',3,1000),(4,'LED TV Y','32 inch LED TV',4,500),(5,'Plazma TV Z','60 inch Plazma TV',5,1500),(6,'Televizyon C','43 inch 4K Ultra HD',1,950),(7,'Smart TV Y','55 inch Smart TV with AI',3,1100),(8,'Televizyon D','65 inch 8K Ultra HD',2,2000),(9,'Smart TV Z','42 inch Smart TV with voice control',1,850),(10,'LED TV X','24 inch LED TV',4,300),(11,'Smart TV A','48 inch Smart TV with Dolby Vision',5,900),(12,'Televizyon E','50 inch 4K Ultra HD',3,1050),(13,'Smart TV B','43 inch Smart TV with HDR',2,950),(14,'Televizyon F','75 inch 4K Ultra HD',4,1800),(15,'Smart TV C','60 inch 4K Smart TV',5,1300),(16,'LED TV Y','40 inch LED TV',3,700),(17,'Smart TV D','55 inch OLED Smart TV',1,1400),(18,'Televizyon G','48 inch 4K TV',2,900),(19,'Smart TV E','32 inch Smart TV',4,400),(20,'Televizyon H','55 inch 4K UHD TV',5,1100);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-02  0:57:42
