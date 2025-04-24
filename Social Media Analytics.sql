CREATE DATABASE  IF NOT EXISTS `socialmediadbm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `socialmediadbm`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: socialmediadbm
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connections` (
  `ConnectionID` int NOT NULL AUTO_INCREMENT,
  `User1` int DEFAULT NULL,
  `User2` int DEFAULT NULL,
  `ConnectionType` enum('Follow','Friend','Blocked') DEFAULT NULL,
  `ConnectionDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ConnectionID`),
  KEY `User1` (`User1`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`User1`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`User1`) REFERENCES `users` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (1,1,2,'Follow','2025-03-07 05:00:15'),(2,2,3,'Follow','2025-03-07 05:00:15'),(3,3,4,'Friend','2025-03-07 05:00:15'),(4,4,5,'Follow','2025-03-07 05:00:15'),(5,5,6,'Follow','2025-03-07 05:00:15'),(6,6,7,'Friend','2025-03-07 05:00:15'),(7,7,8,'Follow','2025-03-07 05:00:15'),(8,8,9,'Follow','2025-03-07 05:00:15'),(9,9,10,'Friend','2025-03-07 05:00:15'),(10,10,1,'Follow','2025-03-07 05:00:15');
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engagements`
--

DROP TABLE IF EXISTS `engagements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engagements` (
  `EngagementID` int NOT NULL AUTO_INCREMENT,
  `PostID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `EngagementType` enum('like','share','comment') DEFAULT NULL,
  `EngagementDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EngagementID`),
  KEY `PostID` (`PostID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `engagements_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `posts` (`PostID`) ON DELETE CASCADE,
  CONSTRAINT `engagements_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engagements`
--

LOCK TABLES `engagements` WRITE;
/*!40000 ALTER TABLE `engagements` DISABLE KEYS */;
INSERT INTO `engagements` VALUES (1,1,2,'like','2025-03-07 04:52:25'),(2,1,3,'comment','2025-03-07 04:52:25'),(3,2,4,'like','2025-03-07 04:52:25'),(4,2,5,'share','2025-03-07 04:52:25'),(5,3,6,'comment','2025-03-07 04:52:25'),(6,3,7,'like','2025-03-07 04:52:25'),(7,4,8,'like','2025-03-07 04:52:25'),(8,4,9,'share','2025-03-07 04:52:25'),(9,5,10,'comment','2025-03-07 04:52:25'),(10,5,1,'like','2025-03-07 04:52:25');
/*!40000 ALTER TABLE `engagements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `PostID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `Content` text NOT NULL,
  `PostDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `Sentiments` enum('positive','negative','neutral') DEFAULT 'neutral',
  PRIMARY KEY (`PostID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'Exploring the future of AI in 2024!','2025-03-07 04:51:40','neutral'),(2,2,'Data Science is changing the world.','2025-03-07 04:51:40','neutral'),(3,3,'Happy to be part of the tech revolution.','2025-03-07 04:51:40','positive'),(4,4,'Machine learning algorithms are fascinating.','2025-03-07 04:51:40','neutral'),(5,5,'SQL is the backbone of data analytics.','2025-03-07 04:51:40','neutral'),(6,6,'Excited about deep learning advancements.','2025-03-07 04:51:40','neutral'),(7,7,'Just finished an amazing online course!','2025-03-07 04:51:40','neutral'),(8,8,'Working on a new startup idea in AI.','2025-03-07 04:51:40','neutral'),(9,9,'Cybersecurity is more important than ever.','2025-03-07 04:51:40','neutral'),(10,10,'Looking for collaborations in Data Science.','2025-03-07 04:51:40','neutral');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `EmailID` varchar(70) NOT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `DateJoined` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `EmailID` (`EmailID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'john_doe','John Doe','john@example.com','Male','2025-03-06 23:20:19'),(2,'emma_watson','Emma Watson','emma@example.com','Female','2025-03-06 23:20:19'),(3,'alex_smith','Alex Smith','alex@example.com','Other','2025-03-06 23:20:19'),(4,'mike_jordan','Mike Jordan','mike@example.com','Male','2025-03-06 23:20:19'),(5,'sophia_lee','Sophia Lee','sophia@example.com','Female','2025-03-06 23:20:19'),(6,'david_wilson','David Wilson','david@example.com','Male','2025-03-06 23:20:19'),(7,'olivia_martin','Olivia Martin','olivia@example.com','Female','2025-03-06 23:20:19'),(8,'ethan_brown','Ethan Brown','ethan@example.com','Male','2025-03-06 23:20:19'),(9,'isabella_clark','Isabella Clark','isabella@example.com','Female','2025-03-06 23:20:19'),(10,'noah_white','Noah White','noah@example.com','Male','2025-03-06 23:20:19');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'socialmediadbm'
--

--
-- Dumping routines for database 'socialmediadbm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-24 13:39:39
