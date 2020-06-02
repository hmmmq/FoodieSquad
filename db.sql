CREATE DATABASE  IF NOT EXISTS `foodie` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `foodie`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 47.100.40.220    Database: foodie
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(30) DEFAULT NULL,
  `admin_tele` varchar(30) DEFAULT NULL,
  `admin_pass` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'hmq','13714186980','123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`canteen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canteen`
--

LOCK TABLES `canteen` WRITE;
/*!40000 ALTER TABLE `canteen` DISABLE KEYS */;
INSERT INTO `canteen` VALUES (1,'海南大学第一食堂','66270001','海南大学'),(2,'海南大学第二食堂','66270002','海南大学'),(3,'海南大学第三食堂','66270003','海南大学'),(4,'海南大学第四食堂','66270004','海南大学'),(5,'海南大学第五食堂','66270005','海南大学'),(6,'海南大学第六食堂','66270006','海南大学');
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
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (14,NULL),(15,NULL),(16,NULL),(21,NULL),(22,NULL),(26,NULL),(27,NULL),(28,NULL),(29,NULL),(30,NULL),(31,NULL),(32,NULL),(33,NULL),(34,NULL);
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
  PRIMARY KEY (`cart_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (14,10103,1,68),(14,10104,1,69),(28,10102,1,104),(28,10302,1,105),(28,10401,1,106),(26,10102,1,141);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliver`
--

DROP TABLE IF EXISTS `deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliver` (
  `deliver_id` int(11) NOT NULL,
  `deliver_name` varchar(30) DEFAULT NULL,
  `deliver_tele` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`deliver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliver`
--

LOCK TABLES `deliver` WRITE;
/*!40000 ALTER TABLE `deliver` DISABLE KEYS */;
INSERT INTO `deliver` VALUES (1,'张三','123456900'),(2,'李四','97973874868'),(3,'王五','93083028497'),(4,'二麻子','0283972488'),(5,'李铁柱','23897497263'),(6,'王小明','23842382937'),(7,'马冬梅','55789090');
/*!40000 ALTER TABLE `deliver` ENABLE KEYS */;
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
  PRIMARY KEY (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (10101,101,'一食堂窗口1菜品1',101.01,'一食堂窗口1菜品1'),(10102,101,'一食堂窗口1菜品2',101.02,'一食堂窗口1菜品2'),(10103,101,'一食堂窗口1菜品3',101.03,'一食堂窗口1菜品3'),(10104,101,'一食堂窗口1菜品4',101.04,'一食堂窗口1菜品4'),(10105,101,'一食堂窗口1菜品5',101.05,'一食堂窗口1菜品5'),(10201,102,'一食堂窗口2菜品1',102.01,'一食堂窗口2菜品1'),(10202,102,'一食堂窗口2菜品2',102.02,'一食堂窗口2菜品2'),(10203,102,'一食堂窗口2菜品3',102.03,'一食堂窗口2菜品3'),(10301,103,'一食堂窗口3菜品1',103.01,'一食堂窗口3菜品1'),(10302,103,'一食堂窗口3菜品2',103.02,'一食堂窗口3菜品2'),(10303,103,'一食堂窗口3菜品3',103.03,'一食堂窗口3菜品3'),(10401,104,'一食堂窗口4菜品1',104.01,'一食堂窗口4菜品1'),(10501,105,'一食堂窗口5菜品1',105.01,'一食堂窗口5菜品1'),(20101,201,'二食堂窗口1菜品1',101.01,'二食堂窗口1菜品1'),(20102,201,'二食堂窗口1菜品1',101.02,'二食堂窗口1菜品1'),(20103,201,'二食堂窗口1菜品3',101.03,'二食堂窗口1菜品3'),(20104,201,'二食堂窗口1菜品4',101.04,'二食堂窗口1菜品4'),(20105,201,'二食堂窗口1菜品5',101.05,'二食堂窗口1菜品5'),(20201,202,'二食堂窗口2菜品1',102.01,'二食堂窗口2菜品1'),(20202,202,'二食堂窗口2菜品2',102.02,'二食堂窗口2菜品2'),(20203,202,'二食堂窗口2菜品3',102.03,'二食堂窗口2菜品3'),(20301,203,'二食堂窗口3菜品1',103.01,'二食堂窗口3菜品1'),(20302,203,'二食堂窗口3菜品2',103.02,'二食堂窗口3菜品2'),(20303,203,'二食堂窗口3菜品3',103.03,'二食堂窗口3菜品3'),(20401,204,'二食堂窗口4菜品1',104.01,'二食堂窗口4菜品1'),(20501,205,'二食堂窗口5菜品1',105.01,'二食堂窗口5菜品1'),(30101,301,'三食堂窗口1菜品1',101.01,'三食堂窗口1菜品1'),(30102,301,'三食堂窗口1菜品1',101.02,'三食堂窗口1菜品1'),(30103,301,'三食堂窗口1菜品3',101.03,'三食堂窗口1菜品3'),(30104,301,'三食堂窗口1菜品4',101.04,'三食堂窗口1菜品4'),(30105,301,'三食堂窗口1菜品5',101.05,'三食堂窗口1菜品5'),(30201,302,'三食堂窗口2菜品1',102.01,'三食堂窗口2菜品1'),(30202,302,'三食堂窗口2菜品2',102.02,'三食堂窗口2菜品2'),(30203,302,'三食堂窗口2菜品3',102.03,'三食堂窗口2菜品3'),(30301,303,'三食堂窗口3菜品1',103.01,'三食堂窗口3菜品1'),(30302,303,'三食堂窗口3菜品2',103.02,'三食堂窗口3菜品2'),(30303,303,'三食堂窗口3菜品3',103.03,'三食堂窗口3菜品3'),(30401,304,'三食堂窗口4菜品1',104.01,'三食堂窗口4菜品1'),(30501,305,'三食堂窗口5菜品1',105.01,'三食堂窗口5菜品1'),(40101,401,'四食堂窗口1菜品1',101.01,'四食堂窗口1菜品1'),(40102,401,'四食堂窗口1菜品1',101.02,'四食堂窗口1菜品1'),(40103,401,'四食堂窗口1菜品3',101.03,'四食堂窗口1菜品3'),(40104,401,'四食堂窗口1菜品4',101.04,'四食堂窗口1菜品4'),(40105,401,'四食堂窗口1菜品5',101.05,'四食堂窗口1菜品5'),(40201,402,'四食堂窗口2菜品1',102.01,'四食堂窗口2菜品1'),(40202,402,'四食堂窗口2菜品2',102.02,'四食堂窗口2菜品2'),(40203,402,'四食堂窗口2菜品3',102.03,'四食堂窗口2菜品3'),(40301,403,'四食堂窗口3菜品1',103.01,'四食堂窗口3菜品1'),(40302,403,'四食堂窗口3菜品2',103.02,'四食堂窗口3菜品2'),(40303,403,'四食堂窗口3菜品3',103.03,'四食堂窗口3菜品3'),(40401,404,'四食堂窗口4菜品1',104.01,'四食堂窗口4菜品1'),(40501,405,'四食堂窗口5菜品1',105.01,'四食堂窗口5菜品1'),(50101,501,'五食堂窗口1菜品1',101.01,'五食堂窗口1菜品1'),(50102,501,'五食堂窗口1菜品1',101.02,'五食堂窗口1菜品1'),(50103,501,'五食堂窗口1菜品3',101.03,'五食堂窗口1菜品3'),(50104,501,'五食堂窗口1菜品4',101.04,'五食堂窗口1菜品4'),(50105,501,'五食堂窗口1菜品5',101.05,'五食堂窗口1菜品5'),(50201,502,'五食堂窗口2菜品1',102.01,'五食堂窗口2菜品1'),(50202,502,'五食堂窗口2菜品2',102.02,'五食堂窗口2菜品2'),(50203,502,'五食堂窗口2菜品3',102.03,'五食堂窗口2菜品3'),(50301,503,'五食堂窗口3菜品1',103.01,'五食堂窗口3菜品1'),(50302,503,'五食堂窗口3菜品2',103.02,'五食堂窗口3菜品2'),(50303,503,'五食堂窗口3菜品3',103.03,'五食堂窗口3菜品3'),(50401,504,'五食堂窗口4菜品1',104.01,'五食堂窗口4菜品1'),(50501,505,'五食堂窗口5菜品1',105.01,'五食堂窗口5菜品1'),(60101,601,'六食堂窗口1菜品1',101.01,'六食堂窗口1菜品1'),(60102,601,'六食堂窗口1菜品1',101.02,'六食堂窗口1菜品1'),(60103,601,'六食堂窗口1菜品3',101.03,'六食堂窗口1菜品3'),(60104,601,'六食堂窗口1菜品4',101.04,'六食堂窗口1菜品4'),(60105,601,'六食堂窗口1菜品5',101.05,'六食堂窗口1菜品5'),(60201,602,'六食堂窗口2菜品1',102.01,'六食堂窗口2菜品1'),(60202,602,'六食堂窗口2菜品2',102.02,'六食堂窗口2菜品2'),(60203,602,'六食堂窗口2菜品3',102.03,'六食堂窗口2菜品3'),(60301,603,'六食堂窗口3菜品1',103.01,'六食堂窗口3菜品1'),(60302,603,'六食堂窗口3菜品2',103.02,'六食堂窗口3菜品2'),(60303,603,'六食堂窗口3菜品3',103.03,'六食堂窗口3菜品3'),(60401,604,'六食堂窗口4菜品1',104.01,'六食堂窗口4菜品1'),(60501,605,'六食堂窗口5菜品1',105.01,'六食堂窗口5菜品1');
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
  PRIMARY KEY (`favorite_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
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
  PRIMARY KEY (`history_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_item`
--

LOCK TABLES `history_item` WRITE;
/*!40000 ALTER TABLE `history_item` DISABLE KEYS */;
INSERT INTO `history_item` VALUES (14,1401,10103,29),(14,1401,10104,30),(15,1501,10101,31),(15,1501,10102,32),(16,1601,10101,38),(16,1601,10102,39),(16,1601,10103,40),(16,1602,60101,41),(16,1602,60103,42),(16,1602,60301,43),(16,1604,20104,44),(16,1604,10301,45),(16,1604,10302,46),(21,2101,10101,47),(21,2101,10102,48),(22,2201,10101,49),(22,2201,10102,50),(26,2601,10201,53),(26,2601,10202,54),(16,1605,40101,55),(16,1605,40102,56),(16,1605,40103,57),(16,1605,40104,58),(26,2602,10102,59),(26,2603,10104,60),(22,2202,10101,61),(22,2202,10102,62),(28,2801,10102,63),(28,2801,10302,64),(28,2801,10401,65),(33,3301,10101,66),(33,3301,10102,67),(33,3301,10103,68),(33,3301,10104,69),(33,3301,10105,70),(26,2604,10101,71),(22,2203,10102,72),(22,2203,10103,73),(22,2204,10101,74),(22,2204,10102,75),(33,3304,10101,76),(33,3304,10102,77),(33,3304,10103,78),(33,3304,10104,79),(33,3304,10105,80),(33,3304,10101,81),(33,3304,10102,82),(33,3304,10103,83),(33,3304,10101,84),(33,3304,10102,85),(33,3304,10103,86),(33,3304,10104,87),(33,3305,60104,88),(16,1606,10101,89),(26,2605,10102,90),(26,2606,10103,91),(26,2607,10103,92),(26,2608,10103,93),(26,2608,10302,94),(26,2608,10103,95),(26,2608,10103,96),(26,2609,10102,97),(33,3310,30401,98),(33,3310,30401,99),(33,3310,10101,100),(33,3310,10102,101),(33,3310,10102,102),(33,3310,10102,103);
/*!40000 ALTER TABLE `history_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `mId` int(11) NOT NULL,
  `mName` varchar(20) DEFAULT NULL,
  `mPirce` double DEFAULT NULL,
  `mDescription` varchar(20) DEFAULT NULL,
  `mType` varchar(10) DEFAULT NULL,
  `mPicture` blob,
  `cId` int(11) DEFAULT NULL,
  PRIMARY KEY (`mId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (500101,'澳洲肥牛',5,'澳洲肥牛','','',5001),(500102,'娃娃菜',3,'娃娃菜','','',5001),(500103,'土豆片',3,'土豆片','','',5001),(500201,'辣子鸡',7,'辣子鸡','','',5002),(500202,'回锅肉',7,'回锅肉','','',5002),(500301,'鱼粉',15,'鱼粉','','',5003),(500401,'口水鸭',7,'口水鸭','','',5004),(500402,'宫保鸡丁',6,'宫保鸡丁','','',5004),(500403,'招牌酱鸭',6,'招牌酱鸭','','',5004),(500404,'麻婆豆腐',4,'麻婆豆腐','','',5004),(500501,'肉包',2.5,'肉包','','',5005),(500502,'菜包',1.5,'肉包','','',5005),(500503,'开花馒头',2,'开花馒头','','',5005),(500504,'重庆小面',13,'重庆小面','','',5005),(500601,'万宁后安粉',10,'万宁后安粉','','',5006),(500602,'炒面',7,'炒面','','',5006),(500603,'腊肉炒饭',10,'腊肉炒饭','','',5006),(500701,'千层饼',5,'千层饼','','',5007),(500702,'银耳汤',6,'银耳汤','','',5007),(500801,'咖喱鸡排饭',3,'土豆片','','',5008),(500802,'咖喱猪排饭',3,'土豆片','','',5008),(500803,'黑椒牛排饭',3,'土豆片','','',5008);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
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
  `cart_id` int(11) NOT NULL,
  `order_status` int(1) unsigned zerofill NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`cart_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1401,'2020-05-18 12:09:51','2020-05-18 12:09:55','堂食','2020-05-18 12:09:55','黄美祺的心',4,14,202.07,'微信',14,1),(1402,'2020-05-18 12:10:08','2020-06-01 23:42:42','堂食','2020-06-01 23:42:42','黄美祺的心',6,14,202.07,NULL,14,1),(1501,'2020-05-18 13:01:28','2020-05-18 13:01:41','堂食','2020-05-18 13:01:41','海口',6,15,303.04,'微信',15,1),(1601,'2020-05-18 15:27:46','2020-05-18 15:27:54','堂食','2020-05-18 15:27:54','1',1,16,606.12,'',16,1),(1602,'2020-05-18 15:29:06','2020-05-18 15:29:11','堂食','2020-05-18 15:29:11','1',4,16,610.08,'支付宝',16,1),(1603,'2020-05-18 15:30:15','2020-06-01 23:44:03','外卖','2020-06-01 23:44:03','1',4,16,303.12,NULL,16,1),(1604,'2020-05-18 15:31:41','2020-05-18 15:31:45','','2020-05-18 15:31:45','1',4,16,1024.24,'支付宝',16,1),(1605,'2020-05-18 17:16:29','2020-05-18 17:16:34','堂食','2020-05-18 17:16:34','1',7,16,404.10,'支付宝',16,1),(1606,'2020-05-31 11:06:06','2020-05-31 11:06:09','堂食','2020-05-31 11:06:09','1',6,16,101.01,'',16,1),(2101,'2020-05-18 16:24:34','2020-05-18 16:24:37','外卖','2020-05-18 16:24:37','10',3,21,202.03,'支付宝',21,1),(2201,'2020-05-18 16:36:15','2020-05-18 16:36:17','','2020-05-18 16:36:17','10',2,22,202.03,'支付宝',22,1),(2202,'2020-05-21 13:44:37','2020-05-21 13:44:41','','2020-05-21 13:44:41','10',4,22,202.03,'支付宝',22,1),(2203,'2020-05-23 00:56:07','2020-05-23 00:56:18','堂食','2020-05-23 00:56:18','10',6,22,202.05,'支付宝',22,1),(2204,'2020-05-23 10:24:27','2020-05-23 10:24:47','堂食','2020-05-23 10:24:47','10',2,22,202.03,'支付宝',22,1),(2601,'2020-05-18 16:58:32','2020-05-18 16:58:37','堂食','2020-05-18 16:58:37','',5,26,204.03,'微信',26,1),(2602,'2020-05-21 10:32:33','2020-05-21 10:32:56','堂食','2020-05-21 10:32:56','',3,26,101.02,'支付宝',26,1),(2603,'2020-05-21 11:02:18','2020-05-21 11:02:22','','2020-05-21 11:02:22','',3,26,101.04,'支付宝',26,1),(2604,'2020-05-22 13:12:12','2020-05-22 13:12:20','堂食','2020-05-22 13:12:20','',3,26,101.01,'微信',26,1),(2605,'2020-06-01 21:29:32','2020-06-01 21:29:43','堂食','2020-06-01 21:29:43','',6,26,101.02,'支付宝',26,1),(2606,'2020-06-01 21:30:16','2020-06-01 21:30:24','堂食','2020-06-01 21:30:24','',1,26,101.03,'支付宝',26,1),(2607,'2020-06-01 21:30:43','2020-06-01 21:31:08','堂食','2020-06-01 21:31:08','',2,26,101.03,'微信',26,1),(2608,'2020-06-01 21:40:12','2020-06-01 21:40:21','堂食','2020-06-01 21:40:21','',3,26,406.11,'支付宝',26,0),(2609,'2020-06-01 22:52:07','2020-06-01 22:52:11','堂食','2020-06-01 22:52:11','',2,26,101.02,'支付宝',26,0),(2610,'2020-06-01 22:58:31','2020-06-01 23:47:17','堂食','2020-06-01 23:47:17','',7,26,101.02,NULL,26,1),(2801,'2020-05-21 22:36:21','2020-05-21 22:36:41','堂食','2020-05-21 22:36:41','十栋',6,28,308.05,'支付宝',28,1),(2802,'2020-05-21 22:36:46','2020-06-01 23:46:01','堂食','2020-06-01 23:46:01','十栋',1,28,308.05,NULL,28,1),(3301,'2020-05-21 23:27:51','2020-05-21 23:28:02','堂食','2020-05-21 23:28:02','紫荆公寓二期',1,33,505.15,'微信',33,1),(3302,'2020-05-21 23:28:18','2020-06-01 23:46:20','堂食','2020-06-01 23:46:20','紫荆公寓二期',5,33,505.15,NULL,33,1),(3303,'2020-05-22 21:24:34','2020-06-01 23:46:27','堂食','2020-06-01 23:46:27','紫荆公寓二期',4,33,808.21,NULL,33,1),(3304,'2020-05-25 12:50:02','2020-05-25 12:50:09','堂食','2020-05-25 12:50:09','紫荆公寓二期',4,33,1717.49,'',33,1),(3305,'2020-05-25 13:11:02','2020-06-01 23:46:37','外卖','2020-06-01 23:46:37','紫荆公寓二期',4,33,404.16,'支付宝',33,1),(3306,'2020-05-31 14:52:30','2020-06-01 23:46:44','外卖','2020-06-01 23:46:44','紫荆公寓二期',4,33,520.05,NULL,33,1),(3307,'2020-05-31 14:52:44','2020-06-01 23:46:50','外卖','2020-06-01 23:46:50','紫荆公寓二期',2,33,1040.10,NULL,33,1),(3308,'2020-06-02 15:27:30',NULL,'堂食',NULL,'紫荆公寓二期',6,33,1242.13,NULL,33,0),(3309,'2020-06-02 15:33:40',NULL,'堂食',NULL,'紫荆公寓二期',3,33,1545.19,NULL,33,0),(3310,'2020-06-02 15:45:09','2020-06-02 15:45:12','堂食','2020-06-02 15:45:12','紫荆公寓二期',5,33,1848.25,'',33,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
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
  `user_password` varchar(20) DEFAULT NULL,
  `user_gender` char(1) DEFAULT NULL,
  `user_balance` decimal(10,2) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `user_address_id` int(11) DEFAULT NULL,
  `user_tele_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (14,'20182783310020','黄美祺的老公','990901','m',100.00,0,14,NULL,NULL),(15,'2064649197','delucis','123123','m',100.00,0,15,NULL,NULL),(16,'20181620310046','az','LS201314','m',100.00,0,16,NULL,NULL),(21,'123','ych','123','m',100.00,0,21,NULL,NULL),(22,'123','fk','123','m',100.00,0,22,NULL,NULL),(26,'','黄美祺','1','f',100.00,0,26,NULL,NULL),(27,'123','王','123456','m',100.00,0,27,NULL,NULL),(28,'20181620310010','大头','024220','m',100.00,0,28,NULL,NULL),(29,'20181620310094','w7799456','20000501',NULL,100.00,0,29,NULL,NULL),(30,'20186807310018','visions','ma200002040912','m',100.00,0,30,NULL,NULL),(31,'20181685310195','小可爱','ZOUQINGHUA','m',100.00,0,31,NULL,NULL),(32,'20181620310115','Loving','123456','m',100.00,0,32,NULL,NULL),(33,'20181620310068','陈中','123456','f',100.00,0,33,NULL,NULL),(34,'20191621320012','gua','guaguagua','m',100.00,0,34,NULL,NULL);
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
  PRIMARY KEY (`user_address_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3702 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (1401,'黄美祺的心',14),(1501,'海口',15),(1601,'1',16),(2101,'10',21),(2201,'10',22),(2601,'',26),(2701,'321',27),(2801,'十栋',28),(2901,'十栋454',29),(3001,'海南大学19栋宿舍楼',30),(3101,'14栋332',31),(3201,'10#518',32),(3301,'紫荆公寓二期',33),(3401,'海南大學11棟宿舍樓',34);
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
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
  PRIMARY KEY (`user_tele_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3702 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tele`
--

LOCK TABLES `user_tele` WRITE;
/*!40000 ALTER TABLE `user_tele` DISABLE KEYS */;
INSERT INTO `user_tele` VALUES ('15811808031',14,1401),('15289844696',15,1501),('13118989517',16,1601),('17674754730',21,2101),('18253738936',22,2201),('13714186980',26,2601),('17689663769',27,2701),('17776604879',28,2801),('17645140054',29,2901),('15898809760',30,3001),('17330904770',31,3101),('17733102781',32,3201),('17330921125',33,3301),('15116732605',34,3401);
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
  PRIMARY KEY (`window_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `window`
--

LOCK TABLES `window` WRITE;
/*!40000 ALTER TABLE `window` DISABLE KEYS */;
INSERT INTO `window` VALUES (101,'一食堂窗口1','一食堂窗口1',1),(102,'一食堂窗口2','一食堂窗口2',1),(103,'一食堂窗口3','一食堂窗口3',1),(104,'一食堂窗口4','一食堂窗口4',1),(105,'一食堂窗口5','一食堂窗口5',1),(201,'二食堂窗口1','二食堂窗口1',2),(202,'二食堂窗口2','二食堂窗口2',2),(203,'二食堂窗口3','二食堂窗口3',2),(204,'二食堂窗口4','二食堂窗口4',2),(205,'二食堂窗口5','二食堂窗口5',2),(301,'三食堂窗口1','三食堂窗口1',3),(302,'三食堂窗口2','三食堂窗口2',3),(303,'三食堂窗口3','三食堂窗口3',3),(304,'三食堂窗口4','三食堂窗口4',3),(305,'三食堂窗口5','三食堂窗口5',3),(401,'四食堂窗口1','四食堂窗口1',4),(402,'四食堂窗口2','四食堂窗口2',4),(403,'四食堂窗口3','四食堂窗口3',4),(404,'四食堂窗口4','四食堂窗口4',4),(405,'四食堂窗口5','四食堂窗口5',4),(501,'五食堂窗口1','五食堂窗口1',5),(502,'五食堂窗口2','五食堂窗口2',5),(503,'五食堂窗口3','五食堂窗口3',5),(504,'五食堂窗口4','五食堂窗口4',5),(505,'五食堂窗口5','五食堂窗口5',5),(601,'六食堂窗口1','六食堂窗口1',6),(602,'六食堂窗口2','六食堂窗口2',6),(603,'六食堂窗口3','六食堂窗口3',6),(604,'六食堂窗口4','六食堂窗口4',6),(605,'六食堂窗口5','六食堂窗口5',6);
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

-- Dump completed on 2020-06-02 16:46:29
