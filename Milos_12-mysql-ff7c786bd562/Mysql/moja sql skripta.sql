-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: drustvena_mreza
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `korisnik` (
  `korisnik_id` int(150) unsigned NOT NULL AUTO_INCREMENT,
  `ime_id` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prezime` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `datum rodjenja` date NOT NULL,
  `drzava rodjenja` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `e-mail adresa` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `korisnicko ime` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `kratka biografija` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `fotografija` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`korisnik_id`),
  KEY `fk_korisnik_ime_id_idx` (`ime_id`),
  CONSTRAINT `fk_korisnik_ime_id` FOREIGN KEY (`ime_id`) REFERENCES `prijateljstvo` (`ime_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES (1,'Petar','Peric','1987-04-11','Srbija','petar@gmail.com','Pera','sluzbeni radnik','2134 jpg'),(2,'Jovan','Jovanovic','1987-05-22','Srbija','jovan@gmail.com','Jova','inzenjer','1423 jpg'),(3,'Ivan','Ivanovic','1989-07-13','Srbija','ivan@gmail.com','Ika','policajac','1534 jpg');
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prijateljstvo`
--

DROP TABLE IF EXISTS `prijateljstvo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prijateljstvo` (
  `prijateljstvo_id` int(150) unsigned NOT NULL AUTO_INCREMENT,
  `datum prijateljstva` date NOT NULL,
  `prihvatanje prijateljstva` enum('da','ne') COLLATE utf8_unicode_ci NOT NULL,
  `ime_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `prihvatio/la` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`prijateljstvo_id`),
  UNIQUE KEY `ime_id_UNIQUE` (`ime_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prijateljstvo`
--

LOCK TABLES `prijateljstvo` WRITE;
/*!40000 ALTER TABLE `prijateljstvo` DISABLE KEYS */;
INSERT INTO `prijateljstvo` VALUES (1,'2013-04-07','da','1','Jovan Jovanovic'),(2,'2014-06-13','da','2','Petar Peric');
/*!40000 ALTER TABLE `prijateljstvo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `status_id` int(150) unsigned NOT NULL AUTO_INCREMENT,
  `tekst` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `slika` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `naslov` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `datum` date NOT NULL,
  `vreme` time(2) NOT NULL,
  `korisnik_id` int(150) unsigned NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `fk_status_korisnik_id_idx` (`korisnik_id`),
  CONSTRAINT `fk_status_korisnik_id` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (4,'Zdravo','jpeg 2435','Prijatelji','2018-01-02','13:46:23.00',2),(5,'Cao','jpeg 2154','Dragi Prijatelji','2018-01-03','11:15:24.00',1);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'drustvena_mreza'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-19  2:15:16
