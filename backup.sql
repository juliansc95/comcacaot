-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: comcacaot
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

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
-- Table structure for table `areacultivos`
--

DROP TABLE IF EXISTS `areacultivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areacultivos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `areaTotalCultivo` decimal(11,2) NOT NULL,
  `edadCultivo` int(11) NOT NULL,
  `criollo` int(11) NOT NULL,
  `CCN51` int(11) NOT NULL,
  `ICS95` int(11) NOT NULL,
  `otros` int(11) NOT NULL,
  `injertado` int(10) unsigned NOT NULL,
  `variedadcriollo` int(11) NOT NULL,
  `variedadCCN51` int(11) NOT NULL,
  `variedadICS95` int(11) NOT NULL,
  `variedadotros` int(11) NOT NULL,
  `arbolesProduccion` int(11) NOT NULL,
  `estado_id` int(10) unsigned NOT NULL,
  `mantenimiento_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `areacultivos_productor_id_foreign` (`productor_id`),
  KEY `areacultivos_finca_id_foreign` (`finca_id`),
  KEY `areacultivos_injertado_foreign` (`injertado`),
  KEY `areacultivos_mantenimiento_id_foreign` (`mantenimiento_id`),
  KEY `areacultivos_estado_id_foreign` (`estado_id`),
  CONSTRAINT `areacultivos_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estadocultivos` (`id`),
  CONSTRAINT `areacultivos_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincascoms` (`id`),
  CONSTRAINT `areacultivos_injertado_foreign` FOREIGN KEY (`injertado`) REFERENCES `opcions` (`id`),
  CONSTRAINT `areacultivos_mantenimiento_id_foreign` FOREIGN KEY (`mantenimiento_id`) REFERENCES `mantenimientoplantacions` (`id`),
  CONSTRAINT `areacultivos_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `componentesocialproductors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areacultivos`
--

LOCK TABLES `areacultivos` WRITE;
/*!40000 ALTER TABLE `areacultivos` DISABLE KEYS */;
INSERT INTO `areacultivos` VALUES (1,36,2,20.00,20,21,12,11,23,1,3,3,30,31,221,1,1,'2021-04-12 04:54:58','2021-04-12 04:57:07');
/*!40000 ALTER TABLE `areacultivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcategoria` int(10) unsigned NOT NULL,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articulos_nombre_unique` (`nombre`),
  KEY `articulos_idcategoria_foreign` (`idcategoria`),
  CONSTRAINT `articulos_idcategoria_foreign` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asociacions`
--

DROP TABLE IF EXISTS `asociacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asociacions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asociacions_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asociacions`
--

LOCK TABLES `asociacions` WRITE;
/*!40000 ALTER TABLE `asociacions` DISABLE KEYS */;
INSERT INTO `asociacions` VALUES (1,'AGROFROTERA','2021-03-27 14:14:05','2021-03-27 14:14:05'),(2,'AGROFROTERAS','2021-03-27 14:14:05','2021-03-27 14:14:05'),(3,'AGROFORTALEZA','2021-03-27 14:14:05','2021-03-27 14:14:05'),(4,'AGROJUNTOS VENCEREMOS','2021-03-27 14:14:05','2021-03-27 14:14:05'),(5,'AGROFUTURO','2021-03-27 14:14:05','2021-03-27 14:14:05'),(6,'AGRONUEVA ESPERANZA','2021-03-27 14:14:06','2021-03-27 14:14:06'),(7,'AGROPINDALES','2021-03-27 14:14:06','2021-03-27 14:14:06'),(8,'AGROSAN','2021-03-27 14:14:06','2021-03-27 14:14:06'),(9,'ASOANES','2021-03-27 14:14:06','2021-03-27 14:14:06'),(10,'ASOREMB','2021-03-27 14:14:06','2021-03-27 14:14:06'),(11,'ASOCHAJAL','2021-03-27 14:14:06','2021-03-27 14:14:06'),(12,'ASOFUTURO','2021-03-27 14:14:06','2021-03-27 14:14:06'),(13,'ASOPALMIRA','2021-03-27 14:14:06','2021-03-27 14:14:06'),(14,'ASOPORCA','2021-03-27 14:14:06','2021-03-27 14:14:06'),(15,'ASOPROGRESO','2021-03-27 14:14:06','2021-03-27 14:14:06'),(16,'ASUPRO','2021-03-27 14:14:06','2021-03-27 14:14:06'),(17,'CACAUTEROS DEL FUTURO','2021-03-27 14:14:06','2021-03-27 14:14:06'),(18,'LA ESPERANZA','2021-03-27 14:14:06','2021-03-27 14:14:06'),(19,'PROCACAO','2021-03-27 14:14:06','2021-03-27 14:14:06'),(20,'ASOCAMPO','2021-03-27 14:14:06','2021-03-27 14:14:06');
/*!40000 ALTER TABLE `asociacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bancos_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
INSERT INTO `bancos` VALUES (1,'BANCO DE COLOMBIA','2021-03-27 14:14:05','2021-03-27 14:14:05'),(2,'BANCO DE BOGOTA','2021-03-27 14:14:05','2021-03-27 14:14:05'),(3,'BANCO AGRARIO','2021-03-27 14:14:05','2021-03-27 14:14:05'),(4,'DAVIVIENDA','2021-03-27 14:14:05','2021-03-27 14:14:05'),(5,'BAN COMPARTIR','2021-03-27 14:14:05','2021-03-27 14:14:05'),(6,'BANCO DE LA MUJER WWB','2021-03-27 14:14:05','2021-03-27 14:14:05'),(7,'BANCAMIA','2021-03-27 14:14:05','2021-03-27 14:14:05'),(8,'OTRO','2021-03-27 14:14:05','2021-03-27 14:14:05');
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadenas`
--

DROP TABLE IF EXISTS `cadenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadenas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cadenas_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadenas`
--

LOCK TABLES `cadenas` WRITE;
/*!40000 ALTER TABLE `cadenas` DISABLE KEYS */;
INSERT INTO `cadenas` VALUES (1,'Mora',NULL,NULL),(2,'Gulupa',NULL,NULL);
/*!40000 ALTER TABLE `cadenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriamoras`
--

DROP TABLE IF EXISTS `categoriamoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriamoras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valorUnitario` decimal(11,0) NOT NULL,
  `ValorDonacion` decimal(11,0) NOT NULL,
  `valorTransporte` decimal(11,0) NOT NULL,
  `valorAsohof` decimal(11,2) NOT NULL,
  `valorCuatroPorMil` decimal(11,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoriamoras_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriamoras`
--

LOCK TABLES `categoriamoras` WRITE;
/*!40000 ALTER TABLE `categoriamoras` DISABLE KEYS */;
INSERT INTO `categoriamoras` VALUES (1,'Cacao Premium',2300,120,88,0.01,0.0040,'2020-12-07 22:28:36','2021-03-08 04:05:53'),(2,'Cacao Corriente',2000,120,88,0.01,0.0040,'2020-12-07 22:29:26','2021-03-08 04:06:03'),(3,'Cacao corriente mejorado',2100,0,0,0.00,0.0000,'2021-03-08 04:06:16','2021-03-08 04:06:16'),(4,'Cacao Fino Mejora',2500,0,0,0.00,0.0000,'2021-03-08 04:06:56','2021-03-08 04:06:56'),(5,'Cacao Pasilla',3000,0,0,0.00,0.0000,'2021-03-08 04:07:13','2021-03-08 04:07:13'),(6,'Cacao Corriente en Baba',3311,0,0,0.00,0.0000,'2021-03-08 04:07:36','2021-03-08 04:09:53'),(7,'Cacao Premium en Baba',2000,0,0,0.00,0.0000,'2021-03-08 04:07:59','2021-03-17 15:30:06');
/*!40000 ALTER TABLE `categoriamoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componenteeconomicos`
--

DROP TABLE IF EXISTS `componenteeconomicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componenteeconomicos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `ingresoMensual` int(11) NOT NULL,
  `gastoMensual` int(11) NOT NULL,
  `otrosIngresos` int(11) NOT NULL,
  `ingresoNeto` int(11) NOT NULL,
  `credito` int(10) unsigned NOT NULL,
  `banco_id` int(10) unsigned DEFAULT NULL,
  `ahorro` int(10) unsigned NOT NULL,
  `ahorro_id` int(10) unsigned DEFAULT NULL,
  `registro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accionista` int(10) unsigned NOT NULL,
  `numeroAcciones` int(11) DEFAULT NULL,
  `interesadoCompra` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `componenteeconomicos_productor_id_foreign` (`productor_id`),
  KEY `componenteeconomicos_finca_id_foreign` (`finca_id`),
  KEY `componenteeconomicos_credito_foreign` (`credito`),
  KEY `componenteeconomicos_banco_id_foreign` (`banco_id`),
  KEY `componenteeconomicos_ahorro_foreign` (`ahorro`),
  KEY `componenteeconomicos_ahorro_id_foreign` (`ahorro_id`),
  KEY `componenteeconomicos_accionista_foreign` (`accionista`),
  KEY `componenteeconomicos_interesadocompra_foreign` (`interesadoCompra`),
  CONSTRAINT `componenteeconomicos_accionista_foreign` FOREIGN KEY (`accionista`) REFERENCES `opcions` (`id`),
  CONSTRAINT `componenteeconomicos_ahorro_foreign` FOREIGN KEY (`ahorro`) REFERENCES `opcions` (`id`),
  CONSTRAINT `componenteeconomicos_ahorro_id_foreign` FOREIGN KEY (`ahorro_id`) REFERENCES `bancos` (`id`),
  CONSTRAINT `componenteeconomicos_banco_id_foreign` FOREIGN KEY (`banco_id`) REFERENCES `bancos` (`id`),
  CONSTRAINT `componenteeconomicos_credito_foreign` FOREIGN KEY (`credito`) REFERENCES `opcions` (`id`),
  CONSTRAINT `componenteeconomicos_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `componenteeconomicos_interesadocompra_foreign` FOREIGN KEY (`interesadoCompra`) REFERENCES `opcions` (`id`),
  CONSTRAINT `componenteeconomicos_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `componentesocialproductors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componenteeconomicos`
--

LOCK TABLES `componenteeconomicos` WRITE;
/*!40000 ALTER TABLE `componenteeconomicos` DISABLE KEYS */;
INSERT INTO `componenteeconomicos` VALUES (1,36,2,500000,345000,200000,345678,1,1,1,6,'Gastos',1,6,2,'2021-04-12 02:07:33','2021-04-12 02:07:33'),(2,36,2,33333,2222222,412124,214141,1,2,1,4,'Gastos',1,5,1,'2021-04-12 02:39:13','2021-04-12 02:39:13'),(3,36,2,213125,12312412,124124,1241222,1,1,1,5,'Ingresos y gastos',1,7,2,'2021-04-12 02:48:01','2021-04-12 03:22:41');
/*!40000 ALTER TABLE `componenteeconomicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componentesocialproductors`
--

DROP TABLE IF EXISTS `componentesocialproductors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componentesocialproductors` (
  `id` int(10) unsigned NOT NULL,
  `estadoCivil_id` int(10) unsigned NOT NULL,
  `etnia_id` int(10) unsigned NOT NULL,
  `sexo_id` int(10) unsigned NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `vereda_id` int(10) unsigned NOT NULL,
  `vivienda_id` int(10) unsigned NOT NULL,
  `tipovivienda_id` int(10) unsigned NOT NULL,
  `escolaridad_id` int(10) unsigned NOT NULL,
  `carnetSalud` int(10) unsigned NOT NULL,
  `discapacitado` int(10) unsigned NOT NULL,
  `personasAcargo` int(11) NOT NULL,
  `desplazado` int(10) unsigned NOT NULL,
  `asociacion_id` int(10) unsigned NOT NULL,
  `programaEstado_id` int(10) unsigned NOT NULL,
  `asistencia` int(10) unsigned NOT NULL,
  `entidad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacitacion` int(10) unsigned NOT NULL,
  `temas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentesco1` int(10) unsigned DEFAULT NULL,
  `NombreP1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccP1` int(11) DEFAULT NULL,
  `fechaNacimientoP1` date DEFAULT NULL,
  `escolaridad_idP1` int(10) unsigned DEFAULT NULL,
  `parentesco2` int(10) unsigned DEFAULT NULL,
  `NombreP2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccP2` int(11) DEFAULT NULL,
  `fechaNacimientoP2` date DEFAULT NULL,
  `escolaridad_idP2` int(10) unsigned DEFAULT NULL,
  `parentesco3` int(10) unsigned DEFAULT NULL,
  `NombreP3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccP3` int(11) DEFAULT NULL,
  `fechaNacimientoP3` date DEFAULT NULL,
  `escolaridad_idP3` int(10) unsigned DEFAULT NULL,
  `parentesco4` int(10) unsigned DEFAULT NULL,
  `NombreP4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccP4` int(11) DEFAULT NULL,
  `fechaNacimientoP4` date DEFAULT NULL,
  `escolaridad_idP4` int(10) unsigned DEFAULT NULL,
  `parentesco5` int(10) unsigned DEFAULT NULL,
  `NombreP5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccP5` int(11) DEFAULT NULL,
  `fechaNacimientoP5` date DEFAULT NULL,
  `escolaridad_idP5` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `componentesocialproductors_id_foreign` (`id`),
  KEY `componentesocialproductors_estadocivil_id_foreign` (`estadoCivil_id`),
  KEY `componentesocialproductors_etnia_id_foreign` (`etnia_id`),
  KEY `componentesocialproductors_sexo_id_foreign` (`sexo_id`),
  KEY `componentesocialproductors_vereda_id_foreign` (`vereda_id`),
  KEY `componentesocialproductors_vivienda_id_foreign` (`vivienda_id`),
  KEY `componentesocialproductors_tipovivienda_id_foreign` (`tipovivienda_id`),
  KEY `componentesocialproductors_escolaridad_id_foreign` (`escolaridad_id`),
  KEY `componentesocialproductors_carnetsalud_foreign` (`carnetSalud`),
  KEY `componentesocialproductors_discapacitado_foreign` (`discapacitado`),
  KEY `componentesocialproductors_desplazado_foreign` (`desplazado`),
  KEY `componentesocialproductors_asociacion_id_foreign` (`asociacion_id`),
  KEY `componentesocialproductors_programaestado_id_foreign` (`programaEstado_id`),
  KEY `componentesocialproductors_asistencia_foreign` (`asistencia`),
  KEY `componentesocialproductors_capacitacion_foreign` (`capacitacion`),
  KEY `componentesocialproductors_parentesco1_foreign` (`parentesco1`),
  KEY `componentesocialproductors_escolaridad_idp1_foreign` (`escolaridad_idP1`),
  KEY `componentesocialproductors_parentesco2_foreign` (`parentesco2`),
  KEY `componentesocialproductors_escolaridad_idp2_foreign` (`escolaridad_idP2`),
  KEY `componentesocialproductors_parentesco3_foreign` (`parentesco3`),
  KEY `componentesocialproductors_escolaridad_idp3_foreign` (`escolaridad_idP3`),
  KEY `componentesocialproductors_parentesco4_foreign` (`parentesco4`),
  KEY `componentesocialproductors_escolaridad_idp4_foreign` (`escolaridad_idP4`),
  KEY `componentesocialproductors_parentesco5_foreign` (`parentesco5`),
  KEY `componentesocialproductors_escolaridad_idp5_foreign` (`escolaridad_idP5`),
  CONSTRAINT `componentesocialproductors_asistencia_foreign` FOREIGN KEY (`asistencia`) REFERENCES `opcions` (`id`),
  CONSTRAINT `componentesocialproductors_asociacion_id_foreign` FOREIGN KEY (`asociacion_id`) REFERENCES `asociacions` (`id`),
  CONSTRAINT `componentesocialproductors_capacitacion_foreign` FOREIGN KEY (`capacitacion`) REFERENCES `opcions` (`id`),
  CONSTRAINT `componentesocialproductors_carnetsalud_foreign` FOREIGN KEY (`carnetSalud`) REFERENCES `opcions` (`id`),
  CONSTRAINT `componentesocialproductors_desplazado_foreign` FOREIGN KEY (`desplazado`) REFERENCES `opcions` (`id`),
  CONSTRAINT `componentesocialproductors_discapacitado_foreign` FOREIGN KEY (`discapacitado`) REFERENCES `opcions` (`id`),
  CONSTRAINT `componentesocialproductors_escolaridad_id_foreign` FOREIGN KEY (`escolaridad_id`) REFERENCES `gradoescolaridads` (`id`),
  CONSTRAINT `componentesocialproductors_escolaridad_idp1_foreign` FOREIGN KEY (`escolaridad_idP1`) REFERENCES `gradoescolaridads` (`id`),
  CONSTRAINT `componentesocialproductors_escolaridad_idp2_foreign` FOREIGN KEY (`escolaridad_idP2`) REFERENCES `gradoescolaridads` (`id`),
  CONSTRAINT `componentesocialproductors_escolaridad_idp3_foreign` FOREIGN KEY (`escolaridad_idP3`) REFERENCES `gradoescolaridads` (`id`),
  CONSTRAINT `componentesocialproductors_escolaridad_idp4_foreign` FOREIGN KEY (`escolaridad_idP4`) REFERENCES `gradoescolaridads` (`id`),
  CONSTRAINT `componentesocialproductors_escolaridad_idp5_foreign` FOREIGN KEY (`escolaridad_idP5`) REFERENCES `gradoescolaridads` (`id`),
  CONSTRAINT `componentesocialproductors_estadocivil_id_foreign` FOREIGN KEY (`estadoCivil_id`) REFERENCES `estadocivils` (`id`),
  CONSTRAINT `componentesocialproductors_etnia_id_foreign` FOREIGN KEY (`etnia_id`) REFERENCES `etnias` (`id`),
  CONSTRAINT `componentesocialproductors_id_foreign` FOREIGN KEY (`id`) REFERENCES `personas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `componentesocialproductors_parentesco1_foreign` FOREIGN KEY (`parentesco1`) REFERENCES `parentescos` (`id`),
  CONSTRAINT `componentesocialproductors_parentesco2_foreign` FOREIGN KEY (`parentesco2`) REFERENCES `parentescos` (`id`),
  CONSTRAINT `componentesocialproductors_parentesco3_foreign` FOREIGN KEY (`parentesco3`) REFERENCES `parentescos` (`id`),
  CONSTRAINT `componentesocialproductors_parentesco4_foreign` FOREIGN KEY (`parentesco4`) REFERENCES `parentescos` (`id`),
  CONSTRAINT `componentesocialproductors_parentesco5_foreign` FOREIGN KEY (`parentesco5`) REFERENCES `parentescos` (`id`),
  CONSTRAINT `componentesocialproductors_programaestado_id_foreign` FOREIGN KEY (`programaEstado_id`) REFERENCES `programaestados` (`id`),
  CONSTRAINT `componentesocialproductors_sexo_id_foreign` FOREIGN KEY (`sexo_id`) REFERENCES `sexos` (`id`),
  CONSTRAINT `componentesocialproductors_tipovivienda_id_foreign` FOREIGN KEY (`tipovivienda_id`) REFERENCES `tipoviviendas` (`id`),
  CONSTRAINT `componentesocialproductors_vereda_id_foreign` FOREIGN KEY (`vereda_id`) REFERENCES `veredascoms` (`id`),
  CONSTRAINT `componentesocialproductors_vivienda_id_foreign` FOREIGN KEY (`vivienda_id`) REFERENCES `viviendas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentesocialproductors`
--

LOCK TABLES `componentesocialproductors` WRITE;
/*!40000 ALTER TABLE `componentesocialproductors` DISABLE KEYS */;
INSERT INTO `componentesocialproductors` VALUES (35,1,1,1,'2021-03-31',35,1,1,10,1,1,1,1,15,5,1,'asa',1,'asda',1,NULL,0,'2021-03-31',10,1,NULL,0,'2021-03-31',1,1,NULL,0,'2021-03-31',1,1,NULL,0,'2021-03-31',1,1,NULL,0,'2021-03-31',1,NULL,NULL),(36,1,3,2,'2021-04-06',116,1,1,1,1,1,2,1,1,1,1,'SENA',1,'PRUEBAS',2,'prueba',423423,'2021-04-02',1,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL),(37,1,1,1,'2021-04-05',23,1,1,1,1,1,4,1,1,1,1,'test',1,'test',5,'asda',124212,'2021-04-06',8,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL),(38,1,1,1,'2021-04-06',56,1,1,9,1,1,2,1,14,1,1,'aa',1,'uao',NULL,NULL,0,'2021-04-05',NULL,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL,0,'2021-04-05',NULL,NULL,NULL),(40,1,1,1,'2021-04-06',137,1,1,1,1,1,3,1,1,1,1,'aa',1,'asd',2,'a',121233,'2021-04-07',2,1,'b',2222222,'2021-04-04',8,4,'c',4444444,'2021-04-05',9,5,'d',555555,'2021-04-19',8,6,'e',66666,'2021-04-05',6,NULL,NULL);
/*!40000 ALTER TABLE `componentesocialproductors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cosechacultivos`
--

DROP TABLE IF EXISTS `cosechacultivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cosechacultivos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `frecuencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frescoTotal` int(11) NOT NULL,
  `secoTotal` int(11) NOT NULL,
  `beneficio` int(10) unsigned NOT NULL,
  `fermentacion_id` int(10) unsigned NOT NULL,
  `frescoTotalMes` int(11) NOT NULL,
  `secoTotalMes` int(11) NOT NULL,
  `lugarVenta_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cosechacultivos_productor_id_foreign` (`productor_id`),
  KEY `cosechacultivos_finca_id_foreign` (`finca_id`),
  KEY `cosechacultivos_beneficio_foreign` (`beneficio`),
  KEY `cosechacultivos_fermentacion_id_foreign` (`fermentacion_id`),
  KEY `cosechacultivos_lugarventa_id_foreign` (`lugarVenta_id`),
  CONSTRAINT `cosechacultivos_beneficio_foreign` FOREIGN KEY (`beneficio`) REFERENCES `opcions` (`id`),
  CONSTRAINT `cosechacultivos_fermentacion_id_foreign` FOREIGN KEY (`fermentacion_id`) REFERENCES `fermentacions` (`id`),
  CONSTRAINT `cosechacultivos_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincascoms` (`id`),
  CONSTRAINT `cosechacultivos_lugarventa_id_foreign` FOREIGN KEY (`lugarVenta_id`) REFERENCES `lugarventas` (`id`),
  CONSTRAINT `cosechacultivos_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `componentesocialproductors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cosechacultivos`
--

LOCK TABLES `cosechacultivos` WRITE;
/*!40000 ALTER TABLE `cosechacultivos` DISABLE KEYS */;
INSERT INTO `cosechacultivos` VALUES (1,36,2,'Quincenal',30,27,1,1,34,50,3,'2021-04-12 14:14:49','2021-04-12 14:22:54');
/*!40000 ALTER TABLE `cosechacultivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cosechas`
--

DROP TABLE IF EXISTS `cosechas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cosechas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `frecuencia` int(11) DEFAULT NULL,
  `clasificacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `empaque` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporte` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kilogramoMoraPrimera` int(11) DEFAULT NULL,
  `kilogramoMoraSegunda` int(11) DEFAULT NULL,
  `mesesProduccion` int(11) DEFAULT NULL,
  `clientes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiempoPago` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoPago` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cosechas_productor_id_foreign` (`productor_id`),
  KEY `cosechas_finca_id_foreign` (`finca_id`),
  CONSTRAINT `cosechas_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `cosechas_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cosechas`
--

LOCK TABLES `cosechas` WRITE;
/*!40000 ALTER TABLE `cosechas` DISABLE KEYS */;
INSERT INTO `cosechas` VALUES (1,5,1,11,'Si','Canastilla','moto',11,11,2,'Plaza de mercado','Contraentrega','Efectivo','2020-12-21 20:04:25','2020-12-21 20:04:25');
/*!40000 ALTER TABLE `cosechas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cultivos`
--

DROP TABLE IF EXISTS `cultivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cultivos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `cadena_id` int(10) unsigned NOT NULL,
  `areaSembrada` decimal(11,2) NOT NULL,
  `fechaSiembra` date NOT NULL,
  `numeroPlantulasArboles` int(11) NOT NULL,
  `totalVentasKgAnioAnterior` decimal(11,2) NOT NULL,
  `precioPromedio` decimal(11,2) NOT NULL,
  `TotalVentasAnioAnterior` decimal(11,2) NOT NULL,
  `lugarVenta_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cultivos_productor_id_foreign` (`productor_id`),
  KEY `cultivos_finca_id_foreign` (`finca_id`),
  KEY `cultivos_cadena_id_foreign` (`cadena_id`),
  KEY `cultivos_lugarventa_id_foreign` (`lugarVenta_id`),
  CONSTRAINT `cultivos_cadena_id_foreign` FOREIGN KEY (`cadena_id`) REFERENCES `cadenas` (`id`),
  CONSTRAINT `cultivos_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `cultivos_lugarventa_id_foreign` FOREIGN KEY (`lugarVenta_id`) REFERENCES `lugarventas` (`id`),
  CONSTRAINT `cultivos_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultivos`
--

LOCK TABLES `cultivos` WRITE;
/*!40000 ALTER TABLE `cultivos` DISABLE KEYS */;
INSERT INTO `cultivos` VALUES (1,5,3,1,500.00,'2020-10-10',500,200.00,200.00,40000.00,2,'2020-12-07 22:27:17','2020-12-22 16:10:28');
/*!40000 ALTER TABLE `cultivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departamentos_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'CAUCA','2020-12-07 22:04:32','2020-12-07 22:04:32'),(2,'AMAZONAS','2020-12-07 22:04:32','2020-12-07 22:04:32'),(3,'ANTIOQUIA','2020-12-07 22:04:32','2020-12-07 22:04:32'),(4,'ARAUCA','2020-12-07 22:04:32','2020-12-07 22:04:32'),(5,'ATLANTICO','2020-12-07 22:04:32','2020-12-07 22:04:32'),(6,'BOLIVAR','2020-12-07 22:04:32','2020-12-07 22:04:32'),(7,'BOYACA','2020-12-07 22:04:32','2020-12-07 22:04:32'),(8,'CALDAS','2020-12-07 22:04:32','2020-12-07 22:04:32'),(9,'CAQUETA','2020-12-07 22:04:32','2020-12-07 22:04:32'),(10,'CASANARE','2020-12-07 22:04:32','2020-12-07 22:04:32'),(11,'CESAR','2020-12-07 22:04:32','2020-12-07 22:04:32'),(12,'CHOCO','2020-12-07 22:04:33','2020-12-07 22:04:33'),(13,'CORDOBA','2020-12-07 22:04:33','2020-12-07 22:04:33'),(14,'CUNDINAMARCA','2020-12-07 22:04:33','2020-12-07 22:04:33'),(15,'GUAINIA','2020-12-07 22:04:33','2020-12-07 22:04:33'),(16,'GUAJIRA','2020-12-07 22:04:33','2020-12-07 22:04:33'),(17,'GUAVIARE','2020-12-07 22:04:33','2020-12-07 22:04:33'),(18,'HUILA','2020-12-07 22:04:33','2020-12-07 22:04:33'),(19,'MAGDALENA','2020-12-07 22:04:33','2020-12-07 22:04:33'),(20,'META','2020-12-07 22:04:33','2020-12-07 22:04:33'),(21,'N SANTANDER','2020-12-07 22:04:33','2020-12-07 22:04:33'),(22,'NARIÑO','2020-12-07 22:04:33','2020-12-07 22:04:33'),(23,'PUTUMAYO','2020-12-07 22:04:33','2020-12-07 22:04:33'),(24,'QUINDIO','2020-12-07 22:04:33','2020-12-07 22:04:33'),(25,'RISARALDA','2020-12-07 22:04:33','2020-12-07 22:04:33'),(26,'SAN ANDRES','2020-12-07 22:04:33','2020-12-07 22:04:33'),(27,'SANTANDER','2020-12-07 22:04:33','2020-12-07 22:04:33'),(28,'SUCRE','2020-12-07 22:04:34','2020-12-07 22:04:34'),(29,'TOLIMA','2020-12-07 22:04:34','2020-12-07 22:04:34'),(30,'VALLE DEL CAUCA','2020-12-07 22:04:34','2020-12-07 22:04:34'),(31,'VAUPES','2020-12-07 22:04:34','2020-12-07 22:04:34'),(32,'VICHADA','2020-12-07 22:04:34','2020-12-07 22:04:34');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta_fitosanitarias`
--

DROP TABLE IF EXISTS `encuesta_fitosanitarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta_fitosanitarias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `fechaControl` date NOT NULL,
  `productoSembrado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lote` int(11) DEFAULT NULL,
  `linea_id` int(10) unsigned NOT NULL,
  `numeroPlantas` int(11) DEFAULT NULL,
  `producto_fitosanitario_id` int(10) unsigned NOT NULL,
  `cantidad_dosis` decimal(11,2) DEFAULT NULL,
  `unidad_dosis_id` int(10) unsigned DEFAULT NULL,
  `cantidad_aplicacion` decimal(11,2) DEFAULT NULL,
  `unidad_aplicaciones_id` int(10) unsigned DEFAULT NULL,
  `equipo_aplicaciones_id` int(10) unsigned DEFAULT NULL,
  `metodo_aplicaciones_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `encuesta_fitosanitarias_productor_id_foreign` (`productor_id`),
  KEY `encuesta_fitosanitarias_finca_id_foreign` (`finca_id`),
  KEY `encuesta_fitosanitarias_linea_id_foreign` (`linea_id`),
  KEY `encuesta_fitosanitarias_producto_fitosanitario_id_foreign` (`producto_fitosanitario_id`),
  KEY `encuesta_fitosanitarias_unidad_dosis_id_foreign` (`unidad_dosis_id`),
  KEY `encuesta_fitosanitarias_unidad_aplicaciones_id_foreign` (`unidad_aplicaciones_id`),
  KEY `encuesta_fitosanitarias_equipo_aplicaciones_id_foreign` (`equipo_aplicaciones_id`),
  KEY `encuesta_fitosanitarias_metodo_aplicaciones_id_foreign` (`metodo_aplicaciones_id`),
  CONSTRAINT `encuesta_fitosanitarias_equipo_aplicaciones_id_foreign` FOREIGN KEY (`equipo_aplicaciones_id`) REFERENCES `equipo_aplicaciones` (`id`),
  CONSTRAINT `encuesta_fitosanitarias_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `encuesta_fitosanitarias_linea_id_foreign` FOREIGN KEY (`linea_id`) REFERENCES `lineas` (`id`),
  CONSTRAINT `encuesta_fitosanitarias_metodo_aplicaciones_id_foreign` FOREIGN KEY (`metodo_aplicaciones_id`) REFERENCES `metodo_aplicaciones` (`id`),
  CONSTRAINT `encuesta_fitosanitarias_producto_fitosanitario_id_foreign` FOREIGN KEY (`producto_fitosanitario_id`) REFERENCES `producto_fitosanitarios` (`id`),
  CONSTRAINT `encuesta_fitosanitarias_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`),
  CONSTRAINT `encuesta_fitosanitarias_unidad_aplicaciones_id_foreign` FOREIGN KEY (`unidad_aplicaciones_id`) REFERENCES `unidad_aplicaciones` (`id`),
  CONSTRAINT `encuesta_fitosanitarias_unidad_dosis_id_foreign` FOREIGN KEY (`unidad_dosis_id`) REFERENCES `unidad_dosis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta_fitosanitarias`
--

LOCK TABLES `encuesta_fitosanitarias` WRITE;
/*!40000 ALTER TABLE `encuesta_fitosanitarias` DISABLE KEYS */;
INSERT INTO `encuesta_fitosanitarias` VALUES (1,5,1,'2020-12-02','lluca',1,1,6,131,15.00,1,15.00,1,2,2,NULL,NULL),(2,5,1,'2020-12-02','platano',2,1,100,75,500.00,1,15.00,1,1,1,'2020-12-20 20:37:12','2020-12-20 20:37:12');
/*!40000 ALTER TABLE `encuesta_fitosanitarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuestaasofruts`
--

DROP TABLE IF EXISTS `encuestaasofruts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuestaasofruts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `certificacion1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificacion2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecosistemas1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecosistemas2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecosistemas3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecosistemas4` int(11) DEFAULT NULL,
  `ecosistemas5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecosistemas6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecosistemas7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecosistemas8` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre8` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre9` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre10` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre11` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre12` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre13` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre14` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre15` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre16` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre17` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre18` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre19` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `silvestre20` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conservacion1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conservacion2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conservacion3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conservacion4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conservacion5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conservacion6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desechos1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desechos2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desechos3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desechos4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cultivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `encuestaasofruts_productor_id_foreign` (`productor_id`),
  KEY `encuestaasofruts_finca_id_foreign` (`finca_id`),
  CONSTRAINT `encuestaasofruts_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `encuestaasofruts_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuestaasofruts`
--

LOCK TABLES `encuestaasofruts` WRITE;
/*!40000 ALTER TABLE `encuestaasofruts` DISABLE KEYS */;
INSERT INTO `encuestaasofruts` VALUES (2,5,1,'Si','Si','Si','Si','Si',5,'Si','Si','No','Si','Si','Si','Si','No','Roceria','No','Biologicos','Si','No','Regular','Acueducto Familiar','casa','Si','casa','Si','Si','perro','No','0','0','Si','no','Si','Si','Si','Si','Abono','Entierra','Vende','Si','Quema','2020-12-21 05:06:40','2020-12-21 05:06:40'),(3,5,3,'Si','Si','Si','Si','No',5,'Si','Si','No','No','Si','Si','Si','No','Guadana','No','Biologicos','Si','No','Bueno','Acueducto Veredal','casa','Si','prueba','Si','Si','gato','Si','0','0','No','ninguna','No','Si','Si','Si','Abono','Vende','Acopio','Si',NULL,'2021-03-04 03:47:16','2021-03-04 03:47:16');
/*!40000 ALTER TABLE `encuestaasofruts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedads`
--

DROP TABLE IF EXISTS `enfermedads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `monitoreo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaMonitoreo` int(11) DEFAULT NULL,
  `antracnosis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoManejoAntra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaAntra` int(11) DEFAULT NULL,
  `botritys` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoManejoBotritys` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaBotritys` int(11) DEFAULT NULL,
  `mildeo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoManejoMildeo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaMildeo` int(11) DEFAULT NULL,
  `mildeoVelloso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoManejoMildeoVelloso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaMildeoVelloso` int(11) DEFAULT NULL,
  `adherentes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombreAdherente` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dosisAplicacion` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedads`
--

LOCK TABLES `enfermedads` WRITE;
/*!40000 ALTER TABLE `enfermedads` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermedads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo_aplicaciones`
--

DROP TABLE IF EXISTS `equipo_aplicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo_aplicaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipo_aplicaciones_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo_aplicaciones`
--

LOCK TABLES `equipo_aplicaciones` WRITE;
/*!40000 ALTER TABLE `equipo_aplicaciones` DISABLE KEYS */;
INSERT INTO `equipo_aplicaciones` VALUES (1,'Estacionaria','2020-12-16 19:36:23','2020-12-16 19:36:23'),(2,'Bomba de espalda','2020-12-16 19:36:23','2020-12-16 19:36:23'),(3,'Manual','2020-12-16 19:36:23','2020-12-16 19:36:23'),(4,'Drench','2020-12-16 19:36:23','2020-12-16 19:36:23');
/*!40000 ALTER TABLE `equipo_aplicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocivils`
--

DROP TABLE IF EXISTS `estadocivils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadocivils` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estadocivils_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocivils`
--

LOCK TABLES `estadocivils` WRITE;
/*!40000 ALTER TABLE `estadocivils` DISABLE KEYS */;
INSERT INTO `estadocivils` VALUES (1,'Soltero','2021-03-27 14:14:03','2021-03-27 14:14:03'),(2,'Casado','2021-03-27 14:14:03','2021-03-27 14:14:03');
/*!40000 ALTER TABLE `estadocivils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocultivos`
--

DROP TABLE IF EXISTS `estadocultivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadocultivos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estadocultivos_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocultivos`
--

LOCK TABLES `estadocultivos` WRITE;
/*!40000 ALTER TABLE `estadocultivos` DISABLE KEYS */;
INSERT INTO `estadocultivos` VALUES (1,'Bueno','2021-04-11 15:53:12','2021-04-11 15:53:12'),(2,'Regular','2021-04-11 15:53:12','2021-04-11 15:53:12'),(3,'Malo','2021-04-11 15:53:13','2021-04-11 15:53:13');
/*!40000 ALTER TABLE `estadocultivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoventas`
--

DROP TABLE IF EXISTS `estadoventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadoventas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoventas`
--

LOCK TABLES `estadoventas` WRITE;
/*!40000 ALTER TABLE `estadoventas` DISABLE KEYS */;
INSERT INTO `estadoventas` VALUES (1,'FACTURADO','2020-12-07 22:04:38','2020-12-07 22:04:38'),(2,'TRAMITE FACTURACION','2020-12-07 22:04:38','2020-12-07 22:04:38'),(3,'DISPONIBLE PARA PAGO','2020-12-07 22:04:38','2020-12-07 22:04:38'),(4,'PAGADO','2020-12-07 22:04:38','2020-12-07 22:04:38'),(5,'ANULADO',NULL,NULL);
/*!40000 ALTER TABLE `estadoventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etnias`
--

DROP TABLE IF EXISTS `etnias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etnias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `etnias_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etnias`
--

LOCK TABLES `etnias` WRITE;
/*!40000 ALTER TABLE `etnias` DISABLE KEYS */;
INSERT INTO `etnias` VALUES (1,'Indigena','2020-12-07 22:04:31','2020-12-07 22:04:31'),(2,'Afro',NULL,NULL),(3,'Mestizo',NULL,NULL);
/*!40000 ALTER TABLE `etnias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fermentacions`
--

DROP TABLE IF EXISTS `fermentacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fermentacions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fermentacions_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fermentacions`
--

LOCK TABLES `fermentacions` WRITE;
/*!40000 ALTER TABLE `fermentacions` DISABLE KEYS */;
INSERT INTO `fermentacions` VALUES (1,'Cajones ','2021-04-11 15:53:14','2021-04-11 15:53:14'),(2,'Costales','2021-04-11 15:53:14','2021-04-11 15:53:14'),(3,'Secado','2021-04-11 15:53:14','2021-04-11 15:53:14'),(4,'Muelle','2021-04-11 15:53:14','2021-04-11 15:53:14'),(5,'Piso','2021-04-11 15:53:14','2021-04-11 15:53:14'),(6,'Marquesina','2021-04-11 15:53:14','2021-04-11 15:53:14');
/*!40000 ALTER TABLE `fermentacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financiacions`
--

DROP TABLE IF EXISTS `financiacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financiacions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `financiacions_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financiacions`
--

LOCK TABLES `financiacions` WRITE;
/*!40000 ALTER TABLE `financiacions` DISABLE KEYS */;
INSERT INTO `financiacions` VALUES (1,'Recurso Propio ','2021-04-11 15:53:13','2021-04-11 15:53:13'),(2,'Credito','2021-04-11 15:53:13','2021-04-11 15:53:13'),(3,'Alcaldia','2021-04-11 15:53:13','2021-04-11 15:53:13'),(4,'Proyecto','2021-04-11 15:53:13','2021-04-11 15:53:13');
/*!40000 ALTER TABLE `financiacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fincas`
--

DROP TABLE IF EXISTS `fincas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fincas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productor_id` int(10) unsigned NOT NULL,
  `linea_id` int(10) unsigned NOT NULL,
  `areaPredio` decimal(11,2) NOT NULL,
  `longitudPredio` decimal(11,6) NOT NULL,
  `latitudPredio` decimal(11,6) NOT NULL,
  `altitudPredio` decimal(11,2) NOT NULL,
  `departamento_id` int(10) unsigned NOT NULL,
  `municipio_id` int(10) unsigned NOT NULL,
  `vereda_id` int(10) unsigned NOT NULL,
  `resguardo_id` int(10) unsigned NOT NULL,
  `posesion_id` int(10) unsigned NOT NULL,
  `distanciaAlLote` decimal(11,2) NOT NULL,
  `distanciaLoteVia` decimal(11,2) NOT NULL,
  `coordenadasFinca` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fincas_productor_id_foreign` (`productor_id`),
  KEY `fincas_linea_id_foreign` (`linea_id`),
  KEY `fincas_departamento_id_foreign` (`departamento_id`),
  KEY `fincas_municipio_id_foreign` (`municipio_id`),
  KEY `fincas_vereda_id_foreign` (`vereda_id`),
  KEY `fincas_resguardo_id_foreign` (`resguardo_id`),
  KEY `fincas_posesion_id_foreign` (`posesion_id`),
  CONSTRAINT `fincas_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `fincas_linea_id_foreign` FOREIGN KEY (`linea_id`) REFERENCES `lineas` (`id`),
  CONSTRAINT `fincas_municipio_id_foreign` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`),
  CONSTRAINT `fincas_posesion_id_foreign` FOREIGN KEY (`posesion_id`) REFERENCES `posesions` (`id`),
  CONSTRAINT `fincas_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`),
  CONSTRAINT `fincas_resguardo_id_foreign` FOREIGN KEY (`resguardo_id`) REFERENCES `resguardos` (`id`),
  CONSTRAINT `fincas_vereda_id_foreign` FOREIGN KEY (`vereda_id`) REFERENCES `veredas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fincas`
--

LOCK TABLES `fincas` WRITE;
/*!40000 ALTER TABLE `fincas` DISABLE KEYS */;
INSERT INTO `fincas` VALUES (1,'Finca Julian Silva',5,1,500.00,-76.890000,3.141600,500.00,1,1,6,2,2,500.00,500.00,'coord','2020-12-07 22:22:34','2020-12-10 09:01:14'),(2,'El rancho',13,1,3000.00,-76.150000,3.140000,3000.00,1,1,1,1,1,100.00,300.00,'gg','2020-12-22 13:38:55','2020-12-22 13:38:55'),(3,'El ROBLE',5,1,300.00,-76.310000,3.141600,2980.00,1,1,1,1,1,100.00,500.00,'gg','2020-12-22 16:10:02','2020-12-22 16:10:02');
/*!40000 ALTER TABLE `fincas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fincascoms`
--

DROP TABLE IF EXISTS `fincascoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fincascoms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productor_id` int(10) unsigned NOT NULL,
  `fechaRegistro` date NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` int(10) unsigned NOT NULL,
  `municipio_id` int(10) unsigned NOT NULL,
  `vereda_id` int(10) unsigned NOT NULL,
  `areaTotal` decimal(11,2) NOT NULL,
  `viasAcceso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitud` decimal(11,6) NOT NULL,
  `longitud` decimal(11,6) NOT NULL,
  `altitud` decimal(11,2) NOT NULL,
  `posesion_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fincascoms_productor_id_foreign` (`productor_id`),
  KEY `fincascoms_departamento_id_foreign` (`departamento_id`),
  KEY `fincascoms_municipio_id_foreign` (`municipio_id`),
  KEY `fincascoms_vereda_id_foreign` (`vereda_id`),
  KEY `fincascoms_posesion_id_foreign` (`posesion_id`),
  CONSTRAINT `fincascoms_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `fincascoms_municipio_id_foreign` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`),
  CONSTRAINT `fincascoms_posesion_id_foreign` FOREIGN KEY (`posesion_id`) REFERENCES `posesions` (`id`),
  CONSTRAINT `fincascoms_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `componentesocialproductors` (`id`),
  CONSTRAINT `fincascoms_vereda_id_foreign` FOREIGN KEY (`vereda_id`) REFERENCES `veredascoms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fincascoms`
--

LOCK TABLES `fincascoms` WRITE;
/*!40000 ALTER TABLE `fincascoms` DISABLE KEYS */;
INSERT INTO `fincascoms` VALUES (2,'Prueba',36,'2021-04-01','3015562152',22,1,5,11.00,'Carretera',3.140000,-76.340000,100.00,1,'2021-04-11 19:56:57','2021-04-11 21:35:34'),(3,'eduardoCasa',40,'2021-05-04','4323232',22,1,10,33.00,'Mar',3.143100,-76.320000,2111.00,2,'2021-05-24 16:52:43','2021-05-24 16:52:43');
/*!40000 ALTER TABLE `fincascoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpxs`
--

DROP TABLE IF EXISTS `gpxs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpxs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `latitud` decimal(20,19) NOT NULL,
  `longitud` decimal(21,19) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gpxs_productor_id_foreign` (`productor_id`),
  KEY `gpxs_finca_id_foreign` (`finca_id`),
  CONSTRAINT `gpxs_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `gpxs_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpxs`
--

LOCK TABLES `gpxs` WRITE;
/*!40000 ALTER TABLE `gpxs` DISABLE KEYS */;
INSERT INTO `gpxs` VALUES (1,5,1,3.4295550000000000000,-76.5242060000000000000,'2020-12-30 04:56:06','2020-12-30 04:56:06'),(2,5,1,3.4495550000000000000,-76.5242060000000000000,'2020-12-30 04:56:10','2020-12-30 04:56:10'),(3,5,3,3.4298150000000000000,-76.5248020000000000000,'2021-01-18 15:26:37','2021-01-18 15:26:37'),(4,5,3,3.4295550000000000000,-76.5242060000000000000,'2021-01-18 20:10:29','2021-01-18 20:10:29'),(5,5,3,3.4295550000000000000,-76.5242060000000000000,'2021-01-18 20:18:03','2021-01-18 20:18:03');
/*!40000 ALTER TABLE `gpxs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradoescolaridads`
--

DROP TABLE IF EXISTS `gradoescolaridads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradoescolaridads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gradoescolaridads_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradoescolaridads`
--

LOCK TABLES `gradoescolaridads` WRITE;
/*!40000 ALTER TABLE `gradoescolaridads` DISABLE KEYS */;
INSERT INTO `gradoescolaridads` VALUES (1,'Primaria Incompleta','2020-12-07 22:04:31','2020-12-07 22:04:31'),(2,'Primaria','2020-12-07 22:04:31','2020-12-07 22:04:31'),(3,'Bachiller Incompleto','2020-12-07 22:04:31','2020-12-07 22:04:31'),(4,'Bachiller','2020-12-07 22:04:32','2020-12-07 22:04:32'),(5,'Tecnico Incompleto','2020-12-07 22:04:32','2020-12-07 22:04:32'),(6,'Tecnico','2020-12-07 22:04:32','2020-12-07 22:04:32'),(7,'Tecnologo Incompleto','2020-12-07 22:04:32','2020-12-07 22:04:32'),(8,'Tecnologo','2020-12-07 22:04:32','2020-12-07 22:04:32'),(9,'Universitario Incompleto','2020-12-07 22:04:32','2020-12-07 22:04:32'),(10,'Universitario','2020-12-07 22:04:32','2020-12-07 22:04:32');
/*!40000 ALTER TABLE `gradoescolaridads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laborcultivos`
--

DROP TABLE IF EXISTS `laborcultivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laborcultivos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `control` int(10) unsigned NOT NULL,
  `metodo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacionMetodo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poda_id` int(10) unsigned NOT NULL,
  `observacionPoda` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drenaje` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` int(10) unsigned NOT NULL,
  `fertilizacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fertilizacionTiempo` int(11) NOT NULL,
  `financiacion_id` int(10) unsigned NOT NULL,
  `frecuenciaFertilizacion` int(11) NOT NULL,
  `controlEnfermedades` int(10) unsigned NOT NULL,
  `tipoControlEnfermedad` int(10) unsigned NOT NULL,
  `observacionEnfermedad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `controlPlagas` int(10) unsigned NOT NULL,
  `tipoControlPlagas` int(10) unsigned NOT NULL,
  `observacionPlaga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laborcultivos_productor_id_foreign` (`productor_id`),
  KEY `laborcultivos_finca_id_foreign` (`finca_id`),
  KEY `laborcultivos_control_foreign` (`control`),
  KEY `laborcultivos_poda_id_foreign` (`poda_id`),
  KEY `laborcultivos_estado_id_foreign` (`estado_id`),
  KEY `laborcultivos_financiacion_id_foreign` (`financiacion_id`),
  KEY `laborcultivos_controlenfermedades_foreign` (`controlEnfermedades`),
  KEY `laborcultivos_tipocontrolenfermedad_foreign` (`tipoControlEnfermedad`),
  KEY `laborcultivos_controlplagas_foreign` (`controlPlagas`),
  KEY `laborcultivos_tipocontrolplagas_foreign` (`tipoControlPlagas`),
  CONSTRAINT `laborcultivos_control_foreign` FOREIGN KEY (`control`) REFERENCES `opcions` (`id`),
  CONSTRAINT `laborcultivos_controlenfermedades_foreign` FOREIGN KEY (`controlEnfermedades`) REFERENCES `opcions` (`id`),
  CONSTRAINT `laborcultivos_controlplagas_foreign` FOREIGN KEY (`controlPlagas`) REFERENCES `opcions` (`id`),
  CONSTRAINT `laborcultivos_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estadocultivos` (`id`),
  CONSTRAINT `laborcultivos_financiacion_id_foreign` FOREIGN KEY (`financiacion_id`) REFERENCES `financiacions` (`id`),
  CONSTRAINT `laborcultivos_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincascoms` (`id`),
  CONSTRAINT `laborcultivos_poda_id_foreign` FOREIGN KEY (`poda_id`) REFERENCES `tipospodas` (`id`),
  CONSTRAINT `laborcultivos_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `componentesocialproductors` (`id`),
  CONSTRAINT `laborcultivos_tipocontrolenfermedad_foreign` FOREIGN KEY (`tipoControlEnfermedad`) REFERENCES `tipocontrols` (`id`),
  CONSTRAINT `laborcultivos_tipocontrolplagas_foreign` FOREIGN KEY (`tipoControlPlagas`) REFERENCES `tipocontrols` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laborcultivos`
--

LOCK TABLES `laborcultivos` WRITE;
/*!40000 ALTER TABLE `laborcultivos` DISABLE KEYS */;
INSERT INTO `laborcultivos` VALUES (1,36,2,1,'Quimico','obs',2,'obs','Ambos',2,'Organica',3,1,1,1,1,'as',1,3,'as','2021-04-12 06:35:00','2021-04-12 06:38:44');
/*!40000 ALTER TABLE `laborcultivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineas`
--

DROP TABLE IF EXISTS `lineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lineas_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineas`
--

LOCK TABLES `lineas` WRITE;
/*!40000 ALTER TABLE `lineas` DISABLE KEYS */;
INSERT INTO `lineas` VALUES (1,'Mora',NULL,NULL);
/*!40000 ALTER TABLE `lineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugarventas`
--

DROP TABLE IF EXISTS `lugarventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lugarventas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lugarventas_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugarventas`
--

LOCK TABLES `lugarventas` WRITE;
/*!40000 ALTER TABLE `lugarventas` DISABLE KEYS */;
INSERT INTO `lugarventas` VALUES (1,'FLOR MINOTA ( KM - 35)',NULL,'2021-03-08 04:18:35'),(2,'ANDREA VALENCIA ( NUEVA VISTA)',NULL,'2021-03-08 04:18:43'),(3,'DAGOBERTO MAIRONGO ( ROSARIO)',NULL,'2021-03-08 04:18:50'),(5,'BOLIVAR CAICEDO ( PAMBIL)',NULL,'2021-03-08 04:18:58'),(6,'MARYURI VALENCIA (TABLON DULCE)',NULL,'2021-03-08 04:19:05'),(8,'MARCIAL  CUERO  ( IMBILPI)','2021-03-08 04:19:11','2021-03-08 04:19:11'),(9,'AIDA GUERRERO ( ALTO PALMARREAL)','2021-03-08 04:19:22','2021-03-08 04:19:22'),(10,'ROSA MONTAÑO ( PINDALES)','2021-03-08 04:19:28','2021-03-08 04:19:28'),(11,'YAMILETH CORTES ( PINDALES)','2021-03-08 04:19:34','2021-03-08 04:19:34'),(12,'HECTOR CACHINGRE ( BAJO MIRA)','2021-03-08 04:19:43','2021-03-08 04:19:43'),(13,'CARLOS PRECIADO ( PEÑA COLORADA)','2021-03-08 04:31:36','2021-03-08 04:31:36'),(14,'JORGE ( CHAJAL )','2021-03-08 04:31:42','2021-03-08 04:31:42'),(15,'ORFA TARAZONA ( CARRETERA)','2021-03-08 04:31:49','2021-03-08 04:31:49'),(16,'AQUILINO ( CAUNAPI KM-60)','2021-03-08 04:32:01','2021-03-08 04:32:01'),(17,'ARABELLA (TUMACO)','2021-03-08 04:32:07','2021-03-08 04:32:07'),(18,'XIOMARA LANDAZURI ( CANDELILLA)','2021-03-08 04:32:12','2021-03-08 04:32:12'),(19,'MARLEN BOYA ( TABLON DULCE)','2021-03-08 04:32:18','2021-03-08 04:32:18'),(20,'NICOLA ANGULO  ( TUMACO)','2021-03-08 04:32:23','2021-03-08 04:32:23'),(21,'Otro','2021-03-17 15:52:46','2021-03-17 15:52:46');
/*!40000 ALTER TABLE `lugarventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manejoambientals`
--

DROP TABLE IF EXISTS `manejoambientals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manejoambientals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `distanciaFuentes` int(10) unsigned NOT NULL,
  `residuo_id` int(10) unsigned NOT NULL,
  `erosion` int(10) unsigned NOT NULL,
  `proteccion` int(10) unsigned NOT NULL,
  `agroquimico` int(10) unsigned NOT NULL,
  `fauna` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manejoambientals_productor_id_foreign` (`productor_id`),
  KEY `manejoambientals_finca_id_foreign` (`finca_id`),
  KEY `manejoambientals_distanciafuentes_foreign` (`distanciaFuentes`),
  KEY `manejoambientals_residuo_id_foreign` (`residuo_id`),
  KEY `manejoambientals_erosion_foreign` (`erosion`),
  KEY `manejoambientals_proteccion_foreign` (`proteccion`),
  KEY `manejoambientals_agroquimico_foreign` (`agroquimico`),
  KEY `manejoambientals_fauna_foreign` (`fauna`),
  CONSTRAINT `manejoambientals_agroquimico_foreign` FOREIGN KEY (`agroquimico`) REFERENCES `opcions` (`id`),
  CONSTRAINT `manejoambientals_distanciafuentes_foreign` FOREIGN KEY (`distanciaFuentes`) REFERENCES `opcions` (`id`),
  CONSTRAINT `manejoambientals_erosion_foreign` FOREIGN KEY (`erosion`) REFERENCES `opcions` (`id`),
  CONSTRAINT `manejoambientals_fauna_foreign` FOREIGN KEY (`fauna`) REFERENCES `opcions` (`id`),
  CONSTRAINT `manejoambientals_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincascoms` (`id`),
  CONSTRAINT `manejoambientals_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `componentesocialproductors` (`id`),
  CONSTRAINT `manejoambientals_proteccion_foreign` FOREIGN KEY (`proteccion`) REFERENCES `opcions` (`id`),
  CONSTRAINT `manejoambientals_residuo_id_foreign` FOREIGN KEY (`residuo_id`) REFERENCES `residuossolidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manejoambientals`
--

LOCK TABLES `manejoambientals` WRITE;
/*!40000 ALTER TABLE `manejoambientals` DISABLE KEYS */;
INSERT INTO `manejoambientals` VALUES (1,36,2,1,2,1,1,2,1,'2021-04-12 15:22:55','2021-04-12 15:25:48');
/*!40000 ALTER TABLE `manejoambientals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimientoplantacions`
--

DROP TABLE IF EXISTS `mantenimientoplantacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantenimientoplantacions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mantenimientoplantacions_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimientoplantacions`
--

LOCK TABLES `mantenimientoplantacions` WRITE;
/*!40000 ALTER TABLE `mantenimientoplantacions` DISABLE KEYS */;
INSERT INTO `mantenimientoplantacions` VALUES (1,'Poda','2021-04-11 15:53:12','2021-04-11 15:53:12'),(2,'Drenaje','2021-04-11 15:53:12','2021-04-11 15:53:12'),(3,'Sombrio','2021-04-11 15:53:12','2021-04-11 15:53:12'),(4,'Fertilizacion','2021-04-11 15:53:12','2021-04-11 15:53:12'),(5,'Enmalezado','2021-04-11 15:53:12','2021-04-11 15:53:12'),(6,'Fitosanitario','2021-04-11 15:53:12','2021-04-11 15:53:12');
/*!40000 ALTER TABLE `mantenimientoplantacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_aplicaciones`
--

DROP TABLE IF EXISTS `metodo_aplicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodo_aplicaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `metodo_aplicaciones_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_aplicaciones`
--

LOCK TABLES `metodo_aplicaciones` WRITE;
/*!40000 ALTER TABLE `metodo_aplicaciones` DISABLE KEYS */;
INSERT INTO `metodo_aplicaciones` VALUES (1,'Aspercion foliar','2020-12-16 19:36:23','2020-12-16 19:36:23'),(2,'Drench','2020-12-16 19:36:23','2020-12-16 19:36:23');
/*!40000 ALTER TABLE `metodo_aplicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_100000_create_password_resets_table',1),(2,'2020_10_20_163925_create_categorias_table',1),(3,'2020_10_21_194417_create_articulos_table',1),(4,'2020_11_27_132839_create_asofrut_core',1),(5,'2020_12_02_034407_create_roles_table',1),(6,'2020_12_03_000000_create_users_table',1),(8,'2020_12_15_153538_create_encuesta_fitosanitaria',2),(9,'2020_12_19_184847_create_encuesta_asofrut',3),(10,'2020_12_21_031155_create_caracterizacion',4),(12,'2020_12_29_180038_create_gpx_upload',5),(15,'2021_03_04_110723_update_enfermedades',7),(20,'2021_02_10_091513_create_enfermedades',8),(21,'2021_03_22_141056_create_comcacaot_core',9),(22,'2021_04_10_170305_create_fincas_core',10),(24,'2021_04_13_202903_create_ventas_comcacaot',11),(25,'2021_04_14_064330_create_visitas',12);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `municipios_nombre_unique` (`nombre`),
  KEY `municipios_departamento_id_foreign` (`departamento_id`),
  CONSTRAINT `municipios_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,'TUMACO',22,'2020-12-07 22:04:34','2020-12-07 22:04:34');
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricions`
--

DROP TABLE IF EXISTS `nutricions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `analisis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaAnalisis` date DEFAULT NULL,
  `fertilizaAnalisis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aplicacionesCal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aplicoSiembraCal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dosisAplicacionCal` decimal(11,2) DEFAULT NULL,
  `formaAplicacionCal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaAplicacionCal` int(11) DEFAULT NULL,
  `fechaCal` date DEFAULT NULL,
  `aplicacionesMateriaOrganica` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aplicoSiembraMateriaOrganica` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dosisAplicacionMateriaOrganica` decimal(11,2) DEFAULT NULL,
  `formaAplicacionMateriaOrganica` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaAplicacionMateriaOrganica` int(11) DEFAULT NULL,
  `fechaMateriaOrganica` date DEFAULT NULL,
  `fechaUltimaFertilizacion` date DEFAULT NULL,
  `formaAplicacionFert` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaAplicacionFert` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nutricions_productor_id_foreign` (`productor_id`),
  KEY `nutricions_finca_id_foreign` (`finca_id`),
  CONSTRAINT `nutricions_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `nutricions_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricions`
--

LOCK TABLES `nutricions` WRITE;
/*!40000 ALTER TABLE `nutricions` DISABLE KEYS */;
INSERT INTO `nutricions` VALUES (1,5,1,'Si','2020-12-02','Si','Si','Si',5.00,'Plato',3,'2020-12-08','Si','No',3.00,'Plato',2,'2020-12-02','2020-12-08','Liquida',3,'2020-12-26 18:36:54','2020-12-26 18:36:54');
/*!40000 ALTER TABLE `nutricions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcions`
--

DROP TABLE IF EXISTS `opcions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opcions_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcions`
--

LOCK TABLES `opcions` WRITE;
/*!40000 ALTER TABLE `opcions` DISABLE KEYS */;
INSERT INTO `opcions` VALUES (1,'SI','2021-03-27 14:14:03','2021-03-27 14:14:03'),(2,'NO','2021-03-27 14:14:03','2021-03-27 14:14:03');
/*!40000 ALTER TABLE `opcions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parentescos`
--

DROP TABLE IF EXISTS `parentescos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parentescos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parentescos_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parentescos`
--

LOCK TABLES `parentescos` WRITE;
/*!40000 ALTER TABLE `parentescos` DISABLE KEYS */;
INSERT INTO `parentescos` VALUES (1,'Conyuge','2021-03-27 14:14:04','2021-03-27 14:14:04'),(2,'Suegro','2021-03-27 14:14:04','2021-03-27 14:14:04'),(3,'Hijo','2021-03-27 14:14:05','2021-03-27 14:14:05'),(4,'Abuelo','2021-03-27 14:14:05','2021-03-27 14:14:05'),(5,'Hermano','2021-03-27 14:14:05','2021-03-27 14:14:05'),(6,'Otro','2021-03-27 14:14:05','2021-03-27 14:14:05');
/*!40000 ALTER TABLE `parentescos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_id` int(10) unsigned NOT NULL,
  `num_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personas_nombre_unique` (`nombre`),
  KEY `personas_tipo_id_foreign` (`tipo_id`),
  CONSTRAINT `personas_tipo_id_foreign` FOREIGN KEY (`tipo_id`) REFERENCES `tipoids` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Admin',1,'1107090570','cll 123','3015562152','admin@sistemas.com',NULL,NULL),(2,'Admin Sistemas',1,'1006017055','cra 26 #17-31','3015562152','admin@sistemas.com','2020-12-07 22:15:15','2020-12-07 22:15:15'),(3,'Extensionista',1,'1006017055','cll 23 #12-50','3103861474','extensionista@asofrut.org','2020-12-07 22:16:25','2020-12-07 22:16:25'),(4,'Comercial',1,'1110678909','cll 123','42412412','comercial@asofrut.org','2020-12-07 22:17:28','2020-12-07 22:17:28'),(5,'Productor',1,'1006017055','cll 120','3305890','productor@asofrut.org','2020-12-07 22:18:51','2020-12-10 09:37:12'),(6,'Pedro Perez',1,'1107090570','cll 10','3306789','pedro@gmail.com','2020-12-10 09:36:39','2020-12-10 09:36:39'),(13,'lola',1,'124124','cll 1233','24235232','lola@gmail.com','2020-12-10 10:35:51','2020-12-10 10:35:51'),(22,'Juan Perez',1,'1107090541','cll 123','3389012','juan@hotmail.com','2020-12-12 00:47:21','2020-12-12 00:47:21'),(23,'Productor Ejemplo',2,'1006017055','cll 123','33090412','ejemplo@gmail.com','2020-12-12 02:29:30','2020-12-12 03:01:15'),(24,'Contador',1,'1107090212','cll 124','3305678','contador@asofrut.org','2020-12-22 17:00:49','2020-12-22 17:00:49'),(35,'asdad',1,'3212421','3015562152','3015562152','juliansilva95@hotmail.com','2021-04-01 01:36:58','2021-04-01 01:36:58'),(36,'Prueba',1,'1241242','4235235','4235235','juan@gmail.com','2021-04-05 14:58:24','2021-04-05 14:58:24'),(37,'aaa',1,'1535325','3523532','3523532','julian@mail.com','2021-04-05 15:56:41','2021-04-05 15:56:41'),(38,'probando',1,'1107950432','3015562152','3015562152','juliansilva95@hotmail.com','2021-04-05 20:00:58','2021-04-05 20:00:58'),(40,'Eduardo Luis',1,'1241241','3155644407','3155644407','Millansantiago15@gmail.com','2021-04-05 20:30:26','2021-04-05 20:30:26');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plagas`
--

DROP TABLE IF EXISTS `plagas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plagas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `monitoreo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaMonitoreo` int(11) DEFAULT NULL,
  `perlaTierra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoManejoPerla` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaAplicacionPerla` int(11) DEFAULT NULL,
  `barrenadorCultivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoManejoBarrenador` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaAplicacionBarrenador` int(11) DEFAULT NULL,
  `tripsCultivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoManejoTrips` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaAplicacionTrips` int(11) DEFAULT NULL,
  `afidiosCultivos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoManejoAfidios` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaAplicacionAfidios` int(11) DEFAULT NULL,
  `acarosCultivos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoManejoAcaros` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaAplicacionAcaros` int(11) DEFAULT NULL,
  `cochinillaCultivos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoManejoCochinilla` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaAplicacionCochinilla` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plagas_productor_id_foreign` (`productor_id`),
  KEY `plagas_finca_id_foreign` (`finca_id`),
  CONSTRAINT `plagas_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `plagas_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plagas`
--

LOCK TABLES `plagas` WRITE;
/*!40000 ALTER TABLE `plagas` DISABLE KEYS */;
INSERT INTO `plagas` VALUES (1,5,1,'Si',3,'Si','Caldos minerales',3,'Si','Biologicos',3,'Si','Agroquimicos',1,'Si','Caldos minerales',2,'Si','Biologicos',2,'Si','Trampas',3,'2020-12-22 03:12:14','2020-12-22 03:12:14');
/*!40000 ALTER TABLE `plagas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `podas`
--

DROP TABLE IF EXISTS `podas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `podas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `estadoVegetativo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `podaFormacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `podaAclareo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaAclareo` int(11) DEFAULT NULL,
  `podaMantenimiento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaMantenimiento` int(11) DEFAULT NULL,
  `podaFitosanitaria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaFitosanitaria` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `podas_productor_id_foreign` (`productor_id`),
  KEY `podas_finca_id_foreign` (`finca_id`),
  CONSTRAINT `podas_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `podas_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `podas`
--

LOCK TABLES `podas` WRITE;
/*!40000 ALTER TABLE `podas` DISABLE KEYS */;
INSERT INTO `podas` VALUES (1,5,1,'Levante','Si','Si',2,'Si',3,'Si',3,'2020-12-21 23:27:35','2020-12-21 23:27:35');
/*!40000 ALTER TABLE `podas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posesions`
--

DROP TABLE IF EXISTS `posesions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posesions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posesions_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posesions`
--

LOCK TABLES `posesions` WRITE;
/*!40000 ALTER TABLE `posesions` DISABLE KEYS */;
INSERT INTO `posesions` VALUES (1,'Propia',NULL,NULL),(2,'Arrendada',NULL,NULL),(3,'Titulo Colectivo',NULL,NULL);
/*!40000 ALTER TABLE `posesions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practicas`
--

DROP TABLE IF EXISTS `practicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practicas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `vivenda` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viveSitio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bateriaSanitaria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pozoSeptico` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zonaBarbecho` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usaBarbecho` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agroquimicos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mezclaAgroquimicos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usaAgroquimicos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bodegaMateriales` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usaBodega` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canastillas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usaCanastillas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trajeProteccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usaTraje` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `puntoEcologico` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usaPuntoEcologico` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `botiquin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usaBotiquin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extintor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usaExtintor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacitacionesBPA` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificadas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institucionCertificado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `practicas_productor_id_foreign` (`productor_id`),
  KEY `practicas_finca_id_foreign` (`finca_id`),
  CONSTRAINT `practicas_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `practicas_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practicas`
--

LOCK TABLES `practicas` WRITE;
/*!40000 ALTER TABLE `practicas` DISABLE KEYS */;
INSERT INTO `practicas` VALUES (1,5,1,'Si','Si','Si','Si','Si','Si','Si','No','Si','No','No','Si','No','Si','No','Si','No','Si',NULL,'Si','Si','Si','Si','SENA',NULL,'2020-12-27 05:55:19','2020-12-27 05:55:19'),(2,5,1,'Si','Si','Si','Si','Si','Si','Si','No','No','Si','Si','No','Si','Si','No','Si','No','Si','Si','No','Si','Si','Si','Unicauca',NULL,'2020-12-27 06:03:32','2020-12-27 06:03:32'),(3,5,1,'Si','Si','Si','Si','No','No','Si','Si','Si','Si','No','Si','No','Si','No','Si','Si','No','No','Si','Si','Si','Si','sena',2,'2021-03-04 04:47:55','2021-03-04 04:47:55');
/*!40000 ALTER TABLE `practicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prediocultivos`
--

DROP TABLE IF EXISTS `prediocultivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prediocultivos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `areaSembradaPredio` decimal(11,2) NOT NULL,
  `fechaSiembra` date NOT NULL,
  `numeroPlantasTotales` int(11) DEFAULT NULL,
  `numeroPlantasProduccion` int(11) DEFAULT NULL,
  `plantasErradicadas` int(11) DEFAULT NULL,
  `plantasLevante` int(11) DEFAULT NULL,
  `TipoMora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vereda_id` int(10) unsigned DEFAULT NULL,
  `tipoReproduccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bolsa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prediocultivos_productor_id_foreign` (`productor_id`),
  KEY `prediocultivos_finca_id_foreign` (`finca_id`),
  KEY `prediocultivos_vereda_id_foreign` (`vereda_id`),
  CONSTRAINT `prediocultivos_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `prediocultivos_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`),
  CONSTRAINT `prediocultivos_vereda_id_foreign` FOREIGN KEY (`vereda_id`) REFERENCES `veredas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prediocultivos`
--

LOCK TABLES `prediocultivos` WRITE;
/*!40000 ALTER TABLE `prediocultivos` DISABLE KEYS */;
INSERT INTO `prediocultivos` VALUES (1,5,1,112.00,'2020-12-02',11,23,33,11,'Con espinas',1,'prueba','Si','2020-12-21 22:22:02','2020-12-21 22:22:02'),(2,5,3,112.00,'2020-12-02',11,23,33,11,'Con espinas',1,'prueba','Si','2021-02-03 02:05:52','2021-02-03 02:05:52'),(3,13,2,112.00,'2020-12-02',11,23,33,11,'Con espinas',1,'prueba','Si','2021-02-16 09:06:30','2021-02-16 09:06:30');
/*!40000 ALTER TABLE `prediocultivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_fitosanitarios`
--

DROP TABLE IF EXISTS `producto_fitosanitarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_fitosanitarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `producto_fitosanitarios_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_fitosanitarios`
--

LOCK TABLES `producto_fitosanitarios` WRITE;
/*!40000 ALTER TABLE `producto_fitosanitarios` DISABLE KEYS */;
INSERT INTO `producto_fitosanitarios` VALUES (1,'ABAFED 18EC','2020-12-16 19:29:46','2021-01-21 12:06:13'),(2,'ACAEMIC  ','2020-12-16 19:29:46','2020-12-16 19:29:46'),(3,'ACARISTOP SC  ','2020-12-16 19:29:46','2020-12-16 19:29:46'),(4,'ACORBAT MZ 69%W.P  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(5,'ACTARA 25 WG  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(6,'ACTELLIC 50 EC  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(7,'ACUAFIN 440 EW  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(8,'AFUGAN 30 EC  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(9,'AGENT-48 EC  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(10,'AGRIDOR 350 EC  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(11,'AGRIFOS SL  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(12,'AGRIMEC 1.8% CE  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(13,'AGRIXON EC  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(14,'AGRODYNE SL  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(15,'AGROMETOX E-40 EC  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(16,'AGROMIDOR 60 SL  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(17,'AGROMIFOS 600 SL  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(18,'AGROPER 250 E.C.  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(19,'AGROPYRIFOS 480 EC  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(20,'AGROTOX 58.8% WP  ','2020-12-16 19:29:47','2020-12-16 19:29:47'),(23,'AGROZIM 50 WP  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(24,'AGROZIM 500 SC  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(25,'AGROZUL 720 SC  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(26,'ALARM SC  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(27,'ALEF 600 SL  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(28,'ALFA POINT 10 EC  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(29,'ALGODONERO 630 UL  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(30,'ALIETTE 80 WP  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(31,'ALSYSTIN SC 480  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(32,'ALSYSTIN WP 25  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(33,'ALTIMA 500 SC  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(34,'ALTO SL  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(35,'ALTO 100 SL  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(36,'AMIDOR 60 SL  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(37,'AMIFED 200 EC  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(38,'AMISTAR 250 SC  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(39,'AMISTAR 50 WG  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(40,'ANTRACOL WP 70  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(41,'ANVIL 250 SC  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(42,'ANVIL 5SC  ','2020-12-16 19:32:06','2020-12-16 19:32:06'),(43,'APACHE 20 EC  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(44,'ARCADO SC 150  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(45,'ARCADO SC 300  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(46,'ARRIERAFIN 2% DP  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(47,'ARRIERO 2.5 DP  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(48,'ARRIVO 200 EC  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(49,'ATABRON  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(50,'ATHRIN 50 EC  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(51,'ATILON 600 SL  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(52,'ATTA-KILL  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(53,'AVAUNT WG  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(54,'AVISO WG  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(55,'AVOID 1.8% EC  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(56,'AZODRIN 400 SL  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(57,'AZODRIN 600 SL  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(58,'AZUCO  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(59,'AZUFRE 720  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(60,'BAMBOLERO 3% GR  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(61,'BAMBUCO  3% DP  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(62,'BANKIT 25 SC  ','2020-12-16 19:32:07','2020-12-16 19:32:07'),(63,'BASUDIN 600 EC  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(64,'BAVISTIN WP  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(65,'BAYCOR DC 300  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(66,'BAYFIDAN DC 250  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(67,'BAYLETON EC 250  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(68,'BAYLETON GR 1%  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(69,'BAYLETON WP 25  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(70,'BAYTAN DS 15  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(71,'BAYTHION EC 500  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(72,'BAYTROID TM SL 525  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(73,'BAYTROIDE EC 050  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(74,'BAITROIDE EC 100  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(75,'BELLKUTE 30 SC  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(76,'BELLKUTE 40 WP  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(77,'BELMARK 30 EC  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(78,'BENOAGRO 50 WP  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(79,'BENOMYL 50 WP AGRICENSE  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(80,'BENOMYL CELLS 50 WP  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(81,'BENOMYL 50 WP ECIFONPA  ','2020-12-16 19:32:08','2020-12-16 19:32:08'),(82,'BENOMYL 50 WP LIMOR  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(83,'BENOPOINT 50 WP  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(84,'BETA - BAYTROIDE SC 125  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(85,'BEZIL 50 WP  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(86,'BIM 75 WP  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(87,'BIRLANE 240 EC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(88,'BOLIDO SC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(89,'BOLSTAR EC 720  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(90,'BORNEO 11 SC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(91,'BRAVO 2787 W-75  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(92,'BRAVO 500 SC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(93,'BRAVO 75 WP  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(94,'BRAVO S SC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(95,'BRAVONIL 720 SC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(96,'BRAVONIL 500 SC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(97,'BRAVONIL 720 SC COLJAP  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(98,'BRAVONIL 825 WG  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(99,'BRESTANID 500 SC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(100,'BRODIONE SC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(101,'BULLDOCK EC 025  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(102,'BULLDOCK SC 025  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(103,'BUMPER 25 EC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(104,'CABO SC 500  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(105,'CALIDAN SC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(106,'CALIXIN EC  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(107,'CAPTAM 50% PROFICOL WP  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(108,'CAPTAN 50 WP FERSAGRO  ','2020-12-16 19:32:09','2020-12-16 19:32:09'),(109,'CARAMBA 90 SL  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(110,'CARBARYL INVEQUIMICA  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(111,'CARBENDACROP 500 SC  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(112,'CARBENDAZIM  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(113,'CARBENDAZIM FEDEARROZ  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(114,'CARBENDAZIM CROPTECH 50  WP  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(115,'CARBENDAZIM CROPTECH 500 SC  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(116,'CARBENDAZIM DUPONT  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(117,'CARBENDAZIM POINT 50 WP  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(118,'CARBENDAZIM POINT 500 SC  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(119,'CARBIN 50 WP  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(120,'CARBIN 500 SC  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(121,'CARBOFED 3 GR  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(122,'CARBOFED 330 SC  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(123,'CARBOFURAN 3 G QUIMOR  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(124,'CARBOFURAN 3GR  ','2020-12-16 19:32:10','2020-12-16 19:32:10'),(125,'CARBOFURAN 330 SC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(126,'CARBOFURAN AGROGEN 330 SC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(127,'CARBOGROZ 3 GR  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(128,'CARBOGROZ 330 SC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(129,'CARBOTER 330 SC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(130,'CARBOTOX 330 SC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(131,'CASCADE DC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(132,'CATOMBE 2.8% CE  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(133,'CAZADOR 80 WG  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(134,'CALEST 025 FS  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(135,'CENTAURO 720 SC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(136,'CHAMP SC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(137,'CHAMPION WP  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(138,'CHLORPYRIFOS AGROGEN 480% EC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(139,'CIPERMETRINA AGROGEN 200 EC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(140,'CIROMEX 75 WP  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(141,'CITROEMULSION  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(142,'CLORFOS 2.5 DP  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(143,'CLORFOS 48 EC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(144,'CLOROTALONIL 500 FW MORE  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(145,'CLOROTALONIL 75 WP LIMOR  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(146,'CLORPIRICOL 4 EC  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(147,'CLORPIRIFOS 48 EC ECIFONPA  ','2020-12-16 19:32:11','2020-12-16 19:32:11'),(148,'CLORPIRIGROZ 480 EC  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(149,'CLORTOCAFFARO 500 SC  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(150,'CLORTOCAFFARO 75 WP  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(151,'CLOROSIP 720 SC  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(152,'COBRETHANE  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(153,'COLIMYL 50 WP  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(154,'COLIZYM 500 SC  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(155,'CONFIDOR SC 350  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(156,'CONFIRM  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(157,'CONTROL - S  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(158,'CONTROL 500 SC  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(159,'CONTROL 720 SC  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(160,'CONTROL 75% WP  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(161,'COPER PRO 40 WG  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(162,'COPPER FLOW 24 SC  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(163,'COPPER PRO 28 WG  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(164,'COSMO OIL EMULSION EO  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(165,'COTNIO - METHIL 20 SC  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(166,'COUNTER 10 G  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(167,'COUNTER 10% G  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(168,'COUNTER FC 16 GR  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(169,'CRASTAN EC  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(170,'CROPTHION EC  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(171,'CRYZUFRE 720  ','2020-12-16 19:32:12','2020-12-16 19:32:12'),(172,'CUPROZATE  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(173,'CURACARB 50 WP  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(174,'CURACARB 500 SC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(175,'CURACRON 500 EC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(176,'CURATER GR 10  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(177,'CURATER GR 3  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(178,'CURATER GR 5  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(179,'CURATER SC 330  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(180,'CURATHANE  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(181,'CURAXIL  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(182,'CURZATE M-8  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(183,'CYCO  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(184,'CYMBUSH EC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(185,'CYMOGRIZEB CM-8  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(186,'CYPERMON EC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(187,'CYPERWEST 20 EC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(188,'DACONIL 500 SC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(189,'DACONIL 720 SC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(190,'DACONIL 825 WG  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(191,'DACONIL S SC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(192,'DALE 2.5 DP  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(193,'DALE 48 EC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(194,'DANITOL 10 EC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(195,'DART 15 SC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(196,'DECIS 2.5 EC  ','2020-12-16 19:32:13','2020-12-16 19:32:13'),(197,'DELSENE M-200  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(198,'DELTAPOINT 2.5 WP  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(199,'DEROSAL 60 WP  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(200,'ANVIL 5 SC  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(201,'DETRIN 2.5 EC  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(202,'DHIMEFO 4% DP  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(203,'DIAZINON 600 FEDEARROZ EC  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(204,'DIAZINON PROFICOL 60 EC  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(205,'DIAZOL EC  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(206,'DICLAN 500 SC  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(207,'DIMETOX E-40 EC  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(208,'DIMILIN 25% WP  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(209,'DIMILIN SC 48%  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(210,'DIPTEREX SL 500  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(211,'DIPTEREX SP 80  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(212,'DITHANE F-448 SC  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(213,'DITHANE F-MB  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(214,'DITHANE M-45  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(215,'DITHANE M-45 WP NT  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(216,'DOMARK 40 EW  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(217,'DOMINEX 10 EC  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(218,'DOS BANG 2.5 DP  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(219,'DOS BANG 48 EC  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(220,'DUETT SC  ','2020-12-16 19:32:14','2020-12-16 19:32:14'),(224,'DURSBAN 50 WP  ','2020-12-16 19:33:54','2020-12-16 19:33:54'),(225,'DUTER 20 %  ','2020-12-16 19:33:54','2020-12-16 19:33:54'),(226,'DYSISTON GR 5  ','2020-12-16 19:33:54','2020-12-16 19:33:54'),(227,'ECHO 720 SC  ','2020-12-16 19:33:54','2020-12-16 19:33:54'),(228,'ECIMETRINA 20 EC  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(229,'EFECTRINA 200   ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(230,'ELANCRON 60 SL  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(231,'ELOCROP 720  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(232,'ELOSAL 720 SC  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(233,'ELSAN 50 EC  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(234,'ELTRA 48 EC  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(235,'EMERALD PRO SE  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(236,'ENGEO  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(237,'EPINGLE 10 EC  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(238,'EQUATION PRO  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(239,'ESCORT 30 EC  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(240,'ETRAM 50 WP  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(241,'EUPAREN WP 50  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(242,'EVISECT S  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(243,'FASTAC 10 EC  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(244,'FENOTHION 50 EC  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(245,'FENTOPEN 500 EC  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(246,'FERSACRON 60 SL  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(247,'FITORAZ WP 76  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(248,'FOLI-R-FOS 400 SL  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(249,'FOLICUR EC 250  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(250,'FOLICUR EW 250  ','2020-12-16 19:33:55','2020-12-16 19:33:55'),(251,'FOLIMAT SL 500  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(252,'FOLPAN 48 SC  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(253,'FOLPAN 80 WP  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(254,'FONGARID 25 WP  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(255,'FORE  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(256,'FORMAT 70 WP  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(257,'FORTUNE 5 SC  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(258,'FORUM 500 WP  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(259,'FOSETAL  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(260,'FOSFACRON 60 SL  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(261,'FOSFAMAG FT  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(262,'FOSFAMIN - A  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(263,'FUDIOLAN 40 EC  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(264,'FULGOR 20 EC  ','2020-12-16 19:33:56','2020-12-16 19:33:56'),(265,'FUNCLORAZ 40 EC  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(266,'FUNGAZIL 100 SL  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(267,'FUNGAZIL75 SP  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(268,'FUNGITANE 430 SC  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(269,'FUNGITANE 80 WP  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(270,'FUNLATE 50 WP  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(271,'FURADAN 10 GR  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(272,'FURADAN 3 SC  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(273,'FURADAN 4 SC  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(274,'FURADAN 5 GRANULADO  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(275,'FURALIMOR SC  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(276,'FURSEM SC  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(277,'GALBEN MZ - 10 - 48  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(278,'GASTION  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(279,'GAUCHO FS 600  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(280,'GOLDZIM 500 SC  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(281,'GRANIT SC  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(282,'GRIZEB 75WP  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(283,'GRIZEB 80 WP  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(284,'GROLAN WP  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(285,'GUSATHION EC 200  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(286,'HALMARK 10% EC  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(287,'HARPON 66 WP  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(288,'HELCOZEB 80 WP  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(289,'HELMISTIN 500 SC  ','2020-12-16 19:33:57','2020-12-16 19:33:57'),(290,'HELMOBEN 50 WP  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(291,'HELMOFOS 48 EC  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(292,'HELMONIL 500 SC  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(293,'HIDROXICUB 101 WP  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(294,'HINOSAN EC 500  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(295,'HORKIL  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(296,'HOSTATHION 1% GR  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(297,'HOSTATHION 2-1  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(298,'HOSTATHION 40 EC  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(299,'HYDRO FLOW 24 SC  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(300,'HYDRO PRO 35 WG  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(301,'HYPERKILL 25 EC  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(302,'IMIDACLOPRID OMA 350 SC  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(303,'INDAR 2 OF  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(304,'INDAR 50 OF  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(305,'INISAN 60 SL  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(306,'INITHION 50 EC  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(307,'INSECTRINA 20 EC  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(308,'INTREPID 2-F  ','2020-12-16 19:33:58','2020-12-16 19:33:58'),(309,'INVENTO WP 66.8  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(310,'INVEZEB 80 WP  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(311,'JADE WG 70  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(312,'K-OBIOL 25 EC  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(313,'K-OTHRINE ® SO SC   ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(314,'K-SIDOR 60 SL  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(315,'KANPAI 5% SC  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(316,'KARATE EC  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(317,'KARATE ZEON CS  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(318,'KASUMIN 2% SL  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(319,'KASUMIN - P  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(320,'KENDO  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(321,'KIMATIO SC  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(322,'KITAZIN 48 EC  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(323,'KOCIDE 101  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(324,'KOCIDE 2000 WG  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(325,'KUMULUS DF  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(326,'LANCERO 500 EC  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(327,'LANNATE 40 SP  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(328,'LANNATE SL  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(329,'LANZETA 48 EC  ','2020-12-16 19:33:59','2020-12-16 19:33:59'),(330,'LARVIN 375 SC  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(331,'LATIGO EC  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(332,'LEBAYCID EC 500  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(333,'LIMBER 15 WP  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(334,'LORSBAN 2.5% G  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(335,'LORSBAN 240 EC  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(336,'LORSBAN 4 EC  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(337,'MAESTRO 50% WP  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(338,'MAGESTIC 75% SP  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(339,'MAGNATE SULFATO 75 SP  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(340,'MAKIO 500 SC  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(341,'MALATHION 57 EC  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(342,'MALATHION LIMOR  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(343,'MANAZEB 80 WP QUIMOR  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(344,'MANCOLJAP WP 80%  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(345,'MANCOZEB 80  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(346,'MANCOZEB 80 WP  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(347,'MANCOZEB AGROGEN 430 SC  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(348,'MANCOZEB AGROGEN 80% WP  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(349,'MANCOZEB FEDEARROZ 430 SC  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(350,'MANCOZEB FEDEARROZ 80% WP  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(351,'MANCOZEB POINT 80 WP  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(352,'MANCROP 80 WP  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(353,'MANGRICEN 80 SC  ','2020-12-16 19:34:00','2020-12-16 19:34:00'),(354,'MANGRICEN 80 WP  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(355,'MANZATE 200 SC  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(356,'MANZATE 200 WG  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(357,'MANZATE 200 WP  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(358,'MANZATE OWS  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(359,'MANZATE SC  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(360,'MATCH 50 EC  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(361,'MAVRIK 2 EC  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(362,'MAVRIK AQUAFLOW  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(363,'MEDIFOS 600 SL  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(364,'MELTAFUN EC  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(365,'MERCAMIL CS 220  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(366,'MERPAN 48 SC  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(367,'MERPAN 80 WG  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(368,'MERTECT 20 SL  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(369,'MERTEC 500 SC  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(370,'MESUROL SC 500  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(371,'MESUROL WP 50  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(372,'METACAP 450 CS  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(373,'METACIDE EC 480  ','2020-12-16 19:34:01','2020-12-16 19:34:01'),(374,'METACROP 600 SL  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(375,'METAMIDOFOS 600 PROFICOL  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(376,'METAMIDOFOS POINT 60 SL  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(377,'METASYSTOX R EC 250  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(378,'METHAVIN 40 SP  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(379,'METHAVIN 90 SP  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(380,'METHION 48 EC  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(381,'METHOMEX 20 SL  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(382,'METIL PARATION PROFICOL EC  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(383,'METIL PARATION 48 EC  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(384,'METIL PARATION 48% EC  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(385,'MOETOMIL SL 216 BAYER  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(386,'MICROAZUFRE  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(387,'MICRORRIEGO INICIO   ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(388,'MICRORRIEGO PRODUCCION   ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(389,'MICRIRRIEGO MENORES   ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(390,'MICRORRIEGO CA-MG  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(391,'MICROTHIOL 80 WG  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(392,'MIDAS WG  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(393,'MILBEKNOCK 1 EC  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(394,'MILDEX WG  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(395,'MIMIC 2 F  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(396,'MIRAGE 45 EC  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(397,'MITAC 20 EC  ','2020-12-16 19:34:02','2020-12-16 19:34:02'),(398,'MITECLEAN 10 SX  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(399,'MOLTO EC (NA)  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(400,'MONCEREN E WS 70  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(401,'MONCEREN SC 250  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(402,'MONCEREN WP 25  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(403,'MONCUT 20 SC  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(404,'MONITOR PROFICOL  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(405,'MONOCRON SL  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(406,'MONOCROTOFOS 600 FEDEARROZ  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(407,'MONOCROTOFOS PROFICOL 600 SL  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(408,'MURALLA EC 100  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(409,'NADIR 600 SL  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(410,'NERISECT  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(411,'NIFEREX 48 EC  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(412,'NINJA ®  EC  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(413,'NISSORUM EC  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(414,'NOBLETE 75 WP  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(415,'NUDRIN 216 SL  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(416,'NUFOS 4 EC  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(417,'NURELLE 250 EC  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(418,'NUVACRON 40 SL  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(419,'OCTAVE 50 WP  ','2020-12-16 19:34:03','2020-12-16 19:34:03'),(420,'OMITE 6 EC  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(421,'OPUS 7.5 EC  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(422,'ORNAMITE 30% CR  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(423,'ORTHENE 75% SP  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(424,'ORTHOCIDE 50% PROFICOL  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(425,'OXICLOR *35WP  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(426,'OXICLOR 50 WP  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(427,'OXICLORURO DE COBRE 35% DISMO  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(428,'OXICLORURO DE COBRE 58.8% WP  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(429,'OXICLORURO DE COBRE 58.8% PERTIQUIM  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(430,'OXICLORURO DE COBRE 58.8% WP VITAGRO  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(431,'OXICLORURO DE COBRE 84% PROFIC  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(432,'OXICLORURO DE COBRE OLIAGRO 58.8%  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(433,'OXICLORURO LIMOR  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(434,'OXICOB WP  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(435,'OXICRON 58.8 WP  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(436,'PADAN 50 SP  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(437,'PARATION METILICO 48% EC  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(438,'PENNCAP-M  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(439,'PERFEKTION  ','2020-12-16 19:34:04','2020-12-16 19:34:04'),(440,'PEROPAL WP 25  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(441,'PHOSTOXIN  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(442,'PILARMATE EC  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(443,'PIPRON SL  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(444,'PIRESTAR 38 EC  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(445,'PIRIFOS 48 EC  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(446,'PIRIMOR WG  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(447,'PLANTVAX 5% GR  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(448,'PLANTVAX 75%  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(449,'POLO 250 SC  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(450,'POLYRAM DF  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(451,'POLYTHION SC  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(452,'POLYTRIN 200 EC  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(453,'POSITRON WP 69  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(454,'PREVICUR N SL  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(455,'PRO-GRO  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(456,'PRODION 500 SC  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(457,'PROFITOX 80 SP  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(458,'PROFIZEB 80% WP  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(459,'PROHORTICOLA  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(460,'PROPARGITE  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(461,'PROPICONAZOLE AGROGEN 250 EC  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(462,'PROPIZOLE 250 CE  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(463,'PROTOFOS 600  ','2020-12-16 19:34:05','2020-12-16 19:34:05'),(464,'PROVADO OCMBI SC 112.5  ','2020-12-16 19:34:06','2020-12-16 19:34:06'),(465,'PUGIL 75 WG  ','2020-12-16 19:34:06','2020-12-16 19:34:06'),(466,'PULSAR 20 EC  ','2020-12-16 19:34:06','2020-12-16 19:34:06'),(467,'PULSOR 2 SC  ','2020-12-16 19:34:06','2020-12-16 19:34:06'),(468,'PUNCH 40 EC  ','2020-12-16 19:34:06','2020-12-16 19:34:06'),(469,'PUNTO WP 50.3  ','2020-12-16 19:34:06','2020-12-16 19:34:06'),(470,'PYRICRON EC  ','2020-12-16 19:34:06','2020-12-16 19:34:06'),(471,'PYRICROP 48 EC  ','2020-12-16 19:34:06','2020-12-16 19:34:06'),(472,'PYRINEX EC  ','2020-12-16 19:34:06','2020-12-16 19:34:06'),(474,'QUATIM  ','2020-12-16 19:35:05','2020-12-16 19:35:05'),(475,'RP METHIL 48 EC  ','2020-12-16 19:35:05','2020-12-16 19:35:05'),(476,'RABCIDE 20 EC  ','2020-12-16 19:35:05','2020-12-16 19:35:05'),(477,'RAFAGA® 4 EC   ','2020-12-16 19:35:05','2020-12-16 19:35:05'),(478,'RALLY 40 WP  ','2020-12-16 19:35:05','2020-12-16 19:35:05'),(479,'RAMBLER   ','2020-12-16 19:35:05','2020-12-16 19:35:05'),(480,'REGENT SC  ','2020-12-16 19:35:05','2020-12-16 19:35:05'),(481,'REGNUM EC  ','2020-12-16 19:35:05','2020-12-16 19:35:05'),(482,'RELAMPAGO 550 EC  ','2020-12-16 19:35:05','2020-12-16 19:35:05'),(483,'RESCATE 200 SP  ','2020-12-16 19:35:05','2020-12-16 19:35:05'),(484,'RHODAX 70 WP  ','2020-12-16 19:35:05','2020-12-16 19:35:05'),(487,'RHODAX WP  ','2020-12-16 19:36:17','2020-12-16 19:36:17'),(488,'RHYZOLENC SC  ','2020-12-16 19:36:17','2020-12-16 19:36:17'),(489,'RIDODUR 40 SC  ','2020-12-16 19:36:17','2020-12-16 19:36:17'),(490,'RIDODUR 80 WP  ','2020-12-16 19:36:17','2020-12-16 19:36:17'),(491,'RIDOMIL GOLD MZ 68 WP  ','2020-12-16 19:36:17','2020-12-16 19:36:17'),(492,'RIDONATE 500 SC  ','2020-12-16 19:36:17','2020-12-16 19:36:17'),(493,'RIDONATE 720 SC  ','2020-12-16 19:36:17','2020-12-16 19:36:17'),(494,'RIMON 10 EC  ','2020-12-16 19:36:17','2020-12-16 19:36:17'),(495,'RIPCORD 20 EC  ','2020-12-16 19:36:17','2020-12-16 19:36:17'),(496,'RIZOLEX 75 WP  ','2020-12-16 19:36:17','2020-12-16 19:36:17'),(497,'ROBENDAZIM 50 WP  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(498,'ROBENDAZIM 500 SC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(499,'RODAZIM 50 WP  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(500,'RODAZIM 500 SC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(501,'RODAZIM SC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(502,'RODAZIM WP  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(503,'ROMECTIN 1.8 EC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(504,'ROMITE 1.8 EC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(505,'RONECRON 600 SL  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(506,'ROVRAL 50 WP  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(507,'ROVRAL FLO  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(508,'ROXION 40 EC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(509,'RUBIGAN B EC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(510,'RUBIGAN 12 EC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(511,'RUFAST AVANCE  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(512,'SAAT POLKA 500 SC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(513,'SABITHANE  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(514,'SANDOFAN M PROFICOL WP  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(515,'SANDOFAN M WP  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(516,'SANMITE EC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(517,'SAPROL DC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(518,'SCALA 40 SC  ','2020-12-16 19:36:18','2020-12-16 19:36:18'),(519,'SCORE 250 EC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(520,'SEVIN 80 WP  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(521,'SHERPA 25 EC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(522,'SIALEX 50 SC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(523,'SICO 250 EC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(524,'SIGANEX 60 SC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(525,'SILVACUR COMBI EC 300  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(526,'SISCROP 40 EC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(527,'SISTEMIN 40 EC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(528,'SISTOATO 40 EC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(529,'SPIGAR SE  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(530,'SPLENDOUR 25 EC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(531,'SPOCK 18 EW  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(532,'SPORTAK 45 EC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(533,'STOPPER 200 SC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(534,'STRATEGO 250 DC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(535,'STRIKE 250 EC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(536,'STROBY * SC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(537,'STROBY WG  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(538,'SUFFA 720 SC  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(539,'SULFAPLANT 720  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(540,'SUMI 8 WP  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(541,'SUMI-8 25 WP  ','2020-12-16 19:36:19','2020-12-16 19:36:19'),(542,'SUMILEX 50 WP  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(543,'SUMITHION 40 WP  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(544,'SUNFIRE 24 SC  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(545,'SUPERCON MTD 600 SL  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(546,'SWITCH 62.5 WG  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(547,'TAIREL WP  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(548,'TAMARON SL 400  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(549,'TASPA 500 EC  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(550,'TATTO M  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(551,'TECNOMYL 50 WP  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(552,'TEDION V-18 EC  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(553,'TEGA 075 EC  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(554,'TEISCO 720 SC  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(555,'TELDOR COMBI SC 416.7  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(556,'TELDOR SC 500  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(557,'THOREX 480 SC  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(558,'THRUDER 48% SC  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(559,'THRUDER WP  ','2020-12-16 19:36:20','2020-12-16 19:36:20'),(560,'TIFON 50 WP  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(561,'TILT 250 EC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(562,'TIMSEN  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(563,'TIRO M-8WP  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(564,'TITAN 430 SC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(565,'TITAN 80 WP  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(566,'TOP-COP  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(567,'TOP-SUL SC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(568,'TOPAS 100 EC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(569,'TOPSIN M70 WP  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(570,'TOPSIN M-50 SC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(571,'TORQUE 500 SC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(572,'TRACER 120 SC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(573,'TRAPPER EC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(574,'TREBON 10 EC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(575,'TRIFMINE 15 EC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(576,'TRIGARD 75 WP  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(577,'TRIMATON 51  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(578,'TRIMILTOX  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(579,'TRIZEB 80 WP  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(580,'TRUENO 100 EC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(581,'UNDAZIM 500 SC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(582,'VALIDACIN SL  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(583,'VAPONA 24 EC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(584,'VERTIMEC 1.8%EC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(585,'VEXTER 4 EC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(586,'VEXTER 550 EC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(587,'VISADO 75WP  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(588,'VISADO AGROSER  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(589,'VITAVAX  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(590,'VITIGRAN 3 SC  ','2020-12-16 19:36:21','2020-12-16 19:36:21'),(591,'VITIGRAN 35% WP  ','2020-12-16 19:36:22','2020-12-16 19:36:22'),(592,'VITIGRAN 50% WP  ','2020-12-16 19:36:22','2020-12-16 19:36:22'),(593,'VOLLEY 88 OL  ','2020-12-16 19:36:22','2020-12-16 19:36:22'),(594,'VONDOZEB 42 SC  ','2020-12-16 19:36:22','2020-12-16 19:36:22'),(595,'VONDOZEB 75 DG  ','2020-12-16 19:36:22','2020-12-16 19:36:22'),(596,'VONDOZEB 80 WP   ','2020-12-16 19:36:22','2020-12-16 19:36:22'),(597,'VULCANO 420 EC  ','2020-12-16 19:36:22','2020-12-16 19:36:22'),(598,'W12 EC  ','2020-12-16 19:36:22','2020-12-16 19:36:22'),(599,'ZIRAM 76 WG BARPEN  ','2020-12-16 19:36:22','2020-12-16 19:36:22'),(600,'ZOLONE 35 EC  ','2020-12-16 19:36:22','2020-12-16 19:36:22'),(601,'PP','2021-01-21 12:04:34','2021-01-21 12:04:34');
/*!40000 ALTER TABLE `producto_fitosanitarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productors`
--

DROP TABLE IF EXISTS `productors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productors` (
  `id` int(10) unsigned NOT NULL,
  `fechaExpedicion` date NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `sexo_id` int(10) unsigned NOT NULL,
  `etnia_id` int(10) unsigned NOT NULL,
  `escolaridad_id` int(10) unsigned NOT NULL,
  `departamento_id` int(10) unsigned NOT NULL,
  `municipio_id` int(10) unsigned NOT NULL,
  `vereda_id` int(10) unsigned NOT NULL,
  `resguardo_id` int(10) unsigned NOT NULL,
  `fechaIngreso` date NOT NULL,
  `fotocopiaCedula` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `productors_id_foreign` (`id`),
  KEY `productors_sexo_id_foreign` (`sexo_id`),
  KEY `productors_etnia_id_foreign` (`etnia_id`),
  KEY `productors_escolaridad_id_foreign` (`escolaridad_id`),
  KEY `productors_departamento_id_foreign` (`departamento_id`),
  KEY `productors_municipio_id_foreign` (`municipio_id`),
  KEY `productors_vereda_id_foreign` (`vereda_id`),
  KEY `productors_resguardo_id_foreign` (`resguardo_id`),
  CONSTRAINT `productors_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `productors_escolaridad_id_foreign` FOREIGN KEY (`escolaridad_id`) REFERENCES `gradoescolaridads` (`id`),
  CONSTRAINT `productors_etnia_id_foreign` FOREIGN KEY (`etnia_id`) REFERENCES `etnias` (`id`),
  CONSTRAINT `productors_id_foreign` FOREIGN KEY (`id`) REFERENCES `personas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `productors_municipio_id_foreign` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`),
  CONSTRAINT `productors_resguardo_id_foreign` FOREIGN KEY (`resguardo_id`) REFERENCES `resguardos` (`id`),
  CONSTRAINT `productors_sexo_id_foreign` FOREIGN KEY (`sexo_id`) REFERENCES `sexos` (`id`),
  CONSTRAINT `productors_vereda_id_foreign` FOREIGN KEY (`vereda_id`) REFERENCES `veredas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productors`
--

LOCK TABLES `productors` WRITE;
/*!40000 ALTER TABLE `productors` DISABLE KEYS */;
INSERT INTO `productors` VALUES (5,'2020-10-10','2020-10-10',1,1,6,1,1,15,2,'2020-02-02','foto'),(6,'2020-10-10','2020-10-10',1,1,8,1,1,13,1,'2020-10-10','foto'),(13,'2020-11-12','2020-10-10',1,1,1,1,1,1,1,'2020-10-15','2020-10-10'),(22,'2004-05-01','1974-05-01',1,1,8,1,1,1,2,'2020-12-02','foto'),(23,'1994-05-12','1994-05-11',1,1,6,1,1,2,2,'2001-05-02','foto');
/*!40000 ALTER TABLE `productors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programaestados`
--

DROP TABLE IF EXISTS `programaestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programaestados` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `programaestados_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programaestados`
--

LOCK TABLES `programaestados` WRITE;
/*!40000 ALTER TABLE `programaestados` DISABLE KEYS */;
INSERT INTO `programaestados` VALUES (1,'Familia en accion','2021-03-27 14:14:04','2021-03-27 14:14:04'),(2,'Adulto Mayor','2021-03-27 14:14:04','2021-03-27 14:14:04'),(3,'Desplazado','2021-03-27 14:14:04','2021-03-27 14:14:04'),(4,'Otro','2021-03-27 14:14:04','2021-03-27 14:14:04'),(5,'No tiene acceso','2021-03-27 14:14:04','2021-03-27 14:14:04');
/*!40000 ALTER TABLE `programaestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resguardos`
--

DROP TABLE IF EXISTS `resguardos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resguardos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resguardos_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resguardos`
--

LOCK TABLES `resguardos` WRITE;
/*!40000 ALTER TABLE `resguardos` DISABLE KEYS */;
INSERT INTO `resguardos` VALUES (1,'TACUEYO','2020-12-07 22:04:37','2020-12-07 22:04:37'),(2,'TORIBIO','2020-12-07 22:04:37','2020-12-07 22:04:37'),(3,'SAN FRANCISCO','2020-12-07 22:04:37','2020-12-07 22:04:37');
/*!40000 ALTER TABLE `resguardos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residuossolidos`
--

DROP TABLE IF EXISTS `residuossolidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `residuossolidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `residuossolidos_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residuossolidos`
--

LOCK TABLES `residuossolidos` WRITE;
/*!40000 ALTER TABLE `residuossolidos` DISABLE KEYS */;
INSERT INTO `residuossolidos` VALUES (1,'Puntos de reciclaje ','2021-04-11 15:53:14','2021-04-11 15:53:14'),(2,'Entierra','2021-04-11 15:53:14','2021-04-11 15:53:14'),(3,'Quema','2021-04-11 15:53:14','2021-04-11 15:53:14'),(4,'Desecho a fuentes hidricas','2021-04-11 15:53:14','2021-04-11 15:53:14'),(5,'No maneja residuos solidos','2021-04-11 15:53:14','2021-04-11 15:53:14');
/*!40000 ALTER TABLE `residuossolidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riegos`
--

DROP TABLE IF EXISTS `riegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riegos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `riego` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adquisicion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuencia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `jornales` int(11) DEFAULT NULL,
  `reservorio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacidadR` int(11) DEFAULT NULL,
  `alturaR` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `riegos_productor_id_foreign` (`productor_id`),
  KEY `riegos_finca_id_foreign` (`finca_id`),
  CONSTRAINT `riegos_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `riegos_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riegos`
--

LOCK TABLES `riegos` WRITE;
/*!40000 ALTER TABLE `riegos` DISABLE KEYS */;
INSERT INTO `riegos` VALUES (1,5,1,'Si','Inversion propia','3','Aspersion',45,2,NULL,NULL,NULL,'2020-12-27 03:12:23','2020-12-27 03:12:23'),(2,5,1,'Si','Inversion propia','5','Aspersion',200,2,'Si',12,54,'2021-03-04 14:44:43','2021-03-04 14:44:43');
/*!40000 ALTER TABLE `riegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','Administrador del sistema',1),(2,'Tecnico Comercial','Tecnicos que realizan ventas',1),(3,'Tecnico Extensionista','Tecnico encargado de los levantamientos',1),(4,'Productor','Productores de asofrut',1),(5,'Contador','Encargado de cambiar estados de venta',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexos`
--

DROP TABLE IF EXISTS `sexos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sexos_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexos`
--

LOCK TABLES `sexos` WRITE;
/*!40000 ALTER TABLE `sexos` DISABLE KEYS */;
INSERT INTO `sexos` VALUES (1,'Masculino','2020-12-07 22:04:31','2020-12-07 22:04:31'),(2,'Femenino','2020-12-07 22:04:31','2020-12-07 22:04:31');
/*!40000 ALTER TABLE `sexos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suelos`
--

DROP TABLE IF EXISTS `suelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suelos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `curvasNivel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controlArvenses` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuencia` int(11) DEFAULT NULL,
  `herbicida` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dosisAplicacionCal` decimal(11,2) DEFAULT NULL,
  `frecuenciaHerbicida` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suelos_productor_id_foreign` (`productor_id`),
  KEY `suelos_finca_id_foreign` (`finca_id`),
  CONSTRAINT `suelos_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `suelos_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suelos`
--

LOCK TABLES `suelos` WRITE;
/*!40000 ALTER TABLE `suelos` DISABLE KEYS */;
INSERT INTO `suelos` VALUES (1,5,1,'Si','Manual',5,'herbivoro',2.00,3,'2020-12-28 09:48:05','2020-12-28 09:48:05'),(2,5,1,'Curvas en contorno','Manual',3,'dsada',2.00,2,'2021-03-04 04:13:19','2021-03-04 04:13:19');
/*!40000 ALTER TABLE `suelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocontrols`
--

DROP TABLE IF EXISTS `tipocontrols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocontrols` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipocontrols_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocontrols`
--

LOCK TABLES `tipocontrols` WRITE;
/*!40000 ALTER TABLE `tipocontrols` DISABLE KEYS */;
INSERT INTO `tipocontrols` VALUES (1,'Quimico ','2021-04-11 15:53:13','2021-04-11 15:53:13'),(2,'Organico','2021-04-11 15:53:13','2021-04-11 15:53:13'),(3,'Cultural','2021-04-11 15:53:13','2021-04-11 15:53:13'),(4,'Otros','2021-04-11 15:53:13','2021-04-11 15:53:13');
/*!40000 ALTER TABLE `tipocontrols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoids`
--

DROP TABLE IF EXISTS `tipoids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoids` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipoids_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoids`
--

LOCK TABLES `tipoids` WRITE;
/*!40000 ALTER TABLE `tipoids` DISABLE KEYS */;
INSERT INTO `tipoids` VALUES (1,'Cedula de ciudadania','2020-12-07 22:04:31','2020-12-07 22:04:31'),(2,'Tarjeta de identidad','2020-12-07 22:04:31','2020-12-07 22:04:31');
/*!40000 ALTER TABLE `tipoids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipospodas`
--

DROP TABLE IF EXISTS `tipospodas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipospodas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipospodas_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipospodas`
--

LOCK TABLES `tipospodas` WRITE;
/*!40000 ALTER TABLE `tipospodas` DISABLE KEYS */;
INSERT INTO `tipospodas` VALUES (1,'Formacion','2021-04-11 15:53:12','2021-04-11 15:53:12'),(2,'Mantenimiento','2021-04-11 15:53:12','2021-04-11 15:53:12'),(3,'Rehabilitacion','2021-04-11 15:53:12','2021-04-11 15:53:12'),(4,'Ninguna','2021-04-11 15:53:12','2021-04-11 15:53:12');
/*!40000 ALTER TABLE `tipospodas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoviviendas`
--

DROP TABLE IF EXISTS `tipoviviendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoviviendas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipoviviendas_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoviviendas`
--

LOCK TABLES `tipoviviendas` WRITE;
/*!40000 ALTER TABLE `tipoviviendas` DISABLE KEYS */;
INSERT INTO `tipoviviendas` VALUES (1,'Madera','2021-03-27 14:14:03','2021-03-27 14:14:03'),(2,'Cemento','2021-03-27 14:14:03','2021-03-27 14:14:03'),(3,'Otro','2021-03-27 14:14:03','2021-03-27 14:14:03');
/*!40000 ALTER TABLE `tipoviviendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorados`
--

DROP TABLE IF EXISTS `tutorados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorados` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `tutorado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoTutorado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoMadera` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tutorados_productor_id_foreign` (`productor_id`),
  KEY `tutorados_finca_id_foreign` (`finca_id`),
  CONSTRAINT `tutorados_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `tutorados_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorados`
--

LOCK TABLES `tutorados` WRITE;
/*!40000 ALTER TABLE `tutorados` DISABLE KEYS */;
INSERT INTO `tutorados` VALUES (1,5,1,'Si','Espaldera sencilla','Nativo','2020-12-26 22:56:40','2020-12-26 22:56:40'),(2,5,1,NULL,NULL,NULL,'2020-12-27 03:08:07','2020-12-27 03:08:07');
/*!40000 ALTER TABLE `tutorados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_aplicaciones`
--

DROP TABLE IF EXISTS `unidad_aplicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_aplicaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidad_aplicaciones_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_aplicaciones`
--

LOCK TABLES `unidad_aplicaciones` WRITE;
/*!40000 ALTER TABLE `unidad_aplicaciones` DISABLE KEYS */;
INSERT INTO `unidad_aplicaciones` VALUES (1,'Bomba 20L',NULL,NULL),(2,'Caneca 200L',NULL,NULL);
/*!40000 ALTER TABLE `unidad_aplicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_dosis`
--

DROP TABLE IF EXISTS `unidad_dosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_dosis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidad_dosis_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_dosis`
--

LOCK TABLES `unidad_dosis` WRITE;
/*!40000 ALTER TABLE `unidad_dosis` DISABLE KEYS */;
INSERT INTO `unidad_dosis` VALUES (1,'Centimetros cubicos','2020-12-16 19:36:22','2020-12-16 19:36:22'),(2,'Gramos/litro','2020-12-16 19:36:22','2020-12-16 19:36:22');
/*!40000 ALTER TABLE `unidad_dosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  `idrol` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `users_usuario_unique` (`usuario`),
  KEY `users_id_foreign` (`id`),
  KEY `users_idrol_foreign` (`idrol`),
  CONSTRAINT `users_id_foreign` FOREIGN KEY (`id`) REFERENCES `personas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_idrol_foreign` FOREIGN KEY (`idrol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin@sistemas.com','$2y$10$sugk64mZOHhSV63KYO8oveXEv1Uuvs9NOSAU0pwh6beuAWZUZBZDW',1,1,'HYMHy2vlcSSuMcM0dgXxZQLrAOMCDBHHytelkGo7VX4Gs8ieSYrgoLIxnvcX',NULL,NULL),(4,'comercial@asofrut.org','$2y$10$Zld41k5Ds01i5uHc3K3VUemdPBTl/OwR5juDzTjtCwQc9p1k2fxWi',1,2,'zWlquzbcbk3WZtJtBkaGB11mFSHIeopKIzxmKP99O0nMqNFk1l912yrOX1so',NULL,NULL),(24,'contador@asofrut.org','$2y$10$PJXkHpLQSnlYZMWuB2sY2OyOWG0uWy.OWA5OPhH8K58r5DkJiGDh.',1,5,'8csyMU6r0i7G3MSYNSqC3I4Pysc5AO0XSvc8Fy8jpEWGzTTJCcFayV1kwkIK',NULL,NULL),(23,'ejemplo@gmail.com','$2y$10$0tPxypQEziI/wDiQ/2w9vOHVFuarKdIaLAAmve9d9JCS5BIPnLBPi',0,4,NULL,NULL,NULL),(3,'extensionista@asofrut.org','$2y$10$hacgqATGvTWe9jqzZEqS4ODtsNQ7v4k3KV1xo5Lb3O5e0snmUBN3G',1,3,'J3ZbHh5U8L9Ndi4ikNz17XltsUpdoPVMz6DU1bHNWuQTn99nKRVXjTjZwPpa',NULL,NULL),(1,'jcarlosad7','$2y$10$Yt1HHnF.zHONEx9ayMimCO0Tu9jUcielbsBFItHXTFL4kDSu4U.0i',0,1,'juzgt12Z2gxHWSdZZ89SZ3P2HkwECzdnfH9lC0gSP9MPFrN8ScVpqMlkpgeU',NULL,NULL),(22,'juan@hotmail.com','$2y$10$QcgJ5LFotbEf9ZmruZ0W5e6fawVQCMBwt88cmj2YtyFKxzGPeAOh2',1,4,NULL,NULL,NULL),(13,'lola@gmail.com','$2y$10$qu43tgSEwkSNTYxQ1bGAx.bM5wPj4mvJzNtVk2MS9gSI3GqxlwV2C',1,4,NULL,NULL,NULL),(6,'pedro@gmail.com','$2y$10$NvyQXLPUJMCx5/nmWBUSXOm3RTOdo5fQHXlCS7K44Mf1n/QxMDXCW',1,4,NULL,NULL,NULL),(5,'productor@asofrut.org','$2y$10$AyYmNXtl7kPjGYyW9wnoGeftKD/JaNbO6rUuF8FFTLihTclZuTVF.',1,4,'qnP05WdcSOqTMr2Gk85I95u71egWDUIA2d0FSFe0iuGPok2ze3D4pbX2Yuvh',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventacoms`
--

DROP TABLE IF EXISTS `ventacoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventacoms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `lugarVenta_id` int(10) unsigned NOT NULL,
  `vereda_id` int(10) unsigned NOT NULL,
  `zona_id` int(10) unsigned NOT NULL,
  `fechaVenta` date NOT NULL,
  `totalKilos` decimal(11,2) NOT NULL,
  `totalKilosNetos` decimal(11,2) NOT NULL,
  `totalIncentivoXkg` decimal(11,2) NOT NULL,
  `totalIncentivo` decimal(11,2) NOT NULL,
  `totalNeto` decimal(11,2) NOT NULL,
  `estado_id` int(10) unsigned NOT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ventacoms_productor_id_foreign` (`productor_id`),
  KEY `ventacoms_lugarventa_id_foreign` (`lugarVenta_id`),
  KEY `ventacoms_vereda_id_foreign` (`vereda_id`),
  KEY `ventacoms_zona_id_foreign` (`zona_id`),
  KEY `ventacoms_estado_id_foreign` (`estado_id`),
  CONSTRAINT `ventacoms_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estadoventas` (`id`),
  CONSTRAINT `ventacoms_lugarventa_id_foreign` FOREIGN KEY (`lugarVenta_id`) REFERENCES `lugarventas` (`id`),
  CONSTRAINT `ventacoms_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `componentesocialproductors` (`id`),
  CONSTRAINT `ventacoms_vereda_id_foreign` FOREIGN KEY (`vereda_id`) REFERENCES `veredascoms` (`id`),
  CONSTRAINT `ventacoms_zona_id_foreign` FOREIGN KEY (`zona_id`) REFERENCES `zonas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventacoms`
--

LOCK TABLES `ventacoms` WRITE;
/*!40000 ALTER TABLE `ventacoms` DISABLE KEYS */;
INSERT INTO `ventacoms` VALUES (5,40,13,57,3,'2021-04-14',345.00,314.10,400.00,125640.00,905640.00,5,'venta economica','2021-04-14 11:53:13','2021-05-24 20:49:45'),(8,36,16,7,1,'2021-05-24',35.00,33.73,100.00,3373.00,74550.00,1,'prueba','2021-05-24 14:57:43','2021-05-24 14:57:43'),(9,40,3,105,5,'2021-05-24',3.00,2.64,300.00,792.00,6864.00,1,'prueba','2021-05-24 19:45:50','2021-05-24 19:45:50'),(10,40,20,163,6,'2021-05-24',25.00,22.50,1000.00,22500.00,77725.80,1,'final','2021-05-24 20:48:38','2021-05-24 20:48:38');
/*!40000 ALTER TABLE `ventacoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `linea_id` int(10) unsigned NOT NULL,
  `fechaVenta` datetime NOT NULL,
  `lugarVenta_id` int(10) unsigned NOT NULL,
  `totalVenta` decimal(11,2) NOT NULL,
  `totalKilos` decimal(11,2) NOT NULL,
  `totalDonacion` decimal(11,2) NOT NULL,
  `totalTransporte` decimal(11,2) NOT NULL,
  `totalAsohof` decimal(11,2) NOT NULL,
  `totalCuatroXmil` decimal(11,2) NOT NULL,
  `estado_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_productor_id_foreign` (`productor_id`),
  KEY `ventas_linea_id_foreign` (`linea_id`),
  KEY `ventas_lugarventa_id_foreign` (`lugarVenta_id`),
  KEY `ventas_estado_id_foreign` (`estado_id`),
  CONSTRAINT `ventas_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estadoventas` (`id`),
  CONSTRAINT `ventas_linea_id_foreign` FOREIGN KEY (`linea_id`) REFERENCES `lineas` (`id`),
  CONSTRAINT `ventas_lugarventa_id_foreign` FOREIGN KEY (`lugarVenta_id`) REFERENCES `lugarventas` (`id`),
  CONSTRAINT `ventas_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,5,1,'2020-12-08 00:00:00',1,300000.00,10.00,0.00,0.00,0.00,0.00,5,NULL,'2020-12-10 07:52:36'),(15,5,1,'2020-12-09 00:00:00',3,181384.00,95.00,0.00,0.00,0.00,0.00,2,'2020-12-09 11:50:20','2020-12-10 08:24:08'),(16,5,1,'2020-12-09 00:00:00',1,37045.20,21.00,2520.00,1848.00,471.00,188.40,4,'2020-12-09 21:40:27','2020-12-13 07:46:06'),(17,5,1,'2020-12-09 00:00:00',1,103009.60,58.00,6960.00,5104.00,1308.00,523.20,2,'2020-12-09 21:47:49','2020-12-22 17:02:12'),(18,5,1,'2020-12-09 12:04:45',1,100428.00,60.00,7200.00,5280.00,1290.00,516.00,4,'2020-12-09 22:04:45','2020-12-10 08:33:09'),(19,5,1,'2020-12-09 22:41:34',3,43546.00,25.00,3000.00,2200.00,555.00,222.00,5,'2020-12-10 08:41:34','2020-12-10 19:40:03'),(20,5,1,'2020-12-09 22:46:58',3,35420.00,20.00,2400.00,1760.00,450.00,180.00,4,'2020-12-10 08:46:58','2020-12-10 19:39:44'),(21,6,1,'2020-12-10 09:41:06',3,272940.00,150.00,18000.00,13200.00,3450.00,1380.00,4,'2020-12-10 19:41:06','2020-12-22 21:22:26'),(22,5,1,'2020-12-10 09:41:45',3,53130.00,30.00,3600.00,2640.00,675.00,270.00,4,'2020-12-10 19:41:45','2020-12-12 02:38:24'),(23,23,1,'2020-12-11 16:35:32',1,243780.00,150.00,18000.00,13200.00,3150.00,1260.00,5,'2020-12-12 02:35:32','2020-12-12 02:36:21'),(24,6,1,'2020-12-11 16:51:45',2,301972.00,169.00,20280.00,14872.00,3830.00,1532.00,1,'2020-12-12 02:51:45','2020-12-12 02:51:45'),(25,6,1,'2020-12-13 23:51:38',1,61794.00,30.00,3600.00,2640.00,690.00,276.00,1,'2020-12-14 09:51:38','2020-12-14 09:51:38'),(26,22,1,'2020-12-14 11:05:13',3,205980.00,100.00,12000.00,8800.00,2300.00,920.00,3,'2020-12-14 21:05:13','2021-01-18 20:23:43');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_categoriacoms`
--

DROP TABLE IF EXISTS `ventas_categoriacoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas_categoriacoms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ventas_id` int(10) unsigned NOT NULL,
  `categoria_id` int(10) unsigned NOT NULL,
  `peso` decimal(11,2) NOT NULL,
  `humedad` decimal(11,2) NOT NULL,
  `fermentacion` decimal(11,2) NOT NULL,
  `descuentoHumedadKg` decimal(11,2) NOT NULL,
  `valorUnitario` decimal(11,2) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_categoriacoms_ventas_id_foreign` (`ventas_id`),
  KEY `ventas_categoriacoms_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `ventas_categoriacoms_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoriamoras` (`id`),
  CONSTRAINT `ventas_categoriacoms_ventas_id_foreign` FOREIGN KEY (`ventas_id`) REFERENCES `ventacoms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_categoriacoms`
--

LOCK TABLES `ventas_categoriacoms` WRITE;
/*!40000 ALTER TABLE `ventas_categoriacoms` DISABLE KEYS */;
INSERT INTO `ventas_categoriacoms` VALUES (4,5,1,300.00,15.00,87.00,21.00,2300.00,690000.00,'2021-04-14 11:53:13','2021-04-14 11:53:13'),(5,5,2,45.00,30.00,71.00,9.90,2000.00,90000.00,'2021-04-14 11:53:13','2021-04-14 11:53:13'),(6,8,1,2.00,22.00,33.00,0.28,2300.00,3956.00,'2021-05-24 14:57:43','2021-05-24 14:57:43'),(7,8,3,33.00,11.00,11.00,0.99,2100.00,67221.00,'2021-05-24 14:57:43','2021-05-24 14:57:43'),(8,9,1,3.00,20.00,31.00,0.36,2300.00,6072.00,'2021-05-24 19:45:50','2021-05-24 19:45:50'),(9,10,7,15.00,10.00,50.00,0.30,2000.00,29400.00,'2021-05-24 20:48:38','2021-05-24 20:48:38'),(10,10,6,10.00,30.00,60.00,2.20,3311.00,25825.80,'2021-05-24 20:48:38','2021-05-24 20:48:38');
/*!40000 ALTER TABLE `ventas_categoriacoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veredas`
--

DROP TABLE IF EXISTS `veredas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veredas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipio_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `veredas_nombre_unique` (`nombre`),
  KEY `veredas_municipio_id_foreign` (`municipio_id`),
  CONSTRAINT `veredas_municipio_id_foreign` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veredas`
--

LOCK TABLES `veredas` WRITE;
/*!40000 ALTER TABLE `veredas` DISABLE KEYS */;
INSERT INTO `veredas` VALUES (1,'Alto Buenos Aires',1,'2020-12-07 22:04:36','2020-12-07 22:04:36'),(2,'Caleta Viento Libre',1,'2020-12-07 22:04:36','2020-12-07 22:04:36'),(3,'La Concha (Tablón Salado)',1,'2020-12-07 22:04:36','2020-12-07 22:04:36'),(4,'Yanaje',1,'2020-12-07 22:04:36','2020-12-07 22:04:36'),(5,'Guayabo',1,'2020-12-07 22:04:36','2020-12-07 22:04:36'),(6,'Bajos Buenos Aires (Tablón Salado)',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(7,'Barro Colarado (Gualajo)',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(8,'Boca de Curay',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(9,'Colorado',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(10,'El Guabal (río Gualajo)',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(11,'El Retomo',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(12,'Gualajo (San Angustín)',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(13,'Imbilpí del Carmen',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(14,'La Chorrera Curay',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(15,'Salahonda(Francisco Pizarro)',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(16,'San Antonio',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(17,'San Antonio de Curay',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(18,'San Juan ( de la costa)',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(19,'Santa Rosa',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(20,'Soledad',1,'2020-12-07 22:04:37','2020-12-07 22:04:37'),(21,'Tablón Dulce',1,'2020-12-07 22:04:37','2020-12-07 22:04:37');
/*!40000 ALTER TABLE `veredas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veredascoms`
--

DROP TABLE IF EXISTS `veredascoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veredascoms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zona_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `veredascoms_nombre_unique` (`nombre`),
  KEY `veredascoms_zona_id_foreign` (`zona_id`),
  CONSTRAINT `veredascoms_zona_id_foreign` FOREIGN KEY (`zona_id`) REFERENCES `zonas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veredascoms`
--

LOCK TABLES `veredascoms` WRITE;
/*!40000 ALTER TABLE `veredascoms` DISABLE KEYS */;
INSERT INTO `veredascoms` VALUES (1,'Alto Buenos Aires',1,'2021-03-27 14:14:06','2021-03-27 14:14:06'),(2,'Caleta Viento Libre',1,'2021-03-27 14:14:06','2021-03-27 14:14:06'),(3,'La Concha (Tablón Salado)',1,'2021-03-27 14:14:06','2021-03-27 14:14:06'),(4,'Yanaje',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(5,'Guayabo',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(6,'Bajos Buenos Aires (Tablón Salado)',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(7,'Barro Colarado (Gualajo)',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(8,'Boca de Curay',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(9,'Colorado',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(10,'El Guabal (río Gualajo)',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(11,'El Retomo',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(12,'Gualajo (San Angustín)',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(13,'Imbilpí del Carmen',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(14,'La Chorrera Curay',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(15,'Salahonda(Francisco Pizarro)',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(16,'San Antonio',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(17,'San Antonio de Curay',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(18,'San Juan ( de la costa)',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(19,'Santa Rosa',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(20,'Soledad',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(21,'Tablón Dulce',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(22,'Trujillo',1,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(23,'Alto Santo Domingo',2,'2021-03-27 14:14:07','2021-03-27 14:14:07'),(24,'Bajo Jagua',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(25,'Brisas del Acueducto',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(26,'Cabo Manglares',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(27,'El Barranco',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(28,'El Guachal',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(29,'Milagros',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(30,'Terán',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(31,'Sagumbita',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(32,'Bocas de Cajapí',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(33,'Alto Jagua',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(34,'Bajo  Santo Domingo',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(35,'Bocas del Guabal',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(36,'Cacagual',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(37,'Chontal',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(38,'Congal',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(39,'Delcolgadero',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(40,'El Jagua',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(41,'Guachal',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(42,'Imbili la Loma',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(43,'Las Vegas',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(44,'Miras Palma',2,'2021-03-27 14:14:08','2021-03-27 14:14:08'),(45,'Paisurero',2,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(46,'Puerto Palma',2,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(47,'San Isidro',2,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(48,'Viguaral',2,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(49,'Vuelta del Carmen',2,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(50,'Alto San Agustín',3,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(51,'La Balsa (río Mira)',3,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(52,'Pianipí',3,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(53,'Vuelta de Candelilla',3,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(54,'Achotal',3,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(55,'Alto Pañambí',3,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(56,'Bajo Pusbí',3,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(57,'Bayanviendo',3,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(58,'Casas Viejas',3,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(59,'Divorcio',3,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(60,'La Aduana',3,'2021-03-27 14:14:09','2021-03-27 14:14:09'),(61,'La Honda',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(62,'La Loma',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(63,'La Piñuela',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(64,'Las Brisas',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(65,'Mata Platano',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(66,'Mataje',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(67,'Mirapalmas',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(68,'Mugui',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(69,'Palo Seco',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(70,'Peña Colorada',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(71,'Pital',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(72,'Playa del Mira (Casas Viejas)',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(73,'Playón (río Mira)',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(74,'Puerto Rico',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(75,'Rastrojada',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(76,'Restrepo',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(77,'San Juan',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(78,'Sonadora',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(79,'Tandil',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(80,'Tangareal del Mira',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(81,'Tiesteria',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(82,'Tulmo',3,'2021-03-27 14:14:10','2021-03-27 14:14:10'),(83,'Ambulpí',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(84,'Bajo Caunapí - La Vega',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(85,'Cacagual de Las Varas',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(86,'Candelo',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(87,'Chapilar',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(88,'Chorrera ',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(89,'Corriente Grande',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(90,'El Coco',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(91,'Isla Grande',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(92,'lscuandé',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(93,'Peña de Los Santos',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(94,'San Francisco',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(95,'Vuelta Larga',4,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(96,'Alto Palmarreal',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(97,'Boca de Salisbi',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(98,'Chajal',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(99,'Chapul',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(100,'Cuarazanga',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(101,'El Guadual',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(102,'La Chorrera',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(103,'La Junta',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(104,'Las Mercedes',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(105,'Limones',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(106,'Majagua',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(107,'Nueva Vista',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(108,'Pácora',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(109,'Palambí',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(110,'Palay',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(111,'Salisví',5,'2021-03-27 14:14:11','2021-03-27 14:14:11'),(112,'San Pedro',5,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(113,'Yanovi',5,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(114,'Albania',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(115,'Cajapí',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(116,'Agua Clara',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(117,'Kilómetro 28',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(118,'Progreso',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(119,'Pueblo Nuevo',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(120,'Kilómetro 35',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(121,'Kilómetro 41',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(122,'Kilómetro 88',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(123,'Chilvicito',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(124,'Dos Quebradas (Río Caunapí)',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(125,'Pulgande',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(126,'El Carmen Kilómetro 36',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(127,'Robles',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(128,'El Carmen Kilómetro 63',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(129,'La Guayacana',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(130,'Chilví',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(131,'El Gualtal',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(132,'Baquería Carretera',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(133,'San Pablo',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(134,'Bajo Zapotal',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(135,'Llorente',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(136,'Mascarey',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(137,'Bucheli',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(138,'Retoño',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(139,'Espriella',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(140,'Candelillas',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(141,'Brava',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(142,'Inguapi la Chiricana',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(143,'Pindales',6,'2021-03-27 14:14:12','2021-03-27 14:14:12'),(144,'Inguapí del Carmen',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(145,'Zabaleta (Caserío Bajo Inda)',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(146,'Caunapí Km-60',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(147,'Inguapí del Guadual',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(148,'Piguambí',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(149,'Ceibito',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(150,'Juan Domingo',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(151,'Nueva Reforma',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(152,'Nueva Creación',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(153,'Pital Piragua',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(154,'Jorge H. Leal K. 38',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(155,'Nueva Brisa',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(156,'Cortadura',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(157,'La Nueva Unión',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(158,'Tangareal',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(159,'Aguacate',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(160,'Km-31',6,'2021-03-27 14:14:13','2021-03-27 14:14:13'),(161,'Km-33',6,'2021-03-27 14:14:14','2021-03-27 14:14:14'),(162,'Km-34',6,'2021-03-27 14:14:14','2021-03-27 14:14:14'),(163,'Pambil- Km43',6,'2021-03-27 14:14:14','2021-03-27 14:14:14'),(164,'Alto Villarrica',6,'2021-03-27 14:14:14','2021-03-27 14:14:14'),(165,'Bajo Villarrica',6,'2021-03-27 14:14:14','2021-03-27 14:14:14'),(166,'Imbili Carretera',6,'2021-03-27 14:14:14','2021-03-27 14:14:14'),(167,'La Nupa',6,'2021-03-27 14:14:14','2021-03-27 14:14:14'),(168,'Porvenir',6,'2021-03-27 14:14:14','2021-03-27 14:14:14');
/*!40000 ALTER TABLE `veredascoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita_compromisos`
--

DROP TABLE IF EXISTS `visita_compromisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visita_compromisos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visita_id` int(10) unsigned NOT NULL,
  `compromiso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cumplimiento` int(11) NOT NULL,
  `predecesor_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visita_compromisos_visita_id_foreign` (`visita_id`),
  CONSTRAINT `visita_compromisos_visita_id_foreign` FOREIGN KEY (`visita_id`) REFERENCES `visitas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita_compromisos`
--

LOCK TABLES `visita_compromisos` WRITE;
/*!40000 ALTER TABLE `visita_compromisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `visita_compromisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitas`
--

DROP TABLE IF EXISTS `visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `areaProduccion` decimal(11,2) NOT NULL,
  `siembraNueva` decimal(11,2) NOT NULL,
  `edadCultivo` decimal(11,2) NOT NULL,
  `arbolesSembrados` decimal(11,2) NOT NULL,
  `produccionMensual` decimal(11,2) NOT NULL,
  `vendidoFresco` decimal(11,2) NOT NULL,
  `porVenderFresco` decimal(11,2) NOT NULL,
  `vendidoSeco` decimal(11,2) NOT NULL,
  `porVenderSeco` decimal(11,2) NOT NULL,
  `lugarVenta_id` int(10) unsigned NOT NULL,
  `objetivos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estadoActualFinca` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recomendacionesTecnicoAmbientales` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivelSatisfaccionAsistencia` int(11) NOT NULL,
  `nivelSatisfaccionEmpresa` int(11) NOT NULL,
  `predecesor_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visitas_productor_id_foreign` (`productor_id`),
  KEY `visitas_finca_id_foreign` (`finca_id`),
  KEY `visitas_lugarventa_id_foreign` (`lugarVenta_id`),
  CONSTRAINT `visitas_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincascoms` (`id`),
  CONSTRAINT `visitas_lugarventa_id_foreign` FOREIGN KEY (`lugarVenta_id`) REFERENCES `lugarventas` (`id`),
  CONSTRAINT `visitas_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `componentesocialproductors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitas`
--

LOCK TABLES `visitas` WRITE;
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viviendas`
--

DROP TABLE IF EXISTS `viviendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viviendas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `viviendas_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viviendas`
--

LOCK TABLES `viviendas` WRITE;
/*!40000 ALTER TABLE `viviendas` DISABLE KEYS */;
INSERT INTO `viviendas` VALUES (1,'Propia','2021-03-27 14:14:03','2021-03-27 14:14:03'),(2,'Arriendo','2021-03-27 14:14:03','2021-03-27 14:14:03'),(3,'Prestada','2021-03-27 14:14:03','2021-03-27 14:14:03');
/*!40000 ALTER TABLE `viviendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vocacions`
--

DROP TABLE IF EXISTS `vocacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocacions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productor_id` int(10) unsigned NOT NULL,
  `finca_id` int(10) unsigned NOT NULL,
  `vocacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `practicaBasica` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacitacionRefuerzo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temasRefuerzo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diasMora` int(11) DEFAULT NULL,
  `labores` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vocacions_productor_id_foreign` (`productor_id`),
  KEY `vocacions_finca_id_foreign` (`finca_id`),
  CONSTRAINT `vocacions_finca_id_foreign` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`),
  CONSTRAINT `vocacions_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `productors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocacions`
--

LOCK TABLES `vocacions` WRITE;
/*!40000 ALTER TABLE `vocacions` DISABLE KEYS */;
INSERT INTO `vocacions` VALUES (1,5,1,'Cultivador',3,'Si','Si','Tecnologias Mora',4,'siembra','buena remuneracion','2020-12-28 08:02:06','2020-12-28 08:02:06'),(2,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-28 09:46:42','2020-12-28 09:46:42');
/*!40000 ALTER TABLE `vocacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonas`
--

DROP TABLE IF EXISTS `zonas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zonas_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonas`
--

LOCK TABLES `zonas` WRITE;
/*!40000 ALTER TABLE `zonas` DISABLE KEYS */;
INSERT INTO `zonas` VALUES (1,'Ensenada','2021-03-27 14:14:04','2021-03-27 14:14:04'),(2,'Bajo Mira','2021-03-27 14:14:04','2021-03-27 14:14:04'),(3,'Alto Mira','2021-03-27 14:14:04','2021-03-27 14:14:04'),(4,'Rio Rosario','2021-03-27 14:14:04','2021-03-27 14:14:04'),(5,'Rio Chagui','2021-03-27 14:14:04','2021-03-27 14:14:04'),(6,'Carretera','2021-03-27 14:14:04','2021-03-27 14:14:04');
/*!40000 ALTER TABLE `zonas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-15 17:38:14
