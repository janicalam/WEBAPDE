CREATE DATABASE  IF NOT EXISTS `webapde_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webapde_db`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: webapde_db
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `idnum` int(8) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `lname` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  PRIMARY KEY (`idnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (123455,'asdfgh','Student','asd@dlsu.edu.ph','afs','asf'),(11311339,'raisa','Professor',NULL,'Lee','Raisa'),(11335172,'bianca','Student',NULL,'Regala ','Bianca'),(11347120,'janine','Student',NULL,'Tan','Janine');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookedhours`
--

DROP TABLE IF EXISTS `bookedhours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookedhours` (
  `bookedhoursid` int(11) NOT NULL AUTO_INCREMENT,
  `idnum` int(8) NOT NULL,
  `date` date NOT NULL,
  `fromtime` time NOT NULL,
  `totime` time NOT NULL,
  PRIMARY KEY (`bookedhoursid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookedhours`
--

LOCK TABLES `bookedhours` WRITE;
/*!40000 ALTER TABLE `bookedhours` DISABLE KEYS */;
INSERT INTO `bookedhours` VALUES (1,11311339,'2015-02-25','01:00:00','01:30:00'),(2,11311339,'2015-03-19','03:00:00','03:30:00');
/*!40000 ALTER TABLE `bookedhours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultations`
--

DROP TABLE IF EXISTS `consultations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultations` (
  `consultationid` int(11) NOT NULL AUTO_INCREMENT,
  `student` int(8) NOT NULL,
  `professor` int(8) NOT NULL,
  `date` date NOT NULL,
  `fromtime` time NOT NULL,
  `totime` time NOT NULL,
  `course` varchar(45) NOT NULL,
  `topic` varchar(45) NOT NULL,
  `studentRemark` varchar(1000) DEFAULT NULL,
  `facultyRemark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`consultationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultations`
--

LOCK TABLES `consultations` WRITE;
/*!40000 ALTER TABLE `consultations` DISABLE KEYS */;
INSERT INTO `consultations` VALUES (1,11347120,11311339,'2015-02-25','01:00:00','01:30:00','OBJECTP','Inheritance',NULL,NULL),(2,11335172,11311339,'2015-03-19','03:00:00','03:30:00','WEBAPDE','Database Connection',NULL,NULL);
/*!40000 ALTER TABLE `consultations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseenrolled`
--

DROP TABLE IF EXISTS `courseenrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseenrolled` (
  `idcourse` int(11) NOT NULL,
  `idnum` int(11) NOT NULL,
  PRIMARY KEY (`idcourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseenrolled`
--

LOCK TABLES `courseenrolled` WRITE;
/*!40000 ALTER TABLE `courseenrolled` DISABLE KEYS */;
INSERT INTO `courseenrolled` VALUES (12,11347120),(13,11347120),(14,11347120),(15,11347120),(18,11347120);
/*!40000 ALTER TABLE `courseenrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `idcourse` int(11) NOT NULL,
  `coursecode` varchar(45) NOT NULL,
  `section` varchar(45) NOT NULL,
  `idprofessor` int(11) NOT NULL,
  PRIMARY KEY (`idcourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (12,'WEBAPDE','S17',11311339),(13,'OPERSYS','S16',11311339),(14,'SPSWENG','S18',11311339),(15,'KASPIL1','S15',11311339),(16,'KASPIL2','S20',11311339),(17,'TREDONE','S21',11311339),(18,'TREDTWO','S22',11311339),(19,'FROMDEV','S11',11311339);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(8) NOT NULL,
  `receiver` int(8) NOT NULL,
  `message` varchar(10000) NOT NULL,
  `date` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`messageid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,11311339,11347120,'hello','2015-03-19 00:00:00',0),(2,11335172,11311339,'Hi Raisa','2015-03-12 00:00:00',0);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notificationid` int(11) NOT NULL AUTO_INCREMENT,
  `idnum` int(8) NOT NULL,
  `notification` varchar(50) NOT NULL,
  PRIMARY KEY (`notificationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,11311339,'Janine booked a conultation'),(2,11311339,'Bianca booked a consultation');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unavailablehours`
--

DROP TABLE IF EXISTS `unavailablehours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unavailablehours` (
  `unavailablehoursid` int(11) NOT NULL,
  `date` date NOT NULL,
  `fromtime` time NOT NULL,
  `totime` time NOT NULL,
  PRIMARY KEY (`unavailablehoursid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unavailablehours`
--

LOCK TABLES `unavailablehours` WRITE;
/*!40000 ALTER TABLE `unavailablehours` DISABLE KEYS */;
/*!40000 ALTER TABLE `unavailablehours` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-07 16:30:00
