CREATE DATABASE IF NOT EXISTS `collegato_dev_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `collegato_dev_2`;

SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `CATEGORIA_EMPRESA`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORIA_EMPRESA` (
  `CATEMP_ID` int NOT NULL AUTO_INCREMENT,
  `CATEMP_DESCRICAO` varchar(255) NOT NULL,
  PRIMARY KEY (`CATEMP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EMPRESA`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPRESA` (
  `EMP_ID` int NOT NULL AUTO_INCREMENT,
  `EMP_LOGOURL` text,
  `EMP_NOME` varchar(255) DEFAULT NULL,
  `EMP_TELEFONE` varchar(255) DEFAULT NULL,
  `EMP_CPFCNPJ` bigint DEFAULT NULL,
  `EMP_MUNICIPIO` varchar(255) DEFAULT NULL,
  `EMP_ESTADO` varchar(255) DEFAULT NULL,
  `EMP_PAIS` varchar(255) DEFAULT NULL,
  `EMP_ENDERECO` varchar(255) DEFAULT NULL,
  `EMP_NUMEROENDERECO` varchar(255) DEFAULT NULL,
  `EMP_CEP` int DEFAULT NULL,
  `EMP_CATEMP_ID` int NOT NULL,
  `EMP_USERINCLUI` int NOT NULL,
  `EMP_DTAINCLUI` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `EMP_USERALTERA` int DEFAULT NULL,
  `EMP_DTAALTERA` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`EMP_ID`),
  KEY `FK_89b46ca2467b0df03fce79ec876` (`EMP_CATEMP_ID`),
  CONSTRAINT `FK_89b46ca2467b0df03fce79ec876` FOREIGN KEY (`EMP_CATEMP_ID`) REFERENCES `CATEGORIA_EMPRESA` (`CATEMP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SALA`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SALA` (
  `SAL_ID` int NOT NULL AUTO_INCREMENT,
  `SAL_STATUS` int NOT NULL,
  `SAL_NOME` varchar(255) NOT NULL,
  `SAL_MULTIPLASMARCACOES` tinyint NOT NULL,
  `SAL_FOTO` text,
  `SAL_EMP_ID` int NOT NULL,
  PRIMARY KEY (`SAL_ID`),
  KEY `FK_574267a40682c8bf11147288204` (`SAL_EMP_ID`),
  CONSTRAINT `FK_574267a40682c8bf11147288204` FOREIGN KEY (`SAL_EMP_ID`) REFERENCES `EMPRESA` (`EMP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DISPONIBILIDADE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DISPONIBILIDADE` (
  `DIS_ID` int NOT NULL AUTO_INCREMENT,
  `DIS_ATIVO` tinyint NOT NULL DEFAULT '1',
  `DIS_HRABERTURA` varchar(255) NOT NULL,
  `DIS_HRFIM` varchar(255) NOT NULL,
  `DIS_DIASEMAMA` varchar(255) NOT NULL,
  `DIS_MINDIASCAN` int NOT NULL,
  `DIS_DIASEMANAINDEX` int NOT NULL,
  `DIS_INTERVALOMINUTOS` int NOT NULL,
  `DIS_SAL_ID` int NOT NULL,
  PRIMARY KEY (`DIS_ID`),
  KEY `FK_f30a7e9f855515e2c0aa144019b` (`DIS_SAL_ID`),
  CONSTRAINT `FK_f30a7e9f855515e2c0aa144019b` FOREIGN KEY (`DIS_SAL_ID`) REFERENCES `SALA` (`SAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERMISSAO`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERMISSAO` (
  `PER_ID` int NOT NULL AUTO_INCREMENT,
  `PER_DESCRI` varchar(255) NOT NULL,
  PRIMARY KEY (`PER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PESSOA`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PESSOA` (
  `PES_ID` int NOT NULL AUTO_INCREMENT,
  `PES_NAME` varchar(255) NOT NULL,
  `PES_CPFCNPJ` bigint DEFAULT NULL,
  `PES_FUNCAO` varchar(255) DEFAULT NULL,
  `PES_MUNICIPIO` varchar(255) DEFAULT NULL,
  `PES_ESTADO` varchar(255) DEFAULT NULL,
  `PES_PAIS` varchar(255) DEFAULT NULL,
  `PES_ENDERECO` varchar(255) DEFAULT NULL,
  `PES_NUMERO` int DEFAULT NULL,
  `PES_TELEFONE` bigint DEFAULT NULL,
  `PES_CEP` int DEFAULT NULL,
  `PES_DATANASCIMENTO` varchar(255) DEFAULT NULL,
  `PES_FOTO` text,
  `PES_USUINCLUI` int DEFAULT NULL,
  `PES_DTAINCLUI` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `PES_USUALTERA` int DEFAULT NULL,
  `PES_DTAALTERA` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`PES_ID`),
  UNIQUE KEY `IDX_a53dc47392a1cc15812eeb4db2` (`PES_CPFCNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `USUARIO`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO` (
  `USU_ID` int NOT NULL AUTO_INCREMENT,
  `USU_LOGIN` varchar(255) NOT NULL,
  `USU_SENHA` varchar(255) NOT NULL,
  `USU_STATUS` int NOT NULL,
  `USU_RESETCODE` int DEFAULT NULL,
  `USU_PUSHTOKEN` varchar(255) DEFAULT NULL,
  `USU_USERINCLUI` int DEFAULT NULL,
  `USU_DTAINCLUI` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `USU_USERALTERA` int DEFAULT NULL,
  `USU_DTAALTERA` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `USU_PER_ID` int NOT NULL,
  `USU_EMP_ID` int DEFAULT NULL,
  `USU_PES_ID` int NOT NULL,
  PRIMARY KEY (`USU_ID`),
  UNIQUE KEY `IDX_2e664de20d087b6012b5e96fef` (`USU_LOGIN`),
  UNIQUE KEY `REL_72e5963092a1344371390f3b82` (`USU_PES_ID`),
  KEY `FK_4205401485bf0da3aea1d54a05b` (`USU_EMP_ID`),
  KEY `FK_65e88823fe2463a18f31f181b75` (`USU_PER_ID`),
  CONSTRAINT `FK_4205401485bf0da3aea1d54a05b` FOREIGN KEY (`USU_EMP_ID`) REFERENCES `EMPRESA` (`EMP_ID`),
  CONSTRAINT `FK_65e88823fe2463a18f31f181b75` FOREIGN KEY (`USU_PER_ID`) REFERENCES `PERMISSAO` (`PER_ID`),
  CONSTRAINT `FK_72e5963092a1344371390f3b821` FOREIGN KEY (`USU_PES_ID`) REFERENCES `PESSOA` (`PES_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RESERVA`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESERVA` (
  `RES_ID` int NOT NULL AUTO_INCREMENT,
  `RES_DATA` datetime NOT NULL,
  `RES_HRINICIO` varchar(255) NOT NULL,
  `RES_HRFIM` varchar(255) NOT NULL,
  `RES_OBSERVACAO` varchar(255) NOT NULL,
  `RES_DIASEMANAINDEX` int NOT NULL,
  `RES_SAL_ID` int NOT NULL,
  `RES_USU_ID` int NOT NULL,
  PRIMARY KEY (`RES_ID`),
  KEY `FK_0767e79590a0bdacf77c9a3c87e` (`RES_SAL_ID`),
  KEY `FK_5c3fe33a482ae0e5df11fa0d154` (`RES_USU_ID`),
  CONSTRAINT `FK_0767e79590a0bdacf77c9a3c87e` FOREIGN KEY (`RES_SAL_ID`) REFERENCES `SALA` (`SAL_ID`),
  CONSTRAINT `FK_5c3fe33a482ae0e5df11fa0d154` FOREIGN KEY (`RES_USU_ID`) REFERENCES `USUARIO` (`USU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RESPONSAVEL`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESPONSAVEL` (
  `RESP_ID` int NOT NULL AUTO_INCREMENT,
  `RESP_SAL_ID` int NOT NULL,
  `RESP_USU_ID` int NOT NULL,
  PRIMARY KEY (`RESP_ID`),
  KEY `FK_4afbc71be61642fbe83e7d0e27a` (`RESP_SAL_ID`),
  KEY `FK_e475bbd515eb802571a4db23694` (`RESP_USU_ID`),
  CONSTRAINT `FK_4afbc71be61642fbe83e7d0e27a` FOREIGN KEY (`RESP_SAL_ID`) REFERENCES `SALA` (`SAL_ID`),
  CONSTRAINT `FK_e475bbd515eb802571a4db23694` FOREIGN KEY (`RESP_USU_ID`) REFERENCES `USUARIO` (`USU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STATUS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STATUS` (
  `STA_ID` int NOT NULL AUTO_INCREMENT,
  `STA_TIPO` varchar(255) NOT NULL,
  PRIMARY KEY (`STA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STATUS_RESERVA`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STATUS_RESERVA` (
  `STARES_ID` int NOT NULL AUTO_INCREMENT,
  `STARES_RES_ID` int NOT NULL,
  `STARES_STA_ID` int NOT NULL,
  `STARES_STA_DATE` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`STARES_ID`),
  KEY `FK_0a6d79d95a5ee8e5afffa511a3f` (`STARES_RES_ID`),
  KEY `FK_e27dfdafa163e846a8cebf7c884` (`STARES_STA_ID`),
  CONSTRAINT `FK_0a6d79d95a5ee8e5afffa511a3f` FOREIGN KEY (`STARES_RES_ID`) REFERENCES `RESERVA` (`RES_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_e27dfdafa163e846a8cebf7c884` FOREIGN KEY (`STARES_STA_ID`) REFERENCES `STATUS` (`STA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

INSERT INTO `CATEGORIA_EMPRESA` VALUES (1,'Advogado'),(2,'Dentista'),(3,'Coworking'),(4,'Saúde'),(5,'Prestações de Serviço');
INSERT INTO `PERMISSAO` VALUES (1,'Cliente'),(2,'Administrador'),(3,'Empresa'),(4,'Funcionario');
INSERT INTO `STATUS` VALUES (1,'Aguardando confirmação'),(2,'Confirmado'),(3,'Cancelado'),(4,'Finalizado'),(5,'Reprovado');
