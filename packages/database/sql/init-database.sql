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
  `charging_zone_id` varchar(20) NOT NULL,
  `position` point NOT NULL,
  `occupied` tinyint(1) NOT NULL DEFAULT 0,
  `scooter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `charging_station_charging_zone_idx` (`charging_zone_id`),
  KEY `charging_station_bike_idx` (`scooter_id`),
  CONSTRAINT `charging_station_charging_zone` FOREIGN KEY (`charging_zone_id`) REFERENCES `charging_zone` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `charging_station_scooter` FOREIGN KEY (`scooter_id`) REFERENCES `scooter` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_station`
--

LOCK TABLES `charging_station` WRITE;
/*!40000 ALTER TABLE `charging_station` DISABLE KEYS */;
INSERT INTO `charging_station` VALUES
(1,'kna_c_2','\0\0\0\0\0\0\0 n�T�(/@�;[��L@',0,NULL),
(2,'kna_c_2','\0\0\0\0\0\0\0����(/@\0�>��L@',0,NULL),
(3,'kna_c_2','\0\0\0\0\0\0\0��0�(/@l����L@',0,NULL),
(4,'kna_c_2','\0\0\0\0\0\0\0 ��Q�(/@��c��L@',0,NULL),
(5,'kna_c_2','\0\0\0\0\0\0\0p��a�(/@L���L@',0,NULL),
(6,'kna_c_2','\0\0\0\0\0\0\0���,�(/@�L��L@',0,NULL),
(7,'kna_c_2','\0\0\0\0\0\0\0�k��(/@\\z*��L@',0,NULL),
(8,'kna_c_2','\0\0\0\0\0\0\00h���(/@��\r��L@',0,NULL),
(9,'kna_c_2','\0\0\0\0\0\0\0�d�9�(/@�O��L@',0,NULL),
(10,'kna_c_2','\0\0\0\0\0\0\0\0ۼ�(/@���L@',0,NULL),
(11,'kna_c_2','\0\0\0\0\0\0\00����(/@����L@',0,NULL),
(12,'kna_c_2','\0\0\0\0\0\0\0�M��(/@�]u��L@',0,NULL),
(13,'kna_c_2','\0\0\0\0\0\0\0 ��F�(/@�t��L@',0,NULL),
(14,'kna_c_2','\0\0\0\0\0\0\0�잫�(/@ظ���L@',0,NULL),
(15,'kna_c_2','\0\0\0\0\0\0\0`S���(/@\\�;��L@',0,NULL),
(16,'kna_c_2','\0\0\0\0\0\0\0pb��(/@�~��L@',0,NULL),
(17,'kna_c_2','\0\0\0\0\0\0\0� O��(/@XA�{�L@',0,NULL),
(18,'kna_c_2','\0\0\0\0\0\0\0��,��(/@�Way�L@',0,NULL),
(19,'kna_c_2','\0\0\0\0\0\0\0���(/@p��t�L@',0,NULL),
(20,'kna_c_2','\0\0\0\0\0\0\0����(/@�r�o�L@',0,NULL),
(21,'kna_c_2','\0\0\0\0\0\0\00����(/@D�\'k�L@',0,NULL),
(22,'kna_c_2','\0\0\0\0\0\0\0В��(/@x�\nd�L@',0,NULL),
(23,'kna_c_2','\0\0\0\0\0\0\0���(/@�(�\\�L@',0,NULL),
(24,'kna_c_2','\0\0\0\0\0\0\0�����(/@�U0X�L@',0,NULL),
(25,'kna_c_2','\0\0\0\0\0\0\0��\n��(/@(�Q�L@',0,NULL),
(26,'kna_c_2','\0\0\0\0\0\0\0�u%Y�(/@��UL�L@',0,NULL),
(27,'kna_c_2','\0\0\0\0\0\0\0pr)��(/@��G�L@',0,NULL),
(28,'kna_c_2','\0\0\0\0\0\0\0 o-��(/@|\"�B�L@',0,NULL),
(29,'kna_c_2','\0\0\0\0\0\0\0 k�C�(/@xf�;�L@',0,NULL),
(30,'kna_c_2','\0\0\0\0\0\0\0����(/@���!�L@',0,NULL),
(31,'kna_c_2','\0\0\0\0\0\0\00`.��(/@���\Z�L@',0,NULL),
(32,'kna_c_2','\0\0\0\0\0\0\0�Ҧ�(/@�U�L@',0,NULL),
(33,'kna_c_2','\0\0\0\0\0\0\0p\'`�(/@��5�L@',0,NULL),
(34,'kna_c_2','\0\0\0\0\0\0\0����(/@�\n��L@',0,NULL),
(35,'kna_c_2','\0\0\0\0\0\0\0pj�K�(/@\\|>��L@',0,NULL),
(36,'kna_c_2','\0\0\0\0\0\0\0����(/@d�!��L@',0,NULL),
(37,'kna_c_2','\0\0\0\0\0\0\0����(/@psH��L@',0,NULL),
(38,'kna_c_2','\0\0\0\0\0\0\0�ˡ��(/@����L@',0,NULL),
(39,'kna_c_2','\0\0\0\0\0\0\0�^� �(/@Ԛ��L@',0,NULL),
(40,'kna_c_2','\0\0\0\0\0\0\0��h�(/@��t��L@',0,NULL),
(41,'kna_c_2','\0\0\0\0\0\0\0`-���(/@�&O��L@',0,NULL),
(42,'kna_c_2','\0\0\0\0\0\0\0XnB�(/@�-c��L@',0,NULL),
(43,'kna_c_2','\0\0\0\0\0\0\0�!��(/@W=��L@',0,NULL),
(44,'kna_c_2','\0\0\0\0\0\0\0���i�(/@�S��L@',0,NULL),
(45,'kna_c_2','\0\0\0\0\0\0\0`���(/@T�-��L@',0,NULL),
(46,'kna_c_2','\0\0\0\0\0\0\0���(/@L\nD��L@',0,NULL),
(47,'kna_c_2','\0\0\0\0\0\0\0��A-�(/@PA���L@',0,NULL),
(48,'kna_c_2','\0\0\0\0\0\0\0\0T��(/@�$��L@',0,NULL),
(49,'kna_c_2','\0\0\0\0\0\0\0��\n�(/@�^ٞ�L@',0,NULL),
(50,'kna_c_2','\0\0\0\0\0\0\00�V/�(/@x���L@',0,NULL),
(51,'kna_c_2','\0\0\0\0\0\0\0��˿(/@l���L@',0,NULL),
(52,'kna_c_2','\0\0\0\0\0\0\0�^��(/@X-{�L@',0,NULL),
(53,'kna_c_2','\0\0\0\0\0\0\0�\r�{�(/@Ld�q�L@',0,NULL),
(54,'kna_c_2','\0\0\0\0\0\0\00�7:�(/@��l�L@',0,NULL),
(55,'kna_c_2','\0\0\0\0\0\0\0Pjy��(/@���`�L@',0,NULL),
(56,'kna_c_2','\0\0\0\0\0\0\0��t-�(/@x҄^�L@',0,NULL),
(57,'kna_c_2','\0\0\0\0\0\0\0�~�]�(/@���Q�L@',0,NULL),
(58,'kna_c_2','\0\0\0\0\0\0\0g\n�(/@�\r]H�L@',0,NULL),
(59,'kna_c_2','\0\0\0\0\0\0\0���(/@�D�>�L@',0,NULL),
(60,'kna_c_2','\0\0\0\0\0\0\0�7��(/@�D�>�L@',0,NULL),
(61,'kna_c_2','\0\0\0\0\0\0\0�T��(/@@`:�L@',0,NULL),
(62,'kna_c_2','\0\0\0\0\0\0\0�w��(/@<��0�L@',0,NULL),
(63,'kna_c_2','\0\0\0\0\0\0\0PB1�(/@D��+�L@',0,NULL),
(64,'kna_c_2','\0\0\0\0\0\0\00���(/@�,z�L@',0,NULL),
(65,'kna_c_2','\0\0\0\0\0\0\0��0��(/@0q��L@',0,NULL),
(66,'kna_c_2','\0\0\0\0\0\0\0PN���(/@����L@',0,NULL),
(67,'kna_c_2','\0\0\0\0\0\0\0@��f�(/@��ؿL@',0,NULL),
(68,'kna_c_2','\0\0\0\0\0\0\0���i�(/@���ɿL@',0,NULL),
(69,'kna_c_2','\0\0\0\0\0\0\0���(/@`F��L@',0,NULL),
(70,'kna_c_2','\0\0\0\0\0\0\0Ю��(/@�W\\��L@',0,NULL),
(71,'kna_c_2','\0\0\0\0\0\0\0�zǔ�(/@؀6��L@',0,NULL),
(72,'kna_c_2','\0\0\0\0\0\0\0@}�0�(/@p����L@',0,NULL),
(73,'kna_c_2','\0\0\0\0\0\0\0�g�#�(/@t	c��L@',0,NULL),
(74,'kna_c_2','\0\0\0\0\0\0\0�l�Y�(/@ @ۋ�L@',0,NULL),
(75,'kna_c_2','\0\0\0\0\0\0\0p��J�(/@�My��L@',0,NULL),
(76,'kna_c_2','\0\0\0\0\0\0\0\0;\\	�(/@�J��L@',0,NULL),
(77,'kna_c_2','\0\0\0\0\0\0\0��O�(/@�L�x�L@',0,NULL),
(78,'kna_c_2','\0\0\0\0\0\0\00{Ic�(/@,Z`v�L@',0,NULL),
(79,'kna_c_2','\0\0\0\0\0\0\0`a�!�(/@�g�s�L@',0,NULL),
(80,'kna_c_2','\0\0\0\0\0\0\0����(/@̐�l�L@',0,NULL),
(81,'kna_c_2','\0\0\0\0\0\0\00��7�(/@���`�L@',0,NULL),
(82,'kna_c_2','\0\0\0\0\0\0\0�P���(/@���Y�L@',0,NULL),
(83,'kna_c_2','\0\0\0\0\0\0\0�i���(/@�?AP�L@',0,NULL),
(84,'kna_c_2','\0\0\0\0\0\0\0@�f*�(/@d�Y��L@',0,NULL),
(85,'kna_c_2','\0\0\0\0\0\0\0�ֈ��(/@d�ጾL@',0,NULL),
(86,'kna_c_2','\0\0\0\0\0\0\0@��i�(/@L~���L@',0,NULL),
(87,'kna_c_2','\0\0\0\0\0\0\0��.��(/@\0-�L@',0,NULL),
(88,'kna_c_2','\0\0\0\0\0\0\0�zB�(/@xS��L@',0,NULL),
(89,'kna_c_2','\0\0\0\0\0\0\0pT���(/@��\0��L@',0,NULL),
(90,'kna_c_2','\0\0\0\0\0\0\0p��N�(/@HΞ��L@',0,NULL),
(91,'kna_c_2','\0\0\0\0\0\0\0p.b)�(/@�a�þL@',0,NULL),
(92,'kna_c_2','\0\0\0\0\0\0\0�d���(/@8TƾL@',0,NULL),
(93,'kna_c_2','\0\0\0\0\0\0\0�\n1�(/@�+6;L@',0,NULL),
(94,'kna_c_2','\0\0\0\0\0\0\0����(/@��پL@',0,NULL),
(95,'kna_c_2','\0\0\0\0\0\0\0 :O��(/@4ځ۾L@',0,NULL),
(96,'kna_c_2','\0\0\0\0\0\0\0@\0o��(/@�	�L@',0,NULL),
(97,'kna_c_2','\0\0\0\0\0\0\0�P��(/@���L@',0,NULL),
(98,'kna_c_2','\0\0\0\0\0\0\0 ���(/@�����L@',0,NULL),
(99,'kna_c_2','\0\0\0\0\0\0\0��>i�(/@�v��L@',0,NULL),
(100,'kna_c_2','\0\0\0\0\0\0\0P�ͪ�(/@�M��L@',0,NULL),
(101,'kna_c_1','\0\0\0\0\0\0\0@�vlg,/@�.\"L@',0,NULL),
(102,'kna_c_1','\0\0\0\0\0\0\0@�XTg,/@��L@',0,NULL),
(103,'kna_c_1','\0\0\0\0\0\0\0 �:<g,/@$>��\ZL@',0,NULL),
(104,'kna_c_1','\0\0\0\0\0\0\00�g,/@@��P\ZL@',0,NULL),
(105,'kna_c_1','\0\0\0\0\0\0\00$g,/@��گL@',0,NULL),
(106,'kna_c_1','\0\0\0\0\0\0\00�g,/@�}�L@',0,NULL),
(107,'kna_c_1','\0\0\0\0\0\0\0S��f,/@dh$`L@',0,NULL),
(108,'kna_c_1','\0\0\0\0\0\0\0�L{f,/@���L@',0,NULL),
(109,'kna_c_1','\0\0\0\0\0\0\0�.cf,/@P���L@',0,NULL),
(110,'kna_c_1','\0\0\0\0\0\0\0�Kf,/@@\Z�TL@',0,NULL),
(111,'kna_c_1','\0\0\0\0\0\0\0��f,/@(kA�L@',0,NULL),
(112,'kna_c_1','\0\0\0\0\0\0\0��{�e,/@����L@',0,NULL),
(113,'kna_c_1','\0\0\0\0\0\0\0��]�e,/@�@SL@',0,NULL),
(114,'kna_c_1','\0\0\0\0\0\0\0��?�e,/@�HT�L@',0,NULL),
(115,'kna_c_1','\0\0\0\0\0\0\0�\"�Ae,/@|�fL@',0,NULL),
(116,'kna_c_1','\0\0\0\0\0\0\0�@�e,/@��oL@',0,NULL),
(117,'kna_c_1','\0\0\0\0\0\0\0�@�e,/@X!0�L@',0,NULL),
(118,'kna_c_1','\0\0\0\0\0\0\0�h.q,/@HbL@',0,NULL),
(119,'kna_c_1','\0\0\0\0\0\0\0�C��p,/@�|�L@',0,NULL),
(120,'kna_c_1','\0\0\0\0\0\0\0� �p,/@@�L@',0,NULL),
(121,'kna_c_1','\0\0\0\0\0\0\0��ܱp,/@pDY�\ZL@',0,NULL),
(122,'kna_c_1','\0\0\0\0\0\0\00���p,/@���L@',0,NULL),
(123,'kna_c_1','\0\0\0\0\0\0\0�gU�p,/@@_nL@',0,NULL),
(124,'kna_c_1','\0\0\0\0\0\0\0P�~p,/@���L@',0,NULL),
(125,'kna_c_1','\0\0\0\0\0\0\0P�~p,/@4��{L@',0,NULL),
(126,'kna_c_1','\0\0\0\0\0\0\0`��[p,/@��L@',0,NULL),
(127,'kna_c_1','\0\0\0\0\0\0\0 �9p,/@d�k[L@',0,NULL),
(128,'kna_c_1','\0\0\0\0\0\0\0 �p,/@�wl�L@',0,NULL),
(129,'kna_c_1','\0\0\0\0\0\0\0�c�p,/@\\Di%L@',0,NULL),
(130,'kna_c_1','\0\0\0\0\0\0\0`�{�o,/@�@�L@',0,NULL),
(131,'kna_c_1','\0\0\0\0\0\0\0����o,/@h{AL@',0,NULL),
(132,'kna_c_1','\0\0\0\0\0\0\0��o,/@$��L@',0,NULL),
(133,'kna_c_1','\0\0\0\0\0\0\0 �(�o,/@��T�L@',0,NULL),
(134,'kna_c_1','\0\0\0\0\0\0\0��]jo,/@�K�gL@',0,NULL),
(135,'kna_c_1','\0\0\0\0\0\0\0P>\ZYo,/@�0��L@',0,NULL),
(136,'kna_c_1','\0\0\0\0\0\0\0�ܑ6o,/@x�!oL@',0,NULL),
(137,'kna_c_1','\0\0\0\0\0\0\0@%�o,/@H�W�L@',0,NULL),
(138,'kna_c_1','\0\0\0\0\0\0\0\0���x,/@d�L@',0,NULL),
(139,'kna_c_1','\0\0\0\0\0\0\0�I�x,/@�G�|L@',0,NULL),
(140,'kna_c_1','\0\0\0\0\0\0\0�ajx,/@ԝ�\ZL@',0,NULL),
(141,'kna_c_1','\0\0\0\0\0\0\0`�rx,/@$�Ͽ\ZL@',0,NULL),
(142,'kna_c_1','\0\0\0\0\0\0\0Wx,/@HsX\ZL@',0,NULL),
(143,'kna_c_1','\0\0\0\0\0\0\0Wx,/@h���L@',0,NULL),
(144,'kna_c_1','\0\0\0\0\0\0\0��Dx,/@@�iL@',0,NULL),
(145,'kna_c_1','\0\0\0\0\0\0\0P.#*x,/@���L@',0,NULL),
(146,'kna_c_1','\0\0\0\0\0\0\0��q7x,/@ �:sL@',0,NULL),
(147,'kna_c_1','\0\0\0\0\0\0\0p�Dx,/@ܗ��L@',0,NULL),
(148,'kna_c_1','\0\0\0\0\0\0\0��x,/@��&:L@',0,NULL),
(149,'kna_c_1','\0\0\0\0\0\0\0��x,/@���L@',0,NULL),
(150,'kna_c_1','\0\0\0\0\0\0\0Ѓx,/@���L@',0,NULL),
(151,'kna_c_1','\0\0\0\0\0\0\0�[5x,/@��x@L@',0,NULL),
(152,'kna_c_1','\0\0\0\0\0\0\00ڷ�w,/@�(�L@',0,NULL),
(153,'kna_c_1','\0\0\0\0\0\0\0��\Z�w,/@��EL@',0,NULL),
(154,'kna_c_1','\0\0\0\0\0\0\0�	~�w,/@�ڳ0L@',0,NULL),
(155,'kna_c_1','\0\0\0\0\0\0\0�r�w,/@t�8�L@',0,NULL),
(156,'kna_c_1','\0\0\0\0\0\0\0`1�w,/@@�I�L@',0,NULL),
(157,'kna_c_3','\0\0\0\0\0\0\0�(�./@�}*L@',0,NULL),
(158,'kna_c_3','\0\0\0\0\0\0\0 7./@��	L@',0,NULL),
(159,'kna_c_3','\0\0\0\0\0\0\00ˀ./@�|��L@',0,NULL),
(160,'kna_c_3','\0\0\0\0\0\0\0\0_�%!./@���L@',0,NULL),
(161,'kna_c_3','\0\0\0\0\0\0\0࿮�%./@t��L@',0,NULL),
(162,'kna_c_3','\0\0\0\0\0\0\0����)./@P1�L@',0,NULL),
(163,'kna_c_3','\0\0\0\0\0\0\0 ��-./@x?�L@',0,NULL),
(164,'kna_c_3','\0\0\0\0\0\0\0`y\'�1./@`/�L@',0,NULL),
(165,'kna_c_3','\0\0\0\0\0\0\0\0�36./@X	iL@',0,NULL),
(166,'kna_c_3','\0\0\0\0\0\0\0���./@T�(OL@',0,NULL),
(167,'kna_c_3','\0\0\0\0\0\0\0\0*[./@|O,8L@',0,NULL),
(168,'kna_c_3','\0\0\0\0\0\0\0@M��\Z./@��,L@',0,NULL),
(169,'kna_c_3','\0\0\0\0\0\0\0����./@��pL@',0,NULL),
(170,'kna_c_3','\0\0\0\0\0\0\0�IG\"./@�ݴ�L@',0,NULL),
(171,'kna_c_3','\0\0\0\0\0\0\00X�%./@lI��L@',0,NULL),
(172,'kna_c_3','\0\0\0\0\0\0\0�\"_�*./@X�9�L@',0,NULL),
(173,'kna_c_3','\0\0\0\0\0\0\0���-./@4���L@',0,NULL),
(174,'kna_c_3','\0\0\0\0\0\0\0`��1./@����L@',0,NULL),
(175,'kna_c_3','\0\0\0\0\0\0\0�Ke�5./@p�¢L@',0,NULL),
(176,'kna_c_3','\0\0\0\0\0\0\0p\0./@X��zL@',0,NULL),
(177,'kna_c_3','\0\0\0\0\0\0\0pL��./@�;�ZL@',0,NULL),
(178,'kna_c_3','\0\0\0\0\0\0\0����./@LAL@',0,NULL),
(179,'kna_c_3','\0\0\0\0\0\0\0 W�\"./@�4�L@',0,NULL),
(180,'kna_c_3','\0\0\0\0\0\0\0�n	\'./@2y\nL@',0,NULL),
(181,'kna_c_3','\0\0\0\0\0\0\0�w�+./@؜|�L@',0,NULL),
(182,'kna_c_3','\0\0\0\0\0\0\0�GO�/./@����L@',0,NULL),
(183,'kna_c_3','\0\0\0\0\0\0\0��&�3./@XO��L@',0,NULL),
(184,'kna_c_3','\0\0\0\0\0\0\0 t��./@tCm�L@',0,NULL),
(185,'kna_c_3','\0\0\0\0\0\0\0�k./@�b�`L@',0,NULL),
(186,'kna_c_3','\0\0\0\0\0\0\0����\Z./@�OL@',0,NULL),
(187,'kna_c_3','\0\0\0\0\0\0\0PÌ|./@x�w>L@',0,NULL),
(188,'kna_c_3','\0\0\0\0\0\0\0`���\"./@$�z\'L@',0,NULL),
(189,'kna_c_3','\0\0\0\0\0\0\0`ȭp\'./@�T~L@',0,NULL),
(190,'kna_c_3','\0\0\0\0\0\0\009Q\\,./@X���L@',0,NULL),
(191,'kna_c_3','\0\0\0\0\0\0\0`��&0./@���L@',0,NULL),
(192,'kna_c_3','\0\0\0\0\0\0\0�5s�3./@����L@',0,NULL);
/*!40000 ALTER TABLE `charging_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_zone`
--

DROP TABLE IF EXISTS `charging_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charging_zone` (
  `id` varchar(20) NOT NULL,
  `parking_zone_id` varchar(20) DEFAULT NULL,
  `area` polygon DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `charging_zone_parking_zone_idx` (`parking_zone_id`),
  CONSTRAINT `charging_zone_parking_zone` FOREIGN KEY (`parking_zone_id`) REFERENCES `parking_zone` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_zone`
--

LOCK TABLES `charging_zone` WRITE;
/*!40000 ALTER TABLE `charging_zone` DISABLE KEYS */;
INSERT INTO `charging_zone` VALUES
('kna_c_1','kna_1','\0\0\0\0\0\0\0\0\0\0\0\0\0 ���a,/@$̡sL@PV�},/@�m5`L@P[l~,/@x\0tL@��<�c,/@x\0tL@ ���a,/@$̡sL@'),
('kna_c_2','kna_2','\0\0\0\0\0\0\0\0\0\0\0\0\0�+��(/@�2���L@�8��(/@ ���L@\0@ʞ�(/@H\'��L@`t���(/@���L@�+��(/@�2���L@'),
('kna_c_3','kna_3','\0\0\0\0\0\0\0\0\0\0\0\0\0P�H./@�mm�L@0UpY./@��7�L@���5./@x���L@P�9./@�M�L@P�H./@�mm�L@');
/*!40000 ALTER TABLE `charging_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` varchar(20) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES
('kna','Karlskrona');
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
(1,1,NULL,2596,'2023-01-16 13:34:57'),
(2,2,NULL,724,'2023-01-16 13:34:57'),
(3,3,NULL,1093,'2023-01-16 13:34:57'),
(4,4,NULL,190,'2023-01-16 13:34:57'),
(5,5,NULL,613,'2023-01-16 13:34:57'),
(6,6,NULL,1696,'2023-01-16 13:34:57'),
(7,7,NULL,2194,'2023-01-16 13:34:57'),
(8,8,NULL,589,'2023-01-16 13:34:57'),
(9,9,NULL,1447,'2023-01-16 13:34:57'),
(10,10,NULL,2341,'2023-01-16 13:34:57'),
(11,11,NULL,1261,'2023-01-16 13:34:57'),
(12,12,NULL,238,'2023-01-16 13:34:57'),
(13,13,NULL,811,'2023-01-16 13:34:57'),
(14,14,NULL,1579,'2023-01-16 13:34:57'),
(15,15,NULL,199,'2023-01-16 13:34:57'),
(16,16,NULL,1075,'2023-01-16 13:34:57'),
(17,17,NULL,1000,'2023-01-16 13:34:57'),
(18,18,NULL,1114,'2023-01-16 13:34:57'),
(19,19,NULL,517,'2023-01-16 13:34:57'),
(20,20,NULL,2467,'2023-01-16 13:34:57'),
(21,21,NULL,988,'2023-01-16 13:34:57'),
(22,22,NULL,637,'2023-01-16 13:34:57'),
(23,23,NULL,2317,'2023-01-16 13:34:57'),
(24,24,NULL,1714,'2023-01-16 13:34:57'),
(25,25,NULL,706,'2023-01-16 13:34:57'),
(26,26,NULL,1954,'2023-01-16 13:34:57'),
(27,27,NULL,778,'2023-01-16 13:34:57'),
(28,28,NULL,1453,'2023-01-16 13:34:57'),
(29,29,NULL,2191,'2023-01-16 13:34:57'),
(30,30,NULL,952,'2023-01-16 13:34:57'),
(31,31,NULL,733,'2023-01-16 13:34:57'),
(32,32,NULL,832,'2023-01-16 13:34:57'),
(33,33,NULL,1459,'2023-01-16 13:34:57'),
(34,34,NULL,1027,'2023-01-16 13:34:57');
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
  `id` varchar(20) NOT NULL,
  `city_id` varchar(20) DEFAULT NULL,
  `area` polygon DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parking_zone_city_idx` (`city_id`),
  CONSTRAINT `parking_zone_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_zone`
--

LOCK TABLES `parking_zone` WRITE;
/*!40000 ALTER TABLE `parking_zone` DISABLE KEYS */;
INSERT INTO `parking_zone` VALUES
('kna_1','kna','\0\0\0\0\0\0\0\0\0\0\0\0\0p2���)/@�,L��L@�F1�f*/@|T$l�L@P0��|+/@��ڊ�L@0jâS-/@���L@�1hk�-/@\0�.�L@Py�u�0/@�6bҕL@ �3�1/@T9;\Z�L@P�m��0/@�����L@ ���*//@�\ZjLL@��fR�//@4(~ZL@ЋV�\Z//@�	�5kL@P�6��-/@�i�^qL@�A!�*/@(�� ~L@����)/@ 9�SL@�:�)/@Pּ,L@P���|)/@L���L@p2���)/@�,L��L@'),
('kna_2','kna','\0\0\0\0\0\0\0\0\0\0\0\0\0�7D��$/@l;f�L@`�!�$/@�-B��L@�n!��%/@(}���L@���\0\"&/@�-B��L@@;!��&/@pS\Z�L@�C_2.(/@��U�L@���Rl(/@����>L@�Ac�(/@L��j1L@0B5=�*/@�:߶.L@��b�+/@0x+L@��&�+/@6��L@�s�|,/@�]�@L@ ]el�,/@��O=L@�]�F	//@�Tt�0L@@у�	//@T���OL@����50/@8V\r�NL@��~�0/@$h��L@\0f�-/@LyJ�L@��i-/@d�$��L@@�+�f+/@<�\"��L@�ܠ)/@�ZG��L@�7D��$/@l;f�L@'),
('kna_3','kna','\0\0\0\0\0\0\0\0\0\0\0\0\0`���,/@X�-DL@ i���+/@`�L@@�e�,/@ˡ�L@�N���,/@��V��L@�����-/@����L@@���./@Ў{dfL@@��m�//@8�%s�L@`�Q1/@��K�L@ T�|e2/@�f���L@ �\"H3/@��O�DL@�����3/@�+2qmL@�.���-/@|�u5�L@ \\��./@�\ZS�TL@0�`0�-/@4\0�L@\0>:�./@X�Hs�L@�Լi./@l���L@P��gR-/@XޙFL@`���,/@X�-DL@');
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
  `city_id` varchar(20) DEFAULT NULL,
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
(1,1,1,76,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��A\"�L@|���(\"/@',0,'kna'),
(2,1,1,56,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0L�jrL@���Q4/@',0,'kna'),
(3,1,1,76,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0@sn��L@n)���</@',0,'kna'),
(4,1,1,81,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\01_�L@f4sj�2/@',0,'kna'),
(5,1,1,74,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0HO@E\'L@�p�4/@',0,'kna'),
(6,1,1,84,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��~�L@�KV�s//@',0,'kna'),
(7,1,1,90,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0꞉�L@h��f1=/@',0,'kna'),
(8,1,1,56,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0p���L@L���c-/@',0,'kna'),
(9,1,1,42,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0۹�_�L@�\n�0�1/@',0,'kna'),
(10,1,1,85,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0���^�L@5��},/@',0,'kna'),
(11,1,1,93,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�\">܇L@�&�U�\"/@',0,'kna'),
(12,1,1,62,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0���0�L@J��0/@',0,'kna'),
(13,1,1,55,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��o\n�L@3��3/@',0,'kna'),
(14,1,1,46,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��dL@k]\0��2/@',0,'kna'),
(15,1,1,84,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�Yeu�L@y�k�</@',0,'kna'),
(16,1,1,77,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�X�4�L@���t7/@',0,'kna'),
(17,1,1,86,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0p�~��L@s��\n)/@',0,'kna'),
(18,1,1,92,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\00�)��L@���os2/@',0,'kna'),
(19,1,1,45,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0=X�M�L@�&g�Y0/@',0,'kna'),
(20,1,1,59,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0q����L@|\r���#/@',0,'kna'),
(21,1,1,65,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0m�h\r�L@H����//@',0,'kna'),
(22,1,1,63,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0Ū	�|L@)Ì+,/@',0,'kna'),
(23,1,1,43,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�w�,L@�<Z��//@',0,'kna'),
(24,1,1,73,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0w_E��L@�ڮ@1/@',0,'kna'),
(25,1,1,81,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0[���\"L@2���,/@',0,'kna'),
(26,1,1,77,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0����L@�oW+/@',0,'kna'),
(27,1,1,65,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0Ct��L@��R��0/@',0,'kna'),
(28,1,1,48,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�sw��L@Dj��9/@',0,'kna'),
(29,1,1,67,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0ـ�\\L@\r�s�W2/@',0,'kna'),
(30,1,1,60,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�����L@�] q�+/@',0,'kna'),
(31,1,1,93,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�&W]?L@��R� /@',0,'kna'),
(32,1,1,51,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0���|L@���L2/@',0,'kna'),
(33,1,1,70,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0����L@����[*/@',0,'kna'),
(34,1,1,87,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�K��L@MN��_,/@',0,'kna'),
(35,1,1,43,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0K��UL@q(���;/@',0,'kna'),
(36,1,1,40,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0-���L@�#o�R./@',0,'kna'),
(37,1,1,83,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0[ᬝ�L@��X5/@',0,'kna'),
(38,1,1,88,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0wr���L@³~d63/@',0,'kna'),
(39,1,1,51,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�޷>L@��~�,/@',0,'kna'),
(40,1,1,70,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0gߣ��L@	��s�0/@',0,'kna'),
(41,1,1,87,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0D���L@L�Aܚ$/@',0,'kna'),
(42,1,1,45,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0����L@1Pld�//@',0,'kna'),
(43,1,1,82,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�cN��L@M�`g6/@',0,'kna'),
(44,1,1,59,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0s�`�(L@^� _�0/@',0,'kna'),
(45,1,1,58,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0WBU�lL@/��/@',0,'kna'),
(46,1,1,64,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�o(�fL@�7ٽ:/@',0,'kna'),
(47,1,1,70,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�L@8�c�$)/@',0,'kna'),
(48,1,1,84,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�d���L@���4/@',0,'kna'),
(49,1,1,48,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0s��4L@�4}wz./@',0,'kna'),
(50,1,1,97,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0\"P�!L@���a�+/@',0,'kna'),
(51,1,1,84,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�R\nk�L@�;_��=/@',0,'kna'),
(52,1,1,88,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�U��L@�`���-/@',0,'kna'),
(53,1,1,90,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�o~PL@��A1|!/@',0,'kna'),
(54,1,1,55,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�:��pL@\n\n-/@',0,'kna'),
(55,1,1,72,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0u�3yL@(��,/@',0,'kna'),
(56,1,1,68,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�H�L@>�S��2/@',0,'kna'),
(57,1,1,96,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0{=×L@P���!/@',0,'kna'),
(58,1,1,47,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�e��L@��ʹ=:/@',0,'kna'),
(59,1,1,40,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0%�ŞL@���7�4/@',0,'kna'),
(60,1,1,42,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0EW��L@�A�Y0/@',0,'kna'),
(61,1,1,51,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0���L@�\'�!/@',0,'kna'),
(62,1,1,98,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�e�*L@k���//@',0,'kna'),
(63,1,1,71,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0����KL@joX�v-/@',0,'kna'),
(64,1,1,51,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0F=y��L@z��5/@',0,'kna'),
(65,1,1,54,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0���cL@��I(/@',0,'kna'),
(66,1,1,73,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0s ��bL@DTq�-/@',0,'kna'),
(67,1,1,55,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��y�L@O�1`2/@',0,'kna'),
(68,1,1,58,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�?ؕL@�	�3/@',0,'kna'),
(69,1,1,100,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�&Y�JL@����./@',0,'kna'),
(70,1,1,57,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0®�q�L@�/ON�0/@',0,'kna'),
(71,1,1,44,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��P~8L@�`i�!/@',0,'kna'),
(72,1,1,62,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0R����L@�yM*+./@',0,'kna'),
(73,1,1,92,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\04���KL@_��*/@',0,'kna'),
(74,1,1,86,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0���>L@�[�uO#/@',0,'kna'),
(75,1,1,47,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0k�=.�L@μ6�./@',0,'kna'),
(76,1,1,43,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��\n�L@Hw��r0/@',0,'kna'),
(77,1,1,93,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0���jL@Em\0��5/@',0,'kna'),
(78,1,1,82,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��\\z�L@U�iM�</@',0,'kna'),
(79,1,1,56,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�>�L@�z�B�2/@',0,'kna'),
(80,1,1,74,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�]��L@rH�y�5/@',0,'kna'),
(81,1,1,74,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0tE�L@�HޟK-/@',0,'kna'),
(82,1,1,65,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0\n�$�YL@ІG�0./@',0,'kna'),
(83,1,1,74,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��L@�:Ϗ>/@',0,'kna'),
(84,1,1,63,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0p�|�L@�.��//@',0,'kna'),
(85,1,1,87,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��L@��]�4/@',0,'kna'),
(86,1,1,45,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��f��L@i�r6/@',0,'kna'),
(87,1,1,62,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��l$�L@��~�0/@',0,'kna'),
(88,1,1,56,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0�~2L@}�2�./@',0,'kna'),
(89,1,1,91,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0(l�L@Y�Xx</@',0,'kna'),
(90,1,1,58,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��o7L@\r\n��K8/@',0,'kna'),
(91,1,1,91,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0Lp�ALL@�<YZ�,/@',0,'kna'),
(92,1,1,52,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0����4L@Y?�</@',0,'kna'),
(93,1,1,96,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��\Z�yL@�WT�h(/@',0,'kna'),
(94,1,1,74,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0��-�OL@r�1/@',0,'kna'),
(95,1,1,73,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0���бL@ǈ�\n)/@',0,'kna'),
(96,1,1,88,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0A����L@�]+��=/@',0,'kna'),
(97,1,1,69,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0]\0�T�L@�r�%�(/@',0,'kna'),
(98,1,1,85,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0ߊQYL@�08�3/@',0,'kna'),
(99,1,1,55,'2023-01-16 13:34:57',NULL,0,'\0\0\0\0\0\0\0ǯY�L@����!/@',0,'kna');
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
(1,214,28,0,0,'\0\0\0\0\0\0\0�w@q�L@uv�?\'4/@','\0\0\0\0\0\0\0��\\�L@!�N\Z6?/@','2023-01-15 23:12:23','2023-01-16 13:34:57'),
(2,77,13,0,0,'\0\0\0\0\0\0\0���H�L@Q�Uo�./@','\0\0\0\0\0\0\0q)�L@����</@','2023-01-16 09:36:56','2023-01-16 13:34:57'),
(3,143,44,0,0,'\0\0\0\0\0\0\0��gL@�>��6/@','\0\0\0\0\0\0\0Y���L@��5b�!/@','2023-01-16 07:33:12','2023-01-16 13:34:57'),
(4,850,28,0,0,'\0\0\0\0\0\0\0���0�L@�u�> /@','\0\0\0\0\0\0\0S��Y2L@�\Z2��-/@','2023-01-16 12:34:46','2023-01-16 13:34:57'),
(5,132,69,0,0,'\0\0\0\0\0\0\0��h�L@vZ���0/@','\0\0\0\0\0\0\0IKQ�*L@Q;ۧ�#/@','2023-01-16 10:13:40','2023-01-16 13:34:57'),
(6,869,98,0,0,'\0\0\0\0\0\0\0$����L@���W�?/@','\0\0\0\0\0\0\0�9�%BL@tI}\r�:/@','2023-01-16 04:12:26','2023-01-16 13:34:57'),
(7,45,22,0,0,'\0\0\0\0\0\0\0bj#��L@�@ J�%/@','\0\0\0\0\0\0\0|S�0�L@.G�9(/@','2023-01-16 01:26:48','2023-01-16 13:34:57'),
(8,292,65,0,0,'\0\0\0\0\0\0\0R$L\0�L@_|�]�8/@','\0\0\0\0\0\0\0/H�wL@tׁ}�/@','2023-01-16 10:21:01','2023-01-16 13:34:57'),
(9,18,39,0,0,'\0\0\0\0\0\0\0@\Z��mL@M�u)/@','\0\0\0\0\0\0\0��\\�eL@o�^�U\'/@','2023-01-16 05:35:50','2023-01-16 13:34:57'),
(10,879,25,0,0,'\0\0\0\0\0\0\0�U��L@���� /@','\0\0\0\0\0\0\0�R�L@ɕD�D(/@','2023-01-16 00:37:31','2023-01-16 13:34:57'),
(11,704,66,0,0,'\0\0\0\0\0\0\0�mF�L@o9�x\"/@','\0\0\0\0\0\0\0\'�)��L@�6�q<$/@','2023-01-16 06:37:18','2023-01-16 13:34:57'),
(12,462,47,0,0,'\0\0\0\0\0\0\0�ͪ�L@U��3!%/@','\0\0\0\0\0\0\0����$L@b��\0	//@','2023-01-16 12:18:53','2023-01-16 13:34:57'),
(13,656,16,0,0,'\0\0\0\0\0\0\0Zv��L@ݗ�V< /@','\0\0\0\0\0\0\00r�D�L@�:�0/@','2023-01-16 09:07:36','2023-01-16 13:34:57'),
(14,770,47,0,0,'\0\0\0\0\0\0\0���jL@�/X�\'/@','\0\0\0\0\0\0\0~K��L@	��S�\'/@','2023-01-16 04:51:16','2023-01-16 13:34:57'),
(15,12,98,0,0,'\0\0\0\0\0\0\0�$<��L@ÙyLT&/@','\0\0\0\0\0\0\0�Uye�L@�V{�4/@','2023-01-16 12:31:29','2023-01-16 13:34:57'),
(16,428,23,0,0,'\0\0\0\0\0\0\0��L@��ն-/@','\0\0\0\0\0\0\0�*��L@E���l9/@','2023-01-16 07:39:36','2023-01-16 13:34:57'),
(17,96,82,0,0,'\0\0\0\0\0\0\0�N��L@{�3H</@','\0\0\0\0\0\0\0�0L@tMl+�=/@','2023-01-16 08:04:38','2023-01-16 13:34:57'),
(18,426,60,0,0,'\0\0\0\0\0\0\0@�\0��L@��j ./@','\0\0\0\0\0\0\0��o�1L@)�b*/@','2023-01-16 07:26:16','2023-01-16 13:34:57'),
(19,670,54,0,0,'\0\0\0\0\0\0\0Z\ZmEL@)����&/@','\0\0\0\0\0\0\0<W�c�L@� =-6/@','2023-01-16 10:45:25','2023-01-16 13:34:57'),
(20,224,95,0,0,'\0\0\0\0\0\0\0�eV�&L@dh�N\n-/@','\0\0\0\0\0\0\0k�&��L@���ǭ\"/@','2023-01-15 23:55:41','2023-01-16 13:34:57'),
(21,920,99,0,0,'\0\0\0\0\0\0\0��XL@:Pj�3+/@','\0\0\0\0\0\0\0���kL@�{Ha#4/@','2023-01-16 08:08:31','2023-01-16 13:34:57'),
(22,322,93,0,0,'\0\0\0\0\0\0\0Q���7L@��YA�6/@','\0\0\0\0\0\0\0$g�A�L@��15�1/@','2023-01-16 10:05:28','2023-01-16 13:34:57'),
(23,915,13,0,0,'\0\0\0\0\0\0\0���S�L@%:w��)/@','\0\0\0\0\0\0\0��$�L@˺�q5/@','2023-01-16 00:45:32','2023-01-16 13:34:57'),
(24,718,62,0,0,'\0\0\0\0\0\0\0�L�[fL@���N= /@','\0\0\0\0\0\0\0ݖh��L@)4Ѻ?7/@','2023-01-16 04:06:13','2023-01-16 13:34:57'),
(25,389,16,0,0,'\0\0\0\0\0\0\0^IL@6��r&,/@','\0\0\0\0\0\0\0M*���L@q��>r!/@','2023-01-16 09:41:58','2023-01-16 13:34:57'),
(26,555,57,0,0,'\0\0\0\0\0\0\0@OL@�\'�Fx;/@','\0\0\0\0\0\0\0#+�&L@t��T>/@','2023-01-16 02:46:22','2023-01-16 13:34:57'),
(27,733,99,0,0,'\0\0\0\0\0\0\0FS��L@����,/@','\0\0\0\0\0\0\0�j��tL@��hT6/@','2023-01-16 09:18:55','2023-01-16 13:34:57'),
(28,988,61,0,0,'\0\0\0\0\0\0\0HZ�qHL@���r =/@','\0\0\0\0\0\0\0\r�6L@$PC�89/@','2023-01-16 05:33:48','2023-01-16 13:34:57'),
(29,680,57,0,0,'\0\0\0\0\0\0\0�����L@v?9k>/@','\0\0\0\0\0\0\0Y1�L@Y��3$/@','2023-01-16 01:27:17','2023-01-16 13:34:57'),
(30,536,22,0,0,'\0\0\0\0\0\0\0�n�:{L@\\\"�ŵ3/@','\0\0\0\0\0\0\0��&L@�t=[G4/@','2023-01-16 08:20:21','2023-01-16 13:34:57'),
(31,683,62,0,0,'\0\0\0\0\0\0\0!�\r�L@\nk��5/@','\0\0\0\0\0\0\0�z�oL@��2�2/@','2023-01-16 09:33:41','2023-01-16 13:34:57'),
(32,851,73,0,0,'\0\0\0\0\0\0\0�=���L@X�{L0-/@','\0\0\0\0\0\0\0���6�L@.��1/@','2023-01-16 09:00:55','2023-01-16 13:34:57'),
(33,318,85,0,0,'\0\0\0\0\0\0\0CD��0L@�#&�+,/@','\0\0\0\0\0\0\0�\"�0<L@���(/@','2023-01-16 05:31:16','2023-01-16 13:34:57'),
(34,913,51,0,0,'\0\0\0\0\0\0\0i��\rL@���k2//@','\0\0\0\0\0\0\0p�2��L@.Y���/@','2023-01-16 07:54:58','2023-01-16 13:34:57'),
(35,824,81,0,0,'\0\0\0\0\0\0\0VoM��L@h\"4m�</@',NULL,'2023-01-16 00:00:06',NULL),
(36,880,84,0,0,'\0\0\0\0\0\0\0VN`�L@�gh#/@',NULL,'2023-01-16 03:06:57',NULL),
(37,631,81,0,0,'\0\0\0\0\0\0\0��?�L@Y��\n�(/@',NULL,'2023-01-16 09:14:21',NULL),
(38,644,83,0,0,'\0\0\0\0\0\0\0�z`2LL@�\\�O�#/@',NULL,'2023-01-16 09:10:20',NULL),
(39,475,3,0,0,'\0\0\0\0\0\0\0ݚ��L@r|}�\'/@',NULL,'2023-01-16 05:48:17',NULL),
(40,915,15,0,0,'\0\0\0\0\0\0\0i�\"��L@m�u0/@',NULL,'2023-01-16 05:34:35',NULL),
(41,762,71,0,0,'\0\0\0\0\0\0\0���0�L@�L@b%)/@',NULL,'2023-01-16 07:01:07',NULL),
(42,383,72,0,0,'\0\0\0\0\0\0\0�9�o)L@�-��<&/@',NULL,'2023-01-16 13:11:10',NULL),
(43,988,44,0,0,'\0\0\0\0\0\0\0���L@�t�ks./@',NULL,'2023-01-16 00:47:37',NULL),
(44,5,13,0,0,'\0\0\0\0\0\0\0�6PR�L@�;iì//@',NULL,'2023-01-16 09:53:14',NULL),
(45,709,79,0,0,'\0\0\0\0\0\0\0����<L@�ۥ8/@',NULL,'2023-01-16 09:39:54',NULL),
(46,694,75,0,0,'\0\0\0\0\0\0\0�eU�L@�F�6/@',NULL,'2023-01-16 01:15:41',NULL),
(47,486,2,0,0,'\0\0\0\0\0\0\0o3`A@L@jՈ�?/@',NULL,'2023-01-16 03:03:32',NULL),
(48,862,83,0,0,'\0\0\0\0\0\0\0��\Z�L@�>�x�6/@',NULL,'2023-01-16 08:16:47',NULL),
(49,17,26,0,0,'\0\0\0\0\0\0\0��EL@T�9[�-/@',NULL,'2023-01-16 07:53:22',NULL),
(50,536,9,0,0,'\0\0\0\0\0\0\0����^L@��gR,/@',NULL,'2023-01-16 05:11:49',NULL);
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
	IF NEW.stop_position IS NOT NULL THEN
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
(1,'Donald','Rice',89752655,'D-Rice80@yahoo.com','2023-01-16 13:34:57','1996',1,966,'(962)315-0759x91726'),
(2,'Cynthia','Miller',62436321,'C.Miller90@yahoo.com','2023-01-16 13:34:57','1948',1,449,'030.315.5888'),
(3,'Joseph','Wilson',56198356,'J.Wilson68@gmail.com','2023-01-16 13:34:57','1964',1,795,'001-838-022-2445x8349'),
(4,'Richard','Hall',49445926,'R.Hall91@yahoo.com','2023-01-16 13:34:57','1986',1,663,'+1-102-181-4902x276'),
(5,'Lisa','Contreras',46887718,'L.Contreras68@gmail.com','2023-01-16 13:34:57','1979',1,26,'(852)467-9393x38924'),
(6,'Michael','Jackson',34271937,'M-Jackson87@yahoo.com','2023-01-16 13:34:57','1976',1,532,'001-968-376-5186'),
(7,'Donna','Moreno',94944334,'D.Moreno77@gmail.com','2023-01-16 13:34:57','1996',1,579,'402-765-3994x3842'),
(8,'Ryan','Hernandez',56059369,'R-Hernandez60@yahoo.com','2023-01-16 13:34:57','1954',1,199,'+1-723-907-0762x445'),
(9,'Charles','Cohen',54168240,'C_Cohen61@hotmail.com','2023-01-16 13:34:57','1971',1,21,'961.595.0897x14056'),
(10,'Ryan','Cisneros',26048355,'R_Cisneros63@gmail.com','2023-01-16 13:34:57','1972',1,63,'343.163.2672'),
(11,'Jennifer','Ball',20786462,'J-Ball54@hotmail.com','2023-01-16 13:34:57','1980',1,461,'849.943.0678'),
(12,'Andrea','Garcia',53820690,'A-Garcia99@yahoo.com','2023-01-16 13:34:57','1978',1,459,'+1-134-328-9735'),
(13,'Denise','Jones',57572421,'D.Jones69@yahoo.com','2023-01-16 13:34:57','2008',1,156,'001-658-232-2703x72650'),
(14,'Katherine','Frederick',54541388,'K_Frederick79@yahoo.com','2023-01-16 13:34:57','1981',1,967,'001-784-080-2721x8964'),
(15,'Elizabeth','Lee',70392392,'E.Lee54@yahoo.com','2023-01-16 13:34:57','1985',1,284,'+1-266-626-7896x058'),
(16,'Courtney','Williams',38197767,'C_Williams59@yahoo.com','2023-01-16 13:34:57','1958',1,245,'(387)176-0260x25000'),
(17,'Michael','Carrillo',16057994,'M-Carrillo79@hotmail.com','2023-01-16 13:34:57','1977',1,315,'(804)496-7506x8566'),
(18,'Heather','Craig',19802065,'H-Craig64@yahoo.com','2023-01-16 13:34:57','1960',1,63,'+1-082-739-0358x43340'),
(19,'Amy','Butler',24936927,'A-Butler95@hotmail.com','2023-01-16 13:34:57','1952',1,123,'0811596247'),
(20,'Rebecca','Cole',39133293,'R.Cole78@yahoo.com','2023-01-16 13:34:57','1984',1,404,'001-372-638-2740x4833'),
(21,'Christian','Miranda',79908864,'C.Miranda84@yahoo.com','2023-01-16 13:34:57','1969',1,305,'001-886-389-3795x87370'),
(22,'Melanie','Trujillo',27634330,'M.Trujillo64@hotmail.com','2023-01-16 13:34:57','1959',1,959,'+1-345-951-1818x70933'),
(23,'Nathan','Green',43437690,'N-Green81@hotmail.com','2023-01-16 13:34:57','1946',1,705,'869.935.9172x324'),
(24,'Melissa','Donovan',89908337,'M-Donovan88@yahoo.com','2023-01-16 13:34:57','1974',1,579,'622.110.6855'),
(25,'Deborah','Collins',55503221,'D_Collins99@gmail.com','2023-01-16 13:34:57','1991',1,13,'+1-676-317-2227x75356'),
(26,'Joshua','Herrera',54988380,'J.Herrera75@hotmail.com','2023-01-16 13:34:57','1948',1,199,'399.491.9120x895'),
(27,'Jose','Perez',53649900,'J-Perez89@yahoo.com','2023-01-16 13:34:57','1974',1,344,'(077)176-4944'),
(28,'Donald','Cruz',79967780,'D_Cruz81@gmail.com','2023-01-16 13:34:57','1963',1,442,'(228)845-8866'),
(29,'Anthony','Willis',40653901,'A_Willis54@hotmail.com','2023-01-16 13:34:57','1978',1,979,'+1-209-950-9017x61323'),
(30,'Sean','Matthews',85250609,'S_Matthews82@yahoo.com','2023-01-16 13:34:57','1971',1,202,'(115)944-2021'),
(31,'Katherine','Baker',45112248,'K_Baker91@gmail.com','2023-01-16 13:34:57','1995',1,637,'553-605-3242'),
(32,'Robert','Baker',44221042,'R_Baker75@hotmail.com','2023-01-16 13:34:57','1987',1,652,'(507)943-0097x7900'),
(33,'Jacob','Hopkins',92660852,'J-Hopkins76@gmail.com','2023-01-16 13:34:57','1971',1,962,'477-072-6332x20467'),
(34,'Chad','Hayes',15682499,'C.Hayes59@yahoo.com','2023-01-16 13:34:57','1957',1,215,'874.613.1182x44846'),
(35,'William','Benson',17421455,'W_Benson56@hotmail.com','2023-01-16 13:34:57','1950',1,754,'001-016-336-8839x742'),
(36,'Amy','Jennings',31012425,'A-Jennings67@yahoo.com','2023-01-16 13:34:57','2009',1,978,'383.743.2971x157'),
(37,'Neil','Baker',77080464,'N_Baker58@gmail.com','2023-01-16 13:34:57','1978',1,556,'(327)229-5865'),
(38,'Anna','Wright',79696484,'A_Wright93@hotmail.com','2023-01-16 13:34:57','1938',1,481,'(397)380-7164x11037'),
(39,'Heather','Jacobs',76055889,'H-Jacobs85@hotmail.com','2023-01-16 13:34:57','1969',1,457,'420.568.8634x9098'),
(40,'Sherri','Jensen',57564239,'S.Jensen62@hotmail.com','2023-01-16 13:34:57','1983',1,493,'475.042.4981'),
(41,'Jeremiah','Cisneros',84813582,'J.Cisneros83@yahoo.com','2023-01-16 13:34:57','1968',1,118,'017.477.1886x00732'),
(42,'Evelyn','Davis',32030763,'E.Davis70@yahoo.com','2023-01-16 13:34:57','1952',1,491,'013-857-6785'),
(43,'Pedro','Gray',96734136,'P.Gray80@yahoo.com','2023-01-16 13:34:57','1967',1,563,'+1-458-967-1394'),
(44,'Andrew','Maldonado',54896539,'A-Maldonado50@hotmail.com','2023-01-16 13:34:57','1985',1,445,'530.671.3945x223'),
(45,'David','Miller',41854120,'D-Miller89@yahoo.com','2023-01-16 13:34:57','1966',1,49,'960-924-4899'),
(46,'Sharon','Richards',21729118,'S_Richards97@hotmail.com','2023-01-16 13:34:57','1970',1,774,'+1-680-654-5046x124'),
(47,'Jessica','Phillips',90565415,'J_Phillips70@yahoo.com','2023-01-16 13:34:57','1974',1,90,'(504)584-3719x533'),
(48,'Dave','Ramirez',62047146,'D.Ramirez50@hotmail.com','2023-01-16 13:34:57','1955',1,897,'100.851.2196x057'),
(49,'Hannah','Alvarez',20826590,'H.Alvarez54@gmail.com','2023-01-16 13:34:57','1957',1,766,'1845462318'),
(50,'Bryan','Thompson',60647238,'B.Thompson68@hotmail.com','2023-01-16 13:34:57','1979',1,896,'(516)837-3242'),
(51,'Crystal','Andersen',66574996,'C.Andersen59@yahoo.com','2023-01-16 13:34:57','2000',1,369,'226-695-2213x2868'),
(52,'Cynthia','Ray',93929923,'C_Ray60@gmail.com','2023-01-16 13:34:57','1983',1,267,'(543)298-7914'),
(53,'Suzanne','Green',24193225,'S.Green59@hotmail.com','2023-01-16 13:34:57','1980',1,343,'001-738-661-0340'),
(54,'Amber','Mckenzie',36246017,'A-Mckenzie81@hotmail.com','2023-01-16 13:34:57','1975',1,539,'(897)565-8531x6995'),
(55,'Patricia','Chambers',13899696,'P-Chambers89@hotmail.com','2023-01-16 13:34:57','1982',1,592,'766.120.8141x9163'),
(56,'Matthew','Richardson',31686786,'M-Richardson57@gmail.com','2023-01-16 13:34:57','1994',1,534,'001-464-208-1106x1275'),
(57,'Richard','Reeves',48588890,'R-Reeves51@hotmail.com','2023-01-16 13:34:57','1963',1,993,'+1-537-902-8834'),
(58,'Tiffany','Owens',30891216,'T_Owens68@gmail.com','2023-01-16 13:34:57','1953',1,403,'653-701-1689'),
(59,'Joseph','Rogers',15139300,'J_Rogers91@gmail.com','2023-01-16 13:34:57','1952',1,754,'001-349-840-7142x89919'),
(60,'Christopher','Wheeler',42240452,'C.Wheeler51@yahoo.com','2023-01-16 13:34:57','1988',1,437,'078.598.7847x2912'),
(61,'Christopher','Zimmerman',38148141,'C.Zimmerman61@hotmail.com','2023-01-16 13:34:57','1967',1,349,'001-521-009-5536x8887'),
(62,'Stephanie','Baird',27852045,'S-Baird85@hotmail.com','2023-01-16 13:34:57','1965',1,881,'713-545-5829'),
(63,'Logan','Sanchez',26440828,'L-Sanchez84@yahoo.com','2023-01-16 13:34:57','1991',1,497,'5195367119'),
(64,'David','Petersen',73528883,'D-Petersen77@yahoo.com','2023-01-16 13:34:57','1968',1,784,'+1-527-113-6584x392'),
(65,'Yvette','Stafford',65840828,'Y.Stafford51@gmail.com','2023-01-16 13:34:57','1977',1,644,'001-927-360-0278x9443'),
(66,'Holly','Joyce',27700367,'H-Joyce69@hotmail.com','2023-01-16 13:34:57','1990',1,541,'001-578-099-5348x3450'),
(67,'Russell','Thompson',18261202,'R_Thompson95@gmail.com','2023-01-16 13:34:57','1999',1,997,'(712)409-8368'),
(68,'George','King',97585042,'G_King94@gmail.com','2023-01-16 13:34:57','1996',1,807,'418.005.4844x297'),
(69,'Matthew','Rogers',80197066,'M_Rogers86@yahoo.com','2023-01-16 13:34:57','1946',1,812,'001-195-355-4365'),
(70,'Jenna','Jones',33102283,'J-Jones95@gmail.com','2023-01-16 13:34:57','1947',1,603,'(678)463-6655x591'),
(71,'Gabrielle','Walton',45817189,'G.Walton78@yahoo.com','2023-01-16 13:34:57','2004',1,324,'(301)012-1985'),
(72,'Robert','Anderson',27477571,'R.Anderson96@hotmail.com','2023-01-16 13:34:57','1975',1,481,'563-243-4447x514'),
(73,'Travis','Bruce',42088772,'T_Bruce77@yahoo.com','2023-01-16 13:34:57','1951',1,23,'714.397.1531'),
(74,'Laurie','Hughes',72885508,'L-Hughes75@yahoo.com','2023-01-16 13:34:57','1974',1,344,'072.712.3971'),
(75,'Lisa','Johnson',16557857,'L_Johnson80@hotmail.com','2023-01-16 13:34:57','1965',1,808,'066-978-5955x78636'),
(76,'Edward','Davis',21482727,'E-Davis89@hotmail.com','2023-01-16 13:34:57','1994',1,202,'1997414514'),
(77,'Eduardo','Lee',26796307,'E.Lee99@yahoo.com','2023-01-16 13:34:57','1973',1,262,'001-779-903-7322x191'),
(78,'Rachel','Stephens',27551383,'R-Stephens50@gmail.com','2023-01-16 13:34:57','1985',1,831,'+1-545-509-6449x3054'),
(79,'Antonio','Francis',52389391,'A-Francis76@yahoo.com','2023-01-16 13:34:57','1991',1,831,'234.050.2720x89818'),
(80,'Michelle','Chan',14270416,'M-Chan94@yahoo.com','2023-01-16 13:34:57','1940',1,47,'948-624-3351'),
(81,'Tracy','Gardner',16113163,'T_Gardner67@hotmail.com','2023-01-16 13:34:57','1958',1,541,'001-867-128-9920x495'),
(82,'Eric','Wilson',76464648,'E.Wilson97@yahoo.com','2023-01-16 13:34:57','1971',1,638,'775.536.6321x7216'),
(83,'Amy','Rosario',14449933,'A.Rosario52@yahoo.com','2023-01-16 13:34:57','1964',1,143,'(224)007-6417x2385'),
(84,'Jennifer','Young',16615076,'J.Young86@yahoo.com','2023-01-16 13:34:57','1973',1,268,'001-655-880-0891x42460'),
(85,'Joseph','Howell',69586604,'J-Howell78@gmail.com','2023-01-16 13:34:57','1967',1,543,'+1-380-688-9221'),
(86,'Kristy','Lee',26279063,'K_Lee79@gmail.com','2023-01-16 13:34:57','1964',1,753,'158.610.8225'),
(87,'Kimberly','Brown',97092964,'K-Brown60@yahoo.com','2023-01-16 13:34:57','1938',1,508,'+1-185-223-4882'),
(88,'Melissa','Thompson',45702343,'M-Thompson82@hotmail.com','2023-01-16 13:34:57','1974',1,247,'001-651-806-8888'),
(89,'David','Foster',30667364,'D-Foster59@gmail.com','2023-01-16 13:34:57','1959',1,472,'(209)811-2337x4217'),
(90,'Mason','Lee',82820914,'M.Lee63@yahoo.com','2023-01-16 13:34:57','1948',1,859,'001-238-001-8455x23635'),
(91,'Alexis','Jimenez',63890454,'A_Jimenez76@yahoo.com','2023-01-16 13:34:57','1996',1,918,'(369)853-9018x49193'),
(92,'Robert','Franklin',11129128,'R_Franklin73@gmail.com','2023-01-16 13:34:57','1949',1,924,'(825)990-3154x31850'),
(93,'Zachary','Richard',46779478,'Z-Richard80@hotmail.com','2023-01-16 13:34:57','2000',1,290,'914-391-6888'),
(94,'Erica','Cox',76803440,'E.Cox57@gmail.com','2023-01-16 13:34:57','2008',1,647,'450.759.1103x417'),
(95,'Douglas','Moore',72350154,'D_Moore84@hotmail.com','2023-01-16 13:34:57','1956',1,350,'722.503.4174x233'),
(96,'Joshua','Bennett',94123973,'J-Bennett90@yahoo.com','2023-01-16 13:34:57','1971',1,760,'377.237.7628x440'),
(97,'Paige','Morris',80090607,'P_Morris54@yahoo.com','2023-01-16 13:34:57','1940',1,743,'269.839.6715'),
(98,'Abigail','Cox',69257675,'A_Cox92@yahoo.com','2023-01-16 13:34:57','1986',1,251,'672.934.4637x36688'),
(99,'Lori','Moses',19868543,'L.Moses70@yahoo.com','2023-01-16 13:34:57','1966',1,153,'(872)845-2662'),
(100,'Frank','Espinoza',17933576,'F-Espinoza92@gmail.com','2023-01-16 13:34:57','1971',1,10,'914-183-7780x0303'),
(101,'Margaret','Krueger',16387929,'M_Krueger77@yahoo.com','2023-01-16 13:34:57','1947',1,145,'+1-093-324-4755x278'),
(102,'Paul','Payne',86546893,'P.Payne79@hotmail.com','2023-01-16 13:34:57','2000',1,477,'(594)321-0940x52436'),
(103,'Randy','Wilson',59775556,'R_Wilson97@gmail.com','2023-01-16 13:34:57','1994',1,999,'+1-504-288-3445x48362'),
(104,'Brandi','Reyes',84506697,'B.Reyes83@yahoo.com','2023-01-16 13:34:57','1971',1,448,'(181)957-5505'),
(105,'Chad','Gonzalez',70642672,'C.Gonzalez93@gmail.com','2023-01-16 13:34:57','1969',1,121,'771.022.8303x06820'),
(106,'Bryan','Richmond',44760541,'B-Richmond66@hotmail.com','2023-01-16 13:34:57','1958',1,472,'021-247-7775x0107'),
(107,'Paul','Fischer',73803729,'P_Fischer92@hotmail.com','2023-01-16 13:34:57','1979',1,287,'+1-607-483-7699x5150'),
(108,'Vanessa','Stanley',84719628,'V_Stanley85@yahoo.com','2023-01-16 13:34:57','2003',1,379,'+1-305-972-0530x60758'),
(109,'Ashley','Fernandez',87351417,'A_Fernandez54@hotmail.com','2023-01-16 13:34:57','1977',1,263,'(260)318-4383'),
(110,'John','Garrison',12386255,'J.Garrison66@gmail.com','2023-01-16 13:34:57','1961',1,759,'634-738-5142x5895'),
(111,'Jessica','Moore',97535616,'J.Moore90@hotmail.com','2023-01-16 13:34:57','1975',1,828,'001-825-892-5101x197'),
(112,'Deborah','Smith',39826224,'D.Smith56@gmail.com','2023-01-16 13:34:57','2006',1,670,'001-720-535-5526'),
(113,'Randy','Lewis',87956639,'R.Lewis91@gmail.com','2023-01-16 13:34:57','1992',1,344,'001-548-785-4316x976'),
(114,'Dawn','Day',82335253,'D_Day92@yahoo.com','2023-01-16 13:34:57','1972',1,592,'414-522-8142x659'),
(115,'Jeffrey','Walter',22240840,'J.Walter51@hotmail.com','2023-01-16 13:34:57','1957',1,16,'(142)701-7456x498'),
(116,'Brandon','Choi',56215427,'B_Choi89@gmail.com','2023-01-16 13:34:57','1998',1,607,'663-717-9526'),
(117,'Jeff','Douglas',30492463,'J_Douglas64@hotmail.com','2023-01-16 13:34:57','1976',1,206,'(958)806-1722'),
(118,'Cody','Schneider',69461776,'C.Schneider80@gmail.com','2023-01-16 13:34:57','2003',1,84,'380-257-5077x98736'),
(119,'Tiffany','Solomon',98071965,'T_Solomon91@yahoo.com','2023-01-16 13:34:57','1964',1,405,'976-374-8213'),
(120,'Mandy','Sullivan',36035824,'M_Sullivan53@yahoo.com','2023-01-16 13:34:57','1978',1,817,'(242)313-6771x604'),
(121,'Leslie','Cooper',84118218,'L-Cooper53@hotmail.com','2023-01-16 13:34:57','1962',1,98,'+1-409-747-6627x207'),
(122,'Michael','Torres',70831235,'M-Torres56@hotmail.com','2023-01-16 13:34:57','1977',1,810,'001-698-933-8675x900'),
(123,'Christopher','Patel',49674059,'C-Patel97@hotmail.com','2023-01-16 13:34:57','1949',1,437,'(447)429-1641x78875'),
(124,'Amanda','Davis',98674501,'A-Davis66@hotmail.com','2023-01-16 13:34:57','1964',1,880,'+1-193-952-5263x5126'),
(125,'Eric','Mann',37484997,'E.Mann92@hotmail.com','2023-01-16 13:34:57','1978',1,479,'(998)659-1986x1503'),
(126,'Melissa','Mills',68090203,'M.Mills86@gmail.com','2023-01-16 13:34:57','1940',1,808,'001-840-608-4154'),
(127,'Alan','Clark',25363218,'A.Clark67@hotmail.com','2023-01-16 13:34:57','2003',1,517,'113.963.1875x98595'),
(128,'Curtis','Ortega',21388378,'C-Ortega97@hotmail.com','2023-01-16 13:34:57','1991',1,379,'(587)881-5543'),
(129,'Dean','Oconnor',27628335,'D_Oconnor89@yahoo.com','2023-01-16 13:34:57','1977',1,227,'779.934.3418x16024'),
(130,'Bailey','Gardner',96990105,'B_Gardner68@hotmail.com','2023-01-16 13:34:57','1975',1,992,'+1-085-027-1089x75836'),
(131,'Michelle','Patel',62168072,'M-Patel68@yahoo.com','2023-01-16 13:34:57','1971',1,301,'+1-710-259-5415'),
(132,'Jennifer','Bennett',21703438,'J-Bennett85@gmail.com','2023-01-16 13:34:57','1978',1,997,'+1-346-785-5558x32953'),
(133,'Lisa','Miller',59164164,'L.Miller75@gmail.com','2023-01-16 13:34:57','1993',1,210,'977-713-1750x69908'),
(134,'Bill','Briggs',49456858,'B_Briggs80@yahoo.com','2023-01-16 13:34:57','2013',1,988,'001-408-653-2892x547'),
(135,'Logan','Ramirez',84755912,'L-Ramirez85@gmail.com','2023-01-16 13:34:57','1933',1,29,'001-983-715-9244x0899'),
(136,'Lauren','Brown',97921761,'L_Brown54@yahoo.com','2023-01-16 13:34:57','1997',1,420,'048.170.6180x891'),
(137,'Tyler','Henderson',76266191,'T-Henderson64@gmail.com','2023-01-16 13:34:57','1988',1,129,'(625)378-3923x087'),
(138,'Katrina','Welch',79533219,'K-Welch82@hotmail.com','2023-01-16 13:34:57','1955',1,130,'(087)280-8279x5675'),
(139,'Justin','Hamilton',23654083,'J_Hamilton67@yahoo.com','2023-01-16 13:34:57','1978',1,816,'+1-928-892-1493'),
(140,'James','Howard',33522271,'J-Howard69@yahoo.com','2023-01-16 13:34:57','1963',1,23,'472-483-3519'),
(141,'Emily','Adams',70231253,'E_Adams79@yahoo.com','2023-01-16 13:34:57','1983',1,799,'001-654-635-1984x26475'),
(142,'Shelia','Tucker',88735504,'S-Tucker85@gmail.com','2023-01-16 13:34:57','1986',1,252,'931.647.2752x48080'),
(143,'Justin','Kelly',41083380,'J_Kelly58@gmail.com','2023-01-16 13:34:57','2005',1,294,'577-468-8227'),
(144,'Nicholas','Poole',18582994,'N_Poole51@yahoo.com','2023-01-16 13:34:57','1943',1,993,'098.810.2004x7490'),
(145,'Thomas','Vasquez',82267448,'T.Vasquez66@hotmail.com','2023-01-16 13:34:57','1977',1,209,'+1-730-472-4024'),
(146,'Leslie','Ramirez',31217959,'L-Ramirez63@hotmail.com','2023-01-16 13:34:57','1963',1,480,'724-906-8846x11231'),
(147,'William','Mejia',93903269,'W_Mejia67@gmail.com','2023-01-16 13:34:57','2014',1,929,'4685943240'),
(148,'Patricia','Rodriguez',41226532,'P-Rodriguez70@yahoo.com','2023-01-16 13:34:57','1954',1,878,'001-562-388-0765x2836'),
(149,'John','Hernandez',28504495,'J_Hernandez91@gmail.com','2023-01-16 13:34:57','1960',1,698,'331.331.1811'),
(150,'Alexander','Stuart',65265292,'A.Stuart85@gmail.com','2023-01-16 13:34:57','1967',1,534,'445-878-9618x48619'),
(151,'Melanie','Turner',57637214,'M_Turner56@gmail.com','2023-01-16 13:34:57','1955',1,858,'+1-939-098-1861x22031'),
(152,'Amber','Stevens',54645227,'A_Stevens65@hotmail.com','2023-01-16 13:34:57','1986',1,509,'+1-990-588-0543'),
(153,'Jared','Burke',33270625,'J_Burke61@yahoo.com','2023-01-16 13:34:57','1971',1,750,'371-673-8449x690'),
(154,'Taylor','Hawkins',67206184,'T-Hawkins79@hotmail.com','2023-01-16 13:34:57','1933',1,405,'4545540520'),
(155,'Karen','Barr',63764105,'K.Barr71@hotmail.com','2023-01-16 13:34:57','1965',1,527,'766.449.8037x06733'),
(156,'Andrea','Barber',48315917,'A-Barber54@yahoo.com','2023-01-16 13:34:57','1936',1,638,'+1-008-733-5792x52135'),
(157,'Eric','Hinton',40723063,'E.Hinton80@yahoo.com','2023-01-16 13:34:57','1978',1,140,'345-791-7906'),
(158,'Heather','Vargas',16307952,'H-Vargas81@yahoo.com','2023-01-16 13:34:57','1973',1,900,'0812552848'),
(159,'Cynthia','Baker',39346179,'C_Baker57@yahoo.com','2023-01-16 13:34:57','1956',1,819,'301.833.4454'),
(160,'Tracey','Clark',72743147,'T.Clark85@hotmail.com','2023-01-16 13:34:57','1978',1,327,'3798717852'),
(161,'Jason','Boyer',31323474,'J_Boyer72@yahoo.com','2023-01-16 13:34:57','1972',1,263,'+1-368-411-6686x469'),
(162,'Diana','Allen',98791118,'D-Allen68@gmail.com','2023-01-16 13:34:57','1942',1,918,'(940)436-7870'),
(163,'Jennifer','Davenport',15706938,'J.Davenport80@gmail.com','2023-01-16 13:34:57','1974',1,541,'001-395-690-0674'),
(164,'Sara','Morales',12287198,'S-Morales94@gmail.com','2023-01-16 13:34:57','1957',1,288,'(806)744-2833x815'),
(165,'Michael','Martinez',75693247,'M_Martinez63@hotmail.com','2023-01-16 13:34:57','1959',1,169,'274.997.4415x629'),
(166,'Karen','Calhoun',44733602,'K_Calhoun68@hotmail.com','2023-01-16 13:34:57','1957',1,13,'(184)794-8268x58892'),
(167,'Ronald','Jones',57507297,'R-Jones63@gmail.com','2023-01-16 13:34:57','1963',1,110,'+1-653-080-8833x6072'),
(168,'Juan','Nguyen',17927080,'J-Nguyen64@yahoo.com','2023-01-16 13:34:57','1982',1,614,'709-083-1591'),
(169,'Dennis','Young',36493445,'D.Young90@hotmail.com','2023-01-16 13:34:57','1954',1,521,'212-685-3215'),
(170,'Ana','Alvarez',10724518,'A_Alvarez52@hotmail.com','2023-01-16 13:34:57','1984',1,203,'426-956-0640x63509'),
(171,'Sarah','Walters',96259886,'S.Walters87@yahoo.com','2023-01-16 13:34:57','1988',1,129,'001-744-881-4881x370'),
(172,'Heather','Parker',64245631,'H-Parker78@gmail.com','2023-01-16 13:34:57','1960',1,148,'(183)082-9594'),
(173,'Nicole','Mcdonald',79692020,'N-Mcdonald92@yahoo.com','2023-01-16 13:34:57','1964',1,58,'6933184680'),
(174,'Jessica','Fuller',36750636,'J-Fuller81@hotmail.com','2023-01-16 13:34:57','1959',1,970,'(947)071-1546x80227'),
(175,'Frederick','Powell',88111753,'F-Powell94@yahoo.com','2023-01-16 13:34:57','1978',1,704,'(747)518-8764x1778'),
(176,'Christopher','Hill',44515296,'C-Hill78@yahoo.com','2023-01-16 13:34:57','1961',1,742,'(089)882-8624x0820'),
(177,'Jessica','Jones',43191616,'J.Jones86@gmail.com','2023-01-16 13:34:57','1981',1,243,'+1-805-606-3805x48319'),
(178,'Charles','Roy',73485542,'C.Roy73@yahoo.com','2023-01-16 13:34:57','1980',1,936,'623-163-6871x7627'),
(179,'Amanda','Smith',50209366,'A-Smith80@yahoo.com','2023-01-16 13:34:57','1991',1,981,'804.479.5975x9302'),
(180,'Allison','Green',29878333,'A.Green84@hotmail.com','2023-01-16 13:34:57','1953',1,139,'2822598764'),
(181,'Karen','Garza',77181752,'K.Garza85@yahoo.com','2023-01-16 13:34:57','1960',1,641,'126.605.2494x10067'),
(182,'Victoria','Ward',87994464,'V-Ward71@yahoo.com','2023-01-16 13:34:57','1981',1,20,'+1-956-675-9721'),
(183,'Emily','Hartman',57064118,'E-Hartman58@gmail.com','2023-01-16 13:34:57','1987',1,640,'(429)372-6474x55354'),
(184,'Bradley','Morales',85182758,'B.Morales76@yahoo.com','2023-01-16 13:34:57','1983',1,424,'300-897-9856'),
(185,'Colton','Moore',51115673,'C.Moore67@gmail.com','2023-01-16 13:34:57','1989',1,169,'001-524-613-4244'),
(186,'Nicole','Morales',65795429,'N.Morales70@gmail.com','2023-01-16 13:34:57','1960',1,609,'+1-937-680-3349'),
(187,'James','Bird',30633509,'J.Bird68@gmail.com','2023-01-16 13:34:57','1996',1,514,'(583)025-4368'),
(188,'Mario','Jackson',62303445,'M_Jackson99@gmail.com','2023-01-16 13:34:57','1975',1,54,'001-897-455-6359'),
(189,'Jonathan','Williams',45994369,'J.Williams67@yahoo.com','2023-01-16 13:34:57','1963',1,686,'+1-105-867-0249'),
(190,'Charles','Lester',39670279,'C-Lester87@gmail.com','2023-01-16 13:34:57','1961',1,306,'(087)062-4158x2730'),
(191,'Michael','Wilson',99096853,'M.Wilson92@yahoo.com','2023-01-16 13:34:57','2004',1,520,'742.092.1630'),
(192,'Steven','Dalton',95122609,'S_Dalton73@yahoo.com','2023-01-16 13:34:57','2000',1,955,'873.825.5606x674'),
(193,'John','Travis',16759151,'J.Travis73@gmail.com','2023-01-16 13:34:57','1987',1,880,'934.667.2259x114'),
(194,'Christina','Hartman',10803929,'C-Hartman86@gmail.com','2023-01-16 13:34:57','1964',1,640,'718.538.8294'),
(195,'Marie','Mckee',86055134,'M_Mckee70@gmail.com','2023-01-16 13:34:57','1991',1,629,'+1-557-009-1648x5676'),
(196,'Paul','Lamb',55528276,'P.Lamb89@gmail.com','2023-01-16 13:34:57','1989',1,100,'290.596.5118'),
(197,'Kellie','Fleming',84298868,'K_Fleming96@hotmail.com','2023-01-16 13:34:57','2007',1,756,'001-281-533-1352x03285'),
(198,'Brandon','Palmer',80588017,'B.Palmer55@yahoo.com','2023-01-16 13:34:57','1993',1,255,'(645)006-9657x6291'),
(199,'Peggy','Jackson',84408082,'P.Jackson68@yahoo.com','2023-01-16 13:34:57','1995',1,229,'001-034-314-9662x32392'),
(200,'Kathleen','Brown',16758038,'K.Brown96@hotmail.com','2023-01-16 13:34:57','1970',1,615,'(164)607-7091'),
(201,'Lori','Gallegos',46379601,'L.Gallegos75@yahoo.com','2023-01-16 13:34:57','1985',1,709,'(707)304-9489'),
(202,'John','Underwood',24967022,'J.Underwood78@gmail.com','2023-01-16 13:34:57','1994',1,585,'+1-142-061-7460'),
(203,'Elizabeth','Bailey',68818896,'E.Bailey88@hotmail.com','2023-01-16 13:34:57','1980',1,666,'881.587.6207'),
(204,'Alexander','Duncan',35051654,'A.Duncan74@hotmail.com','2023-01-16 13:34:57','1968',1,848,'001-287-745-9995x3387'),
(205,'Mark','Scott',75336720,'M-Scott62@yahoo.com','2023-01-16 13:34:57','1985',1,823,'0227864474'),
(206,'Leah','Ayers',51925183,'L.Ayers65@yahoo.com','2023-01-16 13:34:57','1968',1,900,'042-633-4227x417'),
(207,'Robert','Jones',21013762,'R_Jones90@hotmail.com','2023-01-16 13:34:57','1945',1,26,'+1-754-644-8209'),
(208,'Shane','Wade',79802666,'S.Wade60@yahoo.com','2023-01-16 13:34:57','2007',1,673,'415-866-0873'),
(209,'Matthew','Stewart',43176821,'M-Stewart82@yahoo.com','2023-01-16 13:34:57','2008',1,931,'(883)210-6752'),
(210,'John','Jones',22166861,'J_Jones50@gmail.com','2023-01-16 13:34:57','1954',1,743,'(592)443-8469'),
(211,'Brittney','Evans',43501726,'B-Evans80@gmail.com','2023-01-16 13:34:57','1983',1,282,'554.782.3246x19432'),
(212,'Joseph','Allen',75008787,'J_Allen57@hotmail.com','2023-01-16 13:34:57','1997',1,439,'001-179-415-5276'),
(213,'Larry','Ingram',19156286,'L_Ingram98@yahoo.com','2023-01-16 13:34:57','1946',1,535,'863.200.2201x9037'),
(214,'Jason','Frank',44583902,'J_Frank63@hotmail.com','2023-01-16 13:34:57','2012',1,47,'+1-846-994-3501x480'),
(215,'Benjamin','Jennings',88707098,'B_Jennings63@gmail.com','2023-01-16 13:34:57','1951',1,373,'052-910-5194'),
(216,'Mckenzie','Cruz',22701400,'M.Cruz50@hotmail.com','2023-01-16 13:34:57','1997',1,950,'(400)084-6469x55850'),
(217,'Barbara','Conner',88339721,'B_Conner85@yahoo.com','2023-01-16 13:34:57','1959',1,865,'(005)940-3062x991'),
(218,'Paul','Singh',74147167,'P_Singh81@gmail.com','2023-01-16 13:34:57','1968',1,857,'(584)309-6532x96426'),
(219,'James','Rollins',50924877,'J-Rollins56@hotmail.com','2023-01-16 13:34:57','1964',1,475,'5313910606'),
(220,'Suzanne','Smith',40449983,'S-Smith86@gmail.com','2023-01-16 13:34:57','1979',1,10,'554.640.4729x3676'),
(221,'Chelsea','Larson',34032462,'C_Larson65@hotmail.com','2023-01-16 13:34:57','1961',1,963,'+1-543-651-1474'),
(222,'Mary','Nelson',38394089,'M-Nelson79@yahoo.com','2023-01-16 13:34:57','1941',1,878,'546.927.4961x7682'),
(223,'Thomas','Baker',53504126,'T.Baker66@hotmail.com','2023-01-16 13:34:57','1966',1,953,'001-674-506-0053x209'),
(224,'Sarah','Simon',15256959,'S.Simon60@yahoo.com','2023-01-16 13:34:57','1975',1,204,'9244317790'),
(225,'Julie','Cortez',87402582,'J_Cortez94@gmail.com','2023-01-16 13:34:57','1979',1,169,'239-414-0615'),
(226,'Susan','Novak',97145247,'S_Novak81@hotmail.com','2023-01-16 13:34:57','1953',1,477,'+1-273-301-3140x44344'),
(227,'David','Allen',11859643,'D.Allen67@gmail.com','2023-01-16 13:34:57','1949',1,72,'5438020323'),
(228,'Bryan','Jackson',44106291,'B-Jackson72@gmail.com','2023-01-16 13:34:57','1990',1,429,'797-058-9088'),
(229,'Joseph','Scott',12894203,'J-Scott59@gmail.com','2023-01-16 13:34:57','1984',1,234,'297.989.1640x95547'),
(230,'Alexa','Fleming',96395765,'A-Fleming55@hotmail.com','2023-01-16 13:34:57','1986',1,649,'001-787-981-4827'),
(231,'Patrick','Blankenship',78590375,'P_Blankenship95@gmail.com','2023-01-16 13:34:57','1937',1,757,'001-449-684-9850'),
(232,'Jesse','Nichols',80037406,'J-Nichols70@gmail.com','2023-01-16 13:34:57','1958',1,992,'952-045-0255x54121'),
(233,'Madison','Rodriguez',64849402,'M.Rodriguez88@yahoo.com','2023-01-16 13:34:57','1977',1,421,'907-005-7113x2374'),
(234,'Jason','Perez',10785578,'J.Perez66@hotmail.com','2023-01-16 13:34:57','1973',1,113,'+1-432-309-8762x725'),
(235,'Joshua','Cook',30964965,'J_Cook65@yahoo.com','2023-01-16 13:34:57','1965',1,36,'(178)694-1257'),
(236,'Kenneth','Deleon',92874140,'K.Deleon61@yahoo.com','2023-01-16 13:34:57','1944',1,992,'290.114.5506x089'),
(237,'Samantha','Davis',17674740,'S-Davis73@gmail.com','2023-01-16 13:34:57','1979',1,589,'401.978.0934'),
(238,'Ryan','Curtis',91044457,'R_Curtis89@yahoo.com','2023-01-16 13:34:57','1990',1,792,'001-022-592-3725x319'),
(239,'Erica','Duarte',93186035,'E_Duarte96@yahoo.com','2023-01-16 13:34:57','1997',1,570,'(374)688-2171'),
(240,'Dawn','Cortez',12221326,'D.Cortez83@yahoo.com','2023-01-16 13:34:57','2010',1,533,'001-774-420-0825x91317'),
(241,'William','Mcgrath',81848996,'W.Mcgrath91@gmail.com','2023-01-16 13:34:57','1979',1,127,'3799255383'),
(242,'Joe','Gonzales',40228402,'J.Gonzales50@gmail.com','2023-01-16 13:34:57','1953',1,19,'(371)337-9413'),
(243,'Ariana','Hobbs',24766262,'A.Hobbs98@yahoo.com','2023-01-16 13:34:57','1951',1,623,'427-642-8178x131'),
(244,'Courtney','Allen',47467639,'C_Allen80@yahoo.com','2023-01-16 13:34:57','1994',1,223,'(068)825-0653x69749'),
(245,'Justin','Ellis',42181775,'J.Ellis97@yahoo.com','2023-01-16 13:34:57','1984',1,168,'(024)722-0917x86260'),
(246,'Justin','Baxter',91653890,'J.Baxter88@gmail.com','2023-01-16 13:34:57','1991',1,84,'9857512552'),
(247,'Jacqueline','Valenzuela',94895536,'J.Valenzuela62@hotmail.com','2023-01-16 13:34:57','1976',1,589,'7007987026'),
(248,'Brandon','Torres',67147536,'B.Torres50@yahoo.com','2023-01-16 13:34:57','1984',1,44,'521.187.2214'),
(249,'Kent','Anderson',52126908,'K_Anderson72@gmail.com','2023-01-16 13:34:57','1961',1,152,'311.417.4694'),
(250,'Erica','Munoz',84679887,'E.Munoz63@hotmail.com','2023-01-16 13:34:57','1992',1,502,'962-898-3905x89167'),
(251,'Joseph','Davis',20915942,'J.Davis50@yahoo.com','2023-01-16 13:34:57','1977',1,861,'001-967-878-0985x38332'),
(252,'Victor','Robinson',21960996,'V-Robinson86@hotmail.com','2023-01-16 13:34:57','1995',1,989,'571.200.3091'),
(253,'Aimee','Floyd',94529912,'A-Floyd55@yahoo.com','2023-01-16 13:34:57','1941',1,779,'4975892565'),
(254,'Edward','Eaton',55737824,'E-Eaton63@gmail.com','2023-01-16 13:34:57','1968',1,986,'001-327-241-4634x0177'),
(255,'Felicia','Lopez',22953026,'F-Lopez95@yahoo.com','2023-01-16 13:34:57','1984',1,603,'7272425123'),
(256,'Larry','Moore',73275399,'L.Moore82@gmail.com','2023-01-16 13:34:57','1972',1,196,'001-195-633-1498'),
(257,'Ruth','Palmer',37169780,'R_Palmer55@yahoo.com','2023-01-16 13:34:57','1952',1,1,'059.649.3327'),
(258,'Rachel','Rios',24565561,'R-Rios61@hotmail.com','2023-01-16 13:34:57','1944',1,92,'822.997.6485'),
(259,'Julie','Pham',64927811,'J_Pham91@hotmail.com','2023-01-16 13:34:57','1953',1,640,'9032226752'),
(260,'Caitlin','Williams',81830549,'C-Williams76@gmail.com','2023-01-16 13:34:57','2000',1,506,'593-538-8224x132'),
(261,'Nicholas','Martin',28455212,'N.Martin54@yahoo.com','2023-01-16 13:34:57','1986',1,680,'284-503-1160x09708'),
(262,'Sarah','Collins',34485823,'S-Collins74@hotmail.com','2023-01-16 13:34:57','1949',1,764,'109-556-4605x5299'),
(263,'Kayla','Kline',87422266,'K.Kline65@hotmail.com','2023-01-16 13:34:57','1961',1,99,'691.689.9999'),
(264,'Andre','Hicks',81385500,'A.Hicks65@yahoo.com','2023-01-16 13:34:57','1947',1,447,'+1-453-101-8593'),
(265,'John','Simpson',48921579,'J-Simpson82@hotmail.com','2023-01-16 13:34:57','1965',1,547,'309-513-6519'),
(266,'Dominic','Mcclain',16425980,'D.Mcclain68@hotmail.com','2023-01-16 13:34:57','1990',1,904,'812.479.6593'),
(267,'Stephanie','Munoz',47450572,'S_Munoz55@gmail.com','2023-01-16 13:34:57','1976',1,965,'658-212-0985'),
(268,'Molly','Mitchell',76595853,'M_Mitchell85@yahoo.com','2023-01-16 13:34:57','1988',1,670,'(744)048-8714x796'),
(269,'Rodney','Martinez',96728858,'R_Martinez68@hotmail.com','2023-01-16 13:34:57','1970',1,588,'(416)579-6156x0932'),
(270,'Heather','Grant',25932030,'H_Grant64@yahoo.com','2023-01-16 13:34:57','1966',1,956,'158-971-6414x63679'),
(271,'Stacy','Bishop',30488235,'S_Bishop71@yahoo.com','2023-01-16 13:34:57','1972',1,642,'+1-029-491-5789x82785'),
(272,'Brandon','Williams',47777086,'B_Williams87@hotmail.com','2023-01-16 13:34:57','1949',1,812,'675-780-7945'),
(273,'Marvin','Taylor',28014572,'M-Taylor75@gmail.com','2023-01-16 13:34:57','1986',1,205,'294-794-9552x188'),
(274,'Andrew','Walsh',57935171,'A_Walsh74@gmail.com','2023-01-16 13:34:57','1986',1,727,'(847)961-8117'),
(275,'Barbara','Casey',50712763,'B_Casey64@yahoo.com','2023-01-16 13:34:57','1967',1,931,'010-419-5867'),
(276,'Edward','Hernandez',99057239,'E.Hernandez86@hotmail.com','2023-01-16 13:34:57','1953',1,710,'6652271360'),
(277,'Duane','Fisher',10178960,'D_Fisher68@hotmail.com','2023-01-16 13:34:57','1983',1,433,'(486)817-6959x8880'),
(278,'William','Patterson',41851420,'W.Patterson59@hotmail.com','2023-01-16 13:34:57','1982',1,408,'(466)683-7303'),
(279,'Bonnie','Oconnor',79731535,'B_Oconnor88@gmail.com','2023-01-16 13:34:57','1983',1,622,'(689)469-7149'),
(280,'Patricia','Clayton',11999764,'P_Clayton95@yahoo.com','2023-01-16 13:34:57','2012',1,881,'701-152-4977x170'),
(281,'Albert','Nelson',29203736,'A-Nelson98@hotmail.com','2023-01-16 13:34:57','1968',1,931,'909.445.1203'),
(282,'Joshua','Alvarez',72286239,'J_Alvarez66@hotmail.com','2023-01-16 13:34:57','1967',1,139,'850.959.1032x0235'),
(283,'Bryan','Bean',19417290,'B-Bean94@gmail.com','2023-01-16 13:34:57','1976',1,128,'9838962936'),
(284,'Edward','Bailey',59169100,'E_Bailey72@yahoo.com','2023-01-16 13:34:57','1944',1,997,'+1-763-142-8300x714'),
(285,'Jodi','Sandoval',15711806,'J.Sandoval79@gmail.com','2023-01-16 13:34:57','1979',1,555,'+1-859-849-2881x2449'),
(286,'Jake','Mcknight',61770100,'J_Mcknight93@hotmail.com','2023-01-16 13:34:57','1991',1,376,'803-850-1262'),
(287,'Tonya','Ferguson',87457041,'T.Ferguson96@yahoo.com','2023-01-16 13:34:57','1989',1,755,'001-030-811-7304'),
(288,'Charles','Harris',28873322,'C.Harris76@gmail.com','2023-01-16 13:34:57','1987',1,572,'001-880-414-5723'),
(289,'Rhonda','Ortiz',16113128,'R-Ortiz56@hotmail.com','2023-01-16 13:34:57','1989',1,192,'001-589-161-5720x30121'),
(290,'Brent','Miller',73013948,'B.Miller95@yahoo.com','2023-01-16 13:34:57','1935',1,114,'+1-434-377-9418x024'),
(291,'Brandon','Long',53699987,'B.Long54@yahoo.com','2023-01-16 13:34:57','1978',1,444,'+1-320-487-9145x4006'),
(292,'Justin','Burnett',13271899,'J.Burnett51@gmail.com','2023-01-16 13:34:57','1982',1,428,'866-834-6637x59062'),
(293,'Jerry','Williams',30704278,'J-Williams56@hotmail.com','2023-01-16 13:34:57','1957',1,692,'5834574038'),
(294,'Michael','Snow',49036110,'M.Snow77@hotmail.com','2023-01-16 13:34:57','1984',1,187,'550.940.0881x452'),
(295,'Mark','Martinez',14428273,'M_Martinez90@hotmail.com','2023-01-16 13:34:57','1966',1,995,'528.795.9027x67399'),
(296,'Timothy','Giles',61076582,'T.Giles82@gmail.com','2023-01-16 13:34:57','1968',1,594,'967.794.1417x64882'),
(297,'Thomas','Smith',92480268,'T.Smith93@hotmail.com','2023-01-16 13:34:57','1949',1,86,'(389)386-4705'),
(298,'Anthony','Wagner',72472548,'A_Wagner65@hotmail.com','2023-01-16 13:34:57','1997',1,921,'001-737-464-4545x72127'),
(299,'Fred','Wade',87331649,'F.Wade97@yahoo.com','2023-01-16 13:34:57','1993',1,868,'+1-639-010-3493x381'),
(300,'John','Steele',86373720,'J.Steele86@hotmail.com','2023-01-16 13:34:57','2010',1,757,'(748)559-5014x397'),
(301,'Bryan','Berry',60207284,'B-Berry78@yahoo.com','2023-01-16 13:34:57','1983',1,485,'(732)079-9637x21517'),
(302,'Sandy','Cole',57370999,'S_Cole74@yahoo.com','2023-01-16 13:34:57','1977',1,558,'+1-278-963-6356x81407'),
(303,'Melissa','Cline',89848940,'M_Cline50@yahoo.com','2023-01-16 13:34:57','2011',1,303,'001-435-077-1789x593'),
(304,'Kevin','Guzman',63465393,'K-Guzman55@gmail.com','2023-01-16 13:34:57','1966',1,347,'001-665-292-9232'),
(305,'Gene','Medina',74587092,'G_Medina88@hotmail.com','2023-01-16 13:34:57','1979',1,424,'+1-691-054-3870x08310'),
(306,'Michele','Thomas',43724590,'M.Thomas69@hotmail.com','2023-01-16 13:34:57','1969',1,685,'215-301-5537'),
(307,'Justin','Mendez',35627005,'J_Mendez50@gmail.com','2023-01-16 13:34:57','1981',1,152,'+1-268-664-1459'),
(308,'Jennifer','Riddle',93159531,'J.Riddle86@gmail.com','2023-01-16 13:34:57','1981',1,30,'729-633-6434'),
(309,'Gary','Smith',49266331,'G_Smith79@hotmail.com','2023-01-16 13:34:57','1948',1,298,'001-040-024-6974x7729'),
(310,'Annette','Duran',24654089,'A.Duran93@gmail.com','2023-01-16 13:34:57','1966',1,191,'8608409853'),
(311,'John','Carter',50020778,'J.Carter84@yahoo.com','2023-01-16 13:34:57','1998',1,84,'(989)176-4225x431'),
(312,'Sean','Campbell',59524062,'S.Campbell68@hotmail.com','2023-01-16 13:34:57','1963',1,299,'(410)978-5827x8954'),
(313,'Rebekah','Boyd',34411290,'R_Boyd60@gmail.com','2023-01-16 13:34:57','2009',1,215,'651-218-1736x849'),
(314,'Erica','Smith',22872626,'E-Smith62@yahoo.com','2023-01-16 13:34:57','1957',1,262,'(315)465-5725x1566'),
(315,'Brent','Madden',45594873,'B_Madden50@gmail.com','2023-01-16 13:34:57','1948',1,10,'763.892.7290x13433'),
(316,'Brian','Townsend',39102501,'B.Townsend54@yahoo.com','2023-01-16 13:34:57','1955',1,19,'596-550-8240'),
(317,'John','Espinoza',26085887,'J-Espinoza69@yahoo.com','2023-01-16 13:34:57','1968',1,212,'+1-684-870-7032x6658'),
(318,'Frances','Sullivan',46735853,'F-Sullivan62@gmail.com','2023-01-16 13:34:57','2002',1,106,'+1-128-654-6045x381'),
(319,'Nicholas','Smith',99588777,'N.Smith77@yahoo.com','2023-01-16 13:34:57','1998',1,912,'195.621.2471x6941'),
(320,'Jason','Strong',16472984,'J-Strong57@yahoo.com','2023-01-16 13:34:57','1979',1,755,'+1-512-218-3264x338'),
(321,'William','Bennett',68206727,'W.Bennett67@hotmail.com','2023-01-16 13:34:57','2001',1,485,'437-505-5210x354'),
(322,'Noah','Hammond',82662602,'N-Hammond70@gmail.com','2023-01-16 13:34:57','1966',1,611,'727.458.6941x250'),
(323,'Jessica','Solis',84403788,'J-Solis68@hotmail.com','2023-01-16 13:34:57','1947',1,857,'067.529.5816'),
(324,'Madison','Mack',94471729,'M.Mack70@gmail.com','2023-01-16 13:34:57','1959',1,661,'(642)750-7946'),
(325,'Melissa','Morgan',49846370,'M-Morgan88@gmail.com','2023-01-16 13:34:57','1936',1,828,'(652)686-5377x19666'),
(326,'Nicholas','Jones',40081187,'N_Jones94@yahoo.com','2023-01-16 13:34:57','1965',1,525,'2037197749'),
(327,'Kelly','Watson',55188994,'K-Watson58@gmail.com','2023-01-16 13:34:57','1951',1,138,'+1-019-259-8538x1453'),
(328,'Anthony','Nichols',81702148,'A_Nichols76@yahoo.com','2023-01-16 13:34:57','1984',1,517,'(015)116-3112x40693'),
(329,'Kevin','Le',34109658,'K.Le50@yahoo.com','2023-01-16 13:34:57','1986',1,605,'(598)464-9725'),
(330,'Noah','Boyd',71882691,'N.Boyd51@yahoo.com','2023-01-16 13:34:57','1992',1,796,'573.843.2804'),
(331,'Amy','Castro',48003039,'A_Castro94@yahoo.com','2023-01-16 13:34:57','1969',1,46,'089-211-1795x07594'),
(332,'Jessica','Lawson',17324176,'J-Lawson69@hotmail.com','2023-01-16 13:34:57','1995',1,329,'674.168.6407'),
(333,'Brian','Reyes',73350857,'B.Reyes92@hotmail.com','2023-01-16 13:34:57','1972',1,749,'961-177-6712'),
(334,'Joe','Marquez',83054410,'J_Marquez92@gmail.com','2023-01-16 13:34:57','1955',1,957,'001-670-735-6225'),
(335,'Carlos','Hudson',36715989,'C-Hudson86@hotmail.com','2023-01-16 13:34:57','1970',1,85,'322.868.6413'),
(336,'Melanie','Hughes',16421365,'M-Hughes64@hotmail.com','2023-01-16 13:34:57','1983',1,103,'(984)790-3058x729'),
(337,'William','Clark',16529861,'W.Clark64@hotmail.com','2023-01-16 13:34:57','1992',1,441,'1095739882'),
(338,'Kenneth','Juarez',43786040,'K_Juarez84@hotmail.com','2023-01-16 13:34:57','1943',1,676,'316-999-9179'),
(339,'Lauren','Williams',92999522,'L_Williams99@yahoo.com','2023-01-16 13:34:57','2002',1,406,'888-759-5850x8836'),
(340,'Cynthia','Williams',98493778,'C.Williams93@hotmail.com','2023-01-16 13:34:57','1936',1,73,'(675)580-3515x16462'),
(341,'Thomas','Peters',69773024,'T-Peters78@hotmail.com','2023-01-16 13:34:57','1959',1,870,'001-464-556-3206x080'),
(342,'Virginia','Clark',86538106,'V_Clark57@hotmail.com','2023-01-16 13:34:57','1986',1,979,'259.636.3119x6793'),
(343,'Carl','Perez',61576402,'C-Perez80@gmail.com','2023-01-16 13:34:57','1999',1,129,'(858)105-5191'),
(344,'Rachael','Petersen',37921864,'R.Petersen90@gmail.com','2023-01-16 13:34:57','1952',1,98,'001-785-210-2979'),
(345,'Matthew','Miller',37057858,'M_Miller76@hotmail.com','2023-01-16 13:34:57','1973',1,24,'+1-776-033-3480x237'),
(346,'Stephen','Henson',22761462,'S_Henson89@yahoo.com','2023-01-16 13:34:57','1998',1,510,'066-765-4544x68332'),
(347,'Gary','Foley',28579734,'G-Foley67@hotmail.com','2023-01-16 13:34:57','1946',1,892,'(029)357-6516x591'),
(348,'James','Golden',49566049,'J-Golden51@gmail.com','2023-01-16 13:34:57','1987',1,151,'(787)581-5355'),
(349,'Vicki','Jones',51068575,'V-Jones80@hotmail.com','2023-01-16 13:34:57','2011',1,405,'(999)717-5000'),
(350,'Marc','Jenkins',49459282,'M-Jenkins77@hotmail.com','2023-01-16 13:34:57','1943',1,660,'364-538-9688'),
(351,'Jennifer','Leon',65217022,'J-Leon69@gmail.com','2023-01-16 13:34:57','1966',1,119,'+1-587-554-6782x19367'),
(352,'Robin','Krause',29616250,'R.Krause60@hotmail.com','2023-01-16 13:34:57','1997',1,102,'523-129-1885x21173'),
(353,'Patrick','Griffin',70697109,'P_Griffin71@yahoo.com','2023-01-16 13:34:57','1987',1,700,'(420)479-7209'),
(354,'Stephanie','Johnson',51422770,'S-Johnson51@gmail.com','2023-01-16 13:34:57','1992',1,918,'(414)153-7699x011'),
(355,'Leslie','Tran',83314598,'L-Tran84@yahoo.com','2023-01-16 13:34:57','1974',1,272,'(912)028-5779'),
(356,'Shannon','Huber',49337303,'S-Huber70@gmail.com','2023-01-16 13:34:57','1966',1,541,'001-119-929-7954x30960'),
(357,'Rebecca','Rodriguez',31207871,'R-Rodriguez73@yahoo.com','2023-01-16 13:34:57','1948',1,8,'001-579-593-3671x76318'),
(358,'Christina','Thomas',35013053,'C-Thomas91@gmail.com','2023-01-16 13:34:57','1985',1,215,'838-854-7765'),
(359,'Michael','White',88138811,'M_White68@hotmail.com','2023-01-16 13:34:57','1954',1,860,'196.618.6146x434'),
(360,'Michael','Wiggins',20881514,'M_Wiggins99@gmail.com','2023-01-16 13:34:57','2000',1,684,'841-006-1141x25840'),
(361,'Robert','Hawkins',30740433,'R_Hawkins83@yahoo.com','2023-01-16 13:34:57','1967',1,118,'001-366-426-5525'),
(362,'Steven','Johnson',10473848,'S_Johnson99@yahoo.com','2023-01-16 13:34:57','1965',1,377,'(823)228-9330'),
(363,'Jon','Moore',58892820,'J-Moore99@yahoo.com','2023-01-16 13:34:57','1969',1,251,'001-517-190-2812'),
(364,'Zachary','Chavez',88912842,'Z_Chavez64@yahoo.com','2023-01-16 13:34:57','1949',1,147,'+1-828-055-2692'),
(365,'Jessica','Howard',12314341,'J.Howard98@hotmail.com','2023-01-16 13:34:57','1974',1,288,'001-775-083-1067x634'),
(366,'Beth','Gill',25190113,'B.Gill90@gmail.com','2023-01-16 13:34:57','1958',1,66,'(962)613-1395x19174'),
(367,'Alexander','Parker',84884902,'A_Parker90@gmail.com','2023-01-16 13:34:57','1990',1,222,'(294)122-0314x8460'),
(368,'Susan','Ward',97182274,'S-Ward78@hotmail.com','2023-01-16 13:34:57','1982',1,901,'(214)976-3268'),
(369,'Margaret','Wright',17670088,'M.Wright62@hotmail.com','2023-01-16 13:34:57','1963',1,482,'0654402427'),
(370,'William','Bates',47792699,'W_Bates69@yahoo.com','2023-01-16 13:34:57','1948',1,249,'468.483.2101x300'),
(371,'Emma','Phillips',96946462,'E_Phillips58@yahoo.com','2023-01-16 13:34:57','1984',1,697,'(487)696-6843x42141'),
(372,'Megan','Goodwin',13303218,'M.Goodwin55@gmail.com','2023-01-16 13:34:57','1967',1,782,'001-756-070-0796x50248'),
(373,'Nicholas','Barber',54049693,'N-Barber53@gmail.com','2023-01-16 13:34:57','1974',1,483,'001-613-651-0007'),
(374,'Scott','Wilson',59613689,'S_Wilson73@yahoo.com','2023-01-16 13:34:57','1974',1,361,'(144)556-1812x185'),
(375,'Kristen','Morrow',85780381,'K.Morrow57@gmail.com','2023-01-16 13:34:57','1977',1,191,'7448004863'),
(376,'Antonio','Benitez',18169695,'A-Benitez74@gmail.com','2023-01-16 13:34:57','1989',1,370,'987-698-2311x34884'),
(377,'Sarah','Salas',62233002,'S_Salas78@gmail.com','2023-01-16 13:34:57','1974',1,320,'001-017-870-4771'),
(378,'Katrina','Pitts',47832649,'K_Pitts75@yahoo.com','2023-01-16 13:34:57','1997',1,589,'001-588-225-2558x713'),
(379,'Matthew','Powell',15735566,'M.Powell77@yahoo.com','2023-01-16 13:34:57','1992',1,77,'001-594-428-7199x179'),
(380,'Jessica','Hill',19879536,'J_Hill63@gmail.com','2023-01-16 13:34:57','1984',1,678,'(753)817-8784x55040'),
(381,'Erin','Alvarado',83400091,'E.Alvarado72@hotmail.com','2023-01-16 13:34:57','1970',1,98,'+1-570-615-9466x553'),
(382,'Joshua','Miller',57499238,'J-Miller79@yahoo.com','2023-01-16 13:34:57','1944',1,574,'642.311.8134'),
(383,'Alice','Lee',11338367,'A_Lee62@gmail.com','2023-01-16 13:34:57','1966',1,725,'(824)914-3954x2347'),
(384,'Nancy','Moore',78168494,'N_Moore77@gmail.com','2023-01-16 13:34:57','1960',1,235,'(934)561-8213'),
(385,'Lisa','Hensley',12763725,'L-Hensley85@hotmail.com','2023-01-16 13:34:57','1989',1,514,'8045453055'),
(386,'Joseph','Garcia',87881589,'J_Garcia95@yahoo.com','2023-01-16 13:34:57','1992',1,667,'(449)426-9664x129'),
(387,'Pamela','Becker',61979694,'P-Becker85@gmail.com','2023-01-16 13:34:57','1957',1,857,'120-979-3211'),
(388,'Christopher','Green',96854632,'C_Green76@yahoo.com','2023-01-16 13:34:57','2004',1,93,'+1-535-756-6235x58220'),
(389,'Christopher','Adkins',12985594,'C.Adkins64@hotmail.com','2023-01-16 13:34:57','1969',1,594,'093-458-2883'),
(390,'Ricardo','Harris',46189445,'R_Harris58@gmail.com','2023-01-16 13:34:57','1961',1,370,'215.693.2795'),
(391,'Amanda','Spencer',66988140,'A_Spencer65@hotmail.com','2023-01-16 13:34:57','1963',1,798,'038.192.5034'),
(392,'Timothy','Castillo',76056334,'T_Castillo93@gmail.com','2023-01-16 13:34:57','1972',1,700,'918.990.9511'),
(393,'Michele','Coleman',71684912,'M.Coleman52@gmail.com','2023-01-16 13:34:57','1993',1,386,'320-697-0841x2306'),
(394,'Adam','Chapman',38070309,'A_Chapman94@hotmail.com','2023-01-16 13:34:57','1986',1,765,'4008578893'),
(395,'Jasmin','Fox',15124190,'J-Fox66@hotmail.com','2023-01-16 13:34:57','1981',1,929,'(148)414-0610x092'),
(396,'Carol','Duncan',98020779,'C_Duncan56@hotmail.com','2023-01-16 13:34:57','1991',1,840,'(447)447-2169x7623'),
(397,'Caroline','Greene',43480385,'C.Greene75@gmail.com','2023-01-16 13:34:57','1974',1,916,'1623436665'),
(398,'Rachel','Hunt',83770277,'R.Hunt72@hotmail.com','2023-01-16 13:34:57','2002',1,906,'844.021.8692x13617'),
(399,'Thomas','Allen',61593403,'T-Allen68@hotmail.com','2023-01-16 13:34:57','1945',1,324,'896.780.1693'),
(400,'Elizabeth','Sparks',11820682,'E-Sparks82@gmail.com','2023-01-16 13:34:57','1960',1,502,'001-598-316-9375x9573'),
(401,'Sierra','Pena',82981462,'S-Pena86@gmail.com','2023-01-16 13:34:57','1950',1,766,'001-189-716-6696'),
(402,'Melissa','Rojas',30571582,'M.Rojas82@yahoo.com','2023-01-16 13:34:57','1952',1,392,'600.890.2339x234'),
(403,'David','Cuevas',11846698,'D_Cuevas60@yahoo.com','2023-01-16 13:34:57','1985',1,976,'522-337-9393'),
(404,'Jeffrey','Daniel',70122037,'J-Daniel81@hotmail.com','2023-01-16 13:34:57','1981',1,524,'001-047-169-9433'),
(405,'Charles','Skinner',39710115,'C-Skinner66@yahoo.com','2023-01-16 13:34:57','1951',1,383,'+1-894-542-8468x87511'),
(406,'Marcus','Coleman',15854652,'M-Coleman57@yahoo.com','2023-01-16 13:34:57','1962',1,313,'+1-448-020-7708x65087'),
(407,'Chase','Price',38484111,'C_Price69@gmail.com','2023-01-16 13:34:57','1971',1,534,'742.934.5150'),
(408,'Harold','Sanchez',38075560,'H-Sanchez71@hotmail.com','2023-01-16 13:34:57','1953',1,894,'528.238.6385x716'),
(409,'Leonard','Miller',83860835,'L.Miller77@hotmail.com','2023-01-16 13:34:57','1953',1,917,'001-314-139-7333'),
(410,'Anne','Wright',74973692,'A_Wright86@yahoo.com','2023-01-16 13:34:57','1989',1,670,'(301)279-7838'),
(411,'Bryan','Weaver',86877990,'B.Weaver91@hotmail.com','2023-01-16 13:34:57','1994',1,859,'(899)756-1415x12730'),
(412,'Juan','Davis',17822515,'J-Davis72@yahoo.com','2023-01-16 13:34:57','1989',1,102,'819.670.6559'),
(413,'Caitlyn','Acosta',25817565,'C-Acosta62@yahoo.com','2023-01-16 13:34:57','1976',1,487,'8063503252'),
(414,'Sean','Chaney',94126044,'S.Chaney53@hotmail.com','2023-01-16 13:34:57','1989',1,178,'001-522-248-2417x195'),
(415,'Jordan','Webb',22173586,'J.Webb99@gmail.com','2023-01-16 13:34:57','1997',1,35,'+1-328-947-3635x058'),
(416,'Kelsey','White',91739116,'K-White68@hotmail.com','2023-01-16 13:34:57','1942',1,457,'215-077-8233'),
(417,'Robert','Anderson',48640794,'R_Anderson98@gmail.com','2023-01-16 13:34:57','1983',1,663,'127-038-8819x17417'),
(418,'Jeffrey','Gonzalez',73317627,'J-Gonzalez76@yahoo.com','2023-01-16 13:34:57','1977',1,593,'4819551628'),
(419,'Richard','Barrett',66689492,'R_Barrett76@gmail.com','2023-01-16 13:34:57','1949',1,908,'+1-066-518-7693x272'),
(420,'Crystal','Boone',10724952,'C.Boone52@yahoo.com','2023-01-16 13:34:57','1983',1,884,'200-181-0530x285'),
(421,'David','Dunn',33659876,'D_Dunn85@yahoo.com','2023-01-16 13:34:57','1987',1,444,'001-168-213-8971x255'),
(422,'Eric','Hamilton',45657829,'E.Hamilton69@hotmail.com','2023-01-16 13:34:57','1975',1,36,'673.885.1680'),
(423,'Wyatt','Wallace',99511141,'W_Wallace55@gmail.com','2023-01-16 13:34:57','1964',1,953,'583-755-2690x293'),
(424,'Brian','Hall',72422654,'B_Hall94@gmail.com','2023-01-16 13:34:57','1967',1,648,'001-341-773-7196'),
(425,'Jeffrey','Sharp',73605785,'J-Sharp89@yahoo.com','2023-01-16 13:34:57','1966',1,399,'001-454-954-5256x46520'),
(426,'Corey','Snyder',45113747,'C_Snyder56@yahoo.com','2023-01-16 13:34:57','1948',1,873,'9593012188'),
(427,'Jimmy','Mercado',84406371,'J.Mercado51@yahoo.com','2023-01-16 13:34:57','1946',1,167,'+1-122-845-6841x87695'),
(428,'Marissa','Mcfarland',86435736,'M_Mcfarland58@gmail.com','2023-01-16 13:34:57','1989',1,422,'(066)038-1052x94470'),
(429,'Crystal','Fernandez',14796772,'C-Fernandez63@gmail.com','2023-01-16 13:34:57','1988',1,34,'593.263.0417x1720'),
(430,'Walter','Moore',21813190,'W_Moore82@hotmail.com','2023-01-16 13:34:57','1951',1,349,'718-429-1535x148'),
(431,'Chad','Stewart',94003143,'C-Stewart85@yahoo.com','2023-01-16 13:34:57','1995',1,780,'+1-617-210-8339x64087'),
(432,'Jessica','Bartlett',10622178,'J.Bartlett71@hotmail.com','2023-01-16 13:34:57','1973',1,542,'001-737-789-6880x323'),
(433,'Sarah','Smith',18841763,'S.Smith98@gmail.com','2023-01-16 13:34:57','1981',1,451,'(027)665-6561x1654'),
(434,'Jason','Cook',17074169,'J-Cook82@gmail.com','2023-01-16 13:34:57','1947',1,611,'001-483-247-2172x691'),
(435,'Luis','Shaw',65094321,'L_Shaw66@yahoo.com','2023-01-16 13:34:57','1989',1,16,'+1-351-739-0893x3701'),
(436,'Jeffrey','Cunningham',60090065,'J_Cunningham70@hotmail.com','2023-01-16 13:34:57','1984',1,72,'(817)615-7491x723'),
(437,'Riley','Barnes',94998955,'R-Barnes87@yahoo.com','2023-01-16 13:34:57','1953',1,561,'001-204-868-2019'),
(438,'Stephanie','Williams',65769827,'S-Williams62@hotmail.com','2023-01-16 13:34:57','1962',1,783,'413-751-9713'),
(439,'Krista','Ferguson',85998253,'K-Ferguson66@yahoo.com','2023-01-16 13:34:57','1957',1,47,'041.033.2800x5784'),
(440,'David','Morrow',34284039,'D_Morrow52@gmail.com','2023-01-16 13:34:57','1965',1,428,'(652)486-6719'),
(441,'Nicole','Cole',73439770,'N_Cole79@yahoo.com','2023-01-16 13:34:57','1950',1,76,'+1-299-782-8757x66053'),
(442,'Melvin','Pollard',23289473,'M.Pollard90@gmail.com','2023-01-16 13:34:57','1962',1,511,'5142593412'),
(443,'Melissa','Roberts',33053391,'M.Roberts67@gmail.com','2023-01-16 13:34:57','1944',1,301,'801-182-1073x35035'),
(444,'David','Lawson',59029171,'D.Lawson63@gmail.com','2023-01-16 13:34:57','1983',1,34,'+1-374-170-5896x48320'),
(445,'Randall','Gonzalez',55660989,'R-Gonzalez84@yahoo.com','2023-01-16 13:34:57','1985',1,354,'288.309.8504x366'),
(446,'Sandra','Wright',55668875,'S_Wright86@gmail.com','2023-01-16 13:34:57','1993',1,711,'+1-402-746-7560'),
(447,'Pedro','Barnes',47458710,'P_Barnes74@gmail.com','2023-01-16 13:34:57','1978',1,230,'+1-017-313-6166x4490'),
(448,'Ellen','Hawkins',36334837,'E.Hawkins64@gmail.com','2023-01-16 13:34:57','1991',1,40,'(811)680-5398x439'),
(449,'Ronald','Nelson',15639305,'R_Nelson78@hotmail.com','2023-01-16 13:34:57','1969',1,507,'+1-494-336-2552x7835'),
(450,'Timothy','Snow',34603204,'T_Snow70@yahoo.com','2023-01-16 13:34:57','1979',1,163,'001-510-627-8549x62969'),
(451,'Mitchell','Gomez',10701211,'M.Gomez87@gmail.com','2023-01-16 13:34:57','1980',1,613,'(785)858-6640x52129'),
(452,'Darlene','Goodman',16837746,'D.Goodman80@yahoo.com','2023-01-16 13:34:57','1977',1,453,'001-232-826-6778x384'),
(453,'Joshua','Miller',67793175,'J_Miller66@yahoo.com','2023-01-16 13:34:57','1963',1,100,'611.864.1345x32581'),
(454,'Wendy','Reed',41674194,'W.Reed98@hotmail.com','2023-01-16 13:34:57','1954',1,78,'001-037-660-0977'),
(455,'Nathan','Edwards',44023752,'N.Edwards81@hotmail.com','2023-01-16 13:34:57','1974',1,95,'705.757.3881x99756'),
(456,'Michael','Gregory',34318619,'M_Gregory82@gmail.com','2023-01-16 13:34:57','1966',1,765,'778-367-6124x67415'),
(457,'Bradley','Wilkins',81287318,'B-Wilkins70@yahoo.com','2023-01-16 13:34:57','1955',1,751,'641-798-5906x7967'),
(458,'Jeffrey','Martin',92354539,'J-Martin61@hotmail.com','2023-01-16 13:34:57','2014',1,864,'2754773395'),
(459,'Natalie','Little',12673240,'N-Little89@gmail.com','2023-01-16 13:34:57','1954',1,252,'(078)717-1846'),
(460,'Tracy','Brown',24321937,'T_Brown78@gmail.com','2023-01-16 13:34:57','1963',1,840,'282.726.1100'),
(461,'Brittany','Poole',43139573,'B-Poole90@hotmail.com','2023-01-16 13:34:57','1956',1,716,'494.935.9433x82422'),
(462,'Larry','Brooks',41561988,'L.Brooks67@gmail.com','2023-01-16 13:34:57','1965',1,860,'988.810.9642x7603'),
(463,'Tiffany','Valenzuela',15913652,'T_Valenzuela80@yahoo.com','2023-01-16 13:34:57','1979',1,691,'(775)916-7032'),
(464,'Ashley','Sandoval',89418184,'A.Sandoval50@hotmail.com','2023-01-16 13:34:57','1990',1,277,'831.873.0904'),
(465,'Melanie','Cain',15255353,'M_Cain98@hotmail.com','2023-01-16 13:34:57','1963',1,232,'+1-753-137-6364x6957'),
(466,'Sean','Hughes',30827536,'S.Hughes50@hotmail.com','2023-01-16 13:34:57','1985',1,839,'032.136.3712'),
(467,'Jessica','Smith',32498453,'J-Smith59@gmail.com','2023-01-16 13:34:57','1990',1,588,'(976)910-9613x266'),
(468,'Shannon','Parrish',98773871,'S_Parrish87@hotmail.com','2023-01-16 13:34:57','1984',1,26,'794.193.8769x96648'),
(469,'Curtis','Lloyd',14438678,'C-Lloyd62@hotmail.com','2023-01-16 13:34:57','1974',1,786,'084.899.4446'),
(470,'Andrew','Graves',21300618,'A_Graves60@gmail.com','2023-01-16 13:34:57','1973',1,504,'745-222-9643x85836'),
(471,'John','Malone',90391133,'J_Malone95@hotmail.com','2023-01-16 13:34:57','1995',1,650,'595-799-8520x1043'),
(472,'Lawrence','Blair',21479424,'L-Blair89@gmail.com','2023-01-16 13:34:57','2004',1,71,'(021)640-5615'),
(473,'Douglas','Kramer',16981294,'D_Kramer58@gmail.com','2023-01-16 13:34:57','1976',1,973,'652.111.2331x82489'),
(474,'Nicole','Watson',56890746,'N_Watson75@yahoo.com','2023-01-16 13:34:57','1950',1,13,'(547)346-9403'),
(475,'Karina','Jones',73351245,'K_Jones89@yahoo.com','2023-01-16 13:34:57','1983',1,704,'001-087-857-1516x87958'),
(476,'Mark','Crawford',41266518,'M.Crawford54@hotmail.com','2023-01-16 13:34:57','1986',1,614,'185-333-7618x538'),
(477,'Casey','Woods',82953406,'C.Woods58@gmail.com','2023-01-16 13:34:57','1988',1,99,'+1-238-526-0380'),
(478,'Michael','Morales',65014593,'M-Morales79@hotmail.com','2023-01-16 13:34:57','1991',1,942,'+1-789-412-9083x8856'),
(479,'Molly','Martin',66128817,'M.Martin72@yahoo.com','2023-01-16 13:34:57','1997',1,904,'152.863.3810'),
(480,'Cynthia','Miller',35822614,'C_Miller98@hotmail.com','2023-01-16 13:34:57','1995',1,200,'(419)870-0507x30180'),
(481,'Charles','Garcia',70665179,'C.Garcia67@hotmail.com','2023-01-16 13:34:57','1957',1,782,'+1-001-041-5820x81657'),
(482,'Michelle','Wallace',32391500,'M-Wallace53@hotmail.com','2023-01-16 13:34:57','1965',1,879,'(427)602-4675'),
(483,'Michael','Bennett',49388664,'M_Bennett67@yahoo.com','2023-01-16 13:34:57','1977',1,663,'(337)092-8177'),
(484,'Robert','Nguyen',19966678,'R.Nguyen51@hotmail.com','2023-01-16 13:34:57','1973',1,155,'931.132.1103x32896'),
(485,'Natalie','Olson',31761852,'N_Olson54@yahoo.com','2023-01-16 13:34:57','2001',1,106,'634.375.1211x46836'),
(486,'Bryan','Thompson',51403095,'B_Thompson71@gmail.com','2023-01-16 13:34:57','2010',1,475,'+1-658-975-0474x29505'),
(487,'Rachel','Higgins',57646367,'R.Higgins65@yahoo.com','2023-01-16 13:34:57','1960',1,797,'244-812-9709x9361'),
(488,'Suzanne','Thomas',35986979,'S_Thomas64@gmail.com','2023-01-16 13:34:57','1965',1,135,'543.348.1392x26857'),
(489,'Anne','Powell',81955411,'A.Powell83@yahoo.com','2023-01-16 13:34:57','1964',1,321,'(006)900-0865'),
(490,'Briana','Stafford',68686394,'B.Stafford89@yahoo.com','2023-01-16 13:34:57','1993',1,457,'001-705-385-7762x55232'),
(491,'Daniel','Jimenez',73559871,'D_Jimenez82@hotmail.com','2023-01-16 13:34:57','1967',1,786,'(252)737-8344x009'),
(492,'Calvin','Price',40596944,'C.Price72@hotmail.com','2023-01-16 13:34:57','1955',1,587,'589-225-6376x0953'),
(493,'Sharon','Franklin',97241379,'S-Franklin53@hotmail.com','2023-01-16 13:34:57','1997',1,140,'001-174-063-5433x5043'),
(494,'Jill','Barron',17879894,'J_Barron59@hotmail.com','2023-01-16 13:34:57','1959',1,363,'+1-366-750-2369'),
(495,'Julia','Blake',82065073,'J.Blake69@yahoo.com','2023-01-16 13:34:57','1960',1,7,'634-026-2401'),
(496,'Michele','White',28847708,'M-White89@yahoo.com','2023-01-16 13:34:57','1971',1,686,'4495833549'),
(497,'Kayla','Beck',24612784,'K-Beck65@yahoo.com','2023-01-16 13:34:57','1993',1,64,'3815686776'),
(498,'Jessica','Myers',97986307,'J.Myers88@gmail.com','2023-01-16 13:34:57','2001',1,321,'+1-817-458-1088x14735'),
(499,'Troy','Garcia',20369899,'T_Garcia64@yahoo.com','2023-01-16 13:34:57','1975',1,889,'001-576-850-7663x06128'),
(500,'Ryan','Frazier',55630759,'R_Frazier52@yahoo.com','2023-01-16 13:34:57','1970',1,231,'628-892-9422x020'),
(501,'Sarah','Williams',24651165,'S.Williams76@yahoo.com','2023-01-16 13:34:57','1975',1,145,'812-581-6300x131'),
(502,'Lisa','Roth',73924657,'L-Roth73@gmail.com','2023-01-16 13:34:57','1964',1,748,'886.326.6774x5455'),
(503,'William','Collins',76006568,'W.Collins76@yahoo.com','2023-01-16 13:34:57','1973',1,96,'0247230295'),
(504,'Patricia','Murphy',66143378,'P_Murphy73@gmail.com','2023-01-16 13:34:57','1957',1,750,'001-585-858-3867x139'),
(505,'Carl','Hutchinson',64313943,'C_Hutchinson95@yahoo.com','2023-01-16 13:34:57','2003',1,570,'989-190-0196'),
(506,'Paul','Garrett',26173651,'P.Garrett65@gmail.com','2023-01-16 13:34:57','1994',1,530,'001-130-148-3659'),
(507,'Jacob','King',26684933,'J.King97@hotmail.com','2023-01-16 13:34:57','1942',1,306,'590-337-7291x785'),
(508,'Samantha','Washington',79895790,'S.Washington70@hotmail.com','2023-01-16 13:34:57','1955',1,594,'001-950-041-8540x4783'),
(509,'Michael','Jenkins',65232551,'M-Jenkins79@hotmail.com','2023-01-16 13:34:57','2000',1,750,'+1-595-394-8857x22058'),
(510,'Jack','Little',54401215,'J.Little51@gmail.com','2023-01-16 13:34:57','1959',1,121,'001-693-008-3024x47803'),
(511,'Colin','Shields',55546854,'C_Shields50@gmail.com','2023-01-16 13:34:57','1946',1,806,'(697)101-2119x468'),
(512,'Bryan','Davis',55593859,'B-Davis65@yahoo.com','2023-01-16 13:34:57','1966',1,14,'6514105396'),
(513,'Scott','Monroe',22064725,'S-Monroe52@yahoo.com','2023-01-16 13:34:57','1939',1,355,'429.181.4020x11280'),
(514,'Sherry','Mccoy',26818023,'S-Mccoy70@gmail.com','2023-01-16 13:34:57','1963',1,237,'+1-251-204-3148'),
(515,'David','Best',76140080,'D_Best95@gmail.com','2023-01-16 13:34:57','1992',1,458,'(887)200-7940x520'),
(516,'Laura','Jacobs',59454370,'L.Jacobs55@gmail.com','2023-01-16 13:34:57','1964',1,363,'483-903-3384'),
(517,'Corey','Blair',67348371,'C.Blair76@yahoo.com','2023-01-16 13:34:57','2003',1,933,'955-819-4594'),
(518,'James','Wolfe',32529527,'J_Wolfe80@hotmail.com','2023-01-16 13:34:57','1958',1,554,'+1-093-022-1684x124'),
(519,'Erica','Davis',24154217,'E_Davis76@gmail.com','2023-01-16 13:34:57','1983',1,364,'001-617-479-3394x225'),
(520,'Patrick','Martin',21066218,'P-Martin59@gmail.com','2023-01-16 13:34:57','1958',1,926,'083.561.5072x1194'),
(521,'Tina','Tate',11547456,'T.Tate74@hotmail.com','2023-01-16 13:34:57','2013',1,968,'+1-263-982-8241x23553'),
(522,'Barbara','Haas',26560517,'B.Haas70@hotmail.com','2023-01-16 13:34:57','1953',1,72,'346.320.3942'),
(523,'Terri','Ramos',23850659,'T-Ramos66@gmail.com','2023-01-16 13:34:57','1951',1,942,'(937)047-7307x9261'),
(524,'Natalie','Palmer',27012003,'N_Palmer66@hotmail.com','2023-01-16 13:34:57','1957',1,424,'(945)632-3568x3015'),
(525,'Rachel','Gonzalez',53999891,'R.Gonzalez89@gmail.com','2023-01-16 13:34:57','1963',1,947,'044-035-3574'),
(526,'Matthew','King',36578998,'M.King91@yahoo.com','2023-01-16 13:34:57','1960',1,998,'816-183-3935x4539'),
(527,'Justin','Lane',84926567,'J-Lane68@hotmail.com','2023-01-16 13:34:57','1987',1,9,'775.911.5555x3609'),
(528,'Tim','Bray',54892135,'T-Bray76@yahoo.com','2023-01-16 13:34:57','2007',1,97,'470-704-6565x05102'),
(529,'Emily','Mccormick',35793509,'E-Mccormick70@yahoo.com','2023-01-16 13:34:57','1973',1,52,'001-190-899-4309x47204'),
(530,'Kenneth','Li',46269288,'K.Li52@yahoo.com','2023-01-16 13:34:57','1987',1,821,'637.709.6232'),
(531,'Erin','Drake',30791846,'E_Drake68@gmail.com','2023-01-16 13:34:57','1978',1,361,'+1-497-231-6490x788'),
(532,'Anthony','Peters',79732134,'A-Peters68@gmail.com','2023-01-16 13:34:57','1990',1,87,'(358)667-4469'),
(533,'Karen','Pacheco',23904699,'K.Pacheco57@yahoo.com','2023-01-16 13:34:57','1967',1,180,'888-205-0107'),
(534,'John','Vasquez',85904248,'J-Vasquez75@yahoo.com','2023-01-16 13:34:57','1987',1,637,'439.945.0248x87695'),
(535,'Adam','Heath',16258095,'A.Heath70@hotmail.com','2023-01-16 13:34:57','1965',1,684,'(140)139-5924'),
(536,'Denise','Delgado',86113740,'D-Delgado51@gmail.com','2023-01-16 13:34:57','1991',1,374,'+1-840-505-1588x755'),
(537,'Nicholas','Carter',39224326,'N_Carter61@hotmail.com','2023-01-16 13:34:57','1949',1,443,'538.067.8397'),
(538,'Susan','Jones',61439160,'S_Jones92@gmail.com','2023-01-16 13:34:57','1983',1,492,'(184)048-2682x3717'),
(539,'Jerry','Bates',73897908,'J.Bates86@hotmail.com','2023-01-16 13:34:57','1972',1,838,'(096)841-6338x029'),
(540,'Jessica','Phillips',20620195,'J.Phillips73@yahoo.com','2023-01-16 13:34:57','1980',1,10,'001-028-270-7941x23442'),
(541,'Kevin','Stout',88321924,'K-Stout86@hotmail.com','2023-01-16 13:34:57','1937',1,582,'402.492.4254x88978'),
(542,'Sarah','Estrada',16290785,'S.Estrada73@yahoo.com','2023-01-16 13:34:57','1956',1,514,'109-894-0008x12576'),
(543,'Dawn','Bowers',75843661,'D.Bowers53@hotmail.com','2023-01-16 13:34:57','1952',1,232,'001-131-184-4863x8492'),
(544,'Nathan','Carroll',51101274,'N.Carroll79@yahoo.com','2023-01-16 13:34:57','1974',1,865,'1353146380'),
(545,'Patrick','Salinas',60874923,'P.Salinas65@yahoo.com','2023-01-16 13:34:57','1957',1,942,'243.699.8946x1175'),
(546,'Philip','Brown',87895705,'P_Brown71@yahoo.com','2023-01-16 13:34:57','1983',1,307,'(276)122-9538'),
(547,'Megan','Lee',41733138,'M.Lee95@hotmail.com','2023-01-16 13:34:57','1936',1,761,'3572578410'),
(548,'Brittany','Tran',89734695,'B-Tran51@hotmail.com','2023-01-16 13:34:57','1995',1,598,'+1-311-950-2828'),
(549,'Connie','Summers',88995347,'C.Summers68@hotmail.com','2023-01-16 13:34:57','1987',1,289,'(554)515-4371'),
(550,'Patricia','Smith',47203806,'P.Smith70@yahoo.com','2023-01-16 13:34:57','1966',1,578,'001-743-520-8219x12307'),
(551,'Ryan','Garrett',35737948,'R.Garrett63@hotmail.com','2023-01-16 13:34:57','1992',1,195,'091.770.4876x80270'),
(552,'Jennifer','Reid',34385266,'J_Reid61@yahoo.com','2023-01-16 13:34:57','1962',1,343,'939-286-9348x46244'),
(553,'Greg','Pollard',84169251,'G-Pollard91@yahoo.com','2023-01-16 13:34:57','2006',1,123,'1940807288'),
(554,'Regina','Baldwin',88610217,'R_Baldwin83@gmail.com','2023-01-16 13:34:57','1990',1,879,'+1-618-855-8640x7313'),
(555,'Amy','Allen',29685091,'A_Allen59@gmail.com','2023-01-16 13:34:57','1997',1,920,'+1-508-685-6190'),
(556,'Yvonne','Smith',59716223,'Y.Smith66@yahoo.com','2023-01-16 13:34:57','1974',1,757,'(993)803-6032x730'),
(557,'Melanie','Mcmahon',23990062,'M_Mcmahon82@hotmail.com','2023-01-16 13:34:57','1983',1,214,'001-830-753-3194x6982'),
(558,'Michael','Miller',10631016,'M.Miller98@hotmail.com','2023-01-16 13:34:57','1979',1,308,'221-737-1488'),
(559,'David','Miller',47746067,'D.Miller69@hotmail.com','2023-01-16 13:34:57','2014',1,806,'(615)387-9393'),
(560,'Karen','Coleman',41766662,'K_Coleman57@yahoo.com','2023-01-16 13:34:57','1979',1,933,'001-992-808-5420x9878'),
(561,'William','Joseph',66561132,'W-Joseph83@hotmail.com','2023-01-16 13:34:57','1988',1,687,'831-269-2138'),
(562,'Marvin','Thomas',46194445,'M-Thomas74@gmail.com','2023-01-16 13:34:57','1952',1,526,'409-210-3152'),
(563,'Jesus','Perez',97809717,'J.Perez75@hotmail.com','2023-01-16 13:34:57','1975',1,488,'(446)844-8864x624'),
(564,'Sherry','Smith',13429063,'S_Smith85@gmail.com','2023-01-16 13:34:57','1995',1,995,'(120)964-6482'),
(565,'Makayla','Gibbs',50980714,'M_Gibbs68@yahoo.com','2023-01-16 13:34:57','1975',1,632,'+1-918-018-8752x72964'),
(566,'Lauren','Wong',20524004,'L_Wong91@hotmail.com','2023-01-16 13:34:57','1959',1,431,'(124)425-6948x934'),
(567,'Shelby','Williams',34450001,'S-Williams58@hotmail.com','2023-01-16 13:34:57','1994',1,196,'(024)198-6231x396'),
(568,'Ian','Brown',60890115,'I_Brown80@gmail.com','2023-01-16 13:34:57','1958',1,839,'006-473-5396'),
(569,'Derrick','Esparza',85746550,'D_Esparza56@yahoo.com','2023-01-16 13:34:57','1964',1,533,'763.554.8297'),
(570,'Abigail','Williamson',97620723,'A_Williamson70@gmail.com','2023-01-16 13:34:57','1990',1,897,'724.054.8614x6688'),
(571,'Pedro','Sanders',41153976,'P-Sanders68@yahoo.com','2023-01-16 13:34:57','1982',1,443,'001-260-140-9766x41657'),
(572,'Jessica','Berry',39206992,'J.Berry97@hotmail.com','2023-01-16 13:34:57','1951',1,121,'001-564-818-0823'),
(573,'Laura','Valencia',97596621,'L-Valencia98@yahoo.com','2023-01-16 13:34:57','1955',1,418,'694-531-7177x15563'),
(574,'Emma','Mcdonald',34106956,'E-Mcdonald69@hotmail.com','2023-01-16 13:34:57','1958',1,533,'+1-188-151-9575x742'),
(575,'Marc','Sanchez',97140968,'M_Sanchez56@yahoo.com','2023-01-16 13:34:57','1967',1,907,'+1-406-124-8459x545'),
(576,'Kelly','Huang',87356709,'K_Huang79@gmail.com','2023-01-16 13:34:57','1975',1,248,'+1-632-365-0123x4012'),
(577,'Tiffany','Henderson',19399329,'T_Henderson53@yahoo.com','2023-01-16 13:34:57','1956',1,662,'(773)441-5923x535'),
(578,'Jason','Palmer',65271781,'J_Palmer94@hotmail.com','2023-01-16 13:34:57','1993',1,386,'(886)419-2666x425'),
(579,'Kristin','Harrison',27108095,'K.Harrison77@yahoo.com','2023-01-16 13:34:57','1959',1,765,'259.779.5626'),
(580,'Bailey','Martinez',51146503,'B-Martinez99@gmail.com','2023-01-16 13:34:57','1972',1,806,'+1-840-997-6863x823'),
(581,'Leslie','Williams',14804196,'L-Williams53@yahoo.com','2023-01-16 13:34:57','1990',1,569,'9960444786'),
(582,'Kenneth','Andersen',14667806,'K-Andersen50@gmail.com','2023-01-16 13:34:57','1944',1,20,'370.270.5329x80826'),
(583,'Benjamin','Singh',29685610,'B-Singh73@yahoo.com','2023-01-16 13:34:57','1976',1,528,'521-465-2477x727'),
(584,'Timothy','Bell',72582431,'T_Bell79@hotmail.com','2023-01-16 13:34:57','2018',1,60,'399-709-8410x921'),
(585,'Nathan','Cohen',92015202,'N.Cohen97@yahoo.com','2023-01-16 13:34:57','1984',1,877,'(525)237-3695x750'),
(586,'Dwayne','Bradshaw',83026514,'D.Bradshaw54@gmail.com','2023-01-16 13:34:57','1983',1,407,'1702179798'),
(587,'Preston','Palmer',55267766,'P-Palmer89@yahoo.com','2023-01-16 13:34:57','1962',1,203,'557-493-7267'),
(588,'Daniel','Lewis',82376447,'D.Lewis99@hotmail.com','2023-01-16 13:34:57','1971',1,200,'7291857597'),
(589,'Courtney','Ross',14123226,'C.Ross55@gmail.com','2023-01-16 13:34:57','1975',1,108,'2934765551'),
(590,'Kimberly','Johnson',70139777,'K-Johnson60@hotmail.com','2023-01-16 13:34:57','1968',1,656,'851-834-2880'),
(591,'Glenda','Cisneros',95894256,'G.Cisneros51@gmail.com','2023-01-16 13:34:57','1994',1,177,'+1-442-482-9603'),
(592,'Alan','Bailey',58571625,'A-Bailey97@yahoo.com','2023-01-16 13:34:57','1986',1,212,'103.849.2918x812'),
(593,'David','Welch',13374325,'D.Welch86@gmail.com','2023-01-16 13:34:57','1978',1,80,'076.267.6592x554'),
(594,'Logan','Bautista',50144997,'L_Bautista81@yahoo.com','2023-01-16 13:34:57','1957',1,636,'740.866.5257'),
(595,'Mary','Williams',89528191,'M_Williams68@gmail.com','2023-01-16 13:34:57','1992',1,428,'001-515-656-3034x53236'),
(596,'Melinda','Melendez',57043681,'M.Melendez59@gmail.com','2023-01-16 13:34:57','2009',1,906,'2960173134'),
(597,'Heidi','Jenkins',53375091,'H_Jenkins82@gmail.com','2023-01-16 13:34:57','1993',1,82,'(465)022-6781x06699'),
(598,'Lee','Johnson',64380454,'L-Johnson96@gmail.com','2023-01-16 13:34:57','1996',1,676,'(572)985-7882x2010'),
(599,'Dawn','Myers',74382391,'D_Myers50@gmail.com','2023-01-16 13:34:57','2002',1,284,'001-733-336-6185'),
(600,'Stephanie','Waters',56053536,'S-Waters72@hotmail.com','2023-01-16 13:34:57','1969',1,973,'+1-002-700-3054'),
(601,'Monica','Reilly',66963868,'M.Reilly96@gmail.com','2023-01-16 13:34:57','1995',1,724,'649.024.6211x446'),
(602,'Alyssa','Moran',49625977,'A_Moran75@hotmail.com','2023-01-16 13:34:57','1955',1,510,'376-379-1023x26542'),
(603,'Peter','Guzman',43640635,'P-Guzman53@yahoo.com','2023-01-16 13:34:57','1949',1,904,'+1-943-195-9592'),
(604,'Bernard','Wolf',22107764,'B_Wolf51@gmail.com','2023-01-16 13:34:57','1977',1,603,'421-909-7972x08944'),
(605,'Lisa','Morgan',29696185,'L.Morgan57@gmail.com','2023-01-16 13:34:57','2009',1,192,'+1-568-528-4159'),
(606,'Brent','Bass',51922792,'B-Bass62@gmail.com','2023-01-16 13:34:57','1958',1,850,'117-259-7196x127'),
(607,'Melinda','Ford',36778060,'M.Ford88@hotmail.com','2023-01-16 13:34:57','1946',1,737,'(963)158-2127x538'),
(608,'James','Steele',11148701,'J.Steele99@gmail.com','2023-01-16 13:34:57','1960',1,669,'+1-826-085-9063x9451'),
(609,'Kathy','Gonzalez',21487488,'K_Gonzalez96@hotmail.com','2023-01-16 13:34:57','1984',1,878,'702-360-9933x9797'),
(610,'Amy','Reynolds',78282062,'A_Reynolds88@hotmail.com','2023-01-16 13:34:57','1982',1,946,'900-892-9153'),
(611,'Francisco','Smith',61334996,'F.Smith91@gmail.com','2023-01-16 13:34:57','1981',1,405,'001-547-464-8692x415'),
(612,'Marilyn','Swanson',30080685,'M_Swanson88@yahoo.com','2023-01-16 13:34:57','1973',1,945,'001-206-451-4549x5504'),
(613,'Michael','Hansen',73567471,'M.Hansen81@gmail.com','2023-01-16 13:34:57','1981',1,583,'001-944-449-6611x74518'),
(614,'Kristin','Lopez',72785957,'K.Lopez78@hotmail.com','2023-01-16 13:34:57','1937',1,908,'340-544-4459x1033'),
(615,'Brandon','Baldwin',87239788,'B_Baldwin98@hotmail.com','2023-01-16 13:34:57','1953',1,424,'327-131-4187x653'),
(616,'Joseph','Warner',42926813,'J-Warner55@yahoo.com','2023-01-16 13:34:57','1984',1,376,'403-415-1116'),
(617,'John','Peters',34366350,'J-Peters64@hotmail.com','2023-01-16 13:34:57','1992',1,938,'+1-387-540-8357x01177'),
(618,'Jeffery','Reyes',24442150,'J_Reyes77@hotmail.com','2023-01-16 13:34:57','1968',1,546,'(841)793-3028x00451'),
(619,'Debra','Johnson',18316090,'D.Johnson68@hotmail.com','2023-01-16 13:34:57','1972',1,756,'(072)074-9088x36891'),
(620,'Joshua','Thomas',16171748,'J-Thomas85@hotmail.com','2023-01-16 13:34:57','1984',1,450,'901-930-4925'),
(621,'Anthony','Silva',37248854,'A-Silva74@gmail.com','2023-01-16 13:34:57','1943',1,687,'(649)613-0063x0427'),
(622,'Emily','Barnes',36350763,'E_Barnes97@gmail.com','2023-01-16 13:34:57','1969',1,305,'126-191-5682'),
(623,'Sharon','Haley',37980855,'S.Haley99@gmail.com','2023-01-16 13:34:57','1967',1,247,'001-734-287-6560x07901'),
(624,'Tiffany','Guzman',73362714,'T_Guzman61@gmail.com','2023-01-16 13:34:57','1946',1,142,'767-586-0930'),
(625,'Carlos','Edwards',11167949,'C-Edwards61@hotmail.com','2023-01-16 13:34:57','1996',1,593,'763.134.3935x396'),
(626,'Jeffery','Lin',18514892,'J-Lin59@gmail.com','2023-01-16 13:34:57','1985',1,822,'(603)775-1730x26214'),
(627,'Sheri','Patterson',90657472,'S.Patterson54@gmail.com','2023-01-16 13:34:57','1964',1,616,'156-109-7371'),
(628,'Elizabeth','Reed',55164233,'E-Reed68@hotmail.com','2023-01-16 13:34:57','1990',1,160,'694.273.0545x87316'),
(629,'Christine','Meyer',58209509,'C-Meyer57@hotmail.com','2023-01-16 13:34:57','1965',1,110,'(589)719-7329'),
(630,'Kathryn','Watson',49800898,'K.Watson67@yahoo.com','2023-01-16 13:34:57','1930',1,382,'(153)478-5039x4627'),
(631,'Gina','Lewis',74134722,'G_Lewis67@gmail.com','2023-01-16 13:34:57','1992',1,770,'6270390413'),
(632,'Melinda','Johnson',68160381,'M_Johnson95@gmail.com','2023-01-16 13:34:57','2005',1,657,'(165)770-8874'),
(633,'Alexander','Thompson',58106212,'A-Thompson86@yahoo.com','2023-01-16 13:34:57','1987',1,437,'001-004-514-6973x97325'),
(634,'Thomas','Stewart',43730249,'T_Stewart88@yahoo.com','2023-01-16 13:34:57','1970',1,135,'085-518-1126x545'),
(635,'Patricia','Marquez',45674147,'P.Marquez53@hotmail.com','2023-01-16 13:34:57','1973',1,619,'(404)206-5784x872'),
(636,'Kristina','Mason',71909893,'K_Mason99@yahoo.com','2023-01-16 13:34:57','1966',1,390,'098.820.3148x79440'),
(637,'Melissa','Ali',50245978,'M_Ali85@hotmail.com','2023-01-16 13:34:57','1957',1,614,'+1-258-743-3584'),
(638,'Martin','Peters',90050260,'M.Peters97@gmail.com','2023-01-16 13:34:57','1949',1,316,'+1-267-442-7899x899'),
(639,'John','Hahn',32199702,'J.Hahn91@hotmail.com','2023-01-16 13:34:57','1972',1,834,'+1-619-582-6590'),
(640,'Beth','Fletcher',78601358,'B_Fletcher63@gmail.com','2023-01-16 13:34:57','1980',1,402,'(001)857-5203'),
(641,'Jason','Davis',31929546,'J_Davis69@hotmail.com','2023-01-16 13:34:57','1975',1,356,'+1-349-325-5744x880'),
(642,'Timothy','Park',59387240,'T_Park94@hotmail.com','2023-01-16 13:34:57','1945',1,911,'016-151-3512x24303'),
(643,'Daniel','King',54689784,'D.King80@gmail.com','2023-01-16 13:34:57','1959',1,878,'(757)721-6925x557'),
(644,'James','Prince',97992625,'J-Prince81@yahoo.com','2023-01-16 13:34:57','1968',1,703,'001-064-987-6037x2677'),
(645,'Deborah','Sanchez',97993233,'D-Sanchez58@hotmail.com','2023-01-16 13:34:57','1942',1,830,'+1-430-058-6830x817'),
(646,'Raymond','Hoffman',16008210,'R-Hoffman82@yahoo.com','2023-01-16 13:34:57','1953',1,952,'001-437-891-2646'),
(647,'Victor','Johnson',66392347,'V_Johnson93@gmail.com','2023-01-16 13:34:57','1965',1,670,'646.563.4327x8884'),
(648,'Carol','Freeman',11605786,'C_Freeman82@yahoo.com','2023-01-16 13:34:57','1988',1,155,'(126)283-6487'),
(649,'David','Saunders',41070961,'D.Saunders65@gmail.com','2023-01-16 13:34:57','1975',1,506,'825.663.0084'),
(650,'Amy','Anderson',21328907,'A.Anderson88@yahoo.com','2023-01-16 13:34:57','1996',1,403,'917.164.9761x41462'),
(651,'Matthew','Silva',27496424,'M.Silva56@gmail.com','2023-01-16 13:34:57','1962',1,728,'6411938063'),
(652,'Jake','James',49750583,'J_James58@yahoo.com','2023-01-16 13:34:57','1957',1,378,'215-557-7449x59671'),
(653,'Joseph','Sims',15827641,'J.Sims71@hotmail.com','2023-01-16 13:34:57','1990',1,678,'+1-899-856-4186x39899'),
(654,'Sarah','Vaughn',70959897,'S.Vaughn89@gmail.com','2023-01-16 13:34:57','1966',1,322,'5305181836'),
(655,'Jesse','Perez',13515269,'J_Perez62@hotmail.com','2023-01-16 13:34:57','1978',1,508,'0654938019'),
(656,'Jessica','Harrison',86211869,'J.Harrison73@yahoo.com','2023-01-16 13:34:57','1964',1,898,'+1-266-830-6404x54599'),
(657,'Samantha','Vaughan',93033004,'S.Vaughan53@yahoo.com','2023-01-16 13:34:57','1980',1,734,'375-465-3286x12385'),
(658,'Daniel','Smith',78270493,'D_Smith70@gmail.com','2023-01-16 13:34:57','2008',1,247,'391.388.6341x75409'),
(659,'Molly','Douglas',74462837,'M-Douglas96@hotmail.com','2023-01-16 13:34:57','1984',1,158,'(457)612-8207x418'),
(660,'Geoffrey','Hopkins',54667603,'G.Hopkins93@hotmail.com','2023-01-16 13:34:57','1959',1,777,'001-925-575-7246x965'),
(661,'Wayne','Farmer',31317049,'W-Farmer75@gmail.com','2023-01-16 13:34:57','1984',1,851,'+1-639-320-0245x9364'),
(662,'Francisco','Harris',33131073,'F.Harris63@gmail.com','2023-01-16 13:34:57','1985',1,252,'768.693.3504x02031'),
(663,'Kayla','Miller',27373550,'K.Miller89@hotmail.com','2023-01-16 13:34:57','1973',1,200,'473-690-7702x9028'),
(664,'Sheila','Velasquez',89886846,'S-Velasquez76@gmail.com','2023-01-16 13:34:57','1976',1,765,'001-450-209-9812'),
(665,'Alexander','Williams',45472046,'A-Williams75@gmail.com','2023-01-16 13:34:57','1998',1,896,'8010443881'),
(666,'Jeffrey','Reyes',94542387,'J_Reyes93@yahoo.com','2023-01-16 13:34:57','1980',1,332,'(063)539-7120x963'),
(667,'Melissa','Martin',74058548,'M.Martin64@yahoo.com','2023-01-16 13:34:57','1975',1,320,'087.293.8718'),
(668,'Deanna','Rice',51364553,'D.Rice50@yahoo.com','2023-01-16 13:34:57','1956',1,545,'332.229.1371'),
(669,'Robert','Dillon',96710177,'R_Dillon80@yahoo.com','2023-01-16 13:34:57','1957',1,465,'613.047.5644'),
(670,'Stephanie','Flores',53580583,'S.Flores58@yahoo.com','2023-01-16 13:34:57','1948',1,47,'+1-336-592-2821x8360'),
(671,'Paul','Taylor',93435058,'P_Taylor59@hotmail.com','2023-01-16 13:34:57','1997',1,653,'(579)721-7930x7974'),
(672,'Ariana','Kelley',86262260,'A_Kelley69@hotmail.com','2023-01-16 13:34:57','1981',1,588,'305-297-1947'),
(673,'Heather','Stewart',87935424,'H_Stewart56@yahoo.com','2023-01-16 13:34:57','1964',1,484,'076-531-9737'),
(674,'Jeremy','Brewer',56242582,'J.Brewer54@yahoo.com','2023-01-16 13:34:57','1993',1,194,'001-171-303-5508'),
(675,'Amber','Blankenship',64873981,'A-Blankenship83@gmail.com','2023-01-16 13:34:57','1983',1,919,'857-438-3797'),
(676,'Katie','Ford',66128129,'K_Ford90@gmail.com','2023-01-16 13:34:57','1986',1,934,'257.170.4978x4787'),
(677,'Susan','Carter',51926498,'S.Carter51@yahoo.com','2023-01-16 13:34:57','1992',1,536,'(943)342-4536x7921'),
(678,'Amanda','Nguyen',53964808,'A-Nguyen67@hotmail.com','2023-01-16 13:34:57','1963',1,435,'+1-726-896-3917x650'),
(679,'William','Pollard',97923447,'W-Pollard58@yahoo.com','2023-01-16 13:34:57','1969',1,897,'+1-148-709-2676x419'),
(680,'Christopher','Reid',58955153,'C-Reid80@yahoo.com','2023-01-16 13:34:57','1960',1,17,'001-074-089-4559x60119'),
(681,'Lindsey','Sanchez',67423899,'L-Sanchez67@yahoo.com','2023-01-16 13:34:57','2005',1,811,'(599)367-6229x62190'),
(682,'Andrea','Chan',40225845,'A_Chan65@hotmail.com','2023-01-16 13:34:57','1997',1,181,'001-766-494-9765x0117'),
(683,'David','Good',72348363,'D_Good58@yahoo.com','2023-01-16 13:34:57','1963',1,792,'+1-786-705-0503x80245'),
(684,'Charles','Brown',30205879,'C_Brown82@hotmail.com','2023-01-16 13:34:57','2015',1,732,'+1-953-832-6656x51924'),
(685,'Jonathan','Cooper',29021038,'J.Cooper82@yahoo.com','2023-01-16 13:34:57','1958',1,664,'874-904-5262x1934'),
(686,'Andrew','Cruz',22324616,'A_Cruz64@gmail.com','2023-01-16 13:34:57','1979',1,485,'001-173-597-6527x191'),
(687,'Sherri','Lopez',52132810,'S_Lopez93@hotmail.com','2023-01-16 13:34:57','1972',1,239,'2997591661'),
(688,'Heather','Snyder',94506568,'H_Snyder50@gmail.com','2023-01-16 13:34:57','1994',1,423,'019.189.0562'),
(689,'Donald','Hernandez',89892362,'D.Hernandez70@yahoo.com','2023-01-16 13:34:57','1982',1,478,'001-790-302-2239'),
(690,'Richard','Baker',82876965,'R_Baker53@hotmail.com','2023-01-16 13:34:57','1980',1,469,'720.481.2333x806'),
(691,'Julie','Ortiz',30252381,'J-Ortiz63@hotmail.com','2023-01-16 13:34:57','1982',1,61,'173-277-0753x725'),
(692,'Jocelyn','Parker',97610522,'J.Parker79@gmail.com','2023-01-16 13:34:57','1995',1,449,'(310)714-3883x640'),
(693,'Debra','Walker',83769744,'D-Walker80@yahoo.com','2023-01-16 13:34:57','1987',1,604,'+1-169-675-5776x01205'),
(694,'Justin','Chen',10600177,'J_Chen55@yahoo.com','2023-01-16 13:34:57','1952',1,892,'080-867-1349'),
(695,'Randy','Williams',82030902,'R-Williams50@yahoo.com','2023-01-16 13:34:57','1975',1,26,'+1-737-496-4416x502'),
(696,'Elizabeth','Sellers',98988042,'E.Sellers50@gmail.com','2023-01-16 13:34:57','1943',1,224,'9676337753'),
(697,'Devon','Jacobs',39403219,'D.Jacobs65@gmail.com','2023-01-16 13:34:57','1949',1,297,'178.816.7057'),
(698,'Pamela','Warren',39435187,'P-Warren79@hotmail.com','2023-01-16 13:34:57','1991',1,343,'(885)949-1066x9511'),
(699,'Mary','Fuller',48336625,'M.Fuller79@yahoo.com','2023-01-16 13:34:57','1992',1,852,'010-789-6773'),
(700,'Jacqueline','Montoya',51329907,'J_Montoya56@gmail.com','2023-01-16 13:34:57','1960',1,14,'001-165-336-5185x5219'),
(701,'Christopher','Brown',24851167,'C.Brown54@hotmail.com','2023-01-16 13:34:57','1969',1,333,'(162)948-3429'),
(702,'Julie','Brown',84071564,'J_Brown50@yahoo.com','2023-01-16 13:34:57','1998',1,62,'187.508.6043'),
(703,'Miranda','Kirby',13514547,'M_Kirby55@yahoo.com','2023-01-16 13:34:57','1961',1,989,'3059060833'),
(704,'Tim','Martin',18891926,'T.Martin60@gmail.com','2023-01-16 13:34:57','1950',1,298,'835.952.1608x224'),
(705,'Peter','Sanders',79319211,'P-Sanders92@yahoo.com','2023-01-16 13:34:57','2008',1,972,'768-606-5142'),
(706,'Bill','Brown',46493911,'B_Brown50@hotmail.com','2023-01-16 13:34:57','2007',1,374,'(524)150-3934'),
(707,'James','Fitzgerald',37279956,'J-Fitzgerald55@gmail.com','2023-01-16 13:34:57','1984',1,733,'(057)557-9780x15015'),
(708,'Stephanie','Mahoney',58855800,'S.Mahoney55@yahoo.com','2023-01-16 13:34:57','1987',1,29,'(685)463-0806'),
(709,'Cristian','Conway',88375595,'C.Conway52@hotmail.com','2023-01-16 13:34:57','1977',1,614,'6834016301'),
(710,'Charles','Cox',41550489,'C-Cox53@yahoo.com','2023-01-16 13:34:57','1943',1,146,'(015)618-0212x33350'),
(711,'Marissa','Moore',86874996,'M-Moore97@hotmail.com','2023-01-16 13:34:57','1948',1,134,'347.060.6794x56303'),
(712,'George','Smith',48468238,'G.Smith98@hotmail.com','2023-01-16 13:34:57','1965',1,154,'111.676.7929'),
(713,'Brenda','Porter',81933160,'B-Porter54@hotmail.com','2023-01-16 13:34:57','1956',1,277,'(049)173-3606'),
(714,'Nancy','Franklin',25973880,'N-Franklin87@yahoo.com','2023-01-16 13:34:57','1984',1,220,'526.561.4771'),
(715,'Garrett','Barnett',49481014,'G.Barnett85@hotmail.com','2023-01-16 13:34:57','2002',1,48,'2405111911'),
(716,'James','Ortega',39946298,'J_Ortega92@yahoo.com','2023-01-16 13:34:57','1980',1,756,'302.683.7345'),
(717,'Cody','Thompson',94840422,'C_Thompson53@gmail.com','2023-01-16 13:34:57','1981',1,328,'2980878268'),
(718,'Vernon','Curtis',50644930,'V_Curtis55@hotmail.com','2023-01-16 13:34:57','1989',1,305,'001-584-845-8720x426'),
(719,'Jeff','Phelps',11786357,'J_Phelps61@gmail.com','2023-01-16 13:34:57','1970',1,884,'242-842-9366'),
(720,'Michelle','Myers',55827909,'M_Myers54@yahoo.com','2023-01-16 13:34:57','1979',1,492,'591-187-3401'),
(721,'Nicole','Ayers',69805265,'N.Ayers58@hotmail.com','2023-01-16 13:34:57','1949',1,533,'881-818-8038'),
(722,'Ann','Brown',69001946,'A-Brown69@yahoo.com','2023-01-16 13:34:57','1959',1,960,'(899)521-7241'),
(723,'Danielle','Pierce',99034541,'D-Pierce93@gmail.com','2023-01-16 13:34:57','1979',1,732,'874-089-3730x28645'),
(724,'Michael','Hernandez',20822646,'M-Hernandez51@gmail.com','2023-01-16 13:34:57','1939',1,777,'510-742-2931'),
(725,'Darlene','Hanson',10396187,'D-Hanson68@yahoo.com','2023-01-16 13:34:57','1958',1,275,'714.204.9977'),
(726,'Michelle','Cochran',77234360,'M_Cochran89@gmail.com','2023-01-16 13:34:57','2000',1,324,'072-876-3565x932'),
(727,'Michael','Garrett',96373940,'M.Garrett78@yahoo.com','2023-01-16 13:34:57','1958',1,739,'(361)380-5138x546'),
(728,'David','Martinez',40839986,'D.Martinez70@hotmail.com','2023-01-16 13:34:57','1992',1,694,'(425)387-9525'),
(729,'James','Whitney',73152960,'J.Whitney52@hotmail.com','2023-01-16 13:34:57','1955',1,677,'2807459328'),
(730,'Joseph','Willis',17893673,'J-Willis95@hotmail.com','2023-01-16 13:34:57','1950',1,290,'8302703048'),
(731,'Susan','Gonzales',61588708,'S_Gonzales68@hotmail.com','2023-01-16 13:34:57','1971',1,591,'001-897-628-2202x542'),
(732,'Dana','Davis',79292485,'D-Davis59@hotmail.com','2023-01-16 13:34:57','1988',1,475,'7800924949'),
(733,'Chad','Hicks',75816615,'C.Hicks52@hotmail.com','2023-01-16 13:34:57','1955',1,199,'+1-368-417-5187'),
(734,'Gregory','Ramirez',55364008,'G_Ramirez76@gmail.com','2023-01-16 13:34:57','1985',1,109,'(889)209-6207x477'),
(735,'Christopher','Barajas',26573808,'C.Barajas90@yahoo.com','2023-01-16 13:34:57','1980',1,650,'490-676-2962'),
(736,'David','Drake',92442951,'D-Drake70@gmail.com','2023-01-16 13:34:57','1951',1,925,'+1-582-808-7641x66384'),
(737,'James','Beard',53533855,'J.Beard92@yahoo.com','2023-01-16 13:34:57','1988',1,831,'+1-187-170-1358x2584'),
(738,'Jane','Jimenez',94592392,'J_Jimenez84@gmail.com','2023-01-16 13:34:57','1956',1,801,'+1-254-949-9165x16638'),
(739,'Susan','Oconnor',59639257,'S_Oconnor77@hotmail.com','2023-01-16 13:34:57','1956',1,933,'(062)675-4743x583'),
(740,'Debra','Monroe',34337219,'D-Monroe69@yahoo.com','2023-01-16 13:34:57','1970',1,368,'+1-372-027-1232x6397'),
(741,'Holly','Zamora',77434587,'H.Zamora75@yahoo.com','2023-01-16 13:34:57','1949',1,433,'835-535-0048'),
(742,'Kayla','Coleman',60057654,'K_Coleman98@gmail.com','2023-01-16 13:34:57','1957',1,903,'642-524-8485'),
(743,'Ryan','Pratt',26907135,'R.Pratt84@hotmail.com','2023-01-16 13:34:57','2007',1,637,'001-930-391-6022x8430'),
(744,'Lance','Spencer',89372257,'L.Spencer76@yahoo.com','2023-01-16 13:34:57','2004',1,963,'113-179-9285x953'),
(745,'Richard','Vasquez',34157129,'R.Vasquez51@gmail.com','2023-01-16 13:34:57','1980',1,542,'578.629.5976'),
(746,'Lisa','Black',73210298,'L-Black54@hotmail.com','2023-01-16 13:34:57','1985',1,652,'(849)357-5170'),
(747,'Ricky','Howard',99070311,'R_Howard96@yahoo.com','2023-01-16 13:34:57','1960',1,549,'639.873.2919x14679'),
(748,'Nicholas','Arnold',88685271,'N-Arnold75@gmail.com','2023-01-16 13:34:57','2009',1,118,'(230)454-5718'),
(749,'Chase','Liu',30645814,'C_Liu87@gmail.com','2023-01-16 13:34:57','1995',1,203,'1584150066'),
(750,'Kristina','Garcia',79852194,'K_Garcia67@hotmail.com','2023-01-16 13:34:57','1996',1,163,'+1-643-208-9690x53724'),
(751,'Julie','Beck',69326088,'J_Beck94@gmail.com','2023-01-16 13:34:57','1985',1,439,'1414082346'),
(752,'Kim','Riley',51820860,'K.Riley78@hotmail.com','2023-01-16 13:34:57','1967',1,597,'863.566.1244'),
(753,'Andrew','Murphy',49356894,'A-Murphy51@hotmail.com','2023-01-16 13:34:57','2008',1,469,'986-080-0893'),
(754,'Carrie','Howell',69753090,'C.Howell70@gmail.com','2023-01-16 13:34:57','1963',1,33,'677-258-6832'),
(755,'Derek','Reynolds',99792889,'D_Reynolds87@gmail.com','2023-01-16 13:34:57','1979',1,326,'+1-781-695-2048x17388'),
(756,'Tamara','Hernandez',91413634,'T.Hernandez52@yahoo.com','2023-01-16 13:34:57','1944',1,79,'632-955-7779x165'),
(757,'Kayla','Foster',79124633,'K_Foster91@yahoo.com','2023-01-16 13:34:57','1932',1,268,'(911)473-7374'),
(758,'Jerome','Kelly',68720914,'J.Kelly67@gmail.com','2023-01-16 13:34:57','1987',1,903,'907.136.4784'),
(759,'Karen','Jackson',82346435,'K-Jackson59@hotmail.com','2023-01-16 13:34:57','1943',1,954,'642-958-9911x227'),
(760,'Travis','Fleming',25727427,'T-Fleming77@gmail.com','2023-01-16 13:34:57','1999',1,696,'+1-931-835-7487x4348'),
(761,'Robert','Villa',68401316,'R-Villa89@gmail.com','2023-01-16 13:34:57','1968',1,113,'001-790-767-4200x85440'),
(762,'Valerie','Chambers',89776861,'V.Chambers51@hotmail.com','2023-01-16 13:34:57','1993',1,182,'485.297.8074'),
(763,'Rachel','Thompson',92915203,'R.Thompson86@hotmail.com','2023-01-16 13:34:57','1981',1,38,'001-425-369-7904x024'),
(764,'Evelyn','Thompson',81316096,'E.Thompson83@hotmail.com','2023-01-16 13:34:57','1983',1,585,'228-410-6361x15518'),
(765,'Philip','Jackson',51330869,'P-Jackson96@yahoo.com','2023-01-16 13:34:57','1954',1,224,'480.644.6841'),
(766,'Molly','Marshall',34469091,'M.Marshall97@hotmail.com','2023-01-16 13:34:57','1965',1,781,'+1-609-775-2557x782'),
(767,'Martha','Stout',76110134,'M-Stout56@yahoo.com','2023-01-16 13:34:57','1963',1,30,'427.632.6292x4332'),
(768,'Richard','Ross',94526191,'R-Ross75@hotmail.com','2023-01-16 13:34:57','1968',1,448,'616.872.2853x3114'),
(769,'Bryan','Orozco',16810401,'B.Orozco90@yahoo.com','2023-01-16 13:34:57','2000',1,483,'975-154-9765x2556'),
(770,'Kenneth','Allen',73442557,'K_Allen88@gmail.com','2023-01-16 13:34:57','1957',1,480,'+1-317-586-3199x4926'),
(771,'Stephen','Ellison',44079335,'S-Ellison79@gmail.com','2023-01-16 13:34:57','1986',1,722,'061.872.6822x4223'),
(772,'Angela','Weber',86369175,'A_Weber55@gmail.com','2023-01-16 13:34:57','1986',1,449,'(584)907-4683'),
(773,'Louis','Aguirre',42409918,'L.Aguirre71@yahoo.com','2023-01-16 13:34:57','1967',1,411,'051.945.0972x05130'),
(774,'Deborah','Jones',53610893,'D.Jones90@yahoo.com','2023-01-16 13:34:57','1980',1,391,'960.981.5824x4315'),
(775,'Eric','Garcia',69327989,'E.Garcia92@yahoo.com','2023-01-16 13:34:57','1970',1,913,'001-006-163-3996'),
(776,'Angela','Crawford',40997063,'A_Crawford92@yahoo.com','2023-01-16 13:34:57','1976',1,417,'(577)339-9881x627'),
(777,'Erin','Greene',28426832,'E-Greene60@hotmail.com','2023-01-16 13:34:57','1939',1,999,'+1-071-600-9055'),
(778,'Kristin','Dawson',71017940,'K-Dawson66@hotmail.com','2023-01-16 13:34:57','1987',1,386,'001-193-588-4750x0785'),
(779,'Sheila','Davis',66836313,'S.Davis63@gmail.com','2023-01-16 13:34:57','2001',1,899,'141.495.0104x7737'),
(780,'Melissa','Jones',82439749,'M-Jones94@hotmail.com','2023-01-16 13:34:57','1984',1,116,'1066512582'),
(781,'Tyler','White',84628628,'T.White55@hotmail.com','2023-01-16 13:34:57','1964',1,625,'829.685.1360'),
(782,'Angela','Mejia',51388921,'A_Mejia71@hotmail.com','2023-01-16 13:34:57','1946',1,57,'347.810.7973x00830'),
(783,'Wanda','Coleman',73036014,'W_Coleman87@gmail.com','2023-01-16 13:34:57','1956',1,787,'550.295.7358'),
(784,'Dustin','Garcia',32018882,'D_Garcia67@yahoo.com','2023-01-16 13:34:57','1942',1,75,'451.625.8960x171'),
(785,'Daniel','Hall',95281414,'D_Hall68@yahoo.com','2023-01-16 13:34:57','2003',1,839,'+1-667-562-4480x49018'),
(786,'Richard','Baxter',90817170,'R_Baxter51@yahoo.com','2023-01-16 13:34:57','1997',1,24,'(195)245-3445x02133'),
(787,'Robert','Villanueva',42234953,'R_Villanueva80@gmail.com','2023-01-16 13:34:57','2006',1,867,'8163975862'),
(788,'David','Gray',85857671,'D-Gray51@gmail.com','2023-01-16 13:34:57','1996',1,972,'(672)104-7075'),
(789,'Adam','Arellano',91672463,'A-Arellano54@yahoo.com','2023-01-16 13:34:57','1972',1,633,'001-114-882-4503x1666'),
(790,'Meagan','Avila',37406556,'M_Avila89@yahoo.com','2023-01-16 13:34:57','1976',1,212,'+1-915-482-9482'),
(791,'William','Henry',88175510,'W-Henry57@gmail.com','2023-01-16 13:34:57','1979',1,759,'032-176-6409x7980'),
(792,'Carlos','Baker',12615661,'C.Baker99@gmail.com','2023-01-16 13:34:57','1958',1,843,'659-211-4810'),
(793,'Tammie','Ellis',68329466,'T-Ellis54@gmail.com','2023-01-16 13:34:57','1948',1,908,'(946)576-1188'),
(794,'Marc','Kemp',14513549,'M_Kemp56@yahoo.com','2023-01-16 13:34:57','1962',1,845,'046.814.3695'),
(795,'Julia','Hamilton',76470817,'J.Hamilton77@gmail.com','2023-01-16 13:34:57','2000',1,670,'(903)482-3093x08317'),
(796,'Taylor','Duran',23562058,'T_Duran81@gmail.com','2023-01-16 13:34:57','1956',1,610,'(233)782-4579x466'),
(797,'Jill','Gillespie',17566997,'J-Gillespie74@hotmail.com','2023-01-16 13:34:57','1956',1,213,'4615214236'),
(798,'Stephanie','Hudson',36781376,'S.Hudson74@hotmail.com','2023-01-16 13:34:57','1979',1,519,'569-250-2222x905'),
(799,'Nathan','Johnson',25735222,'N-Johnson56@hotmail.com','2023-01-16 13:34:57','2002',1,991,'(697)465-1808x0861'),
(800,'Jason','Burns',85066810,'J-Burns67@yahoo.com','2023-01-16 13:34:57','1942',1,317,'253.290.7094x1441'),
(801,'Amber','Murphy',46675419,'A-Murphy97@gmail.com','2023-01-16 13:34:57','1982',1,197,'(039)539-4817'),
(802,'Kristy','Smith',59211648,'K.Smith99@yahoo.com','2023-01-16 13:34:57','1975',1,381,'+1-320-457-7946'),
(803,'Gabriel','Church',16839790,'G_Church67@gmail.com','2023-01-16 13:34:57','1984',1,452,'001-088-028-4351x4148'),
(804,'Thomas','Stephens',16025495,'T.Stephens67@gmail.com','2023-01-16 13:34:57','1973',1,301,'001-948-662-9928'),
(805,'Matthew','Reynolds',49348043,'M.Reynolds84@hotmail.com','2023-01-16 13:34:57','1979',1,361,'+1-990-498-8493x08881'),
(806,'Jennifer','Fuller',59721486,'J-Fuller60@hotmail.com','2023-01-16 13:34:57','1969',1,839,'001-911-006-8775x3116'),
(807,'Michael','Wilson',60463759,'M-Wilson54@gmail.com','2023-01-16 13:34:57','1950',1,251,'001-973-117-6800'),
(808,'Michelle','Griffith',19106214,'M.Griffith56@gmail.com','2023-01-16 13:34:57','1940',1,455,'(975)995-1363x43540'),
(809,'Mary','Alexander',19789649,'M.Alexander80@gmail.com','2023-01-16 13:34:57','1996',1,356,'615.063.4427x88511'),
(810,'Kathleen','Fernandez',56202769,'K-Fernandez90@yahoo.com','2023-01-16 13:34:57','1966',1,110,'+1-094-605-2208x189'),
(811,'Adrian','Morrison',25034521,'A.Morrison82@hotmail.com','2023-01-16 13:34:57','1986',1,475,'210-633-0128'),
(812,'Jacob','Klein',58101022,'J_Klein68@yahoo.com','2023-01-16 13:34:57','1980',1,547,'542-927-0858x631'),
(813,'Danny','Smith',86794061,'D_Smith97@yahoo.com','2023-01-16 13:34:57','1958',1,751,'2211214395'),
(814,'Derrick','Strickland',85662614,'D_Strickland53@hotmail.com','2023-01-16 13:34:57','1956',1,160,'+1-015-658-1156x77163'),
(815,'Laura','Gardner',18664683,'L-Gardner77@hotmail.com','2023-01-16 13:34:57','1983',1,879,'(999)872-5258'),
(816,'Bonnie','Carpenter',28210866,'B-Carpenter97@gmail.com','2023-01-16 13:34:57','1976',1,76,'(269)790-0853'),
(817,'Dana','Fisher',46505239,'D-Fisher88@hotmail.com','2023-01-16 13:34:57','1973',1,591,'+1-224-815-5016x194'),
(818,'Gregory','Smith',46631847,'G-Smith99@hotmail.com','2023-01-16 13:34:57','1979',1,824,'4451767539'),
(819,'Ronald','Jacobson',81379791,'R.Jacobson94@yahoo.com','2023-01-16 13:34:57','1966',1,823,'444.373.3627'),
(820,'Robert','Hayes',37199734,'R_Hayes90@yahoo.com','2023-01-16 13:34:57','1935',1,990,'501-711-6627x67779'),
(821,'Jocelyn','Newton',52791383,'J_Newton76@hotmail.com','2023-01-16 13:34:57','1956',1,793,'001-325-787-2914x6554'),
(822,'Ronald','Rush',14822889,'R-Rush75@gmail.com','2023-01-16 13:34:57','1953',1,300,'117.462.9260x36375'),
(823,'Tracey','Pace',81617577,'T_Pace95@yahoo.com','2023-01-16 13:34:57','1958',1,252,'495.855.4504'),
(824,'Matthew','Kim',25580691,'M-Kim69@gmail.com','2023-01-16 13:34:57','1990',1,444,'001-315-643-9175x075'),
(825,'William','Rodriguez',76190541,'W.Rodriguez96@yahoo.com','2023-01-16 13:34:57','1943',1,775,'(927)403-9537'),
(826,'Brittney','Thomas',98396767,'B-Thomas96@gmail.com','2023-01-16 13:34:57','1967',1,197,'773.776.8572x002'),
(827,'Anthony','Austin',72368817,'A_Austin98@gmail.com','2023-01-16 13:34:57','1986',1,241,'(441)869-7652x73441'),
(828,'Daniel','Ellis',41392203,'D.Ellis78@hotmail.com','2023-01-16 13:34:57','1947',1,510,'001-836-713-1224x823'),
(829,'Crystal','Kemp',33723337,'C_Kemp98@gmail.com','2023-01-16 13:34:57','1977',1,250,'169-248-9463'),
(830,'Melissa','Ramirez',75874650,'M_Ramirez76@yahoo.com','2023-01-16 13:34:57','1956',1,579,'553.490.6988x49955'),
(831,'Lisa','Fuller',72407372,'L_Fuller84@gmail.com','2023-01-16 13:34:57','1994',1,304,'+1-819-129-1807'),
(832,'Randall','Santiago',46956611,'R-Santiago56@hotmail.com','2023-01-16 13:34:57','1976',1,863,'(917)941-6094x87569'),
(833,'Victoria','Hale',51878708,'V_Hale87@yahoo.com','2023-01-16 13:34:57','1974',1,455,'462.733.1936'),
(834,'David','Ortiz',10047303,'D.Ortiz73@gmail.com','2023-01-16 13:34:57','1954',1,977,'(503)764-7313'),
(835,'Desiree','Burnett',25012045,'D_Burnett74@hotmail.com','2023-01-16 13:34:57','1978',1,968,'8160133903'),
(836,'Jacqueline','Carr',52098829,'J-Carr79@gmail.com','2023-01-16 13:34:57','1967',1,520,'(254)621-1563x0784'),
(837,'Geoffrey','Garcia',70781274,'G-Garcia84@gmail.com','2023-01-16 13:34:57','2003',1,609,'1163745948'),
(838,'Derek','Wilson',84090299,'D_Wilson84@yahoo.com','2023-01-16 13:34:57','1987',1,56,'001-746-342-3151x4960'),
(839,'Nicole','Diaz',49433017,'N.Diaz99@gmail.com','2023-01-16 13:34:57','1960',1,338,'911.349.8170'),
(840,'Janice','Erickson',17081297,'J.Erickson62@yahoo.com','2023-01-16 13:34:57','1990',1,975,'(957)135-1909'),
(841,'Todd','Watson',20710794,'T.Watson82@hotmail.com','2023-01-16 13:34:57','1982',1,603,'+1-218-416-5258x9382'),
(842,'Janet','Pearson',48059765,'J_Pearson53@yahoo.com','2023-01-16 13:34:57','1959',1,761,'132-034-9861x374'),
(843,'Corey','Miller',98090913,'C-Miller85@yahoo.com','2023-01-16 13:34:57','2002',1,111,'+1-823-687-0809x8739'),
(844,'Daniel','Johnson',43618345,'D.Johnson70@yahoo.com','2023-01-16 13:34:57','1957',1,614,'+1-785-373-9017'),
(845,'Robert','Yang',49042358,'R.Yang55@gmail.com','2023-01-16 13:34:57','1954',1,560,'+1-619-925-7851x18337'),
(846,'Jason','Harris',22704215,'J-Harris80@hotmail.com','2023-01-16 13:34:57','1960',1,180,'001-180-625-9221x82765'),
(847,'Adam','Stanley',86734603,'A.Stanley99@hotmail.com','2023-01-16 13:34:57','1981',1,71,'319-435-8053x93699'),
(848,'Elizabeth','Ford',37528357,'E_Ford57@yahoo.com','2023-01-16 13:34:57','1977',1,83,'001-181-858-9582x2337'),
(849,'Jessica','Collins',80277510,'J_Collins59@gmail.com','2023-01-16 13:34:57','1956',1,317,'001-596-560-3731x591'),
(850,'Ralph','Evans',46163659,'R_Evans84@gmail.com','2023-01-16 13:34:57','1955',1,418,'825-659-1143'),
(851,'Matthew','Hamilton',65078921,'M.Hamilton96@gmail.com','2023-01-16 13:34:57','2010',1,690,'001-874-423-4135x84608'),
(852,'Keith','Cordova',94229326,'K.Cordova98@hotmail.com','2023-01-16 13:34:57','1981',1,885,'609-962-4463x5154'),
(853,'Shannon','Hall',83187256,'S.Hall91@yahoo.com','2023-01-16 13:34:57','1996',1,62,'0590705157'),
(854,'Erika','Dean',52357202,'E_Dean82@yahoo.com','2023-01-16 13:34:57','1962',1,949,'149-714-4435x20956'),
(855,'Phillip','Cunningham',73882094,'P_Cunningham69@gmail.com','2023-01-16 13:34:57','1966',1,346,'932.891.3773'),
(856,'Amanda','Mcdonald',49421426,'A_Mcdonald63@gmail.com','2023-01-16 13:34:57','1987',1,45,'001-193-339-1732x4711'),
(857,'Robert','Rodriguez',68398488,'R.Rodriguez62@gmail.com','2023-01-16 13:34:57','1981',1,915,'5543054850'),
(858,'Lawrence','Lynch',56450968,'L_Lynch81@hotmail.com','2023-01-16 13:34:57','1967',1,856,'145-478-4833'),
(859,'Donna','Goodman',41439353,'D-Goodman80@gmail.com','2023-01-16 13:34:57','1960',1,637,'001-990-960-7759x450'),
(860,'Brittany','Christensen',23126048,'B_Christensen59@gmail.com','2023-01-16 13:34:57','1991',1,278,'001-575-333-4771'),
(861,'Yolanda','Parks',81165696,'Y_Parks71@yahoo.com','2023-01-16 13:34:57','1997',1,916,'+1-182-496-6638x72842'),
(862,'Antonio','Elliott',52248948,'A.Elliott66@hotmail.com','2023-01-16 13:34:57','1982',1,11,'+1-084-709-5744x622'),
(863,'Donna','Taylor',38893787,'D-Taylor83@hotmail.com','2023-01-16 13:34:57','1954',1,152,'001-445-858-9457x4055'),
(864,'David','Owens',78696533,'D-Owens67@yahoo.com','2023-01-16 13:34:57','1983',1,709,'(763)682-3215'),
(865,'Aaron','Wells',84136328,'A_Wells89@yahoo.com','2023-01-16 13:34:57','1966',1,496,'678-670-3701x705'),
(866,'Jerry','Adams',49418054,'J_Adams90@gmail.com','2023-01-16 13:34:57','1955',1,217,'001-367-281-5652x4431'),
(867,'Edward','Wise',53467129,'E_Wise82@hotmail.com','2023-01-16 13:34:57','1962',1,454,'133-033-9915'),
(868,'Krystal','Patel',24885711,'K.Patel59@yahoo.com','2023-01-16 13:34:57','1957',1,289,'001-070-512-1109x22302'),
(869,'Michele','Mccoy',41063680,'M_Mccoy93@hotmail.com','2023-01-16 13:34:57','2006',1,520,'234.808.4811'),
(870,'Emily','Lee',38127401,'E.Lee58@gmail.com','2023-01-16 13:34:57','2009',1,15,'(114)540-5125'),
(871,'Derek','Dunn',15380700,'D-Dunn64@gmail.com','2023-01-16 13:34:57','1953',1,995,'(005)915-4756'),
(872,'John','Young',26371129,'J-Young55@hotmail.com','2023-01-16 13:34:57','1988',1,186,'999.759.1636x13424'),
(873,'Travis','Banks',52433863,'T-Banks50@gmail.com','2023-01-16 13:34:57','1958',1,725,'551.434.0011x402'),
(874,'Robert','Hayes',85215824,'R_Hayes81@gmail.com','2023-01-16 13:34:57','2006',1,992,'(567)808-2281x35154'),
(875,'Natalie','Gay',71236179,'N.Gay61@hotmail.com','2023-01-16 13:34:57','1996',1,457,'(066)581-3670x755'),
(876,'Amber','Hernandez',30902752,'A_Hernandez94@hotmail.com','2023-01-16 13:34:57','1962',1,173,'196-474-3835x606'),
(877,'Amanda','Kirk',10686651,'A_Kirk66@gmail.com','2023-01-16 13:34:57','1988',1,52,'(136)109-1225x9529'),
(878,'Brittney','Mcmillan',50503124,'B.Mcmillan85@gmail.com','2023-01-16 13:34:57','1995',1,663,'731-300-6549'),
(879,'Anthony','Kim',68080397,'A-Kim92@gmail.com','2023-01-16 13:34:57','1990',1,716,'620-856-1807'),
(880,'Donna','Willis',68776269,'D-Willis84@gmail.com','2023-01-16 13:34:57','1972',1,670,'795-795-4990'),
(881,'Christopher','Hayes',56538703,'C-Hayes68@gmail.com','2023-01-16 13:34:57','1987',1,614,'158-368-0859x1365'),
(882,'Julia','Buchanan',87180508,'J.Buchanan52@gmail.com','2023-01-16 13:34:57','1956',1,583,'001-051-416-1548x8043'),
(883,'Monica','Brown',92686489,'M_Brown77@gmail.com','2023-01-16 13:34:57','2003',1,667,'001-857-894-7780x923'),
(884,'Carl','Wall',61798304,'C.Wall55@gmail.com','2023-01-16 13:34:57','1950',1,173,'230-791-0194x94610'),
(885,'Alexandra','Smith',98351610,'A.Smith69@gmail.com','2023-01-16 13:34:57','1970',1,172,'(362)066-7030x9327'),
(886,'Brandi','Jenkins',83154626,'B-Jenkins93@gmail.com','2023-01-16 13:34:57','1986',1,392,'001-387-912-8138'),
(887,'Robert','Martinez',89594514,'R-Martinez74@hotmail.com','2023-01-16 13:34:57','1981',1,329,'+1-218-671-6445x117'),
(888,'Rachel','Saunders',27881896,'R.Saunders89@yahoo.com','2023-01-16 13:34:57','1930',1,374,'2936283122'),
(889,'Shannon','Roy',79894751,'S_Roy85@hotmail.com','2023-01-16 13:34:57','1966',1,210,'(559)970-9377x841'),
(890,'Brittany','Owens',67645831,'B.Owens87@hotmail.com','2023-01-16 13:34:57','1954',1,461,'001-964-819-5539x058'),
(891,'Chad','Craig',91738406,'C-Craig96@hotmail.com','2023-01-16 13:34:57','1953',1,444,'001-517-058-9038x200'),
(892,'Daniel','Page',57383966,'D-Page89@gmail.com','2023-01-16 13:34:57','1962',1,262,'1030692908'),
(893,'Bailey','Brown',81650929,'B-Brown98@yahoo.com','2023-01-16 13:34:57','1961',1,350,'+1-506-149-2303x96433'),
(894,'Bradley','James',63357140,'B.James83@gmail.com','2023-01-16 13:34:57','1943',1,636,'+1-312-086-6424x387'),
(895,'Christopher','Hawkins',46284508,'C_Hawkins87@hotmail.com','2023-01-16 13:34:57','1947',1,222,'+1-560-346-7249'),
(896,'Christopher','Hines',14115253,'C.Hines81@gmail.com','2023-01-16 13:34:57','2006',1,816,'(170)254-7034x941'),
(897,'Nicholas','Garner',68095117,'N-Garner90@gmail.com','2023-01-16 13:34:57','1990',1,927,'840-276-2269'),
(898,'Ryan','Scott',33478207,'R-Scott76@yahoo.com','2023-01-16 13:34:57','1949',1,811,'+1-760-837-0034x418'),
(899,'James','Jones',38383608,'J-Jones79@yahoo.com','2023-01-16 13:34:57','1968',1,397,'4825594256'),
(900,'Eric','Stuart',42166439,'E-Stuart91@gmail.com','2023-01-16 13:34:57','1974',1,973,'001-737-094-8037x5076'),
(901,'Anne','Carr',97561238,'A.Carr94@yahoo.com','2023-01-16 13:34:57','1980',1,293,'767.772.9930x3789'),
(902,'Sara','Thomas',84285661,'S-Thomas72@gmail.com','2023-01-16 13:34:57','1982',1,710,'505-857-6902x489'),
(903,'Adam','Goodman',69608287,'A_Goodman87@hotmail.com','2023-01-16 13:34:57','1977',1,702,'+1-946-508-8021x271'),
(904,'Lisa','Velez',97398862,'L-Velez77@hotmail.com','2023-01-16 13:34:57','1997',1,644,'001-200-038-8465x856'),
(905,'Keith','Sullivan',36948615,'K_Sullivan78@hotmail.com','2023-01-16 13:34:57','1980',1,778,'282.586.1137x62230'),
(906,'Jennifer','Graves',25545899,'J.Graves50@hotmail.com','2023-01-16 13:34:57','1935',1,512,'469-991-5572x04843'),
(907,'Kristine','Jones',60752974,'K-Jones64@gmail.com','2023-01-16 13:34:57','1938',1,829,'001-167-699-1975x74832'),
(908,'Jacob','Martin',39815020,'J_Martin82@yahoo.com','2023-01-16 13:34:57','1975',1,674,'1250474181'),
(909,'Elizabeth','Salazar',24881536,'E_Salazar61@yahoo.com','2023-01-16 13:34:57','1964',1,744,'8519643647'),
(910,'Bryan','Brooks',49261816,'B_Brooks88@yahoo.com','2023-01-16 13:34:57','1972',1,837,'629-829-0831x01204'),
(911,'Melissa','Wise',72996175,'M.Wise50@hotmail.com','2023-01-16 13:34:57','1967',1,780,'778-401-8783'),
(912,'Ashley','Brown',16114716,'A_Brown86@gmail.com','2023-01-16 13:34:57','1935',1,309,'807-957-6016x490'),
(913,'Richard','Cooper',11868286,'R_Cooper90@yahoo.com','2023-01-16 13:34:57','1981',1,472,'001-318-792-0004x20994'),
(914,'Sara','Reilly',46747490,'S_Reilly70@gmail.com','2023-01-16 13:34:57','1967',1,101,'(861)376-1073'),
(915,'Erin','Nielsen',70717608,'E_Nielsen91@gmail.com','2023-01-16 13:34:57','1987',1,444,'066.498.4183'),
(916,'Richard','Barrett',23036594,'R-Barrett59@hotmail.com','2023-01-16 13:34:57','1981',1,846,'5188289974'),
(917,'Thomas','Thompson',44043993,'T-Thompson93@hotmail.com','2023-01-16 13:34:57','1991',1,968,'576.142.9855x76211'),
(918,'Nicole','Mason',39454632,'N.Mason90@yahoo.com','2023-01-16 13:34:57','2003',1,208,'(907)063-7021'),
(919,'Anne','Hickman',23145575,'A-Hickman86@gmail.com','2023-01-16 13:34:57','1973',1,950,'+1-138-454-9554x6209'),
(920,'Philip','James',31859385,'P-James93@yahoo.com','2023-01-16 13:34:57','1990',1,905,'490-361-0747'),
(921,'Kevin','Johnson',23898698,'K_Johnson97@gmail.com','2023-01-16 13:34:57','1966',1,993,'(943)190-6037'),
(922,'Robert','Graham',39728011,'R-Graham88@gmail.com','2023-01-16 13:34:57','1935',1,19,'2791555060'),
(923,'Tiffany','Thomas',45935310,'T_Thomas61@yahoo.com','2023-01-16 13:34:57','1999',1,808,'+1-075-836-5316x062'),
(924,'Jeremy','Wood',95889001,'J_Wood91@yahoo.com','2023-01-16 13:34:57','1960',1,736,'796.562.6502x918'),
(925,'Jennifer','Reilly',54829711,'J.Reilly88@yahoo.com','2023-01-16 13:34:57','1981',1,615,'001-148-539-7780x458'),
(926,'Matthew','Johnson',65930164,'M_Johnson65@yahoo.com','2023-01-16 13:34:57','1960',1,311,'(908)508-1200'),
(927,'Lee','Davis',15501911,'L_Davis88@gmail.com','2023-01-16 13:34:57','1982',1,339,'001-517-371-4799x613'),
(928,'Jonathan','Le',34064088,'J.Le95@hotmail.com','2023-01-16 13:34:57','1995',1,775,'683.550.8175'),
(929,'Ricky','Perry',58209506,'R-Perry90@yahoo.com','2023-01-16 13:34:57','1980',1,283,'+1-298-666-0968x8905'),
(930,'Bobby','Jenkins',50334053,'B.Jenkins84@gmail.com','2023-01-16 13:34:57','1958',1,118,'945.443.0317'),
(931,'David','Rodriguez',71026955,'D_Rodriguez85@gmail.com','2023-01-16 13:34:57','1974',1,175,'+1-471-270-4803x6282'),
(932,'Pamela','Espinoza',43156920,'P-Espinoza52@yahoo.com','2023-01-16 13:34:57','1997',1,892,'+1-541-423-6137x9870'),
(933,'Brandon','White',71956215,'B_White64@yahoo.com','2023-01-16 13:34:57','1968',1,821,'(358)568-5222x2978'),
(934,'Michele','Cooper',72728220,'M.Cooper69@yahoo.com','2023-01-16 13:34:57','1976',1,924,'001-548-148-0422x18541'),
(935,'Antonio','Mcclain',38404513,'A.Mcclain72@hotmail.com','2023-01-16 13:34:57','1957',1,354,'001-202-605-4042x5837'),
(936,'Anita','Miller',21779814,'A-Miller65@hotmail.com','2023-01-16 13:34:57','1964',1,680,'887.084.1087x5393'),
(937,'Elizabeth','Adams',59147219,'E_Adams76@gmail.com','2023-01-16 13:34:57','1961',1,824,'186-795-4820x6998'),
(938,'Lisa','Perez',55754565,'L_Perez51@yahoo.com','2023-01-16 13:34:57','1951',1,792,'(322)742-6545'),
(939,'Audrey','Mendoza',81983432,'A_Mendoza79@gmail.com','2023-01-16 13:34:57','1989',1,270,'+1-656-425-3819x03031'),
(940,'Karen','Johnson',48325098,'K.Johnson92@yahoo.com','2023-01-16 13:34:57','1941',1,621,'627.298.2618x481'),
(941,'Joy','Rodriguez',89819669,'J.Rodriguez60@hotmail.com','2023-01-16 13:34:57','1942',1,926,'427-934-3740'),
(942,'Edward','Morrison',48865552,'E_Morrison92@gmail.com','2023-01-16 13:34:57','1945',1,633,'+1-654-518-2960x703'),
(943,'Henry','Schmitt',48742833,'H-Schmitt89@hotmail.com','2023-01-16 13:34:57','1944',1,509,'(832)827-4884x44651'),
(944,'Johnathan','Wang',36918825,'J-Wang56@gmail.com','2023-01-16 13:34:57','1964',1,466,'+1-751-758-4279'),
(945,'Nancy','Reese',61226005,'N.Reese76@gmail.com','2023-01-16 13:34:57','1967',1,328,'356-435-1156x310'),
(946,'Anthony','Davis',29619296,'A_Davis90@yahoo.com','2023-01-16 13:34:57','1963',1,0,'001-106-309-8352x86681'),
(947,'Michael','Wilson',82751803,'M-Wilson76@gmail.com','2023-01-16 13:34:57','1974',1,258,'001-229-310-6110x80116'),
(948,'Timothy','Palmer',74133245,'T_Palmer80@gmail.com','2023-01-16 13:34:57','2008',1,229,'049.076.5758x59825'),
(949,'Cory','Maxwell',19231322,'C_Maxwell76@yahoo.com','2023-01-16 13:34:57','1990',1,339,'807.741.7401x2123'),
(950,'Alyssa','Adams',78798273,'A.Adams66@gmail.com','2023-01-16 13:34:57','1958',1,57,'687-669-4868x703'),
(951,'Jeffrey','Cooley',80864117,'J_Cooley67@hotmail.com','2023-01-16 13:34:57','1942',1,180,'(876)762-4074'),
(952,'Mark','Benson',12932129,'M.Benson91@hotmail.com','2023-01-16 13:34:57','1974',1,277,'+1-923-813-8969x71429'),
(953,'Gabrielle','Douglas',53552332,'G-Douglas78@gmail.com','2023-01-16 13:34:57','1964',1,217,'4461993581'),
(954,'Dustin','Good',91583829,'D_Good63@gmail.com','2023-01-16 13:34:57','1966',1,562,'(885)319-2588'),
(955,'Jerry','Torres',43900383,'J-Torres82@hotmail.com','2023-01-16 13:34:57','1941',1,385,'+1-916-733-0336x7656'),
(956,'Joshua','Maldonado',92007557,'J-Maldonado84@hotmail.com','2023-01-16 13:34:57','1988',1,200,'993-946-5405x242'),
(957,'Eric','Hill',63714689,'E.Hill80@yahoo.com','2023-01-16 13:34:57','1959',1,4,'(699)512-0945'),
(958,'Nathaniel','Ramirez',31360358,'N.Ramirez70@gmail.com','2023-01-16 13:34:57','1967',1,370,'(837)061-3242'),
(959,'Kari','Watson',23050961,'K.Watson63@yahoo.com','2023-01-16 13:34:57','1992',1,558,'(829)869-3156x6164'),
(960,'Curtis','Smith',10462556,'C-Smith73@gmail.com','2023-01-16 13:34:57','1969',1,573,'410.612.9073x282'),
(961,'Jane','Bailey',31453364,'J.Bailey67@yahoo.com','2023-01-16 13:34:57','1995',1,186,'001-712-908-6070x58206'),
(962,'Megan','Hayes',41036453,'M.Hayes62@hotmail.com','2023-01-16 13:34:57','1951',1,712,'963.323.0037'),
(963,'Catherine','Roach',65153913,'C.Roach55@yahoo.com','2023-01-16 13:34:57','1974',1,667,'001-790-469-8134x5577'),
(964,'Thomas','Boone',23719849,'T_Boone91@gmail.com','2023-01-16 13:34:57','1976',1,517,'154.819.1926x150'),
(965,'Elizabeth','Hart',28584446,'E_Hart54@hotmail.com','2023-01-16 13:34:57','1991',1,531,'721-123-5424x05746'),
(966,'Jose','Nichols',16365142,'J_Nichols51@hotmail.com','2023-01-16 13:34:57','1969',1,587,'001-833-173-7892'),
(967,'Robert','Woods',67651942,'R.Woods85@yahoo.com','2023-01-16 13:34:57','1971',1,290,'(396)448-4902x29941'),
(968,'Laura','Smith',89635022,'L_Smith77@gmail.com','2023-01-16 13:34:57','1992',1,998,'+1-567-603-2881x6774'),
(969,'Claudia','Taylor',25238967,'C-Taylor73@hotmail.com','2023-01-16 13:34:57','1987',1,434,'246-232-6359x451'),
(970,'Margaret','West',86903444,'M-West90@gmail.com','2023-01-16 13:34:57','1970',1,619,'001-277-431-6599'),
(971,'John','Hopkins',35301903,'J-Hopkins91@yahoo.com','2023-01-16 13:34:57','1966',1,110,'(216)591-9518'),
(972,'Christopher','Williams',55418932,'C.Williams84@yahoo.com','2023-01-16 13:34:57','1955',1,745,'+1-713-750-0759x0232'),
(973,'Eric','Sanders',57184681,'E.Sanders59@hotmail.com','2023-01-16 13:34:57','2004',1,579,'388.988.6977'),
(974,'Daniel','Byrd',42125623,'D.Byrd88@yahoo.com','2023-01-16 13:34:57','1977',1,369,'(373)063-9556'),
(975,'Adam','Black',14300741,'A_Black82@yahoo.com','2023-01-16 13:34:57','1992',1,871,'(793)303-2564x044'),
(976,'Susan','Robinson',56091906,'S-Robinson81@gmail.com','2023-01-16 13:34:57','1975',1,628,'170.023.2794'),
(977,'Juan','King',52610532,'J.King93@hotmail.com','2023-01-16 13:34:57','2015',1,417,'(912)258-9883x06528'),
(978,'Mark','Gibson',85859290,'M.Gibson78@yahoo.com','2023-01-16 13:34:57','1964',1,86,'001-148-676-0343x4838'),
(979,'Molly','Williams',79817044,'M_Williams75@yahoo.com','2023-01-16 13:34:57','1985',1,930,'095-896-1983x24848'),
(980,'Mark','Baker',22302488,'M.Baker70@hotmail.com','2023-01-16 13:34:57','1980',1,783,'(750)851-6573x60086'),
(981,'Brittany','Carter',50443613,'B.Carter83@yahoo.com','2023-01-16 13:34:57','2015',1,405,'001-967-918-3177x93606'),
(982,'Sarah','Gilmore',47948845,'S_Gilmore71@yahoo.com','2023-01-16 13:34:57','1974',1,314,'+1-770-181-5825'),
(983,'Jonathan','Moore',78635354,'J-Moore93@yahoo.com','2023-01-16 13:34:57','1945',1,360,'001-723-399-5504x382'),
(984,'Preston','White',69608453,'P-White66@gmail.com','2023-01-16 13:34:57','1978',1,273,'583.191.4798'),
(985,'Laura','Donovan',18761977,'L.Donovan58@hotmail.com','2023-01-16 13:34:57','2002',1,6,'509.196.5451'),
(986,'Cory','Spencer',63260184,'C_Spencer66@gmail.com','2023-01-16 13:34:57','1955',1,886,'7346522839'),
(987,'Amy','Cruz',87149337,'A.Cruz89@yahoo.com','2023-01-16 13:34:57','1970',1,123,'924.646.5946x76585'),
(988,'Jennifer','Huynh',24006024,'J.Huynh73@hotmail.com','2023-01-16 13:34:57','1968',1,742,'058.000.5440'),
(989,'Maureen','Kennedy',55277823,'M-Kennedy71@yahoo.com','2023-01-16 13:34:57','1971',1,69,'9667413048'),
(990,'Stephen','Todd',41424260,'S.Todd73@gmail.com','2023-01-16 13:34:57','2009',1,541,'(108)131-7449x757'),
(991,'Julie','Myers',76283871,'J_Myers69@hotmail.com','2023-01-16 13:34:57','1993',1,900,'(905)813-1314x640'),
(992,'Robert','Hubbard',91981262,'R-Hubbard58@yahoo.com','2023-01-16 13:34:57','2010',1,998,'109.090.9235x18396'),
(993,'Todd','Estes',19395028,'T_Estes84@hotmail.com','2023-01-16 13:34:57','1972',1,234,'001-223-302-7430x5831'),
(994,'Anthony','Campbell',92515041,'A.Campbell70@hotmail.com','2023-01-16 13:34:57','1975',1,522,'3821470570'),
(995,'Cynthia','Combs',14165295,'C-Combs64@gmail.com','2023-01-16 13:34:57','1955',1,380,'9047895109'),
(996,'David','Todd',30282979,'D_Todd71@yahoo.com','2023-01-16 13:34:57','1968',1,107,'(629)884-3285'),
(997,'Denise','Nunez',35223304,'D_Nunez51@gmail.com','2023-01-16 13:34:57','1973',1,14,'001-346-222-3767x21257'),
(998,'Matthew','Bryan',69887622,'M-Bryan63@yahoo.com','2023-01-16 13:34:57','1975',1,905,'001-989-072-7753x73771'),
(999,'Jennifer','Rodriguez',39647448,'J_Rodriguez66@hotmail.com','2023-01-16 13:34:57','1978',1,677,'+1-828-278-8294x3960');
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
    z_id VARCHAR(20),
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
    p_id VARCHAR(20),
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
    z_id VARCHAR(20)
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
    c_id VARCHAR(20),
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
    c_id VARCHAR(20)
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
CREATE DEFINER=`snaladm`@`mariadb` PROCEDURE `show_charging_station_zone`(z_id VARCHAR(20))
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
    z_id VARCHAR(20)
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
    p_id VARCHAR(20)
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
    z_id VARCHAR(20),
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
    z_id VARCHAR(20),
    parking_z_id VARCHAR(20),
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
    z_id VARCHAR(20),
    c_id VARCHAR(20),
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
    c_id VARCHAR(20)
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

-- Dump completed on 2023-01-16 14:36:17
