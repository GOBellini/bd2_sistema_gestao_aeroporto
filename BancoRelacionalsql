/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	11.8.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Avioes`
--

DROP TABLE IF EXISTS `Avioes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Avioes` (
  `id_aviao` int(11) NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `status_atual` varchar(45) NOT NULL,
  `estacionado_em` varchar(45) NOT NULL,
  `Empresas_Aereas_id_empresa_aerea` int(11) NOT NULL,
  UNIQUE KEY `Avioes_UNIQUE` (`id_aviao`),
  KEY `Avioes_Empresas_Aereas_FK` (`Empresas_Aereas_id_empresa_aerea`),
  CONSTRAINT `Avioes_Empresas_Aereas_FK` FOREIGN KEY (`Empresas_Aereas_id_empresa_aerea`) REFERENCES `Empresas_Aereas` (`id_empresa_aerea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Bagagens`
--

DROP TABLE IF EXISTS `Bagagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bagagens` (
  `id_bagagem` int(11) NOT NULL,
  `peso` decimal(10,0) NOT NULL,
  `tamanho` decimal(10,0) NOT NULL,
  `status_atual` varchar(45) NOT NULL,
  `Voos_id_voo` int(11) NOT NULL,
  `Clientes_id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` decimal(11,0) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefone` decimal(15,0) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Contatos`
--

DROP TABLE IF EXISTS `Contatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contatos` (
  `id_contato` int(11) NOT NULL,
  `telefone` int(15) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `url` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_contato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Empresas_Aereas`
--

DROP TABLE IF EXISTS `Empresas_Aereas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresas_Aereas` (
  `id_empresa_aerea` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cnpj` varchar(45) NOT NULL,
  `id_contato` int(11) NOT NULL,
  PRIMARY KEY (`id_empresa_aerea`),
  UNIQUE KEY `Empresas_Aereas_UNIQUE` (`id_contato`),
  CONSTRAINT `Empresas_Aereas_Contatos_FK` FOREIGN KEY (`id_contato`) REFERENCES `Contatos` (`id_contato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Empresas_Terceirizadas`
--

DROP TABLE IF EXISTS `Empresas_Terceirizadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresas_Terceirizadas` (
  `id_empresa_terceira` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cnpj` decimal(10,0) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `telefone` decimal(10,0) NOT NULL,
  `email` varchar(45) NOT NULL,
  `lado_aeroporto` varchar(45) NOT NULL,
  `espaco` varchar(45) DEFAULT NULL,
  `id_contato` int(11) NOT NULL,
  PRIMARY KEY (`id_empresa_terceira`),
  UNIQUE KEY `Empresas_Terceirizadas_UNIQUE` (`id_contato`),
  CONSTRAINT `Empresas_Terceirizadas_Contatos_FK` FOREIGN KEY (`id_contato`) REFERENCES `Contatos` (`id_contato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Estacionamento`
--

DROP TABLE IF EXISTS `Estacionamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estacionamento` (
  `id_vaga` int(11) NOT NULL AUTO_INCREMENT,
  `piso` int(11) NOT NULL,
  `setor` char(1) NOT NULL,
  `status` decimal(1,0) NOT NULL,
  `Funcionarios_id_funcionario` int(11) DEFAULT NULL,
  `Clientes_id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_vaga`),
  KEY `Estacionamento_Clientes_FK` (`Clientes_id_cliente`),
  KEY `Estacionamento_Funcionarios_FK` (`Funcionarios_id_funcionario`),
  CONSTRAINT `Estacionamento_Clientes_FK` FOREIGN KEY (`Clientes_id_cliente`) REFERENCES `Clientes` (`id_cliente`),
  CONSTRAINT `Estacionamento_Funcionarios_FK` FOREIGN KEY (`Funcionarios_id_funcionario`) REFERENCES `Funcionarios` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Funcionarios`
--

DROP TABLE IF EXISTS `Funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionarios` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` decimal(11,0) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefone` decimal(15,0) NOT NULL,
  `profissao` varchar(45) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `Empresas_Terceirizadas_id_empresa_terceira` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `Funcionarios_Empresas_Terceirizadas_FK` (`Empresas_Terceirizadas_id_empresa_terceira`),
  CONSTRAINT `Funcionarios_Empresas_Terceirizadas_FK` FOREIGN KEY (`Empresas_Terceirizadas_id_empresa_terceira`) REFERENCES `Empresas_Terceirizadas` (`id_empresa_terceira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pagementos`
--

DROP TABLE IF EXISTS `Pagementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pagementos` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `valor_total` decimal(12,2) NOT NULL,
  `tipo_pagamento` varchar(45) NOT NULL,
  `data_pagamento` date NOT NULL,
  `motivo_pagamento` varchar(45) NOT NULL,
  `Clientes_id_cliente` int(11) DEFAULT NULL,
  `Empresas_Terceirizadas_id_empresa_terceira` int(11) DEFAULT NULL,
  `Empresas_Aereas_id_empresa_aerea` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `Pagementos_Empresas_Aereas_FK_1` (`Empresas_Aereas_id_empresa_aerea`),
  KEY `Pagementos_Clientes_FK` (`Clientes_id_cliente`),
  CONSTRAINT `Pagementos_Clientes_FK` FOREIGN KEY (`Clientes_id_cliente`) REFERENCES `Clientes` (`id_cliente`),
  CONSTRAINT `Pagementos_Empresas_Aereas_FK` FOREIGN KEY (`Empresas_Aereas_id_empresa_aerea`) REFERENCES `Empresas_Aereas` (`id_empresa_aerea`),
  CONSTRAINT `Pagementos_Empresas_Aereas_FK_1` FOREIGN KEY (`Empresas_Aereas_id_empresa_aerea`) REFERENCES `Empresas_Aereas` (`id_empresa_aerea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portoes`
--

DROP TABLE IF EXISTS `Portoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portoes` (
  `id_portao` int(11) NOT NULL AUTO_INCREMENT,
  `status_atual` varchar(45) NOT NULL,
  `Avioes_id_aviao` int(11) DEFAULT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_portao`),
  KEY `Portoes_Avioes_FK` (`Avioes_id_aviao`),
  CONSTRAINT `Portoes_Avioes_FK` FOREIGN KEY (`Avioes_id_aviao`) REFERENCES `Avioes` (`id_aviao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Voos`
--

DROP TABLE IF EXISTS `Voos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Voos` (
  `id_voo` int(11) NOT NULL AUTO_INCREMENT,
  `status_atual` varchar(45) NOT NULL,
  `origem` varchar(45) NOT NULL,
  `destino` varchar(45) NOT NULL,
  `horario_partida` datetime NOT NULL,
  `horario_chegada` datetime NOT NULL,
  `Avioes_id_aviao` int(11) NOT NULL,
  `Empresas_Aereas_id_empresa_aerea` int(11) NOT NULL,
  PRIMARY KEY (`id_voo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-11-09  9:06:12
