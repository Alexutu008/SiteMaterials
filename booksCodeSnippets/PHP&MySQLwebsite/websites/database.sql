-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for Linux (x86_64)
--
-- Host: mysql    Database: ijdb
-- ------------------------------------------------------
-- Server version	11.8.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ijdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ijdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `ijdb`;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Lucas Bennett','lucas.bennett@gmail.com',NULL),(2,'Aisha Karim','aisha.karim@gmail.com',NULL),(3,'Mateo Rossi','mateo.rossi@yahoo.com',NULL),(4,'Yuna Takahashi','yuna.takahashi@gmail.com',NULL),(5,'Elijah Cohen','elijah.cohen@gmail.com',NULL),(7,'Alex Ionita','alex.ionita.doom@gmail.com','123456'),(8,'test','ceva@gmail.com','$2y$12$98jF6jE2Tzbt.bLRTQgmkej5Mw/FdvpDKI1z3EJQvqAGOSKUQjFnC');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Knock-knock'),(2,'Cross the road'),(3,'Lawyers'),(4,'Walk the bar'),(5,'Light bulb');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joke`
--

DROP TABLE IF EXISTS `joke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joke` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joketext` text DEFAULT NULL,
  `jokedate` date DEFAULT NULL,
  `authorid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joke`
--

LOCK TABLES `joke` WRITE;
/*!40000 ALTER TABLE `joke` DISABLE KEYS */;
INSERT INTO `joke` VALUES (1,'A programmer was found dead in the shower. The instructions read: lather, rinse, repeat.','2021-04-01',1),(2,'!false - it\'s funny because it\'s true','2021-10-29',2),(6,'Where do sheep love to vacation?\r\nThe Baa-hamas.','2025-06-16',3),(7,'Why did the employee go work on stilts?\r\nHe wanted a raise.','2025-06-16',4),(9,'Why was this site created?\r\nSo Elijah could see his name on a site','2025-06-23',1);
/*!40000 ALTER TABLE `joke` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jokecategory`
--

DROP TABLE IF EXISTS `jokecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jokecategory` (
  `jokeid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  PRIMARY KEY (`jokeid`,`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jokecategory`
--

LOCK TABLES `jokecategory` WRITE;
/*!40000 ALTER TABLE `jokecategory` DISABLE KEYS */;
INSERT INTO `jokecategory` VALUES (1,2),(2,1),(3,4),(4,3),(4,5);
/*!40000 ALTER TABLE `jokecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ijdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-28  9:39:14
