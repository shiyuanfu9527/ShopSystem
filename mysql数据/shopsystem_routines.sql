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
-- Temporary view structure for view `v_admin`
--

DROP TABLE IF EXISTS `v_admin`;
/*!50001 DROP VIEW IF EXISTS `v_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_admin` AS SELECT 
 1 AS `username`,
 1 AS `password`,
 1 AS `email`,
 1 AS `level`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v-product`
--

DROP TABLE IF EXISTS `v-product`;
/*!50001 DROP VIEW IF EXISTS `v-product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v-product` AS SELECT 
 1 AS `v_id`,
 1 AS `v_pName`,
 1 AS `v_Desc`,
 1 AS `v_pNum`,
 1 AS `v_pubTime`,
 1 AS `v_pKeepTime`,
 1 AS `v_pImage`,
 1 AS `v_kId`,
 1 AS `v_iPrice`,
 1 AS `v_mPrice`,
 1 AS `v_isHot`,
 1 AS `v_isShow`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_orders`
--

DROP TABLE IF EXISTS `v_orders`;
/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_orders` AS SELECT 
 1 AS `id`,
 1 AS `cId`,
 1 AS `pId`,
 1 AS `pName`,
 1 AS `pImage`,
 1 AS `count`,
 1 AS `status`,
 1 AS `address`,
 1 AS `ordertime`,
 1 AS `delivdate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_customer`
--

DROP TABLE IF EXISTS `v_customer`;
/*!50001 DROP VIEW IF EXISTS `v_customer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_customer` AS SELECT 
 1 AS `id`,
 1 AS `kName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_kind`
--

DROP TABLE IF EXISTS `v_kind`;
/*!50001 DROP VIEW IF EXISTS `v_kind`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_kind` AS SELECT 
 1 AS `id`,
 1 AS `kName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_shopcart`
--

DROP TABLE IF EXISTS `v_shopcart`;
/*!50001 DROP VIEW IF EXISTS `v_shopcart`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_shopcart` AS SELECT 
 1 AS `id`,
 1 AS `cId`,
 1 AS `pId`,
 1 AS `pName`,
 1 AS `pImage`,
 1 AS `iPrice`,
 1 AS `count`,
 1 AS `isBuy`,
 1 AS `totalPrice`,
 1 AS `address`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_admin`
--

/*!50001 DROP VIEW IF EXISTS `v_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_admin` AS select `admin`.`username` AS `username`,`admin`.`password` AS `password`,`admin`.`email` AS `email`,`admin`.`level` AS `level` from `admin` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v-product`
--

/*!50001 DROP VIEW IF EXISTS `v-product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v-product` (`v_id`,`v_pName`,`v_Desc`,`v_pNum`,`v_pubTime`,`v_pKeepTime`,`v_pImage`,`v_kId`,`v_iPrice`,`v_mPrice`,`v_isHot`,`v_isShow`) AS select `product`.`id` AS `id`,`product`.`pName` AS `pName`,`product`.`pDesc` AS `pDesc`,`product`.`pNum` AS `pNum`,`product`.`pubTime` AS `pubTime`,`product`.`pKeepTime` AS `pKeepTime`,`product`.`pImage` AS `pImage`,`product`.`kId` AS `kId`,`product`.`iPrice` AS `iPrice`,`product`.`mPrice` AS `mPrice`,`product`.`isHot` AS `isHot`,`product`.`isShow` AS `isShow` from `product` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_orders`
--

/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orders` AS select `orders`.`id` AS `id`,`orders`.`cId` AS `cId`,`orders`.`pId` AS `pId`,`orders`.`pName` AS `pName`,`orders`.`pImage` AS `pImage`,`orders`.`count` AS `count`,`orders`.`status` AS `status`,`orders`.`address` AS `address`,`orders`.`ordertime` AS `ordertime`,`orders`.`delivdate` AS `delivdate` from `orders` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_customer`
--

/*!50001 DROP VIEW IF EXISTS `v_customer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_customer` AS select `kind`.`id` AS `id`,`kind`.`kName` AS `kName` from `kind` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_kind`
--

/*!50001 DROP VIEW IF EXISTS `v_kind`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_kind` AS select `kind`.`id` AS `id`,`kind`.`kName` AS `kName` from `kind` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_shopcart`
--

/*!50001 DROP VIEW IF EXISTS `v_shopcart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_shopcart` AS select `shopcart`.`id` AS `id`,`shopcart`.`cId` AS `cId`,`shopcart`.`pId` AS `pId`,`shopcart`.`pName` AS `pName`,`shopcart`.`pImage` AS `pImage`,`shopcart`.`iPrice` AS `iPrice`,`shopcart`.`count` AS `count`,`shopcart`.`isBuy` AS `isBuy`,`shopcart`.`totalPrice` AS `totalPrice`,`shopcart`.`address` AS `address` from `shopcart` */;
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

-- Dump completed on 2022-06-02 13:14:36
