-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: solution
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('food'),('vegetable'),('Fast Food'),('Services'),('Electronics'),('Electrical'),('Utensiles'),('clothes'),('Fruits'),('Liquor'),('Cosmetics'),('Building Material');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `name` varchar(20) NOT NULL,
  `pno` varchar(10) NOT NULL,
  `pass` varchar(20) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'pratik23','Pratik Kumar','7983951563','hey'),(2,'Jatin12','Jatin','1236547896','heyy'),(3,'Nishant123','Nishant Trivedi','1452369865','raja'),(4,'heeee123','HHH','1452369875','hui'),(5,'hell94','Hell','1452368975','hii'),(6,'satyapal12','satyapal yadav','9412833701','spy'),(7,'hello1','hello','1452369632','hey'),(10,'hel1','hel','1452879635','hey'),(12,'hi1','hi','1452369658','hey');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `iid` int(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `dname` varchar(20) NOT NULL,
  `oneunitsize` int(7) NOT NULL,
  `quantity` int(7) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `price` int(7) NOT NULL,
  PRIMARY KEY (`iid`),
  UNIQUE KEY `itemname` (`itemname`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'potato1kg','vegetable','pratik60','Potato',1,46,'kg',50),(2,'Potato5kgpratik06','vegetable','pratik06','Potato',5,55,'kg',77),(3,'Potato2khpratik06','vegetable','pratik06','Potato',2,97,'kg',50),(4,'potato1kghell99','vegetable','hell99','Potato',1,49,'kg',50),(5,'Carrot1kgpratik06','food','pratik06','Carrot',1,0,'kg',50),(6,'tomato1kgpratik06','food','pratik06','tomato',1,95,'kg',50),(7,'Carrot3kgpratik06','food','pratik06','Carrot',3,140,'kg',100),(8,'Apple1kgpratik06','food','pratik06','Apple',1,10,'kg',10),(9,'Apple5kgpratik06','Fruits','pratik06','Apple',5,100,'kg',10),(10,'Banana1kgpratik06','Fruits','pratik06','Banana',1,100,'kg',10),(11,'Banana2kgpratik06','Fruits','pratik06','Banana',2,150,'kg',77);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `lid` int(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(20) NOT NULL,
  `bquantity` int(7) NOT NULL,
  `rquantity` int(7) NOT NULL,
  `oneunitsize` int(7) NOT NULL,
  `susername` varchar(20) NOT NULL,
  `cusername` varchar(20) NOT NULL,
  `price` int(7) NOT NULL,
  `boughtat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dname` varchar(20) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'potato1kg',1,47,1,'pratik60','pratik23',50,'2020-05-23 09:11:00','Potato'),(2,'potato1kg',1,46,1,'pratik60','pratik23',50,'2020-05-23 09:16:23','Potato'),(3,'Potato2khpratik06',1,99,2,'pratik06','pratik23',50,'2020-05-23 10:12:29','Potato'),(4,'potato1kghell99',1,49,1,'hell99','pratik23',50,'2020-05-23 10:12:36','Potato'),(5,'Carrot1kgpratik06',1,9,1,'pratik06','pratik23',50,'2020-05-23 10:14:28','Carrot'),(6,'Carrot1kgpratik06',1,8,1,'pratik06','pratik23',50,'2020-05-23 10:14:34','Carrot'),(7,'Carrot1kgpratik06',8,0,1,'pratik06','pratik23',50,'2020-05-23 10:14:41','Carrot'),(8,'Potato2khpratik06',2,97,2,'pratik06','pratik23',50,'2020-05-24 11:26:52','Potato'),(9,'Carrot3kgpratik06',10,140,3,'pratik06','hi1',100,'2020-05-25 18:10:54','Carrot'),(10,'tomato1kgpratik06',1,99,1,'pratik06','pratik23',50,'2020-05-27 07:20:24','tomato'),(11,'tomato1kgpratik06',1,98,1,'pratik06','pratik23',50,'2020-05-27 07:24:20','tomato'),(12,'tomato1kgpratik06',1,97,1,'pratik06','pratik23',50,'2020-05-27 07:25:11','tomato'),(13,'tomato1kgpratik06',1,96,1,'pratik06','pratik23',50,'2020-05-27 07:25:13','tomato'),(14,'tomato1kgpratik06',1,95,1,'pratik06','pratik23',50,'2020-05-27 07:25:14','tomato');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopper`
--

DROP TABLE IF EXISTS `shopper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopper` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `pno` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopper`
--

LOCK TABLES `shopper` WRITE;
/*!40000 ALTER TABLE `shopper` DISABLE KEYS */;
INSERT INTO `shopper` VALUES (1,'pratik06','Pratik Kumar','7983951573','Shyamji Vatika','Agra','India','Uttar Pradesh','hey'),(2,'Jatin123','Jatin Agggaral','145236897','Siknadra','Agra','Uttar Pradesh','India','heyy'),(3,'hell99','Hell','1452369863','Nowhere','Solar System','Universe','Galaxy','hii'),(4,'hel11','hel','1452897654','Nowhere','Solar System','Galaxy','Universe','hey');
/*!40000 ALTER TABLE `shopper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-27 16:28:37
