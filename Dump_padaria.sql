-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: padaria
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `codigocliente` int(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `estado` char(2) NOT NULL DEFAULT 'MG',
  `cep` varchar(10) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`codigocliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'augusto','rua: radialista decio silveira','belo horizonte','MG','31.580-590','(31)3166-0257'),(3,'zelia','rua: avai','lugar nenhum','MG','33.555-666','(32)5555-6666'),(7,'teste','teste','teste','MG','33.333-333','(11)1111-1111'),(8,'rodrigo santos','rua: gonsalves dias, nº 54','belo horizonte','MG','64.579-556','(31)3188-4566');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comanda` (
  `cod_comanda` int(3) NOT NULL AUTO_INCREMENT,
  `data_venda` char(10) DEFAULT NULL,
  `valor_venda` decimal(6,2) DEFAULT NULL,
  `cliente` varchar(45) DEFAULT NULL,
  `forma_pagamento` enum('Dinheiro','Credito','Debito') DEFAULT NULL,
  PRIMARY KEY (`cod_comanda`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` VALUES (14,'02/06/2018',2.00,'7','Dinheiro'),(15,'02/06/2018',4.00,'3','Dinheiro'),(16,'05/06/2018',9.50,'1','Debito'),(17,'08/06/2018',6.50,'1','Credito'),(18,'15/06/2018',18.00,'8','Dinheiro');
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `cod_compra` int(3) NOT NULL AUTO_INCREMENT,
  `cod_produto` int(3) NOT NULL,
  `quantidade_produto` int(3) NOT NULL,
  PRIMARY KEY (`cod_compra`,`cod_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (14,3,1),(15,1,1),(15,3,1),(16,1,1),(16,4,2),(17,3,2),(17,4,1),(18,3,1),(18,4,3),(18,6,2);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `cod_fornecedor` int(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `nome_empresa` varchar(15) NOT NULL,
  `cnpj` char(18) NOT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` char(2) NOT NULL DEFAULT 'MG',
  PRIMARY KEY (`cod_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'rogerio','(31)3434-6465','itambe.for.com.br','itambe','25.157.536/2155-65','cotia','SP'),(2,'claudio','(31)3232-5452','nestle.for.com.br','nestle','56.889.453/0258-68','serra','ES'),(4,'jose','(32)3568-8451','trigoman.com.br','trigo mania','22.556.556/3232-56','contagem','MG'),(5,'alex','(31)3452-5956','doce.sbr.com.br','doce sabor','25.964.626/6565-25','Betim','MG');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `cod_funcionario` int(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `funcao` varchar(20) NOT NULL,
  `sexo` enum('F','M') NOT NULL,
  `cpf` char(14) NOT NULL,
  `data_adimissao` char(10) NOT NULL,
  `endereco` varchar(30) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` char(2) NOT NULL DEFAULT 'MG',
  `status` varchar(7) NOT NULL DEFAULT 'Inativo',
  PRIMARY KEY (`cod_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'joão','padeiro','M','652.324.865-63','2016/05/12','Rua: das acacias, nº 52','Contagem','MG','Ativo'),(2,'maria','caixa','F','545.865.658-95','08/06/2018','Rua: paraiba, nº 56','Contagem','MG','Inativo'),(5,'frederico','faxineiro','M','248.945.626-86','08/06/2018','Rua: celso lopes, nº 22','Contagem','MG','Ativo'),(6,'ana luiza','atendente','F','792.458.864-33','08/06/2018','Rua: andradas, nº 2541','Belo Horizonte','MG','Ativo');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `cod_login` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `permissao` varchar(45) DEFAULT NULL,
  `pergunta` varchar(45) DEFAULT NULL,
  `resposta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_login`,`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','75069204','Augusto junio vieira da silva','Administrador','qual nome do meu cachorro?','bob'),(3,'cj','1234','xablau','Comum',NULL,NULL),(4,'teste','teste','teste','Comum','qual endereço da minha avó?','teste'),(6,'teste01','teste01','teste01','Comum','qual e o meu melhor amigo?','teste01');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `cod_produto` int(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `valor_venda` decimal(6,2) NOT NULL,
  `descricao` text,
  `valor_compra` decimal(6,2) NOT NULL,
  `quantidade` int(3) DEFAULT NULL,
  `fornecedor` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'pão',2.50,'pão frances',1.00,78,'nestle'),(2,'pão',3.00,'pão de doce',0.80,78,'itambe'),(3,'leite',1.50,'leite desnatado',0.40,115,'itambe'),(4,'biscoito',3.50,'biscoito recheado',1.00,76,'nestle'),(5,'bolo',15.00,'bolo recheado',8.00,50,'itambe'),(6,'chiclete',3.00,'chiclete de goma',6.00,78,'nestle');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-18  0:36:42
