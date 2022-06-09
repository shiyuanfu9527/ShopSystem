-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopsystem
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pName` varchar(64) DEFAULT NULL,
  `pDesc` text,
  `pNum` int DEFAULT NULL,
  `pubTime` date DEFAULT NULL,
  `pKeepTime` int DEFAULT NULL,
  `pImage` varchar(255) DEFAULT NULL,
  `kId` int NOT NULL,
  `iPrice` decimal(7,2) DEFAULT NULL,
  `mPrice` decimal(7,2) DEFAULT NULL,
  `isHot` enum('是','否') NOT NULL DEFAULT '否',
  `isShow` enum('是','否') NOT NULL DEFAULT '否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pName` (`pName`),
  KEY `fk_kid` (`kId`),
  CONSTRAINT `fk_kid` FOREIGN KEY (`kId`) REFERENCES `kind` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000065 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1000044,'电脑','ddddd',1000,'2021-12-03',10,'img/dn2.jpg',2,4999.00,6999.00,'否','否'),(1000047,'毛衣','test',1000,'2021-12-04',10,'img/cs10004.jpg',4,50.00,80.00,'否','否'),(1000048,'电脑2','diannao',1000,'2021-12-10',360,'img/dn1.jpg',2,4999.00,6999.00,'否','否'),(1000050,'毛衣2','dasd',1000,'2021-12-12',10,'img/cs10001.jpg',4,50.00,80.00,'否','否'),(1000051,'华为p50','华为p50',1000,'2021-12-13',360,'img/vmall-p50-3.jpg',1,6488.00,7488.00,'是','是'),(1000052,'华为nova8 se','6.5英寸Oled大屏',1000,'2021-12-13',360,'img/huaweinoba8se.png',1,2099.00,2500.00,'否','是'),(1000053,'华为nova9pro','华为',1000,'2021-12-13',360,'img/huaweinova9pro.png',1,3499.00,4999.00,'否','是'),(1000054,'WATCH GT 3','智能手表',1000,'2021-12-13',360,'img/watchgt3.png',1,1588.00,1999.00,'否','是'),(1000055,'WATCH GT Runner','智能手表',1000,'2021-12-13',360,'img/watchgtrunner.png',1,2188.00,2400.00,'否','是'),(1000056,'MatePad Pro 10.8','平板电脑',1000,'2021-12-13',360,'img/matepad pro.png',2,4799.00,4999.00,'否','是'),(1000057,'戴尔笔记本灵越15plus','15.6英寸轻薄全能本设计师',1000,'2021-12-13',360,'img/daier.jpg',2,9499.00,9599.00,'否','是'),(1000058,'联想ThinkBook 14 2021款','联想笔记本',1000,'2021-12-12',360,'img/think.jpg',2,5399.00,5499.00,'否','是'),(1000059,'精品毛衣','毛衣啊',1000,'2021-12-13',7,'img/cs10007.jpg',4,25.00,55.00,'否','是'),(1000060,'联想thinkbook14','gogo',1000,'2021-12-13',360,'img/think1.jpg',2,7299.00,8299.00,'是','否'),(1000061,'yifu','gogo',1000,'2021-12-13',360,'img/yifu.jpg',4,376.00,489.00,'是','是'),(1000062,'成长启蒙','学前600字',1000,'2021-12-13',7,'img/book.jpg',3,10.00,20.00,'否','是'),(1000063,'葡萄酒圣经','50周年珍藏版',1000,'2021-12-13',7,'img/book1.jpg',3,398.00,528.00,'是','是'),(1000064,'精品男装','男装',100,'2021-12-20',7,'img/90560009093007_y.jpg',4,50.00,80.00,'否','否');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-02 13:14:35
