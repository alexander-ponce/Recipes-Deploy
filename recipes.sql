CREATE DATABASE  IF NOT EXISTS `recipes` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipes`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: recipes
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `instructions` text,
  `under_time` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_recipes_users_idx` (`user_id`),
  CONSTRAINT `fk_recipes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (2,1,'Cheeseburger with no cheese','Howdy.','Double Howdy.',0,'2023-03-19 00:00:00','2023-03-19 18:25:22'),(3,2,'Bacon burger','Best sandwich ever!','You must get fresh ingredients and pack them together!',0,'2023-03-20 00:00:00','2023-03-19 19:16:04'),(5,1,'Cold wings','Buffalo sauce wings','Best wings ever!',0,'2023-03-19 00:00:00','2023-03-19 18:30:15'),(6,2,'Bacon Melt','Tuna with mayo and avocado','You must cook the bread, apply the tuna, and top if off with avocado. ',1,'2023-03-20 00:00:00','2023-03-19 19:15:49'),(7,2,'Sliced fruit','Best fruit on earth!','You slice, dice... then eat!',1,'2023-03-19 11:54:54','2023-03-19 11:54:54'),(9,1,'Cheeseburger','Best in town!','Go to In N Out.',0,'2023-03-20 00:00:00','2023-03-20 11:46:18'),(10,2,'Mac and Cheese','Best in town!','Buy the cheese, buy the mac, mix together and boom!',0,'2023-03-19 20:07:37','2023-03-19 20:07:37'),(12,2,'Cam Spam','fsdfsdfds','dsfdsfdsf',1,'2023-03-19 20:20:30','2023-03-19 20:20:30'),(13,3,'Spam food','vxcvxcvcx','cvxcvcxvxc',0,'2023-03-17 00:00:00','2023-03-19 20:37:40');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alex','Powers','alex@email.com','$2b$12$SgfwKnzmYOedVhcAZ3LS2.DZtwpGsJjRsvXN055v5ljSWch/BNB/q','2023-03-18 19:18:46','2023-03-18 19:18:46'),(2,'Alexander','Awesome','alexander@email.com','$2b$12$FMEdSI5vaDtBZ.vzofFi9edYTan6jV/8jIpmeMgSJ1sQuTs1H2Osi','2023-03-18 19:32:38','2023-03-18 19:32:38'),(3,'Cam','The Man','cam@email.com','$2b$12$SgfwKnzmYOedVhcAZ3LS2.DZtwpGsJjRsvXN055v5ljSWch/BNB/q','2023-03-19 20:29:12','2023-03-26 20:52:10'),(4,'David','Guy','david@email.com','11111111','2023-03-20 16:50:02','2023-03-20 16:50:02'),(5,'Fredy','Man','fredy@email.com','$2b$12$9/200WL.MNxOO1ttbOK3J.HNHz7mgHPYN4TPts0KfnhzAarzG6EMu','2023-03-20 16:52:28','2023-03-20 16:52:28'),(6,'Mario','Lopez','mario@email.com','$2b$12$FMEdSI5vaDtBZ.vzofFi9edYTan6jV/8jIpmeMgSJ1sQuTs1H2Osi','2023-03-20 21:40:13','2023-03-26 20:52:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-26 20:55:31
