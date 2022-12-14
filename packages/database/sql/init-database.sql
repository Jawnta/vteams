-- MariaDB dump 10.19  Distrib 10.9.3-MariaDB, for osx10.17 (x86_64)
--
-- Host: mariadb    Database: vteams
-- ------------------------------------------------------
-- Server version	10.9.3-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_station`
--

DROP TABLE IF EXISTS `charging_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charging_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charging_zone_id` int(11) NOT NULL,
  `position` point NOT NULL,
  `occupied` tinyint(1) NOT NULL DEFAULT 0,
  `scooter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `charging_station_charging_zone_idx` (`charging_zone_id`),
  KEY `charging_station_bike_idx` (`scooter_id`),
  CONSTRAINT `charging_station_charging_zone` FOREIGN KEY (`charging_zone_id`) REFERENCES `charging_zone` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `charging_station_scooter` FOREIGN KEY (`scooter_id`) REFERENCES `scooter` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_station`
--

LOCK TABLES `charging_station` WRITE;
/*!40000 ALTER TABLE `charging_station` DISABLE KEYS */;
INSERT INTO `charging_station` VALUES
(1,1,'\0\0\0\0\0\0\0IÇµL@Ëï£./@',0,NULL),
(2,1,'\0\0\0\0\0\0\0õ·BÜL@W∞ê`+/@',0,NULL),
(3,1,'\0\0\0\0\0\0\0^®nD\"L@ô/…ı#+/@',0,NULL),
(4,1,'\0\0\0\0\0\0\0*J\\™áL@ì‘ˆ6U./@',0,NULL),
(5,1,'\0\0\0\0\0\0\0ê^ÄL@‚ìñ∫w(/@',0,NULL),
(6,1,'\0\0\0\0\0\0\0v]ò=L@UCrI@*/@',0,NULL),
(7,1,'\0\0\0\0\0\0\0\Z*í¬QL@≈Õæé…+/@',0,NULL),
(8,1,'\0\0\0\0\0\0\0‰\\˜˘1L@eŸ¢+/@',0,NULL),
(9,1,'\0\0\0\0\0\0\0ái˘L@=¬Ÿô*/@',0,NULL);
/*!40000 ALTER TABLE `charging_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_zone`
--

DROP TABLE IF EXISTS `charging_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charging_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parking_zone_id` int(11) DEFAULT NULL,
  `area` polygon DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `charging_zone_parking_zone_idx` (`parking_zone_id`),
  CONSTRAINT `charging_zone_parking_zone` FOREIGN KEY (`parking_zone_id`) REFERENCES `parking_zone` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_zone`
--

LOCK TABLES `charging_zone` WRITE;
/*!40000 ALTER TABLE `charging_zone` DISABLE KEYS */;
INSERT INTO `charging_zone` VALUES
(1,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0ı™L@B˝In,/@êwN|L@Pd §O(/@\0(wúˆL@¿¥À¯í*/@†∏U^˜L@¿ùÄø\'//@¿ﬁF•†L@∞xïÎ”0/@ı™L@B˝In,/@');
/*!40000 ALTER TABLE `charging_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES
(1,'Karlskrona');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) NOT NULL,
  `payed` timestamp NULL DEFAULT NULL,
  `amount` float NOT NULL,
  `billed` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `invoice_trip_idx` (`trip_id`),
  CONSTRAINT `invoice_trip` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES
(1,1,NULL,23539,'2022-12-14 09:57:05'),
(2,2,NULL,23086,'2022-12-14 09:57:05'),
(3,3,NULL,22957,'2022-12-14 09:57:05'),
(4,4,NULL,22579,'2022-12-14 09:57:05'),
(5,5,NULL,22564,'2022-12-14 09:57:05'),
(6,6,NULL,21640,'2022-12-14 09:57:05'),
(7,7,NULL,20773,'2022-12-14 09:57:05'),
(8,8,NULL,22060,'2022-12-14 09:57:05'),
(9,9,NULL,23353,'2022-12-14 09:57:05'),
(10,10,NULL,23545,'2022-12-14 09:57:05'),
(11,11,NULL,22990,'2022-12-14 09:57:05'),
(12,12,NULL,21166,'2022-12-14 09:57:05'),
(13,13,NULL,23098,'2022-12-14 09:57:05'),
(14,14,NULL,23302,'2022-12-14 09:57:05'),
(15,15,NULL,21142,'2022-12-14 09:57:05'),
(16,16,NULL,22657,'2022-12-14 09:57:05'),
(17,17,NULL,22372,'2022-12-14 09:57:05'),
(18,18,NULL,22114,'2022-12-14 09:57:05'),
(19,19,NULL,21838,'2022-12-14 09:57:05'),
(20,20,NULL,23020,'2022-12-14 09:57:05'),
(21,21,NULL,20716,'2022-12-14 09:57:05'),
(22,22,NULL,23002,'2022-12-14 09:57:05'),
(23,23,NULL,23542,'2022-12-14 09:57:05'),
(24,24,NULL,21058,'2022-12-14 09:57:05'),
(25,25,NULL,22375,'2022-12-14 09:57:05'),
(26,26,NULL,21520,'2022-12-14 09:57:05'),
(27,27,NULL,21997,'2022-12-14 09:57:05'),
(28,28,NULL,20863,'2022-12-14 09:57:05'),
(29,29,NULL,23242,'2022-12-14 09:57:05'),
(30,30,NULL,22285,'2022-12-14 09:57:05'),
(31,31,NULL,23224,'2022-12-14 09:57:05'),
(32,32,NULL,20782,'2022-12-14 09:57:05'),
(33,33,NULL,21379,'2022-12-14 09:57:05'),
(34,34,NULL,22858,'2022-12-14 09:57:05');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_log`
--

DROP TABLE IF EXISTS `maintenance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scooter_id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `event` varchar(100) DEFAULT NULL,
  `invoked_by` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_log_bike_idx` (`scooter_id`),
  CONSTRAINT `maintenance_log_scooter` FOREIGN KEY (`scooter_id`) REFERENCES `scooter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_log`
--

LOCK TABLES `maintenance_log` WRITE;
/*!40000 ALTER TABLE `maintenance_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`snaladm`@`mariadb`*/ /*!50003 TRIGGER `vteams`.`maintenance_log_AFTER_INSERT` AFTER INSERT ON `maintenance_log` FOR EACH ROW
BEGIN
	IF NEW.invoked_by = 'service' THEN
		UPDATE scooter
        SET scooter.last_serviced = CURRENT_TIMESTAMP()
        WHERE scooter.id = NEW.scooter_id;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `parking_zone`
--

DROP TABLE IF EXISTS `parking_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `area` polygon DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parking_zone_city_idx` (`city_id`),
  CONSTRAINT `parking_zone_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_zone`
--

LOCK TABLES `parking_zone` WRITE;
/*!40000 ALTER TABLE `parking_zone` DISABLE KEYS */;
INSERT INTO `parking_zone` VALUES
(1,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0ı™L@B˝In,/@êwN|L@Pd §O(/@\0(wúˆL@¿¥À¯í*/@†∏U^˜L@¿ùÄø\'//@¿ﬁF•†L@∞xïÎ”0/@ı™L@B˝In,/@');
/*!40000 ALTER TABLE `parking_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scooter`
--

DROP TABLE IF EXISTS `scooter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scooter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `charge` int(11) NOT NULL DEFAULT 100,
  `last_serviced` timestamp NULL DEFAULT current_timestamp(),
  `first_used` timestamp NULL DEFAULT NULL,
  `distance_traveled` float DEFAULT 0,
  `last_position` point DEFAULT NULL,
  `is_charging` tinyint(1) NOT NULL DEFAULT 0,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scooter_city_idx` (`city_id`),
  CONSTRAINT `scooter_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scooter`
--

LOCK TABLES `scooter` WRITE;
/*!40000 ALTER TABLE `scooter` DISABLE KEYS */;
INSERT INTO `scooter` VALUES
(1,1,1,70,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0.(ö\"?/@ì€ŒML@',0,1),
(2,1,1,57,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0Q$ãH≤5/@¬‚µ_L@',0,1),
(3,1,1,58,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0J[€…ß7/@ ΩÙ›L@',0,1),
(4,1,1,84,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0B ∞ÒÁ*/@ü„¯¢}L@',0,1),
(5,1,1,47,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0eAÇÙŸ%/@∆çâÀ\\L@',0,1),
(6,1,1,46,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0O.—-/@ÆÆ €L@',0,1),
(7,1,1,67,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0∂M¿‚`?/@áé·ÃL@',0,1),
(8,1,1,58,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0á`,b9/@-¿∑lL@',0,1),
(9,1,1,47,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0Y[C!7/@e Áò¿L@',0,1),
(10,1,1,65,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0”ÌÒäy!/@´Ë˙√L@',0,1),
(11,1,1,64,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0‚CèÛ(/@[¯8ÔeL@',0,1),
(12,1,1,45,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0¿%wŒ∂,/@\nÔ§L@',0,1),
(13,1,1,57,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ºQsT8/@CäQñ¿L@',0,1),
(14,1,1,42,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ÈåXÒ8/@Aı’/L@',0,1),
(15,1,1,49,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0}—3\"/@-HyL@',0,1),
(16,1,1,67,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0Ã&w=/@a\n˘ÏıL@',0,1),
(17,1,1,96,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0\n1X˙i</@É\ZR7qL@',0,1),
(18,1,1,70,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0Lô⁄u+/@l}ML@',0,1),
(19,1,1,50,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ï]ìÌ0\"/@$nML@',0,1),
(20,1,1,61,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0¡™õõ%/@Í∆BL@',0,1),
(21,1,1,94,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0GH‰€</@Ω·0œL@',0,1),
(22,1,1,44,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0∫Ä˙3;/@+·+πL@',0,1),
(23,1,1,86,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ï ‡Í˛+/@ÊFa:L@',0,1),
(24,1,1,74,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ër\"?/@m›ÄIL@',0,1),
(25,1,1,40,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0OöÌÌ\'/@‡∆\"ÀHL@',0,1),
(26,1,1,74,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0DMO:/@¯„øL@',0,1),
(27,1,1,82,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0yLí»+/@áÅ∫ÄL@',0,1),
(28,1,1,83,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0#ö Àˇ\"/@{‹µÒL@',0,1),
(29,1,1,47,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0˛˜Ö¨$?/@G#Ú∫◊L@',0,1),
(30,1,1,80,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0€∏4x¸4/@|I°∂PL@',0,1),
(31,1,1,62,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0·Á\rÌ./@;<ÔË2L@',0,1),
(32,1,1,73,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ÿ¥Ù2/@‹Ü^üL@',0,1),
(33,1,1,48,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ÔâˇS$)/@Î†ÕyòL@',0,1),
(34,1,1,81,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0¯îeff//@Ì™É\rL@',0,1),
(35,1,1,50,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0»3êƒÑ?/@≥\r%˘ﬁL@',0,1),
(36,1,1,90,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0¿<n¡c /@ôºC≠—L@',0,1),
(37,1,1,50,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0Y]ËA£/@Ós\"ŸL@',0,1),
(38,1,1,95,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0”|Œ6$/@.€HHÿL@',0,1),
(39,1,1,86,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0∑˚Á-/@ÑÕôhsL@',0,1),
(40,1,1,53,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ÊŒ0i/@∑6\\µ≥L@',0,1),
(41,1,1,65,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0c˝UÌ‹-/@∑>∑ø\'L@',0,1),
(42,1,1,87,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ì$tõ’)/@ªûö%L@',0,1),
(43,1,1,46,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ûQY~\'//@\"VË3zL@',0,1),
(44,1,1,53,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0RqcŸ>/@‰ÒíÏûL@',0,1),
(45,1,1,50,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0æöÖ‹&/@ñ/∆ÒL@',0,1),
(46,1,1,90,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0Ø´…`$/@∏¬0fäL@',0,1),
(47,1,1,72,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0åó“‰è6/@Y¬R§L@',0,1),
(48,1,1,56,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ÔøUfë>/@hΩ8@`L@',0,1),
(49,1,1,45,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0®,›sï>/@~∏ !àL@',0,1),
(50,1,1,69,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0®<ŸÖ/@›^| L@',0,1),
(51,1,1,49,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0Ú!m9!/@—ëH_HL@',0,1),
(52,1,1,82,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0∂Ä√N\'/@§/l„ZL@',0,1),
(53,1,1,52,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0+Og“:-/@v¸|4L@',0,1),
(54,1,1,61,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0U0äı4/@ˇı⁄nÅL@',0,1),
(55,1,1,66,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0!0ıO//@¿˚Á6úL@',0,1),
(56,1,1,80,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ø%ˆ\"/@§z‚¶ˇL@',0,1),
(57,1,1,46,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0NAÏ—∏/@˚w©◊L@',0,1),
(58,1,1,61,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0-Mx—¨0/@º≈Ä¸L@',0,1),
(59,1,1,61,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0Ô¥Uµ7/@Éhaè¬L@',0,1),
(60,1,1,59,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0◊5§ëh#/@ö#L@',0,1),
(61,1,1,89,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0rµÑx¶7/@û{°@L@',0,1),
(62,1,1,78,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0°Üı\"A:/@oLw0ÂL@',0,1),
(63,1,1,95,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0™Ìmì4/@¸\0“hL@',0,1),
(64,1,1,51,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0Ï-=ª:9/@˚Ç^Î∏L@',0,1),
(65,1,1,48,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0çVL#3/@˝·îY∏L@',0,1),
(66,1,1,53,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0¥;¥õ⁄7/@°±nòjL@',0,1),
(67,1,1,85,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ï=S?/@ú1q∫L@',0,1),
(68,1,1,100,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0K‰≈ >/@◊ÛJ†ŸL@',0,1),
(69,1,1,85,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0JıU?>/@r‚Ê6L@',0,1),
(70,1,1,78,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0{2†o:(/@ÊÙ\ZzL@',0,1),
(71,1,1,99,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0 c¬Ì~</@©mUWL@',0,1),
(72,1,1,84,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0Ét‹wù?/@Eê—êL@',0,1),
(73,1,1,94,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0¯≈n#*/@¬ØUËxL@',0,1),
(74,1,1,91,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0\rÖ\\◊±\'/@BVfKL@',0,1),
(75,1,1,66,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0]T%¯\n1/@˝p›n∫L@',0,1),
(76,1,1,56,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0H3ÑÛ!/@_cTL%L@',0,1),
(77,1,1,93,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0m[©d./@L]	oJL@',0,1),
(78,1,1,75,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0˜πÎÖ·(/@@⁄_¬L@',0,1),
(79,1,1,53,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0!µ†ñÏ</@¨îOh$L@',0,1),
(80,1,1,52,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0∆Ìbgπ/@˝ËÃy˛L@',0,1),
(81,1,1,99,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0$P≠∞Ÿ6/@—&€i\\L@',0,1),
(82,1,1,63,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0l…£c(/@Jj˙˙ŒL@',0,1),
(83,1,1,85,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0ÏÒ,¨÷1/@ IOØ;L@',0,1),
(84,1,1,64,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0r2só»(/@£©GY∏L@',0,1),
(85,1,1,58,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0A´“Fó,/@ïº}L@',0,1),
(86,1,1,59,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0◊Ø6\"c:/@M`=ôÈL@',0,1),
(87,1,1,91,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0a}HU$/@≠?É$L@',0,1),
(88,1,1,87,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0¢ãÈr›,/@Ã‹b:L@',0,1),
(89,1,1,70,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0—rÚ∂0/@ËñàNL@',0,1),
(90,1,1,97,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\00¿l_,/@ˆ[F~èL@',0,1),
(91,1,1,68,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\08\r`À</@¶‡µdoL@',0,1),
(92,1,1,85,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0êæä.Ω(/@Æ,ﬁ˜SL@',0,1),
(93,1,1,52,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0WﬁªD};/@âÉô1L@',0,1),
(94,1,1,72,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0¶\\fz</@†“ØµL@',0,1),
(95,1,1,52,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0∞º(Y)/@∞)xVL@',0,1),
(96,1,1,47,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0D¥r¬»!/@eP(Ü@L@',0,1),
(97,1,1,80,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0\'ô∫yR&/@÷Ëéù3L@',0,1),
(98,1,1,73,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0!^Â„å5/@‡µ?∆wL@',0,1),
(99,1,1,65,'2022-12-14 09:57:05',NULL,0,'\0\0\0\0\0\0\0°˙$>/@ﬁ‘\rtL@',0,1);
/*!40000 ALTER TABLE `scooter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scooter_log`
--

DROP TABLE IF EXISTS `scooter_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scooter_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scooter_id` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `position` point DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `charge` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bike_log_bike_idx` (`scooter_id`),
  CONSTRAINT `scooter_log_scooter` FOREIGN KEY (`scooter_id`) REFERENCES `scooter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scooter_log`
--

LOCK TABLES `scooter_log` WRITE;
/*!40000 ALTER TABLE `scooter_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `scooter_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`snaladm`@`mariadb`*/ /*!50003 TRIGGER `vteams`.`scooter_log_AFTER_INSERT` AFTER INSERT ON `scooter_log` FOR EACH ROW
BEGIN
UPDATE scooter
SET last_position = NEW.position,
	charge		  = NEW.charge,
    distance_traveled = distance_traveled + (NEW.speed * (1/60))
WHERE id = NEW.scooter_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `scooter_id` int(11) DEFAULT NULL,
  `distance` float DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `start_position` point NOT NULL,
  `stop_position` point DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `stop_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_user_idx` (`user_id`),
  KEY `trip_bike_idx` (`scooter_id`),
  CONSTRAINT `trip_scooter` FOREIGN KEY (`scooter_id`) REFERENCES `scooter` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `trip_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES
(1,162,80,0,0,'\0\0\0\0\0\0\0◊˛ö~ÒL@¢K”d /@','\0\0\0\0\0\0\0ö°\\ˆL@!áN\Z6?/@','2022-12-08 23:13:24','2022-12-14 09:57:05'),
(2,969,48,0,0,'\0\0\0\0\0\0\0‹˝m$L@?‹Ωﬂ./@','\0\0\0\0\0\0\0q)ÜL@∫óÔÁ</@','2022-12-09 01:44:15','2022-12-14 09:57:05'),
(3,62,98,0,0,'\0\0\0\0\0\0\0=y§˝5L@zg}(/@','\0\0\0\0\0\0\0Y¨´›L@–˛5b¡!/@','2022-12-09 02:27:44','2022-12-14 09:57:05'),
(4,922,22,0,0,'\0\0\0\0\0\0\0‰–‘L@ë\\é)\'/@','\0\0\0\0\0\0\0SñáY2L@Ω\Z2ï -/@','2022-12-09 04:33:42','2022-12-14 09:57:05'),
(5,675,33,0,0,'\0\0\0\0\0\0\0S≠áFL@#hﬂï>//@','\0\0\0\0\0\0\0IKQÉ*L@Q;€ß¶#/@','2022-12-09 04:38:22','2022-12-14 09:57:05'),
(6,736,43,0,0,'\0\0\0\0\0\0\0LD Ï¸L@*qh¬?/@','\0\0\0\0\0\0\0«9Ÿ%BL@tI}\r—:/@','2022-12-09 09:46:46','2022-12-14 09:57:05'),
(7,422,78,0,0,'\0\0\0\0\0\0\0dŒàÚPL@ô)˜9´$/@','\0\0\0\0\0\0\0|S¶0·L@.Gè9(/@','2022-12-09 14:35:58','2022-12-14 09:57:05'),
(8,285,50,0,0,'\0\0\0\0\0\0\0ç˜SªL@íóv{:/@','\0\0\0\0\0\0\0/HéwL@t◊Å}Ë/@','2022-12-09 07:26:52','2022-12-14 09:57:05'),
(9,64,5,0,0,'\0\0\0\0\0\0\04†ÂˆL@°≈í`i/@','\0\0\0\0\0\0\0ÏŒ\\ÆeL@oè^åU\'/@','2022-12-09 00:15:16','2022-12-14 09:57:05'),
(10,814,84,0,0,'\0\0\0\0\0\0\0π‡ŸcƒL@ÙIÏÁ‚0/@','\0\0\0\0\0\0\0ÃRÏ∂L@…ïD„D(/@','2022-12-08 23:11:23','2022-12-14 09:57:05'),
(11,285,98,0,0,'\0\0\0\0\0\0\0=k(L@´⁄\"L4/@','\0\0\0\0\0\0\0\'ú)©…L@‡6§q<$/@','2022-12-09 02:16:56','2022-12-14 09:57:05'),
(12,927,92,0,0,'\0\0\0\0\0\0\0hπeBˆL@¨F~Ai\'/@','\0\0\0\0\0\0\0≠∆˛¢$L@b≥©\0	//@','2022-12-09 12:24:41','2022-12-14 09:57:05'),
(13,702,23,0,0,'\0\0\0\0\0\0\0¥¡Æ@&L@6«\\¿;/@','\0\0\0\0\0\0\00rÈDîL@é:È0/@','2022-12-09 01:40:39','2022-12-14 09:57:05'),
(14,879,6,0,0,'\0\0\0\0\0\0\0S6∑∏ÆL@’7é\Zç8/@','\0\0\0\0\0\0\0~K˘„L@	¸íSÍ\'/@','2022-12-09 00:32:36','2022-12-14 09:57:05'),
(15,845,12,0,0,'\0\0\0\0\0\0\0◊‚p…L@Á∆e±$/@','\0\0\0\0\0\0\0ÛUyeﬂL@¬V{Ü4/@','2022-12-09 12:32:42','2022-12-14 09:57:05'),
(16,338,5,0,0,'\0\0\0\0\0\0\0xÀ‘L@√ﬁ„Ø4/@','\0\0\0\0\0\0\0†*ı√L@E•∏Ùl9/@','2022-12-09 04:07:57','2022-12-14 09:57:05'),
(17,481,92,0,0,'\0\0\0\0\0\0\0ê—GL@Ëí„%Ö:/@','\0\0\0\0\0\0\0˚0¬ûL@tMl+œ=/@','2022-12-09 05:42:37','2022-12-14 09:57:05'),
(18,151,3,0,0,'\0\0\0\0\0\0\0óÅy–>L@ª4\\/@','\0\0\0\0\0\0\0“ÕoÚ1L@)•b*/@','2022-12-09 07:09:02','2022-12-14 09:57:05'),
(19,247,27,0,0,'\0\0\0\0\0\0\0+º¡‘L@<©√~//@','\0\0\0\0\0\0\0<WúcöL@ä =-6/@','2022-12-09 08:40:20','2022-12-14 09:57:05'),
(20,368,13,0,0,'\0\0\0\0\0\0\0J@¬ûóL@Ì0ßJ∞?/@','\0\0\0\0\0\0\0kö&ÍÏL@˛⁄«≠\"/@','2022-12-09 02:06:13','2022-12-14 09:57:05'),
(21,5,22,0,0,'\0\0\0\0\0\0\0a¬ó—L@¶ºx]Ï /@','\0\0\0\0\0\0\0„ ¬kL@å{Ha#4/@','2022-12-09 14:54:27','2022-12-14 09:57:05'),
(22,453,96,0,0,'\0\0\0\0\0\0\0—‹∫UL@F“4=/@','\0\0\0\0\0\0\0$g∫A·L@¥Ô15Ï1/@','2022-12-09 02:12:30','2022-12-14 09:57:05'),
(23,131,89,0,0,'\0\0\0\0\0\0\0…]Qé}L@aÛg˘>/@','\0\0\0\0\0\0\0Ó˚$©L@À∫¬q5/@','2022-12-08 23:12:10','2022-12-14 09:57:05'),
(24,404,93,0,0,'\0\0\0\0\0\0\0≥•kûåL@\nwá\Z  /@','\0\0\0\0\0\0\0›ñh˛ÜL@)4—∫?7/@','2022-12-09 13:00:10','2022-12-14 09:57:05'),
(25,82,87,0,0,'\0\0\0\0\0\0\0∏ó 6±L@:ëGá[:/@','\0\0\0\0\0\0\0M*¨–‚L@q¸›>r!/@','2022-12-09 05:41:46','2022-12-14 09:57:05'),
(26,540,77,0,0,'\0\0\0\0\0\0\0h®ãªL@¿ª˚À&/@','\0\0\0\0\0\0\0#+á&L@t¯»T>/@','2022-12-09 10:26:25','2022-12-14 09:57:05'),
(27,139,68,0,0,'\0\0\0\0\0\0\02DÔ¥L@ p€“æ?/@','\0\0\0\0\0\0\0ËjË˛tL@ú§hT6/@','2022-12-09 07:47:27','2022-12-14 09:57:05'),
(28,923,71,0,0,'\0\0\0\0\0\0\0¯U_áL@‘äãÀ&/@','\0\0\0\0\0\0\0\r∞6L@$PC¸89/@','2022-12-09 14:05:06','2022-12-14 09:57:05'),
(29,948,22,0,0,'\0\0\0\0\0\0\0l}ÊáL@ˆÑÜ</@','\0\0\0\0\0\0\0Y1”L@Y°„3$/@','2022-12-09 00:52:20','2022-12-14 09:57:05'),
(30,418,65,0,0,'\0\0\0\0\0\0\0aﬁü L@;+Í–Œ5/@','\0\0\0\0\0\0\0æ¶&L@®t=[G4/@','2022-12-09 06:11:12','2022-12-14 09:57:05'),
(31,472,37,0,0,'\0\0\0\0\0\0\03[\n|L@i™◊.•9/@','\0\0\0\0\0\0\0ÛzùoL@µé2Î∞2/@','2022-12-09 00:58:59','2022-12-14 09:57:05'),
(32,765,90,0,0,'\0\0\0\0\0\0\0É3Q´çL@‰≈„ﬁ</@','\0\0\0\0\0\0\0ä· 6ŒL@.ø¨1/@','2022-12-09 14:32:07','2022-12-14 09:57:05'),
(33,435,92,0,0,'\0\0\0\0\0\0\0kû˝L@Ñ¯!¥v\'/@','\0\0\0\0\0\0\0ã\"ê0<L@ö√Ï¶(/@','2022-12-09 11:14:04','2022-12-14 09:57:05'),
(34,542,20,0,0,'\0\0\0\0\0\0\0r=ü˘L@\0#@Ç8/@','\0\0\0\0\0\0\0pÖ2ΩØL@.Y–¿ø/@','2022-12-09 03:00:43','2022-12-14 09:57:05'),
(35,486,49,0,0,'\0\0\0\0\0\0\0R›IL@8Ø≈o\\</@',NULL,'2022-12-09 02:37:16',NULL),
(36,1,35,0,0,'\0\0\0\0\0\0\0ÕÍ±“ˇL@¸,\0ÍÕ/@',NULL,'2022-12-09 11:47:54',NULL),
(37,383,46,0,0,'\0\0\0\0\0\0\0´Ç~ÂƒL@ÈØ7˛%/@',NULL,'2022-12-08 23:25:17',NULL),
(38,877,66,0,0,'\0\0\0\0\0\0\0#ÍÂªL@W\"=$/@',NULL,'2022-12-09 02:32:19',NULL),
(39,135,71,0,0,'\0\0\0\0\0\0\0iÔ˛Ú]L@Hã”∑õ(/@',NULL,'2022-12-09 14:03:44',NULL),
(40,573,52,0,0,'\0\0\0\0\0\0\0Ñ˝Z¨fL@å]Íh:/@',NULL,'2022-12-09 09:51:46',NULL),
(41,52,42,0,0,'\0\0\0\0\0\0\0Vºr˘àL@ïãƒÍ?8/@',NULL,'2022-12-09 09:48:04',NULL),
(42,369,38,0,0,'\0\0\0\0\0\0\0wõ9_L@r7á˛20/@',NULL,'2022-12-09 02:31:38',NULL),
(43,72,73,0,0,'\0\0\0\0\0\0\0æ/6]L@À⁄€%/@',NULL,'2022-12-09 03:13:12',NULL),
(44,860,55,0,0,'\0\0\0\0\0\0\0ë3˙[L@H£·?!/@',NULL,'2022-12-09 12:44:14',NULL),
(45,603,70,0,0,'\0\0\0\0\0\0\0©◊ôñL@©”d7T&/@',NULL,'2022-12-09 07:55:24',NULL),
(46,339,31,0,0,'\0\0\0\0\0\0\0\Z‰ãå¢L@…%»SÖ\'/@',NULL,'2022-12-09 08:23:11',NULL),
(47,563,5,0,0,'\0\0\0\0\0\0\0xÅ]ßπL@¬rò°=*/@',NULL,'2022-12-09 03:58:43',NULL),
(48,183,38,0,0,'\0\0\0\0\0\0\05‘O·L@¬√°¯¨&/@',NULL,'2022-12-08 23:55:26',NULL),
(49,336,25,0,0,'\0\0\0\0\0\0\0~q7EL@ø<ﬂ„7/@',NULL,'2022-12-09 12:20:50',NULL),
(50,25,75,0,0,'\0\0\0\0\0\0\0t|XL@^wLÇ«5/@',NULL,'2022-12-09 04:22:26',NULL);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`snaladm`@`mariadb`*/ /*!50003 TRIGGER `vteams`.`trip_AFTER_UPDATE` AFTER UPDATE ON `trip` FOR EACH ROW
BEGIN
	IF NEW.stop_time IS NOT NULL THEN
		SET @amount = TIMESTAMPDIFF(MINUTE,NEW.start_time, NEW.stop_time) * 3 + 10;
			INSERT INTO invoice (trip_id, amount)
			VALUES (NEW.id, @amount);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `register_date` timestamp NULL DEFAULT current_timestamp(),
  `social_security` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `credit` float DEFAULT 0,
  `token` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'Jill','Cunningham',96380394,'J.Cunningham61@yahoo.com','2022-12-14 09:57:05','1999',1,131,'532-150-7621x0371'),
(2,'Angelica','Carr',13769649,'A-Carr58@gmail.com','2022-12-14 09:57:05','1963',1,903,'119.872.9474'),
(3,'Larry','Morrow',50847471,'L_Morrow83@hotmail.com','2022-12-14 09:57:05','1984',1,190,'001-424-793-1899x4311'),
(4,'Scott','Cook',63248572,'S-Cook93@gmail.com','2022-12-14 09:57:05','1976',1,758,'315.724.6806x6652'),
(5,'Robert','Marquez',60401132,'R-Marquez76@yahoo.com','2022-12-14 09:57:05','1953',1,813,'(707)804-1644x528'),
(6,'Amanda','Davis',96662311,'A_Davis67@yahoo.com','2022-12-14 09:57:05','1950',1,812,'001-313-696-5353'),
(7,'William','Lloyd',24055781,'W-Lloyd62@gmail.com','2022-12-14 09:57:05','1992',1,618,'785.071.3329x5114'),
(8,'Todd','Love',65042153,'T-Love80@yahoo.com','2022-12-14 09:57:05','1948',1,439,'0077434392'),
(9,'James','Pierce',25116297,'J.Pierce66@yahoo.com','2022-12-14 09:57:05','1966',1,459,'+1-477-305-0089x9757'),
(10,'Carolyn','Bernard',40076728,'C-Bernard62@hotmail.com','2022-12-14 09:57:05','1989',1,847,'8798795712'),
(11,'Catherine','Morgan',35141350,'C.Morgan68@yahoo.com','2022-12-14 09:57:05','1962',1,208,'237-318-4910x502'),
(12,'Erica','Johnson',42353095,'E.Johnson74@hotmail.com','2022-12-14 09:57:05','1991',1,135,'690-188-9957x223'),
(13,'Christine','Smith',39041674,'C.Smith82@hotmail.com','2022-12-14 09:57:05','1989',1,313,'1984286255'),
(14,'Christopher','Daniel',23121753,'C-Daniel61@yahoo.com','2022-12-14 09:57:05','2001',1,440,'(603)265-3287x8891'),
(15,'Kevin','Morton',19772134,'K-Morton76@yahoo.com','2022-12-14 09:57:05','2014',1,739,'(148)758-8306x65507'),
(16,'Daniel','Robinson',11642370,'D-Robinson77@hotmail.com','2022-12-14 09:57:05','1969',1,175,'(228)845-4946x48540'),
(17,'Tiffany','Gardner',75002758,'T.Gardner70@yahoo.com','2022-12-14 09:57:05','1969',1,407,'001-945-543-5707x588'),
(18,'Shannon','Castillo',88097396,'S_Castillo58@yahoo.com','2022-12-14 09:57:05','1952',1,864,'001-469-808-8383x6128'),
(19,'Jeremiah','Maldonado',22323522,'J_Maldonado85@hotmail.com','2022-12-14 09:57:05','1948',1,858,'001-374-091-3120'),
(20,'Harold','Hall',65840690,'H_Hall61@yahoo.com','2022-12-14 09:57:05','1965',1,245,'001-792-615-7034x811'),
(21,'Laura','Carter',89942930,'L_Carter80@hotmail.com','2022-12-14 09:57:05','1977',1,302,'7002730857'),
(22,'Beth','Hernandez',64184254,'B-Hernandez80@hotmail.com','2022-12-14 09:57:05','1978',1,584,'+1-431-017-0283'),
(23,'Matthew','Whitney',57656945,'M.Whitney96@gmail.com','2022-12-14 09:57:05','1972',1,925,'+1-892-669-4308x53114'),
(24,'Rachael','Johnson',91605935,'R.Johnson87@hotmail.com','2022-12-14 09:57:05','1973',1,992,'7149538788'),
(25,'Linda','Ramirez',83267905,'L.Ramirez56@yahoo.com','2022-12-14 09:57:05','1950',1,10,'3978566113'),
(26,'Marcus','Estrada',12703225,'M_Estrada79@hotmail.com','2022-12-14 09:57:05','1944',1,277,'+1-732-368-1818'),
(27,'Jessica','Andrews',44588969,'J-Andrews64@yahoo.com','2022-12-14 09:57:05','1984',1,818,'+1-534-853-2690x553'),
(28,'Gary','Ponce',94748707,'G_Ponce64@gmail.com','2022-12-14 09:57:05','1979',1,224,'6898600818'),
(29,'Andrew','Wright',75809071,'A.Wright75@hotmail.com','2022-12-14 09:57:05','1963',1,961,'962-602-8596x4280'),
(30,'Linda','Rogers',66991581,'L_Rogers63@gmail.com','2022-12-14 09:57:05','2002',1,973,'(394)774-7038x34136'),
(31,'Laura','Dixon',36110352,'L-Dixon93@yahoo.com','2022-12-14 09:57:05','1970',1,74,'731-767-1815x02176'),
(32,'Dennis','Nguyen',37261242,'D_Nguyen70@hotmail.com','2022-12-14 09:57:05','1981',1,58,'143.855.3656'),
(33,'Christopher','Arnold',98226886,'C_Arnold95@yahoo.com','2022-12-14 09:57:05','1976',1,404,'958.102.0291'),
(34,'Daniel','Patterson',92986580,'D-Patterson88@gmail.com','2022-12-14 09:57:05','1979',1,86,'+1-465-267-7022x24559'),
(35,'William','Brown',14175618,'W.Brown99@yahoo.com','2022-12-14 09:57:05','1988',1,274,'970.313.6828x17365'),
(36,'Michael','Ross',29044357,'M-Ross88@gmail.com','2022-12-14 09:57:05','1966',1,340,'661-350-6609x601'),
(37,'Vicki','Atkinson',14255717,'V_Atkinson75@gmail.com','2022-12-14 09:57:05','1995',1,780,'1922172899'),
(38,'Tara','Duarte',98635045,'T-Duarte72@yahoo.com','2022-12-14 09:57:05','1969',1,21,'001-433-352-7732x36515'),
(39,'Mary','Ray',77228240,'M_Ray69@hotmail.com','2022-12-14 09:57:05','1953',1,503,'818-673-1663x60035'),
(40,'Amy','Strickland',19131646,'A.Strickland62@yahoo.com','2022-12-14 09:57:05','2007',1,992,'(386)837-7529x5905'),
(41,'Larry','Love',98910435,'L_Love50@yahoo.com','2022-12-14 09:57:05','1989',1,643,'333.797.3137x0479'),
(42,'Ashley','Miller',55496092,'A_Miller99@yahoo.com','2022-12-14 09:57:05','1961',1,556,'(195)047-7215'),
(43,'Krista','Harris',24681593,'K-Harris68@yahoo.com','2022-12-14 09:57:05','1952',1,376,'704-073-8648x65737'),
(44,'Fernando','Pollard',39265984,'F-Pollard87@gmail.com','2022-12-14 09:57:05','1949',1,35,'890-830-3661'),
(45,'Norma','Burns',59051295,'N.Burns59@hotmail.com','2022-12-14 09:57:05','1952',1,128,'(862)096-2366x4673'),
(46,'Samantha','Hamilton',46168444,'S_Hamilton52@hotmail.com','2022-12-14 09:57:05','1981',1,664,'+1-534-744-4716x26376'),
(47,'Tiffany','Welch',15528755,'T.Welch83@yahoo.com','2022-12-14 09:57:05','1988',1,129,'149.377.7150'),
(48,'Thomas','Lewis',34433551,'T-Lewis89@hotmail.com','2022-12-14 09:57:05','1970',1,41,'065-215-7213x573'),
(49,'George','Cole',50660011,'G_Cole84@hotmail.com','2022-12-14 09:57:05','1996',1,164,'347-617-9534x365'),
(50,'Robert','Jacobs',61025972,'R-Jacobs87@gmail.com','2022-12-14 09:57:05','1951',1,197,'+1-567-466-9502x3698'),
(51,'Lisa','Dixon',37909999,'L.Dixon71@yahoo.com','2022-12-14 09:57:05','1949',1,441,'(091)806-0279x22597'),
(52,'Joshua','Scott',26746234,'J_Scott62@gmail.com','2022-12-14 09:57:05','1982',1,192,'506-678-1082x70126'),
(53,'Michelle','Robles',28257224,'M.Robles51@yahoo.com','2022-12-14 09:57:05','2001',1,603,'102.047.2804'),
(54,'David','Velazquez',95584160,'D.Velazquez60@gmail.com','2022-12-14 09:57:05','1953',1,901,'+1-321-656-4399x80310'),
(55,'Daniel','Myers',59476998,'D-Myers64@yahoo.com','2022-12-14 09:57:05','1961',1,250,'821-618-9986x69862'),
(56,'Allison','Lutz',13499136,'A.Lutz93@gmail.com','2022-12-14 09:57:05','1984',1,230,'001-279-475-4578'),
(57,'Daniel','Hamilton',17713980,'D_Hamilton62@gmail.com','2022-12-14 09:57:05','1962',1,632,'+1-027-258-8872x1059'),
(58,'Daniel','Clark',48769470,'D-Clark82@hotmail.com','2022-12-14 09:57:05','1938',1,101,'001-995-095-6176x21825'),
(59,'Rachel','Diaz',62879679,'R-Diaz84@yahoo.com','2022-12-14 09:57:05','1985',1,276,'628.583.4755x03630'),
(60,'Amy','Coleman',93243278,'A.Coleman65@gmail.com','2022-12-14 09:57:05','1971',1,205,'(878)269-7822'),
(61,'Larry','Christensen',91359101,'L-Christensen75@gmail.com','2022-12-14 09:57:05','2010',1,597,'+1-913-900-0952'),
(62,'Alicia','Cooper',17175354,'A-Cooper78@gmail.com','2022-12-14 09:57:05','2000',1,763,'0629267463'),
(63,'Julia','Hodge',37427224,'J_Hodge89@hotmail.com','2022-12-14 09:57:05','1968',1,460,'001-623-293-0947x29530'),
(64,'Charles','Buchanan',91707179,'C-Buchanan79@yahoo.com','2022-12-14 09:57:05','1946',1,893,'112.653.7503x401'),
(65,'Monica','Smith',61119175,'M_Smith87@hotmail.com','2022-12-14 09:57:05','1958',1,244,'(581)363-3074x055'),
(66,'Maria','White',43432189,'M-White78@yahoo.com','2022-12-14 09:57:05','1979',1,14,'400-684-4769x9267'),
(67,'Rodney','Martin',80321192,'R-Martin55@gmail.com','2022-12-14 09:57:05','1969',1,741,'001-005-807-1546x0933'),
(68,'Richard','Morrison',35003577,'R_Morrison60@gmail.com','2022-12-14 09:57:05','1989',1,485,'+1-743-624-5413x59525'),
(69,'Kathy','Montgomery',83039089,'K-Montgomery68@yahoo.com','2022-12-14 09:57:05','1977',1,220,'+1-947-967-9719x64375'),
(70,'Barbara','Montgomery',67211903,'B-Montgomery90@gmail.com','2022-12-14 09:57:05','1973',1,264,'+1-944-104-0122'),
(71,'Lori','Sullivan',19018637,'L.Sullivan57@hotmail.com','2022-12-14 09:57:05','1993',1,130,'(276)564-8328x2124'),
(72,'Erin','Duncan',40982870,'E_Duncan81@hotmail.com','2022-12-14 09:57:05','2003',1,188,'715-724-2025'),
(73,'Tiffany','Bishop',76790867,'T.Bishop80@gmail.com','2022-12-14 09:57:05','1964',1,374,'988.326.1831'),
(74,'Parker','Hardy',10106231,'P.Hardy92@gmail.com','2022-12-14 09:57:05','1993',1,272,'(476)510-4481'),
(75,'Lauren','Zavala',26352018,'L.Zavala71@gmail.com','2022-12-14 09:57:05','1995',1,670,'589-725-3814'),
(76,'Matthew','Cunningham',78496873,'M.Cunningham61@gmail.com','2022-12-14 09:57:05','1994',1,257,'917.187.2249x654'),
(77,'Linda','Williams',97850939,'L.Williams78@hotmail.com','2022-12-14 09:57:05','1986',1,226,'(902)137-4014'),
(78,'Dana','Chavez',85851696,'D-Chavez52@hotmail.com','2022-12-14 09:57:05','1980',1,753,'+1-342-317-1288x3753'),
(79,'George','Watson',18564713,'G_Watson96@hotmail.com','2022-12-14 09:57:05','1956',1,592,'493-080-8752x13987'),
(80,'Mark','Powell',98609600,'M-Powell86@yahoo.com','2022-12-14 09:57:05','1993',1,432,'(639)052-9298x5795'),
(81,'Melissa','Rodriguez',78073085,'M-Rodriguez92@gmail.com','2022-12-14 09:57:05','1960',1,865,'001-614-845-3419x76150'),
(82,'Michael','Hamilton',51956089,'M-Hamilton60@yahoo.com','2022-12-14 09:57:05','1997',1,533,'280.220.3882'),
(83,'Anne','Mcknight',82204905,'A-Mcknight73@gmail.com','2022-12-14 09:57:05','2005',1,815,'+1-831-647-4314x9107'),
(84,'Eric','Nelson',56311334,'E_Nelson98@hotmail.com','2022-12-14 09:57:05','1960',1,377,'995.290.7664x21094'),
(85,'Kenneth','Hanson',13726899,'K.Hanson86@gmail.com','2022-12-14 09:57:05','1987',1,547,'492-467-1621x1659'),
(86,'Shannon','Chavez',18163990,'S_Chavez67@gmail.com','2022-12-14 09:57:05','1946',1,868,'+1-349-030-0851x98498'),
(87,'Jeremy','Arnold',73571542,'J_Arnold80@yahoo.com','2022-12-14 09:57:05','1991',1,522,'4216167238'),
(88,'Katie','Anderson',30709314,'K-Anderson71@hotmail.com','2022-12-14 09:57:05','1953',1,149,'(191)059-2454x851'),
(89,'Joseph','Gibson',86441311,'J.Gibson88@hotmail.com','2022-12-14 09:57:05','1958',1,29,'+1-354-199-6365'),
(90,'Dana','Leon',65526365,'D.Leon57@gmail.com','2022-12-14 09:57:05','2013',1,33,'811-393-6143'),
(91,'Christy','Montoya',99746806,'C.Montoya70@yahoo.com','2022-12-14 09:57:05','1965',1,76,'(747)904-0592x70900'),
(92,'Judy','Wallace',25106109,'J-Wallace75@yahoo.com','2022-12-14 09:57:05','1994',1,225,'412.659.5539'),
(93,'Cynthia','Schultz',35319229,'C.Schultz76@gmail.com','2022-12-14 09:57:05','1977',1,911,'250.873.1083'),
(94,'Robert','Collins',21564829,'R_Collins87@gmail.com','2022-12-14 09:57:05','1959',1,66,'051.587.4551x1439'),
(95,'Cynthia','Moore',51203423,'C-Moore86@yahoo.com','2022-12-14 09:57:05','1983',1,267,'001-114-665-1824x6326'),
(96,'Sabrina','Shelton',55358758,'S_Shelton72@hotmail.com','2022-12-14 09:57:05','1959',1,621,'+1-210-206-2758x7050'),
(97,'Stephen','Blake',38170260,'S-Blake59@gmail.com','2022-12-14 09:57:05','1995',1,560,'102.761.0622x4474'),
(98,'Austin','Friedman',27163913,'A_Friedman51@gmail.com','2022-12-14 09:57:05','1960',1,605,'259.254.6614x547'),
(99,'Stephanie','Griffith',56383732,'S_Griffith55@hotmail.com','2022-12-14 09:57:05','1960',1,700,'(386)145-4586x64048'),
(100,'Andres','Coffey',70317961,'A_Coffey78@yahoo.com','2022-12-14 09:57:05','1970',1,481,'+1-670-757-6048x918'),
(101,'Samuel','Cole',72274245,'S-Cole97@gmail.com','2022-12-14 09:57:05','1962',1,6,'353-269-4615'),
(102,'Bonnie','Lee',43251245,'B_Lee98@hotmail.com','2022-12-14 09:57:05','1987',1,818,'699.605.9424x0735'),
(103,'Vanessa','Hood',99672386,'V_Hood92@gmail.com','2022-12-14 09:57:05','1982',1,668,'001-350-021-5494'),
(104,'Jessica','Hines',28144927,'J.Hines84@hotmail.com','2022-12-14 09:57:05','1954',1,754,'607-864-1104x25705'),
(105,'Christopher','Williams',28850293,'C-Williams53@hotmail.com','2022-12-14 09:57:05','1961',1,596,'175-071-2768'),
(106,'Leroy','Galloway',78974704,'L.Galloway76@yahoo.com','2022-12-14 09:57:05','1992',1,88,'655.651.5001x9461'),
(107,'Matthew','Newman',26985613,'M.Newman64@gmail.com','2022-12-14 09:57:05','1973',1,420,'(319)852-0974'),
(108,'Ryan','Wilson',86137243,'R.Wilson82@hotmail.com','2022-12-14 09:57:05','1986',1,817,'(626)616-7416x49849'),
(109,'Barry','Brown',53903417,'B-Brown89@gmail.com','2022-12-14 09:57:05','1967',1,339,'(323)417-6118x41153'),
(110,'Melissa','Bailey',80910471,'M.Bailey76@yahoo.com','2022-12-14 09:57:05','1980',1,626,'+1-272-031-7633x683'),
(111,'Lisa','Rubio',91720602,'L.Rubio54@yahoo.com','2022-12-14 09:57:05','1978',1,525,'886.659.3987'),
(112,'Elizabeth','Ware',74674525,'E-Ware86@hotmail.com','2022-12-14 09:57:05','1935',1,730,'829-748-1836x47722'),
(113,'Zachary','Watson',43620313,'Z-Watson71@yahoo.com','2022-12-14 09:57:05','1987',1,842,'5364874945'),
(114,'Wendy','Park',54033414,'W-Park95@yahoo.com','2022-12-14 09:57:05','1979',1,999,'001-234-537-1685x484'),
(115,'Christopher','Brewer',24019133,'C-Brewer89@gmail.com','2022-12-14 09:57:05','1975',1,470,'4214798494'),
(116,'Christopher','Coleman',32844957,'C_Coleman55@yahoo.com','2022-12-14 09:57:05','1973',1,860,'001-937-126-7051'),
(117,'David','Johnson',59182212,'D-Johnson93@hotmail.com','2022-12-14 09:57:05','1948',1,324,'001-095-454-6684x41706'),
(118,'Mary','Fisher',97675194,'M-Fisher50@yahoo.com','2022-12-14 09:57:05','1963',1,10,'4965746396'),
(119,'Michael','Williams',52077149,'M.Williams51@hotmail.com','2022-12-14 09:57:05','1964',1,283,'(914)697-7530'),
(120,'Jeffrey','Berry',43915943,'J.Berry68@gmail.com','2022-12-14 09:57:05','1989',1,657,'+1-823-699-4713'),
(121,'Benjamin','Jackson',43309675,'B_Jackson88@hotmail.com','2022-12-14 09:57:05','1940',1,459,'(203)704-2902'),
(122,'Susan','Campos',98790799,'S-Campos94@gmail.com','2022-12-14 09:57:05','1985',1,56,'(240)715-9977'),
(123,'Eric','Reyes',23348806,'E.Reyes88@yahoo.com','2022-12-14 09:57:05','1949',1,896,'001-199-929-6114x39339'),
(124,'Beth','Short',23140812,'B.Short90@yahoo.com','2022-12-14 09:57:05','1976',1,360,'029-105-0909x270'),
(125,'Carl','Roman',57498725,'C.Roman71@yahoo.com','2022-12-14 09:57:05','1966',1,425,'504.875.5221'),
(126,'Meredith','White',86834382,'M.White82@hotmail.com','2022-12-14 09:57:05','1965',1,814,'(012)017-8717x978'),
(127,'Jeanne','Silva',71944337,'J_Silva68@yahoo.com','2022-12-14 09:57:05','1980',1,162,'(428)288-6146x19938'),
(128,'Timothy','Russo',93271389,'T-Russo89@hotmail.com','2022-12-14 09:57:05','1959',1,158,'477-500-7090'),
(129,'Travis','Morrow',95490753,'T_Morrow92@gmail.com','2022-12-14 09:57:05','2002',1,839,'737-185-2130x2536'),
(130,'Brandy','Harris',49313029,'B-Harris60@gmail.com','2022-12-14 09:57:05','1962',1,330,'595-817-3738x585'),
(131,'Travis','Hawkins',63219776,'T_Hawkins77@hotmail.com','2022-12-14 09:57:05','1956',1,319,'001-220-402-3624'),
(132,'Daniel','Griffith',36370831,'D.Griffith82@yahoo.com','2022-12-14 09:57:05','1976',1,404,'912-255-1351x1489'),
(133,'Andrea','Adams',69113572,'A_Adams90@hotmail.com','2022-12-14 09:57:05','1967',1,250,'001-546-483-6268x4179'),
(134,'David','Hawkins',51619402,'D-Hawkins53@yahoo.com','2022-12-14 09:57:05','1998',1,795,'336.321.9908x08678'),
(135,'Alan','Sanchez',85898141,'A-Sanchez70@hotmail.com','2022-12-14 09:57:05','1986',1,115,'280-815-1317'),
(136,'Ricardo','Pearson',74001936,'R-Pearson56@gmail.com','2022-12-14 09:57:05','2001',1,534,'(957)063-3049x09557'),
(137,'Tina','Lopez',22355359,'T.Lopez56@hotmail.com','2022-12-14 09:57:05','1978',1,620,'278.522.0917x7127'),
(138,'Jonathan','Chavez',29274289,'J-Chavez53@gmail.com','2022-12-14 09:57:05','1978',1,629,'663.156.6834x27081'),
(139,'Lucas','Davis',66441027,'L-Davis70@yahoo.com','2022-12-14 09:57:05','1951',1,482,'439.428.0191x84732'),
(140,'Veronica','Black',80168035,'V-Black55@yahoo.com','2022-12-14 09:57:05','1950',1,499,'(024)313-0674x8649'),
(141,'Roy','Boyle',40160076,'R.Boyle91@hotmail.com','2022-12-14 09:57:05','1971',1,112,'079-233-0390'),
(142,'Andrew','Ruiz',44693450,'A_Ruiz61@hotmail.com','2022-12-14 09:57:05','1986',1,314,'(872)052-5826x117'),
(143,'Jason','Garcia',44344812,'J.Garcia80@gmail.com','2022-12-14 09:57:05','1982',1,19,'655-526-5902x555'),
(144,'Joseph','Christensen',79991536,'J-Christensen59@hotmail.com','2022-12-14 09:57:05','1976',1,528,'(544)980-6088'),
(145,'Dennis','Johnson',99684004,'D_Johnson87@gmail.com','2022-12-14 09:57:05','1994',1,711,'+1-171-545-6469x00037'),
(146,'Roy','Burke',83216550,'R-Burke79@yahoo.com','2022-12-14 09:57:05','1999',1,400,'215-060-1217x07382'),
(147,'James','Conway',82194938,'J.Conway65@yahoo.com','2022-12-14 09:57:05','1969',1,73,'121.632.9709x71302'),
(148,'Cody','Fowler',28890688,'C_Fowler80@gmail.com','2022-12-14 09:57:05','1992',1,309,'770-231-1064'),
(149,'Shawn','Wilson',83822909,'S.Wilson67@yahoo.com','2022-12-14 09:57:05','1964',1,676,'033-753-0706'),
(150,'Tina','Rodriguez',69075375,'T.Rodriguez68@yahoo.com','2022-12-14 09:57:05','1960',1,720,'001-686-222-7353x927'),
(151,'Bonnie','Newman',38063531,'B.Newman77@hotmail.com','2022-12-14 09:57:05','1989',1,691,'273-338-5757'),
(152,'Brittany','Miller',64274963,'B-Miller92@gmail.com','2022-12-14 09:57:05','1980',1,769,'3612050773'),
(153,'Jessica','Kline',94684106,'J-Kline73@hotmail.com','2022-12-14 09:57:05','1990',1,624,'001-323-431-1677'),
(154,'Ricky','Cuevas',66470503,'R.Cuevas67@gmail.com','2022-12-14 09:57:05','1970',1,343,'745-279-1501x9432'),
(155,'John','Lin',35810506,'J-Lin94@yahoo.com','2022-12-14 09:57:05','1973',1,548,'187.665.7324'),
(156,'Matthew','Barnett',66816624,'M.Barnett53@gmail.com','2022-12-14 09:57:05','1960',1,644,'001-207-791-1614'),
(157,'Clinton','Jackson',61861411,'C-Jackson89@yahoo.com','2022-12-14 09:57:05','2011',1,771,'(687)119-3197x484'),
(158,'Mariah','Wilkerson',34842847,'M.Wilkerson97@yahoo.com','2022-12-14 09:57:05','1932',1,953,'050.932.5839'),
(159,'Scott','Mcfarland',26233119,'S-Mcfarland92@hotmail.com','2022-12-14 09:57:05','1989',1,719,'776.650.4195'),
(160,'Gregory','Davila',62197662,'G.Davila53@yahoo.com','2022-12-14 09:57:05','1966',1,63,'5873613828'),
(161,'Jillian','Wilson',36342304,'J_Wilson81@yahoo.com','2022-12-14 09:57:05','1963',1,225,'001-241-413-5151x76815'),
(162,'Steven','Deleon',22308877,'S-Deleon70@gmail.com','2022-12-14 09:57:05','1944',1,981,'(887)220-2646x442'),
(163,'Jennifer','Vance',15480636,'J.Vance65@yahoo.com','2022-12-14 09:57:05','1993',1,409,'870.058.7976'),
(164,'Keith','Ferguson',29224399,'K_Ferguson91@hotmail.com','2022-12-14 09:57:05','1978',1,244,'243-348-6570'),
(165,'Christine','Nunez',13248458,'C.Nunez97@yahoo.com','2022-12-14 09:57:05','1956',1,594,'453.488.0364x8052'),
(166,'William','Carey',51479317,'W.Carey94@gmail.com','2022-12-14 09:57:05','1951',1,560,'992.051.8764'),
(167,'Candace','Mcbride',21771272,'C_Mcbride60@gmail.com','2022-12-14 09:57:05','1993',1,872,'(453)465-7856x4584'),
(168,'Kenneth','West',32537284,'K.West53@gmail.com','2022-12-14 09:57:05','1983',1,464,'804.156.7821x97882'),
(169,'Alexander','Mendoza',44417172,'A-Mendoza91@yahoo.com','2022-12-14 09:57:05','1982',1,550,'855.449.2932x11041'),
(170,'Angela','Price',41430757,'A_Price59@hotmail.com','2022-12-14 09:57:05','1963',1,639,'864.943.8840x026'),
(171,'Leslie','Yu',11563227,'L-Yu98@yahoo.com','2022-12-14 09:57:05','1947',1,854,'750-361-6411'),
(172,'Jill','Allen',48940806,'J_Allen96@hotmail.com','2022-12-14 09:57:05','1948',1,135,'(230)123-5865x75306'),
(173,'Alex','Little',86699436,'A_Little71@gmail.com','2022-12-14 09:57:05','2003',1,434,'384.158.4778x781'),
(174,'Andrew','Wall',82594722,'A.Wall50@gmail.com','2022-12-14 09:57:05','1982',1,490,'8179153645'),
(175,'Nathan','Hernandez',90657699,'N_Hernandez87@hotmail.com','2022-12-14 09:57:05','1958',1,178,'866.688.8671x5410'),
(176,'Lisa','Heath',87632951,'L.Heath56@hotmail.com','2022-12-14 09:57:05','1987',1,44,'1095092479'),
(177,'Amy','Jones',70680450,'A_Jones67@gmail.com','2022-12-14 09:57:05','1983',1,342,'692.487.3761x221'),
(178,'Zachary','Bennett',93246875,'Z-Bennett78@gmail.com','2022-12-14 09:57:05','1972',1,240,'+1-307-444-4890x02264'),
(179,'Allison','Duffy',59098908,'A.Duffy81@gmail.com','2022-12-14 09:57:05','1986',1,445,'844.935.2078x4127'),
(180,'Alicia','Carrillo',11936604,'A-Carrillo80@hotmail.com','2022-12-14 09:57:05','2006',1,317,'566.904.3112'),
(181,'Phillip','Walters',20711748,'P_Walters99@yahoo.com','2022-12-14 09:57:05','1971',1,252,'(427)698-2234x62980'),
(182,'Isaac','Harris',59496871,'I.Harris80@hotmail.com','2022-12-14 09:57:05','2005',1,703,'840.492.6381x60409'),
(183,'Christopher','Bates',87432587,'C.Bates89@yahoo.com','2022-12-14 09:57:05','1952',1,275,'001-938-841-2616x3540'),
(184,'Morgan','Mitchell',78576103,'M_Mitchell87@hotmail.com','2022-12-14 09:57:05','1982',1,493,'001-742-746-5720'),
(185,'Anthony','Wilson',47590315,'A_Wilson98@hotmail.com','2022-12-14 09:57:05','1965',1,201,'946-909-6543x2118'),
(186,'Carly','Turner',59840179,'C_Turner89@gmail.com','2022-12-14 09:57:05','1939',1,86,'(148)519-7186'),
(187,'Patricia','Henry',31789311,'P-Henry56@gmail.com','2022-12-14 09:57:05','1940',1,246,'536.669.8349'),
(188,'Gregory','Logan',94568999,'G.Logan57@yahoo.com','2022-12-14 09:57:05','1963',1,45,'990-949-4482x511'),
(189,'Chelsea','Flores',13828237,'C-Flores92@hotmail.com','2022-12-14 09:57:05','1983',1,335,'001-864-027-1912x093'),
(190,'Patrick','Burns',85180818,'P.Burns61@yahoo.com','2022-12-14 09:57:05','2008',1,691,'(138)329-2733x29822'),
(191,'Jennifer','Green',28695537,'J-Green89@yahoo.com','2022-12-14 09:57:05','1979',1,960,'+1-015-781-8368x986'),
(192,'Luke','Chase',46954767,'L.Chase73@gmail.com','2022-12-14 09:57:05','1959',1,540,'0878390346'),
(193,'Lindsay','Mitchell',14578991,'L-Mitchell69@hotmail.com','2022-12-14 09:57:05','2010',1,958,'(243)687-1280'),
(194,'Brittany','Carey',50489336,'B.Carey74@yahoo.com','2022-12-14 09:57:05','1957',1,319,'+1-922-967-9900'),
(195,'Joseph','Novak',95898261,'J.Novak84@hotmail.com','2022-12-14 09:57:05','1963',1,677,'669-379-7878x5214'),
(196,'Audrey','Terry',59099468,'A.Terry93@hotmail.com','2022-12-14 09:57:05','1970',1,506,'+1-595-465-1033x1640'),
(197,'Jordan','Stafford',23372472,'J-Stafford84@hotmail.com','2022-12-14 09:57:05','2007',1,836,'+1-984-869-8221x421'),
(198,'Ryan','Browning',66037215,'R-Browning84@gmail.com','2022-12-14 09:57:05','1983',1,341,'(742)619-6078x7539'),
(199,'Donald','Ellison',65006542,'D_Ellison71@yahoo.com','2022-12-14 09:57:05','1976',1,118,'+1-910-832-9615x58591'),
(200,'Kyle','Yoder',79759294,'K.Yoder89@gmail.com','2022-12-14 09:57:05','2002',1,514,'+1-857-985-8331x82968'),
(201,'Timothy','Peters',96038751,'T.Peters83@hotmail.com','2022-12-14 09:57:05','1967',1,992,'+1-889-420-8676x012'),
(202,'Robert','King',58584053,'R_King98@yahoo.com','2022-12-14 09:57:05','1999',1,299,'+1-472-871-0731x14132'),
(203,'Wesley','Warner',26623171,'W.Warner81@hotmail.com','2022-12-14 09:57:05','2004',1,573,'9870641692'),
(204,'Kelly','Crawford',59373511,'K_Crawford57@hotmail.com','2022-12-14 09:57:05','1949',1,527,'141.666.8167'),
(205,'Elizabeth','Davis',74783325,'E.Davis79@hotmail.com','2022-12-14 09:57:05','1967',1,495,'(749)014-5106x648'),
(206,'Martin','Jones',12557296,'M_Jones56@hotmail.com','2022-12-14 09:57:05','1958',1,213,'(193)798-6974x0859'),
(207,'Angela','Shea',91530361,'A.Shea60@hotmail.com','2022-12-14 09:57:05','1980',1,782,'(509)365-4116x434'),
(208,'Katrina','Brown',82600736,'K-Brown70@gmail.com','2022-12-14 09:57:05','1946',1,932,'176.795.6210x0987'),
(209,'Jessica','Morgan',82852604,'J-Morgan53@gmail.com','2022-12-14 09:57:05','1973',1,937,'250.359.7046x9735'),
(210,'Sandra','Orr',28010455,'S-Orr84@gmail.com','2022-12-14 09:57:05','1970',1,899,'325.720.2068x81268'),
(211,'Travis','Garza',43251600,'T-Garza85@gmail.com','2022-12-14 09:57:05','1976',1,439,'8789659591'),
(212,'Barry','Mccormick',30630932,'B.Mccormick76@yahoo.com','2022-12-14 09:57:05','1985',1,502,'001-677-621-3936x0868'),
(213,'Lisa','Schneider',41967957,'L_Schneider83@gmail.com','2022-12-14 09:57:05','1948',1,196,'(108)463-8361x73177'),
(214,'Joshua','Lozano',63066237,'J-Lozano50@gmail.com','2022-12-14 09:57:05','1987',1,607,'(872)110-7769'),
(215,'Christopher','Young',67477419,'C-Young86@gmail.com','2022-12-14 09:57:05','1983',1,379,'+1-861-317-5903x577'),
(216,'Caleb','Santos',45185245,'C-Santos89@gmail.com','2022-12-14 09:57:05','1960',1,964,'537-149-5972x3527'),
(217,'Ryan','Giles',34590694,'R_Giles52@hotmail.com','2022-12-14 09:57:05','1954',1,145,'(990)848-3887'),
(218,'Jeffrey','Little',14700239,'J.Little95@hotmail.com','2022-12-14 09:57:05','1962',1,544,'(841)941-9077'),
(219,'Paul','Sanford',15750303,'P.Sanford93@hotmail.com','2022-12-14 09:57:05','1989',1,90,'001-357-708-8556'),
(220,'Melissa','Carter',73408416,'M-Carter79@hotmail.com','2022-12-14 09:57:05','1995',1,898,'469.252.1391x147'),
(221,'Julie','Chapman',78311022,'J.Chapman52@hotmail.com','2022-12-14 09:57:05','2001',1,32,'211-332-8109x54192'),
(222,'Lisa','Sanders',34095148,'L.Sanders95@yahoo.com','2022-12-14 09:57:05','1961',1,718,'699.774.7868'),
(223,'Patricia','Dixon',43685706,'P-Dixon50@hotmail.com','2022-12-14 09:57:05','1971',1,786,'(267)492-1443'),
(224,'Nicole','Hanna',34765199,'N_Hanna66@yahoo.com','2022-12-14 09:57:05','1963',1,576,'001-172-054-2731x79625'),
(225,'Alyssa','Mills',80940788,'A.Mills57@hotmail.com','2022-12-14 09:57:05','1969',1,142,'(194)636-1903x21222'),
(226,'Keith','Walters',17724455,'K.Walters86@yahoo.com','2022-12-14 09:57:05','1973',1,51,'757-061-7054x08723'),
(227,'Rebecca','Graham',74737685,'R.Graham68@hotmail.com','2022-12-14 09:57:05','1997',1,41,'056-956-8392'),
(228,'Katherine','Roy',69835927,'K.Roy61@gmail.com','2022-12-14 09:57:05','1979',1,569,'+1-241-932-7610x665'),
(229,'Mary','Fuentes',66823501,'M_Fuentes80@yahoo.com','2022-12-14 09:57:05','1954',1,850,'1572253086'),
(230,'Christopher','Lynch',70906427,'C-Lynch97@gmail.com','2022-12-14 09:57:05','1983',1,991,'(041)748-3235x8770'),
(231,'Tanya','Kim',60340654,'T-Kim85@gmail.com','2022-12-14 09:57:05','1964',1,781,'001-996-864-8486x40333'),
(232,'Chris','Jones',83953491,'C-Jones64@hotmail.com','2022-12-14 09:57:05','1957',1,729,'815.527.5362x564'),
(233,'Jerry','Martinez',38006035,'J-Martinez61@yahoo.com','2022-12-14 09:57:05','2002',1,5,'158-207-2632x072'),
(234,'Kimberly','Bass',67536582,'K-Bass68@gmail.com','2022-12-14 09:57:05','1969',1,462,'+1-152-392-3492x8986'),
(235,'Valerie','Blackburn',31700617,'V-Blackburn76@yahoo.com','2022-12-14 09:57:05','1985',1,301,'(993)227-2504'),
(236,'Sara','Day',87125632,'S.Day95@yahoo.com','2022-12-14 09:57:05','1985',1,429,'(434)510-7543x9219'),
(237,'Michael','Green',82197235,'M_Green76@hotmail.com','2022-12-14 09:57:05','2008',1,267,'884.582.0825x5443'),
(238,'Kelsey','Garcia',94549649,'K-Garcia52@hotmail.com','2022-12-14 09:57:05','1984',1,305,'952-762-5507'),
(239,'Susan','Steele',88746046,'S-Steele55@hotmail.com','2022-12-14 09:57:05','1948',1,809,'(253)863-4740x278'),
(240,'Kyle','Esparza',18228555,'K_Esparza86@hotmail.com','2022-12-14 09:57:05','1953',1,787,'(597)705-9717'),
(241,'Robin','Collins',54509833,'R_Collins89@hotmail.com','2022-12-14 09:57:05','1982',1,967,'001-946-743-3083x786'),
(242,'Michelle','Beck',38808566,'M.Beck94@gmail.com','2022-12-14 09:57:05','1976',1,626,'094-429-2066'),
(243,'Elizabeth','Hill',70676853,'E_Hill69@yahoo.com','2022-12-14 09:57:05','2013',1,944,'001-704-488-7140x400'),
(244,'Kevin','Freeman',37795839,'K.Freeman81@gmail.com','2022-12-14 09:57:05','1978',1,131,'+1-562-971-4891x99845'),
(245,'Christopher','Davis',35438964,'C.Davis87@gmail.com','2022-12-14 09:57:05','1958',1,736,'651.545.8615'),
(246,'Jodi','Chavez',77655853,'J.Chavez96@hotmail.com','2022-12-14 09:57:05','1962',1,148,'265.142.1214x091'),
(247,'Katherine','Hayes',50859432,'K-Hayes75@yahoo.com','2022-12-14 09:57:05','1950',1,687,'0683039254'),
(248,'Cassandra','Harris',80952824,'C.Harris67@gmail.com','2022-12-14 09:57:05','1968',1,347,'001-717-430-0520x3022'),
(249,'Matthew','Mcmahon',11854852,'M.Mcmahon84@gmail.com','2022-12-14 09:57:05','1961',1,928,'888.668.7657'),
(250,'Michelle','Hanson',65839699,'M-Hanson97@yahoo.com','2022-12-14 09:57:05','1970',1,711,'259-878-0990x749'),
(251,'Deborah','Arias',27938076,'D.Arias71@yahoo.com','2022-12-14 09:57:05','1998',1,753,'001-459-937-4759x3966'),
(252,'Joyce','Richardson',19289083,'J-Richardson67@yahoo.com','2022-12-14 09:57:05','1945',1,755,'(930)754-4142'),
(253,'Tammy','Austin',52337728,'T-Austin75@hotmail.com','2022-12-14 09:57:05','2001',1,483,'696.710.8884x5098'),
(254,'Tina','Hanna',92289916,'T-Hanna65@gmail.com','2022-12-14 09:57:05','1960',1,149,'+1-035-841-1978x504'),
(255,'Alvin','Curtis',75394429,'A.Curtis91@yahoo.com','2022-12-14 09:57:05','1995',1,67,'170.454.1707x513'),
(256,'Damon','Tanner',17381235,'D.Tanner90@yahoo.com','2022-12-14 09:57:05','1992',1,451,'(559)754-9721x890'),
(257,'Lindsay','Graham',28115350,'L_Graham61@gmail.com','2022-12-14 09:57:05','1950',1,645,'081.669.6554x093'),
(258,'Angela','Torres',70405889,'A.Torres89@hotmail.com','2022-12-14 09:57:05','1983',1,514,'121.124.0983x161'),
(259,'Carol','Ingram',17569584,'C.Ingram89@hotmail.com','2022-12-14 09:57:05','1960',1,219,'001-565-355-3020x5714'),
(260,'Michael','Hicks',59298888,'M.Hicks55@gmail.com','2022-12-14 09:57:05','1988',1,968,'+1-880-769-3824x3326'),
(261,'Ashley','Greene',70023892,'A.Greene50@gmail.com','2022-12-14 09:57:05','1989',1,775,'475-872-3736x33871'),
(262,'Cheryl','Roberts',13335297,'C.Roberts93@yahoo.com','2022-12-14 09:57:05','1978',1,615,'7398036969'),
(263,'Alexis','West',98968861,'A_West73@hotmail.com','2022-12-14 09:57:05','1961',1,490,'119.041.8428'),
(264,'Charles','Manning',60987621,'C_Manning63@hotmail.com','2022-12-14 09:57:05','1970',1,338,'799-060-5712x868'),
(265,'Nicole','Hill',56227161,'N_Hill55@hotmail.com','2022-12-14 09:57:05','1950',1,406,'+1-151-165-0329x9261'),
(266,'Mark','Miller',80638988,'M.Miller79@yahoo.com','2022-12-14 09:57:05','1970',1,707,'(737)964-0887'),
(267,'Jennifer','Wilson',76932506,'J-Wilson89@gmail.com','2022-12-14 09:57:05','1982',1,720,'4129826234'),
(268,'Christina','Wallace',76451446,'C-Wallace61@gmail.com','2022-12-14 09:57:05','2006',1,81,'001-425-797-3716'),
(269,'Mackenzie','Webster',57197774,'M-Webster60@hotmail.com','2022-12-14 09:57:05','1961',1,276,'(484)122-6182x953'),
(270,'Christopher','Key',71795143,'C.Key91@hotmail.com','2022-12-14 09:57:05','1965',1,665,'(292)701-8811'),
(271,'Carol','Garcia',67616277,'C_Garcia82@gmail.com','2022-12-14 09:57:05','1978',1,282,'720.039.9325x898'),
(272,'Valerie','Carpenter',44159184,'V_Carpenter52@hotmail.com','2022-12-14 09:57:05','1971',1,488,'+1-959-163-3535x359'),
(273,'Julie','Bernard',18097398,'J_Bernard97@hotmail.com','2022-12-14 09:57:05','1994',1,446,'(955)689-8221x39408'),
(274,'Victoria','Rodriguez',17782471,'V.Rodriguez54@gmail.com','2022-12-14 09:57:05','1954',1,127,'404-083-9602'),
(275,'Timothy','Velazquez',61899411,'T.Velazquez82@yahoo.com','2022-12-14 09:57:05','1979',1,373,'455-130-0327'),
(276,'James','Taylor',23786072,'J-Taylor86@yahoo.com','2022-12-14 09:57:05','2001',1,148,'975.736.2999x158'),
(277,'Luis','Molina',39682031,'L.Molina63@hotmail.com','2022-12-14 09:57:05','1992',1,847,'(777)407-0797x9790'),
(278,'Melissa','Barrett',12597829,'M.Barrett70@hotmail.com','2022-12-14 09:57:05','1975',1,423,'183.894.2817x04089'),
(279,'Alexander','Brown',43789969,'A_Brown56@hotmail.com','2022-12-14 09:57:05','1967',1,121,'447.105.7674'),
(280,'Kent','Patterson',16665831,'K_Patterson97@gmail.com','2022-12-14 09:57:05','1946',1,461,'829.090.5083x0966'),
(281,'Paul','Gibson',20283415,'P-Gibson55@gmail.com','2022-12-14 09:57:05','1959',1,84,'961.520.0249x800'),
(282,'Jeffrey','Carter',51329185,'J-Carter57@hotmail.com','2022-12-14 09:57:05','1975',1,360,'+1-080-893-0842x84697'),
(283,'Michael','Cooper',61547027,'M_Cooper97@yahoo.com','2022-12-14 09:57:05','1989',1,275,'001-882-424-2075x1849'),
(284,'Willie','Skinner',23811443,'W.Skinner72@gmail.com','2022-12-14 09:57:05','1964',1,922,'495.067.8086x39394'),
(285,'George','Smith',93618512,'G_Smith61@hotmail.com','2022-12-14 09:57:05','1997',1,36,'(050)086-2925x7757'),
(286,'Christopher','Rios',63242411,'C_Rios50@hotmail.com','2022-12-14 09:57:05','1985',1,262,'828-466-3113'),
(287,'Jeffery','Blankenship',48092268,'J-Blankenship94@gmail.com','2022-12-14 09:57:05','2001',1,79,'(952)113-3678x347'),
(288,'Reginald','Bolton',61790306,'R.Bolton63@gmail.com','2022-12-14 09:57:05','1994',1,271,'664.600.7346x94333'),
(289,'Kerry','Butler',82904633,'K_Butler69@gmail.com','2022-12-14 09:57:05','1980',1,588,'989.902.3494x3561'),
(290,'Ashley','Cummings',66567104,'A-Cummings74@hotmail.com','2022-12-14 09:57:05','1970',1,513,'001-146-695-3938x600'),
(291,'Anthony','Jones',24275226,'A-Jones61@hotmail.com','2022-12-14 09:57:05','1968',1,137,'(589)068-5232x40529'),
(292,'Derrick','Park',27337037,'D_Park97@gmail.com','2022-12-14 09:57:05','1976',1,753,'035-214-8230x8488'),
(293,'Betty','Ortiz',62135456,'B-Ortiz57@yahoo.com','2022-12-14 09:57:05','1954',1,898,'417-514-5414'),
(294,'Amanda','Weaver',55627976,'A_Weaver82@hotmail.com','2022-12-14 09:57:05','1980',1,628,'+1-593-422-7609x700'),
(295,'Scott','Byrd',68839333,'S_Byrd50@yahoo.com','2022-12-14 09:57:05','1964',1,647,'(443)896-3879x10419'),
(296,'Pamela','Bradford',36260962,'P-Bradford84@hotmail.com','2022-12-14 09:57:05','1956',1,845,'748.866.1490'),
(297,'Aaron','Powers',72482485,'A-Powers79@yahoo.com','2022-12-14 09:57:05','1945',1,239,'933.853.4238x465'),
(298,'Heather','Farrell',79296999,'H.Farrell90@hotmail.com','2022-12-14 09:57:05','1999',1,373,'(842)297-1162'),
(299,'Leslie','Hood',31898245,'L-Hood86@yahoo.com','2022-12-14 09:57:05','1953',1,362,'+1-673-865-7473'),
(300,'Yesenia','Rosario',33803015,'Y.Rosario89@hotmail.com','2022-12-14 09:57:05','1992',1,709,'(581)278-3319'),
(301,'April','Clark',72554517,'A-Clark76@yahoo.com','2022-12-14 09:57:05','1967',1,494,'+1-387-426-6188'),
(302,'Daniel','Nichols',56545122,'D_Nichols84@gmail.com','2022-12-14 09:57:05','1970',1,263,'+1-245-575-6865'),
(303,'Pamela','Kirk',29608986,'P.Kirk86@hotmail.com','2022-12-14 09:57:05','1995',1,786,'+1-165-039-4472x91341'),
(304,'Robert','Nelson',92638904,'R_Nelson98@hotmail.com','2022-12-14 09:57:05','1946',1,712,'(350)196-5966'),
(305,'Christopher','Jones',15062303,'C_Jones52@hotmail.com','2022-12-14 09:57:05','1977',1,845,'871.809.9571'),
(306,'Ashley','King',70996861,'A_King52@hotmail.com','2022-12-14 09:57:05','1946',1,552,'+1-649-478-5220x7494'),
(307,'Taylor','Johnson',94259472,'T_Johnson69@yahoo.com','2022-12-14 09:57:05','1957',1,283,'558-088-0032'),
(308,'Michael','Carter',31521376,'M_Carter97@gmail.com','2022-12-14 09:57:05','1982',1,742,'4019288901'),
(309,'Kelli','Cole',29797245,'K_Cole60@hotmail.com','2022-12-14 09:57:05','2012',1,837,'+1-835-373-0199x09784'),
(310,'Laura','Williams',37376959,'L.Williams52@gmail.com','2022-12-14 09:57:05','1977',1,494,'(018)677-1165x2819'),
(311,'Heather','Mendoza',36744161,'H.Mendoza53@hotmail.com','2022-12-14 09:57:05','1995',1,12,'+1-902-869-0564x53380'),
(312,'Ross','Brown',30405510,'R_Brown94@hotmail.com','2022-12-14 09:57:05','2005',1,668,'405.049.1019'),
(313,'William','Sullivan',48337726,'W-Sullivan64@yahoo.com','2022-12-14 09:57:05','1983',1,693,'6100343033'),
(314,'Makayla','Brewer',62638687,'M_Brewer71@gmail.com','2022-12-14 09:57:05','1958',1,168,'142.010.3246'),
(315,'Stephanie','Perez',82580387,'S.Perez93@yahoo.com','2022-12-14 09:57:05','1979',1,68,'705.751.0864x2302'),
(316,'Lucas','Butler',98656142,'L.Butler61@gmail.com','2022-12-14 09:57:05','1984',1,306,'(434)133-7871x13618'),
(317,'Erin','Lopez',87111273,'E_Lopez50@yahoo.com','2022-12-14 09:57:05','1977',1,427,'+1-228-481-5129'),
(318,'Lisa','Gray',70273961,'L.Gray52@hotmail.com','2022-12-14 09:57:05','1966',1,58,'762.770.5010'),
(319,'Travis','Lee',78138755,'T-Lee81@gmail.com','2022-12-14 09:57:05','1952',1,291,'001-456-674-0427x19591'),
(320,'Lori','Freeman',32992153,'L.Freeman51@yahoo.com','2022-12-14 09:57:05','1965',1,663,'001-186-917-4002x826'),
(321,'Christine','Travis',80060192,'C_Travis59@gmail.com','2022-12-14 09:57:05','1965',1,940,'097-828-3961'),
(322,'George','Johnson',60099117,'G_Johnson68@hotmail.com','2022-12-14 09:57:05','1950',1,827,'288.130.1760'),
(323,'John','Joseph',51076092,'J.Joseph69@yahoo.com','2022-12-14 09:57:05','1984',1,36,'614-275-9615'),
(324,'Alexandria','Glover',39463776,'A.Glover96@gmail.com','2022-12-14 09:57:05','1965',1,301,'4739135443'),
(325,'Adriana','Smith',81219043,'A_Smith53@yahoo.com','2022-12-14 09:57:05','1952',1,819,'669-695-2760x336'),
(326,'Matthew','Flores',44542982,'M_Flores85@gmail.com','2022-12-14 09:57:05','1977',1,238,'+1-897-591-9506x7406'),
(327,'Katherine','Allison',54728273,'K-Allison68@gmail.com','2022-12-14 09:57:05','1982',1,5,'001-237-961-9822x63705'),
(328,'Nicholas','Johnson',84537337,'N-Johnson99@gmail.com','2022-12-14 09:57:05','1966',1,911,'104.738.8004x233'),
(329,'Robert','Ramos',93420331,'R-Ramos55@gmail.com','2022-12-14 09:57:05','2004',1,59,'828.656.0756'),
(330,'Todd','Smith',72719616,'T-Smith62@gmail.com','2022-12-14 09:57:05','1978',1,969,'139.395.7490x8050'),
(331,'Amanda','Martin',19125329,'A-Martin82@gmail.com','2022-12-14 09:57:05','1992',1,435,'(670)575-7929x56984'),
(332,'Christina','Williams',97080450,'C-Williams83@yahoo.com','2022-12-14 09:57:05','1974',1,568,'(142)780-1168x157'),
(333,'Kathryn','Bartlett',92120900,'K-Bartlett90@hotmail.com','2022-12-14 09:57:05','1966',1,287,'(732)189-6687'),
(334,'Robert','Griffin',67007101,'R.Griffin80@yahoo.com','2022-12-14 09:57:05','1986',1,958,'(750)106-7112x700'),
(335,'Richard','Murphy',96819787,'R-Murphy83@gmail.com','2022-12-14 09:57:05','1993',1,690,'(007)426-5437'),
(336,'Nancy','Robinson',67796012,'N-Robinson76@gmail.com','2022-12-14 09:57:05','1958',1,999,'(128)568-0707'),
(337,'Sean','Nichols',55922622,'S_Nichols95@yahoo.com','2022-12-14 09:57:05','1979',1,225,'552.426.5992x44422'),
(338,'Ronald','Alvarado',12263640,'R_Alvarado55@hotmail.com','2022-12-14 09:57:05','2001',1,289,'640.718.9732x2187'),
(339,'Kevin','Jackson',72829997,'K.Jackson78@hotmail.com','2022-12-14 09:57:05','1951',1,125,'285.138.3961x411'),
(340,'Robert','Frye',27918098,'R-Frye56@yahoo.com','2022-12-14 09:57:05','1987',1,561,'(715)036-0417x048'),
(341,'Gloria','Whitehead',66746973,'G_Whitehead51@gmail.com','2022-12-14 09:57:05','1973',1,411,'(064)690-2128'),
(342,'Charles','Robinson',24651974,'C_Robinson91@hotmail.com','2022-12-14 09:57:05','1965',1,576,'+1-934-063-9719x44753'),
(343,'David','Higgins',29909119,'D-Higgins89@hotmail.com','2022-12-14 09:57:05','1982',1,939,'078.547.0902'),
(344,'Matthew','Richardson',25415695,'M_Richardson75@gmail.com','2022-12-14 09:57:05','1942',1,577,'968-582-6668x83652'),
(345,'Jenna','Aguilar',77978173,'J-Aguilar50@hotmail.com','2022-12-14 09:57:05','1998',1,307,'690.786.6277'),
(346,'Evan','Reed',14462452,'E_Reed80@hotmail.com','2022-12-14 09:57:05','1974',1,482,'335.687.8599x7396'),
(347,'Taylor','Allen',14603079,'T_Allen89@gmail.com','2022-12-14 09:57:05','1966',1,261,'441-898-4834x65269'),
(348,'Hunter','Anderson',94154428,'H-Anderson62@gmail.com','2022-12-14 09:57:05','2001',1,1000,'(147)401-1058x92209'),
(349,'Dominique','Forbes',63078450,'D.Forbes71@gmail.com','2022-12-14 09:57:05','2000',1,328,'128-748-0305'),
(350,'Charles','Aguilar',18479395,'C-Aguilar79@hotmail.com','2022-12-14 09:57:05','1964',1,160,'960-125-1035'),
(351,'Brett','Cortez',92510942,'B-Cortez65@yahoo.com','2022-12-14 09:57:05','1992',1,917,'+1-710-806-5992x0518'),
(352,'Juan','Parker',36720266,'J.Parker65@gmail.com','2022-12-14 09:57:05','1967',1,35,'550-993-5570x75677'),
(353,'John','Huynh',67602180,'J_Huynh98@yahoo.com','2022-12-14 09:57:05','2001',1,605,'039.332.2201x59735'),
(354,'Rita','Solomon',46817217,'R.Solomon60@gmail.com','2022-12-14 09:57:05','2000',1,39,'4867169881'),
(355,'Rebecca','Palmer',59135785,'R.Palmer98@yahoo.com','2022-12-14 09:57:05','1965',1,182,'001-417-572-5624x643'),
(356,'Stephanie','Smith',76965735,'S_Smith67@gmail.com','2022-12-14 09:57:05','1965',1,158,'(681)899-7092x4444'),
(357,'Kevin','Mills',67555514,'K-Mills69@hotmail.com','2022-12-14 09:57:05','1968',1,626,'4543299368'),
(358,'Barbara','Shaw',79268403,'B.Shaw65@yahoo.com','2022-12-14 09:57:05','1961',1,213,'891.934.4878x9083'),
(359,'Alan','Montes',97751755,'A_Montes84@hotmail.com','2022-12-14 09:57:05','1970',1,894,'112-284-6077x375'),
(360,'Denise','Webster',53478854,'D-Webster88@yahoo.com','2022-12-14 09:57:05','2005',1,26,'(212)928-9738x65635'),
(361,'Thomas','Mooney',67582146,'T.Mooney85@hotmail.com','2022-12-14 09:57:05','1975',1,596,'940.719.3346x15622'),
(362,'Roger','Rosales',17800441,'R-Rosales90@gmail.com','2022-12-14 09:57:05','1958',1,513,'311.873.1059x5092'),
(363,'Deborah','Lynch',35865517,'D.Lynch73@gmail.com','2022-12-14 09:57:05','1970',1,962,'493-016-0721x9854'),
(364,'Daniel','Gill',98606927,'D-Gill70@yahoo.com','2022-12-14 09:57:05','2005',1,262,'001-040-506-8981'),
(365,'Paul','Bradford',56978305,'P_Bradford77@hotmail.com','2022-12-14 09:57:05','1963',1,397,'(020)811-2090x5198'),
(366,'Larry','Spencer',34817228,'L.Spencer62@gmail.com','2022-12-14 09:57:05','1978',1,377,'+1-571-286-9585x113'),
(367,'Richard','Ross',64421988,'R.Ross56@hotmail.com','2022-12-14 09:57:05','1951',1,267,'9164158655'),
(368,'Wesley','Mckee',68052977,'W.Mckee88@gmail.com','2022-12-14 09:57:05','1972',1,43,'(336)877-9760x65951'),
(369,'Maria','Hicks',69022327,'M_Hicks83@yahoo.com','2022-12-14 09:57:05','1965',1,773,'9629153894'),
(370,'Jacob','Graves',96993768,'J_Graves77@gmail.com','2022-12-14 09:57:05','1983',1,281,'364-509-9075x6319'),
(371,'John','Duncan',43323562,'J-Duncan81@hotmail.com','2022-12-14 09:57:05','1944',1,754,'1565591521'),
(372,'Diana','Williams',63228974,'D-Williams95@gmail.com','2022-12-14 09:57:05','1978',1,568,'820-278-5520'),
(373,'Kathy','Vega',60764067,'K_Vega55@yahoo.com','2022-12-14 09:57:05','1991',1,488,'(129)223-5424x7412'),
(374,'Roger','Aguirre',52536581,'R-Aguirre74@gmail.com','2022-12-14 09:57:05','1998',1,36,'395-725-0747x08517'),
(375,'Jennifer','Powell',70896988,'J_Powell50@hotmail.com','2022-12-14 09:57:05','1970',1,46,'059.421.1385'),
(376,'Gregory','Duke',82277795,'G.Duke67@hotmail.com','2022-12-14 09:57:05','1952',1,990,'7122133781'),
(377,'Sarah','Bauer',10935099,'S-Bauer86@gmail.com','2022-12-14 09:57:05','1949',1,498,'+1-891-885-1868x1135'),
(378,'Alex','Cooper',98547743,'A-Cooper52@gmail.com','2022-12-14 09:57:05','1985',1,103,'(197)846-8016'),
(379,'Robert','Gomez',34919168,'R.Gomez89@yahoo.com','2022-12-14 09:57:05','1977',1,712,'316-655-8753x49207'),
(380,'Edward','Hartman',91999555,'E-Hartman90@yahoo.com','2022-12-14 09:57:05','1996',1,844,'(907)252-5863'),
(381,'William','Brown',16252907,'W-Brown75@yahoo.com','2022-12-14 09:57:05','1987',1,708,'5396211603'),
(382,'Rebecca','Ellis',70759569,'R_Ellis80@yahoo.com','2022-12-14 09:57:05','2015',1,211,'+1-729-920-8954x3058'),
(383,'Kathy','Roberts',71745843,'K.Roberts64@hotmail.com','2022-12-14 09:57:05','1952',1,706,'555.030.0333x62446'),
(384,'Kyle','Lawrence',47382643,'K-Lawrence97@gmail.com','2022-12-14 09:57:05','1975',1,271,'001-387-789-4810'),
(385,'Brian','White',93943851,'B_White71@gmail.com','2022-12-14 09:57:05','1962',1,794,'666-258-1649'),
(386,'Dustin','Dyer',45634384,'D-Dyer93@gmail.com','2022-12-14 09:57:05','1970',1,475,'526.373.8872x076'),
(387,'Donna','Reid',91052253,'D-Reid68@hotmail.com','2022-12-14 09:57:05','1943',1,201,'+1-782-396-7127x2801'),
(388,'Kristen','Ballard',34854110,'K_Ballard55@gmail.com','2022-12-14 09:57:05','1969',1,360,'001-367-563-8919x0714'),
(389,'Dennis','Kerr',84251478,'D-Kerr63@gmail.com','2022-12-14 09:57:05','1956',1,144,'895-850-1869x45742'),
(390,'Victoria','Adams',37007668,'V_Adams90@hotmail.com','2022-12-14 09:57:05','1965',1,245,'(603)429-1143'),
(391,'Jeffrey','Velazquez',70812715,'J.Velazquez80@yahoo.com','2022-12-14 09:57:05','1999',1,668,'(104)993-5258'),
(392,'Adam','Miller',78633981,'A-Miller94@gmail.com','2022-12-14 09:57:05','1955',1,621,'+1-945-487-2679x10481'),
(393,'Sandra','Garcia',67105083,'S_Garcia79@gmail.com','2022-12-14 09:57:05','1984',1,945,'+1-087-557-6940'),
(394,'Stacy','Pope',50651310,'S-Pope69@yahoo.com','2022-12-14 09:57:05','1943',1,885,'+1-178-623-4469x90421'),
(395,'Priscilla','Barton',34499660,'P.Barton82@yahoo.com','2022-12-14 09:57:05','1957',1,58,'+1-221-928-3404x61447'),
(396,'Alexander','Shaw',66977841,'A_Shaw59@hotmail.com','2022-12-14 09:57:05','1993',1,861,'561-397-0684x4927'),
(397,'Mario','Jordan',18500739,'M-Jordan77@gmail.com','2022-12-14 09:57:05','1964',1,706,'498-013-3193x65930'),
(398,'Misty','Warren',37250743,'M_Warren81@yahoo.com','2022-12-14 09:57:05','1952',1,322,'708-732-7003'),
(399,'Carol','Sanchez',58045024,'C-Sanchez86@yahoo.com','2022-12-14 09:57:05','1997',1,570,'001-568-528-8475x0184'),
(400,'John','Sherman',75157888,'J_Sherman78@hotmail.com','2022-12-14 09:57:05','1960',1,840,'+1-805-992-2740x040'),
(401,'David','Scott',67883206,'D-Scott98@hotmail.com','2022-12-14 09:57:05','1992',1,496,'852.943.4166'),
(402,'Jimmy','Baker',17270179,'J.Baker81@hotmail.com','2022-12-14 09:57:05','1989',1,931,'609.221.9848x479'),
(403,'Teresa','Ball',84142906,'T.Ball51@gmail.com','2022-12-14 09:57:05','1957',1,82,'001-087-053-7585x3132'),
(404,'Tanya','Jenkins',56730300,'T.Jenkins98@hotmail.com','2022-12-14 09:57:05','1975',1,130,'001-329-116-8012x06400'),
(405,'Tara','Shannon',13923301,'T-Shannon83@hotmail.com','2022-12-14 09:57:05','1958',1,456,'169-365-6971x67139'),
(406,'Jonathan','Myers',33890090,'J-Myers76@hotmail.com','2022-12-14 09:57:05','1984',1,210,'001-749-628-1841x6903'),
(407,'Bruce','Martinez',45059267,'B_Martinez76@hotmail.com','2022-12-14 09:57:05','1980',1,428,'+1-410-332-4896'),
(408,'Jerry','Silva',18242920,'J-Silva87@gmail.com','2022-12-14 09:57:05','1987',1,160,'0157505247'),
(409,'April','Gonzalez',67543143,'A-Gonzalez54@hotmail.com','2022-12-14 09:57:05','1998',1,123,'638.807.9139'),
(410,'Thomas','Gibson',32744796,'T-Gibson64@yahoo.com','2022-12-14 09:57:05','2007',1,134,'+1-377-684-5474x14646'),
(411,'Stephen','Washington',97969622,'S_Washington76@gmail.com','2022-12-14 09:57:05','1959',1,856,'001-281-574-8735x8343'),
(412,'Donald','Coleman',11091112,'D_Coleman55@gmail.com','2022-12-14 09:57:05','1961',1,405,'801.276.5751'),
(413,'Mary','Gonzales',34388422,'M_Gonzales56@yahoo.com','2022-12-14 09:57:05','1944',1,156,'0997543629'),
(414,'Dana','Johnson',15698517,'D-Johnson69@gmail.com','2022-12-14 09:57:05','1951',1,393,'7150981437'),
(415,'Kathleen','Oliver',35336261,'K_Oliver82@gmail.com','2022-12-14 09:57:05','1993',1,709,'+1-663-623-0771'),
(416,'Selena','Green',69137695,'S-Green77@hotmail.com','2022-12-14 09:57:05','1986',1,130,'987-530-1404x806'),
(417,'Cody','Brown',65643408,'C.Brown77@gmail.com','2022-12-14 09:57:05','1977',1,417,'+1-802-687-2608x372'),
(418,'Robert','Norton',84209637,'R_Norton56@yahoo.com','2022-12-14 09:57:05','1987',1,284,'+1-648-803-5339x40575'),
(419,'William','Contreras',58166983,'W.Contreras52@gmail.com','2022-12-14 09:57:05','2015',1,366,'781-258-7549'),
(420,'Alan','Berry',80558837,'A_Berry97@hotmail.com','2022-12-14 09:57:05','1998',1,694,'570-006-9831'),
(421,'Austin','Lindsey',99646243,'A_Lindsey52@yahoo.com','2022-12-14 09:57:05','1979',1,619,'001-399-871-3350'),
(422,'Stephen','Flores',30548313,'S-Flores89@hotmail.com','2022-12-14 09:57:05','1953',1,769,'171-627-8494'),
(423,'Edward','Smith',98181580,'E-Smith83@gmail.com','2022-12-14 09:57:05','1973',1,514,'417-807-0282x15884'),
(424,'Catherine','Gutierrez',84182066,'C-Gutierrez57@yahoo.com','2022-12-14 09:57:05','1960',1,749,'572-134-4463x404'),
(425,'Bradley','Shannon',42088521,'B_Shannon94@gmail.com','2022-12-14 09:57:05','1971',1,780,'001-913-518-4557'),
(426,'Kristen','Haynes',74038639,'K_Haynes93@hotmail.com','2022-12-14 09:57:05','1966',1,138,'537.748.3716'),
(427,'Ryan','Garcia',75460935,'R-Garcia81@hotmail.com','2022-12-14 09:57:05','2000',1,136,'+1-591-114-1497x447'),
(428,'Barry','Butler',25274030,'B_Butler83@gmail.com','2022-12-14 09:57:05','1989',1,211,'+1-412-742-3896x78196'),
(429,'Jeremy','Vargas',55744838,'J.Vargas69@yahoo.com','2022-12-14 09:57:05','1959',1,489,'+1-104-223-1793x5710'),
(430,'James','Wilson',85335150,'J_Wilson68@gmail.com','2022-12-14 09:57:05','1973',1,447,'(044)454-9023x847'),
(431,'Luis','Bell',56879729,'L_Bell55@gmail.com','2022-12-14 09:57:05','1977',1,83,'429.127.2094x1165'),
(432,'William','Wolfe',78977102,'W.Wolfe57@yahoo.com','2022-12-14 09:57:05','1934',1,785,'091.791.6042'),
(433,'Christopher','Ramos',56650885,'C-Ramos91@yahoo.com','2022-12-14 09:57:05','1985',1,463,'187.257.4012x0692'),
(434,'Joseph','Juarez',95660144,'J.Juarez66@hotmail.com','2022-12-14 09:57:05','1985',1,857,'+1-815-803-9947'),
(435,'Linda','Ramirez',99681899,'L-Ramirez53@yahoo.com','2022-12-14 09:57:05','1988',1,217,'943-460-3116x583'),
(436,'Amanda','Horne',81252869,'A_Horne65@gmail.com','2022-12-14 09:57:05','1957',1,694,'028.787.9552x21749'),
(437,'Casey','Howard',76263353,'C.Howard86@yahoo.com','2022-12-14 09:57:05','1975',1,851,'825.989.4632'),
(438,'Alexandra','Hopkins',73431768,'A.Hopkins62@gmail.com','2022-12-14 09:57:05','1945',1,762,'(575)528-7900x561'),
(439,'Jessica','Costa',19232633,'J_Costa90@yahoo.com','2022-12-14 09:57:05','2003',1,598,'(893)572-9652x208'),
(440,'David','Moore',40059046,'D-Moore71@gmail.com','2022-12-14 09:57:05','1972',1,863,'+1-635-795-5500x251'),
(441,'Douglas','Guzman',36946484,'D-Guzman86@gmail.com','2022-12-14 09:57:05','1957',1,7,'(120)499-9337x2255'),
(442,'Troy','Livingston',28516700,'T-Livingston99@yahoo.com','2022-12-14 09:57:05','1978',1,327,'(786)524-7595'),
(443,'Kelly','Campbell',12785999,'K.Campbell85@yahoo.com','2022-12-14 09:57:05','1984',1,693,'001-805-546-9998x8371'),
(444,'Briana','Jones',27919646,'B-Jones56@yahoo.com','2022-12-14 09:57:05','2014',1,388,'609.662.6077'),
(445,'Kristopher','Strong',62041302,'K.Strong57@gmail.com','2022-12-14 09:57:05','1962',1,79,'337-171-5448x3367'),
(446,'Richard','Jones',97118289,'R.Jones73@hotmail.com','2022-12-14 09:57:05','1988',1,64,'(360)775-4046'),
(447,'Erica','Greene',63516915,'E_Greene60@yahoo.com','2022-12-14 09:57:05','1997',1,120,'001-190-880-1156'),
(448,'Bryan','Rodriguez',96044837,'B_Rodriguez70@hotmail.com','2022-12-14 09:57:05','1962',1,929,'(528)251-3549x41638'),
(449,'Michael','Norman',81363839,'M-Norman69@hotmail.com','2022-12-14 09:57:05','1946',1,372,'690.808.9916'),
(450,'Brian','Richardson',70427953,'B-Richardson88@hotmail.com','2022-12-14 09:57:05','1989',1,956,'(112)814-7465x8283'),
(451,'Tracy','Sanders',25523591,'T-Sanders72@gmail.com','2022-12-14 09:57:05','1957',1,198,'000.567.9012x71729'),
(452,'Jimmy','Allen',24466862,'J_Allen81@hotmail.com','2022-12-14 09:57:05','1998',1,399,'537.511.8376'),
(453,'Cynthia','Taylor',61777080,'C-Taylor74@hotmail.com','2022-12-14 09:57:05','1983',1,917,'001-792-066-1759x2609'),
(454,'John','Torres',95854946,'J_Torres80@gmail.com','2022-12-14 09:57:05','1947',1,344,'109.019.6171x8882'),
(455,'Jennifer','Moran',35299466,'J_Moran89@yahoo.com','2022-12-14 09:57:05','1953',1,39,'+1-269-664-3233x602'),
(456,'Donna','Edwards',81319306,'D_Edwards54@hotmail.com','2022-12-14 09:57:05','1996',1,180,'047-043-4671x7525'),
(457,'Glenda','Miller',68823322,'G_Miller58@gmail.com','2022-12-14 09:57:05','1998',1,450,'986-205-5529'),
(458,'Robert','Gaines',18441386,'R_Gaines64@hotmail.com','2022-12-14 09:57:05','1951',1,113,'+1-418-877-0097x076'),
(459,'Heather','Myers',94350073,'H.Myers52@yahoo.com','2022-12-14 09:57:05','1965',1,170,'(755)515-0066'),
(460,'Michele','Strickland',10591194,'M.Strickland75@hotmail.com','2022-12-14 09:57:05','1973',1,389,'957-970-4400x410'),
(461,'Carrie','Jennings',33561935,'C.Jennings79@yahoo.com','2022-12-14 09:57:05','1971',1,625,'763-592-3576'),
(462,'Dylan','Parker',87977551,'D.Parker58@gmail.com','2022-12-14 09:57:05','2001',1,537,'306.126.4293'),
(463,'Kevin','Torres',98195428,'K-Torres73@hotmail.com','2022-12-14 09:57:05','1958',1,832,'(443)977-2731'),
(464,'Michael','Pitts',91402150,'M_Pitts67@yahoo.com','2022-12-14 09:57:05','1973',1,426,'590.944.6644x69797'),
(465,'Ryan','Leach',28418638,'R_Leach60@hotmail.com','2022-12-14 09:57:05','1936',1,970,'001-520-821-8285x99050'),
(466,'Corey','Campbell',33452348,'C_Campbell68@hotmail.com','2022-12-14 09:57:05','1953',1,774,'6385934800'),
(467,'Vanessa','Hughes',51468543,'V.Hughes54@gmail.com','2022-12-14 09:57:05','1959',1,674,'9493594276'),
(468,'Andrew','Avila',34627418,'A_Avila86@hotmail.com','2022-12-14 09:57:05','1965',1,34,'(644)454-1461x592'),
(469,'Kevin','Nichols',60723714,'K.Nichols92@yahoo.com','2022-12-14 09:57:05','1958',1,147,'569.194.5192'),
(470,'Matthew','Oconnell',84147384,'M-Oconnell61@hotmail.com','2022-12-14 09:57:05','2006',1,465,'390.147.3219'),
(471,'Eric','Harris',97634128,'E-Harris63@yahoo.com','2022-12-14 09:57:05','2009',1,636,'369.477.1780'),
(472,'Natalie','Ford',13531556,'N.Ford78@yahoo.com','2022-12-14 09:57:05','1965',1,289,'+1-947-467-2544x2980'),
(473,'Karen','Carter',20359943,'K.Carter51@hotmail.com','2022-12-14 09:57:05','1977',1,149,'873.914.7847x231'),
(474,'Brian','Hayes',35912979,'B.Hayes91@hotmail.com','2022-12-14 09:57:05','1985',1,128,'001-250-310-0516x3262'),
(475,'Zachary','Sanchez',53831572,'Z_Sanchez75@hotmail.com','2022-12-14 09:57:05','1984',1,949,'(422)483-5526x298'),
(476,'Mary','Baldwin',33703982,'M.Baldwin60@hotmail.com','2022-12-14 09:57:05','1980',1,835,'7307668407'),
(477,'Leah','Kim',91841505,'L_Kim75@gmail.com','2022-12-14 09:57:05','1960',1,255,'(043)111-4375x21298'),
(478,'Angela','Lopez',10647718,'A_Lopez79@gmail.com','2022-12-14 09:57:05','1964',1,181,'424-457-4088x33496'),
(479,'William','Roberts',45782396,'W.Roberts83@yahoo.com','2022-12-14 09:57:05','1965',1,195,'001-715-214-3435'),
(480,'Brandy','Sherman',15424008,'B-Sherman75@yahoo.com','2022-12-14 09:57:05','1959',1,232,'(477)339-0906x461'),
(481,'Cheryl','Howard',57027121,'C_Howard58@yahoo.com','2022-12-14 09:57:05','1963',1,563,'861-379-2355'),
(482,'Amanda','Hernandez',17480202,'A_Hernandez86@hotmail.com','2022-12-14 09:57:05','1999',1,579,'630.588.6358x362'),
(483,'Timothy','Wilson',42376527,'T.Wilson77@gmail.com','2022-12-14 09:57:05','2017',1,907,'324.158.1882'),
(484,'Gary','Thomas',93326666,'G-Thomas67@yahoo.com','2022-12-14 09:57:05','1976',1,721,'+1-834-369-8061'),
(485,'Ruben','Bullock',23824316,'R-Bullock50@hotmail.com','2022-12-14 09:57:05','1991',1,98,'(972)161-5914'),
(486,'Kimberly','Mcgrath',69834654,'K_Mcgrath88@gmail.com','2022-12-14 09:57:05','1978',1,513,'(376)835-7294x043'),
(487,'Timothy','Young',92958981,'T-Young88@gmail.com','2022-12-14 09:57:05','1959',1,449,'(709)253-8972x550'),
(488,'Mary','Walker',30696384,'M_Walker97@gmail.com','2022-12-14 09:57:05','2006',1,947,'941-359-6444x3282'),
(489,'Shelia','Smith',46796159,'S_Smith87@yahoo.com','2022-12-14 09:57:05','1950',1,726,'001-477-727-7755x46220'),
(490,'Laura','Palmer',33460809,'L-Palmer97@yahoo.com','2022-12-14 09:57:05','1958',1,444,'(872)026-9487x667'),
(491,'Devin','Townsend',51166482,'D.Townsend82@yahoo.com','2022-12-14 09:57:05','1970',1,852,'001-811-312-1866x5200'),
(492,'Latoya','Stout',81613871,'L_Stout53@gmail.com','2022-12-14 09:57:05','1970',1,393,'001-238-743-7466x0661'),
(493,'Chelsea','Sanchez',91617027,'C_Sanchez64@hotmail.com','2022-12-14 09:57:05','1962',1,270,'(267)761-5559'),
(494,'Colleen','Walker',32215488,'C.Walker98@gmail.com','2022-12-14 09:57:05','1971',1,244,'5093088308'),
(495,'Derek','Cochran',63815902,'D_Cochran75@yahoo.com','2022-12-14 09:57:05','1966',1,794,'856.494.0679'),
(496,'John','English',17571852,'J-English94@yahoo.com','2022-12-14 09:57:05','1970',1,679,'165.706.2096'),
(497,'Mark','Salazar',17969771,'M.Salazar87@yahoo.com','2022-12-14 09:57:05','1979',1,612,'0185036246'),
(498,'Lance','Garcia',91359058,'L-Garcia70@yahoo.com','2022-12-14 09:57:05','2000',1,272,'001-782-195-1289x93858'),
(499,'Jennifer','Wilson',99979110,'J_Wilson68@yahoo.com','2022-12-14 09:57:05','1968',1,282,'137.349.6924x4942'),
(500,'Travis','Knight',39058613,'T-Knight64@gmail.com','2022-12-14 09:57:05','2010',1,596,'+1-102-448-8579x660'),
(501,'James','Moss',32676455,'J-Moss81@yahoo.com','2022-12-14 09:57:05','1951',1,470,'479-705-2083'),
(502,'Zachary','Rodriguez',72700837,'Z_Rodriguez86@yahoo.com','2022-12-14 09:57:05','1978',1,596,'+1-146-279-1986x2547'),
(503,'Steven','Cunningham',56841370,'S-Cunningham93@hotmail.com','2022-12-14 09:57:05','1975',1,563,'(263)614-2951'),
(504,'William','Hall',15145049,'W-Hall59@yahoo.com','2022-12-14 09:57:05','1990',1,648,'1518952163'),
(505,'Scott','James',16909210,'S-James74@hotmail.com','2022-12-14 09:57:05','1978',1,828,'+1-936-887-5745'),
(506,'Angela','Collins',75069655,'A-Collins61@gmail.com','2022-12-14 09:57:05','1948',1,848,'(222)925-2906x0142'),
(507,'Rhonda','Beck',66733550,'R.Beck71@gmail.com','2022-12-14 09:57:05','1976',1,512,'187.646.9989'),
(508,'Stacey','Jacobs',27307025,'S.Jacobs73@yahoo.com','2022-12-14 09:57:05','2016',1,320,'880-581-3561x4299'),
(509,'Timothy','Montgomery',75595427,'T-Montgomery62@yahoo.com','2022-12-14 09:57:05','1995',1,988,'+1-851-603-0078x486'),
(510,'Jacqueline','Stevenson',38949202,'J-Stevenson64@gmail.com','2022-12-14 09:57:05','2012',1,784,'+1-624-181-6153x30191'),
(511,'Lindsey','Villarreal',60191212,'L_Villarreal90@gmail.com','2022-12-14 09:57:05','1980',1,300,'+1-359-301-7790x59298'),
(512,'Cindy','Gonzalez',97186237,'C_Gonzalez72@yahoo.com','2022-12-14 09:57:05','1970',1,349,'896-627-0477x44050'),
(513,'Mark','Moore',78073241,'M-Moore59@yahoo.com','2022-12-14 09:57:05','1973',1,653,'+1-911-359-1697x949'),
(514,'Jeffery','Avila',72719097,'J-Avila99@gmail.com','2022-12-14 09:57:05','2002',1,360,'552-252-3693x3112'),
(515,'Lee','Brown',82517983,'L.Brown98@yahoo.com','2022-12-14 09:57:05','1957',1,665,'(129)745-8293x9745'),
(516,'Alexandra','Lyons',38835473,'A.Lyons81@hotmail.com','2022-12-14 09:57:05','1989',1,420,'797-292-2510x5365'),
(517,'Jason','Hoffman',90653008,'J-Hoffman80@yahoo.com','2022-12-14 09:57:05','1969',1,173,'+1-403-841-6386x0900'),
(518,'Kenneth','Huff',48489987,'K_Huff90@hotmail.com','2022-12-14 09:57:05','2003',1,817,'945.229.4424x667'),
(519,'Ashley','Pham',33700812,'A-Pham85@yahoo.com','2022-12-14 09:57:05','1979',1,475,'533.604.0782x61858'),
(520,'Katherine','Parker',29061990,'K-Parker56@gmail.com','2022-12-14 09:57:05','1970',1,11,'460-502-5317'),
(521,'Chad','Green',49321961,'C-Green78@hotmail.com','2022-12-14 09:57:05','1953',1,923,'(280)107-3803x65485'),
(522,'Michael','Johnson',85465379,'M_Johnson84@gmail.com','2022-12-14 09:57:05','1972',1,198,'(874)640-3589x37348'),
(523,'Daniel','Chambers',79719036,'D-Chambers52@hotmail.com','2022-12-14 09:57:05','1968',1,990,'7788324830'),
(524,'Veronica','Flores',18252559,'V.Flores98@yahoo.com','2022-12-14 09:57:05','1985',1,211,'001-235-203-7454'),
(525,'Jennifer','Lee',38591625,'J_Lee61@gmail.com','2022-12-14 09:57:05','1966',1,682,'(313)729-9244x424'),
(526,'Tiffany','Roberts',97705683,'T_Roberts55@gmail.com','2022-12-14 09:57:05','1945',1,928,'001-856-126-0176'),
(527,'Brandon','Gamble',58177443,'B_Gamble56@gmail.com','2022-12-14 09:57:05','1972',1,502,'(846)584-3578x203'),
(528,'Angela','Jimenez',79320011,'A-Jimenez57@hotmail.com','2022-12-14 09:57:05','1978',1,462,'001-804-975-7084'),
(529,'Johnathan','Floyd',10394815,'J_Floyd79@yahoo.com','2022-12-14 09:57:05','2003',1,719,'001-112-906-9880x01818'),
(530,'Andrew','Pitts',57196959,'A.Pitts72@gmail.com','2022-12-14 09:57:05','1992',1,353,'857-118-5866'),
(531,'Shannon','Lewis',62794856,'S-Lewis99@yahoo.com','2022-12-14 09:57:05','1997',1,331,'(433)403-3710x72832'),
(532,'Jessica','Hernandez',49742271,'J_Hernandez81@hotmail.com','2022-12-14 09:57:05','1988',1,216,'(691)322-7476x8916'),
(533,'Thomas','Ford',73097296,'T_Ford82@yahoo.com','2022-12-14 09:57:05','1954',1,622,'+1-804-196-4578'),
(534,'Deanna','Johnson',35636670,'D.Johnson56@yahoo.com','2022-12-14 09:57:05','1958',1,635,'278-858-5373x6946'),
(535,'Angela','Johnson',12201018,'A_Johnson65@hotmail.com','2022-12-14 09:57:05','2001',1,749,'424.415.8809'),
(536,'Ashley','Patton',38519575,'A_Patton53@gmail.com','2022-12-14 09:57:05','1992',1,539,'+1-202-154-0530x700'),
(537,'Jon','Vargas',59747290,'J.Vargas63@hotmail.com','2022-12-14 09:57:05','1965',1,42,'(102)639-9888'),
(538,'Yvonne','Torres',78783560,'Y.Torres94@hotmail.com','2022-12-14 09:57:05','1961',1,570,'+1-637-854-1660'),
(539,'Andre','Richardson',13118691,'A_Richardson91@gmail.com','2022-12-14 09:57:05','1982',1,991,'398.548.5188x91143'),
(540,'Margaret','Williams',79870717,'M-Williams94@yahoo.com','2022-12-14 09:57:05','1970',1,410,'105.834.6857'),
(541,'David','Cohen',23797004,'D_Cohen88@hotmail.com','2022-12-14 09:57:05','1965',1,276,'677.118.6467'),
(542,'Brandon','King',76141648,'B-King82@hotmail.com','2022-12-14 09:57:05','1989',1,557,'807-719-8445x5584'),
(543,'Robert','Wilson',83451659,'R.Wilson78@hotmail.com','2022-12-14 09:57:05','1981',1,675,'760-502-1323x9328'),
(544,'Angela','Zuniga',34017073,'A_Zuniga56@gmail.com','2022-12-14 09:57:05','1959',1,541,'+1-154-206-0074'),
(545,'Megan','Wood',91561797,'M_Wood79@yahoo.com','2022-12-14 09:57:05','1983',1,176,'471-357-2060x189'),
(546,'Crystal','Frost',68705858,'C_Frost99@hotmail.com','2022-12-14 09:57:05','1986',1,324,'(094)233-8968'),
(547,'Sheryl','Smith',84685935,'S-Smith57@gmail.com','2022-12-14 09:57:05','1986',1,421,'728-431-9942x82142'),
(548,'Erica','Lee',40990840,'E_Lee98@hotmail.com','2022-12-14 09:57:05','1979',1,242,'+1-686-450-8169'),
(549,'Steven','Anderson',31560603,'S-Anderson94@hotmail.com','2022-12-14 09:57:05','1965',1,5,'2554296718'),
(550,'Makayla','Mclean',92055662,'M-Mclean92@hotmail.com','2022-12-14 09:57:05','1959',1,112,'209-738-0604x30612'),
(551,'Evan','Payne',79853078,'E_Payne78@hotmail.com','2022-12-14 09:57:05','1944',1,772,'(234)205-7846x77560'),
(552,'Richard','Lamb',39743660,'R_Lamb89@gmail.com','2022-12-14 09:57:05','1960',1,675,'376.144.0690'),
(553,'Juan','Hamilton',70709549,'J-Hamilton71@yahoo.com','2022-12-14 09:57:05','1947',1,525,'+1-945-930-1395x2778'),
(554,'Charles','Gilbert',63440246,'C_Gilbert90@hotmail.com','2022-12-14 09:57:05','1977',1,252,'426.032.8731x1988'),
(555,'Emily','Burton',10726656,'E-Burton63@hotmail.com','2022-12-14 09:57:05','1992',1,350,'001-243-608-1052x1787'),
(556,'Candace','Payne',28222684,'C_Payne91@yahoo.com','2022-12-14 09:57:05','1975',1,45,'163-008-8395'),
(557,'Jill','Parker',75574113,'J.Parker76@hotmail.com','2022-12-14 09:57:05','1949',1,304,'870.788.6703'),
(558,'Max','Buck',87214004,'M-Buck67@gmail.com','2022-12-14 09:57:05','1975',1,249,'415.568.2226x4058'),
(559,'Jane','Gonzales',30749302,'J_Gonzales91@hotmail.com','2022-12-14 09:57:05','1958',1,464,'001-034-561-9135'),
(560,'Jeffrey','Walton',61265864,'J_Walton98@hotmail.com','2022-12-14 09:57:05','1960',1,985,'3934356782'),
(561,'Darlene','Wilkins',73193814,'D_Wilkins99@gmail.com','2022-12-14 09:57:05','1942',1,573,'280-817-2097'),
(562,'Melissa','Byrd',96002103,'M.Byrd77@hotmail.com','2022-12-14 09:57:05','1985',1,349,'678-310-4468x513'),
(563,'Ashley','Hoffman',78986700,'A.Hoffman74@yahoo.com','2022-12-14 09:57:05','1987',1,892,'600-259-2164x75411'),
(564,'Benjamin','Gutierrez',85695201,'B-Gutierrez70@gmail.com','2022-12-14 09:57:05','1982',1,448,'351-750-5058x69859'),
(565,'Douglas','Schmitt',76099892,'D_Schmitt51@yahoo.com','2022-12-14 09:57:05','1990',1,268,'(222)362-9067x6858'),
(566,'Sylvia','Williams',70913683,'S-Williams83@gmail.com','2022-12-14 09:57:05','1993',1,155,'203-192-8630'),
(567,'Jonathan','Jackson',48033831,'J_Jackson85@hotmail.com','2022-12-14 09:57:05','1985',1,485,'463.477.4999x623'),
(568,'Brandon','Russell',62164682,'B.Russell83@gmail.com','2022-12-14 09:57:05','1943',1,260,'282-148-7332x9671'),
(569,'Brandon','Donaldson',19759534,'B.Donaldson92@hotmail.com','2022-12-14 09:57:05','1959',1,249,'998-197-6864x48727'),
(570,'Alexander','Sweeney',36569865,'A_Sweeney54@gmail.com','2022-12-14 09:57:05','1959',1,109,'+1-314-866-7594x6106'),
(571,'Theresa','Dunn',83928146,'T-Dunn68@hotmail.com','2022-12-14 09:57:05','1937',1,997,'(838)240-7822'),
(572,'Kevin','Burnett',76825946,'K_Burnett60@yahoo.com','2022-12-14 09:57:05','1972',1,299,'747-772-3480x37552'),
(573,'Yolanda','Lopez',71869636,'Y.Lopez99@yahoo.com','2022-12-14 09:57:05','1977',1,114,'699-913-6052x60112'),
(574,'Steven','Kramer',68674389,'S_Kramer68@hotmail.com','2022-12-14 09:57:05','1979',1,686,'(719)107-4882'),
(575,'Robin','Ellis',37147132,'R.Ellis81@gmail.com','2022-12-14 09:57:05','1997',1,143,'028.799.8068x88049'),
(576,'Shannon','Wilson',85699299,'S-Wilson72@hotmail.com','2022-12-14 09:57:05','1978',1,794,'907-218-7130'),
(577,'Mark','Cox',46502729,'M-Cox67@gmail.com','2022-12-14 09:57:05','1945',1,734,'+1-063-527-7374x624'),
(578,'Adam','Rowland',60988092,'A-Rowland70@hotmail.com','2022-12-14 09:57:05','1963',1,829,'(942)405-2228x83082'),
(579,'William','Flowers',75115540,'W_Flowers86@gmail.com','2022-12-14 09:57:05','1998',1,311,'001-895-544-3829x1833'),
(580,'Kathleen','Randolph',88010480,'K_Randolph81@yahoo.com','2022-12-14 09:57:05','1978',1,589,'+1-801-292-8027'),
(581,'Carmen','Watson',38421602,'C-Watson60@yahoo.com','2022-12-14 09:57:05','1995',1,407,'152-668-9235'),
(582,'Jonathan','Singh',42295416,'J.Singh80@yahoo.com','2022-12-14 09:57:05','1967',1,405,'(953)309-0163'),
(583,'Jose','Salazar',40444012,'J.Salazar72@yahoo.com','2022-12-14 09:57:05','1968',1,219,'8274105883'),
(584,'Andres','Miller',77954106,'A-Miller71@hotmail.com','2022-12-14 09:57:05','1991',1,909,'977-254-6007'),
(585,'April','Cook',19755515,'A_Cook92@yahoo.com','2022-12-14 09:57:05','1957',1,107,'(095)232-2349x474'),
(586,'Margaret','Gamble',27860730,'M-Gamble94@hotmail.com','2022-12-14 09:57:05','1972',1,634,'+1-441-721-0045x78482'),
(587,'Dana','Woods',26350030,'D.Woods57@yahoo.com','2022-12-14 09:57:05','2008',1,250,'336-696-3287x466'),
(588,'Don','Wong',37916392,'D.Wong58@yahoo.com','2022-12-14 09:57:05','1972',1,369,'001-754-841-0051x666'),
(589,'Pamela','Campbell',48334554,'P-Campbell73@yahoo.com','2022-12-14 09:57:05','1988',1,24,'001-232-482-2467x99255'),
(590,'Aaron','Andrews',32252366,'A_Andrews69@gmail.com','2022-12-14 09:57:05','1972',1,485,'708-970-2778x7565'),
(591,'Larry','Nelson',56894169,'L-Nelson62@yahoo.com','2022-12-14 09:57:05','1973',1,761,'001-053-574-6784'),
(592,'Shelley','Malone',97284739,'S_Malone89@hotmail.com','2022-12-14 09:57:05','1952',1,942,'2246833674'),
(593,'Nicholas','Arnold',46270241,'N.Arnold55@hotmail.com','2022-12-14 09:57:05','1978',1,937,'001-144-878-0158x38252'),
(594,'Michael','Miller',26124168,'M.Miller80@yahoo.com','2022-12-14 09:57:05','1972',1,207,'921.995.5509x381'),
(595,'Kevin','Gordon',64256055,'K.Gordon86@hotmail.com','2022-12-14 09:57:05','1976',1,116,'001-044-221-9938x70408'),
(596,'Brian','Osborne',11124480,'B-Osborne93@yahoo.com','2022-12-14 09:57:05','1957',1,138,'+1-153-088-1813x854'),
(597,'Kevin','Baxter',58920704,'K-Baxter80@gmail.com','2022-12-14 09:57:05','2004',1,908,'(530)579-1003x4555'),
(598,'Kara','Holmes',95950780,'K_Holmes67@hotmail.com','2022-12-14 09:57:05','1970',1,987,'1078587817'),
(599,'Laura','Daniel',94466999,'L_Daniel61@gmail.com','2022-12-14 09:57:05','2001',1,222,'440-717-3133x4582'),
(600,'Taylor','Smith',76938320,'T-Smith76@gmail.com','2022-12-14 09:57:05','1989',1,671,'001-390-172-6540x27151'),
(601,'Thomas','Murray',92441041,'T_Murray84@gmail.com','2022-12-14 09:57:05','1983',1,173,'521.540.5404x6020'),
(602,'Brandon','Maxwell',99648296,'B-Maxwell55@hotmail.com','2022-12-14 09:57:05','1976',1,209,'+1-909-377-1956x98571'),
(603,'Bradley','Dixon',99233957,'B_Dixon55@hotmail.com','2022-12-14 09:57:05','1979',1,455,'882.890.3721'),
(604,'Richard','Brown',20795807,'R_Brown79@yahoo.com','2022-12-14 09:57:05','1958',1,30,'001-037-155-9443x4042'),
(605,'Sandra','Lindsey',75703945,'S_Lindsey52@hotmail.com','2022-12-14 09:57:05','1959',1,503,'001-438-449-6347'),
(606,'Marc','Hunter',44165600,'M-Hunter78@yahoo.com','2022-12-14 09:57:05','1940',1,871,'+1-469-931-3954x383'),
(607,'Maria','Ortiz',92972403,'M.Ortiz82@yahoo.com','2022-12-14 09:57:05','2007',1,15,'(374)982-7123x365'),
(608,'Jacqueline','Briggs',53039006,'J-Briggs77@gmail.com','2022-12-14 09:57:05','1994',1,983,'(432)147-5256x95956'),
(609,'Timothy','Casey',72897847,'T_Casey65@gmail.com','2022-12-14 09:57:05','1974',1,634,'001-677-524-1775x21809'),
(610,'Amy','Brooks',41423140,'A_Brooks80@yahoo.com','2022-12-14 09:57:05','1983',1,938,'+1-423-844-0932'),
(611,'Pamela','Hart',95959057,'P-Hart75@hotmail.com','2022-12-14 09:57:05','1970',1,71,'539.315.3898'),
(612,'Linda','Bryan',73614673,'L.Bryan98@hotmail.com','2022-12-14 09:57:05','1976',1,116,'001-284-862-6175x76668'),
(613,'Steven','Lane',74750953,'S-Lane65@yahoo.com','2022-12-14 09:57:05','1994',1,591,'+1-180-724-5593x92552'),
(614,'William','Shaw',63258030,'W.Shaw59@hotmail.com','2022-12-14 09:57:05','1966',1,404,'4934169764'),
(615,'Todd','Baker',76515391,'T.Baker71@gmail.com','2022-12-14 09:57:05','1976',1,921,'770-991-0481x65814'),
(616,'Amanda','Barrett',52307869,'A_Barrett71@hotmail.com','2022-12-14 09:57:05','1978',1,18,'191.574.4692x31917'),
(617,'David','Rogers',52347847,'D-Rogers69@yahoo.com','2022-12-14 09:57:05','1998',1,909,'180.621.8910x36437'),
(618,'Jesse','Calderon',23388992,'J.Calderon84@hotmail.com','2022-12-14 09:57:05','1994',1,164,'535.277.6454x91823'),
(619,'Maria','Donovan',29074752,'M.Donovan99@yahoo.com','2022-12-14 09:57:05','1996',1,972,'+1-299-424-7305x5311'),
(620,'Daniel','Edwards',30286275,'D_Edwards99@yahoo.com','2022-12-14 09:57:05','1974',1,1,'(331)960-5056'),
(621,'Daniel','Collins',66696950,'D_Collins52@gmail.com','2022-12-14 09:57:05','1965',1,431,'011.229.0920x64340'),
(622,'Melissa','Ellis',80574449,'M.Ellis91@gmail.com','2022-12-14 09:57:05','1960',1,765,'513-660-9008x343'),
(623,'Sarah','Rivers',63684199,'S_Rivers84@yahoo.com','2022-12-14 09:57:05','1981',1,718,'171-589-7910'),
(624,'Cody','Glenn',64932409,'C-Glenn99@hotmail.com','2022-12-14 09:57:05','1948',1,312,'394-163-5392x02630'),
(625,'Kimberly','Schmidt',37051708,'K-Schmidt98@gmail.com','2022-12-14 09:57:05','1994',1,904,'527-365-4629'),
(626,'Lisa','Gutierrez',66398249,'L-Gutierrez69@gmail.com','2022-12-14 09:57:05','1990',1,750,'(948)578-1778'),
(627,'Todd','Dalton',77525064,'T-Dalton55@gmail.com','2022-12-14 09:57:05','1984',1,410,'194.982.3953x15410'),
(628,'Lisa','Brown',97600204,'L.Brown59@hotmail.com','2022-12-14 09:57:05','2003',1,500,'305.410.2916'),
(629,'Joshua','Pham',17672511,'J_Pham89@hotmail.com','2022-12-14 09:57:05','1987',1,201,'2255484665'),
(630,'Monique','Sanders',22635112,'M_Sanders83@gmail.com','2022-12-14 09:57:05','1994',1,870,'+1-507-175-8342'),
(631,'Lauren','Christian',73582188,'L_Christian65@hotmail.com','2022-12-14 09:57:05','1992',1,830,'+1-192-075-0262'),
(632,'Elizabeth','Shepherd',91671080,'E-Shepherd99@gmail.com','2022-12-14 09:57:05','1954',1,317,'001-888-255-1294'),
(633,'Johnny','Richardson',28894271,'J.Richardson61@hotmail.com','2022-12-14 09:57:05','1975',1,872,'(062)777-8693'),
(634,'Mary','Harvey',53109860,'M-Harvey95@hotmail.com','2022-12-14 09:57:05','1988',1,225,'950.063.8830x184'),
(635,'Megan','Wood',27011781,'M-Wood99@yahoo.com','2022-12-14 09:57:05','1994',1,926,'348-445-2274x684'),
(636,'Kaitlyn','Davis',69262952,'K-Davis54@yahoo.com','2022-12-14 09:57:05','1970',1,900,'232.276.1954x4672'),
(637,'Robert','Shannon',44279395,'R_Shannon78@gmail.com','2022-12-14 09:57:05','1969',1,598,'(966)504-5522'),
(638,'Brian','Rice',73794337,'B_Rice75@yahoo.com','2022-12-14 09:57:05','1966',1,396,'3987611908'),
(639,'Scott','Hobbs',53580550,'S.Hobbs65@yahoo.com','2022-12-14 09:57:05','1999',1,814,'866-087-7551'),
(640,'Walter','Hunt',31937558,'W.Hunt56@hotmail.com','2022-12-14 09:57:05','1960',1,141,'(675)973-2197x01565'),
(641,'Tonya','Miranda',71076385,'T.Miranda62@gmail.com','2022-12-14 09:57:05','1946',1,133,'287-498-1862'),
(642,'Jose','Cain',13472335,'J_Cain79@yahoo.com','2022-12-14 09:57:05','1981',1,364,'+1-029-804-3430x4627'),
(643,'Michael','Barber',82218590,'M.Barber70@yahoo.com','2022-12-14 09:57:05','1976',1,732,'4083841382'),
(644,'Norman','Goodwin',89264871,'N_Goodwin90@gmail.com','2022-12-14 09:57:05','1974',1,293,'107.394.1030x567'),
(645,'Chris','Dennis',62667700,'C_Dennis96@yahoo.com','2022-12-14 09:57:05','1973',1,531,'(693)024-1756'),
(646,'Dominique','Scott',34652741,'D.Scott90@hotmail.com','2022-12-14 09:57:05','1982',1,181,'761.914.9176x943'),
(647,'Steven','Patrick',44724213,'S-Patrick54@hotmail.com','2022-12-14 09:57:05','1980',1,725,'557-847-5270'),
(648,'Laurie','Stein',50639012,'L.Stein88@hotmail.com','2022-12-14 09:57:05','1960',1,110,'(054)911-2428'),
(649,'John','Patterson',22299408,'J-Patterson70@yahoo.com','2022-12-14 09:57:05','1984',1,425,'096-995-4653'),
(650,'Billy','Collins',82233475,'B.Collins81@gmail.com','2022-12-14 09:57:05','1970',1,216,'+1-834-723-2410x9930'),
(651,'Christina','Thompson',27051103,'C-Thompson51@hotmail.com','2022-12-14 09:57:05','1967',1,21,'481.436.3051x02797'),
(652,'Samantha','York',53345731,'S_York87@gmail.com','2022-12-14 09:57:05','1948',1,857,'7938921948'),
(653,'Christopher','Smith',14512624,'C-Smith51@gmail.com','2022-12-14 09:57:05','1957',1,710,'290.130.6958'),
(654,'Karen','Ferguson',61760931,'K-Ferguson66@yahoo.com','2022-12-14 09:57:05','2013',1,857,'(589)913-9796'),
(655,'Brittany','Morgan',69019849,'B_Morgan61@hotmail.com','2022-12-14 09:57:05','1978',1,739,'492.628.9876'),
(656,'Ashley','Alvarado',89493993,'A-Alvarado77@gmail.com','2022-12-14 09:57:05','1986',1,599,'+1-180-849-3287x6950'),
(657,'Amanda','Ball',77386773,'A_Ball95@gmail.com','2022-12-14 09:57:05','1961',1,372,'+1-795-849-9651x374'),
(658,'Seth','Moore',76269883,'S_Moore72@yahoo.com','2022-12-14 09:57:05','1991',1,2,'(661)242-4008x351'),
(659,'Nicholas','Hart',87573729,'N-Hart69@gmail.com','2022-12-14 09:57:05','1985',1,635,'001-810-889-8792x260'),
(660,'Jennifer','Simpson',37358780,'J-Simpson50@hotmail.com','2022-12-14 09:57:05','1985',1,825,'(424)816-3316x1348'),
(661,'Marcus','Peterson',37007753,'M.Peterson80@gmail.com','2022-12-14 09:57:05','1946',1,351,'744.628.0566'),
(662,'Samantha','Yang',42869348,'S.Yang57@hotmail.com','2022-12-14 09:57:05','1957',1,96,'001-339-427-9745'),
(663,'Logan','Waller',63836437,'L_Waller78@yahoo.com','2022-12-14 09:57:05','1978',1,784,'5209796119'),
(664,'Kayla','Jones',68169780,'K-Jones63@hotmail.com','2022-12-14 09:57:05','1938',1,857,'001-701-004-6362'),
(665,'Nathan','Porter',46677305,'N_Porter63@hotmail.com','2022-12-14 09:57:05','1960',1,576,'038-515-9045x9118'),
(666,'Mark','Walker',82434584,'M.Walker79@hotmail.com','2022-12-14 09:57:05','1985',1,962,'114.761.3160'),
(667,'Thomas','Warren',42304073,'T-Warren68@gmail.com','2022-12-14 09:57:05','1985',1,372,'247-614-5158x31968'),
(668,'Jesse','Franklin',90688758,'J-Franklin53@gmail.com','2022-12-14 09:57:05','1951',1,230,'446.335.8005x6386'),
(669,'Ryan','Marks',20733039,'R_Marks54@hotmail.com','2022-12-14 09:57:05','1986',1,29,'+1-315-844-4443x2499'),
(670,'Jason','Smith',30966924,'J-Smith94@gmail.com','2022-12-14 09:57:05','2002',1,925,'(325)520-9041x2220'),
(671,'Dana','Jones',32536075,'D_Jones79@hotmail.com','2022-12-14 09:57:05','1961',1,892,'(192)033-8535x6095'),
(672,'Karen','Brennan',92956695,'K_Brennan94@yahoo.com','2022-12-14 09:57:05','1944',1,795,'+1-011-659-2845x3926'),
(673,'Stephanie','Thomas',80671456,'S-Thomas83@hotmail.com','2022-12-14 09:57:05','2000',1,728,'508.876.2331x676'),
(674,'Steven','Holland',41479460,'S_Holland74@hotmail.com','2022-12-14 09:57:05','1998',1,956,'001-901-669-4532x236'),
(675,'Victoria','Perez',85334499,'V-Perez94@hotmail.com','2022-12-14 09:57:05','1984',1,282,'828-460-9569'),
(676,'Gail','Prince',74753591,'G_Prince53@gmail.com','2022-12-14 09:57:05','1983',1,592,'(282)253-0859x2838'),
(677,'Tamara','Page',22319325,'T.Page79@gmail.com','2022-12-14 09:57:05','2000',1,906,'976.923.7004'),
(678,'Heather','Boyle',72190134,'H.Boyle87@gmail.com','2022-12-14 09:57:05','2001',1,942,'(100)105-8420x98607'),
(679,'Steven','Luna',15904829,'S-Luna92@gmail.com','2022-12-14 09:57:05','1969',1,492,'+1-905-251-7620x83557'),
(680,'James','Serrano',72342170,'J.Serrano61@hotmail.com','2022-12-14 09:57:05','1946',1,862,'(464)137-6949x878'),
(681,'Damon','Young',92445320,'D.Young76@hotmail.com','2022-12-14 09:57:05','1972',1,23,'083.180.1505x74850'),
(682,'Richard','Thomas',57495450,'R_Thomas83@yahoo.com','2022-12-14 09:57:05','1967',1,90,'820.912.2819'),
(683,'Bryan','Simpson',49029272,'B.Simpson93@hotmail.com','2022-12-14 09:57:05','1945',1,492,'703-938-4594x01087'),
(684,'Raymond','Holland',43133086,'R_Holland85@hotmail.com','2022-12-14 09:57:05','1966',1,132,'230-105-7931'),
(685,'Keith','Shepherd',38337752,'K.Shepherd86@hotmail.com','2022-12-14 09:57:05','1968',1,326,'+1-547-621-5033x583'),
(686,'Cesar','Ward',80513435,'C-Ward93@gmail.com','2022-12-14 09:57:05','2000',1,64,'(819)640-2268x8077'),
(687,'Alexandra','Marsh',81900461,'A.Marsh63@yahoo.com','2022-12-14 09:57:05','1966',1,961,'585.766.4321'),
(688,'Nicole','Chavez',84790599,'N_Chavez83@yahoo.com','2022-12-14 09:57:05','1976',1,986,'001-112-530-6581'),
(689,'Andre','Allen',86297395,'A.Allen74@gmail.com','2022-12-14 09:57:05','1987',1,188,'+1-127-302-4755'),
(690,'Heidi','Brooks',99815688,'H-Brooks81@gmail.com','2022-12-14 09:57:05','1981',1,510,'(959)126-7742x4861'),
(691,'Nicholas','Simon',55631325,'N_Simon96@gmail.com','2022-12-14 09:57:05','2007',1,133,'849.186.1053'),
(692,'Richard','Scott',52536964,'R.Scott80@hotmail.com','2022-12-14 09:57:05','1975',1,308,'001-861-962-5355'),
(693,'Ashley','Williams',90887311,'A_Williams69@yahoo.com','2022-12-14 09:57:05','1970',1,334,'673.087.9396x660'),
(694,'Brenda','Santana',87183519,'B_Santana64@gmail.com','2022-12-14 09:57:05','1985',1,709,'001-837-079-1707'),
(695,'Katelyn','Hogan',47513713,'K-Hogan81@hotmail.com','2022-12-14 09:57:05','1973',1,516,'001-255-666-6131x9863'),
(696,'Christina','Pearson',16535230,'C_Pearson75@yahoo.com','2022-12-14 09:57:05','2010',1,287,'(678)524-5016'),
(697,'Emily','Luna',13547877,'E-Luna85@gmail.com','2022-12-14 09:57:05','1962',1,155,'5064211753'),
(698,'Haley','Hodges',65087534,'H.Hodges77@yahoo.com','2022-12-14 09:57:05','1948',1,421,'118.360.6634x0330'),
(699,'Michael','Cole',77278366,'M.Cole58@gmail.com','2022-12-14 09:57:05','1986',1,278,'001-293-657-6453x3371'),
(700,'Thomas','Riley',92866517,'T.Riley94@gmail.com','2022-12-14 09:57:05','1946',1,340,'001-043-255-7615'),
(701,'Ellen','Lara',17988814,'E_Lara82@gmail.com','2022-12-14 09:57:05','1970',1,353,'087-101-3653'),
(702,'Austin','Chambers',47280456,'A_Chambers85@hotmail.com','2022-12-14 09:57:05','1975',1,42,'+1-300-282-0508'),
(703,'Joseph','Anderson',99474842,'J-Anderson65@gmail.com','2022-12-14 09:57:05','1946',1,67,'001-422-301-6787x046'),
(704,'Dylan','Scott',37956912,'D-Scott76@gmail.com','2022-12-14 09:57:05','1963',1,553,'2546334321'),
(705,'Tara','Horne',41142854,'T-Horne56@gmail.com','2022-12-14 09:57:05','1983',1,972,'007.361.3108'),
(706,'Rebecca','Johnson',43831600,'R_Johnson55@yahoo.com','2022-12-14 09:57:05','1978',1,675,'253.371.1748x593'),
(707,'Kimberly','Miller',70363472,'K-Miller95@yahoo.com','2022-12-14 09:57:05','1986',1,919,'349.260.4100x7370'),
(708,'Joseph','Becker',22059482,'J.Becker95@hotmail.com','2022-12-14 09:57:05','1955',1,424,'645.329.8555'),
(709,'Amy','Barnes',24633134,'A_Barnes70@gmail.com','2022-12-14 09:57:05','1987',1,379,'001-039-317-5884x8183'),
(710,'Alexis','Byrd',28759739,'A_Byrd80@hotmail.com','2022-12-14 09:57:05','1993',1,825,'099.506.2891'),
(711,'Rachel','Dixon',71607286,'R_Dixon93@gmail.com','2022-12-14 09:57:05','1981',1,722,'674.979.1483x583'),
(712,'Nathaniel','Sanchez',11003412,'N.Sanchez88@hotmail.com','2022-12-14 09:57:05','1999',1,276,'001-939-389-4848x44447'),
(713,'Terri','Lewis',86702342,'T.Lewis56@gmail.com','2022-12-14 09:57:05','1959',1,186,'+1-948-953-3572'),
(714,'Chad','Thomas',23582928,'C.Thomas98@hotmail.com','2022-12-14 09:57:05','1949',1,452,'727-136-5660'),
(715,'Jacqueline','Dalton',30801215,'J.Dalton70@gmail.com','2022-12-14 09:57:05','1957',1,67,'001-562-842-4483x090'),
(716,'Denise','Neal',83830135,'D.Neal96@hotmail.com','2022-12-14 09:57:05','1981',1,816,'9647302845'),
(717,'Jason','Arnold',94969034,'J-Arnold68@hotmail.com','2022-12-14 09:57:05','1981',1,37,'+1-589-736-8048'),
(718,'Steven','Snow',15799690,'S_Snow77@gmail.com','2022-12-14 09:57:05','1975',1,140,'9598439816'),
(719,'Alisha','Marsh',74246539,'A.Marsh56@yahoo.com','2022-12-14 09:57:05','1984',1,384,'+1-141-699-5317x971'),
(720,'Joshua','Baker',22047775,'J.Baker67@yahoo.com','2022-12-14 09:57:05','1977',1,245,'834.387.3120x402'),
(721,'David','Cruz',51559354,'D.Cruz94@hotmail.com','2022-12-14 09:57:05','1957',1,982,'6970044219'),
(722,'Russell','Hale',20959030,'R.Hale95@gmail.com','2022-12-14 09:57:05','1973',1,654,'489-789-3716'),
(723,'Christina','Davis',23059550,'C_Davis85@hotmail.com','2022-12-14 09:57:05','1988',1,921,'524.237.6126'),
(724,'Miguel','Taylor',84975484,'M.Taylor91@gmail.com','2022-12-14 09:57:05','1975',1,352,'(080)387-0891x0093'),
(725,'Yolanda','Robbins',31625158,'Y-Robbins71@yahoo.com','2022-12-14 09:57:05','1944',1,992,'794.635.9482x2572'),
(726,'Erin','Mann',68233103,'E.Mann94@hotmail.com','2022-12-14 09:57:05','1970',1,174,'(393)057-4017x970'),
(727,'Kara','Garcia',38525740,'K_Garcia65@hotmail.com','2022-12-14 09:57:05','1963',1,22,'946-380-7701x0130'),
(728,'Ethan','Phillips',56983777,'E-Phillips81@yahoo.com','2022-12-14 09:57:05','1945',1,11,'952-693-5781x7896'),
(729,'Connie','Nguyen',33016882,'C_Nguyen64@hotmail.com','2022-12-14 09:57:05','1977',1,523,'+1-168-214-0047x01679'),
(730,'Stephanie','Nelson',19766371,'S_Nelson58@gmail.com','2022-12-14 09:57:05','1949',1,320,'+1-741-816-4138x299'),
(731,'Denise','Matthews',84127750,'D_Matthews89@gmail.com','2022-12-14 09:57:05','1956',1,325,'+1-825-411-1339x3158'),
(732,'Lauren','Jackson',75813739,'L_Jackson53@gmail.com','2022-12-14 09:57:05','1982',1,856,'717.216.7296x3025'),
(733,'Dustin','Ayala',62485320,'D-Ayala90@hotmail.com','2022-12-14 09:57:05','1995',1,286,'184-402-6508'),
(734,'Steven','Keller',19986527,'S-Keller50@hotmail.com','2022-12-14 09:57:05','1990',1,786,'708.162.6749x4739'),
(735,'Dennis','Bishop',78640478,'D-Bishop93@hotmail.com','2022-12-14 09:57:05','1961',1,414,'825.094.3975x7263'),
(736,'Erica','Carter',41742885,'E-Carter61@yahoo.com','2022-12-14 09:57:05','1943',1,703,'(613)215-4539'),
(737,'Seth','Green',79633939,'S-Green84@yahoo.com','2022-12-14 09:57:05','1981',1,114,'001-213-256-1162'),
(738,'Jeremy','Walker',44827349,'J.Walker71@gmail.com','2022-12-14 09:57:05','1954',1,151,'877-594-2724x63738'),
(739,'Melinda','Baker',63631826,'M-Baker73@yahoo.com','2022-12-14 09:57:05','1972',1,230,'466-387-1622x10726'),
(740,'David','Moore',66370719,'D-Moore80@hotmail.com','2022-12-14 09:57:05','1989',1,11,'(978)907-3443'),
(741,'Anthony','Porter',82330479,'A.Porter52@gmail.com','2022-12-14 09:57:05','1996',1,63,'888.875.8126x85023'),
(742,'Matthew','Mcconnell',92999939,'M.Mcconnell59@gmail.com','2022-12-14 09:57:05','1980',1,75,'001-179-797-5977x354'),
(743,'Amber','Palmer',30726023,'A.Palmer64@gmail.com','2022-12-14 09:57:05','1967',1,666,'276-570-8494x64937'),
(744,'Katrina','Brown',65740739,'K.Brown57@yahoo.com','2022-12-14 09:57:05','1984',1,599,'1620413598'),
(745,'Austin','Cunningham',75863759,'A.Cunningham61@yahoo.com','2022-12-14 09:57:05','1993',1,332,'9534231322'),
(746,'Marcus','Baker',14333859,'M-Baker68@yahoo.com','2022-12-14 09:57:05','1953',1,525,'+1-743-820-4587x85933'),
(747,'Kevin','Spencer',18250023,'K_Spencer70@hotmail.com','2022-12-14 09:57:05','1949',1,541,'(365)605-9348x8975'),
(748,'Michael','Melendez',37764193,'M-Melendez93@gmail.com','2022-12-14 09:57:05','1989',1,927,'018-763-3253x41438'),
(749,'Kimberly','Anderson',41180226,'K-Anderson50@hotmail.com','2022-12-14 09:57:05','1962',1,253,'+1-235-172-1322x109'),
(750,'Tracy','Garcia',17975596,'T.Garcia77@yahoo.com','2022-12-14 09:57:05','1954',1,914,'910-180-9893'),
(751,'Sarah','Reed',35346050,'S-Reed61@gmail.com','2022-12-14 09:57:05','1946',1,819,'0870724874'),
(752,'Christopher','Moore',14845652,'C-Moore87@gmail.com','2022-12-14 09:57:05','1981',1,307,'8165460993'),
(753,'Jacob','Sanders',98295417,'J.Sanders54@yahoo.com','2022-12-14 09:57:05','1966',1,130,'001-846-236-8616'),
(754,'Megan','Hendrix',73771136,'M.Hendrix98@gmail.com','2022-12-14 09:57:05','1951',1,550,'754.649.3360x11402'),
(755,'Erika','Conner',88864895,'E.Conner88@gmail.com','2022-12-14 09:57:05','1934',1,374,'+1-710-018-7172'),
(756,'Michael','Griffin',44211997,'M-Griffin69@hotmail.com','2022-12-14 09:57:05','1961',1,555,'761.167.9923'),
(757,'Brittany','Luna',65287452,'B_Luna95@gmail.com','2022-12-14 09:57:05','1972',1,113,'836-706-2557'),
(758,'Paul','Parker',61732642,'P-Parker80@hotmail.com','2022-12-14 09:57:05','1941',1,605,'534-283-2636x51447'),
(759,'Alison','Webster',79534401,'A_Webster50@yahoo.com','2022-12-14 09:57:05','1958',1,481,'(694)545-5937'),
(760,'Michael','Dodson',69678408,'M-Dodson75@yahoo.com','2022-12-14 09:57:05','1953',1,896,'553.502.5408'),
(761,'Emma','Mcgrath',18887309,'E-Mcgrath94@hotmail.com','2022-12-14 09:57:05','1987',1,766,'001-232-111-1006x08690'),
(762,'Michael','Ochoa',28653247,'M_Ochoa79@yahoo.com','2022-12-14 09:57:05','1978',1,255,'+1-665-867-8453x99021'),
(763,'Kenneth','Holloway',11432614,'K-Holloway62@gmail.com','2022-12-14 09:57:05','1993',1,695,'8343115934'),
(764,'Barbara','Shields',67116579,'B_Shields83@yahoo.com','2022-12-14 09:57:05','1963',1,691,'001-797-028-9134x0473'),
(765,'Daniel','Snow',41161452,'D_Snow52@hotmail.com','2022-12-14 09:57:05','1960',1,987,'0604003178'),
(766,'Daniel','Malone',44923723,'D.Malone50@yahoo.com','2022-12-14 09:57:05','1935',1,832,'+1-433-704-4461x77622'),
(767,'Melissa','Andrews',45807536,'M.Andrews95@hotmail.com','2022-12-14 09:57:05','1978',1,552,'444.908.9893x2810'),
(768,'Ricardo','Payne',51279545,'R.Payne66@hotmail.com','2022-12-14 09:57:05','1998',1,720,'001-902-519-8007x038'),
(769,'Pedro','Hernandez',93627177,'P.Hernandez52@yahoo.com','2022-12-14 09:57:05','1983',1,245,'528-794-4734'),
(770,'Darrell','Russell',14491564,'D_Russell70@yahoo.com','2022-12-14 09:57:05','1948',1,901,'(821)423-0321'),
(771,'Wayne','Adams',59708813,'W-Adams86@yahoo.com','2022-12-14 09:57:05','1957',1,754,'510.169.0736x90438'),
(772,'Stephen','Stanley',99646912,'S-Stanley60@yahoo.com','2022-12-14 09:57:05','1988',1,119,'130-495-9802'),
(773,'Patricia','Love',51777013,'P_Love72@yahoo.com','2022-12-14 09:57:05','2001',1,794,'065-210-5776'),
(774,'Benjamin','Torres',66214168,'B-Torres52@hotmail.com','2022-12-14 09:57:05','1946',1,76,'(334)010-5376'),
(775,'Noah','Ramirez',73139015,'N.Ramirez59@gmail.com','2022-12-14 09:57:05','1947',1,124,'214-483-8795x89260'),
(776,'Brian','Jackson',44629275,'B_Jackson67@yahoo.com','2022-12-14 09:57:05','1958',1,888,'903-409-2593x9356'),
(777,'Aaron','Olson',98600789,'A_Olson55@gmail.com','2022-12-14 09:57:05','1981',1,607,'(453)928-6400x0489'),
(778,'Rebecca','Freeman',60460634,'R.Freeman98@yahoo.com','2022-12-14 09:57:05','1949',1,130,'867.585.7745'),
(779,'Katelyn','Thomas',39460918,'K-Thomas65@yahoo.com','2022-12-14 09:57:05','1979',1,938,'255.066.3380x1984'),
(780,'Desiree','Haynes',82424336,'D-Haynes67@yahoo.com','2022-12-14 09:57:05','1988',1,680,'825-595-7525x07891'),
(781,'Robert','Underwood',70657208,'R-Underwood85@gmail.com','2022-12-14 09:57:05','1935',1,334,'+1-342-282-6396x258'),
(782,'Matthew','Parrish',14233466,'M_Parrish94@hotmail.com','2022-12-14 09:57:05','1970',1,943,'554-405-0767'),
(783,'Jasmine','Nicholson',86264910,'J_Nicholson79@yahoo.com','2022-12-14 09:57:05','1969',1,194,'001-816-792-0957x071'),
(784,'Steven','Thomas',11282922,'S_Thomas63@yahoo.com','2022-12-14 09:57:05','1978',1,337,'255.394.0615x282'),
(785,'Billy','Flores',43480678,'B.Flores72@hotmail.com','2022-12-14 09:57:05','1999',1,728,'6577262669'),
(786,'Julie','Lewis',25007327,'J_Lewis88@gmail.com','2022-12-14 09:57:05','1983',1,933,'+1-217-810-5541x94498'),
(787,'Kimberly','Wall',16339814,'K-Wall79@hotmail.com','2022-12-14 09:57:05','1953',1,519,'302.264.8969x2460'),
(788,'Andrew','Thomas',71712445,'A-Thomas98@hotmail.com','2022-12-14 09:57:05','1954',1,543,'8277406103'),
(789,'Kathleen','Zhang',11359168,'K_Zhang74@yahoo.com','2022-12-14 09:57:05','1983',1,896,'001-771-770-9092x67664'),
(790,'Andrew','Hodges',56668767,'A-Hodges76@gmail.com','2022-12-14 09:57:05','1960',1,956,'(150)497-0377'),
(791,'Elizabeth','Mercado',50114792,'E-Mercado99@gmail.com','2022-12-14 09:57:05','2003',1,21,'989-147-8114'),
(792,'Christopher','Duncan',27780327,'C_Duncan91@gmail.com','2022-12-14 09:57:05','1990',1,492,'001-255-829-5169x86641'),
(793,'Colleen','Jacobs',80277247,'C.Jacobs61@hotmail.com','2022-12-14 09:57:05','1988',1,508,'150.579.3670'),
(794,'Kristen','Glover',12169016,'K_Glover79@gmail.com','2022-12-14 09:57:05','1983',1,265,'+1-581-939-6390'),
(795,'Janice','King',13195205,'J.King62@yahoo.com','2022-12-14 09:57:05','1981',1,222,'385.222.5081'),
(796,'April','Camacho',34716046,'A.Camacho80@hotmail.com','2022-12-14 09:57:05','1959',1,581,'893-832-7753x8808'),
(797,'Paul','Benitez',73953235,'P-Benitez59@hotmail.com','2022-12-14 09:57:05','1942',1,582,'514.413.8584'),
(798,'Jason','Martinez',29018872,'J_Martinez86@gmail.com','2022-12-14 09:57:05','2001',1,169,'747.359.6056x93027'),
(799,'Mark','Sanchez',26887185,'M.Sanchez72@yahoo.com','2022-12-14 09:57:05','1980',1,626,'665.470.5340x5604'),
(800,'Phillip','Young',70026613,'P.Young62@yahoo.com','2022-12-14 09:57:05','1980',1,256,'(955)969-4607'),
(801,'Sarah','Johnson',60976801,'S_Johnson83@gmail.com','2022-12-14 09:57:05','1963',1,881,'9977088440'),
(802,'Jeffrey','Hubbard',52213390,'J_Hubbard72@gmail.com','2022-12-14 09:57:05','1962',1,382,'+1-851-675-9425x15600'),
(803,'Antonio','Gates',60399894,'A-Gates92@yahoo.com','2022-12-14 09:57:05','1967',1,754,'(505)255-4077'),
(804,'Kimberly','Greene',41186021,'K-Greene56@gmail.com','2022-12-14 09:57:05','1945',1,275,'322-749-0563x3992'),
(805,'Roger','Thomas',22350688,'R.Thomas51@hotmail.com','2022-12-14 09:57:05','1981',1,671,'+1-680-897-7572'),
(806,'Christopher','Davis',41655301,'C_Davis73@hotmail.com','2022-12-14 09:57:05','1975',1,356,'+1-551-288-6914x4130'),
(807,'Nancy','Walls',42795142,'N-Walls81@hotmail.com','2022-12-14 09:57:05','1999',1,727,'(166)025-8817'),
(808,'Sandra','Wheeler',43554532,'S_Wheeler61@gmail.com','2022-12-14 09:57:05','2007',1,746,'845.213.8034'),
(809,'Dale','Rodriguez',87323953,'D-Rodriguez73@hotmail.com','2022-12-14 09:57:05','1976',1,12,'594.631.8064'),
(810,'Lauren','Hernandez',58651747,'L.Hernandez69@yahoo.com','2022-12-14 09:57:05','1994',1,774,'908.033.6944x9141'),
(811,'Nicole','Garcia',15941637,'N_Garcia94@hotmail.com','2022-12-14 09:57:05','1970',1,196,'752.083.4390'),
(812,'Megan','Scott',30911360,'M.Scott56@gmail.com','2022-12-14 09:57:05','1954',1,109,'203.641.6760x871'),
(813,'Joseph','Dunlap',51397373,'J_Dunlap75@gmail.com','2022-12-14 09:57:05','1972',1,548,'002.372.9533'),
(814,'Samuel','Anderson',52335898,'S-Anderson74@gmail.com','2022-12-14 09:57:05','1989',1,571,'(302)391-9688x425'),
(815,'Jeffrey','Brown',49788523,'J_Brown81@gmail.com','2022-12-14 09:57:05','1998',1,545,'001-458-876-0780x61546'),
(816,'Joseph','Lee',89059833,'J_Lee89@gmail.com','2022-12-14 09:57:05','1948',1,301,'212-411-0265x73999'),
(817,'Sarah','Green',87271552,'S.Green82@hotmail.com','2022-12-14 09:57:05','1987',1,214,'720-249-0637x4353'),
(818,'Joshua','Waller',30890118,'J.Waller99@hotmail.com','2022-12-14 09:57:05','1964',1,537,'001-412-359-1830'),
(819,'David','Campos',50812156,'D.Campos80@yahoo.com','2022-12-14 09:57:05','1944',1,583,'001-876-828-3411'),
(820,'Richard','Martin',39968064,'R-Martin72@hotmail.com','2022-12-14 09:57:05','1984',1,152,'063-511-5128x31268'),
(821,'Kelli','Williams',55335891,'K_Williams63@gmail.com','2022-12-14 09:57:05','1974',1,747,'276-288-1268'),
(822,'Michael','Wise',71582848,'M.Wise50@yahoo.com','2022-12-14 09:57:05','1975',1,566,'+1-491-333-7167x46108'),
(823,'Susan','Lynch',26833651,'S-Lynch57@gmail.com','2022-12-14 09:57:05','1986',1,886,'4970291716'),
(824,'Jesse','Brown',99675340,'J.Brown87@yahoo.com','2022-12-14 09:57:05','2015',1,642,'488-046-9096x9413'),
(825,'Lauren','Meyer',36960224,'L_Meyer95@gmail.com','2022-12-14 09:57:05','1954',1,620,'001-829-373-3048x191'),
(826,'Thomas','Brown',26775137,'T_Brown50@hotmail.com','2022-12-14 09:57:05','1943',1,770,'509.801.1409x3468'),
(827,'Victor','Hernandez',11705263,'V-Hernandez83@hotmail.com','2022-12-14 09:57:05','1955',1,314,'(943)129-8335'),
(828,'Christian','Jones',77563971,'C_Jones59@yahoo.com','2022-12-14 09:57:05','1971',1,517,'(643)505-3241x520'),
(829,'Brian','Herrera',25466603,'B.Herrera92@gmail.com','2022-12-14 09:57:05','1976',1,182,'(823)840-1387'),
(830,'Aaron','Jackson',76164288,'A_Jackson79@hotmail.com','2022-12-14 09:57:05','1965',1,482,'(629)834-6211x7614'),
(831,'Christina','Key',40458563,'C_Key75@hotmail.com','2022-12-14 09:57:05','1972',1,587,'815-872-7783x841'),
(832,'Antonio','Mccoy',21511645,'A-Mccoy88@hotmail.com','2022-12-14 09:57:05','1981',1,856,'+1-655-845-8278'),
(833,'Linda','Brewer',63917382,'L-Brewer74@hotmail.com','2022-12-14 09:57:05','1983',1,739,'001-077-774-6130x0217'),
(834,'Juan','Johnson',72568385,'J-Johnson74@yahoo.com','2022-12-14 09:57:05','1978',1,125,'001-674-628-5204x771'),
(835,'Brian','Gomez',28277106,'B_Gomez94@hotmail.com','2022-12-14 09:57:05','1967',1,677,'(295)362-8971'),
(836,'Jerry','Snyder',63949599,'J-Snyder87@gmail.com','2022-12-14 09:57:05','1950',1,817,'378.928.0011x423'),
(837,'Katherine','Rodriguez',61347937,'K_Rodriguez58@yahoo.com','2022-12-14 09:57:05','1985',1,338,'3683873019'),
(838,'Douglas','Castillo',57504410,'D_Castillo93@yahoo.com','2022-12-14 09:57:05','2003',1,114,'0088885747'),
(839,'Aaron','Hall',24442788,'A-Hall72@gmail.com','2022-12-14 09:57:05','1978',1,77,'001-385-468-4624x6454'),
(840,'Amanda','Hampton',35193084,'A_Hampton63@hotmail.com','2022-12-14 09:57:05','1988',1,971,'5732092806'),
(841,'Darren','Shannon',48994304,'D_Shannon74@gmail.com','2022-12-14 09:57:05','1985',1,194,'148.745.6648x474'),
(842,'Kelsey','Leonard',49194893,'K-Leonard62@yahoo.com','2022-12-14 09:57:05','1946',1,624,'001-131-779-2581x27082'),
(843,'Kim','Baker',76669431,'K-Baker59@gmail.com','2022-12-14 09:57:05','1970',1,35,'001-010-645-6718x159'),
(844,'Cory','Clay',26692978,'C-Clay71@gmail.com','2022-12-14 09:57:05','2007',1,490,'340-500-2271x683'),
(845,'Crystal','Beck',71031418,'C_Beck66@yahoo.com','2022-12-14 09:57:05','1963',1,623,'(389)152-7485'),
(846,'Mercedes','Hartman',10299600,'M.Hartman59@hotmail.com','2022-12-14 09:57:05','1992',1,756,'(390)307-3283x30261'),
(847,'Nancy','Bell',15899198,'N_Bell88@yahoo.com','2022-12-14 09:57:05','1960',1,659,'(391)871-9995'),
(848,'Rachael','Bailey',23431562,'R_Bailey59@gmail.com','2022-12-14 09:57:05','1998',1,269,'001-691-304-7007x22932'),
(849,'Nicholas','Good',22206401,'N_Good93@hotmail.com','2022-12-14 09:57:05','1947',1,907,'167-028-6087x96310'),
(850,'Norman','Landry',39324678,'N-Landry86@hotmail.com','2022-12-14 09:57:05','1973',1,175,'961-028-7166x719'),
(851,'Kimberly','Wolfe',70299310,'K_Wolfe99@gmail.com','2022-12-14 09:57:05','1999',1,846,'+1-565-430-0459'),
(852,'Devon','Love',66495704,'D-Love83@yahoo.com','2022-12-14 09:57:05','1988',1,669,'(675)689-3515'),
(853,'Melissa','Collins',16335110,'M.Collins94@hotmail.com','2022-12-14 09:57:05','1975',1,209,'695-172-2741x76447'),
(854,'Mark','Donaldson',20272407,'M-Donaldson95@gmail.com','2022-12-14 09:57:05','1959',1,460,'001-366-173-3000x27404'),
(855,'Amy','Gray',96760571,'A.Gray85@gmail.com','2022-12-14 09:57:05','1942',1,839,'(172)381-0096'),
(856,'Robert','Weeks',99627626,'R_Weeks51@yahoo.com','2022-12-14 09:57:05','1993',1,732,'0632751808'),
(857,'Melissa','Velasquez',23870251,'M-Velasquez99@yahoo.com','2022-12-14 09:57:05','1987',1,975,'254-802-6235x063'),
(858,'Sylvia','Ayala',93195550,'S-Ayala81@yahoo.com','2022-12-14 09:57:05','1997',1,937,'+1-970-823-7739'),
(859,'Kerri','Bolton',15557597,'K-Bolton82@hotmail.com','2022-12-14 09:57:05','1987',1,364,'768-534-1181'),
(860,'Michael','Crosby',63043758,'M.Crosby84@yahoo.com','2022-12-14 09:57:05','1979',1,372,'(661)033-1112x35306'),
(861,'Peggy','Reynolds',56076141,'P-Reynolds68@yahoo.com','2022-12-14 09:57:05','1937',1,795,'190.226.2391x14715'),
(862,'Shawn','Wolfe',71834190,'S-Wolfe75@gmail.com','2022-12-14 09:57:05','1966',1,523,'214.809.2110x30145'),
(863,'Destiny','Gallagher',22660648,'D_Gallagher80@yahoo.com','2022-12-14 09:57:05','1958',1,170,'+1-829-973-3838'),
(864,'Amber','Wolfe',93420727,'A-Wolfe80@yahoo.com','2022-12-14 09:57:05','1947',1,133,'566-741-1724'),
(865,'Loretta','Pollard',22744590,'L-Pollard55@yahoo.com','2022-12-14 09:57:05','1998',1,441,'+1-208-169-3379'),
(866,'Nancy','Crawford',53045313,'N.Crawford72@gmail.com','2022-12-14 09:57:05','1984',1,63,'652-032-0998'),
(867,'Jennifer','Murray',79032616,'J-Murray97@hotmail.com','2022-12-14 09:57:05','1979',1,638,'401-163-8204'),
(868,'Paige','Wright',94816438,'P-Wright79@gmail.com','2022-12-14 09:57:05','1982',1,976,'570.746.2209'),
(869,'Briana','Young',40548152,'B.Young53@hotmail.com','2022-12-14 09:57:05','1954',1,544,'(295)673-6549'),
(870,'Tiffany','Carney',70941281,'T_Carney54@yahoo.com','2022-12-14 09:57:05','1948',1,739,'654-944-7881x52051'),
(871,'Justin','Boyd',40579926,'J.Boyd54@hotmail.com','2022-12-14 09:57:05','1959',1,273,'469-237-0596'),
(872,'Amanda','Gilbert',41141841,'A_Gilbert92@yahoo.com','2022-12-14 09:57:05','1978',1,953,'(141)319-4839x3276'),
(873,'Steven','Franklin',19843292,'S-Franklin76@hotmail.com','2022-12-14 09:57:05','2000',1,726,'845.170.9273'),
(874,'Kaitlyn','Gomez',33802553,'K_Gomez80@yahoo.com','2022-12-14 09:57:05','1981',1,533,'1544278883'),
(875,'Melissa','Freeman',34285463,'M_Freeman93@yahoo.com','2022-12-14 09:57:05','1988',1,682,'(390)148-7245x0413'),
(876,'Bill','Hernandez',38393051,'B.Hernandez71@gmail.com','2022-12-14 09:57:05','1973',1,778,'001-488-405-9708x3933'),
(877,'Christopher','Jones',62649719,'C-Jones57@gmail.com','2022-12-14 09:57:05','1978',1,229,'777.317.4899x0877'),
(878,'Anthony','Bailey',90185021,'A_Bailey61@gmail.com','2022-12-14 09:57:05','1972',1,922,'001-950-405-7153x1895'),
(879,'Kerri','Miles',46347784,'K-Miles72@gmail.com','2022-12-14 09:57:05','1950',1,528,'3269349377'),
(880,'Olivia','Solis',66954473,'O_Solis57@yahoo.com','2022-12-14 09:57:05','1981',1,562,'123.802.1882x0107'),
(881,'Michael','Hall',15200830,'M.Hall89@gmail.com','2022-12-14 09:57:05','1992',1,468,'397-226-7461'),
(882,'Darlene','Hopkins',85381457,'D.Hopkins69@yahoo.com','2022-12-14 09:57:05','1983',1,380,'024-904-3612x5772'),
(883,'Amy','Stewart',60218401,'A-Stewart62@yahoo.com','2022-12-14 09:57:05','1980',1,357,'364-141-0223x0446'),
(884,'Sophia','Brown',50494172,'S.Brown91@gmail.com','2022-12-14 09:57:05','1980',1,931,'324-753-5017'),
(885,'Yvonne','Cherry',69536874,'Y-Cherry72@hotmail.com','2022-12-14 09:57:05','1990',1,726,'685.348.4707x163'),
(886,'Jacob','Kelley',22004319,'J.Kelley87@gmail.com','2022-12-14 09:57:05','1956',1,191,'001-783-412-5239x87165'),
(887,'Sara','Brown',84129089,'S-Brown61@gmail.com','2022-12-14 09:57:05','1989',1,919,'001-554-865-4558'),
(888,'Andrew','Gomez',53982015,'A_Gomez60@gmail.com','2022-12-14 09:57:05','1947',1,326,'001-226-748-0652x90950'),
(889,'Kristine','Johnson',91360663,'K.Johnson85@gmail.com','2022-12-14 09:57:05','1947',1,465,'(331)681-3332'),
(890,'Jeffrey','Ramirez',69937900,'J_Ramirez58@yahoo.com','2022-12-14 09:57:05','2004',1,301,'494-207-6480'),
(891,'Jonathan','Lindsey',66197828,'J-Lindsey90@gmail.com','2022-12-14 09:57:05','1948',1,752,'250.219.7934x33571'),
(892,'Jeffrey','Bass',16148140,'J_Bass91@gmail.com','2022-12-14 09:57:05','1964',1,724,'(699)277-6807x6444'),
(893,'Aaron','Thomas',73316875,'A_Thomas91@yahoo.com','2022-12-14 09:57:05','1976',1,594,'001-365-000-6843x267'),
(894,'Anita','Baker',59671409,'A.Baker81@gmail.com','2022-12-14 09:57:05','2004',1,93,'(379)518-7104'),
(895,'Briana','Johnston',55089413,'B-Johnston67@hotmail.com','2022-12-14 09:57:05','1990',1,5,'+1-051-269-7721'),
(896,'Sergio','Moore',17129153,'S.Moore99@gmail.com','2022-12-14 09:57:05','1981',1,27,'(786)280-9862x121'),
(897,'Lisa','Munoz',35931449,'L_Munoz78@gmail.com','2022-12-14 09:57:05','1950',1,287,'(695)481-1505x053'),
(898,'Nicholas','Flynn',48999148,'N_Flynn63@gmail.com','2022-12-14 09:57:05','1967',1,966,'394.163.3452x165'),
(899,'Scott','Moreno',12327829,'S-Moreno78@gmail.com','2022-12-14 09:57:05','1968',1,105,'001-269-978-2567'),
(900,'Kimberly','Thomas',28900899,'K_Thomas87@yahoo.com','2022-12-14 09:57:05','1984',1,7,'750.485.1198x13600'),
(901,'Christopher','Jackson',34306022,'C-Jackson54@yahoo.com','2022-12-14 09:57:05','1970',1,146,'001-702-168-4838'),
(902,'Timothy','Harmon',35295904,'T.Harmon75@yahoo.com','2022-12-14 09:57:05','2001',1,622,'+1-456-002-3312'),
(903,'David','Hartman',43228697,'D_Hartman60@yahoo.com','2022-12-14 09:57:05','1996',1,607,'(326)569-5997'),
(904,'Rodney','Garcia',55030260,'R-Garcia65@gmail.com','2022-12-14 09:57:05','1943',1,854,'665-664-5162x0286'),
(905,'Barbara','Smith',70629866,'B-Smith78@gmail.com','2022-12-14 09:57:05','1980',1,467,'0818021416'),
(906,'Kelly','Jackson',77798678,'K_Jackson54@yahoo.com','2022-12-14 09:57:05','1941',1,380,'+1-274-541-5830x89168'),
(907,'Latasha','Johnston',38092727,'L_Johnston72@gmail.com','2022-12-14 09:57:05','1957',1,13,'491-883-9153'),
(908,'Justin','Schmidt',74757373,'J.Schmidt97@gmail.com','2022-12-14 09:57:05','1948',1,644,'903-872-0059x076'),
(909,'Taylor','Mcmahon',99142266,'T.Mcmahon74@gmail.com','2022-12-14 09:57:05','1950',1,806,'(573)374-2542'),
(910,'Susan','Gomez',40800942,'S_Gomez61@yahoo.com','2022-12-14 09:57:05','1963',1,97,'091-400-1273'),
(911,'Jacqueline','Moss',63521321,'J-Moss51@gmail.com','2022-12-14 09:57:05','1949',1,926,'001-245-677-0237x1906'),
(912,'Makayla','Cherry',65000883,'M.Cherry84@hotmail.com','2022-12-14 09:57:05','1976',1,80,'+1-080-361-8333x63649'),
(913,'Patricia','Ruiz',53046954,'P-Ruiz75@yahoo.com','2022-12-14 09:57:05','1954',1,731,'071.111.7190x2034'),
(914,'Tanya','Mccullough',45739845,'T_Mccullough92@yahoo.com','2022-12-14 09:57:05','1979',1,364,'001-536-163-7974x7575'),
(915,'Chad','Nelson',85233538,'C_Nelson86@hotmail.com','2022-12-14 09:57:05','1984',1,840,'617-832-9589x4599'),
(916,'Anna','Wright',88827419,'A-Wright95@gmail.com','2022-12-14 09:57:05','2002',1,226,'001-191-000-8850x129'),
(917,'Nancy','Bradley',68491109,'N_Bradley84@gmail.com','2022-12-14 09:57:05','1970',1,411,'3318699976'),
(918,'Amanda','Joseph',85043463,'A-Joseph88@gmail.com','2022-12-14 09:57:05','1983',1,556,'404.725.9337x894'),
(919,'Rachel','Price',90146045,'R_Price74@hotmail.com','2022-12-14 09:57:05','1976',1,29,'(429)469-6640'),
(920,'Judith','Page',88258413,'J_Page68@hotmail.com','2022-12-14 09:57:05','1974',1,56,'001-221-348-5365x8268'),
(921,'Roy','Knight',99482607,'R_Knight76@yahoo.com','2022-12-14 09:57:05','1938',1,253,'513-052-3053'),
(922,'Amanda','Johnson',84718234,'A_Johnson94@gmail.com','2022-12-14 09:57:05','1949',1,885,'576.961.4511x22881'),
(923,'Kerry','Stevens',52172865,'K.Stevens71@yahoo.com','2022-12-14 09:57:05','1970',1,343,'4919437880'),
(924,'Eddie','Mercado',66509119,'E-Mercado80@gmail.com','2022-12-14 09:57:05','1962',1,751,'3431207651'),
(925,'Rebecca','Sawyer',77650639,'R_Sawyer74@hotmail.com','2022-12-14 09:57:05','1955',1,835,'3454486455'),
(926,'Jason','Huynh',53654329,'J.Huynh99@yahoo.com','2022-12-14 09:57:05','1957',1,407,'+1-873-287-5976x711'),
(927,'Angela','Miller',96454515,'A.Miller61@gmail.com','2022-12-14 09:57:05','1939',1,999,'3796356277'),
(928,'Michael','Harrison',24223085,'M.Harrison65@gmail.com','2022-12-14 09:57:05','1945',1,54,'001-515-172-9115x56851'),
(929,'Carrie','Gonzalez',72033965,'C.Gonzalez71@yahoo.com','2022-12-14 09:57:05','1979',1,967,'(165)385-6974x6250'),
(930,'Michael','Lowe',78446229,'M_Lowe50@yahoo.com','2022-12-14 09:57:05','1991',1,558,'001-455-173-7248x521'),
(931,'Vincent','Collins',57961727,'V.Collins50@yahoo.com','2022-12-14 09:57:05','1968',1,689,'+1-024-571-2062x98829'),
(932,'Madeline','Walker',60869583,'M.Walker92@yahoo.com','2022-12-14 09:57:05','1985',1,189,'176.439.0745x1815'),
(933,'Charles','Chan',61170876,'C-Chan52@gmail.com','2022-12-14 09:57:05','1967',1,979,'314-676-8766x64804'),
(934,'Anthony','Gonzales',64626502,'A_Gonzales68@yahoo.com','2022-12-14 09:57:05','1969',1,759,'749.345.8463x11387'),
(935,'Richard','Walsh',87898882,'R.Walsh97@yahoo.com','2022-12-14 09:57:05','1958',1,240,'+1-944-423-7811'),
(936,'Alexis','Wade',62595174,'A-Wade57@gmail.com','2022-12-14 09:57:05','1956',1,173,'508-946-3117x16524'),
(937,'Alan','Mitchell',84349339,'A.Mitchell81@hotmail.com','2022-12-14 09:57:05','1994',1,24,'(000)596-1939x0163'),
(938,'Meghan','Carpenter',95357326,'M_Carpenter96@hotmail.com','2022-12-14 09:57:05','1972',1,341,'511.828.5115x20682'),
(939,'Rebecca','Wallace',12932225,'R-Wallace50@hotmail.com','2022-12-14 09:57:05','1982',1,840,'+1-502-336-2939x7337'),
(940,'Paul','Wagner',48688959,'P_Wagner93@yahoo.com','2022-12-14 09:57:05','1974',1,320,'407.660.0789x5649'),
(941,'Emma','Wilcox',74482337,'E.Wilcox59@yahoo.com','2022-12-14 09:57:05','1963',1,242,'(297)941-9123x1867'),
(942,'Randy','Peterson',61684913,'R.Peterson54@gmail.com','2022-12-14 09:57:05','1999',1,491,'(960)910-0448'),
(943,'Taylor','Arnold',70142677,'T.Arnold93@gmail.com','2022-12-14 09:57:05','1981',1,357,'501.188.3542x08655'),
(944,'Gary','Rodriguez',41836134,'G.Rodriguez54@gmail.com','2022-12-14 09:57:05','1954',1,342,'001-856-372-8898x800'),
(945,'Walter','Harris',98346503,'W.Harris92@gmail.com','2022-12-14 09:57:05','1946',1,863,'644.194.7191x14522'),
(946,'Karen','Heath',15810939,'K.Heath97@yahoo.com','2022-12-14 09:57:05','1978',1,664,'001-912-300-5103x3106'),
(947,'Terry','White',57930885,'T_White89@hotmail.com','2022-12-14 09:57:05','1964',1,961,'326-608-5992'),
(948,'Rebecca','Hoffman',20792823,'R_Hoffman68@hotmail.com','2022-12-14 09:57:05','1970',1,267,'8798151532'),
(949,'Jodi','Lane',62988871,'J_Lane58@yahoo.com','2022-12-14 09:57:05','1978',1,747,'(274)808-5914x5311'),
(950,'Thomas','Mendoza',18956622,'T_Mendoza73@yahoo.com','2022-12-14 09:57:05','1973',1,937,'(127)276-6404x5585'),
(951,'James','Smith',70434578,'J.Smith79@yahoo.com','2022-12-14 09:57:05','1948',1,62,'001-463-183-2413x734'),
(952,'Shelley','Boone',73692726,'S-Boone65@hotmail.com','2022-12-14 09:57:05','1979',1,497,'883-492-7391x4820'),
(953,'Brad','Martin',65720107,'B_Martin74@hotmail.com','2022-12-14 09:57:05','1999',1,419,'001-439-109-1673'),
(954,'Brandon','Jenkins',48515945,'B-Jenkins67@hotmail.com','2022-12-14 09:57:05','1957',1,146,'358.715.2565'),
(955,'Stacy','Miller',95990979,'S.Miller56@hotmail.com','2022-12-14 09:57:05','1953',1,457,'(241)197-0123'),
(956,'Cynthia','Ellison',57138857,'C-Ellison66@yahoo.com','2022-12-14 09:57:05','1986',1,305,'001-231-910-9356x8809'),
(957,'Patrick','Maldonado',46101502,'P-Maldonado92@gmail.com','2022-12-14 09:57:05','1972',1,319,'001-016-519-3343'),
(958,'Diane','Hill',35302635,'D.Hill95@gmail.com','2022-12-14 09:57:05','1999',1,920,'(276)449-4732'),
(959,'Stephanie','Taylor',37032787,'S_Taylor87@hotmail.com','2022-12-14 09:57:05','1984',1,377,'813-771-0278'),
(960,'Angela','Ramirez',79812785,'A-Ramirez73@gmail.com','2022-12-14 09:57:05','1978',1,885,'026-713-0205x2873'),
(961,'Rebecca','Parsons',41491051,'R-Parsons85@gmail.com','2022-12-14 09:57:05','1971',1,455,'803.967.1085x33689'),
(962,'Heather','Butler',86636182,'H-Butler56@yahoo.com','2022-12-14 09:57:05','1993',1,621,'8095080802'),
(963,'Breanna','Mueller',95606578,'B_Mueller91@hotmail.com','2022-12-14 09:57:05','1979',1,899,'580.563.3046x30864'),
(964,'Robert','Gilmore',50441221,'R-Gilmore99@yahoo.com','2022-12-14 09:57:05','1953',1,47,'240.783.4348x4484'),
(965,'Sharon','Castro',80115271,'S-Castro73@hotmail.com','2022-12-14 09:57:05','1967',1,734,'(924)526-6151'),
(966,'Robert','White',70602216,'R.White50@hotmail.com','2022-12-14 09:57:05','1983',1,987,'286.238.6060'),
(967,'Jessica','Fox',14980976,'J_Fox84@yahoo.com','2022-12-14 09:57:05','1997',1,326,'(176)720-8329x7625'),
(968,'Craig','Baker',60827119,'C-Baker87@hotmail.com','2022-12-14 09:57:05','1966',1,933,'+1-925-845-0734x85477'),
(969,'Wendy','Ramirez',64167282,'W_Ramirez83@yahoo.com','2022-12-14 09:57:05','1973',1,10,'+1-743-475-5627'),
(970,'Kimberly','Fry',45340843,'K.Fry75@gmail.com','2022-12-14 09:57:05','1964',1,18,'+1-110-358-6198'),
(971,'Kenneth','Baker',16335503,'K-Baker79@hotmail.com','2022-12-14 09:57:05','1973',1,499,'1369276755'),
(972,'Pam','Horton',76808828,'P-Horton70@gmail.com','2022-12-14 09:57:05','1998',1,137,'(501)751-3230'),
(973,'Michael','Price',38858490,'M-Price92@yahoo.com','2022-12-14 09:57:05','1967',1,833,'600.784.1700x94855'),
(974,'Sarah','Craig',55691334,'S.Craig74@hotmail.com','2022-12-14 09:57:05','1948',1,109,'+1-456-623-6095x09434'),
(975,'Angela','Simmons',29793863,'A_Simmons75@gmail.com','2022-12-14 09:57:05','1951',1,499,'+1-741-986-8710x24291'),
(976,'James','Wagner',14470309,'J-Wagner91@gmail.com','2022-12-14 09:57:05','1930',1,532,'001-259-417-5424x824'),
(977,'Erica','Hobbs',68806174,'E_Hobbs63@gmail.com','2022-12-14 09:57:05','2002',1,954,'+1-837-095-9380x2290'),
(978,'Carolyn','Powell',55425417,'C-Powell61@yahoo.com','2022-12-14 09:57:05','1977',1,600,'728.517.3443'),
(979,'Maria','Jones',73233559,'M_Jones84@gmail.com','2022-12-14 09:57:05','1973',1,983,'480-573-6990x571'),
(980,'Emily','Davidson',14554771,'E-Davidson94@gmail.com','2022-12-14 09:57:05','1969',1,610,'(096)861-3077x445'),
(981,'Melody','Howard',51866939,'M.Howard58@gmail.com','2022-12-14 09:57:05','1969',1,289,'(413)028-7505'),
(982,'William','Simpson',34572980,'W.Simpson59@gmail.com','2022-12-14 09:57:05','1973',1,392,'001-021-494-4307'),
(983,'Alexa','Green',30981062,'A.Green97@gmail.com','2022-12-14 09:57:05','1985',1,335,'237-046-5257x515'),
(984,'Shawn','Baker',18367039,'S.Baker76@gmail.com','2022-12-14 09:57:05','2000',1,810,'001-141-391-6294x82312'),
(985,'Benjamin','Smith',58334123,'B-Smith91@hotmail.com','2022-12-14 09:57:05','1968',1,856,'(505)831-0453'),
(986,'Christopher','Long',81868779,'C_Long94@hotmail.com','2022-12-14 09:57:05','1962',1,985,'+1-534-289-9126x573'),
(987,'Pamela','Fisher',82015047,'P-Fisher88@gmail.com','2022-12-14 09:57:05','1982',1,129,'001-831-504-6948x32002'),
(988,'Kenneth','Clark',48964986,'K-Clark85@yahoo.com','2022-12-14 09:57:05','1970',1,399,'899.971.9696x19719'),
(989,'Andrew','Carter',77970103,'A.Carter83@yahoo.com','2022-12-14 09:57:05','1970',1,668,'+1-220-898-7536x6008'),
(990,'Jack','Washington',85767421,'J-Washington70@gmail.com','2022-12-14 09:57:05','1962',1,412,'1156878666'),
(991,'Randy','Turner',36801363,'R.Turner73@yahoo.com','2022-12-14 09:57:05','1988',1,371,'789.338.2307'),
(992,'Amy','King',69450125,'A.King75@yahoo.com','2022-12-14 09:57:05','1970',1,957,'333.607.1012'),
(993,'Courtney','Wilson',46126822,'C.Wilson61@hotmail.com','2022-12-14 09:57:05','1964',1,26,'(865)372-9547'),
(994,'Maria','Petersen',71307954,'M-Petersen94@hotmail.com','2022-12-14 09:57:05','1985',1,321,'3074633789'),
(995,'Louis','Morgan',45885622,'L-Morgan71@yahoo.com','2022-12-14 09:57:05','2000',1,192,'(238)783-5398x330'),
(996,'Linda','Bass',60755040,'L_Bass63@yahoo.com','2022-12-14 09:57:05','1972',1,399,'551.664.7681x980'),
(997,'Brent','Farmer',24977310,'B.Farmer52@hotmail.com','2022-12-14 09:57:05','1966',1,852,'+1-331-789-7966x9454'),
(998,'Amy','Stanley',46421591,'A.Stanley93@yahoo.com','2022-12-14 09:57:05','1975',1,317,'(879)688-9062x03782'),
(999,'Robert','Larson',93390587,'R.Larson51@gmail.com','2022-12-14 09:57:05','1957',1,274,'001-662-194-4568x84383');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vteams'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `charging_station_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `charging_station_add`(
    z_id INT,
    z_position TEXT,
    z_occupied TINYINT(1)
)
    MODIFIES SQL DATA
BEGIN
INSERT INTO charging_station (charging_zone_id, position, occupied)
VALUES (z_id, ST_GeomFromGeoJSON(z_position), z_occupied);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `charging_zone_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `charging_zone_add`(
    p_id INT,
    z_area TEXT
)
    MODIFIES SQL DATA
BEGIN
    INSERT INTO charging_zone (parking_zone_id, area)
    VALUES (p_id, ST_GeomFromGeoJSON(z_area));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_charging_station` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `delete_charging_station`(s_id INT)
    MODIFIES SQL DATA
BEGIN
DELETE FROM charging_station
WHERE id = s_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_charging_zone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `delete_charging_zone`(
    z_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM charging_zone WHERE id = z_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `delete_invoice`(
    i_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM invoice WHERE id = i_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_parking_zone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `delete_parking_zone`(
    z_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM parking_zone WHERE id = z_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_scooter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `delete_scooter`(
    s_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM scooter WHERE id = s_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_trip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `delete_trip`(
    t_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM trip WHERE id = t_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `delete_user`(
    u_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM user WHERE id = u_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `disable_scooter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `disable_scooter`(
    s_id INT
)
BEGIN
    UPDATE scooter
    SET enabled = 0
    WHERE id = s_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `enable_scooter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `enable_scooter`(
    s_id INT
)
BEGIN
    UPDATE scooter
    SET enabled = 1
    WHERE id = s_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `invoice_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `invoice_add`(
    t_id INT,
    i_amount FLOAT
)
    MODIFIES SQL DATA
BEGIN
    INSERT INTO invoice (trip_id, amount)
    VALUES (t_id, i_amount);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `invoice_pay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `invoice_pay`(
    i_id INT
)
    MODIFIES SQL DATA
BEGIN
    UPDATE invoice
    SET payed = CURRENT_TIMESTAMP()
    WHERE id = i_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `parking_zone_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `parking_zone_add`(
    c_id INT,
    z_area TEXT
)
    MODIFIES SQL DATA
BEGIN
    INSERT INTO parking_zone (city_id, area)
    VALUES (c_id, ST_GeomFromGeoJSON(z_area));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `scooter_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `scooter_add`(
    s_available TINYINT(1),
    s_enabled TINYINT(1),
    s_charge FLOAT,
    s_last_position TEXT,
    s_is_charging TINYINT(1),
    c_id INT
)
BEGIN
    INSERT INTO scooter (available, enabled, charge, last_position, is_charging, city_id)
    VALUES (s_available, s_enabled, s_charge, ST_GeomFromGeoJSON(s_last_position), s_is_charging, c_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `scooter_log_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `scooter_log_add`(
    s_id INT,
    s_speed INT,
    s_position TEXT,
    s_status VARCHAR(20),
    s_charge INT
)
BEGIN
    INSERT INTO scooter_log (scooter_id, speed, position, status, charge)
    VALUES (s_id, s_speed, ST_GeomFromGeoJSON(s_position), s_status, s_charge);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `scooter_log_maintenance_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `scooter_log_maintenance_add`(
    s_id INT,
    l_event VARCHAR(100),
    l_invoked_by VARCHAR(20)
)
BEGIN
    INSERT INTO maintenance_log (scooter_id, event, invoked_by)
    VALUES (s_id, l_event, l_invoked_by);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_charging_station_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_charging_station_all`()
    READS SQL DATA
BEGIN
SELECT id,
    charging_zone_id,
    ST_AsGeoJSON(position) as position,
    occupied,
    scooter_id
FROM charging_station;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_charging_station_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_charging_station_id`(s_id INT)
BEGIN
SELECT id,
    charging_zone_id,
    ST_AsGeoJSON(position) as position,
    occupied,
    scooter_id
FROM charging_station
WHERE id = s_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_charging_station_zone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_charging_station_zone`(z_id INT)
BEGIN
SELECT id,
    charging_zone_id,
    ST_AsGeoJSON(position) as position,
    occupied,
    scooter_id
FROM charging_station
WHERE charging_zone_id = z_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_charging_zone_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_charging_zone_all`()
    READS SQL DATA
BEGIN
    SELECT  id,
            parking_zone_id,
            ST_AsGeoJSON(area) AS area
    FROM charging_zone;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_charging_zone_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_charging_zone_city`(
    c_name VARCHAR(45)
)
    READS SQL DATA
BEGIN
    SELECT
        id,
        parking_zone_id,
        ST_AsGeoJSON(area) as area
    FROM charging_zone 
    WHERE parking_zone_id IN
        (SELECT id from parking_zone 
        WHERE city_id = 
            (SELECT id 
            FROM city 
            WHERE name = c_name));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_charging_zone_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_charging_zone_id`(
    z_id INT
)
    READS SQL DATA
BEGIN
    SELECT
        id,
        parking_zone_id,
        ST_AsGeoJSON(area) as area
    FROM charging_zone WHERE id = z_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_city_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_city_all`()
    READS SQL DATA
BEGIN
    SELECT  *
    FROM city;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_invoice_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_invoice_all`()
    READS SQL DATA
BEGIN
    SELECT *
    FROM invoice;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_invoice_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_invoice_id`(
    i_id INT
)
    READS SQL DATA
BEGIN
    SELECT *
    FROM invoice WHERE id = i_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_invoice_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_invoice_user`(
    u_id INT
)
    READS SQL DATA
BEGIN
    SELECT *
    FROM invoice WHERE trip_id IN
        (SELECT id
        FROM trip 
        WHERE user_id = u_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_parking_zone_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_parking_zone_all`()
    READS SQL DATA
BEGIN
    SELECT 
        id,
        city_id,
        ST_AsGeoJSON(area) AS area
    FROM parking_zone;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_parking_zone_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_parking_zone_city`(
    c_name VARCHAR(45)
)
    READS SQL DATA
BEGIN
    SELECT  id,
            city_id,
            ST_AsGeoJSON(area) as area
    FROM parking_zone WHERE city_id = 
        (SELECT id
        FROM city
        WHERE name = c_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_parking_zone_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_parking_zone_id`(
    p_id INT
)
    READS SQL DATA
BEGIN
    SELECT  id,
            city_id,
            ST_AsGeoJSON(area) as area
    FROM parking_zone WHERE id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_scooter_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_scooter_all`()
    READS SQL DATA
BEGIN
    SELECT  id,
            available,
            enabled,
            charge,
            DATE_FORMAT(last_serviced, '%Y-%m-%d %H:%i:%s') as last_serviced,
            DATE_FORMAT(first_used, '%Y-%m-%d %H:%i:%s') as first_used,
            distance_traveled,
            ST_AsGeoJSON(last_position) as last_position,
            is_charging,
            city_id
    FROM scooter;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_scooter_available` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_scooter_available`()
    READS SQL DATA
BEGIN
    SELECT  id,
            available,
            enabled,
            charge,
            DATE_FORMAT(last_serviced, '%Y-%m-%d %H:%i:%s') as last_serviced,
            DATE_FORMAT(first_used, '%Y-%m-%d %H:%i:%s') as first_used,
            distance_traveled,
            ST_AsGeoJSON(last_position) as last_position,
            is_charging,
            city_id
    FROM scooter WHERE available = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_scooter_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_scooter_city`(
    c_name VARCHAR(45)
)
    READS SQL DATA
BEGIN
    SELECT  id,
            available,
            enabled,
            charge,
            DATE_FORMAT(last_serviced, '%Y-%m-%d %H:%i:%s') as last_serviced,
            DATE_FORMAT(first_used, '%Y-%m-%d %H:%i:%s') as first_used,
            distance_traveled,
            ST_AsGeoJSON(last_position) as last_position,
            is_charging,
            city_id
    FROM scooter WHERE city_id = 
        (SELECT id FROM city
        WHERE name = c_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_scooter_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_scooter_id`(
    s_id INT
)
    READS SQL DATA
BEGIN
    SELECT  id,
            available,
            enabled,
            charge,
            DATE_FORMAT(last_serviced, '%Y-%m-%d %H:%i:%s') as last_serviced,
            DATE_FORMAT(first_used, '%Y-%m-%d %H:%i:%s') as first_used,
            distance_traveled,
            ST_AsGeoJSON(last_position) as last_position,
            is_charging,
            city_id
    FROM scooter WHERE id = s_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_scooter_logs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_scooter_logs`(
    s_id INT
)
    READS SQL DATA
BEGIN
    SELECT  * FROM scooter_log 
    WHERE scooter_id = s_id
    ORDER BY 'timestamp' DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_scooter_logs_maintenance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_scooter_logs_maintenance`(
    s_id INT
)
    READS SQL DATA
BEGIN
    SELECT  * FROM maintenance_log 
    WHERE scooter_id = s_id
    ORDER BY 'timestamp' DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_trip_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_trip_all`()
    READS SQL DATA
BEGIN
    SELECT  id,
            user_id,
            scooter_id,
            distance,
            completed,
            ST_AsGeoJSON(start_position) as start_position,
            ST_AsGeoJSON(stop_position) as stop_position,
            DATE_FORMAT(start_time, '%Y-%m-%d %H:%i:%s') as start_time,
            DATE_FORMAT(stop_time, '%Y-%m-%d %H:%i:%s') as stop_time
    FROM trip;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_trip_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_trip_id`(
    t_id INT
)
    READS SQL DATA
BEGIN
    SELECT  id,
            user_id,
            scooter_id,
            distance,
            completed,
            ST_AsGeoJSON(start_position) as start_position,
            ST_AsGeoJSON(stop_position) as stop_position,
            DATE_FORMAT(start_time, '%Y-%m-%d %H:%i:%s') as start_time,
            DATE_FORMAT(stop_time, '%Y-%m-%d %H:%i:%s') as stop_time
    FROM trip WHERE id = t_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_trip_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_trip_user`(
    u_id INT
)
    READS SQL DATA
BEGIN
    SELECT  id,
            user_id,
            scooter_id,
            distance,
            completed,
            ST_AsGeoJSON(start_position) as start_position,
            ST_AsGeoJSON(stop_position) as stop_position,
            DATE_FORMAT(start_time, '%Y-%m-%d %H:%i:%s') as start_time,
            IF(stop_time,date_format(stop_time, '%Y-%m-%d %H:%i:%s'),NULL) as stop_time
    FROM trip WHERE user_id = u_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_user_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_user_all`()
    READS SQL DATA
BEGIN
SELECT *
FROM user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_user_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_user_id`(u_id INT)
    READS SQL DATA
BEGIN
SELECT *
FROM user
WHERE id = u_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_user_token` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_user_token`(u_token VARCHAR(45))
    READS SQL DATA
BEGIN
SELECT *
FROM user
WHERE token = u_token;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `trip_stop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `trip_stop`(
    t_id INT,
    stop_position TEXT
)
BEGIN
    UPDATE trip
    SET stop_position  = ST_GeomFromGeoJSON(t_stop_position),
        stop_time      = CURRENT_TIMESTAMP()
    WHERE id = t_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_charging_station` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `update_charging_station`(
    s_id INT,
    z_id INT,
    s_position TEXT,
    s_occupied TINYINT(1)
)
BEGIN
UPDATE charging_station
SET charging_zone_id = z_id,
    position = ST_GeomFromGeoJSON(s_position),
    occupied = s_occupied
WHERE id = s_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_charging_zone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `update_charging_zone`(
    z_id INT,
    parking_z_id INT,
    z_area TEXT
)
BEGIN
    UPDATE charging_zone
    SET parking_zone_id = parking_z_id,
        area            = ST_GeomFromGeoJSON(z_area)
    WHERE id = z_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `update_invoice`(
    i_id INT,
    t_id INT,
    i_amount FLOAT
)
BEGIN
    UPDATE invoice
    SET trip_id      = t_id,
        amount       = i_amount
    WHERE id = i_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_parking_zone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `update_parking_zone`(
    z_id INT,
    c_id INT,
    z_area TEXT
)
BEGIN
    UPDATE parking_zone
    SET city_id       = c_id,
        area          = ST_GeomFromGeoJSON(z_area)
    WHERE id = z_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_scooter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `update_scooter`(
    s_id INT,
    s_available TINYINT(1),
    s_enabled TINYINT(1),
    s_charge FLOAT,
    s_last_serviced DATETIME,
    s_first_used DATETIME,
    s_distance_traveled FLOAT,
    s_last_position TEXT,
    s_is_charging TINYINT(1),
    c_id INT
)
BEGIN
    UPDATE scooter
    SET available         = s_available,
        enabled           = s_enabled,
        charge            = s_charge,
        last_serviced     = s_last_serviced,
        first_used        = s_first_used,
        distance_traveled = s_distance_traveled,
        last_position     = ST_GeomFromGeoJSON(s_last_position),
        is_charging       = s_is_charging,
        city_id           = c_id
    WHERE id = s_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_trip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `update_trip`(
    t_id INT,
    u_id INT,
    s_id INT,
    t_distance FLOAT,
    t_completed TINYINT(1),
    t_start_position TEXT,
    t_stop_position TEXT,
    t_start_time TIMESTAMP,
    t_stop_time TIMESTAMP
)
BEGIN
    UPDATE trip
    SET user_id        = u_id,
        scooter_id     = s_id,
        distance       = t_distance,
        completed      = t_completed,
        start_position = ST_GeomFromGeoJSON(t_start_position),
        stop_position  = ST_GeomFromGeoJSON(t_stop_position),
        start_time     = t_start_time,
        stop_time      = t_stop_time
    WHERE id = t_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `update_user`(
    u_id INT,
    u_first_name VARCHAR(45),
    u_last_name VARCHAR(45),
    u_phone_nr INT,
    u_email VARCHAR(45),
    u_social_security VARCHAR(45),
    u_enabled TINYINT(1),
    u_credit FLOAT,
    u_token VARCHAR(45)
)
BEGIN
UPDATE user
SET first_name = u_first_name,
    last_name = u_last_name,
    phone_number = u_phone_nr,
    email = u_email,
    social_security = u_social_security,
    enabled = u_enabled,
    credit = u_credit,
    token = u_token
WHERE id = u_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `user_add`(

    u_first_name VARCHAR(45),
    u_last_name VARCHAR(45),
    u_phone_nr INT,
    u_email VARCHAR(45),
    u_social_security VARCHAR(45),
    u_token VARCHAR(45)
)
BEGIN
INSERT INTO user (
        first_name,
        last_name,
        phone_number,
        email,
        social_security,
        token
    )
VALUES (
        u_first_name,
        u_last_name,
        u_phone_nr,
        u_email,
        u_social_security,
        u_token
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-14 10:57:16
