CREATE DATABASE  IF NOT EXISTS `valyoodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `valyoodb`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: valyoodb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `empsol`
--

DROP TABLE IF EXISTS `empsol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empsol` (
  `EmpSolID` int NOT NULL,
  `ESSol` int NOT NULL,
  `ESEmp` int NOT NULL,
  PRIMARY KEY (`EmpSolID`),
  KEY `fk_EmpSol_idx` (`ESSol`),
  KEY `fk_EMpasol_idx` (`ESEmp`),
  CONSTRAINT `fk_EMpasol` FOREIGN KEY (`ESEmp`) REFERENCES `tblempleado` (`EmpID`),
  CONSTRAINT `fk_EmpSol` FOREIGN KEY (`ESSol`) REFERENCES `tblsolicitud` (`SolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empsol`
--

LOCK TABLES `empsol` WRITE;
/*!40000 ALTER TABLE `empsol` DISABLE KEYS */;
/*!40000 ALTER TABLE `empsol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novemp`
--

DROP TABLE IF EXISTS `novemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `novemp` (
  `NEID` int NOT NULL,
  `NENov` int NOT NULL,
  `NEEmp` int NOT NULL,
  PRIMARY KEY (`NEID`),
  KEY `fk_Nov_idx` (`NENov`),
  KEY `fk_EmpNov_idx` (`NEEmp`),
  CONSTRAINT `fk_EmpNov` FOREIGN KEY (`NEEmp`) REFERENCES `tblempleado` (`EmpID`),
  CONSTRAINT `fk_Nov` FOREIGN KEY (`NENov`) REFERENCES `tblnovedad` (`NovId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novemp`
--

LOCK TABLES `novemp` WRITE;
/*!40000 ALTER TABLE `novemp` DISABLE KEYS */;
/*!40000 ALTER TABLE `novemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcuenta`
--

DROP TABLE IF EXISTS `tblcuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcuenta` (
  `CuNumero` int NOT NULL,
  `CuFechaRegistro` date NOT NULL,
  `CuEstado` enum('Activa','Inactiva') NOT NULL DEFAULT 'Activa',
  `CuSede` int NOT NULL,
  `CuDeudor` int NOT NULL,
  PRIMARY KEY (`CuNumero`),
  KEY `fk_CuSede_idx` (`CuSede`),
  KEY `fk_CuDeu_idx` (`CuDeudor`),
  CONSTRAINT `fk_CuDeu` FOREIGN KEY (`CuDeudor`) REFERENCES `tbldeudor` (`DeuDocumento`),
  CONSTRAINT `fk_CuSede` FOREIGN KEY (`CuSede`) REFERENCES `tblsede` (`SedeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcuenta`
--

LOCK TABLES `tblcuenta` WRITE;
/*!40000 ALTER TABLE `tblcuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldeudor`
--

DROP TABLE IF EXISTS `tbldeudor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldeudor` (
  `DeuDocumento` int NOT NULL,
  `DeuTipoDocumento` varchar(30) NOT NULL,
  `DeuNombre` varchar(30) NOT NULL,
  `DeuApellido` varchar(30) NOT NULL,
  `DeuEmail` varchar(50) NOT NULL,
  `DeuTelefono` varchar(30) NOT NULL,
  `DeuUsuario` int NOT NULL,
  `DeuEstado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`DeuDocumento`),
  KEY `fk_usuariom_idx` (`DeuUsuario`),
  CONSTRAINT `fk_usuariom` FOREIGN KEY (`DeuUsuario`) REFERENCES `usuariorol` (`URID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldeudor`
--

LOCK TABLES `tbldeudor` WRITE;
/*!40000 ALTER TABLE `tbldeudor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldeudor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldocumentos`
--

DROP TABLE IF EXISTS `tbldocumentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldocumentos` (
  `DocId` int NOT NULL,
  `DocNombre` varchar(30) NOT NULL,
  `DocURL` varchar(150) NOT NULL,
  `DocDeudor` int NOT NULL,
  PRIMARY KEY (`DocId`),
  KEY `fk_Deudor_idx` (`DocDeudor`),
  CONSTRAINT `fk_Deudor` FOREIGN KEY (`DocDeudor`) REFERENCES `tbldeudor` (`DeuDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldocumentos`
--

LOCK TABLES `tbldocumentos` WRITE;
/*!40000 ALTER TABLE `tbldocumentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldocumentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblempleado`
--

DROP TABLE IF EXISTS `tblempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblempleado` (
  `EmpID` int NOT NULL,
  `EmpNombre` varchar(30) NOT NULL,
  `EmpApellido` varchar(30) NOT NULL,
  `EmpDocumento` varchar(20) NOT NULL,
  `EmpDireccion` varchar(30) NOT NULL,
  `EmpTelefono` varchar(20) NOT NULL,
  `EmpTipoDocumento` varchar(30) NOT NULL,
  `EmpUsuario` int NOT NULL,
  `EmpSede` int NOT NULL,
  `EmpEstado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`EmpID`),
  KEY `fk_sedeemp_idx` (`EmpSede`),
  KEY `fk_usuemp_idx` (`EmpUsuario`),
  CONSTRAINT `fk_sedeemp` FOREIGN KEY (`EmpSede`) REFERENCES `tblsede` (`SedeId`),
  CONSTRAINT `fk_usuemp` FOREIGN KEY (`EmpUsuario`) REFERENCES `usuariorol` (`URID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblempleado`
--

LOCK TABLES `tblempleado` WRITE;
/*!40000 ALTER TABLE `tblempleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblempleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfacturas`
--

DROP TABLE IF EXISTS `tblfacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblfacturas` (
  `FacNumero` int NOT NULL,
  `FacFechaPago` date NOT NULL,
  `FacValorPago` int NOT NULL,
  `FacPrestamos` int NOT NULL,
  PRIMARY KEY (`FacNumero`),
  KEY `fk_PresFac_idx` (`FacPrestamos`),
  CONSTRAINT `fk_PresFac` FOREIGN KEY (`FacPrestamos`) REFERENCES `tblprestamo` (`PreId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfacturas`
--

LOCK TABLES `tblfacturas` WRITE;
/*!40000 ALTER TABLE `tblfacturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblfacturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnovedad`
--

DROP TABLE IF EXISTS `tblnovedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnovedad` (
  `NovId` int NOT NULL,
  `NovNombre` varchar(30) NOT NULL,
  `NovApellido` varchar(30) NOT NULL,
  `NovDocumento` varchar(20) NOT NULL,
  `NovDescripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`NovId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnovedad`
--

LOCK TABLES `tblnovedad` WRITE;
/*!40000 ALTER TABLE `tblnovedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnovedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblprestamo`
--

DROP TABLE IF EXISTS `tblprestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblprestamo` (
  `PreId` int NOT NULL,
  `PreFechaInicio` date NOT NULL,
  `PreCuotas` int NOT NULL,
  `PreMonto` int NOT NULL,
  `PreInteres` int NOT NULL,
  `PreCuenta` int NOT NULL,
  PRIMARY KEY (`PreId`),
  KEY `fk_prestamo_idx` (`PreCuenta`),
  CONSTRAINT `fk_prestamo` FOREIGN KEY (`PreCuenta`) REFERENCES `tblcuenta` (`CuNumero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblprestamo`
--

LOCK TABLES `tblprestamo` WRITE;
/*!40000 ALTER TABLE `tblprestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblprestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrol`
--

DROP TABLE IF EXISTS `tblrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblrol` (
  `RolID` int NOT NULL,
  `RolNombre` varchar(30) NOT NULL,
  PRIMARY KEY (`RolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrol`
--

LOCK TABLES `tblrol` WRITE;
/*!40000 ALTER TABLE `tblrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsede`
--

DROP TABLE IF EXISTS `tblsede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsede` (
  `SedeId` int NOT NULL,
  `SedeNombre` varchar(50) NOT NULL,
  `SedeDireccion` varchar(50) NOT NULL,
  `SedeTelefono` varchar(50) NOT NULL,
  PRIMARY KEY (`SedeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsede`
--

LOCK TABLES `tblsede` WRITE;
/*!40000 ALTER TABLE `tblsede` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsolicitud`
--

DROP TABLE IF EXISTS `tblsolicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsolicitud` (
  `SolID` int NOT NULL,
  `SolMonto` int NOT NULL,
  `SolCuotas` int NOT NULL,
  `SolInteres` int NOT NULL,
  `SolDeudor` int NOT NULL,
  `SolEstado` enum('Aprobado','No aprobado') NOT NULL DEFAULT 'Aprobado',
  PRIMARY KEY (`SolID`),
  KEY `fk_DeuSol_idx` (`SolDeudor`),
  CONSTRAINT `fk_DeuSol` FOREIGN KEY (`SolDeudor`) REFERENCES `tbldeudor` (`DeuDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsolicitud`
--

LOCK TABLES `tblsolicitud` WRITE;
/*!40000 ALTER TABLE `tblsolicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsolicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblusuario`
--

DROP TABLE IF EXISTS `tblusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblusuario` (
  `UsuUsuario` int NOT NULL,
  `UsuContraseña` int NOT NULL,
  PRIMARY KEY (`UsuUsuario`),
  KEY `fk_usuario_idx` (`UsuContraseña`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusuario`
--

LOCK TABLES `tblusuario` WRITE;
/*!40000 ALTER TABLE `tblusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariorol`
--

DROP TABLE IF EXISTS `usuariorol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariorol` (
  `URID` int NOT NULL,
  `URRol` int NOT NULL,
  `URUsuario` int NOT NULL,
  PRIMARY KEY (`URID`),
  KEY `fk_usuario_idx` (`URUsuario`),
  KEY `fk_rol_idx` (`URRol`),
  CONSTRAINT `fk_rol` FOREIGN KEY (`URRol`) REFERENCES `tblrol` (`RolID`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`URUsuario`) REFERENCES `tblusuario` (`UsuUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariorol`
--

LOCK TABLES `usuariorol` WRITE;
/*!40000 ALTER TABLE `usuariorol` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariorol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-22 17:02:16
