-- MySQL dump 10.13  Distrib 8.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: Weberp
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accountgroups`
--

DROP TABLE IF EXISTS `accountgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountgroups` (
  `groupname` char(30) NOT NULL DEFAULT '',
  `sectioninaccounts` smallint NOT NULL DEFAULT '0',
  `pandl` tinyint NOT NULL DEFAULT '1',
  `sequenceintb` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupname`),
  KEY `sequenceintb` (`sequenceintb`),
  KEY `sectioninaccounts` (`sectioninaccounts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountgroups`
--

LOCK TABLES `accountgroups` WRITE;
/*!40000 ALTER TABLE `accountgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountsection`
--

DROP TABLE IF EXISTS `accountsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountsection` (
  `sectionid` int NOT NULL DEFAULT '0',
  `sectionname` text NOT NULL,
  PRIMARY KEY (`sectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountsection`
--

LOCK TABLES `accountsection` WRITE;
/*!40000 ALTER TABLE `accountsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `areacode` char(2) NOT NULL DEFAULT '',
  `areadescription` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`areacode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankaccounts`
--

DROP TABLE IF EXISTS `bankaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankaccounts` (
  `accountcode` int NOT NULL DEFAULT '0',
  `bankaccountname` char(50) NOT NULL DEFAULT '',
  `bankaccountnumber` char(50) NOT NULL DEFAULT '',
  `bankaddress` char(50) DEFAULT NULL,
  PRIMARY KEY (`accountcode`),
  KEY `bankaccountname` (`bankaccountname`),
  KEY `bankaccountnumber` (`bankaccountnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccounts`
--

LOCK TABLES `bankaccounts` WRITE;
/*!40000 ALTER TABLE `bankaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banktrans`
--

DROP TABLE IF EXISTS `banktrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banktrans` (
  `banktransid` bigint NOT NULL AUTO_INCREMENT,
  `type` smallint NOT NULL DEFAULT '0',
  `transno` bigint NOT NULL DEFAULT '0',
  `bankact` int NOT NULL DEFAULT '0',
  `ref` varchar(50) NOT NULL DEFAULT '',
  `amountcleared` double NOT NULL DEFAULT '0',
  `exrate` double NOT NULL DEFAULT '1',
  `transdate` date NOT NULL DEFAULT '2023-01-01',
  `banktranstype` varchar(30) NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `currcode` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`banktransid`),
  KEY `bankact` (`bankact`,`ref`),
  KEY `transdate` (`transdate`),
  KEY `transtype` (`banktranstype`),
  KEY `type` (`type`,`transno`),
  KEY `currcode` (`currcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banktrans`
--

LOCK TABLES `banktrans` WRITE;
/*!40000 ALTER TABLE `banktrans` DISABLE KEYS */;
/*!40000 ALTER TABLE `banktrans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bom`
--

DROP TABLE IF EXISTS `bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bom` (
  `parent` char(20) NOT NULL DEFAULT '',
  `component` char(20) NOT NULL DEFAULT '',
  `workcentreadded` char(5) NOT NULL DEFAULT '',
  `loccode` char(5) NOT NULL DEFAULT '',
  `effectiveafter` date NOT NULL DEFAULT '2023-01-01',
  `effectiveto` date NOT NULL DEFAULT '9999-12-31',
  `quantity` double(16,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`parent`,`component`,`workcentreadded`,`loccode`),
  KEY `component` (`component`),
  KEY `effectiveafter` (`effectiveafter`),
  KEY `effectiveto` (`effectiveto`),
  KEY `loccode` (`loccode`),
  KEY `parent` (`parent`,`effectiveafter`,`effectiveto`,`loccode`),
  KEY `parent_2` (`parent`),
  KEY `workcentreadded` (`workcentreadded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bom`
--

LOCK TABLES `bom` WRITE;
/*!40000 ALTER TABLE `bom` DISABLE KEYS */;
/*!40000 ALTER TABLE `bom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buckets`
--

DROP TABLE IF EXISTS `buckets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buckets` (
  `workcentre` char(5) NOT NULL DEFAULT '',
  `availdate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `capacity` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`workcentre`,`availdate`),
  KEY `workcentre` (`workcentre`),
  KEY `availdate` (`availdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buckets`
--

LOCK TABLES `buckets` WRITE;
/*!40000 ALTER TABLE `buckets` DISABLE KEYS */;
/*!40000 ALTER TABLE `buckets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chartdetails`
--

DROP TABLE IF EXISTS `chartdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chartdetails` (
  `accountcode` int NOT NULL DEFAULT '0',
  `period` smallint NOT NULL DEFAULT '0',
  `budget` double NOT NULL DEFAULT '0',
  `actual` double NOT NULL DEFAULT '0',
  `bfwd` double NOT NULL DEFAULT '0',
  `bfwdbudget` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountcode`,`period`),
  KEY `period` (`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chartdetails`
--

LOCK TABLES `chartdetails` WRITE;
/*!40000 ALTER TABLE `chartdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `chartdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chartmaster`
--

DROP TABLE IF EXISTS `chartmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chartmaster` (
  `accountcode` int NOT NULL DEFAULT '0',
  `accountname` char(50) NOT NULL DEFAULT '',
  `group_` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`accountcode`),
  KEY `accountcode` (`accountcode`),
  KEY `accountname` (`accountname`),
  KEY `group_` (`group_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chartmaster`
--

LOCK TABLES `chartmaster` WRITE;
/*!40000 ALTER TABLE `chartmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `chartmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cogsglpostings`
--

DROP TABLE IF EXISTS `cogsglpostings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cogsglpostings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `area` char(2) NOT NULL DEFAULT '',
  `stkcat` varchar(6) NOT NULL DEFAULT '',
  `glcode` int NOT NULL DEFAULT '0',
  `salestype` char(2) NOT NULL DEFAULT 'an',
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_stkcat` (`area`,`stkcat`,`salestype`),
  KEY `area` (`area`),
  KEY `stkcat` (`stkcat`),
  KEY `glcode` (`glcode`),
  KEY `salestype` (`salestype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cogsglpostings`
--

LOCK TABLES `cogsglpostings` WRITE;
/*!40000 ALTER TABLE `cogsglpostings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cogsglpostings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `coycode` int NOT NULL DEFAULT '1',
  `coyname` varchar(50) NOT NULL DEFAULT '',
  `gstno` varchar(20) NOT NULL DEFAULT '',
  `companynumber` varchar(20) NOT NULL DEFAULT '0',
  `regoffice1` varchar(40) NOT NULL,
  `regoffice2` varchar(40) NOT NULL,
  `regoffice3` varchar(40) NOT NULL,
  `regoffice4` varchar(40) NOT NULL,
  `regoffice5` varchar(20) NOT NULL DEFAULT '',
  `regoffice6` varchar(15) NOT NULL DEFAULT '',
  `telephone` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `currencydefault` varchar(4) NOT NULL DEFAULT '',
  `debtorsact` int NOT NULL DEFAULT '70000',
  `pytdiscountact` int NOT NULL DEFAULT '55000',
  `creditorsact` int NOT NULL DEFAULT '80000',
  `payrollact` int NOT NULL DEFAULT '84000',
  `grnact` int NOT NULL DEFAULT '72000',
  `exchangediffact` int NOT NULL DEFAULT '65000',
  `purchasesexchangediffact` int NOT NULL DEFAULT '0',
  `retainedearnings` int NOT NULL DEFAULT '90000',
  `gllink_debtors` tinyint(1) DEFAULT '1',
  `gllink_creditors` tinyint(1) DEFAULT '1',
  `gllink_stock` tinyint(1) DEFAULT '1',
  `freightact` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`coycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `confname` varchar(35) NOT NULL DEFAULT '',
  `confvalue` text NOT NULL,
  PRIMARY KEY (`confname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractbom`
--

DROP TABLE IF EXISTS `contractbom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractbom` (
  `contractref` char(20) NOT NULL DEFAULT '',
  `component` char(20) NOT NULL DEFAULT '',
  `workcentreadded` char(5) NOT NULL DEFAULT '',
  `loccode` char(5) NOT NULL DEFAULT '',
  `quantity` double(16,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`contractref`,`component`,`workcentreadded`,`loccode`),
  KEY `component` (`component`),
  KEY `loccode` (`loccode`),
  KEY `contractref` (`contractref`),
  KEY `workcentreadded` (`workcentreadded`),
  KEY `workcentreadded_2` (`workcentreadded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractbom`
--

LOCK TABLES `contractbom` WRITE;
/*!40000 ALTER TABLE `contractbom` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractbom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractreqts`
--

DROP TABLE IF EXISTS `contractreqts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractreqts` (
  `contractreqid` int NOT NULL AUTO_INCREMENT,
  `contract` char(20) NOT NULL DEFAULT '',
  `component` char(40) NOT NULL DEFAULT '',
  `quantity` double(16,4) NOT NULL DEFAULT '1.0000',
  `priceperunit` decimal(20,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`contractreqid`),
  KEY `contract` (`contract`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractreqts`
--

LOCK TABLES `contractreqts` WRITE;
/*!40000 ALTER TABLE `contractreqts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractreqts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `contractref` varchar(20) NOT NULL DEFAULT '',
  `contractdescription` varchar(50) NOT NULL DEFAULT '',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `status` varchar(10) NOT NULL DEFAULT 'quotation',
  `categoryid` varchar(6) NOT NULL DEFAULT '',
  `typeabbrev` char(2) NOT NULL DEFAULT '',
  `orderno` int NOT NULL DEFAULT '0',
  `quotedpricefx` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `margin` double(16,4) NOT NULL DEFAULT '1.0000',
  `woref` varchar(20) NOT NULL DEFAULT '',
  `requireddate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `canceldate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `quantityreqd` double(16,4) NOT NULL DEFAULT '1.0000',
  `specifications` longblob NOT NULL,
  `datequoted` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `units` varchar(15) NOT NULL DEFAULT 'each',
  `drawing` longblob NOT NULL,
  `rate` double(16,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`contractref`),
  KEY `orderno` (`orderno`),
  KEY `categoryid` (`categoryid`),
  KEY `status` (`status`),
  KEY `typeabbrev` (`typeabbrev`),
  KEY `woref` (`woref`),
  KEY `debtorno` (`debtorno`,`branchcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `currency` char(20) NOT NULL DEFAULT '',
  `currabrev` char(3) NOT NULL DEFAULT '',
  `country` char(50) NOT NULL DEFAULT '',
  `hundredsname` char(15) NOT NULL DEFAULT 'cents',
  `rate` double(16,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`currabrev`),
  KEY `country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custallocns`
--

DROP TABLE IF EXISTS `custallocns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custallocns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amt` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `datealloc` date NOT NULL DEFAULT '2023-01-01',
  `transid_allocfrom` int NOT NULL DEFAULT '0',
  `transid_allocto` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `datealloc` (`datealloc`),
  KEY `transid_allocfrom` (`transid_allocfrom`),
  KEY `transid_allocto` (`transid_allocto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custallocns`
--

LOCK TABLES `custallocns` WRITE;
/*!40000 ALTER TABLE `custallocns` DISABLE KEYS */;
/*!40000 ALTER TABLE `custallocns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custbranch`
--

DROP TABLE IF EXISTS `custbranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custbranch` (
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `brname` varchar(40) NOT NULL DEFAULT '',
  `braddress1` varchar(40) NOT NULL DEFAULT '',
  `braddress2` varchar(40) NOT NULL DEFAULT '',
  `braddress3` varchar(40) NOT NULL DEFAULT '',
  `braddress4` varchar(50) NOT NULL DEFAULT '',
  `braddress5` varchar(20) NOT NULL DEFAULT '',
  `braddress6` varchar(15) NOT NULL DEFAULT '',
  `estdeliverydays` smallint NOT NULL DEFAULT '1',
  `area` char(2) NOT NULL DEFAULT '',
  `salesman` varchar(4) NOT NULL DEFAULT '',
  `fwddate` smallint NOT NULL DEFAULT '0',
  `phoneno` varchar(20) NOT NULL DEFAULT '',
  `faxno` varchar(20) NOT NULL DEFAULT '',
  `contactname` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `defaultlocation` varchar(5) NOT NULL DEFAULT '',
  `taxgroupid` tinyint NOT NULL DEFAULT '1',
  `defaultshipvia` int NOT NULL DEFAULT '1',
  `disabletrans` tinyint NOT NULL DEFAULT '0',
  `brpostaddr1` varchar(40) NOT NULL DEFAULT '',
  `brpostaddr2` varchar(40) NOT NULL DEFAULT '',
  `brpostaddr3` varchar(30) NOT NULL DEFAULT '',
  `brpostaddr4` varchar(20) NOT NULL DEFAULT '',
  `brpostaddr5` varchar(20) NOT NULL DEFAULT '',
  `brpostaddr6` varchar(15) NOT NULL DEFAULT '',
  `custbranchcode` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`branchcode`,`debtorno`),
  KEY `branchcode` (`branchcode`),
  KEY `brname` (`brname`),
  KEY `debtorno` (`debtorno`),
  KEY `salesman` (`salesman`),
  KEY `area` (`area`),
  KEY `defaultlocation` (`defaultlocation`),
  KEY `defaultshipvia` (`defaultshipvia`),
  KEY `taxgroupid` (`taxgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custbranch`
--

LOCK TABLES `custbranch` WRITE;
/*!40000 ALTER TABLE `custbranch` DISABLE KEYS */;
/*!40000 ALTER TABLE `custbranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debtorsmaster`
--

DROP TABLE IF EXISTS `debtorsmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debtorsmaster` (
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(40) NOT NULL DEFAULT '',
  `address1` varchar(40) NOT NULL DEFAULT '',
  `address2` varchar(40) NOT NULL DEFAULT '',
  `address3` varchar(40) NOT NULL DEFAULT '',
  `address4` varchar(50) NOT NULL DEFAULT '',
  `address5` varchar(20) NOT NULL,
  `address6` varchar(15) NOT NULL,
  `currcode` char(3) NOT NULL DEFAULT '',
  `salestype` char(2) NOT NULL DEFAULT '',
  `clientsince` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `holdreason` smallint NOT NULL DEFAULT '0',
  `paymentterms` char(2) NOT NULL DEFAULT 'f',
  `discount` double(16,4) NOT NULL DEFAULT '0.0000',
  `pymtdiscount` double(16,4) NOT NULL DEFAULT '0.0000',
  `lastpaid` double(16,4) NOT NULL DEFAULT '0.0000',
  `lastpaiddate` datetime DEFAULT NULL,
  `creditlimit` double NOT NULL DEFAULT '1000',
  `taxref` varchar(20) NOT NULL DEFAULT '',
  `invaddrbranch` tinyint NOT NULL DEFAULT '0',
  `discountcode` char(2) NOT NULL DEFAULT '',
  `ediinvoices` tinyint NOT NULL DEFAULT '0',
  `ediorders` tinyint NOT NULL DEFAULT '0',
  `edireference` varchar(20) NOT NULL DEFAULT '',
  `editransport` varchar(5) NOT NULL DEFAULT 'email',
  `ediaddress` varchar(50) NOT NULL DEFAULT '',
  `ediserveruser` varchar(20) NOT NULL DEFAULT '',
  `ediserverpwd` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`debtorno`),
  KEY `currency` (`currcode`),
  KEY `holdreason` (`holdreason`),
  KEY `name` (`name`),
  KEY `paymentterms` (`paymentterms`),
  KEY `salestype` (`salestype`),
  KEY `ediinvoices` (`ediinvoices`),
  KEY `ediorders` (`ediorders`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debtorsmaster`
--

LOCK TABLES `debtorsmaster` WRITE;
/*!40000 ALTER TABLE `debtorsmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `debtorsmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debtortrans`
--

DROP TABLE IF EXISTS `debtortrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debtortrans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transno` int NOT NULL DEFAULT '0',
  `type` smallint NOT NULL DEFAULT '0',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `trandate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `prd` smallint NOT NULL DEFAULT '0',
  `settled` tinyint NOT NULL DEFAULT '0',
  `reference` varchar(20) NOT NULL DEFAULT '',
  `tpe` char(2) NOT NULL DEFAULT '',
  `order_` int NOT NULL DEFAULT '0',
  `rate` double(16,6) NOT NULL DEFAULT '0.000000',
  `ovamount` double NOT NULL DEFAULT '0',
  `ovgst` double NOT NULL DEFAULT '0',
  `ovfreight` double NOT NULL DEFAULT '0',
  `ovdiscount` double NOT NULL DEFAULT '0',
  `diffonexch` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `invtext` text,
  `shipvia` varchar(10) NOT NULL DEFAULT '',
  `edisent` tinyint NOT NULL DEFAULT '0',
  `consignment` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `debtorno` (`debtorno`,`branchcode`),
  KEY `order_` (`order_`),
  KEY `prd` (`prd`),
  KEY `tpe` (`tpe`),
  KEY `type` (`type`),
  KEY `settled` (`settled`),
  KEY `trandate` (`trandate`),
  KEY `transno` (`transno`),
  KEY `type_2` (`type`,`transno`),
  KEY `edisent` (`edisent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debtortrans`
--

LOCK TABLES `debtortrans` WRITE;
/*!40000 ALTER TABLE `debtortrans` DISABLE KEYS */;
/*!40000 ALTER TABLE `debtortrans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debtortranstaxes`
--

DROP TABLE IF EXISTS `debtortranstaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debtortranstaxes` (
  `debtortransid` int NOT NULL,
  `taxauthid` tinyint NOT NULL,
  `taxamount` double NOT NULL,
  PRIMARY KEY (`debtortransid`,`taxauthid`),
  KEY `taxauthid` (`taxauthid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debtortranstaxes`
--

LOCK TABLES `debtortranstaxes` WRITE;
/*!40000 ALTER TABLE `debtortranstaxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `debtortranstaxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discountmatrix`
--

DROP TABLE IF EXISTS `discountmatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discountmatrix` (
  `salestype` char(2) NOT NULL DEFAULT '',
  `discountcategory` char(2) NOT NULL DEFAULT '',
  `quantitybreak` int NOT NULL DEFAULT '1',
  `discountrate` double(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`salestype`,`discountcategory`,`quantitybreak`),
  KEY `quantitybreak` (`quantitybreak`),
  KEY `discountcategory` (`discountcategory`),
  KEY `salestype` (`salestype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountmatrix`
--

LOCK TABLES `discountmatrix` WRITE;
/*!40000 ALTER TABLE `discountmatrix` DISABLE KEYS */;
/*!40000 ALTER TABLE `discountmatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edi_orders_seg_groups`
--

DROP TABLE IF EXISTS `edi_orders_seg_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edi_orders_seg_groups` (
  `seggroupno` tinyint NOT NULL DEFAULT '0',
  `maxoccur` int NOT NULL DEFAULT '0',
  `parentseggroup` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`seggroupno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edi_orders_seg_groups`
--

LOCK TABLES `edi_orders_seg_groups` WRITE;
/*!40000 ALTER TABLE `edi_orders_seg_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `edi_orders_seg_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edi_orders_segs`
--

DROP TABLE IF EXISTS `edi_orders_segs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edi_orders_segs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `segtag` char(3) NOT NULL DEFAULT '',
  `seggroup` tinyint NOT NULL DEFAULT '0',
  `maxoccur` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `segtag` (`segtag`),
  KEY `segno` (`seggroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edi_orders_segs`
--

LOCK TABLES `edi_orders_segs` WRITE;
/*!40000 ALTER TABLE `edi_orders_segs` DISABLE KEYS */;
/*!40000 ALTER TABLE `edi_orders_segs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ediitemmapping`
--

DROP TABLE IF EXISTS `ediitemmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ediitemmapping` (
  `supporcust` varchar(4) NOT NULL DEFAULT '',
  `partnercode` varchar(10) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `partnerstockid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`supporcust`,`partnercode`,`stockid`),
  KEY `partnercode` (`partnercode`),
  KEY `stockid` (`stockid`),
  KEY `partnerstockid` (`partnerstockid`),
  KEY `supporcust` (`supporcust`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ediitemmapping`
--

LOCK TABLES `ediitemmapping` WRITE;
/*!40000 ALTER TABLE `ediitemmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ediitemmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edimessageformat`
--

DROP TABLE IF EXISTS `edimessageformat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edimessageformat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `partnercode` varchar(10) NOT NULL DEFAULT '',
  `messagetype` varchar(6) NOT NULL DEFAULT '',
  `section` varchar(7) NOT NULL DEFAULT '',
  `sequenceno` int NOT NULL DEFAULT '0',
  `linetext` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `partnercode` (`partnercode`,`messagetype`,`sequenceno`),
  KEY `section` (`section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edimessageformat`
--

LOCK TABLES `edimessageformat` WRITE;
/*!40000 ALTER TABLE `edimessageformat` DISABLE KEYS */;
/*!40000 ALTER TABLE `edimessageformat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freightcosts`
--

DROP TABLE IF EXISTS `freightcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freightcosts` (
  `shipcostfromid` int NOT NULL AUTO_INCREMENT,
  `locationfrom` varchar(5) NOT NULL DEFAULT '',
  `destination` varchar(40) NOT NULL DEFAULT '',
  `shipperid` int NOT NULL DEFAULT '0',
  `cubrate` double(16,2) NOT NULL DEFAULT '0.00',
  `kgrate` double(16,2) NOT NULL DEFAULT '0.00',
  `maxkgs` double(16,2) NOT NULL DEFAULT '999999.00',
  `maxcub` double(16,2) NOT NULL DEFAULT '999999.00',
  `fixedprice` double(16,2) NOT NULL DEFAULT '0.00',
  `minimumchg` double(16,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`shipcostfromid`),
  KEY `destination` (`destination`),
  KEY `locationfrom` (`locationfrom`),
  KEY `shipperid` (`shipperid`),
  KEY `destination_2` (`destination`,`locationfrom`,`shipperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freightcosts`
--

LOCK TABLES `freightcosts` WRITE;
/*!40000 ALTER TABLE `freightcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `freightcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gltrans`
--

DROP TABLE IF EXISTS `gltrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gltrans` (
  `counterindex` int NOT NULL AUTO_INCREMENT,
  `type` smallint NOT NULL DEFAULT '0',
  `typeno` bigint NOT NULL DEFAULT '1',
  `chequeno` int NOT NULL DEFAULT '0',
  `trandate` date NOT NULL DEFAULT '2023-01-01',
  `periodno` smallint NOT NULL DEFAULT '0',
  `account` int NOT NULL DEFAULT '0',
  `narrative` varchar(200) NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `posted` tinyint NOT NULL DEFAULT '0',
  `jobref` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`counterindex`),
  KEY `account` (`account`),
  KEY `chequeno` (`chequeno`),
  KEY `periodno` (`periodno`),
  KEY `posted` (`posted`),
  KEY `trandate` (`trandate`),
  KEY `typeno` (`typeno`),
  KEY `type_and_number` (`type`,`typeno`),
  KEY `jobref` (`jobref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gltrans`
--

LOCK TABLES `gltrans` WRITE;
/*!40000 ALTER TABLE `gltrans` DISABLE KEYS */;
/*!40000 ALTER TABLE `gltrans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grns`
--

DROP TABLE IF EXISTS `grns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grns` (
  `grnbatch` smallint NOT NULL DEFAULT '0',
  `grnno` int NOT NULL AUTO_INCREMENT,
  `podetailitem` int NOT NULL DEFAULT '0',
  `itemcode` varchar(20) NOT NULL DEFAULT '',
  `deliverydate` date NOT NULL DEFAULT '2023-01-01',
  `itemdescription` varchar(100) NOT NULL DEFAULT '',
  `qtyrecd` double(16,4) NOT NULL DEFAULT '0.0000',
  `quantityinv` double(16,4) NOT NULL DEFAULT '0.0000',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`grnno`),
  KEY `deliverydate` (`deliverydate`),
  KEY `itemcode` (`itemcode`),
  KEY `podetailitem` (`podetailitem`),
  KEY `supplierid` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grns`
--

LOCK TABLES `grns` WRITE;
/*!40000 ALTER TABLE `grns` DISABLE KEYS */;
/*!40000 ALTER TABLE `grns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holdreasons`
--

DROP TABLE IF EXISTS `holdreasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holdreasons` (
  `reasoncode` smallint NOT NULL DEFAULT '1',
  `reasondescription` char(30) NOT NULL DEFAULT '',
  `dissallowinvoices` tinyint NOT NULL DEFAULT '-1',
  PRIMARY KEY (`reasoncode`),
  KEY `reasoncode` (`reasoncode`),
  KEY `reasondescription` (`reasondescription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holdreasons`
--

LOCK TABLES `holdreasons` WRITE;
/*!40000 ALTER TABLE `holdreasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `holdreasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lastcostrollup`
--

DROP TABLE IF EXISTS `lastcostrollup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lastcostrollup` (
  `stockid` char(20) NOT NULL DEFAULT '',
  `totalonhand` double(16,4) NOT NULL DEFAULT '0.0000',
  `matcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `labcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `oheadcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `categoryid` char(6) NOT NULL DEFAULT '',
  `stockact` int NOT NULL DEFAULT '0',
  `adjglact` int NOT NULL DEFAULT '0',
  `newmatcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `newlabcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `newoheadcost` decimal(20,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lastcostrollup`
--

LOCK TABLES `lastcostrollup` WRITE;
/*!40000 ALTER TABLE `lastcostrollup` DISABLE KEYS */;
/*!40000 ALTER TABLE `lastcostrollup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `locationname` varchar(50) NOT NULL DEFAULT '',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL DEFAULT '',
  `deladd3` varchar(40) NOT NULL DEFAULT '',
  `deladd4` varchar(40) NOT NULL DEFAULT '',
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `taxprovinceid` tinyint NOT NULL DEFAULT '1',
  `managed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`loccode`),
  KEY `taxprovinceid` (`taxprovinceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locstock`
--

DROP TABLE IF EXISTS `locstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locstock` (
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantity` double(16,1) NOT NULL DEFAULT '0.0',
  `reorderlevel` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`loccode`,`stockid`),
  KEY `stockid` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locstock`
--

LOCK TABLES `locstock` WRITE;
/*!40000 ALTER TABLE `locstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `locstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loctransfers`
--

DROP TABLE IF EXISTS `loctransfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loctransfers` (
  `reference` int NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `shipqty` int NOT NULL DEFAULT '0',
  `recqty` int NOT NULL DEFAULT '0',
  `shipdate` date NOT NULL DEFAULT '2023-01-01',
  `recdate` date NOT NULL DEFAULT '2023-01-01',
  `shiploc` varchar(7) NOT NULL DEFAULT '',
  `recloc` varchar(7) NOT NULL DEFAULT '',
  KEY `reference` (`reference`,`stockid`),
  KEY `shiploc` (`shiploc`),
  KEY `recloc` (`recloc`),
  KEY `stockid` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='stores shipments to and from locations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loctransfers`
--

LOCK TABLES `loctransfers` WRITE;
/*!40000 ALTER TABLE `loctransfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `loctransfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdeliverydifferenceslog`
--

DROP TABLE IF EXISTS `orderdeliverydifferenceslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdeliverydifferenceslog` (
  `orderno` int NOT NULL DEFAULT '0',
  `invoiceno` int NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantitydiff` double(16,4) NOT NULL DEFAULT '0.0000',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branch` varchar(10) NOT NULL DEFAULT '',
  `can_or_bo` char(3) NOT NULL DEFAULT 'can',
  PRIMARY KEY (`orderno`,`invoiceno`,`stockid`),
  KEY `stockid` (`stockid`),
  KEY `debtorno` (`debtorno`,`branch`),
  KEY `can_or_bo` (`can_or_bo`),
  KEY `orderno` (`orderno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeliverydifferenceslog`
--

LOCK TABLES `orderdeliverydifferenceslog` WRITE;
/*!40000 ALTER TABLE `orderdeliverydifferenceslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdeliverydifferenceslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethods`
--

DROP TABLE IF EXISTS `paymentmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethods` (
  `paymentid` tinyint NOT NULL AUTO_INCREMENT,
  `paymentname` varchar(15) NOT NULL DEFAULT '',
  `paymenttype` int NOT NULL DEFAULT '1',
  `receipttype` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`paymentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethods`
--

LOCK TABLES `paymentmethods` WRITE;
/*!40000 ALTER TABLE `paymentmethods` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentterms`
--

DROP TABLE IF EXISTS `paymentterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentterms` (
  `termsindicator` char(2) NOT NULL DEFAULT '',
  `terms` char(40) NOT NULL DEFAULT '',
  `daysbeforedue` smallint NOT NULL DEFAULT '0',
  `dayinfollowingmonth` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`termsindicator`),
  KEY `daysbeforedue` (`daysbeforedue`),
  KEY `dayinfollowingmonth` (`dayinfollowingmonth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentterms`
--

LOCK TABLES `paymentterms` WRITE;
/*!40000 ALTER TABLE `paymentterms` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentterms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periods` (
  `periodno` smallint NOT NULL DEFAULT '0',
  `lastdate_in_period` date NOT NULL DEFAULT '2023-01-01',
  PRIMARY KEY (`periodno`),
  KEY `lastdate_in_period` (`lastdate_in_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `typeabbrev` char(2) NOT NULL DEFAULT '',
  `currabrev` char(3) NOT NULL DEFAULT '',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`stockid`,`typeabbrev`,`currabrev`,`debtorno`),
  KEY `currabrev` (`currabrev`),
  KEY `debtorno` (`debtorno`),
  KEY `stockid` (`stockid`),
  KEY `typeabbrev` (`typeabbrev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchdata`
--

DROP TABLE IF EXISTS `purchdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchdata` (
  `supplierno` char(10) NOT NULL DEFAULT '',
  `stockid` char(20) NOT NULL DEFAULT '',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `suppliersuom` char(50) NOT NULL DEFAULT '',
  `conversionfactor` double(16,4) NOT NULL DEFAULT '1.0000',
  `supplierdescription` char(50) NOT NULL DEFAULT '',
  `leadtime` smallint NOT NULL DEFAULT '1',
  `preferred` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplierno`,`stockid`),
  KEY `stockid` (`stockid`),
  KEY `supplierno` (`supplierno`),
  KEY `preferred` (`preferred`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchdata`
--

LOCK TABLES `purchdata` WRITE;
/*!40000 ALTER TABLE `purchdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchorderdetails`
--

DROP TABLE IF EXISTS `purchorderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchorderdetails` (
  `podetailitem` int NOT NULL AUTO_INCREMENT,
  `orderno` int NOT NULL DEFAULT '0',
  `itemcode` varchar(20) NOT NULL DEFAULT '',
  `deliverydate` date NOT NULL DEFAULT '2023-01-01',
  `itemdescription` varchar(100) NOT NULL DEFAULT '',
  `glcode` int NOT NULL DEFAULT '0',
  `qtyinvoiced` double(16,4) NOT NULL DEFAULT '0.0000',
  `unitprice` double(16,4) NOT NULL DEFAULT '0.0000',
  `actprice` double(16,4) NOT NULL DEFAULT '0.0000',
  `stdcostunit` double(16,4) NOT NULL DEFAULT '0.0000',
  `quantityord` double(16,4) NOT NULL DEFAULT '0.0000',
  `quantityrecd` double(16,4) NOT NULL DEFAULT '0.0000',
  `shiptref` int NOT NULL DEFAULT '0',
  `jobref` varchar(20) NOT NULL DEFAULT '',
  `completed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`podetailitem`),
  KEY `deliverydate` (`deliverydate`),
  KEY `glcode` (`glcode`),
  KEY `itemcode` (`itemcode`),
  KEY `jobref` (`jobref`),
  KEY `orderno` (`orderno`),
  KEY `shiptref` (`shiptref`),
  KEY `completed` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchorderdetails`
--

LOCK TABLES `purchorderdetails` WRITE;
/*!40000 ALTER TABLE `purchorderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchorderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchorders`
--

DROP TABLE IF EXISTS `purchorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchorders` (
  `orderno` int NOT NULL AUTO_INCREMENT,
  `supplierno` varchar(10) NOT NULL DEFAULT '',
  `comments` longblob,
  `orddate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `rate` double(16,4) NOT NULL DEFAULT '1.0000',
  `dateprinted` datetime DEFAULT NULL,
  `allowprint` tinyint NOT NULL DEFAULT '1',
  `initiator` varchar(10) DEFAULT NULL,
  `requisitionno` varchar(15) DEFAULT NULL,
  `intostocklocation` varchar(5) NOT NULL DEFAULT '',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL DEFAULT '',
  `deladd3` varchar(40) NOT NULL DEFAULT '',
  `deladd4` varchar(40) NOT NULL DEFAULT '',
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`orderno`),
  KEY `orddate` (`orddate`),
  KEY `supplierno` (`supplierno`),
  KEY `intostocklocation` (`intostocklocation`),
  KEY `allowprintpo` (`allowprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchorders`
--

LOCK TABLES `purchorders` WRITE;
/*!40000 ALTER TABLE `purchorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurringsalesorders`
--

DROP TABLE IF EXISTS `recurringsalesorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurringsalesorders` (
  `recurrorderno` int NOT NULL AUTO_INCREMENT,
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `customerref` varchar(50) NOT NULL DEFAULT '',
  `buyername` varchar(50) DEFAULT NULL,
  `comments` longblob,
  `orddate` date NOT NULL DEFAULT '2023-01-01',
  `ordertype` char(2) NOT NULL DEFAULT '',
  `shipvia` int NOT NULL DEFAULT '0',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL,
  `deladd3` varchar(40) NOT NULL,
  `deladd4` varchar(40) DEFAULT NULL,
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `contactphone` varchar(25) DEFAULT NULL,
  `contactemail` varchar(25) DEFAULT NULL,
  `deliverto` varchar(40) NOT NULL DEFAULT '',
  `freightcost` double NOT NULL DEFAULT '0',
  `fromstkloc` varchar(5) NOT NULL DEFAULT '',
  `lastrecurrence` date NOT NULL DEFAULT '2023-01-01',
  `frequency` tinyint NOT NULL DEFAULT '0',
  `stopdate` date NOT NULL DEFAULT '2023-01-01',
  `autoinvoice` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`recurrorderno`),
  KEY `debtorno` (`debtorno`),
  KEY `orddate` (`orddate`),
  KEY `ordertype` (`ordertype`),
  KEY `locationindex` (`fromstkloc`),
  KEY `branchcode` (`branchcode`,`debtorno`),
  KEY `shipvia` (`shipvia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurringsalesorders`
--

LOCK TABLES `recurringsalesorders` WRITE;
/*!40000 ALTER TABLE `recurringsalesorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `recurringsalesorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurrsalesorderdetails`
--

DROP TABLE IF EXISTS `recurrsalesorderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurrsalesorderdetails` (
  `recurrorderno` int NOT NULL DEFAULT '0',
  `stkcode` varchar(20) NOT NULL DEFAULT '',
  `unitprice` double(16,4) NOT NULL DEFAULT '0.0000',
  `quantity` double(16,4) NOT NULL DEFAULT '0.0000',
  `discountpercent` double(16,4) NOT NULL DEFAULT '0.0000',
  `narrative` text NOT NULL,
  PRIMARY KEY (`recurrorderno`,`stkcode`),
  KEY `recurrorderno` (`recurrorderno`),
  KEY `stkcode` (`stkcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurrsalesorderdetails`
--

LOCK TABLES `recurrsalesorderdetails` WRITE;
/*!40000 ALTER TABLE `recurrsalesorderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `recurrsalesorderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportcolumns`
--

DROP TABLE IF EXISTS `reportcolumns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportcolumns` (
  `reportid` smallint NOT NULL DEFAULT '0',
  `colno` smallint NOT NULL DEFAULT '0',
  `heading1` varchar(15) NOT NULL DEFAULT '',
  `heading2` varchar(15) DEFAULT NULL,
  `calculation` tinyint(1) NOT NULL DEFAULT '0',
  `periodfrom` smallint DEFAULT NULL,
  `periodto` smallint DEFAULT NULL,
  `datatype` varchar(15) DEFAULT NULL,
  `colnumerator` tinyint DEFAULT NULL,
  `coldenominator` tinyint DEFAULT NULL,
  `calcoperator` char(1) DEFAULT NULL,
  `budgetoractual` tinyint(1) NOT NULL DEFAULT '0',
  `valformat` char(1) NOT NULL DEFAULT 'n',
  `constant` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`reportid`,`colno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportcolumns`
--

LOCK TABLES `reportcolumns` WRITE;
/*!40000 ALTER TABLE `reportcolumns` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportcolumns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportheaders`
--

DROP TABLE IF EXISTS `reportheaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportheaders` (
  `reportid` smallint NOT NULL AUTO_INCREMENT,
  `reportheading` varchar(80) NOT NULL DEFAULT '',
  `groupbydata1` varchar(15) NOT NULL DEFAULT '',
  `newpageafter1` tinyint(1) NOT NULL DEFAULT '0',
  `lower1` varchar(10) NOT NULL DEFAULT '',
  `upper1` varchar(10) NOT NULL DEFAULT '',
  `groupbydata2` varchar(15) DEFAULT NULL,
  `newpageafter2` tinyint(1) NOT NULL DEFAULT '0',
  `lower2` varchar(10) DEFAULT NULL,
  `upper2` varchar(10) DEFAULT NULL,
  `groupbydata3` varchar(15) DEFAULT NULL,
  `newpageafter3` tinyint(1) NOT NULL DEFAULT '0',
  `lower3` varchar(10) DEFAULT NULL,
  `upper3` varchar(10) DEFAULT NULL,
  `groupbydata4` varchar(15) NOT NULL DEFAULT '',
  `newpageafter4` tinyint(1) NOT NULL DEFAULT '0',
  `upper4` varchar(10) NOT NULL DEFAULT '',
  `lower4` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`reportid`),
  KEY `reportheading` (`reportheading`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportheaders`
--

LOCK TABLES `reportheaders` WRITE;
/*!40000 ALTER TABLE `reportheaders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportheaders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesanalysis`
--

DROP TABLE IF EXISTS `salesanalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesanalysis` (
  `typeabbrev` char(2) NOT NULL DEFAULT '',
  `periodno` smallint NOT NULL DEFAULT '0',
  `amt` double(16,4) NOT NULL DEFAULT '0.0000',
  `cost` double(16,4) NOT NULL DEFAULT '0.0000',
  `cust` varchar(10) NOT NULL DEFAULT '',
  `custbranch` varchar(10) NOT NULL DEFAULT '',
  `qty` double(16,4) NOT NULL DEFAULT '0.0000',
  `disc` double(16,4) NOT NULL DEFAULT '0.0000',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `area` char(2) NOT NULL DEFAULT '',
  `budgetoractual` tinyint(1) NOT NULL DEFAULT '0',
  `salesperson` char(3) NOT NULL DEFAULT '',
  `stkcategory` varchar(6) NOT NULL DEFAULT '',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `custbranch` (`custbranch`),
  KEY `cust` (`cust`),
  KEY `periodno` (`periodno`),
  KEY `stkcategory` (`stkcategory`),
  KEY `stockid` (`stockid`),
  KEY `typeabbrev` (`typeabbrev`),
  KEY `area` (`area`),
  KEY `budgetoractual` (`budgetoractual`),
  KEY `salesperson` (`salesperson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesanalysis`
--

LOCK TABLES `salesanalysis` WRITE;
/*!40000 ALTER TABLE `salesanalysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesanalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salescat`
--

DROP TABLE IF EXISTS `salescat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salescat` (
  `salescatid` tinyint NOT NULL AUTO_INCREMENT,
  `parentcatid` tinyint DEFAULT NULL,
  `salescatname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`salescatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salescat`
--

LOCK TABLES `salescat` WRITE;
/*!40000 ALTER TABLE `salescat` DISABLE KEYS */;
/*!40000 ALTER TABLE `salescat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salescatprod`
--

DROP TABLE IF EXISTS `salescatprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salescatprod` (
  `salescatid` tinyint NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`salescatid`,`stockid`),
  KEY `salescatid` (`salescatid`),
  KEY `stockid` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salescatprod`
--

LOCK TABLES `salescatprod` WRITE;
/*!40000 ALTER TABLE `salescatprod` DISABLE KEYS */;
/*!40000 ALTER TABLE `salescatprod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesglpostings`
--

DROP TABLE IF EXISTS `salesglpostings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesglpostings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `area` char(2) NOT NULL DEFAULT '',
  `stkcat` varchar(6) NOT NULL DEFAULT '',
  `discountglcode` int NOT NULL DEFAULT '0',
  `salesglcode` int NOT NULL DEFAULT '0',
  `salestype` char(2) NOT NULL DEFAULT 'an',
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_stkcat` (`area`,`stkcat`,`salestype`),
  KEY `area` (`area`),
  KEY `stkcat` (`stkcat`),
  KEY `salestype` (`salestype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesglpostings`
--

LOCK TABLES `salesglpostings` WRITE;
/*!40000 ALTER TABLE `salesglpostings` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesglpostings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesman`
--

DROP TABLE IF EXISTS `salesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesman` (
  `salesmancode` char(3) NOT NULL DEFAULT '',
  `salesmanname` char(30) NOT NULL DEFAULT '',
  `smantel` char(20) NOT NULL DEFAULT '',
  `smanfax` char(20) NOT NULL DEFAULT '',
  `commissionrate1` double(16,4) NOT NULL DEFAULT '0.0000',
  `breakpoint` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `commissionrate2` double(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`salesmancode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesman`
--

LOCK TABLES `salesman` WRITE;
/*!40000 ALTER TABLE `salesman` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesorderdetails`
--

DROP TABLE IF EXISTS `salesorderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesorderdetails` (
  `orderlineno` int NOT NULL DEFAULT '0',
  `orderno` int NOT NULL DEFAULT '0',
  `stkcode` varchar(20) NOT NULL DEFAULT '',
  `qtyinvoiced` double(16,4) NOT NULL DEFAULT '0.0000',
  `unitprice` double(16,4) NOT NULL DEFAULT '0.0000',
  `quantity` double(16,4) NOT NULL DEFAULT '0.0000',
  `estimate` tinyint NOT NULL DEFAULT '0',
  `discountpercent` double(16,4) NOT NULL DEFAULT '0.0000',
  `actualdispatchdate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `narrative` text NOT NULL,
  KEY `orderno` (`orderno`),
  KEY `stkcode` (`stkcode`),
  KEY `completed` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesorderdetails`
--

LOCK TABLES `salesorderdetails` WRITE;
/*!40000 ALTER TABLE `salesorderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesorderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesorders`
--

DROP TABLE IF EXISTS `salesorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesorders` (
  `orderno` int NOT NULL AUTO_INCREMENT,
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `customerref` varchar(50) NOT NULL DEFAULT '',
  `buyername` varchar(50) DEFAULT NULL,
  `comments` longblob,
  `orddate` date NOT NULL DEFAULT '2023-01-01',
  `ordertype` char(2) NOT NULL DEFAULT '',
  `shipvia` int NOT NULL DEFAULT '0',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL,
  `deladd3` varchar(40) NOT NULL,
  `deladd4` varchar(40) DEFAULT NULL,
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `contactphone` varchar(25) DEFAULT NULL,
  `contactemail` varchar(25) DEFAULT NULL,
  `deliverto` varchar(40) NOT NULL DEFAULT '',
  `freightcost` double NOT NULL DEFAULT '0',
  `fromstkloc` varchar(5) NOT NULL DEFAULT '',
  `deliverydate` date NOT NULL DEFAULT '2023-01-01',
  `printedpackingslip` tinyint NOT NULL DEFAULT '0',
  `datepackingslipprinted` date NOT NULL DEFAULT '2023-01-01',
  `quotation` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderno`),
  KEY `debtorno` (`debtorno`),
  KEY `orddate` (`orddate`),
  KEY `ordertype` (`ordertype`),
  KEY `locationindex` (`fromstkloc`),
  KEY `branchcode` (`branchcode`,`debtorno`),
  KEY `shipvia` (`shipvia`),
  KEY `quotation` (`quotation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesorders`
--

LOCK TABLES `salesorders` WRITE;
/*!40000 ALTER TABLE `salesorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salestypes`
--

DROP TABLE IF EXISTS `salestypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salestypes` (
  `typeabbrev` char(2) NOT NULL DEFAULT '',
  `sales_type` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`typeabbrev`),
  KEY `sales_type` (`sales_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salestypes`
--

LOCK TABLES `salestypes` WRITE;
/*!40000 ALTER TABLE `salestypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `salestypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scripts` (
  `pageid` smallint NOT NULL AUTO_INCREMENT,
  `filename` varchar(50) NOT NULL DEFAULT '',
  `pagedescription` text NOT NULL,
  PRIMARY KEY (`pageid`),
  KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='index of all scripts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups`
--

DROP TABLE IF EXISTS `securitygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securitygroups` (
  `secroleid` int NOT NULL DEFAULT '0',
  `tokenid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`secroleid`,`tokenid`),
  KEY `secgroupid` (`secroleid`),
  KEY `tokenid` (`tokenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups`
--

LOCK TABLES `securitygroups` WRITE;
/*!40000 ALTER TABLE `securitygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securityroles`
--

DROP TABLE IF EXISTS `securityroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securityroles` (
  `secroleid` int NOT NULL AUTO_INCREMENT,
  `secrolename` text NOT NULL,
  PRIMARY KEY (`secroleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securityroles`
--

LOCK TABLES `securityroles` WRITE;
/*!40000 ALTER TABLE `securityroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `securityroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitytokens`
--

DROP TABLE IF EXISTS `securitytokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securitytokens` (
  `tokenid` int NOT NULL DEFAULT '0',
  `tokenname` text NOT NULL,
  PRIMARY KEY (`tokenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitytokens`
--

LOCK TABLES `securitytokens` WRITE;
/*!40000 ALTER TABLE `securitytokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitytokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipmentcharges`
--

DROP TABLE IF EXISTS `shipmentcharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipmentcharges` (
  `shiptchgid` int NOT NULL AUTO_INCREMENT,
  `shiptref` int NOT NULL DEFAULT '0',
  `transtype` smallint NOT NULL DEFAULT '0',
  `transno` int NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `value` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`shiptchgid`),
  KEY `transtype` (`transtype`,`transno`),
  KEY `shiptref` (`shiptref`),
  KEY `stockid` (`stockid`),
  KEY `transtype_2` (`transtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipmentcharges`
--

LOCK TABLES `shipmentcharges` WRITE;
/*!40000 ALTER TABLE `shipmentcharges` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipmentcharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `shiptref` int NOT NULL DEFAULT '0',
  `voyageref` varchar(20) NOT NULL DEFAULT '0',
  `vessel` varchar(50) NOT NULL DEFAULT '',
  `eta` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `accumvalue` double(16,4) NOT NULL DEFAULT '0.0000',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `closed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`shiptref`),
  KEY `eta` (`eta`),
  KEY `supplierid` (`supplierid`),
  KEY `shipperref` (`voyageref`),
  KEY `vessel` (`vessel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippers` (
  `shipper_id` int NOT NULL AUTO_INCREMENT,
  `shippername` char(40) NOT NULL DEFAULT '',
  `mincharge` double(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`shipper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockcategory`
--

DROP TABLE IF EXISTS `stockcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockcategory` (
  `categoryid` char(6) NOT NULL DEFAULT '',
  `categorydescription` char(20) NOT NULL DEFAULT '',
  `stocktype` char(1) NOT NULL DEFAULT 'f',
  `stockact` int NOT NULL DEFAULT '0',
  `adjglact` int NOT NULL DEFAULT '0',
  `purchpricevaract` int NOT NULL DEFAULT '80000',
  `materialuseagevarac` int NOT NULL DEFAULT '80000',
  `wipact` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoryid`),
  KEY `categorydescription` (`categorydescription`),
  KEY `stocktype` (`stocktype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockcategory`
--

LOCK TABLES `stockcategory` WRITE;
/*!40000 ALTER TABLE `stockcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockcheckfreeze`
--

DROP TABLE IF EXISTS `stockcheckfreeze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockcheckfreeze` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `qoh` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`stockid`),
  KEY `loccode` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockcheckfreeze`
--

LOCK TABLES `stockcheckfreeze` WRITE;
/*!40000 ALTER TABLE `stockcheckfreeze` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockcheckfreeze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockcounts`
--

DROP TABLE IF EXISTS `stockcounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockcounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `qtycounted` double NOT NULL DEFAULT '0',
  `reference` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `stockid` (`stockid`),
  KEY `loccode` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockcounts`
--

LOCK TABLES `stockcounts` WRITE;
/*!40000 ALTER TABLE `stockcounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockcounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockmaster`
--

DROP TABLE IF EXISTS `stockmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockmaster` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `categoryid` varchar(6) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `longdescription` text NOT NULL,
  `units` varchar(20) NOT NULL DEFAULT 'each',
  `mbflag` char(1) NOT NULL DEFAULT 'b',
  `lastcurcostdate` date NOT NULL DEFAULT '1800-01-01',
  `actualcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `lastcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `materialcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `labourcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `overheadcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `lowestlevel` smallint NOT NULL DEFAULT '0',
  `discontinued` tinyint NOT NULL DEFAULT '0',
  `controlled` tinyint NOT NULL DEFAULT '0',
  `eoq` double(10,2) NOT NULL DEFAULT '0.00',
  `volume` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `kgs` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `barcode` varchar(50) NOT NULL DEFAULT '',
  `discountcategory` char(2) NOT NULL DEFAULT '',
  `taxcatid` tinyint NOT NULL DEFAULT '1',
  `serialised` tinyint NOT NULL DEFAULT '0',
  `decimalplaces` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`stockid`),
  KEY `categoryid` (`categoryid`),
  KEY `description` (`description`),
  KEY `lastcurcostdate` (`lastcurcostdate`),
  KEY `mbflag` (`mbflag`),
  KEY `stockid` (`stockid`,`categoryid`),
  KEY `controlled` (`controlled`),
  KEY `discountcategory` (`discountcategory`),
  KEY `taxcatid` (`taxcatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockmaster`
--

LOCK TABLES `stockmaster` WRITE;
/*!40000 ALTER TABLE `stockmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockmoves`
--

DROP TABLE IF EXISTS `stockmoves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockmoves` (
  `stkmoveno` int NOT NULL AUTO_INCREMENT,
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `type` smallint NOT NULL DEFAULT '0',
  `transno` int NOT NULL DEFAULT '0',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `trandate` date NOT NULL DEFAULT '2023-01-01',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `prd` smallint NOT NULL DEFAULT '0',
  `reference` varchar(40) NOT NULL DEFAULT '',
  `qty` double(16,4) NOT NULL DEFAULT '1.0000',
  `discountpercent` double(16,4) NOT NULL DEFAULT '0.0000',
  `standardcost` double(16,4) NOT NULL DEFAULT '0.0000',
  `show_on_inv_crds` tinyint NOT NULL DEFAULT '1',
  `newqoh` double NOT NULL DEFAULT '0',
  `hidemovt` tinyint NOT NULL DEFAULT '0',
  `narrative` text NOT NULL,
  PRIMARY KEY (`stkmoveno`),
  KEY `debtorno` (`debtorno`),
  KEY `loccode` (`loccode`),
  KEY `prd` (`prd`),
  KEY `stockid` (`stockid`,`loccode`),
  KEY `stockid_2` (`stockid`),
  KEY `trandate` (`trandate`),
  KEY `transno` (`transno`),
  KEY `type` (`type`),
  KEY `show_on_inv_crds` (`show_on_inv_crds`),
  KEY `hide` (`hidemovt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockmoves`
--

LOCK TABLES `stockmoves` WRITE;
/*!40000 ALTER TABLE `stockmoves` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockmoves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockmovestaxes`
--

DROP TABLE IF EXISTS `stockmovestaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockmovestaxes` (
  `stkmoveno` int NOT NULL,
  `taxauthid` tinyint NOT NULL,
  `taxontax` tinyint NOT NULL DEFAULT '0',
  `taxcalculationorder` tinyint NOT NULL,
  `taxrate` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`stkmoveno`,`taxauthid`),
  KEY `taxauthid` (`taxauthid`),
  KEY `taxcalculationorder` (`taxcalculationorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockmovestaxes`
--

LOCK TABLES `stockmovestaxes` WRITE;
/*!40000 ALTER TABLE `stockmovestaxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockmovestaxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockserialitems`
--

DROP TABLE IF EXISTS `stockserialitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockserialitems` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `serialno` varchar(30) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`stockid`,`serialno`,`loccode`),
  KEY `stockid` (`stockid`),
  KEY `loccode` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockserialitems`
--

LOCK TABLES `stockserialitems` WRITE;
/*!40000 ALTER TABLE `stockserialitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockserialitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockserialmoves`
--

DROP TABLE IF EXISTS `stockserialmoves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockserialmoves` (
  `stkitmmoveno` int NOT NULL AUTO_INCREMENT,
  `stockmoveno` int NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `serialno` varchar(30) NOT NULL DEFAULT '',
  `moveqty` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`stkitmmoveno`),
  KEY `stockmoveno` (`stockmoveno`),
  KEY `stockid_sn` (`stockid`,`serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockserialmoves`
--

LOCK TABLES `stockserialmoves` WRITE;
/*!40000 ALTER TABLE `stockserialmoves` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockserialmoves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppallocs`
--

DROP TABLE IF EXISTS `suppallocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppallocs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amt` double NOT NULL DEFAULT '0',
  `datealloc` date NOT NULL DEFAULT '2023-01-01',
  `transid_allocfrom` int NOT NULL DEFAULT '0',
  `transid_allocto` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `transid_allocfrom` (`transid_allocfrom`),
  KEY `transid_allocto` (`transid_allocto`),
  KEY `datealloc` (`datealloc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppallocs`
--

LOCK TABLES `suppallocs` WRITE;
/*!40000 ALTER TABLE `suppallocs` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppallocs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliercontacts`
--

DROP TABLE IF EXISTS `suppliercontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliercontacts` (
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `position` varchar(30) NOT NULL DEFAULT '',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `mobile` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `ordercontact` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplierid`,`contact`),
  KEY `contact` (`contact`),
  KEY `supplierid` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliercontacts`
--

LOCK TABLES `suppliercontacts` WRITE;
/*!40000 ALTER TABLE `suppliercontacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliercontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplierid` char(10) NOT NULL DEFAULT '',
  `suppname` char(40) NOT NULL DEFAULT '',
  `address1` char(40) NOT NULL DEFAULT '',
  `address2` char(40) NOT NULL DEFAULT '',
  `address3` char(40) NOT NULL DEFAULT '',
  `address4` char(50) NOT NULL DEFAULT '',
  `address5` varchar(20) NOT NULL DEFAULT '',
  `address6` varchar(15) NOT NULL DEFAULT '',
  `currcode` char(3) NOT NULL DEFAULT '',
  `suppliersince` date NOT NULL DEFAULT '2023-01-01',
  `paymentterms` char(2) NOT NULL DEFAULT '',
  `lastpaid` double(16,4) NOT NULL DEFAULT '0.0000',
  `lastpaiddate` datetime DEFAULT NULL,
  `bankact` char(16) NOT NULL DEFAULT '',
  `bankref` char(12) NOT NULL DEFAULT '',
  `bankpartics` char(12) NOT NULL DEFAULT '',
  `remittance` tinyint NOT NULL DEFAULT '1',
  `taxgroupid` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`supplierid`),
  KEY `currcode` (`currcode`),
  KEY `paymentterms` (`paymentterms`),
  KEY `supplierid` (`supplierid`),
  KEY `suppname` (`suppname`),
  KEY `taxgroupid` (`taxgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supptrans`
--

DROP TABLE IF EXISTS `supptrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supptrans` (
  `transno` int NOT NULL DEFAULT '0',
  `type` smallint NOT NULL DEFAULT '0',
  `supplierno` varchar(10) NOT NULL DEFAULT '',
  `suppreference` varchar(20) NOT NULL DEFAULT '',
  `trandate` date NOT NULL DEFAULT '2023-01-01',
  `duedate` date NOT NULL DEFAULT '2023-01-01',
  `settled` tinyint NOT NULL DEFAULT '0',
  `rate` double(16,6) NOT NULL DEFAULT '1.000000',
  `ovamount` double(16,4) NOT NULL DEFAULT '0.0000',
  `ovgst` double(16,4) NOT NULL DEFAULT '0.0000',
  `diffonexch` double(16,4) NOT NULL DEFAULT '0.0000',
  `alloc` double(16,4) NOT NULL DEFAULT '0.0000',
  `transtext` longblob,
  `hold` tinyint NOT NULL DEFAULT '0',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `typetransno` (`transno`,`type`),
  KEY `duedate` (`duedate`),
  KEY `hold` (`hold`),
  KEY `supplierno` (`supplierno`),
  KEY `settled` (`settled`),
  KEY `supplierno_2` (`supplierno`,`suppreference`),
  KEY `suppreference` (`suppreference`),
  KEY `trandate` (`trandate`),
  KEY `transno` (`transno`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supptrans`
--

LOCK TABLES `supptrans` WRITE;
/*!40000 ALTER TABLE `supptrans` DISABLE KEYS */;
/*!40000 ALTER TABLE `supptrans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supptranstaxes`
--

DROP TABLE IF EXISTS `supptranstaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supptranstaxes` (
  `supptransid` int NOT NULL DEFAULT '0',
  `taxauthid` tinyint NOT NULL DEFAULT '0',
  `taxamount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`supptransid`,`taxauthid`),
  KEY `taxauthid` (`taxauthid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supptranstaxes`
--

LOCK TABLES `supptranstaxes` WRITE;
/*!40000 ALTER TABLE `supptranstaxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `supptranstaxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systypes`
--

DROP TABLE IF EXISTS `systypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systypes` (
  `typeid` smallint NOT NULL DEFAULT '0',
  `typename` char(50) NOT NULL DEFAULT '',
  `typeno` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`typeid`),
  KEY `typeno` (`typeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systypes`
--

LOCK TABLES `systypes` WRITE;
/*!40000 ALTER TABLE `systypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `systypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxauthorities`
--

DROP TABLE IF EXISTS `taxauthorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxauthorities` (
  `taxid` tinyint NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL DEFAULT '',
  `taxglcode` int NOT NULL DEFAULT '0',
  `purchtaxglaccount` int NOT NULL DEFAULT '0',
  `bank` varchar(50) NOT NULL DEFAULT '',
  `bankacctype` varchar(20) NOT NULL DEFAULT '',
  `bankacc` varchar(50) NOT NULL DEFAULT '',
  `bankswift` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`taxid`),
  KEY `taxglcode` (`taxglcode`),
  KEY `purchtaxglaccount` (`purchtaxglaccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxauthorities`
--

LOCK TABLES `taxauthorities` WRITE;
/*!40000 ALTER TABLE `taxauthorities` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxauthorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxauthrates`
--

DROP TABLE IF EXISTS `taxauthrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxauthrates` (
  `taxauthority` tinyint NOT NULL DEFAULT '1',
  `dispatchtaxprovince` tinyint NOT NULL DEFAULT '1',
  `taxcatid` tinyint NOT NULL DEFAULT '0',
  `taxrate` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`taxauthority`,`dispatchtaxprovince`,`taxcatid`),
  KEY `taxauthority` (`taxauthority`),
  KEY `dispatchtaxprovince` (`dispatchtaxprovince`),
  KEY `taxcatid` (`taxcatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxauthrates`
--

LOCK TABLES `taxauthrates` WRITE;
/*!40000 ALTER TABLE `taxauthrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxauthrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxcategories`
--

DROP TABLE IF EXISTS `taxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxcategories` (
  `taxcatid` tinyint NOT NULL AUTO_INCREMENT,
  `taxcatname` varchar(30) NOT NULL,
  PRIMARY KEY (`taxcatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxcategories`
--

LOCK TABLES `taxcategories` WRITE;
/*!40000 ALTER TABLE `taxcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxgroups`
--

DROP TABLE IF EXISTS `taxgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxgroups` (
  `taxgroupid` tinyint NOT NULL AUTO_INCREMENT,
  `taxgroupdescription` varchar(30) NOT NULL,
  PRIMARY KEY (`taxgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxgroups`
--

LOCK TABLES `taxgroups` WRITE;
/*!40000 ALTER TABLE `taxgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxgrouptaxes`
--

DROP TABLE IF EXISTS `taxgrouptaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxgrouptaxes` (
  `taxgroupid` tinyint NOT NULL,
  `taxauthid` tinyint NOT NULL,
  `calculationorder` tinyint NOT NULL,
  `taxontax` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`taxgroupid`,`taxauthid`),
  KEY `taxgroupid` (`taxgroupid`),
  KEY `taxauthid` (`taxauthid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxgrouptaxes`
--

LOCK TABLES `taxgrouptaxes` WRITE;
/*!40000 ALTER TABLE `taxgrouptaxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxgrouptaxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxprovinces`
--

DROP TABLE IF EXISTS `taxprovinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxprovinces` (
  `taxprovinceid` tinyint NOT NULL AUTO_INCREMENT,
  `taxprovincename` varchar(30) NOT NULL,
  PRIMARY KEY (`taxprovinceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxprovinces`
--

LOCK TABLES `taxprovinces` WRITE;
/*!40000 ALTER TABLE `taxprovinces` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxprovinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitsofmeasure`
--

DROP TABLE IF EXISTS `unitsofmeasure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unitsofmeasure` (
  `unitid` tinyint NOT NULL AUTO_INCREMENT,
  `unitname` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`unitid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitsofmeasure`
--

LOCK TABLES `unitsofmeasure` WRITE;
/*!40000 ALTER TABLE `unitsofmeasure` DISABLE KEYS */;
/*!40000 ALTER TABLE `unitsofmeasure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workcentres`
--

DROP TABLE IF EXISTS `workcentres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workcentres` (
  `code` char(5) NOT NULL DEFAULT '',
  `location` char(5) NOT NULL DEFAULT '',
  `description` char(20) NOT NULL DEFAULT '',
  `capacity` double(16,4) NOT NULL DEFAULT '1.0000',
  `overheadperhour` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `overheadrecoveryact` int NOT NULL DEFAULT '0',
  `setuphrs` decimal(20,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`code`),
  KEY `description` (`description`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workcentres`
--

LOCK TABLES `workcentres` WRITE;
/*!40000 ALTER TABLE `workcentres` DISABLE KEYS */;
/*!40000 ALTER TABLE `workcentres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worksorders`
--

DROP TABLE IF EXISTS `worksorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worksorders` (
  `woref` char(20) NOT NULL DEFAULT '',
  `loccode` char(5) NOT NULL DEFAULT '',
  `unitsreqd` smallint NOT NULL DEFAULT '1',
  `unitsrecd` double NOT NULL DEFAULT '0',
  `stockid` char(20) NOT NULL DEFAULT '',
  `stdcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `requiredby` date NOT NULL DEFAULT '2023-01-01',
  `releaseddate` date NOT NULL DEFAULT '1800-01-01',
  `accumvalueissued` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `accumvaluetrfd` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `closed` tinyint NOT NULL DEFAULT '0',
  `released` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`woref`),
  KEY `stockid` (`stockid`),
  KEY `loccode` (`loccode`),
  KEY `releaseddate` (`releaseddate`),
  KEY `requiredby` (`requiredby`),
  KEY `woref` (`woref`,`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worksorders`
--

LOCK TABLES `worksorders` WRITE;
/*!40000 ALTER TABLE `worksorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `worksorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_users`
--

DROP TABLE IF EXISTS `www_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `www_users` (
  `userid` varchar(20) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `realname` varchar(35) NOT NULL DEFAULT '',
  `customerid` varchar(10) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) DEFAULT NULL,
  `defaultlocation` varchar(5) NOT NULL DEFAULT '',
  `fullaccess` int NOT NULL DEFAULT '1',
  `lastvisitdate` datetime DEFAULT NULL,
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `pagesize` varchar(20) NOT NULL DEFAULT 'a4',
  `modulesallowed` varchar(20) NOT NULL DEFAULT '',
  `blocked` tinyint NOT NULL DEFAULT '0',
  `displayrecordsmax` int NOT NULL DEFAULT '0',
  `theme` varchar(30) NOT NULL DEFAULT 'fresh',
  `language` char(5) NOT NULL DEFAULT 'en_GB',
  PRIMARY KEY (`userid`),
  KEY `customerid` (`customerid`),
  KEY `defaultlocation` (`defaultlocation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_users`
--

LOCK TABLES `www_users` WRITE;
/*!40000 ALTER TABLE `www_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `www_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27 16:27:58
