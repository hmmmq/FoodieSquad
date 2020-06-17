-- MySQL dump 10.13  Distrib 5.7.28, for macos10.14 (x86_64)
--
-- Host: localhost    Database: foodie
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `canteen`
--

DROP TABLE IF EXISTS `canteen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canteen` (
  `canteen_id` int(11) NOT NULL,
  `canteen_name` varchar(30) DEFAULT NULL,
  `canteen_tele` varchar(30) DEFAULT NULL,
  `canteen_address` varchar(30) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`canteen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canteen`
--

LOCK TABLES `canteen` WRITE;
/*!40000 ALTER TABLE `canteen` DISABLE KEYS */;
INSERT INTO `canteen` VALUES (1,'海南大学第一食堂','66270001','海南大学',2),(2,'海南大学第二食堂','66270002','海南大学',2),(3,'海南大学第三食堂','66270003','海南大学',2),(4,'海南大学第四食堂','66270004','海南大学',2),(5,'海南大学第五食堂','66270005','海南大学',2),(6,'海南大学第六食堂','66270006','海南大学',2);
/*!40000 ALTER TABLE `canteen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  CONSTRAINT `cart_user` FOREIGN KEY (`cart_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10102 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,NULL),(50,NULL),(101,NULL),(102,NULL),(10101,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_item` (
  `cart_id` int(11) DEFAULT NULL,
  `dish_id` int(11) DEFAULT NULL,
  `dish_count` int(11) DEFAULT NULL,
  `cart_item_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cart_item_id`),
  KEY `cartit_cart_idx` (`cart_id`),
  KEY `cartit_dish_idx` (`dish_id`),
  CONSTRAINT `cartit_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cartit_dish` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `canteen_id` int(11) DEFAULT NULL,
  `canteen_comment` varchar(45) DEFAULT NULL,
  `window_id` int(11) DEFAULT NULL,
  `window_comment` varchar(45) DEFAULT NULL,
  `dish_id` int(11) DEFAULT NULL,
  `dish_comment` varchar(45) DEFAULT NULL,
  `comment_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `canteen_id_idx` (`canteen_id`),
  KEY `window_id_idx` (`window_id`),
  KEY `dish_id_idx` (`dish_id`),
  CONSTRAINT `canteen_id` FOREIGN KEY (`canteen_id`) REFERENCES `canteen` (`canteen_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `dish_id` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `window_id` FOREIGN KEY (`window_id`) REFERENCES `window` (`window_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish` (
  `dish_id` int(11) NOT NULL,
  `window_id` int(11) DEFAULT NULL,
  `dish_name` varchar(45) DEFAULT NULL,
  `dish_price` decimal(5,2) DEFAULT NULL,
  `dish_discription` varchar(45) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`dish_id`),
  KEY `dish_win_idx` (`window_id`),
  CONSTRAINT `dish_win` FOREIGN KEY (`window_id`) REFERENCES `window` (`window_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (10101,101,'一食堂窗口1菜品1',101.01,'一食堂窗口1菜品1',0),(10102,101,'一食堂窗口1菜品2',101.02,'一食堂窗口1菜品2',0),(10103,101,'一食堂窗口1菜品3',101.03,'一食堂窗口1菜品3',0),(10104,101,'一食堂窗口1菜品4',101.04,'一食堂窗口1菜品4',0),(10105,101,'一食堂窗口1菜品5',101.05,'一食堂窗口1菜品5',0),(10201,102,'一食堂窗口2菜品1',102.01,'一食堂窗口2菜品1',0),(10202,102,'一食堂窗口2菜品2',102.02,'一食堂窗口2菜品2',0),(10203,102,'一食堂窗口2菜品3',102.03,'一食堂窗口2菜品3',0),(10301,103,'一食堂窗口3菜品1',103.01,'一食堂窗口3菜品1',0),(10302,103,'一食堂窗口3菜品2',103.02,'一食堂窗口3菜品2',0),(10303,103,'一食堂窗口3菜品3',103.03,'一食堂窗口3菜品3',0),(10401,104,'一食堂窗口4菜品1',104.01,'一食堂窗口4菜品1',0),(10501,105,'一食堂窗口5菜品1',105.01,'一食堂窗口5菜品1',0),(20101,201,'二食堂窗口1菜品1',101.01,'二食堂窗口1菜品1',0),(20102,201,'二食堂窗口1菜品1',101.02,'二食堂窗口1菜品1',0),(20103,201,'二食堂窗口1菜品3',101.03,'二食堂窗口1菜品3',0),(20104,201,'二食堂窗口1菜品4',101.04,'二食堂窗口1菜品4',0),(20105,201,'二食堂窗口1菜品5',101.05,'二食堂窗口1菜品5',0),(20201,202,'二食堂窗口2菜品1',102.01,'二食堂窗口2菜品1',0),(20202,202,'二食堂窗口2菜品2',102.02,'二食堂窗口2菜品2',0),(20203,202,'二食堂窗口2菜品3',102.03,'二食堂窗口2菜品3',0),(20301,203,'二食堂窗口3菜品1',103.01,'二食堂窗口3菜品1',0),(20302,203,'二食堂窗口3菜品2',103.02,'二食堂窗口3菜品2',0),(20303,203,'二食堂窗口3菜品3',103.03,'二食堂窗口3菜品3',0),(20401,204,'二食堂窗口4菜品1',104.01,'二食堂窗口4菜品1',0),(20501,205,'二食堂窗口5菜品1',105.01,'二食堂窗口5菜品1',0),(30101,301,'三食堂窗口1菜品1',101.01,'三食堂窗口1菜品1',0),(30102,301,'三食堂窗口1菜品1',101.02,'三食堂窗口1菜品1',0),(30103,301,'三食堂窗口1菜品3',101.03,'三食堂窗口1菜品3',0),(30104,301,'三食堂窗口1菜品4',101.04,'三食堂窗口1菜品4',0),(30105,301,'三食堂窗口1菜品5',101.05,'三食堂窗口1菜品5',0),(30201,302,'三食堂窗口2菜品1',102.01,'三食堂窗口2菜品1',0),(30202,302,'三食堂窗口2菜品2',102.02,'三食堂窗口2菜品2',0),(30203,302,'三食堂窗口2菜品3',102.03,'三食堂窗口2菜品3',0),(30301,303,'三食堂窗口3菜品1',103.01,'三食堂窗口3菜品1',0),(30302,303,'三食堂窗口3菜品2',103.02,'三食堂窗口3菜品2',0),(30303,303,'三食堂窗口3菜品3',103.03,'三食堂窗口3菜品3',0),(30401,304,'三食堂窗口4菜品1',104.01,'三食堂窗口4菜品1',0),(30501,305,'三食堂窗口5菜品1',105.01,'三食堂窗口5菜品1',0),(40101,401,'四食堂窗口1菜品1',101.01,'四食堂窗口1菜品1',0),(40102,401,'四食堂窗口1菜品1',101.02,'四食堂窗口1菜品1',0),(40103,401,'四食堂窗口1菜品3',101.03,'四食堂窗口1菜品3',0),(40104,401,'四食堂窗口1菜品4',101.04,'四食堂窗口1菜品4',0),(40105,401,'四食堂窗口1菜品5',101.05,'四食堂窗口1菜品5',0),(40201,402,'四食堂窗口2菜品1',102.01,'四食堂窗口2菜品1',0),(40202,402,'四食堂窗口2菜品2',102.02,'四食堂窗口2菜品2',0),(40203,402,'四食堂窗口2菜品3',102.03,'四食堂窗口2菜品3',0),(40301,403,'四食堂窗口3菜品1',103.01,'四食堂窗口3菜品1',0),(40302,403,'四食堂窗口3菜品2',103.02,'四食堂窗口3菜品2',0),(40303,403,'四食堂窗口3菜品3',103.03,'四食堂窗口3菜品3',0),(40401,404,'四食堂窗口4菜品1',104.01,'四食堂窗口4菜品1',0),(40501,405,'四食堂窗口5菜品1',105.01,'四食堂窗口5菜品1',0),(50101,501,'五食堂窗口1菜品1',101.01,'五食堂窗口1菜品1',0),(50102,501,'五食堂窗口1菜品1',101.02,'五食堂窗口1菜品1',0),(50103,501,'五食堂窗口1菜品3',101.03,'五食堂窗口1菜品3',0),(50104,501,'五食堂窗口1菜品4',101.04,'五食堂窗口1菜品4',0),(50105,501,'五食堂窗口1菜品5',101.05,'五食堂窗口1菜品5',0),(50201,502,'五食堂窗口2菜品1',102.01,'五食堂窗口2菜品1',0),(50202,502,'五食堂窗口2菜品2',102.02,'五食堂窗口2菜品2',0),(50203,502,'五食堂窗口2菜品3',102.03,'五食堂窗口2菜品3',0),(50301,503,'五食堂窗口3菜品1',103.01,'五食堂窗口3菜品1',0),(50302,503,'五食堂窗口3菜品2',103.02,'五食堂窗口3菜品2',0),(50303,503,'五食堂窗口3菜品3',103.03,'五食堂窗口3菜品3',0),(50401,504,'五食堂窗口4菜品1',104.01,'五食堂窗口4菜品1',0),(50501,505,'五食堂窗口5菜品1',105.01,'五食堂窗口5菜品1',0),(60101,601,'六食堂窗口1菜品1',101.01,'六食堂窗口1菜品1',0),(60102,601,'六食堂窗口1菜品1',101.02,'六食堂窗口1菜品1',0),(60103,601,'六食堂窗口1菜品3',101.03,'六食堂窗口1菜品3',0),(60104,601,'六食堂窗口1菜品4',101.04,'六食堂窗口1菜品4',0),(60105,601,'六食堂窗口1菜品5',101.05,'六食堂窗口1菜品5',0),(60201,602,'六食堂窗口2菜品1',102.01,'六食堂窗口2菜品1',0),(60202,602,'六食堂窗口2菜品2',102.02,'六食堂窗口2菜品2',0),(60203,602,'六食堂窗口2菜品3',102.03,'六食堂窗口2菜品3',0),(60301,603,'六食堂窗口3菜品1',103.01,'六食堂窗口3菜品1',0),(60302,603,'六食堂窗口3菜品2',103.02,'六食堂窗口3菜品2',0),(60303,603,'六食堂窗口3菜品3',103.03,'六食堂窗口3菜品3',0),(60401,604,'六食堂窗口4菜品1',104.01,'六食堂窗口4菜品1',0),(60501,605,'六食堂窗口5菜品1',105.01,'六食堂窗口5菜品1',0);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`favorite_id`,`user_id`),
  KEY `fav_user_idx` (`user_id`),
  CONSTRAINT `fav_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (1,1),(101,101),(102,102),(10101,10101);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_canteen`
--

DROP TABLE IF EXISTS `favorite_canteen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_canteen` (
  `favorite_id` int(11) DEFAULT NULL,
  `canteen_id` int(11) DEFAULT NULL,
  `favorite_canteen_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`favorite_canteen_id`),
  KEY `fk_favorite_has_canteen_canteen1_idx` (`canteen_id`),
  KEY `fk_favorite_has_canteen_favorite1_idx` (`favorite_id`),
  CONSTRAINT `fk_favorite_has_canteen_canteen1` FOREIGN KEY (`canteen_id`) REFERENCES `canteen` (`canteen_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_has_canteen_favorite1` FOREIGN KEY (`favorite_id`) REFERENCES `favorite` (`favorite_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_canteen`
--

LOCK TABLES `favorite_canteen` WRITE;
/*!40000 ALTER TABLE `favorite_canteen` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_canteen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_dish`
--

DROP TABLE IF EXISTS `favorite_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_dish` (
  `dish_id` int(11) DEFAULT NULL,
  `favorite_id` int(11) DEFAULT NULL,
  `favorite_dish_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`favorite_dish_id`),
  KEY `fk_dish_has_favorite_favorite1_idx` (`favorite_id`),
  KEY `fk_dish_has_favorite_dish1_idx` (`dish_id`),
  CONSTRAINT `fk_dish_has_favorite_dish1` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_dish_has_favorite_favorite1` FOREIGN KEY (`favorite_id`) REFERENCES `favorite` (`favorite_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_dish`
--

LOCK TABLES `favorite_dish` WRITE;
/*!40000 ALTER TABLE `favorite_dish` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_window`
--

DROP TABLE IF EXISTS `favorite_window`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_window` (
  `window_id` int(11) DEFAULT NULL,
  `favorite_id` int(11) DEFAULT NULL,
  `favorite_window_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`favorite_window_id`),
  KEY `fk_window_has_favorite_favorite1_idx` (`favorite_id`),
  KEY `fk_window_has_favorite_window1_idx` (`window_id`),
  CONSTRAINT `fk_window_has_favorite_favorite1` FOREIGN KEY (`favorite_id`) REFERENCES `favorite` (`favorite_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_window_has_favorite_window1` FOREIGN KEY (`window_id`) REFERENCES `window` (`window_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_window`
--

LOCK TABLES `favorite_window` WRITE;
/*!40000 ALTER TABLE `favorite_window` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_window` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_item`
--

DROP TABLE IF EXISTS `history_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_item` (
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `dish_id` int(11) DEFAULT NULL,
  `history_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_item_id`),
  KEY `order_id_idx` (`order_id`),
  KEY `order_user_idx` (`user_id`),
  KEY `order_dish_idx` (`dish_id`),
  CONSTRAINT `order_dish` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `order_user_f` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_item`
--

LOCK TABLES `history_item` WRITE;
/*!40000 ALTER TABLE `history_item` DISABLE KEYS */;
INSERT INTO `history_item` VALUES (1,101,50102,3,1),(1,101,10103,4,1),(1,102,10104,5,1);
/*!40000 ALTER TABLE `history_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_start_time` datetime DEFAULT NULL COMMENT '开始下单时间',
  `order_end_time` datetime DEFAULT NULL COMMENT '结束下单时间',
  `order_type` varchar(10) DEFAULT NULL COMMENT '堂食/外卖',
  `order_arrive_time` datetime DEFAULT NULL COMMENT '送达时间/取餐时间',
  `order_address` varchar(20) DEFAULT NULL COMMENT '目的地址',
  `deliver_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `order_price` decimal(10,2) DEFAULT NULL,
  `order_pay_type` varchar(45) DEFAULT NULL COMMENT '支付宝/微信',
  `order_status` int(1) unsigned zerofill NOT NULL DEFAULT '0',
  `order_code` varchar(45) DEFAULT NULL,
  `order_user_tele` varchar(45) DEFAULT NULL,
  `order_driver_tele` varchar(45) DEFAULT NULL,
  `order_window_tele` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`order_id`),
  KEY `order_id_idx` (`order_id`),
  KEY `order_user_idx` (`user_id`),
  CONSTRAINT `order_deliver` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (101,'2020-06-17 13:27:11',NULL,'外卖',NULL,'HNU',101,1,202.05,'支付宝',0,'A9507','13714186980',NULL,NULL),(102,'2020-06-17 13:34:06',NULL,'堂食',NULL,'取餐地址:海南大学第一食堂',101,1,101.04,'微信',0,'A5637','13714186980',NULL,NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `permName` varchar(45) DEFAULT NULL,
  `permTag` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'进入用户端','ROLE_EUSER'),(2,'进入骑手端','ROLE_EDRIVER'),(3,'进入商家端','ROLE_EWINDOW'),(4,'进入管理员端','ROLE_EADMIN');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
INSERT INTO `persistent_logins` VALUES ('20181620310008','hxWJiXHgjjXIUX+1OGDcHQ==','qHQuZMVIA4UdrrCEV7aW2A==','2020-06-17 06:21:40'),('20181620310008','P6X83yPHhL4krgte/O61oA==','ucYAzbGI9Dk9Dt/bbbz6Sg==','2020-06-17 06:22:07');
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `roleName` varchar(45) DEFAULT NULL,
  `roleDesc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'普通用户','普通用户'),(2,'骑手','骑手'),(3,'商家','商家'),(4,'管理员','管理员');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `role_id` int(11) NOT NULL,
  `perm_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`perm_id`),
  KEY `role_id_idx` (`role_id`),
  KEY `permission_idx` (`perm_id`),
  CONSTRAINT `permission` FOREIGN KEY (`perm_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,1),(2,1),(2,2),(3,3),(4,1),(4,2),(4,4);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_student_num` varchar(14) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `user_gender` char(1) DEFAULT NULL,
  `user_balance` decimal(10,2) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `user_address_id` int(11) DEFAULT NULL,
  `user_tele_id` int(11) DEFAULT NULL,
  `user_income` decimal(10,2) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `accountNonExpired` int(5) DEFAULT NULL,
  `accountNonLocked` int(5) DEFAULT NULL,
  `enabled` int(5) DEFAULT NULL,
  `credentialsNonExpired` int(5) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10102 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'20181620310008','hmq','$2a$10$7U4OWCuu7GdhWCu/VKRzJOa6LBfCSO75h.UEzjYBKxXZ4SlG/cBVm','f',100.00,0,NULL,1,1,NULL,'20181620310008','$2a$10$7U4OWCuu7GdhWCu/VKRzJOa6LBfCSO75h.UEzjYBKxXZ4SlG/cBVm',1,1,1,1),(50,'2012839899001','管理员2','123','m',0.00,3,NULL,50,50,NULL,'2012839899001','123',0,0,0,0),(101,'2012839899003','快递员','1234','m',0.00,1,NULL,101,101,NULL,'2012839899003','1234',0,0,0,0),(102,'2012839899004','快递员','1234','m',0.00,1,NULL,102,102,NULL,'2012839899004','1234',0,0,0,0),(10101,NULL,'10101','123','m',0.00,2,NULL,10101,10101,NULL,NULL,'123',0,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `user_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_address` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_address_id`,`user_id`),
  KEY `user_add_idx` (`user_id`),
  CONSTRAINT `user_add` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1010103 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (101,'HNU',1),(5001,'home1',50),(5002,'home2',50),(10101,'address1',101),(10102,'address2',101),(10201,'address11',102),(10202,'address12',102),(1010101,'windowaddress11',10101),(1010102,'windowaddress12',10101);
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `b_idx` (`role_id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(50,4),(101,2),(102,2),(10101,3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tele`
--

DROP TABLE IF EXISTS `user_tele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tele` (
  `user_tele` varchar(15) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_tele_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_tele_id`,`user_id`),
  KEY `user_tele_idx` (`user_id`),
  CONSTRAINT `user_tele` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1010103 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tele`
--

LOCK TABLES `user_tele` WRITE;
/*!40000 ALTER TABLE `user_tele` DISABLE KEYS */;
INSERT INTO `user_tele` VALUES ('13714186980',1,101),('13714186201',50,5001),('13714186202',50,5002),('13714186291',101,10101),('13714186292',101,10102),('13714186281',102,10201),('13714186282',102,10202),('13714186271',10101,1010101),('13714186272',10101,1010102);
/*!40000 ALTER TABLE `user_tele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `window`
--

DROP TABLE IF EXISTS `window`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `window` (
  `window_id` int(11) NOT NULL,
  `window_name` varchar(45) DEFAULT NULL,
  `window_description` varchar(45) DEFAULT NULL,
  `canteen_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`window_id`),
  KEY `win_can_idx` (`canteen_id`),
  CONSTRAINT `win_can` FOREIGN KEY (`canteen_id`) REFERENCES `canteen` (`canteen_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `window`
--

LOCK TABLES `window` WRITE;
/*!40000 ALTER TABLE `window` DISABLE KEYS */;
INSERT INTO `window` VALUES (101,'一食堂窗口1','一食堂窗口1',1,1),(102,'一食堂窗口2','一食堂窗口2',1,1),(103,'一食堂窗口3','一食堂窗口3',1,1),(104,'一食堂窗口4','一食堂窗口4',1,1),(105,'一食堂窗口5','一食堂窗口5',1,1),(201,'二食堂窗口1','二食堂窗口1',2,1),(202,'二食堂窗口2','二食堂窗口2',2,1),(203,'二食堂窗口3','二食堂窗口3',2,1),(204,'二食堂窗口4','二食堂窗口4',2,1),(205,'二食堂窗口5','二食堂窗口5',2,1),(301,'三食堂窗口1','三食堂窗口1',3,1),(302,'三食堂窗口2','三食堂窗口2',3,1),(303,'三食堂窗口3','三食堂窗口3',3,1),(304,'三食堂窗口4','三食堂窗口4',3,1),(305,'三食堂窗口5','三食堂窗口5',3,1),(401,'四食堂窗口1','四食堂窗口1',4,1),(402,'四食堂窗口2','四食堂窗口2',4,1),(403,'四食堂窗口3','四食堂窗口3',4,1),(404,'四食堂窗口4','四食堂窗口4',4,1),(405,'四食堂窗口5','四食堂窗口5',4,1),(501,'五食堂窗口1','五食堂窗口1',5,1),(502,'五食堂窗口2','五食堂窗口2',5,1),(503,'五食堂窗口3','五食堂窗口3',5,1),(504,'五食堂窗口4','五食堂窗口4',5,1),(505,'五食堂窗口5','五食堂窗口5',5,1),(601,'六食堂窗口1','六食堂窗口1',6,1),(602,'六食堂窗口2','六食堂窗口2',6,1),(603,'六食堂窗口3','六食堂窗口3',6,1),(604,'六食堂窗口4','六食堂窗口4',6,1),(605,'六食堂窗口5','六食堂窗口5',6,1);
/*!40000 ALTER TABLE `window` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-17 14:38:13
