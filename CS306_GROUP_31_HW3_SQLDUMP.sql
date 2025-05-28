-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: movie_database
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `ActorID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `BirthDate` date DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ActorID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Keanu Reeves','1964-09-02','Male'),(2,'Laurence Fishburne','1961-07-30','Male'),(3,'Carrie-Anne Moss','1967-08-21','Female'),(4,'Hugo Weaving','1960-04-04','Male'),(5,'Leonardo DiCaprio','1974-11-11','Male'),(6,'Joseph Gordon-Levitt','1981-02-17','Male'),(7,'Liam Neeson','1952-06-07','Male'),(8,'Ralph Fiennes','1962-12-22','Male'),(9,'Ben Kingsley','1943-12-30','Male'),(10,'Caroline Goodall','1959-11-13','Female');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acts`
--

DROP TABLE IF EXISTS `acts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acts` (
  `ActorID` int(11) NOT NULL,
  `CharacterName` varchar(255) NOT NULL,
  `MovieID` int(11) NOT NULL,
  PRIMARY KEY (`ActorID`,`CharacterName`,`MovieID`),
  KEY `CharacterName` (`CharacterName`,`MovieID`),
  CONSTRAINT `acts_ibfk_1` FOREIGN KEY (`ActorID`) REFERENCES `actor` (`ActorID`),
  CONSTRAINT `acts_ibfk_2` FOREIGN KEY (`CharacterName`, `MovieID`) REFERENCES `character` (`Name`, `MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acts`
--

LOCK TABLES `acts` WRITE;
/*!40000 ALTER TABLE `acts` DISABLE KEYS */;
INSERT INTO `acts` VALUES (1,'Neo',1),(2,'Morpheus',1),(3,'Trinity',1),(4,'Agent Smith',1),(5,'Dom Cobb',2),(6,'Arthur',2),(6,'Eames',2),(7,'Robert Fischer',2),(8,'Oskar Schindler',3),(9,'Itzhak Stern',3),(10,'Amon Goeth',3);
/*!40000 ALTER TABLE `acts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award` (
  `AwardID` int(11) NOT NULL AUTO_INCREMENT,
  `AwardName` varchar(255) NOT NULL,
  `AwardYear` int(11) NOT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `MovieID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AwardID`),
  KEY `MovieID` (`MovieID`),
  CONSTRAINT `award_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award`
--

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;
INSERT INTO `award` VALUES (1,'Best Picture',2010,'Academy Award',1),(2,'Best Visual Effects',2009,'Academy Award',5),(3,'Best Actor',2019,'Academy Award',4),(4,'Best Director',1994,'Academy Award',3),(5,'Best Score',2000,'Academy Award',6),(6,'Best Cinematography',1999,'Academy Award',8),(7,'Best Costume Design',2019,'Academy Award',9),(8,'Best Sound Editing',2017,'Academy Award',10),(9,'Best Adapted Screenplay',2019,'Academy Award',9),(10,'Best Supporting Actor',1993,'Academy Award',2);
/*!40000 ALTER TABLE `award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belongs`
--

DROP TABLE IF EXISTS `belongs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `belongs` (
  `MovieID` int(11) NOT NULL,
  `GenreID` int(11) NOT NULL,
  PRIMARY KEY (`MovieID`,`GenreID`),
  KEY `GenreID` (`GenreID`),
  CONSTRAINT `belongs_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`),
  CONSTRAINT `belongs_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongs`
--

LOCK TABLES `belongs` WRITE;
/*!40000 ALTER TABLE `belongs` DISABLE KEYS */;
INSERT INTO `belongs` VALUES (1,1),(1,5),(2,1),(2,5),(3,3),(3,4),(4,3),(5,1),(5,5),(6,1),(6,3),(7,7),(7,8),(8,3),(8,4),(9,3),(9,8),(10,4),(10,6);
/*!40000 ALTER TABLE `belongs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_before_belongs_insert
BEFORE INSERT ON Belongs
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Belongs
        WHERE MovieID = NEW.MovieID AND GenreID = NEW.GenreID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This genre is already assigned to the movie.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `belongslog`
--

DROP TABLE IF EXISTS `belongslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `belongslog` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `MovieID` int(11) NOT NULL,
  `GenreID` int(11) NOT NULL,
  `InsertedAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LogID`),
  KEY `belongslog_ibfk_1` (`MovieID`),
  KEY `belongslog_ibfk_2` (`GenreID`),
  CONSTRAINT `belongslog_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`),
  CONSTRAINT `belongslog_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongslog`
--

LOCK TABLES `belongslog` WRITE;
/*!40000 ALTER TABLE `belongslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `belongslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boxoffice`
--

DROP TABLE IF EXISTS `boxoffice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boxoffice` (
  `BoxOfficeID` int(11) NOT NULL AUTO_INCREMENT,
  `MovieID` int(11) DEFAULT NULL,
  `Budget` decimal(15,2) DEFAULT NULL,
  `DomesticGross` decimal(15,2) DEFAULT NULL,
  `InternationalGross` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`BoxOfficeID`),
  UNIQUE KEY `MovieID` (`MovieID`),
  CONSTRAINT `boxoffice_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boxoffice`
--

LOCK TABLES `boxoffice` WRITE;
/*!40000 ALTER TABLE `boxoffice` DISABLE KEYS */;
INSERT INTO `boxoffice` VALUES (1,1,160000000.00,292576195.00,535700000.00),(2,2,63000000.00,357067947.00,657000000.00),(3,3,8000000.00,107928762.00,214000000.00),(4,4,159000000.00,772763.00,9610000.00),(5,5,237000000.00,760507625.00,2020000000.00),(6,6,103000000.00,187705427.00,457640000.00),(7,7,20000000.00,53992875.00,83000000.00),(8,8,63000000.00,37023395.00,100853753.00),(9,9,40000000.00,108101214.00,210000000.00),(10,10,4500000.00,176040665.00,255400000.00);
/*!40000 ALTER TABLE `boxoffice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character` (
  `Name` varchar(255) NOT NULL,
  `Salary` decimal(15,2) DEFAULT NULL,
  `MovieID` int(11) NOT NULL,
  PRIMARY KEY (`Name`,`MovieID`),
  KEY `MovieID` (`MovieID`),
  CONSTRAINT `character_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES ('Agent Smith',2000000.00,1),('Amon Goeth',800000.00,3),('Arthur',2000000.00,2),('Dom Cobb',4000000.00,2),('Eames',2000000.00,2),('Emilie Schindler',600000.00,3),('Itzhak Stern',800000.00,3),('Morpheus',3000000.00,1),('Neo',5000000.00,1),('Oskar Schindler',1000000.00,3),('Robert Fischer',1500000.00,2),('Trinity',3500000.00,1);
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `DirectorID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Experience` int(11) DEFAULT NULL,
  `Bio` text DEFAULT NULL,
  PRIMARY KEY (`DirectorID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Christopher Nolan',20,'British-American film director.'),(2,'Steven Spielberg',45,'American director and producer.'),(3,'Quentin Tarantino',30,'American filmmaker and screenwriter.'),(4,'Martin Scorsese',50,'American director known for crime films.'),(5,'James Cameron',35,'Canadian filmmaker and deep-sea explorer.'),(6,'Ridley Scott',40,'British film director and producer.'),(7,'Tim Burton',35,'American director known for gothic fantasy films.'),(8,'David Fincher',30,'American director known for psychological thrillers.'),(9,'Greta Gerwig',15,'American actress and filmmaker.'),(10,'Jordan Peele',10,'American filmmaker and comedian.');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `GenreID` int(11) NOT NULL AUTO_INCREMENT,
  `GenreName` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action','Fast-paced movies with physical stunts'),(2,'Comedy','Humorous content meant to entertain'),(3,'Drama','Serious narratives focused on character'),(4,'Thriller','Suspenseful and exciting plotlines'),(5,'Sci-Fi','Fictional content about technology and space'),(6,'Horror','Intended to scare and thrill audiences'),(7,'Fantasy','Mythical and supernatural themes'),(8,'Romance','Love-centered storytelling'),(9,'Animation','Movies created with animated techniques'),(10,'Documentary','Non-fictional, reality-based stories');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `has` (
  `MovieID` int(11) NOT NULL,
  `ReviewID` int(11) DEFAULT NULL,
  `RatingID` int(11) DEFAULT NULL,
  `BoxOfficeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MovieID`),
  UNIQUE KEY `ReviewID` (`ReviewID`),
  UNIQUE KEY `RatingID` (`RatingID`),
  UNIQUE KEY `BoxOfficeID` (`BoxOfficeID`),
  CONSTRAINT `has_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`),
  CONSTRAINT `has_ibfk_2` FOREIGN KEY (`ReviewID`) REFERENCES `review` (`ReviewID`),
  CONSTRAINT `has_ibfk_3` FOREIGN KEY (`RatingID`) REFERENCES `rating` (`RatingID`),
  CONSTRAINT `has_ibfk_4` FOREIGN KEY (`BoxOfficeID`) REFERENCES `boxoffice` (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `MovieID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `ReleaseYear` int(11) NOT NULL,
  `Duration` int(11) NOT NULL,
  `StudioID` int(11) DEFAULT NULL,
  `DirectorID` int(11) DEFAULT NULL,
  `RatingID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MovieID`),
  KEY `StudioID` (`StudioID`),
  KEY `DirectorID` (`DirectorID`),
  KEY `RatingID` (`RatingID`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`StudioID`) REFERENCES `studio` (`StudioID`),
  CONSTRAINT `movie_ibfk_2` FOREIGN KEY (`DirectorID`) REFERENCES `director` (`DirectorID`),
  CONSTRAINT `movie_ibfk_3` FOREIGN KEY (`RatingID`) REFERENCES `rating` (`RatingID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Inception',2010,148,1,1,3),(2,'Jurassic Park',1993,127,2,2,2),(3,'Pulp Fiction',1994,154,3,3,4),(4,'The Irishman',2019,209,4,4,4),(5,'Avatar',2009,162,5,5,3),(6,'Gladiator',2000,155,6,6,4),(7,'Edward Scissorhands',1990,105,7,7,2),(8,'Fight Club',1999,139,8,8,4),(9,'Little Women',2019,135,9,9,2),(10,'Get Out',2017,104,10,10,4),(11,'Short Movie',2025,120,NULL,NULL,NULL),(12,'Short Movie',2025,120,NULL,NULL,NULL),(13,'Short Movie',2025,120,NULL,NULL,NULL);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_before_movie_insert
BEFORE INSERT ON Movie
FOR EACH ROW
BEGIN
    IF NEW.Duration > 300 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Movie duration cannot exceed 300 minutes.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producer` (
  `ProducerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Company` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProducerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'Emma Thomas','Syncopy','Producer'),(2,'Jerry Bruckheimer','Jerry Bruckheimer Films','Producer'),(3,'Steven Spielberg','Spielberg Films','Producer'),(4,'Jerry Bruckheimer','Bruckheimer Films','Producer'),(5,'Jon Landau','Lightstorm Entertainment','Producer'),(6,'Lauren Shuler Donner','Donner Company','Producer'),(7,'Scott Rudin','Scott Rudin Productions','Producer'),(8,'Gale Anne Hurd','Valhalla Motion Pictures','Producer'),(9,'Denis Villeneuve','Legendary Pictures','Director/Producer'),(10,'J.J. Abrams','Bad Robot','Director/Producer');
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `RatingID` int(11) NOT NULL AUTO_INCREMENT,
  `RatingName` varchar(10) NOT NULL,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`RatingID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,'G','Suitable for all audiences'),(2,'PG','Parental guidance suggested'),(3,'PG-13','Parents strongly cautioned'),(4,'R','Restricted, under 17 requires an adult'),(5,'NC-17','No one under 17 admitted'),(6,'TV-Y','Appropriate for all children'),(7,'TV-G','General audience, suitable for all'),(8,'TV-PG','Parental guidance suggested'),(9,'TV-14','Parents strongly cautioned'),(10,'TV-MA','Mature audiences only');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratinghistory`
--

DROP TABLE IF EXISTS `ratinghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratinghistory` (
  `HistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ReviewID` int(11) DEFAULT NULL,
  `OldScore` decimal(3,1) DEFAULT NULL,
  `NewScore` decimal(3,1) DEFAULT NULL,
  `ChangedAt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`HistoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratinghistory`
--

LOCK TABLES `ratinghistory` WRITE;
/*!40000 ALTER TABLE `ratinghistory` DISABLE KEYS */;
INSERT INTO `ratinghistory` VALUES (1,1,7.5,9.0,'2025-05-28 17:18:41');
/*!40000 ALTER TABLE `ratinghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `ReviewID` int(11) NOT NULL AUTO_INCREMENT,
  `RatingID` int(11) DEFAULT NULL,
  `MovieID` int(11) DEFAULT NULL,
  `ReviewText` text DEFAULT NULL,
  `ReviewDate` date DEFAULT NULL,
  `RatingScore` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `RatingID` (`RatingID`),
  KEY `MovieID` (`MovieID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`RatingID`) REFERENCES `rating` (`RatingID`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,'Test review via PHP','2025-05-28',9.0),(2,1,1,'Auto-default test','2025-05-28',8.0),(3,1,1,'Test review via PHP','2025-05-28',7.5),(4,1,1,'Auto-default test','2025-05-28',8.0),(5,1,1,'Auto-default test','2025-05-28',8.0),(6,1,1,'Auto-default test','2025-05-28',8.0),(7,1,1,'Test review via PHP','2025-05-28',7.5);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_before_review_insert
BEFORE INSERT ON Review
FOR EACH ROW
BEGIN
    IF NEW.RatingID IS NULL THEN
        SET NEW.RatingID = 1;  -- Assuming 1 is PG or default
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_after_review_insert
AFTER INSERT ON Review
FOR EACH ROW
BEGIN
    INSERT INTO ReviewLog (ReviewID, MovieID, Action)
    VALUES (NEW.ReviewID, NEW.MovieID, 'INSERT');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_after_rating_update
AFTER UPDATE ON Review
FOR EACH ROW
BEGIN
    IF OLD.RatingScore <> NEW.RatingScore THEN
        INSERT INTO RatingHistory (ReviewID, OldScore, NewScore)
        VALUES (OLD.ReviewID, OLD.RatingScore, NEW.RatingScore);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reviewlog`
--

DROP TABLE IF EXISTS `reviewlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewlog` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `ReviewID` int(11) DEFAULT NULL,
  `MovieID` int(11) DEFAULT NULL,
  `ReviewDate` datetime DEFAULT current_timestamp(),
  `Action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewlog`
--

LOCK TABLES `reviewlog` WRITE;
/*!40000 ALTER TABLE `reviewlog` DISABLE KEYS */;
INSERT INTO `reviewlog` VALUES (1,1,1,'2025-05-28 17:18:32','INSERT'),(2,2,1,'2025-05-28 17:20:23','INSERT'),(3,3,1,'2025-05-28 17:31:39','INSERT'),(4,4,1,'2025-05-28 17:38:48','INSERT'),(5,5,1,'2025-05-28 17:38:49','INSERT'),(6,6,1,'2025-05-28 17:38:54','INSERT'),(7,7,1,'2025-05-28 17:45:25','INSERT');
/*!40000 ALTER TABLE `reviewlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio`
--

DROP TABLE IF EXISTS `studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studio` (
  `StudioID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Headquarters` varchar(255) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StudioID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio`
--

LOCK TABLES `studio` WRITE;
/*!40000 ALTER TABLE `studio` DISABLE KEYS */;
INSERT INTO `studio` VALUES (1,'Warner Bros.','Burbank, CA','USA'),(2,'Paramount Pictures','Hollywood, CA','USA'),(3,'Universal Pictures','Universal City, CA','USA'),(4,'20th Century Studios','Los Angeles, CA','USA'),(5,'Sony Pictures','Culver City, CA','USA'),(6,'MGM Studios','Beverly Hills, CA','USA'),(7,'Lionsgate','Santa Monica, CA','USA'),(8,'A24','New York, NY','USA'),(9,'Netflix Studios','Los Gatos, CA','USA'),(10,'Disney Studios','Burbank, CA','USA');
/*!40000 ALTER TABLE `studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `JoinDate` date DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','user1@example.com','2023-01-01'),(2,'user2','user2@example.com','2023-02-01'),(3,'user3','user3@example.com','2023-03-01'),(4,'user4','user4@example.com','2023-04-01'),(5,'user5','user5@example.com','2023-05-01'),(6,'user6','user6@example.com','2023-06-01'),(7,'user7','user7@example.com','2023-07-01'),(8,'user8','user8@example.com','2023-08-01'),(9,'user9','user9@example.com','2023-09-01'),(10,'user10','user10@example.com','2023-10-01');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writes`
--

DROP TABLE IF EXISTS `writes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writes` (
  `UserID` int(11) NOT NULL,
  `ReviewID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`ReviewID`),
  KEY `ReviewID` (`ReviewID`),
  CONSTRAINT `writes_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `writes_ibfk_2` FOREIGN KEY (`ReviewID`) REFERENCES `review` (`ReviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writes`
--

LOCK TABLES `writes` WRITE;
/*!40000 ALTER TABLE `writes` DISABLE KEYS */;
INSERT INTO `writes` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `writes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'movie_database'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `average_rating_for_movie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `average_rating_for_movie`(IN movie_title VARCHAR(255))
BEGIN
    SELECT M.Title, ROUND(AVG(R.RatingScore), 2) AS AverageRating
    FROM Movie M
    JOIN Review R ON M.MovieID = R.MovieID
    WHERE M.Title = movie_title
    GROUP BY M.Title;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `box_office_summary_by_director` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `box_office_summary_by_director`(IN director_name VARCHAR(255))
BEGIN
    SELECT D.Name AS Director, M.Title, B.Budget, B.DomesticGross, B.InternationalGross
    FROM Director D
    JOIN Movie M ON D.DirectorID = M.DirectorID
    JOIN BoxOffice B ON M.MovieID = B.MovieID
    WHERE D.Name = director_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_movies_by_genre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_movies_by_genre`(IN genre_name VARCHAR(100))
BEGIN
    SELECT M.Title, M.ReleaseYear
    FROM Movie M
    JOIN Belongs B ON M.MovieID = B.MovieID
    JOIN Genre G ON B.GenreID = G.GenreID
    WHERE G.GenreName = genre_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `movie_awards_summary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `movie_awards_summary`(IN movie_title VARCHAR(255))
BEGIN
    SELECT M.Title, A.AwardName, A.AwardYear, A.Category
    FROM Movie M
    JOIN Award A ON M.MovieID = A.MovieID
    WHERE M.Title = movie_title;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `top_rated_movies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `top_rated_movies`(IN top_n INT)
BEGIN
    SELECT M.Title, ROUND(AVG(R.RatingScore), 2) AS AvgRating
    FROM Movie M
    JOIN Review R ON M.MovieID = R.MovieID
    GROUP BY M.MovieID
    ORDER BY AvgRating DESC
    LIMIT top_n;
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

-- Dump completed on 2025-05-28 17:50:32
