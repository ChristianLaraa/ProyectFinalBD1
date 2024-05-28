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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,'2024-05-22 10:49:18','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Bruce Reyes Gomez'),(5,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Kyle Perez Santana'),(6,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Connor Caballero Cortes'),(7,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Bell Maria Hidalgo'),(8,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Paloma Suarez Santos'),(9,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Harper Reyes Castillo'),(10,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Brock Diego Mendez'),(11,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Quemby Vera Pardo'),(12,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Fredericka Gonzalez Castro'),(13,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Kimberly Isabella Diez'),(14,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Judah Castillo Munoz'),(15,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Maya Caballero Augustin'),(16,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Madison Mendez Lorenzo'),(17,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Debra Flores Cano'),(18,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Boris Pardo Sanchez'),(19,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Quamar Testudines ﾑez'),(20,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Ahmed Florencia Vega'),(21,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Emmanuel Sebastian Augustin'),(22,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Andrew Hernandez Castro'),(23,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Eve Ramos Vargas'),(24,'2024-05-22 11:30:14','root@localhost','CANDIDATO','Se agregó un nuevo candidato: Robert Trinidad Martin');
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
  `fnac` date NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
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
  KEY `fk_candidato_partido` (`id_partido`),
  KEY `fk_candidato_coalicion` (`id_coalicion`),
  KEY `fk_candidato_militancia` (`id_militancia`),
  KEY `fk_candidato_cargo` (`id_cargo`),
  KEY `fk_candidato_demarcacion` (`id_demarcacion`),
  KEY `fk_candidato_historial` (`id_historial`),
  KEY `fk_candidato_documentacion` (`id_documentacion`),
  CONSTRAINT `candidato_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partido_politico` (`id_partido`),
  CONSTRAINT `candidato_ibfk_2` FOREIGN KEY (`id_coalicion`) REFERENCES `coalicion` (`id_coalicion`),
  CONSTRAINT `candidato_ibfk_3` FOREIGN KEY (`id_militancia`) REFERENCES `militancia` (`id_militancia`),
  CONSTRAINT `candidato_ibfk_4` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  CONSTRAINT `candidato_ibfk_5` FOREIGN KEY (`id_demarcacion`) REFERENCES `demarcacion` (`id_demarcacion`),
  CONSTRAINT `candidato_ibfk_6` FOREIGN KEY (`id_historial`) REFERENCES `historial` (`id_historial`),
  CONSTRAINT `candidato_ibfk_7` FOREIGN KEY (`id_documentacion`) REFERENCES `documentacion` (`id_documentacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_candidato_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_candidato_coalicion` FOREIGN KEY (`id_coalicion`) REFERENCES `coalicion` (`id_coalicion`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_candidato_demarcacion` FOREIGN KEY (`id_demarcacion`) REFERENCES `demarcacion` (`id_demarcacion`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_candidato_documentacion` FOREIGN KEY (`id_documentacion`) REFERENCES `documentacion` (`id_documentacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_candidato_historial` FOREIGN KEY (`id_historial`) REFERENCES `historial` (`id_historial`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_candidato_militancia` FOREIGN KEY (`id_militancia`) REFERENCES `militancia` (`id_militancia`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_candidato_partido` FOREIGN KEY (`id_partido`) REFERENCES `partido_politico` (`id_partido`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato`
--

LOCK TABLES `candidato` WRITE;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` VALUES (2,'KNE22RTR8EC','Bruce','Reyes','Gomez','1977-05-28','Mexico City','8587855767','sed.sem.egestas@protonmail.org','sostenibilidad, tecnologia, infraestructura, inclusion, democracia, bienestar,\n progreso, oportunidad, crecimiento, equidad, derechos, paz, libertad, cultura, medio','1997-10-10',1,3,NULL,5,22,4,21),(23,'PXF11VUR1VA','Kyle','Perez','Santana','1978-08-31','San Juan del Río','6511713168','volutpat.nulla.facilisis@aol.net','transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad, crecimiento, equidad, derechos, paz,','2014-01-16',6,2,NULL,2,1,7,12),(24,'JER25GTR0VW','Connor','Caballero','Cortes','1992-05-09','Torreón','7175113948','vel@hotmail.org','salud, economía, empleo, seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso,','1990-10-16',NULL,NULL,1,4,6,14,4),(25,'ZVL68MBY8KS','Bell','Maria','Hidalgo','1955-03-19','Hermosillo','6347785918','arcu@google.ca','salud, economía, empleo, seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso,','1985-07-30',2,1,NULL,5,11,18,5),(26,'MNR16OID7TU','Paloma','Suarez','Santos','1986-05-24','Tehuacán','4882058272','aliquet@icloud.net','cambio, innovación, educación, salud, economía, empleo, seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión,','1984-09-25',7,NULL,NULL,2,2,1,13),(27,'WVK88LTL7DH','Harper','Reyes','Castillo','1982-08-30','Juárez','6269399561','nec.luctus@protonmail.net','igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad, crecimiento, equidad, derechos, paz, libertad,','2008-02-02',NULL,NULL,1,3,18,8,3),(28,'VQL51MJQ5SZ','Brock','Diego','Mendez','1987-12-21','Matamoros','8259883618','vivamus@protonmail.ca','justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad, crecimiento, equidad, derechos,','1989-03-13',7,NULL,NULL,1,13,6,20),(29,'UHP61XJR5ON','Quemby','Vera','Pardo','1963-06-29','Soledad de Graciano Sánchez','5297053407','cursus.diam@icloud.ca','innovación, educación, salud, economía, empleo, seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia,','2016-10-28',7,NULL,NULL,2,19,9,19),(30,'JVM54RSZ6ZD','Fredericka','Gonzalez','Castro','1954-08-16','San Juan del Río','3188819221','phasellus@icloud.org','economía, empleo, seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad,','2006-05-07',NULL,NULL,1,5,7,15,18),(31,'QMT96BKE5XQ','Kimberly','Isabella','Diez','1978-05-11','Navojoa','8616308657','nunc.nulla@yahoo.net','desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad, crecimiento, equidad, derechos, paz, libertad, cultura,','1995-06-16',8,NULL,NULL,2,3,5,1),(32,'FHU64KFF4KO','Judah','Castillo','Munoz','1959-12-11','Acuña','6754671638','egestas@protonmail.net','cambio, innovación, educación, salud, economía, empleo, seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión,','1981-01-09',6,2,NULL,5,12,10,10),(33,'UFQ00OQI4TA','Maya','Caballero','Augustin','1965-06-29','Guadalajara','8402870466','risus.at@icloud.couk','Liderazgo, cambio, innovación, educación, salud, economía, empleo, seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura,','2019-08-30',7,NULL,NULL,2,14,19,17),(34,'GIN27BUZ5JS','Madison','Mendez','Lorenzo','1979-12-29','Irapuato','0753320118','donec.nibh.enim@hotmail.ca','seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad, crecimiento, equidad,','2000-06-13',8,NULL,NULL,3,8,2,2),(35,'ZRB59PGE1MP','Debra','Flores','Cano','1967-01-28','San Juan del Río','4916573223','est.ac.mattis@outlook.org','desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad, crecimiento, equidad, derechos, paz, libertad, cultura,','1983-01-13',8,NULL,NULL,1,4,16,9),(36,'YOY10GYD3EF','Boris','Pardo','Sanchez','1979-09-15','Monterrey','4731556210','nec.cursus@protonmail.ca','economía, empleo, seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad,','2018-04-08',8,NULL,NULL,1,17,11,7),(37,'WRB45PRQ5YW','Quamar','Testudines','ﾑez','1974-06-02','Chilpancingo','2242812343','tortor.integer@yahoo.com','seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad, crecimiento, equidad,','1998-06-26',NULL,NULL,1,5,15,21,14),(38,'NKM38NST9HV','Ahmed','Florencia','Vega','1977-11-12','Villahermosa','2719234338','phasellus.at.augue@icloud.com','transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad, crecimiento, equidad, derechos, paz,','2005-04-20',7,NULL,NULL,4,9,12,11),(39,'ALC87TWM4DI','Emmanuel','Sebastian','Augustin','1968-05-24','Irapuato','1992325207','montes.nascetur@hotmail.ca','igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad, crecimiento, equidad, derechos, paz, libertad,','2000-11-28',3,1,NULL,2,21,17,16),(40,'DCR99DMK6DS','Andrew','Hernandez','Castro','1984-12-21','Tuxtla Gutiérrez','8662111321','mauris.ut@google.edu','economía, empleo, seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad,','1981-09-18',4,3,NULL,5,16,20,6),(41,'RDT45BIH4TJ','Eve','Ramos','Vargas','1995-04-22','Guadalupe','6815285502','quisque@protonmail.net','cambio, innovación, educación, salud, economía, empleo, seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión,','2013-03-03',NULL,NULL,1,1,10,13,15),(42,'DZV20LQR1VH','Robert','Trinidad','Martin','1968-03-11','Saltillo','1137597755','quisque@protonmail.couk','seguridad, justicia, transparencia, igualdad, desarrollo, sostenibilidad, tecnología, infraestructura, inclusión, democracia, bienestar, progreso, oportunidad, crecimiento, equidad,','2008-11-07',2,1,NULL,3,5,3,8);
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Presidente'),(2,'Gobernador'),(3,'Diputado'),(4,'Senador'),(5,'Presidente Municipal');
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
  `id_partido2` int DEFAULT NULL,
  `id_partido3` int DEFAULT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_coalicion`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `id_partido` (`id_partido`),
  KEY `fk_coalicion_partido2` (`id_partido2`),
  KEY `fk_coalicion_partido3` (`id_partido3`),
  CONSTRAINT `coalicion_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partido_politico` (`id_partido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_coalicion_partido2` FOREIGN KEY (`id_partido2`) REFERENCES `partido_politico` (`id_partido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_coalicion_partido3` FOREIGN KEY (`id_partido3`) REFERENCES `partido_politico` (`id_partido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coalicion`
--

LOCK TABLES `coalicion` WRITE;
/*!40000 ALTER TABLE `coalicion` DISABLE KEYS */;
INSERT INTO `coalicion` VALUES (1,2,3,NULL,'Unidos por México'),(2,5,6,NULL,'Alianza por el Futuro'),(3,1,4,NULL,'Juntos Somos Más');
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
  `id_municipio_o_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_demarcacion`),
  KEY `fk_demarcacion_estado` (`id_estado`),
  CONSTRAINT `demarcacion_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`),
  CONSTRAINT `fk_demarcacion_estado` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demarcacion`
--

LOCK TABLES `demarcacion` WRITE;
/*!40000 ALTER TABLE `demarcacion` DISABLE KEYS */;
INSERT INTO `demarcacion` VALUES (1,12,84),(2,28,188),(3,19,125),(4,3,17),(5,1,1),(6,23,155),(7,11,77),(8,9,6),(9,32,224),(10,21,145),(11,5,30),(12,20,138),(13,2,11),(14,29,201),(15,14,97),(16,22,154),(17,30,209),(18,7,49),(19,10,70),(20,25,170),(21,17,113),(22,8,50);
/*!40000 ALTER TABLE `demarcacion` ENABLE KEYS */;
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
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_distrito`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `fk_distritos_estado` (`id_estado`),
  CONSTRAINT `fk_distritos_estado` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distritos`
--

LOCK TABLES `distritos` WRITE;
/*!40000 ALTER TABLE `distritos` DISABLE KEYS */;
INSERT INTO `distritos` VALUES (1,'Álvaro Obregón',759137,550000,9),(2,'Coyoacán',620416,450000,9),(3,'Cuauhtémoc',531831,380000,9),(4,'Gustavo A. Madero',1160537,800000,9),(5,'Iztapalapa',1820885,1200000,9),(6,'Miguel Hidalgo',414470,300000,9),(7,'Tlalpan',677104,450000,9);
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
  `documento` text,
  `verificacion_eligibilidad` varchar(50) NOT NULL,
  `declaracion_interes` text,
  PRIMARY KEY (`id_documentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentacion`
--

LOCK TABLES `documentacion` WRITE;
/*!40000 ALTER TABLE `documentacion` DISABLE KEYS */;
INSERT INTO `documentacion` VALUES (1,'Acta de nacimiento','Verificado','Declaro no tener conflictos de interés en ninguna empresa privada.'),(2,'CURP','Verificado','Declaro tener participación en una ONG sin fines de lucro.'),(3,'INE','Verificado','Declaro ser miembro del Colegio de Abogados de México.'),(4,'Comprobante de domicilio','Verificado','Declaro no tener bienes inmuebles más allá de mi residencia.'),(5,'Título profesional','Verificado','Declaro no tener relaciones contractuales con el gobierno.'),(6,'Cédula profesional','Verificado','Declaro ser socio de una firma consultora, pero sin contratos gubernamentales.'),(7,'Carta de no antecedentes penales','Verificado','Declaro haber participado en varias conferencias de políticas públicas.'),(8,'Carta de residencia','Verificado','Declaro no tener inversiones en el extranjero.'),(9,'Certificado de salud','Verificado','Declaro no tener deudas significativas que puedan afectar mi juicio.'),(10,'Fotografía reciente','Verificado','Declaro haber recibido donaciones para actividades comunitarias.'),(11,'Declaración de impuestos','Verificado','Declaro haber cumplido con todas mis obligaciones fiscales.'),(12,'Estado de cuenta bancario','Verificado','Declaro tener una cuenta de ahorros sin movimientos significativos.'),(13,'Certificado de no inhabilitación','Verificado','Declaro no haber sido sancionado administrativamente.'),(14,'Carta de no conflicto de intereses','Verificado','Declaro que mis familiares no tienen contratos con el gobierno.'),(15,'Carta de aceptación de candidatura','Verificado','Declaro haber aceptado la candidatura sin presiones externas.'),(16,'Plan de gobierno','Verificado','Declaro haber elaborado mi plan de gobierno basándome en consultas ciudadanas.'),(17,'Propuesta económica','Verificado','Declaro no tener compromisos financieros con entidades privadas.'),(18,'Propuesta de seguridad','Verificado','Declaro haber consultado con expertos en seguridad para mi propuesta.'),(19,'Propuesta de educación','Verificado','Declaro mi compromiso con la transparencia en el sector educativo.'),(20,'Propuesta de salud','Verificado','Declaro no tener relaciones con empresas farmacéuticas.'),(21,'Propuesta de infraestructura','Verificado','Declaro haber considerado el impacto ambiental en mis propuestas de infraestructura.');
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
  PRIMARY KEY (`id_estado`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Aguascalientes',3509163,2090175),(2,'Baja California',2120472,931339),(3,'Baja California Sur',231197,172903),(4,'Campeche',4070728,2419404),(5,'Coahuila',4479082,1521707),(6,'Colima',4749268,3832595),(7,'Chiapas',4227459,3738257),(8,'Chihuahua',3440273,3113303),(9,'Ciudad de México',4049642,2293604),(10,'Durango',4381121,990484),(11,'Guanajuato',4980379,4823464),(12,'Guerrero',2343257,1157340),(13,'Hidalgo',4383689,3950448),(14,'Jalisco',2971102,1179704),(15,'Estado de México',941237,668290),(16,'Michoacán',2566246,2337761),(17,'Morelos',4012453,2594958),(18,'Nuevo León',1989557,606081),(19,'Nayarit',3164748,2999659),(20,'Oaxaca',4535871,672546),(21,'Puebla',1275070,564957),(22,'Querétaro',2919924,1940347),(23,'Quintana Roo',1346577,547223),(24,'San Luis Potosí',1292334,421428),(25,'Sinaloa',1564879,1163804),(26,'Sonora',396858,267268),(27,'Tabasco',3572553,2754730),(28,'Tamaulipas',2735248,415537),(29,'Tlaxcala',4813199,4375124),(30,'Veracruz',1924859,660126),(31,'Yucatán',3670669,1082398),(32,'Zacatecas',1005215,832428);
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (1,'Presidente Municipal','Electo','2018-07-01'),(2,'Diputado Federal','No Electo','2016-06-05'),(3,'Gobernador','Electo','2014-07-07'),(4,'Senador','No Electo','2012-07-01'),(5,'Regidor','Electo','2010-07-04'),(6,'Síndico','No Electo','2008-07-06'),(7,'Jefe de Gobierno','Electo','2006-07-02'),(8,'Diputado Local','No Electo','2004-07-04'),(9,'Presidente Municipal','No Electo','2018-07-01'),(10,'Diputado Federal','Electo','2016-06-05'),(11,'Gobernador','No Electo','2014-07-07'),(12,'Senador','Electo','2012-07-01'),(13,'Regidor','No Electo','2010-07-04'),(14,'Síndico','Electo','2008-07-06'),(15,'Jefe de Gobierno','No Electo','2006-07-02'),(16,'Diputado Local','Electo','2004-07-04'),(17,'Presidente Municipal','Electo','2002-07-07'),(18,'Diputado Federal','No Electo','2000-07-02'),(19,'Gobernador','Electo','1998-07-05'),(20,'Senador','No Electo','1996-07-07'),(21,'Regidor','Electo','1994-07-03');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `militancia`
--

LOCK TABLES `militancia` WRITE;
/*!40000 ALTER TABLE `militancia` DISABLE KEYS */;
INSERT INTO `militancia` VALUES (1,'independiente');
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
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_municipio`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `fk_municipios_estado` (`id_estado`),
  CONSTRAINT `fk_municipios_estado` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,'Aguascalientes',934424,543682,1),(2,'Jesús María',118173,75000,1),(3,'Rincón de Romos',51087,32000,1),(4,'Pabellón de Arteaga',46736,29000,1),(5,'San Francisco de los Romo',50946,33000,1),(6,'Calvillo',56292,34000,1),(7,'Asientos',45292,28000,1),(8,'Tijuana',1940922,1200000,2),(9,'Mexicali',1075636,800000,2),(10,'Ensenada',522768,350000,2),(11,'Rosarito',126890,80000,2),(12,'Tecate',108440,70000,2),(13,'San Quintín',104020,68000,2),(14,'San Felipe',16800,10000,2),(15,'La Paz',317764,189762,3),(16,'Los Cabos',351111,200000,3),(17,'Comondú',70448,45000,3),(18,'Loreto',18912,12000,3),(19,'Mulegé',63934,40000,3),(20,'Todos Santos',7545,5000,3),(21,'Cabo San Lucas',202694,150000,3),(22,'Campeche',294077,200000,4),(23,'Ciudad del Carmen',248303,180000,4),(24,'Champotón',82513,50000,4),(25,'Escárcega',58380,40000,4),(26,'Calkiní',49850,30000,4),(27,'Hecelchakán',28427,18000,4),(28,'Candelaria',43200,25000,4),(29,'Saltillo',879958,520000,5),(30,'Torreón',679288,450000,5),(31,'Monclova',237151,150000,5),(32,'Piedras Negras',169771,110000,5),(33,'Acuña',181426,120000,5),(34,'San Pedro',100879,65000,5),(35,'Frontera',83577,55000,5),(36,'Colima',150673,100000,6),(37,'Manzanillo',191031,130000,6),(38,'Tecomán',130690,85000,6),(39,'Villa de Álvarez',152571,105000,6),(40,'Comala',20573,13000,6),(41,'Coquimatlán',21188,14000,6),(42,'Armería',29062,18000,6),(43,'Tuxtla Gutiérrez',598710,400000,7),(44,'Tapachula',353706,250000,7),(45,'San Cristóbal de las Casas',215874,150000,7),(46,'Comitán',141013,90000,7),(47,'Palenque',108720,70000,7),(48,'Ocosingo',200446,130000,7),(49,'Cintalapa',88106,49201,7),(50,'Chihuahua',925762,650000,8),(51,'Juárez',1491583,900000,8),(52,'Delicias',148808,95000,8),(53,'Cuauhtémoc',183307,110000,8),(54,'Parral',123794,80000,8),(55,'Nuevo Casas Grandes',60619,40000,8),(56,'Camargo',57382,35000,8),(64,'Durango',654876,400000,10),(65,'Gómez Palacio',372344,250000,10),(66,'Lerdo',141201,90000,10),(67,'Pueblo Nuevo',49263,30000,10),(68,'Santiago Papasquiaro',48877,29000,10),(69,'Canatlán',33196,21000,10),(70,'Nuevo Ideal',28375,18000,10),(71,'León',1721215,1200000,11),(72,'Irapuato',651844,400000,11),(73,'Celaya',521169,350000,11),(74,'Salamanca',273271,180000,11),(75,'Silao',202672,130000,11),(76,'Guanajuato',194500,120000,11),(77,'San Miguel de Allende',174615,110000,11),(78,'Acapulco',779566,500000,12),(79,'Chilpancingo',214219,150000,12),(80,'Iguala',140363,90000,12),(81,'Zihuatanejo',125780,80000,12),(82,'Taxco',105944,70000,12),(83,'Chilapa',120790,80000,12),(84,'Tlapa',73781,50000,12),(85,'Pachuca',314331,250000,13),(86,'Tulancingo',167759,110000,13),(87,'Tizayuca',153152,100000,13),(88,'Tula de Allende',111648,70000,13),(89,'Tepeji del Río',87478,50000,13),(90,'Ixmiquilpan',91298,60000,13),(91,'Huejutla',115786,75000,13),(92,'Guadalajara',1488202,1200000,14),(93,'Zapopan',1425076,1100000,14),(94,'Tlaquepaque',678823,500000,14),(95,'Tonalá',459974,300000,14),(96,'Puerto Vallarta',291839,200000,14),(97,'Lagos de Moreno',172403,110000,14),(98,'Tepatitlán',141322,90000,14),(99,'Ecatepec',1655015,1200000,15),(100,'Nezahualcóyotl',1206313,900000,15),(101,'Naucalpan',834434,600000,15),(102,'Toluca',910608,680000,15),(103,'Tlalnepantla',715767,500000,15),(104,'Chimalhuacán',702924,500000,15),(105,'Atizapán de Zaragoza',511711,350000,15),(106,'Morelia',784776,540000,16),(107,'Uruapan',340408,200000,16),(108,'Zamora',186102,120000,16),(109,'Lázaro Cárdenas',192715,120000,16),(110,'Zitácuaro',185534,120000,16),(111,'Apatzingán',132515,80000,16),(112,'Pátzcuaro',89811,60000,16),(113,'Cuernavaca',366321,250000,17),(114,'Jiutepec',221713,150000,17),(115,'Temixco',141184,90000,17),(116,'Cuautla',187099,120000,17),(117,'Yautepec',110690,70000,17),(118,'Emiliano Zapata',107945,70000,17),(119,'Jojutla',61032,40000,17),(120,'Tepic',503330,300000,19),(121,'Bahía de Banderas',184225,120000,19),(122,'Xalisco',57396,35000,19),(123,'Compostela',65494,40000,19),(124,'Santiago Ixcuintla',87361,55000,19),(125,'San Blas',46589,30000,19),(126,'Ixtlán del Rio',30611,23000,19),(127,'Monterrey',1135512,900000,18),(128,'Guadalupe',673616,450000,18),(129,'San Nicolás de los Garza',443273,300000,18),(130,'Apodaca',652130,400000,18),(131,'Santa Catarina',304398,200000,18),(132,'San Pedro Garza García',132169,90000,NULL),(133,'General Escobedo',481214,300000,NULL),(134,'Oaxaca de Juárez',300050,200000,20),(135,'Salina Cruz',83526,50000,20),(136,'Juchitán',91123,60000,20),(137,'San Juan Bautista Tuxtepec',103609,70000,20),(138,'Heroica Ciudad de Huajuapan de León',78684,50000,20),(139,'Santa Cruz Xoxocotlán',92485,60000,20),(140,'Puerto Escondido',45684,30000,20),(141,'Puebla',1697960,1200000,21),(142,'Tehuacán',319375,200000,21),(143,'San Martín Texmelucan',155738,100000,21),(144,'Atlixco',137262,85000,21),(145,'San Pedro Cholula',140562,90000,21),(146,'San Andrés Cholula',137314,85000,21),(147,'Huauchinango',104213,60000,21),(148,'Querétaro',878931,600000,22),(149,'San Juan del Río',311047,200000,22),(150,'El Marqués',166497,100000,22),(151,'Corregidora',200667,120000,22),(152,'Tequisquiapan',72644,45000,22),(153,'Pedro Escobedo',65351,40000,22),(154,'Cadereyta de Montes',67315,40000,22),(155,'Cancún',888797,600000,23),(156,'Chetumal',151243,100000,23),(157,'Playa del Carmen',252702,150000,23),(158,'Cozumel',88987,50000,23),(159,'Tulum',46621,30000,23),(160,'Felipe Carrillo Puerto',81088,50000,23),(161,'José María Morelos',43036,25000,23),(162,'San Luis Potosí',911908,600000,24),(163,'Soledad de Graciano Sánchez',300214,200000,24),(164,'Ciudad Valles',176935,110000,24),(165,'Matehuala',101615,65000,24),(166,'Rioverde',98538,60000,24),(167,'Tamazunchale',96836,60000,24),(168,'Ébano',38828,25000,24),(169,'Culiacán',905265,650000,25),(170,'Mazatlán',502547,350000,25),(171,'Los Mochis',365967,240000,25),(172,'Guasave',300115,190000,25),(173,'Navolato',135603,85000,25),(174,'Escuinapa',62463,40000,25),(175,'El Fuerte',125674,75000,25),(176,'Hermosillo',936263,650000,26),(177,'Ciudad Obregón',436484,300000,26),(178,'Nogales',264782,180000,26),(179,'San Luis Río Colorado',210060,150000,26),(180,'Navojoa',164456,100000,26),(181,'Guaymas',156863,90000,26),(182,'Agua Prieta',79438,50000,26),(183,'Villahermosa',684847,450000,27),(184,'Cárdenas',282353,180000,27),(185,'Comalcalco',220231,140000,27),(186,'Macuspana',165729,100000,27),(187,'Huimanguillo',145285,90000,27),(188,'Jalpa de Méndez',84729,50000,27),(189,'Teapa',55380,30000,27),(190,'Reynosa',957327,700000,28),(191,'Matamoros',544606,400000,28),(192,'Nuevo Laredo',487436,350000,28),(193,'Ciudad Victoria',349688,250000,28),(194,'Tampico',314418,220000,28),(195,'Madero',209175,150000,28),(196,'Altamira',210177,140000,28),(197,'Tlaxcala',124018,80000,29),(198,'Apizaco',81320,55000,29),(199,'Huamantla',107143,70000,29),(200,'Chiautempan',71964,45000,29),(201,'San Pablo del Monte',85743,55000,29),(202,'Zacatelco',54314,35000,29),(203,'Contla',44512,30000,29),(204,'Xalapa',488531,300000,30),(205,'Veracruz',609964,400000,30),(206,'Coatzacoalcos',319187,200000,30),(207,'Córdoba',204748,120000,30),(208,'Poza Rica',200119,120000,30),(209,'Minatitlán',157840,100000,30),(210,'Tuxpan',154470,90000,30),(211,'Mérida',892363,600000,31),(212,'Valladolid',85913,50000,31),(213,'Tizimín',76812,45000,31),(214,'Progreso',58668,35000,31),(215,'Kanasín',141554,90000,31),(216,'Motul',42335,25000,31),(217,'Umán',56045,35000,31),(218,'Zacatecas',149607,100000,32),(219,'Fresnillo',240532,150000,32),(220,'Villanueva',29527,23000,32),(221,'Jerez',62219,40000,32),(222,'Sombrerete',70818,45000,32),(223,'Río Grande',62220,35000,32),(224,'Calera',41906,33000,32);
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
  `nombre` varchar(200) DEFAULT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_partido`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `telefono` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido_politico`
--

LOCK TABLES `partido_politico` WRITE;
/*!40000 ALTER TABLE `partido_politico` DISABLE KEYS */;
INSERT INTO `partido_politico` VALUES (1,'Partido Revolucionario Institucional','PRI','5512345678','contacto@pri.org.mx'),(2,'Partido Acción Nacional','PAN','5512345679','contacto@pan.org.mx'),(3,'Partido de la Revolución Democrática','PRD','5512345680','contacto@prd.org.mx'),(4,'Partido Verde Ecologista de México','PVEM','5512345681','contacto@pvem.org.mx'),(5,'Movimiento Regeneración Nacional','MORENA','5512345682','contacto@morena.org.mx'),(6,'Partido del Trabajo','PT','5512345683','contacto@pt.org.mx'),(7,'Movimiento Ciudadano','MC','5512345684','contacto@mc.org.mx'),(8,'Encuentro Social','ES','5512345685','contacto@es.org.mx');
/*!40000 ALTER TABLE `partido_politico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_candidatos_detallada`
--

DROP TABLE IF EXISTS `vista_candidatos_detallada`;
/*!50001 DROP VIEW IF EXISTS `vista_candidatos_detallada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_candidatos_detallada` AS SELECT 
 1 AS `Id`,
 1 AS `RFC`,
 1 AS `Nombre Completo`,
 1 AS `Fecha de Nacimiento`,
 1 AS `Direccion`,
 1 AS `Telefono`,
 1 AS `Email`,
 1 AS `Propuestas`,
 1 AS `Fecha Inscripcion`,
 1 AS `Partido Politico`,
 1 AS `Coalicion`,
 1 AS `Militancia`,
 1 AS `Cargo`,
 1 AS `Estado`,
 1 AS `Munipio o distrito`,
 1 AS `Cargo Solicitado Anteriormente`,
 1 AS `Resultado`,
 1 AS `Fecha de Eleccion`,
 1 AS `Documento`,
 1 AS `Verificación`,
 1 AS `Declaracion de Interes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_candidatos_por_cargo_solicitado`
--

DROP TABLE IF EXISTS `vista_candidatos_por_cargo_solicitado`;
/*!50001 DROP VIEW IF EXISTS `vista_candidatos_por_cargo_solicitado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_candidatos_por_cargo_solicitado` AS SELECT 
 1 AS `id`,
 1 AS `Nombre`,
 1 AS `Apellido Paterno`,
 1 AS `Apellido Materno`,
 1 AS `Cargo Solicitado`,
 1 AS `Fecha de Nacimiento`,
 1 AS `telefono`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_candidatos_por_estado`
--

DROP TABLE IF EXISTS `vista_candidatos_por_estado`;
/*!50001 DROP VIEW IF EXISTS `vista_candidatos_por_estado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_candidatos_por_estado` AS SELECT 
 1 AS `Id`,
 1 AS `Nombre`,
 1 AS `Apellido Paterno`,
 1 AS `Apellido Materno`,
 1 AS `Estado`,
 1 AS `Fecha de Nacimiento`,
 1 AS `telefono`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_documentacion_candidatos`
--

DROP TABLE IF EXISTS `vista_documentacion_candidatos`;
/*!50001 DROP VIEW IF EXISTS `vista_documentacion_candidatos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_documentacion_candidatos` AS SELECT 
 1 AS `Id`,
 1 AS `Nombre`,
 1 AS `Apellido Paterno`,
 1 AS `Apellido Materno`,
 1 AS `Documento`,
 1 AS `Verificacion`,
 1 AS `Declaracion`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_candidatos_detallada`
--

/*!50001 DROP VIEW IF EXISTS `vista_candidatos_detallada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_candidatos_detallada` AS select `c`.`id_candidato` AS `Id`,`c`.`rfc` AS `RFC`,concat(`c`.`nombre`,' ',`c`.`ap_paterno`,' ',`c`.`ap_materno`) AS `Nombre Completo`,`c`.`fnac` AS `Fecha de Nacimiento`,`c`.`direccion` AS `Direccion`,`c`.`telefono` AS `Telefono`,`c`.`email` AS `Email`,`c`.`propuestas` AS `Propuestas`,`c`.`finscrip` AS `Fecha Inscripcion`,`p`.`nombre` AS `Partido Politico`,`co`.`nombre` AS `Coalicion`,`m`.`nombre` AS `Militancia`,`ca`.`nombre_cargo` AS `Cargo`,`e`.`nombre` AS `Estado`,`d`.`id_municipio_o_estado` AS `Munipio o distrito`,`h`.`cargo_solicitado` AS `Cargo Solicitado Anteriormente`,`h`.`resultado` AS `Resultado`,`h`.`fecha_eleccion` AS `Fecha de Eleccion`,`doc`.`documento` AS `Documento`,`doc`.`verificacion_eligibilidad` AS `Verificación`,`doc`.`declaracion_interes` AS `Declaracion de Interes` from ((((((((`candidato` `c` left join `partido_politico` `p` on((`c`.`id_partido` = `p`.`id_partido`))) left join `coalicion` `co` on((`c`.`id_coalicion` = `co`.`id_coalicion`))) left join `militancia` `m` on((`c`.`id_militancia` = `m`.`id_militancia`))) left join `cargo` `ca` on((`c`.`id_cargo` = `ca`.`id_cargo`))) left join `demarcacion` `d` on((`c`.`id_demarcacion` = `d`.`id_demarcacion`))) left join `estados` `e` on((`d`.`id_estado` = `e`.`id_estado`))) left join `historial` `h` on((`c`.`id_historial` = `h`.`id_historial`))) left join `documentacion` `doc` on((`c`.`id_documentacion` = `doc`.`id_documentacion`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_candidatos_por_cargo_solicitado`
--

/*!50001 DROP VIEW IF EXISTS `vista_candidatos_por_cargo_solicitado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_candidatos_por_cargo_solicitado` AS select `c`.`id_candidato` AS `id`,`c`.`nombre` AS `Nombre`,`c`.`ap_paterno` AS `Apellido Paterno`,`c`.`ap_materno` AS `Apellido Materno`,`h`.`cargo_solicitado` AS `Cargo Solicitado`,`c`.`fnac` AS `Fecha de Nacimiento`,`c`.`telefono` AS `telefono`,`c`.`email` AS `email` from (`candidato` `c` left join `historial` `h` on((`c`.`id_historial` = `h`.`id_historial`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_candidatos_por_estado`
--

/*!50001 DROP VIEW IF EXISTS `vista_candidatos_por_estado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_candidatos_por_estado` AS select `c`.`id_candidato` AS `Id`,`c`.`nombre` AS `Nombre`,`c`.`ap_paterno` AS `Apellido Paterno`,`c`.`ap_materno` AS `Apellido Materno`,`e`.`nombre` AS `Estado`,`c`.`fnac` AS `Fecha de Nacimiento`,`c`.`telefono` AS `telefono`,`c`.`email` AS `email` from ((`candidato` `c` left join `demarcacion` `d` on((`c`.`id_demarcacion` = `d`.`id_demarcacion`))) left join `estados` `e` on((`d`.`id_estado` = `e`.`id_estado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_documentacion_candidatos`
--

/*!50001 DROP VIEW IF EXISTS `vista_documentacion_candidatos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_documentacion_candidatos` AS select `c`.`id_candidato` AS `Id`,`c`.`nombre` AS `Nombre`,`c`.`ap_paterno` AS `Apellido Paterno`,`c`.`ap_materno` AS `Apellido Materno`,`doc`.`documento` AS `Documento`,`doc`.`verificacion_eligibilidad` AS `Verificacion`,`doc`.`declaracion_interes` AS `Declaracion` from (`candidato` `c` left join `documentacion` `doc` on((`c`.`id_documentacion` = `doc`.`id_documentacion`))) */;
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

-- Dump completed on 2024-05-22 20:29:22
