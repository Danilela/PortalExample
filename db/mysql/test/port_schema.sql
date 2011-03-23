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
-- Create schema PortalExampletestPort
--

CREATE DATABASE IF NOT EXISTS PortalExampletestPort;
USE PortalExampletestPort;

--
-- Definition of table `PortalExampletestPort`.`categories`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`categories`;
CREATE TABLE  `PortalExampletestPort`.`categories` (
  `catcode` varchar(30) NOT NULL,
  `parentcode` varchar(30) NOT NULL,
  `titles` longtext NOT NULL,
  PRIMARY KEY (`catcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`contentmodels`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`contentmodels`;
CREATE TABLE  `PortalExampletestPort`.`contentmodels` (
  `modelid` int(11) NOT NULL,
  `contenttype` varchar(30) NOT NULL,
  `descr` varchar(50) NOT NULL,
  `model` longtext,
  `stylesheet` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`contentrelations`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`contentrelations`;
CREATE TABLE  `PortalExampletestPort`.`contentrelations` (
  `contentid` varchar(16) NOT NULL,
  `refpage` varchar(30) DEFAULT NULL,
  `refcontent` varchar(16) DEFAULT NULL,
  `refresource` varchar(16) DEFAULT NULL,
  `refcategory` varchar(30) DEFAULT NULL,
  `refgroup` varchar(20) DEFAULT NULL,
  KEY `contentrelations_contentid_fkey` (`contentid`),
  KEY `contentrelations_refcategory_fkey` (`refcategory`),
  KEY `contentrelations_refcontent_fkey` (`refcontent`),
  KEY `contentrelations_refpage_fkey` (`refpage`),
  KEY `contentrelations_refresource_fkey` (`refresource`),
  CONSTRAINT `contentrelations_contentid_fkey` FOREIGN KEY (`contentid`) REFERENCES `contents` (`contentid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `contentrelations_refcategory_fkey` FOREIGN KEY (`refcategory`) REFERENCES `categories` (`catcode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `contentrelations_refcontent_fkey` FOREIGN KEY (`refcontent`) REFERENCES `contents` (`contentid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `contentrelations_refpage_fkey` FOREIGN KEY (`refpage`) REFERENCES `pages` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `contentrelations_refresource_fkey` FOREIGN KEY (`refresource`) REFERENCES `resources` (`resid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`contents`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`contents`;
CREATE TABLE  `PortalExampletestPort`.`contents` (
  `contentid` varchar(16) NOT NULL,
  `contenttype` varchar(30) NOT NULL,
  `descr` varchar(260) NOT NULL,
  `status` varchar(12) NOT NULL,
  `workxml` longtext NOT NULL,
  `created` varchar(20) DEFAULT NULL,
  `lastmodified` varchar(20) DEFAULT NULL,
  `onlinexml` longtext,
  `maingroup` varchar(20) NOT NULL,
  `currentversion` varchar(7) NOT NULL,
  `lasteditor` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`contentsearch`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`contentsearch`;
CREATE TABLE  `PortalExampletestPort`.`contentsearch` (
  `contentid` varchar(16) NOT NULL,
  `attrname` varchar(30) NOT NULL,
  `textvalue` varchar(255) DEFAULT NULL,
  `datevalue` date DEFAULT NULL,
  `numvalue` int(11) DEFAULT NULL,
  `langcode` varchar(2) DEFAULT NULL,
  KEY `contentsearch_contentid_fkey` (`contentid`),
  CONSTRAINT `contentsearch_contentid_fkey` FOREIGN KEY (`contentid`) REFERENCES `contents` (`contentid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`localstrings`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`localstrings`;
CREATE TABLE  `PortalExampletestPort`.`localstrings` (
  `keycode` varchar(50) NOT NULL,
  `langcode` varchar(2) NOT NULL,
  `stringvalue` longtext NOT NULL,
  PRIMARY KEY (`keycode`,`langcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`pagemodels`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`pagemodels`;
CREATE TABLE  `PortalExampletestPort`.`pagemodels` (
  `code` varchar(40) NOT NULL,
  `descr` varchar(50) NOT NULL,
  `frames` longtext,
  `plugincode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`pages`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`pages`;
CREATE TABLE  `PortalExampletestPort`.`pages` (
  `code` varchar(30) NOT NULL,
  `parentcode` varchar(30) DEFAULT NULL,
  `pos` int(11) NOT NULL,
  `modelcode` varchar(40) NOT NULL,
  `titles` longtext,
  `groupcode` varchar(30) NOT NULL,
  `showinmenu` tinyint(4) NOT NULL,
  `extraconfig` longtext,
  PRIMARY KEY (`code`),
  KEY `pages_modelcode_fkey` (`modelcode`),
  CONSTRAINT `pages_modelcode_fkey` FOREIGN KEY (`modelcode`) REFERENCES `pagemodels` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`resourcerelations`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`resourcerelations`;
CREATE TABLE  `PortalExampletestPort`.`resourcerelations` (
  `resid` varchar(16) NOT NULL,
  `refcategory` varchar(30) DEFAULT NULL,
  KEY `resourcerelations_refcategory_fkey` (`refcategory`),
  KEY `resourcerelations_resid_fkey` (`resid`),
  CONSTRAINT `resourcerelations_refcategory_fkey` FOREIGN KEY (`refcategory`) REFERENCES `categories` (`catcode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `resourcerelations_resid_fkey` FOREIGN KEY (`resid`) REFERENCES `resources` (`resid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`resources`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`resources`;
CREATE TABLE  `PortalExampletestPort`.`resources` (
  `resid` varchar(16) NOT NULL,
  `restype` varchar(30) NOT NULL,
  `descr` varchar(260) NOT NULL,
  `maingroup` varchar(20) NOT NULL,
  `xml` longtext NOT NULL,
  `masterfilename` varchar(100) NOT NULL,
  PRIMARY KEY (`resid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`showletcatalog`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`showletcatalog`;
CREATE TABLE  `PortalExampletestPort`.`showletcatalog` (
  `code` varchar(40) NOT NULL,
  `titles` longtext NOT NULL,
  `parameters` longtext,
  `plugincode` varchar(30) DEFAULT NULL,
  `parenttypecode` varchar(40) DEFAULT NULL,
  `defaultconfig` longtext,
  `locked` tinyint(4) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`showletconfig`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`showletconfig`;
CREATE TABLE  `PortalExampletestPort`.`showletconfig` (
  `pagecode` varchar(30) NOT NULL,
  `framepos` int(11) NOT NULL,
  `showletcode` varchar(40) NOT NULL,
  `config` longtext,
  `publishedcontent` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pagecode`,`framepos`),
  KEY `showletconfig_showletcode_fkey` (`showletcode`),
  CONSTRAINT `showletconfig_pagecode_fkey` FOREIGN KEY (`pagecode`) REFERENCES `pages` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `showletconfig_showletcode_fkey` FOREIGN KEY (`showletcode`) REFERENCES `showletcatalog` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`sysconfig`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`sysconfig`;
CREATE TABLE  `PortalExampletestPort`.`sysconfig` (
  `version` varchar(10) NOT NULL,
  `item` varchar(40) NOT NULL,
  `descr` varchar(100) DEFAULT NULL,
  `config` longtext,
  PRIMARY KEY (`version`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`uniquekeys`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`uniquekeys`;
CREATE TABLE  `PortalExampletestPort`.`uniquekeys` (
  `id` int(11) NOT NULL DEFAULT '0',
  `keyvalue` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `PortalExampletestPort`.`workcontentrelations`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`workcontentrelations`;
CREATE TABLE  `PortalExampletestPort`.`workcontentrelations` (
  `contentid` varchar(16) NOT NULL,
  `refcategory` varchar(30) DEFAULT NULL,
  KEY `workcontentrelations_contentid_fkey` (`contentid`),
  KEY `workcontentrelations_refcategory_fkey` (`refcategory`),
  CONSTRAINT `workcontentrelations_contentid_fkey` FOREIGN KEY (`contentid`) REFERENCES `contents` (`contentid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortalExampletestPort`.`workcontentrelations`
--

DROP TABLE IF EXISTS `PortalExampletestPort`.`workcontentsearch`;
CREATE TABLE  `PortalExampletestPort`.`workcontentsearch` (
  `contentid` varchar(16) DEFAULT NULL,
  `attrname` varchar(30) NOT NULL,
  `textvalue` varchar(255) DEFAULT NULL,
  `datevalue` date DEFAULT NULL,
  `numvalue` int(11) DEFAULT NULL,
  `langcode` varchar(2) DEFAULT NULL,
  KEY `workcontentsearch_contentid_fkey` (`contentid`),
  CONSTRAINT `workcontentsearch_contentid_fkey` FOREIGN KEY (`contentid`) REFERENCES `contents` (`contentid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortalExampletestPort`.`workcontentsearch`
--
