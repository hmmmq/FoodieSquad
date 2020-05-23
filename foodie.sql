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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2,NULL),(3,NULL),(4,NULL),(5,NULL),(6,NULL),(8,NULL),(9,NULL),(15,NULL),(16,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (2,30101,1,4),(2,50104,2,5),(3,10104,3,6),(4,30101,2,7),(5,20101,5,8),(5,40102,4,9),(6,10102,1,10),(6,40102,5,11),(8,10101,2,14),(8,30101,4,15),(9,0,0,16);
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
INSERT INTO `favorite` VALUES (10101,4),(10103,3),(10104,8),(10105,8),(20201,3),(30101,6),(30301,6),(40102,2),(40102,5),(40201,4),(50101,2),(50102,2),(50301,4),(60101,3),(60301,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_item`
--

LOCK TABLES `history_item` WRITE;
/*!40000 ALTER TABLE `history_item` DISABLE KEYS */;
INSERT INTO `history_item` VALUES (2,201,20105,4),(2,201,20104,5),(2,202,20103,6),(2,202,20102,7),(3,301,20101,8),(3,301,30105,9),(3,302,30104,10),(3,302,30103,11),(4,401,30102,12),(4,401,30101,13),(4,402,40105,14),(4,402,40106,15),(4,402,40107,16),(4,403,40108,17),(4,403,40106,18),(15,1501,30103,224),(15,1501,30104,225),(15,1502,20401,226),(16,1601,10102,227),(16,1602,10102,228),(16,1603,10102,229),(16,1604,10101,230),(16,1605,10103,231);
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
  `cart_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`,`user_id`,`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (201,'2020-05-08 09:00:00','2020-05-08 10:00:00','外卖','2020-05-08 10:00:00','10栋',4,2,23.00,'微信',2),(202,'2020-05-09 08:55:09','2020-05-09 08:58:17','外卖','2020-05-08 14:11:10','8栋',1,2,25.00,'支付宝',1),(301,'2020-05-08 10:00:00','2020-05-08 11:08:00','堂食','2020-05-08 11:08:00','9栋',4,3,24.00,'微信',3),(302,'2020-05-08 06:00:00','2020-05-08 07:00:00','堂食','2020-05-08 07:00:00','紫荆公寓2',2,3,20.00,'支付宝',3),(401,'2020-05-08 08:00:00','2020-05-08 09:00:00','堂食','2020-05-08 09:00:00','11栋',5,4,22.00,'支付宝',4),(402,'2020-05-08 07:00:00','2020-05-08 08:00:00','外卖','2020-05-08 08:00:00','14栋',3,4,21.00,'微信',4),(403,'2020-05-08 11:11:10','2020-05-08 14:11:10','外卖','2020-05-08 14:11:10','8栋',1,4,25.00,'支付宝',1),(1501,'2020-05-17 03:40:49','2020-05-17 03:40:55','堂食','2020-05-17 03:40:55','海南大学紫荆公寓2',4,15,202.07,'微信',15),(1502,'2020-05-17 03:42:00','2020-05-17 03:42:06','堂食','2020-05-17 03:42:06','海南大学紫荆公寓2',4,15,104.01,'微信',15),(1601,'2020-05-18 08:44:40','2020-05-18 08:45:04','堂食','2020-05-18 08:45:04','无',5,16,101.02,'支付宝',16),(1602,'2020-05-18 08:54:35','2020-05-18 08:54:39','堂食','2020-05-18 08:54:39','无',6,16,101.02,'微信',16),(1603,'2020-05-18 09:04:40','2020-05-18 09:04:43','堂食','2020-05-18 09:04:43','无',6,16,101.02,'',16),(1604,'2020-05-18 09:13:07','2020-05-18 09:13:13','堂食','2020-05-18 09:13:13','无',3,16,101.01,'',16),(1605,'2020-05-18 11:12:19','2020-05-18 11:12:23','堂食','2020-05-18 11:12:23','无',2,16,101.03,'微信',16);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'20181620310046','刘瑞哲','290018','m',100.00,0,2,NULL,NULL),(3,'20181620310070','付珂','049514','m',100.00,1,3,NULL,NULL),(4,'20181620310079','马潇逸','254612','m',100.00,0,4,NULL,NULL),(5,'20181620320001','Ashok','123456','m',100.00,0,5,NULL,NULL),(6,'20181620320002','Roona','123456','f',100.00,0,6,NULL,NULL),(8,'20181620310004','Abhijeet','123456','m',100.00,0,8,NULL,NULL),(9,'2018162031010','马冬梅','123456','m',100.00,0,9,NULL,NULL),(15,'20181620310008','黄美祺','1234567','f',100.00,0,15,NULL,NULL),(16,'','测试用户','123','f',100.00,0,16,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1602 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (13,'海南大学9栋',9),(201,'海南大学五号教学楼',2),(202,'海南大学第五食堂',2),(203,'海南大学东坡湖',2),(301,'海南大学三号教学楼',3),(401,'海南大学四号教学楼',4),(501,'海南大学北门',5),(601,'海南大学南门',6),(801,'海南大学第五食堂',8),(1501,'海南大学紫荆公寓2',15),(1601,'无',16);
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
) ENGINE=InnoDB AUTO_INCREMENT=1602 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tele`
--

LOCK TABLES `user_tele` WRITE;
/*!40000 ALTER TABLE `user_tele` DISABLE KEYS */;
INSERT INTO `user_tele` VALUES ('893002928',2,201),('930398301',2,202),('173839473',2,203),('987654331',2,204),('123456789',2,205),('193843839',3,301),('138392193',4,302),('930039021',4,303),('392020103',5,501),('102039393',5,502),('103983839',6,601),('193839493',6,602),('183738227',8,801),('173643828',8,901),('137273849',9,901),('13714186980',15,1501),('12',16,1601);
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

-- Dump completed on 2020-05-23 10:28:41
