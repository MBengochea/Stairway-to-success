-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: musics
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.1

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
-- Table structure for table `top_hits`
--

DROP TABLE IF EXISTS `top_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_hits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track_name` varchar(255) NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `energy` float DEFAULT NULL,
  `length` float DEFAULT NULL,
  `popularity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_hits`
--

LOCK TABLES `top_hits` WRITE;
/*!40000 ALTER TABLE `top_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_hits_clean`
--

DROP TABLE IF EXISTS `top_hits_clean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_hits_clean` (
  `track_name` text,
  `artist_name` text,
  `genre` text,
  `energy` bigint DEFAULT NULL,
  `length` int DEFAULT NULL,
  `popularity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_hits_clean`
--

LOCK TABLES `top_hits_clean` WRITE;
/*!40000 ALTER TABLE `top_hits_clean` DISABLE KEYS */;
INSERT INTO `top_hits_clean` VALUES ('señorita','shawn mendes','canadian pop',55,191,79),('china','anuel aa','reggaeton flow',81,302,92),('boyfriend (with social house)','ariana grande','dance pop',80,186,85),('beautiful people (feat_ khalid)','ed sheeran','pop',65,198,86),('goodbyes (feat_ young thug)','post malone','dfw rap',65,175,94),('i don\'t care (with justin bieber)','ed sheeran','pop',68,220,84),('ransom','lil tecca','trap music',64,131,92),('how do you sleep?','sam smith','pop',68,202,90),('old town road - remix','lil nas x','country rap',62,157,87),('bad guy','billie eilish','electropop',43,194,95),('callaita','bad bunny','reggaeton',62,251,93),('loco contigo (feat_ j_ balvin & tyga)','dj snake','dance pop',71,185,86),('someone you loved','lewis capaldi','pop',41,182,88),('otro trago - remix','sech','panamanian pop',79,288,87),('money in the grave (drake ft_ rick ross)','drake','canadian hip hop',50,205,92),('no guidance (feat_ drake)','chris brown','dance pop',45,261,82),('la canción','j balvin','latin',65,243,90),('sunflower - spider-man: into the spider-verse','post malone','dfw rap',48,158,91),('lalala','y2k','canadian hip hop',39,161,88),('truth hurts','lizzo','escape room',62,173,91),('piece of your heart','meduza','pop house',74,153,91),('panini','lil nas x','country rap',59,115,91),('no me conoce - remix','jhay cortez','reggaeton flow',79,309,83),('soltera - remix','lunay','latin',78,266,91),('bad guy (with justin bieber)','billie eilish','electropop',45,195,89),('if i can\'t have you','shawn mendes','canadian pop',82,191,70),('dance monkey','tones and i','australian pop',59,210,83),('it\'s you','ali gatie','canadian hip hop',46,213,89),('con calma','daddy yankee','latin',86,193,91),('que pretendes','j balvin','latin',79,222,89),('takeaway','the chainsmokers','edm',51,210,84),('7 rings','ariana grande','dance pop',32,179,89),('0_958333333333333','maluma','reggaeton',71,176,89),('the london (feat_ j_ cole & travis scott)','young thug','atl hip hop',59,200,89),('never really over','katy perry','dance pop',88,224,89),('summer days (feat_ macklemore & patrick stump of fall out boy)','martin garrix','big room',72,164,89),('otro trago','sech','panamanian pop',70,226,91),('antisocial (with travis scott)','ed sheeran','pop',82,162,87),('sucker','jonas brothers','boy band',73,181,80),('fuck, i\'m lonely (with anne-marie) - from 13 reasons why: season 3','lauv','dance pop',56,199,78),('higher love','kygo','edm',68,228,88),('you need to calm down','taylor swift','dance pop',68,171,90),('shallow','lady gaga','dance pop',39,216,87),('talk','khalid','pop',40,198,84),('con altura','rosalía','r&b en espanol',69,162,88),('one thing right','marshmello','brostep',62,182,88),('te robaré','nicky jam','latin',75,202,88),('happier','marshmello','brostep',79,214,88),('call you mine','the chainsmokers','edm',70,218,88),('cross me (feat_ chance the rapper & pnb rock)','ed sheeran','pop',79,206,82);
/*!40000 ALTER TABLE `top_hits_clean` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-16 18:28:48
