-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: candidatos
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `tabla` varchar(50) NOT NULL,
  `accion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato`
--

DROP TABLE IF EXISTS `candidato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato` (
  `id_candidato` int NOT NULL AUTO_INCREMENT,
  `rfc` varchar(13) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ap_paterno` varchar(50) NOT NULL,
  `ap_materno` varchar(50) NOT NULL,
  `fenac` date NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` int DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `propuestas` text NOT NULL,
  `finscrip` date NOT NULL,
  `id_partido` int DEFAULT NULL,
  `id_coalicion` int DEFAULT NULL,
  `id_militancia` int DEFAULT NULL,
  `id_cargo` int DEFAULT NULL,
  `id_demarcacion` int DEFAULT NULL,
  `id_historial` int DEFAULT NULL,
  `id_documentacion` int DEFAULT NULL,
  PRIMARY KEY (`id_candidato`),
  UNIQUE KEY `rfc` (`rfc`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `uk_nombre` (`nombre`,`ap_paterno`,`ap_materno`),
  UNIQUE KEY `telefono` (`telefono`),
  KEY `id_partido` (`id_partido`),
  KEY `id_coalicion` (`id_coalicion`),
  KEY `id_militancia` (`id_militancia`),
  KEY `id_cargo` (`id_cargo`),
  KEY `id_demarcacion` (`id_demarcacion`),
  KEY `id_historial` (`id_historial`),
  KEY `id_documentacion` (`id_documentacion`),
  CONSTRAINT `candidato_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partido_politico` (`id_partido`),
  CONSTRAINT `candidato_ibfk_2` FOREIGN KEY (`id_coalicion`) REFERENCES `coalicion` (`id_coalicion`),
  CONSTRAINT `candidato_ibfk_3` FOREIGN KEY (`id_militancia`) REFERENCES `militancia` (`id_militancia`),
  CONSTRAINT `candidato_ibfk_4` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  CONSTRAINT `candidato_ibfk_5` FOREIGN KEY (`id_demarcacion`) REFERENCES `demarcacion` (`id_demarcacion`),
  CONSTRAINT `candidato_ibfk_6` FOREIGN KEY (`id_historial`) REFERENCES `historial` (`id_historial`),
  CONSTRAINT `candidato_ibfk_7` FOREIGN KEY (`id_documentacion`) REFERENCES `documentacion` (`id_documentacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato`
--

LOCK TABLES `candidato` WRITE;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL,
  `id_presidente` int DEFAULT NULL,
  `id_gobernador` int DEFAULT NULL,
  `id_diputado` int DEFAULT NULL,
  `id_senador` int DEFAULT NULL,
  `id_presidenteMunicipal` int DEFAULT NULL,
  PRIMARY KEY (`id_cargo`),
  UNIQUE KEY `id_cargo` (`id_cargo`),
  KEY `id_presidente` (`id_presidente`),
  KEY `id_gobernador` (`id_gobernador`),
  KEY `id_diputado` (`id_diputado`),
  KEY `id_senador` (`id_senador`),
  KEY `id_presidenteMunicipal` (`id_presidenteMunicipal`),
  CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`id_presidente`) REFERENCES `presidente` (`id_presidente`),
  CONSTRAINT `cargo_ibfk_2` FOREIGN KEY (`id_gobernador`) REFERENCES `gobernador` (`id_gobernador`),
  CONSTRAINT `cargo_ibfk_3` FOREIGN KEY (`id_diputado`) REFERENCES `diputado` (`id_diputado`),
  CONSTRAINT `cargo_ibfk_4` FOREIGN KEY (`id_senador`) REFERENCES `senador` (`id_senador`),
  CONSTRAINT `cargo_ibfk_5` FOREIGN KEY (`id_presidenteMunicipal`) REFERENCES `presidente_municipal` (`id_presidenteMunicipal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coalicion`
--

DROP TABLE IF EXISTS `coalicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coalicion` (
  `id_coalicion` int NOT NULL AUTO_INCREMENT,
  `id_partido` int DEFAULT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_coalicion`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `id_partido` (`id_partido`),
  CONSTRAINT `coalicion_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partido_politico` (`id_partido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coalicion`
--

LOCK TABLES `coalicion` WRITE;
/*!40000 ALTER TABLE `coalicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `coalicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demarcacion`
--

DROP TABLE IF EXISTS `demarcacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demarcacion` (
  `id_demarcacion` int NOT NULL AUTO_INCREMENT,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_demarcacion`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `demarcacion_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demarcacion`
--

LOCK TABLES `demarcacion` WRITE;
/*!40000 ALTER TABLE `demarcacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `demarcacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diputado`
--

DROP TABLE IF EXISTS `diputado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diputado` (
  `id_diputado` int NOT NULL,
  PRIMARY KEY (`id_diputado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diputado`
--

LOCK TABLES `diputado` WRITE;
/*!40000 ALTER TABLE `diputado` DISABLE KEYS */;
/*!40000 ALTER TABLE `diputado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distritos`
--

DROP TABLE IF EXISTS `distritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distritos` (
  `id_distrito` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `num_habitantes` int DEFAULT NULL,
  `num_electores` int DEFAULT NULL,
  PRIMARY KEY (`id_distrito`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distritos`
--

LOCK TABLES `distritos` WRITE;
/*!40000 ALTER TABLE `distritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `distritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentacion`
--

DROP TABLE IF EXISTS `documentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentacion` (
  `id_documentacion` int NOT NULL AUTO_INCREMENT,
  `documento` varchar(50) NOT NULL,
  `verificacion_eligibilidad` varchar(50) NOT NULL,
  `declaracion_interes` varchar(50) NOT NULL,
  PRIMARY KEY (`id_documentacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentacion`
--

LOCK TABLES `documentacion` WRITE;
/*!40000 ALTER TABLE `documentacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `numero_habitantes` int DEFAULT NULL,
  `numero_electores` int DEFAULT NULL,
  `id_distrito` int DEFAULT NULL,
  `id_municipio` int DEFAULT NULL,
  PRIMARY KEY (`id_estado`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `id_distrito` (`id_distrito`),
  KEY `id_municipio` (`id_municipio`),
  CONSTRAINT `estados_ibfk_1` FOREIGN KEY (`id_distrito`) REFERENCES `distritos` (`id_distrito`),
  CONSTRAINT `estados_ibfk_2` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gobernador`
--

DROP TABLE IF EXISTS `gobernador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gobernador` (
  `id_gobernador` int NOT NULL,
  PRIMARY KEY (`id_gobernador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gobernador`
--

LOCK TABLES `gobernador` WRITE;
/*!40000 ALTER TABLE `gobernador` DISABLE KEYS */;
/*!40000 ALTER TABLE `gobernador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `cargo_solicitado` varchar(70) NOT NULL,
  `resultado` varchar(30) NOT NULL,
  `fecha_eleccion` date NOT NULL,
  PRIMARY KEY (`id_historial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `militancia`
--

DROP TABLE IF EXISTS `militancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `militancia` (
  `id_militancia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_militancia`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `militancia`
--

LOCK TABLES `militancia` WRITE;
/*!40000 ALTER TABLE `militancia` DISABLE KEYS */;
/*!40000 ALTER TABLE `militancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipios` (
  `id_municipio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `num_habitantes` int DEFAULT NULL,
  `num_electores` int DEFAULT NULL,
  PRIMARY KEY (`id_municipio`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido_politico`
--

DROP TABLE IF EXISTS `partido_politico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido_politico` (
  `id_partido` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `telefono` int DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_partido`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefono` (`telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido_politico`
--

LOCK TABLES `partido_politico` WRITE;
/*!40000 ALTER TABLE `partido_politico` DISABLE KEYS */;
/*!40000 ALTER TABLE `partido_politico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presidente`
--

DROP TABLE IF EXISTS `presidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presidente` (
  `id_presidente` int NOT NULL,
  PRIMARY KEY (`id_presidente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presidente`
--

LOCK TABLES `presidente` WRITE;
/*!40000 ALTER TABLE `presidente` DISABLE KEYS */;
/*!40000 ALTER TABLE `presidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presidente_municipal`
--

DROP TABLE IF EXISTS `presidente_municipal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presidente_municipal` (
  `id_presidenteMunicipal` int NOT NULL,
  PRIMARY KEY (`id_presidenteMunicipal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presidente_municipal`
--

LOCK TABLES `presidente_municipal` WRITE;
/*!40000 ALTER TABLE `presidente_municipal` DISABLE KEYS */;
/*!40000 ALTER TABLE `presidente_municipal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `senador`
--

DROP TABLE IF EXISTS `senador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `senador` (
  `id_senador` int NOT NULL,
  PRIMARY KEY (`id_senador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `senador`
--

LOCK TABLES `senador` WRITE;
/*!40000 ALTER TABLE `senador` DISABLE KEYS */;
/*!40000 ALTER TABLE `senador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-21 23:28:26
