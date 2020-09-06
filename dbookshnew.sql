-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: booksh
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bin`
--

DROP TABLE IF EXISTS `bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_book` bigint unsigned NOT NULL,
  `id_client` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_book` (`id_book`),
  CONSTRAINT `bin_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bin`
--

LOCK TABLES `bin` WRITE;
/*!40000 ALTER TABLE `bin` DISABLE KEYS */;
INSERT INTO `bin` VALUES (1,1,1822),(2,1,1823),(3,2,1822),(4,3,1822),(5,4,1),(6,5,1),(7,4,2),(8,9,1830),(9,10,1829),(10,10,1828);
/*!40000 ALTER TABLE `bin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `genre_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Флористика для чайников','Иван Иванов','2019','200 г',5),(2,'Убийца за океаном','Сергей Сергеев','2015','150 г',3),(3,'Межзвездное пространство','Мария Маринина','2016','300 г',2),(4,'Время и деньги','Анна Игошина','2020','350 г',6),(5,'Абстракционизм','Анна Иванова','2020','320 г',5),(6,'Горько','Максим Иванов','2010','310 г',3),(7,'Остров на суше','Алексей Орлов','2009','330 г',4),(8,'Человек-олень','Мелл Клемси','2020','110 г',1),(9,'Математика. 1 класс','Инга Абрамова','2014','500 г',5),(10,'Огни в ночи','Энн Уайт','2017','230 г',2);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `buyer_in_chat`
--

DROP TABLE IF EXISTS `buyer_in_chat`;
/*!50001 DROP VIEW IF EXISTS `buyer_in_chat`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `buyer_in_chat` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `price`,
 1 AS `Покупатель`,
 1 AS `manager`,
 1 AS `message_text`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `buyers`
--

DROP TABLE IF EXISTS `buyers`;
/*!50001 DROP VIEW IF EXISTS `buyers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `buyers` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `author`,
 1 AS `year`,
 1 AS `weight`,
 1 AS `price`,
 1 AS `in_stock`,
 1 AS `genre`,
 1 AS `Покупатель`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_client` bigint unsigned NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,1,'Кирилл О.'),(2,2,'Кристина А.'),(3,1822,'Иван Б.'),(4,1823,'Алексей К.'),(5,1824,'Екатерина Р.'),(6,1825,'Римма О.'),(7,1826,'Анна М.'),(8,1827,'Антон П.'),(9,1828,'Дмитрий К.'),(10,1829,'Елена Я.'),(11,1830,'Андрей Д.'),(12,1831,'Олег З.');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discs`
--

DROP TABLE IF EXISTS `discs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `disc_id` bigint unsigned NOT NULL,
  `discount %` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `disc_id` (`disc_id`),
  CONSTRAINT `discs_ibfk_1` FOREIGN KEY (`disc_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discs`
--

LOCK TABLES `discs` WRITE;
/*!40000 ALTER TABLE `discs` DISABLE KEYS */;
INSERT INTO `discs` VALUES (1,2,5),(2,5,3),(3,1,15);
/*!40000 ALTER TABLE `discs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `genre` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Комиксы'),(2,'Фантастика'),(3,'Детектив'),(4,'Художественная'),(5,'Учебная'),(6,'Бизнес');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `goods_in_bin`
--

DROP TABLE IF EXISTS `goods_in_bin`;
/*!50001 DROP VIEW IF EXISTS `goods_in_bin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `goods_in_bin` AS SELECT 
 1 AS `Имя клиента`,
 1 AS `Код клиента`,
 1 AS `Товары в корзине`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `in_stock`
--

DROP TABLE IF EXISTS `in_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_stock` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_book` bigint unsigned NOT NULL,
  `in_stock` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'В наличии',
  PRIMARY KEY (`id`),
  KEY `id_book` (`id_book`),
  CONSTRAINT `in_stock_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_stock`
--

LOCK TABLES `in_stock` WRITE;
/*!40000 ALTER TABLE `in_stock` DISABLE KEYS */;
INSERT INTO `in_stock` VALUES (1,6,'Нет в наличии'),(2,1,'В наличии'),(3,2,'В наличии'),(4,3,'В наличии'),(5,4,'В наличии'),(6,5,'В наличии'),(7,7,'Нет в наличии'),(8,8,'В наличии'),(9,9,'В наличии'),(10,10,'В наличии');
/*!40000 ALTER TABLE `in_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `main`
--

DROP TABLE IF EXISTS `main`;
/*!50001 DROP VIEW IF EXISTS `main`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `main` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `author`,
 1 AS `year`,
 1 AS `weight`,
 1 AS `price`,
 1 AS `in_stock`,
 1 AS `genre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `newcomings`
--

DROP TABLE IF EXISTS `newcomings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newcomings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_new` bigint unsigned DEFAULT NULL,
  `phrase` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Новинка',
  PRIMARY KEY (`id`),
  KEY `id_new` (`id_new`),
  CONSTRAINT `newcomings_ibfk_1` FOREIGN KEY (`id_new`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newcomings`
--

LOCK TABLES `newcomings` WRITE;
/*!40000 ALTER TABLE `newcomings` DISABLE KEYS */;
INSERT INTO `newcomings` VALUES (1,2,'Новинка'),(2,1,'Новинка');
/*!40000 ALTER TABLE `newcomings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `newcomings_v`
--

DROP TABLE IF EXISTS `newcomings_v`;
/*!50001 DROP VIEW IF EXISTS `newcomings_v`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `newcomings_v` AS SELECT 
 1 AS `id`,
 1 AS `author`,
 1 AS `year`,
 1 AS `weight`,
 1 AS `genre`,
 1 AS `price`,
 1 AS `phrase`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `price_id` bigint unsigned NOT NULL,
  `price` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `price_id` (`price_id`),
  CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`price_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,2,250),(2,5,550),(3,1,340),(4,4,450),(5,3,670),(6,6,370),(7,7,1000),(8,8,980),(9,9,780),(10,10,560);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_price_before_update` BEFORE UPDATE ON `prices` FOR EACH ROW begin
    if new.price <= '0' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Операция отменена. Цена должна быть больше 0.';
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_book` bigint unsigned NOT NULL,
  `id_client_chat` bigint unsigned DEFAULT NULL,
  `id_client_shop` bigint unsigned DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_book` (`id_book`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,2,1,NULL,'Кирилл О.'),(2,1,2,NULL,'Кристина А.'),(3,5,NULL,1822,'Иван Б.'),(4,4,NULL,1823,'Алексей К.'),(5,3,NULL,1824,'Екатерина Р.'),(6,2,NULL,1825,'Римма О.'),(7,1,NULL,1826,'Анна М.'),(8,5,NULL,1827,'Антон П.'),(9,4,NULL,1828,'Дмитрий К.'),(10,3,NULL,1829,'Елена Я.'),(11,2,NULL,1830,'Андрей Д.'),(12,2,NULL,1831,'Олег З.');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_in_chat`
--

DROP TABLE IF EXISTS `sales_in_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_in_chat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_book` bigint unsigned NOT NULL,
  `id_client` bigint unsigned NOT NULL,
  `message_text` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `manager` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_book` (`id_book`),
  CONSTRAINT `sales_in_chat_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_in_chat`
--

LOCK TABLES `sales_in_chat` WRITE;
/*!40000 ALTER TABLE `sales_in_chat` DISABLE KEYS */;
INSERT INTO `sales_in_chat` VALUES (1,2,1,'Добрый день! Хочу заказать у вас книгу.','Алекс'),(2,2,1,'Интересна последняя книга Сергея Сергеева. Есть у вас?','Алекс'),(3,2,1,'Да, есть. Cтоит 250 рублей. Закажете? ','Алекс'),(4,2,1,'Да, спасибо.','Алекс'),(5,1,2,'Добрый день! Хочу заказать у вас книгу по флористике.','Хельга'),(6,1,2,'Добрый день! Есть книга Ивана Иванова. Стоимость - 340 рублей.','Хельга'),(7,1,2,'Да, спасибо, закажу.','Хельга'),(8,6,3,'Добрый день! Есть книги Максима Иванова?','Серхио'),(9,6,3,'Сейчас нет в наличии. Приносим извинения.','Серхио');
/*!40000 ALTER TABLE `sales_in_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `buyer_in_chat`
--

/*!50001 DROP VIEW IF EXISTS `buyer_in_chat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `buyer_in_chat` AS select `b`.`id` AS `id`,`b`.`name` AS `name`,`p`.`price` AS `price`,`s`.`name` AS `Покупатель`,`si`.`manager` AS `manager`,`si`.`message_text` AS `message_text` from (((`books` `b` join `prices` `p` on((`b`.`id` = `p`.`price_id`))) join `sales` `s` on((`b`.`id` = `s`.`id_book`))) join `sales_in_chat` `si` on((`s`.`id_client_chat` = `si`.`id_client`))) order by 'id' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `buyers`
--

/*!50001 DROP VIEW IF EXISTS `buyers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `buyers` AS select `b`.`id` AS `id`,`b`.`name` AS `name`,`b`.`author` AS `author`,`b`.`year` AS `year`,`b`.`weight` AS `weight`,`p`.`price` AS `price`,`i`.`in_stock` AS `in_stock`,`g`.`genre` AS `genre`,`s`.`name` AS `Покупатель` from ((((`books` `b` join `genres` `g` on((`b`.`genre_id` = `g`.`id`))) join `prices` `p` on((`b`.`id` = `p`.`price_id`))) join `in_stock` `i` on((`b`.`id` = `i`.`id_book`))) join `sales` `s` on((`b`.`id` = `s`.`id_book`))) order by 'id' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goods_in_bin`
--

/*!50001 DROP VIEW IF EXISTS `goods_in_bin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goods_in_bin` AS select `c`.`name` AS `Имя клиента`,`bi`.`id_client` AS `Код клиента`,`b`.`name` AS `Товары в корзине` from ((`clients` `c` join `bin` `bi` on((`bi`.`id_client` = `c`.`id_client`))) join `books` `b` on((`bi`.`id_book` = `b`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `main`
--

/*!50001 DROP VIEW IF EXISTS `main`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `main` AS select `b`.`id` AS `id`,`b`.`name` AS `name`,`b`.`author` AS `author`,`b`.`year` AS `year`,`b`.`weight` AS `weight`,`p`.`price` AS `price`,`i`.`in_stock` AS `in_stock`,`g`.`genre` AS `genre` from (((`books` `b` join `genres` `g` on((`b`.`genre_id` = `g`.`id`))) join `prices` `p` on((`b`.`id` = `p`.`price_id`))) join `in_stock` `i` on((`b`.`id` = `i`.`id_book`))) order by 'id' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `newcomings_v`
--

/*!50001 DROP VIEW IF EXISTS `newcomings_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `newcomings_v` AS select `b`.`id` AS `id`,`b`.`author` AS `author`,`b`.`year` AS `year`,`b`.`weight` AS `weight`,`g`.`genre` AS `genre`,`p`.`price` AS `price`,`n`.`phrase` AS `phrase` from (((`books` `b` join `genres` `g` on((`b`.`genre_id` = `g`.`id`))) join `prices` `p` on((`b`.`id` = `p`.`price_id`))) join `newcomings` `n` on((`b`.`id` = `n`.`id_new`))) order by 'id' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-26 21:48:08
