-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema PortalExampletestServ
--

CREATE DATABASE IF NOT EXISTS PortalExampletestServ;
USE PortalExampletestServ;

--
-- Definition of table `PortalExampletestServ`.`authgroups`
--

DROP TABLE IF EXISTS `PortalExampletestServ`.`authgroups`;
CREATE TABLE  `PortalExampletestServ`.`authgroups` (
  `groupname` varchar(20) NOT NULL,
  `descr` varchar(50) NOT NULL,
  PRIMARY KEY (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortalExampletestServ`.`authgroups`
--

/*!40000 ALTER TABLE `authgroups` DISABLE KEYS */;
LOCK TABLES `authgroups` WRITE;
INSERT INTO `PortalExampletestServ`.`authgroups` VALUES  ('administrators','Amministratori'),
 ('coach','Coach'),
 ('customers','Customers'),
 ('free','Accesso Libero'),
 ('helpdesk','Helpdesk'),
 ('management','Management');
UNLOCK TABLES;
/*!40000 ALTER TABLE `authgroups` ENABLE KEYS */;


--
-- Definition of table `PortalExampletestServ`.`authpermissions`
--

DROP TABLE IF EXISTS `PortalExampletestServ`.`authpermissions`;
CREATE TABLE  `PortalExampletestServ`.`authpermissions` (
  `permissionname` varchar(30) NOT NULL,
  `descr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`permissionname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortalExampletestServ`.`authpermissions`
--

/*!40000 ALTER TABLE `authpermissions` DISABLE KEYS */;
LOCK TABLES `authpermissions` WRITE;
INSERT INTO `PortalExampletestServ`.`authpermissions` VALUES  ('editContents','Redazione di Contenuti'),
 ('enterBackend','Accesso all\'Area di Amministrazione'),
 ('manageCategories','Operazioni su Categorie'),
 ('managePages','Operazioni su Pagine'),
 ('manageResources','Operazioni su Risorse'),
 ('superuser','Tutte le funzioni'),
 ('validateContents','Supervisione di Contenuti');
UNLOCK TABLES;
/*!40000 ALTER TABLE `authpermissions` ENABLE KEYS */;


--
-- Definition of table `PortalExampletestServ`.`authrolepermissions`
--

DROP TABLE IF EXISTS `PortalExampletestServ`.`authrolepermissions`;
CREATE TABLE  `PortalExampletestServ`.`authrolepermissions` (
  `rolename` varchar(30) NOT NULL,
  `permissionname` varchar(30) NOT NULL,
  PRIMARY KEY (`rolename`,`permissionname`),
  KEY `authrolepermissions_permissionname_fkey` (`permissionname`),
  CONSTRAINT `authrolepermissions_permissionname_fkey` FOREIGN KEY (`permissionname`) REFERENCES `authpermissions` (`permissionname`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `authrolepermissions_rolename_fkey` FOREIGN KEY (`rolename`) REFERENCES `authroles` (`rolename`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortalExampletestServ`.`authrolepermissions`
--

/*!40000 ALTER TABLE `authrolepermissions` DISABLE KEYS */;
LOCK TABLES `authrolepermissions` WRITE;
INSERT INTO `PortalExampletestServ`.`authrolepermissions` VALUES  ('editor','editContents'),
 ('supervisor','editContents'),
 ('editor','enterBackend'),
 ('pageManager','enterBackend'),
 ('supervisor','enterBackend'),
 ('pageManager','managePages'),
 ('editor','manageResources'),
 ('admin','superuser'),
 ('supervisor','validateContents');
UNLOCK TABLES;
/*!40000 ALTER TABLE `authrolepermissions` ENABLE KEYS */;


--
-- Definition of table `PortalExampletestServ`.`authroles`
--

DROP TABLE IF EXISTS `PortalExampletestServ`.`authroles`;
CREATE TABLE  `PortalExampletestServ`.`authroles` (
  `rolename` varchar(30) NOT NULL,
  `descr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rolename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortalExampletestServ`.`authroles`
--

/*!40000 ALTER TABLE `authroles` DISABLE KEYS */;
LOCK TABLES `authroles` WRITE;
INSERT INTO `PortalExampletestServ`.`authroles` VALUES  ('admin','Tutte le funzioni'),
 ('editor','Gestore di Contenuti e Risorse'),
 ('pageManager','Gestore di Pagine'),
 ('supervisor','Supervisore di Contenuti');
UNLOCK TABLES;
/*!40000 ALTER TABLE `authroles` ENABLE KEYS */;


--
-- Definition of table `PortalExampletestServ`.`authusergroups`
--

DROP TABLE IF EXISTS `PortalExampletestServ`.`authusergroups`;
CREATE TABLE  `PortalExampletestServ`.`authusergroups` (
  `username` varchar(40) NOT NULL,
  `groupname` varchar(20) NOT NULL,
  PRIMARY KEY (`username`,`groupname`),
  KEY `new_fk_constraint` (`groupname`),
  CONSTRAINT `new_fk_constraint` FOREIGN KEY (`groupname`) REFERENCES `authgroups` (`groupname`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortalExampletestServ`.`authusergroups`
--

/*!40000 ALTER TABLE `authusergroups` DISABLE KEYS */;
LOCK TABLES `authusergroups` WRITE;
INSERT INTO `PortalExampletestServ`.`authusergroups` VALUES  ('admin','administrators'),
 ('mainEditor','administrators'),
 ('editorCoach','coach'),
 ('pageManagerCoach','coach'),
 ('supervisorCoach','coach'),
 ('editorCoach','customers'),
 ('editorCustomers','customers'),
 ('pageManagerCoach','customers'),
 ('pageManagerCustomers','customers'),
 ('supervisorCoach','customers'),
 ('supervisorCustomers','customers');
UNLOCK TABLES;
/*!40000 ALTER TABLE `authusergroups` ENABLE KEYS */;


--
-- Definition of table `PortalExampletestServ`.`authuserroles`
--

DROP TABLE IF EXISTS `PortalExampletestServ`.`authuserroles`;
CREATE TABLE  `PortalExampletestServ`.`authuserroles` (
  `username` varchar(40) NOT NULL,
  `rolename` varchar(30) NOT NULL,
  PRIMARY KEY (`username`,`rolename`),
  KEY `authuserroles_rolename_fkey` (`rolename`),
  CONSTRAINT `authuserroles_rolename_fkey` FOREIGN KEY (`rolename`) REFERENCES `authroles` (`rolename`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortalExampletestServ`.`authuserroles`
--

/*!40000 ALTER TABLE `authuserroles` DISABLE KEYS */;
LOCK TABLES `authuserroles` WRITE;
INSERT INTO `PortalExampletestServ`.`authuserroles` VALUES  ('admin','admin'),
 ('editorCoach','editor'),
 ('editorCustomers','editor'),
 ('mainEditor','editor'),
 ('pageManagerCoach','pageManager'),
 ('pageManagerCustomers','pageManager'),
 ('supervisorCoach','supervisor'),
 ('supervisorCustomers','supervisor');
UNLOCK TABLES;
/*!40000 ALTER TABLE `authuserroles` ENABLE KEYS */;


--
-- Definition of table `PortalExampletestServ`.`authusers`
--

DROP TABLE IF EXISTS `PortalExampletestServ`.`authusers`;
CREATE TABLE  `PortalExampletestServ`.`authusers` (
  `username` varchar(40) NOT NULL,
  `passwd` varchar(40) DEFAULT NULL,
  `registrationdate` date NOT NULL,
  `lastaccess` date DEFAULT NULL,
  `lastpasswordchange` date DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortalExampletestServ`.`authusers`
--

/*!40000 ALTER TABLE `authusers` DISABLE KEYS */;
LOCK TABLES `authusers` WRITE;
INSERT INTO `PortalExampletestServ`.`authusers` VALUES  ('admin','admin','2008-09-25','2010-11-30',NULL,1),
 ('editorCoach','editorCoach','2008-09-25','2010-11-30',NULL,1),
 ('editorCustomers','editorCustomers','2008-09-25','2010-11-30',NULL,1),
 ('mainEditor','mainEditor','2008-09-25','2010-11-30',NULL,1),
 ('pageManagerCoach','pageManagerCoach','2008-09-25','2010-11-30',NULL,1),
 ('pageManagerCustomers','pageManagerCustomers','2008-09-25','2010-11-30',NULL,1),
 ('supervisorCoach','supervisorCoach','2008-09-25','2010-11-30',NULL,1),
 ('supervisorCustomers','supervisorCustomers','2008-09-25','2010-11-30',NULL,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `authusers` ENABLE KEYS */;


--
-- Definition of table `PortalExampletestServ`.`authusershortcuts`
--

DROP TABLE IF EXISTS `PortalExampletestServ`.`authusershortcuts`;
CREATE TABLE  `PortalExampletestServ`.`authusershortcuts` (
  `username` varchar(40) NOT NULL,
  `config` longtext NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortalExampletestServ`.`authusershortcuts`
--

/*!40000 ALTER TABLE `authusershortcuts` DISABLE KEYS */;
LOCK TABLES `authusershortcuts` WRITE;
INSERT INTO `PortalExampletestServ`.`authusershortcuts` VALUES  ('admin','<shortcuts>\n	<box pos=\"0\"></box>\n	<box pos=\"1\">core.component.user.list</box>\n	<box pos=\"2\">jacms.content.new</box>\n	<box pos=\"3\">jacms.content.list</box>\n	<box pos=\"4\">core.portal.pageTree</box>\n	<box pos=\"5\">core.portal.showletType</box>\n	<box pos=\"6\">core.tools.setting</box>\n	<box pos=\"7\">core.tools.entities</box>\n</shortcuts>');
UNLOCK TABLES;
/*!40000 ALTER TABLE `authusershortcuts` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
