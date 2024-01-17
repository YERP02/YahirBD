-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: registro
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) DEFAULT NULL,
  `Correo` varchar(130) DEFAULT NULL,
  `Contrasena` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'YAHIR Admin','yahiremanuelramirezpulido@gmail.com','Yahir1234');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER bitacora_insert_administrador
AFTER INSERT ON administrador
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_administrador (fecha, sentencia, contrasentencia) VALUES (
        NOW(),
        CONCAT('INSERT INTO administrador (id,Username, Correo, Contrasena) VALUES 
        (', NEW.id, ', ''', NEW.Username, ''',''', NEW.Correo, ''', ''', NEW.Contrasena, ''')'),
        CONCAT('DELETE FROM administrador WHERE id = ', NEW.id)
    );
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER bitacora_update_administrador
BEFORE UPDATE ON administrador
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_administrador (fecha, sentencia, contrasentencia) VALUES (
        NOW(),
        CONCAT('UPDATE administrador SET 
                Username = ''', NEW.Username, ''',
                Correo = ''', NEW.Correo, ''',
                Contrasena = ''', NEW.Contrasena, '''
                WHERE id = ', NEW.id),
        CONCAT('Registro actualizado en la tabla administrador. Valores antiguos: 
                Username: ', OLD.Username, ',Correo: ', OLD.Correo, ', Contrasena: ', OLD.Contrasena)
    );
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER bitacora_delete_administrador
AFTER DELETE ON administrador
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_administrador (fecha, sentencia, contrasentencia) VALUES (
        NOW(),
        CONCAT('DELETE FROM administrador WHERE id = ', OLD.id),
        NULL
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bitacora_administrador`
--

DROP TABLE IF EXISTS `bitacora_administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora_administrador` (
  `id` bigint(40) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `sentencia` varchar(300) DEFAULT NULL,
  `contrasentencia` varchar(280) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_administrador`
--

LOCK TABLES `bitacora_administrador` WRITE;
/*!40000 ALTER TABLE `bitacora_administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora_administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_productos`
--

DROP TABLE IF EXISTS `bitacora_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora_productos` (
  `id` bigint(60) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sentencia` varchar(280) DEFAULT NULL,
  `contrasentencia` varchar(280) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_productos`
--

LOCK TABLES `bitacora_productos` WRITE;
/*!40000 ALTER TABLE `bitacora_productos` DISABLE KEYS */;
INSERT INTO `bitacora_productos` VALUES (69,'2023-11-28 06:00:00',NULL,'DELETE FROM producto WHERE id = 69'),(76,'2023-11-27 06:00:00','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, detalles) VALUES \n        (76, \'Superstar\', \'37,38\', \'A',NULL),(77,'2023-11-27 06:00:00','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, detalles) VALUES \r\n        (77, \'Superstar\', \'37,38\', \'A',NULL),(78,'2023-11-28 06:00:00','DELETE FROM producto WHERE id = 78',NULL),(79,'2023-11-28 06:00:00','DELETE FROM producto WHERE id = 77',NULL),(80,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5\',\r\n                ',NULL),(81,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5\',\r\n                ',NULL),(82,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5\',\r\n                ',NULL),(83,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'Puma Caven 2.0\',\r\n                tallas = \'36,36.5\',\r\n                M',NULL),(84,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'Superstar\',\r\n                tallas = \'37,38\',\r\n                Marca = ',NULL),(85,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'Puma Caven 2.0\',\r\n                tallas = \'36,36.5\',\r\n                M',NULL),(86,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'Superstar\',\r\n                tallas = \'37,38\',\r\n                Marca = ',NULL),(87,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'Puma Caven 2.0\',\r\n                tallas = \'36,36.5\',\r\n                M',NULL),(88,'2023-11-28 06:00:00','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, detalles) VALUES \r\n        (79, \'Jordan Stadium 90\', \'32',NULL),(89,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'Jordan Stadium 90\',\r\n                tallas = \'32,35,36\',\r\n             ',NULL),(90,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'Jordan Stadium 90\',\r\n                tallas = \'32,35,36\',\r\n             ',NULL),(91,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'Jordan Stadium 90\',\r\n                tallas = \'32,35,36\',\r\n             ',NULL),(92,'2023-11-28 06:00:00','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, detalles) VALUES \r\n        (80, \'Jordan CMFT\', \'29,30\', ',NULL),(93,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'Jordan CMFT\',\r\n                tallas = \'29,30\',\r\n                Marca ',NULL),(94,'2023-11-28 06:00:00','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, detalles) VALUES \r\n        (81, \'Midcity Low\', \'27,27.5,',NULL),(95,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'Midcity Low\',\r\n                tallas = \'27,27.5,28\',\r\n                M',NULL),(96,'2023-11-28 06:00:00','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, detalles) VALUES \r\n        (82, \'Fila Velado 2\', \'26,27\'',NULL),(97,'2023-11-28 06:00:00','UPDATE producto SET \r\n                nombre = \'Fila Velado 2\',\r\n                tallas = \'26,27\',\r\n                Marc',NULL),(98,'2023-11-28 06:00:00','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, detalles) VALUES \r\n        (83, \'Dunk Low\', \'25,26\', \'NI',NULL),(99,'2023-12-05 00:34:19','UPDATE producto SET \n                nombre = \'Dunk Low\',\n                tallas = \'25,26\',\n                Marca = \'',NULL),(100,'2023-12-02 05:35:08','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, detalles) VALUES \r\n        (84, \'\', \'\', \'\', 0, \'\', \'\')',NULL),(101,'2023-12-02 05:35:12','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, detalles) VALUES \r\n        (85, \'\', \'\', \'\', 0, \'\', \'\')',NULL),(102,'2023-12-02 05:46:56','DELETE FROM producto WHERE id = 85',NULL),(103,'2023-12-02 05:46:58','DELETE FROM producto WHERE id = 84',NULL),(104,'2023-12-05 00:30:56','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37\',\r\n             ',NULL),(105,'2023-12-05 00:43:35','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro\',\r\n                detalles = \'tenis altos 650R de New Balance x Aimé L',NULL),(106,'2023-12-05 00:44:49','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                detalles = \'tenis altos 650R de New Balance ',NULL),(107,'2023-12-05 00:46:40','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                detalles = \'tenis altos 650R de New Balance ',NULL),(108,'2023-12-05 00:48:29','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                detalles = \'tenis altos 650R de New Balance ',NULL),(109,'2023-12-05 00:54:59','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                detalles = \'tenis altos 650R de New Balance ',NULL),(110,'2023-12-05 00:58:48','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                detalles = \'tenis altos 650R de New Balance x A',NULL),(111,'2023-12-05 00:59:25','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro\',\r\n                detalles = \'tenis altos 650R de New Balance x Aim',NULL),(112,'2023-12-05 01:05:32','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                URLImagen = \'\".Fotos para CssBalance 650.jpg','Registro actualizado en la tabla producto. Valores antiguos: \r\n                Nombre: New Balance 650, Tallas: 36,36.5,37, Marca: New Balance,\r\n                Precio: 3599, Color: Negro, URLImagen: \".Fotos para CssBalance 650.jpg\", Detalles: tenis altos 650R de New Balance x Ai'),(113,'2023-12-05 01:06:50','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                URLImagen = \'\".Fotos para CssBalance 650.jpg','Registro actualizado en la tabla producto. Valores antiguos: \r\n                Nombre: New Balance 650, Tallas: 36,36.5,37, Marca: New Balance,\r\n                Precio: 3599, Color: Negro,Azul, URLImagen: \".Fotos para CssBalance 650.jpg\", Detalles: tenis altos 650R de New Balance'),(114,'2023-12-05 01:06:58','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37,38\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                URLImagen = \'\".Fotos para CssBalance 650.','Registro actualizado en la tabla producto. Valores antiguos: \r\n                Nombre: New Balance 650, Tallas: 36,36.5,37, Marca: New Balance,\r\n                Precio: 3599, Color: Negro,Azul, URLImagen: \".Fotos para CssBalance 650.jpg\", Detalles: tenis altos 650R de New Balance'),(115,'2023-12-05 01:08:47','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37,38\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                URLImagen = \'\".\\Fotos para Css\\Balance 65','Registro actualizado en la tabla producto. Valores antiguos: \r\n                Nombre: New Balance 650, Tallas: 36,36.5,37,38, Marca: New Balance,\r\n                Precio: 3599, Color: Negro,Azul, URLImagen: \".Fotos para CssBalance 650.jpg\", Detalles: tenis altos 650R de New Bala'),(116,'2023-12-05 01:14:23','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, URLImagen, detalles) VALUES \r\n        (86, \'Superstar\', \'37,38\', \'Adidas\', 2999, \'Blanco\', \'.Fotos para CssBalance 650.jpg\', \'tenis Superstar Classic White/Black\')','DELETE FROM producto WHERE id = 86'),(117,'2023-12-05 01:15:16','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, URLImagen, detalles) VALUES \r\n        (87, \'Superstar\', \'37,38\', \'Adidas\', 2999, \'Blanco\', \'.Fotos para CssBalance 650.jpg\', \'tenis Superstar Classic White/Black\')','DELETE FROM producto WHERE id = 87'),(118,'2023-12-05 01:17:03','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, URLImagen, detalles) VALUES \r\n        (88, \'Superstar\', \'37,38\', \'Adidas\', 2999, \'Blanco\', \'.Fotos para CssBalance 650.jpg\', \'tenis Superstar Classic White/Black\')','DELETE FROM producto WHERE id = 88'),(119,'2023-12-05 01:17:09','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, URLImagen, detalles) VALUES \r\n        (89, \'Superstar\', \'37,38\', \'Adidas\', 2999, \'Blanco\', \'.Fotos para CssBalance 650.jpg\', \'tenis Superstar Classic White/Black\')','DELETE FROM producto WHERE id = 89'),(120,'2023-12-05 01:18:00','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, URLImagen, detalles) VALUES \r\n        (90, \'Superstar\', \'37,38\', \'Adidas\', 2999, \'Blanco\', \'.Fotos para CssBalance 650.jpg\', \'tenis Superstar Classic White/Black\')','DELETE FROM producto WHERE id = 90'),(121,'2023-12-05 01:20:06','DELETE FROM producto WHERE id = 86',NULL),(122,'2023-12-05 01:20:08','DELETE FROM producto WHERE id = 87',NULL),(123,'2023-12-05 01:20:10','DELETE FROM producto WHERE id = 88',NULL),(124,'2023-12-05 01:20:12','DELETE FROM producto WHERE id = 89',NULL),(125,'2023-12-05 01:20:14','DELETE FROM producto WHERE id = 90',NULL),(126,'2023-12-05 01:38:39','DELETE FROM producto WHERE id = 83',NULL),(127,'2023-12-05 02:03:20','INSERT INTO producto (id, nombre, tallas, Marca, precio, color, URLImagen, detalles) VALUES \r\n        (91, \'Dunk Low\', \'32,35,36\', \'NIKE\', 2599, \'Azul\', \'\".Fotos para CssDunk Low.jpg\"\', \'rinde homenaje al estilo de los 80 con cuero premium\')','DELETE FROM producto WHERE id = 91'),(128,'2023-12-05 02:03:40','UPDATE producto SET \r\n                nombre = \'Dunk Low\',\r\n                tallas = \'32,35,36\',\r\n                Marca = \'NIKE\',\r\n                precio = \'2599\',\r\n                color = \'Azul\',\r\n                URLImagen = \'\".\\Fotos para Css\\Dunk Low.jpg\"\',\r\n                de','Registro actualizado en la tabla producto. Valores antiguos: \r\n                Nombre: Dunk Low, Tallas: 32,35,36, Marca: NIKE,\r\n                Precio: 2599, Color: Azul, URLImagen: \".Fotos para CssDunk Low.jpg\", Detalles: rinde homenaje al estilo de los 80 con cuero premium'),(129,'2023-12-05 03:14:09','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37,38\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                URLImagen = \'\".Fotos para CssBalance 650.','Registro actualizado en la tabla producto. Valores antiguos: \r\n                Nombre: New Balance 650, Tallas: 36,36.5,37,38, Marca: New Balance,\r\n                Precio: 3599, Color: Negro,Azul, URLImagen: \".\\Fotos para Css\\Balance 650.jpg\", Detalles: tenis altos 650R de New Ba'),(130,'2023-12-05 03:36:09','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37,38\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                URLImagen = \'\".\\Fotos para Css\\Balance 65','Registro actualizado en la tabla producto. Valores antiguos: \r\n                Nombre: New Balance 650, Tallas: 36,36.5,37,38, Marca: New Balance,\r\n                Precio: 3599, Color: Negro,Azul, URLImagen: \".Fotos para CssBalance 650.jpg\", Detalles: tenis altos 650R de New Bala'),(131,'2023-12-05 08:14:45','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37,38\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                URLImagen = \'\".Fotos para CssBalance 650.','Registro actualizado en la tabla producto. Valores antiguos: \r\n                Nombre: New Balance 650, Tallas: 36,36.5,37,38, Marca: New Balance,\r\n                Precio: 3599, Color: Negro,Azul, URLImagen: \".\\Fotos para Css\\Balance 650.jpg\", Detalles: tenis altos 650R de New Ba'),(132,'2023-12-05 08:15:12','UPDATE producto SET \r\n                nombre = \'New Balance 650\',\r\n                tallas = \'36,36.5,37,38\',\r\n                Marca = \'New Balance\',\r\n                precio = \'3599\',\r\n                color = \'Negro,Azul\',\r\n                URLImagen = \'\".\\Fotos para Css\\Balance 65','Registro actualizado en la tabla producto. Valores antiguos: \r\n                Nombre: New Balance 650, Tallas: 36,36.5,37,38, Marca: New Balance,\r\n                Precio: 3599, Color: Negro,Azul, URLImagen: \".Fotos para CssBalance 650.jpg\", Detalles: tenis altos 650R de New Bala');
/*!40000 ALTER TABLE `bitacora_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_usuarios`
--

DROP TABLE IF EXISTS `bitacora_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora_usuarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sentencia` varchar(120) DEFAULT NULL,
  `contrasentencia` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_usuarios`
--

LOCK TABLES `bitacora_usuarios` WRITE;
/*!40000 ALTER TABLE `bitacora_usuarios` DISABLE KEYS */;
INSERT INTO `bitacora_usuarios` VALUES (1,'2023-11-29 03:23:39','INSERT INTO usuarios (id, Nombre, Apellidos, Celular, FechaNacimiento, Username, Direccion, Correo, Contrasena) VALUES \r',NULL),(2,'2023-11-29 19:45:35','INSERT INTO usuarios (id, Nombre, Apellidos, Celular, FechaNacimiento, Username, Direccion, Correo, Contrasena) VALUES \r',NULL),(3,'2023-11-29 19:48:37','UPDATE usuarios SET \r\n                Nombre = \'rosa\',\r\n                Apellidos = \'Santana\',\r\n                Celular ','Registro actualizado en la tabla usuarios. Valores antiguos: \r\n                Nombre: Manuel, Apellidos: Santana, Celul'),(4,'2023-11-29 19:50:04','DELETE FROM usuarios WHERE id = 8',NULL),(5,'2023-11-29 20:05:27','INSERT INTO usuarios (id, Nombre, Apellidos, Celular, FechaNacimiento, Username, Direccion, Correo, Contrasena) VALUES \r',NULL),(6,'2023-11-29 20:06:18','INSERT INTO usuarios (id, Nombre, Apellidos, Celular, FechaNacimiento, Username, Direccion, Correo, Contrasena) VALUES \r',NULL),(7,'2023-11-29 20:07:43','INSERT INTO usuarios (id, Nombre, Apellidos, Celular, FechaNacimiento, Username, Direccion, Correo, Contrasena) VALUES \r',NULL),(8,'2023-11-29 20:10:05','INSERT INTO usuarios (id, Nombre, Apellidos, Celular, FechaNacimiento, Username, Direccion, Correo, Contrasena) VALUES \r','DELETE FROM usuarios WHERE id = 14'),(9,'2023-11-29 20:10:39','INSERT INTO usuarios (id, Nombre, Apellidos, Celular, FechaNacimiento, Username, Direccion, Correo, Contrasena) VALUES \r','DELETE FROM usuarios WHERE id = 15'),(10,'2023-11-29 20:29:35','INSERT INTO usuarios (id, Nombre, Apellidos, Celular, FechaNacimiento, Username, Direccion, Correo, Contrasena) VALUES \r','DELETE FROM usuarios WHERE id = 16'),(11,'2023-12-06 01:57:01','INSERT INTO usuarios (id, Nombre, Apellidos, Celular, FechaNacimiento, Username, Direccion, Correo, Contrasena) VALUES \r','DELETE FROM usuarios WHERE id = 17');
/*!40000 ALTER TABLE `bitacora_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrito` (
  `id` bigint(40) unsigned NOT NULL AUTO_INCREMENT,
  `producto` varchar(100) DEFAULT NULL,
  `URLImagenC` varchar(150) NOT NULL,
  `precio` int(120) DEFAULT NULL,
  `cantidad` int(120) DEFAULT NULL,
  `total` int(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (4,'Puma Caven 2.0','.Fotos para Csspuma Caven.jpg',2299,4,9196),(5,'New Balance 650','.Fotos para CssBalance 650.jpg',3599,4,14396),(6,'Superstar','.Fotos para Csssuperstar.jpeg',2599,1,2599),(7,'Jordan Stadium 90','.Fotos para CssJordan Stadium.jpg',2499,1,2499),(8,'New Balance 650','.Fotos para CssBalance 650.jpg',3599,3,10797),(9,'New Balance 650','.Fotos para CssBalance 650.jpg',3599,3,10797),(10,'Puma Caven 2.0','.Fotos para Csspuma Caven.jpg',2299,1,2299),(11,'New Balance 650','.Fotos para CssBalance 650.jpg',3599,3,10797),(12,'New Balance 650','.Fotos para CssBalance 650.jpg',3599,3,10797);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `id` bigint(40) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(80) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `titular` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'efectivo','ceti','Yahir'),(2,'efectivo','Victoria','Yahir4 ramirez'),(3,'efectivo','Victoria','Yahir4 ramirez'),(4,'efectivo','Victoria','Yahir4 ramirez'),(5,'efectivo','Victoria','Yahir4 ramirez');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) DEFAULT NULL,
  `tallas` varchar(70) NOT NULL,
  `Marca` varchar(70) DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `color` varchar(70) NOT NULL,
  `URLImagen` text NOT NULL,
  `detalles` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (2,'New Balance 650','36,36.5,37,38','New Balance',3599,'Negro,Azul','\".\\Fotos para Css\\Balance 650.jpg\"','tenis altos 650R de New Balance x Aimé Leon Dore'),(3,'Puma Caven 2.0','36,36.5','PUMA',2299,'Azul','\".\\Fotos para Css\\puma Caven.jpg\"','Caven 2.0 es un giro sutil en una silueta clásica del básquetbol. '),(4,'Superstar','37,38','Adidas',2599,'Blanco','\".\\Fotos para Css\\superstar.jpeg\"','tenis Superstar Classic White/Black'),(79,'Jordan Stadium 90','32,35,36','Nike',2499,'Blanco, Negro','\".\\Fotos para Css\\Jordan Stadium.jpg\"','El Stadium 90, con un diseño inspirado en el AJ1 y el AJ5.'),(80,'Jordan CMFT','29,30','NIKE',2199,'Blanco','\".\\Fotos para Css\\Jordan CMFT.jpg\"','La gamuza premium y la espuma Formula 23 exclusiva de la marca Jordan'),(81,'Midcity Low','27,27.5,28','Adidas',1999,'Balnco','\".\\Fotos para Css\\Midcity.jpg\"','Son la elección perfecta para los que buscan combinar estilo y comodidad en sus aventuras diarias'),(82,'Fila Velado 2','26,27','FILA',1999,'Gris','\".\\Fotos para Css\\Fila Velado.jpg\"','Tiene un diseño disruptivo y extrovertido a la vista, parte malla de textil y parte material sintéti'),(91,'Dunk Low','32,35,36','NIKE',2599,'Azul','\".\\Fotos para Css\\Dunk Low.jpg\"','rinde homenaje al estilo de los 80 con cuero premium');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER bitacora_insert_productos
AFTER INSERT ON producto
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_productos (fecha, sentencia, contrasentencia) VALUES (
        NOW(),
        CONCAT('INSERT INTO producto (id, nombre, tallas, Marca, precio, color, URLImagen, detalles) VALUES 
        (', NEW.id, ', ''', NEW.nombre, ''', ''', NEW.tallas, ''', ''', NEW.Marca, ''', ', NEW.precio, ', ''', NEW.color, ''', ''', NEW.URLImagen, ''', ''', NEW.detalles, ''')'),
        CONCAT('DELETE FROM producto WHERE id = ', NEW.id)
    );
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER bitacora_update_productos
BEFORE UPDATE ON producto
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_productos (fecha, sentencia, contrasentencia) VALUES (
        NOW(),
        CONCAT('UPDATE producto SET 
                nombre = ''', NEW.nombre, ''',
                tallas = ''', NEW.tallas, ''',
                Marca = ''', NEW.Marca, ''',
                precio = ''', NEW.precio, ''',
                color = ''', NEW.color, ''',
                URLImagen = ''', NEW.URLImagen, ''',
                detalles = ''', NEW.detalles, '''
                WHERE id = ', NEW.id),
            CONCAT('Registro actualizado en la tabla producto. Valores antiguos: 
                Nombre: ', OLD.nombre, ', Tallas: ', OLD.tallas, ', Marca: ', OLD.Marca, ',
                Precio: ', OLD.precio, ', Color: ', OLD.color, ', URLImagen: ', OLD.URLImagen, ', Detalles: ', OLD.detalles)
    );
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER bitacora_delete_productos
AFTER DELETE ON producto
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_productos (fecha, sentencia, contrasentencia) VALUES (
        NOW(),
        CONCAT('DELETE FROM producto WHERE id = ', OLD.id),
        NULL
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(150) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `paqueteria` int(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `ID` bigint(120) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) NOT NULL,
  `Apellidos` varchar(70) NOT NULL,
  `Celular` varchar(40) NOT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Username` varchar(50) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Correo` varchar(130) NOT NULL,
  `Contrasena` varchar(35) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'YahirU','Ramirez','127','2002-06-15','Yerp','Victoria','YA@gmail.com','1234'),(2,'Y','R','3','2023-09-08','V','Y','Y@Y.com','1234'),(3,'P','P','2123','2023-09-03','P','B','P@P.com','9876'),(4,'calam','calam','333','2023-09-11','sd','1sff','C@C.com','1234'),(5,'Prueba','Prueba','14','2023-09-07','Yahir','Victoria','X@X.com','1234'),(6,'','','','0000-00-00','','','',''),(7,'Felipe','Gonzales','3312323','2005-01-25','FG','Victoria','fg250195@gmail.com','12345'),(9,'Paola','Perez','323323323','2023-02-08','Pao','Ceti','a22110143@ceti.mx','12345'),(10,'rosa','Santana','33322432','1999-07-24','Rosa','Ceti','rsantana@ceti.mx','12345'),(11,'','','','0000-00-00','','','',''),(12,'Yahir4','ramirez','324343','2023-11-02','Yahir8','Ceti','Yahir10@gmail.com','12345'),(13,'Yahir4','ramirez','324343','0000-00-00','Yahir8','Ceti','Yahir12@gmail.com','12345'),(14,'Yahir4','ramirez','324343','0000-00-00','Yahir8','Ceti','Yahir13@gmail.com','12345'),(15,'Yahir4','ramirez','324343','0000-00-00','Yahir8','Ceti','Yahir14@gmail.com','12345'),(17,'Bryan','Barragan','3235334','2018-02-14','Bryan','Victoria','Clasherbryan10@gmail.com','12345');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER bitacora_insert_usuarios
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_usuarios (fecha, sentencia, contrasentencia) VALUES (
        NOW(),
        CONCAT('INSERT INTO usuarios (id, Nombre, Apellidos, Celular, FechaNacimiento, Username, Direccion, Correo, Contrasena) VALUES 
        (', NEW.id, ', ''', NEW.Nombre, ''', ''', NEW.Apellidos, ''', ''', NEW.Celular, ''', ''', NEW.FechaNacimiento, ''', ''', NEW.Username, ''', ''', NEW.Direccion, ''', ''', NEW.Correo, ''', ''', NEW.Contrasena, ''')'),
        CONCAT('DELETE FROM usuarios WHERE id = ', NEW.id)
    );
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER bitacora_update_usuarios
BEFORE UPDATE ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_usuarios (fecha, sentencia, contrasentencia) VALUES (
        NOW(),
        CONCAT('UPDATE usuarios SET 
                Nombre = ''', NEW.Nombre, ''',
                Apellidos = ''', NEW.Apellidos, ''',
                Celular = ''', NEW.Celular, ''',
                FechaNacimiento = ''', NEW.FechaNacimiento, ''',
                Username = ''', NEW.Username, ''',
                Direccion = ''', NEW.Direccion, ''',
                Correo = ''', NEW.Correo, ''',
                Contrasena = ''', NEW.Contrasena, '''
                WHERE id = ', NEW.id),
        CONCAT('Registro actualizado en la tabla usuarios. Valores antiguos: 
                Nombre: ', OLD.Nombre, ', Apellidos: ', OLD.Apellidos, ', Celular: ', OLD.Celular, ',
                FechaNacimiento: ', OLD.FechaNacimiento, ', Username: ', OLD.Username, ', Direccion: ', OLD.Direccion, ',
                Correo: ', OLD.Correo, ', Contrasena: ', OLD.Contrasena)
    );
END */;;
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

-- Dump completed on 2023-12-06 13:26:05
