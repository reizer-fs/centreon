-- MySQL dump 10.15  Distrib 10.0.25-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: centreon
-- ------------------------------------------------------
-- Server version	10.0.25-MariaDB

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
-- Table structure for table `acl_actions`
--

DROP TABLE IF EXISTS `acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_actions` (
  `acl_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_action_name` varchar(255) DEFAULT NULL,
  `acl_action_description` varchar(255) DEFAULT NULL,
  `acl_action_activate` enum('0','1','2') DEFAULT NULL,
  PRIMARY KEY (`acl_action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_actions`
--

LOCK TABLES `acl_actions` WRITE;
/*!40000 ALTER TABLE `acl_actions` DISABLE KEYS */;
INSERT INTO `acl_actions` VALUES (1,'Simple User','Simple User','1');
/*!40000 ALTER TABLE `acl_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_actions_rules`
--

DROP TABLE IF EXISTS `acl_actions_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_actions_rules` (
  `aar_id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_action_rule_id` int(11) DEFAULT NULL,
  `acl_action_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aar_id`),
  KEY `acl_action_rule_id` (`acl_action_rule_id`),
  CONSTRAINT `acl_actions_rules_ibfk_1` FOREIGN KEY (`acl_action_rule_id`) REFERENCES `acl_actions` (`acl_action_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_actions_rules`
--

LOCK TABLES `acl_actions_rules` WRITE;
/*!40000 ALTER TABLE `acl_actions_rules` DISABLE KEYS */;
INSERT INTO `acl_actions_rules` VALUES (1,1,'poller_stats'),(2,1,'top_counter'),(3,1,'service_acknowledgement'),(4,1,'service_schedule_check'),(5,1,'service_schedule_forced_check'),(6,1,'service_schedule_downtime'),(7,1,'service_comment'),(8,1,'host_acknowledgement'),(9,1,'host_schedule_check'),(10,1,'host_schedule_forced_check'),(11,1,'host_schedule_downtime'),(12,1,'host_comment');
/*!40000 ALTER TABLE `acl_actions_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_group_actions_relations`
--

DROP TABLE IF EXISTS `acl_group_actions_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_group_actions_relations` (
  `agar_id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_action_id` int(11) DEFAULT NULL,
  `acl_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`agar_id`),
  KEY `acl_action_id` (`acl_action_id`),
  KEY `acl_group_id` (`acl_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_group_actions_relations`
--

LOCK TABLES `acl_group_actions_relations` WRITE;
/*!40000 ALTER TABLE `acl_group_actions_relations` DISABLE KEYS */;
INSERT INTO `acl_group_actions_relations` VALUES (1,1,1);
/*!40000 ALTER TABLE `acl_group_actions_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_group_contactgroups_relations`
--

DROP TABLE IF EXISTS `acl_group_contactgroups_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_group_contactgroups_relations` (
  `agcgr_id` int(11) NOT NULL AUTO_INCREMENT,
  `cg_cg_id` int(11) DEFAULT NULL,
  `acl_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`agcgr_id`),
  KEY `cg_cg_id` (`cg_cg_id`),
  KEY `acl_group_id` (`acl_group_id`),
  CONSTRAINT `acl_group_contactgroups_relations_ibfk_1` FOREIGN KEY (`cg_cg_id`) REFERENCES `contactgroup` (`cg_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_group_contactgroups_relations_ibfk_2` FOREIGN KEY (`acl_group_id`) REFERENCES `acl_groups` (`acl_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_group_contactgroups_relations`
--

LOCK TABLES `acl_group_contactgroups_relations` WRITE;
/*!40000 ALTER TABLE `acl_group_contactgroups_relations` DISABLE KEYS */;
INSERT INTO `acl_group_contactgroups_relations` VALUES (1,3,1);
/*!40000 ALTER TABLE `acl_group_contactgroups_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_group_contacts_relations`
--

DROP TABLE IF EXISTS `acl_group_contacts_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_group_contacts_relations` (
  `agcr_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_contact_id` int(11) DEFAULT NULL,
  `acl_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`agcr_id`),
  KEY `contact_contact_id` (`contact_contact_id`),
  KEY `acl_group_id` (`acl_group_id`),
  CONSTRAINT `acl_group_contacts_relations_ibfk_1` FOREIGN KEY (`contact_contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_group_contacts_relations_ibfk_2` FOREIGN KEY (`acl_group_id`) REFERENCES `acl_groups` (`acl_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_group_contacts_relations`
--

LOCK TABLES `acl_group_contacts_relations` WRITE;
/*!40000 ALTER TABLE `acl_group_contacts_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_group_contacts_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_group_topology_relations`
--

DROP TABLE IF EXISTS `acl_group_topology_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_group_topology_relations` (
  `agt_id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_group_id` int(11) DEFAULT NULL,
  `acl_topology_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`agt_id`),
  KEY `acl_group_id` (`acl_group_id`),
  KEY `acl_topology_id` (`acl_topology_id`),
  CONSTRAINT `acl_group_topology_relations_ibfk_1` FOREIGN KEY (`acl_group_id`) REFERENCES `acl_groups` (`acl_group_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_group_topology_relations_ibfk_2` FOREIGN KEY (`acl_topology_id`) REFERENCES `acl_topology` (`acl_topo_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_group_topology_relations`
--

LOCK TABLES `acl_group_topology_relations` WRITE;
/*!40000 ALTER TABLE `acl_group_topology_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_group_topology_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_groups`
--

DROP TABLE IF EXISTS `acl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_groups` (
  `acl_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_group_name` varchar(255) DEFAULT NULL,
  `acl_group_alias` varchar(255) DEFAULT NULL,
  `acl_group_changed` int(11) NOT NULL,
  `acl_group_activate` enum('0','1','2') DEFAULT NULL,
  PRIMARY KEY (`acl_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_groups`
--

LOCK TABLES `acl_groups` WRITE;
/*!40000 ALTER TABLE `acl_groups` DISABLE KEYS */;
INSERT INTO `acl_groups` VALUES (1,'ALL','ALL',0,'1');
/*!40000 ALTER TABLE `acl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_res_group_relations`
--

DROP TABLE IF EXISTS `acl_res_group_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_res_group_relations` (
  `argr_id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_res_id` int(11) DEFAULT NULL,
  `acl_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`argr_id`),
  KEY `acl_res_id` (`acl_res_id`),
  KEY `acl_group_id` (`acl_group_id`),
  CONSTRAINT `acl_res_group_relations_ibfk_1` FOREIGN KEY (`acl_res_id`) REFERENCES `acl_resources` (`acl_res_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_res_group_relations_ibfk_2` FOREIGN KEY (`acl_group_id`) REFERENCES `acl_groups` (`acl_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_res_group_relations`
--

LOCK TABLES `acl_res_group_relations` WRITE;
/*!40000 ALTER TABLE `acl_res_group_relations` DISABLE KEYS */;
INSERT INTO `acl_res_group_relations` VALUES (1,1,1);
/*!40000 ALTER TABLE `acl_res_group_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_resources`
--

DROP TABLE IF EXISTS `acl_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resources` (
  `acl_res_id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_res_name` varchar(255) DEFAULT NULL,
  `acl_res_alias` varchar(255) DEFAULT NULL,
  `all_hosts` enum('0','1') DEFAULT NULL,
  `all_hostgroups` enum('0','1') DEFAULT NULL,
  `all_servicegroups` enum('0','1') DEFAULT NULL,
  `acl_res_activate` enum('0','1','2') DEFAULT NULL,
  `acl_res_comment` text,
  `acl_res_status` enum('0','1') DEFAULT NULL,
  `changed` int(11) DEFAULT NULL,
  PRIMARY KEY (`acl_res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resources`
--

LOCK TABLES `acl_resources` WRITE;
/*!40000 ALTER TABLE `acl_resources` DISABLE KEYS */;
INSERT INTO `acl_resources` VALUES (1,'All Resources','All Resources','1','1','1','1',NULL,NULL,1);
/*!40000 ALTER TABLE `acl_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_resources_hc_relations`
--

DROP TABLE IF EXISTS `acl_resources_hc_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resources_hc_relations` (
  `arhcr_id` int(11) NOT NULL AUTO_INCREMENT,
  `hc_id` int(11) DEFAULT NULL,
  `acl_res_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`arhcr_id`),
  KEY `hc_id` (`hc_id`),
  KEY `acl_res_id` (`acl_res_id`),
  CONSTRAINT `acl_resources_hc_relations_ibfk_1` FOREIGN KEY (`hc_id`) REFERENCES `hostcategories` (`hc_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_resources_hc_relations_ibfk_2` FOREIGN KEY (`acl_res_id`) REFERENCES `acl_resources` (`acl_res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resources_hc_relations`
--

LOCK TABLES `acl_resources_hc_relations` WRITE;
/*!40000 ALTER TABLE `acl_resources_hc_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_resources_hc_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_resources_hg_relations`
--

DROP TABLE IF EXISTS `acl_resources_hg_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resources_hg_relations` (
  `arhge_id` int(11) NOT NULL AUTO_INCREMENT,
  `hg_hg_id` int(11) DEFAULT NULL,
  `acl_res_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`arhge_id`),
  KEY `hg_hg_id` (`hg_hg_id`),
  KEY `acl_res_id` (`acl_res_id`),
  KEY `hg_hg_id_2` (`hg_hg_id`,`acl_res_id`),
  CONSTRAINT `acl_resources_hg_relations_ibfk_1` FOREIGN KEY (`hg_hg_id`) REFERENCES `hostgroup` (`hg_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_resources_hg_relations_ibfk_2` FOREIGN KEY (`acl_res_id`) REFERENCES `acl_resources` (`acl_res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resources_hg_relations`
--

LOCK TABLES `acl_resources_hg_relations` WRITE;
/*!40000 ALTER TABLE `acl_resources_hg_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_resources_hg_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_resources_host_relations`
--

DROP TABLE IF EXISTS `acl_resources_host_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resources_host_relations` (
  `arhr_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_host_id` int(11) DEFAULT NULL,
  `acl_res_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`arhr_id`),
  KEY `host_host_id` (`host_host_id`),
  KEY `acl_res_id` (`acl_res_id`),
  CONSTRAINT `acl_resources_host_relations_ibfk_1` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_resources_host_relations_ibfk_2` FOREIGN KEY (`acl_res_id`) REFERENCES `acl_resources` (`acl_res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resources_host_relations`
--

LOCK TABLES `acl_resources_host_relations` WRITE;
/*!40000 ALTER TABLE `acl_resources_host_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_resources_host_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_resources_hostex_relations`
--

DROP TABLE IF EXISTS `acl_resources_hostex_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resources_hostex_relations` (
  `arhe_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_host_id` int(11) DEFAULT NULL,
  `acl_res_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`arhe_id`),
  KEY `host_host_id` (`host_host_id`),
  KEY `acl_res_id` (`acl_res_id`),
  CONSTRAINT `acl_resources_hostex_relations_ibfk_1` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_resources_hostex_relations_ibfk_2` FOREIGN KEY (`acl_res_id`) REFERENCES `acl_resources` (`acl_res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resources_hostex_relations`
--

LOCK TABLES `acl_resources_hostex_relations` WRITE;
/*!40000 ALTER TABLE `acl_resources_hostex_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_resources_hostex_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_resources_meta_relations`
--

DROP TABLE IF EXISTS `acl_resources_meta_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resources_meta_relations` (
  `armse_id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_id` int(11) DEFAULT NULL,
  `acl_res_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`armse_id`),
  KEY `meta_id` (`meta_id`),
  KEY `acl_res_id` (`acl_res_id`),
  CONSTRAINT `acl_resources_meta_relations_ibfk_1` FOREIGN KEY (`meta_id`) REFERENCES `meta_service` (`meta_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_resources_meta_relations_ibfk_2` FOREIGN KEY (`acl_res_id`) REFERENCES `acl_resources` (`acl_res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resources_meta_relations`
--

LOCK TABLES `acl_resources_meta_relations` WRITE;
/*!40000 ALTER TABLE `acl_resources_meta_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_resources_meta_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_resources_poller_relations`
--

DROP TABLE IF EXISTS `acl_resources_poller_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resources_poller_relations` (
  `arpr_id` int(11) NOT NULL AUTO_INCREMENT,
  `poller_id` int(11) DEFAULT NULL,
  `acl_res_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`arpr_id`),
  KEY `poller_id` (`poller_id`),
  KEY `acl_res_id` (`acl_res_id`),
  CONSTRAINT `acl_resources_poller_relations_ibfk_1` FOREIGN KEY (`poller_id`) REFERENCES `nagios_server` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acl_resources_poller_relations_ibfk_2` FOREIGN KEY (`acl_res_id`) REFERENCES `acl_resources` (`acl_res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resources_poller_relations`
--

LOCK TABLES `acl_resources_poller_relations` WRITE;
/*!40000 ALTER TABLE `acl_resources_poller_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_resources_poller_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_resources_sc_relations`
--

DROP TABLE IF EXISTS `acl_resources_sc_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resources_sc_relations` (
  `arscr_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_id` int(11) DEFAULT NULL,
  `acl_res_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`arscr_id`),
  KEY `sc_id` (`sc_id`),
  KEY `acl_res_id` (`acl_res_id`),
  CONSTRAINT `acl_resources_sc_relations_ibfk_1` FOREIGN KEY (`sc_id`) REFERENCES `service_categories` (`sc_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_resources_sc_relations_ibfk_2` FOREIGN KEY (`acl_res_id`) REFERENCES `acl_resources` (`acl_res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resources_sc_relations`
--

LOCK TABLES `acl_resources_sc_relations` WRITE;
/*!40000 ALTER TABLE `acl_resources_sc_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_resources_sc_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_resources_service_relations`
--

DROP TABLE IF EXISTS `acl_resources_service_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resources_service_relations` (
  `arsr_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_service_id` int(11) DEFAULT NULL,
  `acl_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`arsr_id`),
  KEY `service_service_id` (`service_service_id`),
  KEY `acl_group_id` (`acl_group_id`),
  CONSTRAINT `acl_resources_service_relations_ibfk_1` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_resources_service_relations_ibfk_2` FOREIGN KEY (`acl_group_id`) REFERENCES `acl_groups` (`acl_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resources_service_relations`
--

LOCK TABLES `acl_resources_service_relations` WRITE;
/*!40000 ALTER TABLE `acl_resources_service_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_resources_service_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_resources_sg_relations`
--

DROP TABLE IF EXISTS `acl_resources_sg_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resources_sg_relations` (
  `asgr` int(11) NOT NULL AUTO_INCREMENT,
  `sg_id` int(11) DEFAULT NULL,
  `acl_res_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`asgr`),
  KEY `sg_id` (`sg_id`),
  KEY `acl_res_id` (`acl_res_id`),
  KEY `sg_id_2` (`sg_id`,`acl_res_id`),
  CONSTRAINT `acl_resources_sg_relations_ibfk_1` FOREIGN KEY (`sg_id`) REFERENCES `servicegroup` (`sg_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_resources_sg_relations_ibfk_2` FOREIGN KEY (`acl_res_id`) REFERENCES `acl_resources` (`acl_res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resources_sg_relations`
--

LOCK TABLES `acl_resources_sg_relations` WRITE;
/*!40000 ALTER TABLE `acl_resources_sg_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_resources_sg_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_topology`
--

DROP TABLE IF EXISTS `acl_topology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_topology` (
  `acl_topo_id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_topo_name` varchar(255) DEFAULT NULL,
  `acl_topo_alias` varchar(255) DEFAULT NULL,
  `acl_comments` text,
  `acl_topo_activate` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`acl_topo_id`),
  KEY `acl_topo_id` (`acl_topo_id`,`acl_topo_activate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_topology`
--

LOCK TABLES `acl_topology` WRITE;
/*!40000 ALTER TABLE `acl_topology` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_topology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_topology_relations`
--

DROP TABLE IF EXISTS `acl_topology_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_topology_relations` (
  `agt_id` int(11) NOT NULL AUTO_INCREMENT,
  `topology_topology_id` int(11) DEFAULT NULL,
  `acl_topo_id` int(11) DEFAULT NULL,
  `access_right` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`agt_id`),
  KEY `topology_topology_id` (`topology_topology_id`),
  KEY `acl_topo_id` (`acl_topo_id`),
  CONSTRAINT `acl_topology_relations_ibfk_2` FOREIGN KEY (`topology_topology_id`) REFERENCES `topology` (`topology_id`) ON DELETE CASCADE,
  CONSTRAINT `acl_topology_relations_ibfk_3` FOREIGN KEY (`acl_topo_id`) REFERENCES `acl_topology` (`acl_topo_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_topology_relations`
--

LOCK TABLES `acl_topology_relations` WRITE;
/*!40000 ALTER TABLE `acl_topology_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_topology_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_ressource`
--

DROP TABLE IF EXISTS `auth_ressource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_ressource` (
  `ar_id` int(11) NOT NULL AUTO_INCREMENT,
  `ar_name` varchar(255) NOT NULL DEFAULT 'Default',
  `ar_description` varchar(255) NOT NULL DEFAULT 'Default description',
  `ar_type` varchar(50) NOT NULL,
  `ar_enable` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`ar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_ressource`
--

LOCK TABLES `auth_ressource` WRITE;
/*!40000 ALTER TABLE `auth_ressource` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_ressource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_ressource_host`
--

DROP TABLE IF EXISTS `auth_ressource_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_ressource_host` (
  `ldap_host_id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_ressource_id` int(11) NOT NULL,
  `host_address` varchar(255) NOT NULL,
  `host_port` int(11) NOT NULL,
  `use_ssl` tinyint(4) DEFAULT '0',
  `use_tls` tinyint(4) DEFAULT '0',
  `host_order` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ldap_host_id`),
  KEY `fk_auth_ressource_id` (`auth_ressource_id`),
  CONSTRAINT `fk_auth_ressource_id` FOREIGN KEY (`auth_ressource_id`) REFERENCES `auth_ressource` (`ar_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_ressource_host`
--

LOCK TABLES `auth_ressource_host` WRITE;
/*!40000 ALTER TABLE `auth_ressource_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_ressource_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_ressource_info`
--

DROP TABLE IF EXISTS `auth_ressource_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_ressource_info` (
  `ar_id` int(11) NOT NULL,
  `ari_name` varchar(100) NOT NULL,
  `ari_value` varchar(1024) NOT NULL,
  PRIMARY KEY (`ar_id`,`ari_name`),
  CONSTRAINT `auth_ressource_info_ibfk_1` FOREIGN KEY (`ar_id`) REFERENCES `auth_ressource` (`ar_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_ressource_info`
--

LOCK TABLES `auth_ressource_info` WRITE;
/*!40000 ALTER TABLE `auth_ressource_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_ressource_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_field`
--

DROP TABLE IF EXISTS `cb_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_field` (
  `cb_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldname` varchar(100) NOT NULL,
  `displayname` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fieldtype` varchar(255) NOT NULL DEFAULT 'text',
  `external` varchar(255) DEFAULT NULL,
  `cb_fieldgroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cb_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_field`
--

LOCK TABLES `cb_field` WRITE;
/*!40000 ALTER TABLE `cb_field` DISABLE KEYS */;
INSERT INTO `cb_field` VALUES (1,'port','Connection port','Port to listen on (empty host) or to connect to (with host filled).','int',NULL,NULL),(2,'host','Host to connect to','IP address or hostname of the host to connect to (leave blank for listening mode).','text',NULL,NULL),(3,'ca_certificate','Trusted CA\'s certificate','Trusted CA\'s certificate.','text',NULL,NULL),(4,'private_key','Private key file.','Private key file path when TLS encryption is used.','text',NULL,NULL),(5,'public_cert','Public certificate','Public certificate file path when TLS encryption is used.','text',NULL,NULL),(6,'tls','Enable TLS encryption','Enable TLS encryption.','radio',NULL,NULL),(7,'db_host','DB host','IP address or hostname of the database server.','text',NULL,NULL),(8,'db_user','DB user','Database user.','text',NULL,NULL),(9,'db_password','DB password','Password of database user.','password',NULL,NULL),(10,'db_name','DB name','Database name.','text',NULL,NULL),(11,'path','File path','Path to the file.','text',NULL,NULL),(12,'protocol','Serialization protocol','Serialization protocol.','select',NULL,NULL),(13,'metrics_path','RRD file directory for metrics','RRD file directory, for example /var/lib/centreon/metrics','text','D=centreon_storage:T=config:C=RRDdatabase_path:CK=id:K=1',NULL),(14,'status_path','RRD file directory for statuses','RRD file directory, for example /var/lib/centreon/status','text','D=centreon_storage:T=config:C=RRDdatabase_status_path:CK=id:K=1',NULL),(15,'db_type','DB type','Target DBMS.','select',NULL,NULL),(16,'interval','Interval length','Interval length in seconds.','int','T=options:C=value:CK=key:K=interval_length',NULL),(17,'length','RRD length','RRD storage duration in seconds.','int','D=centreon_storage:T=config:C=len_storage_rrd:RPN=86400 *:CK=id:K=1',NULL),(18,'db_port','DB port','Port on which the DB server listens','int',NULL,NULL),(19,'name','Name of the logger','For a file logger this is the path to the file. For a standard logger, one of \'stdout\' or \'stderr\'.','text',NULL,NULL),(20,'config','Configuration messages','Enable or not configuration messages logging.','radio',NULL,NULL),(21,'debug','Debug messages','Enable or not debug messages logging.','radio',NULL,NULL),(22,'error','Error messages','Enable or not error messages logging.','radio',NULL,NULL),(23,'info','Informational messages','Enable or not informational messages logging.','radio',NULL,NULL),(24,'level','Logging level','How much messages must be logged.','select',NULL,NULL),(25,'compression','Compression (zlib)','Enable or not data stream compression.','radio',NULL,NULL),(26,'compression_level','Compression level','Ranges from 0 (no compression) to 9 (best compression). Default is -1 (zlib compression)','int',NULL,NULL),(27,'compression_buffer','Compression buffer size','The higher the buffer size is, the best compression. This however increase data streaming latency. Use with caution.','int',NULL,NULL),(28,'failover','Failover name','Name of the input or output object that will act as failover.','text',NULL,NULL),(29,'file','Correlation file','Path to the correlation file which holds host, services, dependencies and parenting definitions.','text',NULL,NULL),(30,'retention','Retention file','File where correlation state will be stored during correlation engine restart','text',NULL,NULL),(31,'retry_interval','Retry interval','Time in seconds to wait between each connection attempt.','int',NULL,NULL),(32,'buffering_timeout','Buffering timeout','Time in seconds to wait before launching failover.','int',NULL,NULL),(33,'fifo','File for Centreon Broker statistics','File where Centreon Broker statistics will be stored','text',NULL,NULL),(34,'queries_per_transaction','Maximum queries per transaction','The maximum queries per transaction before commit.','int',NULL,NULL),(35,'read_timeout','Transaction commit timeout','The transaction timeout before running commit.','int',NULL,NULL),(36,'path','Unix socket','The Unix socket used to communicate with rrdcached. This is a global option, go to Administration > Options > RRDTool to modify it.','text','T=options:C=value:CK=key:K=rrdcached_unix_path',NULL),(37,'port','TCP port','The TCP port used to communicate with rrdcached. This is a global option, go to Administration > Options > RRDTool to modify it.','int','T=options:C=value:CK=key:K=rrdcached_port',NULL),(38,'max_size','Max file size in bytes','The maximum size of log file.','int',NULL,NULL),(39,'check_replication','Replication enabled','When enabled, the broker engine will check whether or not the replication is up to date before attempting to update data.','radio',NULL,NULL),(40,'rebuild_check_interval','Rebuild check interval in seconds','The interval between check if some metrics must be rebuild. The default value is 300s','int',NULL,NULL),(41,'max_size','Maximum size of file','Maximum size in bytes.','int',NULL,NULL),(42,'store_in_data_bin','Store in performance data in data_bin','It should be enabled to control whether or not Centreon Broker should insert performance data in the data_bin table.','radio',NULL,NULL),(43,'insert_in_index_data','Insert in index data','Whether or not Broker should create entries in the index_data table. This process should be done by Centreon and this option should only be enabled by advanced users knowing what they\'re doing','text','T=options:C=value:CK=key:K=index_data',NULL),(44,'write_metrics','Write metrics','This can be used to disable graph update and therefore reduce I/O','radio',NULL,NULL),(45,'write_status','Write status','This can be used to disable graph update and therefore reduce I/O','radio',NULL,NULL),(46,'negotiation','Enable negotiation','Enable negotiation option (use only for version of Centren Broker >= 2.5)','radio',NULL,NULL),(47,'category','Filter category','Category filter for flux in output','multiselect',NULL,1),(48,'one_peer_retention_mode','One peer retention','This allows the retention to work even if the socket is listening','radio',NULL,NULL),(49,'cleanup_check_interval','Cleanup check interval','Interval in seconds before delete data from deleted pollers.','int',NULL,NULL),(50,'instance_timeout','Instance timeout','Interval in seconds before change status of resources from a disconnected poller','int',NULL,NULL),(51,'metric_naming','Metric naming','How to name entries for metrics. This string supports macros such as $METRIC$, $HOST$, $SERVICE$ and $INSTANCE$','text',NULL,NULL),(52,'status_naming','Status naming','How to name entries for statuses. This string supports macros such as $METRIC$, $HOST$, $SERVICE$ and $INSTANCE$','text',NULL,NULL);
/*!40000 ALTER TABLE `cb_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_fieldgroup`
--

DROP TABLE IF EXISTS `cb_fieldgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_fieldgroup` (
  `cb_fieldgroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(100) NOT NULL,
  `group_parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cb_fieldgroup_id`),
  KEY `group_parent_id` (`group_parent_id`),
  CONSTRAINT `cb_fieldgroup_ibfk_1` FOREIGN KEY (`group_parent_id`) REFERENCES `cb_fieldgroup` (`cb_fieldgroup_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_fieldgroup`
--

LOCK TABLES `cb_fieldgroup` WRITE;
/*!40000 ALTER TABLE `cb_fieldgroup` DISABLE KEYS */;
INSERT INTO `cb_fieldgroup` VALUES (1,'filters',NULL);
/*!40000 ALTER TABLE `cb_fieldgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_fieldset`
--

DROP TABLE IF EXISTS `cb_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_fieldset` (
  `cb_fieldset_id` int(11) NOT NULL,
  `fieldset_name` varchar(255) NOT NULL,
  PRIMARY KEY (`cb_fieldset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_fieldset`
--

LOCK TABLES `cb_fieldset` WRITE;
/*!40000 ALTER TABLE `cb_fieldset` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_list`
--

DROP TABLE IF EXISTS `cb_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_list` (
  `cb_list_id` int(11) NOT NULL,
  `cb_field_id` int(11) NOT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cb_list_id`,`cb_field_id`),
  UNIQUE KEY `cb_field_idx_01` (`cb_field_id`),
  KEY `fk_cb_list_1` (`cb_field_id`),
  CONSTRAINT `fk_cb_list_1` FOREIGN KEY (`cb_field_id`) REFERENCES `cb_field` (`cb_field_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_list`
--

LOCK TABLES `cb_list` WRITE;
/*!40000 ALTER TABLE `cb_list` DISABLE KEYS */;
INSERT INTO `cb_list` VALUES (1,20,'yes'),(1,21,'no'),(1,22,'yes'),(1,23,'no'),(1,39,'no'),(1,42,'yes'),(1,44,'yes'),(1,45,'yes'),(1,46,'yes'),(1,48,'no'),(2,12,NULL),(3,15,NULL),(4,24,NULL),(5,6,'no'),(5,25,'no'),(6,47,NULL);
/*!40000 ALTER TABLE `cb_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_list_values`
--

DROP TABLE IF EXISTS `cb_list_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_list_values` (
  `cb_list_id` int(11) NOT NULL,
  `value_name` varchar(255) NOT NULL,
  `value_value` varchar(255) NOT NULL,
  PRIMARY KEY (`cb_list_id`,`value_name`),
  KEY `fk_cb_list_values_1` (`cb_list_id`),
  CONSTRAINT `fk_cb_list_values_1` FOREIGN KEY (`cb_list_id`) REFERENCES `cb_list` (`cb_list_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_list_values`
--

LOCK TABLES `cb_list_values` WRITE;
/*!40000 ALTER TABLE `cb_list_values` DISABLE KEYS */;
INSERT INTO `cb_list_values` VALUES (1,'No','no'),(1,'Yes','yes'),(2,'BBDO Protocol','bbdo'),(2,'NDO Protocol','ndo'),(3,'DB2','db2'),(3,'InterBase','ibase'),(3,'MySQL','mysql'),(3,'ODBC','odbc'),(3,'Oracle','oci'),(3,'PostgreSQL','postgresql'),(3,'SQLite','sqlite'),(3,'Sysbase','tds'),(4,'Base','low'),(4,'Detailed','medium'),(4,'Very detailed','high'),(5,'Auto','auto'),(5,'No','no'),(5,'Yes','yes'),(6,'Correlation','correlation'),(6,'Dumper','dumper'),(6,'Neb','neb'),(6,'Storage','storage');
/*!40000 ALTER TABLE `cb_list_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_module`
--

DROP TABLE IF EXISTS `cb_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_module` (
  `cb_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `libname` varchar(50) DEFAULT NULL,
  `loading_pos` int(11) DEFAULT NULL,
  `is_bundle` int(1) NOT NULL DEFAULT '0',
  `is_activated` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cb_module_id`),
  UNIQUE KEY `cb_module_idx01` (`name`),
  UNIQUE KEY `cb_module_idx02` (`libname`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_module`
--

LOCK TABLES `cb_module` WRITE;
/*!40000 ALTER TABLE `cb_module` DISABLE KEYS */;
INSERT INTO `cb_module` VALUES (1,'SQL','sql.so',80,0,1),(2,'TCP','tcp.so',50,0,1),(3,'file','file.so',50,0,1),(5,'NDO','ndo.so',80,0,1),(6,'NEB','neb.so',10,0,1),(7,'RRD','rrd.so',30,0,1),(8,'Storage','storage.so',20,0,1),(9,'Core',NULL,NULL,1,1),(10,'Centreon Storage',NULL,NULL,1,1),(11,'Compression','compression.so',60,0,1),(12,'Failover',NULL,NULL,0,1),(17,'Dumper','dumper.so',20,0,1),(18,'Graphite','graphite.so',21,0,1);
/*!40000 ALTER TABLE `cb_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_module_relation`
--

DROP TABLE IF EXISTS `cb_module_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_module_relation` (
  `cb_module_id` int(11) NOT NULL,
  `module_depend_id` int(11) NOT NULL,
  `inherit_config` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cb_module_id`,`module_depend_id`),
  KEY `fk_cb_module_relation_1` (`cb_module_id`),
  KEY `fk_cb_module_relation_2` (`module_depend_id`),
  CONSTRAINT `fk_cb_module_relation_1` FOREIGN KEY (`cb_module_id`) REFERENCES `cb_module` (`cb_module_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_cb_module_relation_2` FOREIGN KEY (`module_depend_id`) REFERENCES `cb_module` (`cb_module_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_module_relation`
--

LOCK TABLES `cb_module_relation` WRITE;
/*!40000 ALTER TABLE `cb_module_relation` DISABLE KEYS */;
INSERT INTO `cb_module_relation` VALUES (1,6,0),(1,8,0),(1,12,1),(2,11,1),(2,12,1),(3,11,1),(3,12,1),(5,6,0),(7,8,0),(7,12,1),(8,6,0),(8,12,1);
/*!40000 ALTER TABLE `cb_module_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_tag`
--

DROP TABLE IF EXISTS `cb_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_tag` (
  `cb_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(50) NOT NULL,
  PRIMARY KEY (`cb_tag_id`),
  UNIQUE KEY `cb_tag_ix01` (`tagname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_tag`
--

LOCK TABLES `cb_tag` WRITE;
/*!40000 ALTER TABLE `cb_tag` DISABLE KEYS */;
INSERT INTO `cb_tag` VALUES (2,'input'),(3,'logger'),(1,'output');
/*!40000 ALTER TABLE `cb_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_tag_type_relation`
--

DROP TABLE IF EXISTS `cb_tag_type_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_tag_type_relation` (
  `cb_tag_id` int(11) NOT NULL,
  `cb_type_id` int(11) NOT NULL,
  `cb_type_uniq` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cb_tag_id`,`cb_type_id`),
  KEY `fk_cb_tag_type_relation_1` (`cb_tag_id`),
  KEY `fk_cb_tag_type_relation_2` (`cb_type_id`),
  CONSTRAINT `fk_cb_tag_type_relation_1` FOREIGN KEY (`cb_tag_id`) REFERENCES `cb_tag` (`cb_tag_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_cb_tag_type_relation_2` FOREIGN KEY (`cb_type_id`) REFERENCES `cb_type` (`cb_type_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_tag_type_relation`
--

LOCK TABLES `cb_tag_type_relation` WRITE;
/*!40000 ALTER TABLE `cb_tag_type_relation` DISABLE KEYS */;
INSERT INTO `cb_tag_type_relation` VALUES (1,3,0),(1,10,0),(1,11,0),(1,13,0),(1,14,0),(1,16,0),(1,28,1),(1,29,1),(1,30,0),(2,3,0),(2,10,0),(2,11,0),(3,17,0),(3,18,0),(3,19,0),(3,24,0);
/*!40000 ALTER TABLE `cb_tag_type_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_type`
--

DROP TABLE IF EXISTS `cb_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_type` (
  `cb_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `type_shortname` varchar(50) NOT NULL,
  `cb_module_id` int(11) NOT NULL,
  PRIMARY KEY (`cb_type_id`),
  KEY `fk_cb_type_1` (`cb_module_id`),
  CONSTRAINT `fk_cb_type_1` FOREIGN KEY (`cb_module_id`) REFERENCES `cb_module` (`cb_module_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_type`
--

LOCK TABLES `cb_type` WRITE;
/*!40000 ALTER TABLE `cb_type` DISABLE KEYS */;
INSERT INTO `cb_type` VALUES (3,'IPv4','ipv4',2),(10,'IPv6','ipv6',2),(11,'File','file',3),(13,'RRD file generator','rrd',7),(14,'Perfdata Generator (Centreon Storage)','storage',8),(16,'Broker SQL database','sql',1),(17,'File','file',9),(18,'Standard','standard',9),(19,'Syslog','syslog',9),(20,'Compressor','compressor',11),(21,'Failover','failover',12),(24,'Monitoring','monitoring',9),(28,'Database configuration reader','db_cfg_reader',17),(29,'Database configuration writer','db_cfg_writer',17),(30,'Storage - Graphite','graphite',18);
/*!40000 ALTER TABLE `cb_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_type_field_relation`
--

DROP TABLE IF EXISTS `cb_type_field_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_type_field_relation` (
  `cb_type_id` int(11) NOT NULL,
  `cb_field_id` int(11) NOT NULL,
  `cb_fieldset_id` int(11) DEFAULT NULL,
  `is_required` int(11) NOT NULL DEFAULT '0',
  `order_display` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cb_type_id`,`cb_field_id`),
  KEY `fk_cb_type_field_relation_1` (`cb_type_id`),
  KEY `fk_cb_type_field_relation_2` (`cb_field_id`),
  CONSTRAINT `fk_cb_type_field_relation_1` FOREIGN KEY (`cb_type_id`) REFERENCES `cb_type` (`cb_type_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_cb_type_field_relation_2` FOREIGN KEY (`cb_field_id`) REFERENCES `cb_field` (`cb_field_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_type_field_relation`
--

LOCK TABLES `cb_type_field_relation` WRITE;
/*!40000 ALTER TABLE `cb_type_field_relation` DISABLE KEYS */;
INSERT INTO `cb_type_field_relation` VALUES (3,1,NULL,1,1),(3,2,NULL,0,2),(3,3,NULL,0,7),(3,4,NULL,0,5),(3,5,NULL,0,6),(3,6,NULL,1,4),(3,12,NULL,1,3),(3,46,NULL,1,8),(3,47,NULL,0,17),(3,48,NULL,0,16),(10,1,NULL,1,1),(10,2,NULL,0,2),(10,3,NULL,0,7),(10,4,NULL,0,5),(10,5,NULL,0,6),(10,6,NULL,1,4),(10,12,NULL,1,3),(10,46,NULL,1,8),(10,47,NULL,0,17),(10,48,NULL,0,16),(11,11,NULL,1,1),(11,12,NULL,1,2),(11,41,NULL,0,3),(11,47,NULL,0,17),(13,13,NULL,1,1),(13,14,NULL,1,2),(13,36,NULL,0,4),(13,37,NULL,0,3),(13,42,NULL,1,5),(13,43,NULL,1,6),(13,44,NULL,1,5),(13,45,NULL,1,6),(13,47,NULL,0,17),(14,7,NULL,1,4),(14,8,NULL,1,6),(14,9,NULL,0,7),(14,10,NULL,1,8),(14,15,NULL,1,3),(14,16,NULL,1,1),(14,17,NULL,1,2),(14,18,NULL,1,5),(14,34,NULL,0,9),(14,35,NULL,0,10),(14,39,NULL,0,11),(14,40,NULL,0,12),(14,42,NULL,1,13),(14,43,NULL,1,14),(14,47,NULL,0,17),(16,7,NULL,1,2),(16,8,NULL,1,4),(16,9,NULL,0,5),(16,10,NULL,1,6),(16,15,NULL,1,1),(16,18,NULL,1,3),(16,34,NULL,0,7),(16,35,NULL,0,8),(16,39,NULL,0,8),(16,47,NULL,0,17),(16,49,NULL,0,18),(16,50,NULL,0,19),(17,19,NULL,1,1),(17,20,NULL,1,2),(17,21,NULL,1,3),(17,22,NULL,1,4),(17,23,NULL,1,5),(17,24,NULL,1,6),(17,38,NULL,0,7),(18,19,NULL,1,1),(18,20,NULL,1,2),(18,21,NULL,1,3),(18,22,NULL,1,4),(18,23,NULL,1,5),(18,24,NULL,1,6),(19,20,NULL,1,1),(19,21,NULL,1,2),(19,22,NULL,1,3),(19,23,NULL,1,4),(19,24,NULL,1,5),(20,25,NULL,0,101),(20,26,NULL,0,102),(20,27,NULL,0,103),(21,28,NULL,0,2),(21,31,NULL,0,2),(21,32,NULL,0,2),(24,19,NULL,1,1),(24,20,NULL,1,2),(24,21,NULL,1,3),(24,22,NULL,1,4),(24,23,NULL,1,5),(24,24,NULL,1,6),(28,7,NULL,1,2),(28,8,NULL,1,4),(28,9,NULL,0,5),(28,10,NULL,1,6),(28,15,NULL,1,1),(28,18,NULL,1,3),(29,7,NULL,1,2),(29,8,NULL,1,4),(29,9,NULL,0,5),(29,10,NULL,1,6),(29,15,NULL,1,1),(29,18,NULL,1,3),(30,7,NULL,1,1),(30,8,NULL,0,3),(30,9,NULL,0,4),(30,18,NULL,0,2),(30,28,NULL,0,6),(30,34,NULL,0,5),(30,51,NULL,1,7),(30,52,NULL,1,8);
/*!40000 ALTER TABLE `cb_type_field_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfg_centreonbroker`
--

DROP TABLE IF EXISTS `cfg_centreonbroker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_centreonbroker` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(100) NOT NULL,
  `config_filename` varchar(255) NOT NULL,
  `config_write_timestamp` enum('0','1') DEFAULT '1',
  `config_write_thread_id` enum('0','1') DEFAULT '1',
  `config_activate` enum('0','1') DEFAULT '0',
  `ns_nagios_server` int(11) NOT NULL,
  `event_queue_max_size` int(11) DEFAULT '50000',
  `command_file` varchar(255) DEFAULT NULL,
  `retention_path` varchar(255) DEFAULT NULL,
  `stats_activate` enum('0','1') DEFAULT '1',
  `correlation_activate` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfg_centreonbroker`
--

LOCK TABLES `cfg_centreonbroker` WRITE;
/*!40000 ALTER TABLE `cfg_centreonbroker` DISABLE KEYS */;
INSERT INTO `cfg_centreonbroker` VALUES (1,'central-broker-master','central-broker.xml','1','0','1',1,50000,NULL,'/var/lib/centreon-broker','1','0'),(2,'central-rrd-master','central-rrd.xml','1','0','1',1,50000,NULL,'/var/lib/centreon-broker','1','0'),(3,'central-module-master','central-module.xml','0','0','1',1,50000,NULL,'/var/lib/centreon-engine','1','0');
/*!40000 ALTER TABLE `cfg_centreonbroker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfg_centreonbroker_info`
--

DROP TABLE IF EXISTS `cfg_centreonbroker_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_centreonbroker_info` (
  `config_id` int(11) NOT NULL,
  `config_key` varchar(50) NOT NULL,
  `config_value` varchar(255) NOT NULL,
  `config_group` varchar(50) NOT NULL,
  `config_group_id` int(11) DEFAULT NULL,
  `grp_level` int(11) NOT NULL DEFAULT '0',
  `subgrp_id` int(11) DEFAULT NULL,
  `parent_grp_id` int(11) DEFAULT NULL,
  KEY `cfg_centreonbroker_info_idx01` (`config_id`),
  KEY `cfg_centreonbroker_info_idx02` (`config_id`,`config_group`),
  CONSTRAINT `cfg_centreonbroker_info_ibfk_01` FOREIGN KEY (`config_id`) REFERENCES `cfg_centreonbroker` (`config_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfg_centreonbroker_info`
--

LOCK TABLES `cfg_centreonbroker_info` WRITE;
/*!40000 ALTER TABLE `cfg_centreonbroker_info` DISABLE KEYS */;
INSERT INTO `cfg_centreonbroker_info` VALUES (3,'name','/var/log/centreon-broker/central-module-master.log','logger',1,0,NULL,NULL),(3,'config','yes','logger',1,0,NULL,NULL),(3,'debug','no','logger',1,0,NULL,NULL),(3,'error','yes','logger',1,0,NULL,NULL),(3,'info','no','logger',1,0,NULL,NULL),(3,'level','low','logger',1,0,NULL,NULL),(3,'max_size','','logger',1,0,NULL,NULL),(3,'type','file','logger',1,0,NULL,NULL),(3,'blockId','3_17','logger',1,0,NULL,NULL),(3,'name','central-module-master-output','output',1,0,NULL,NULL),(3,'port','5669','output',1,0,NULL,NULL),(3,'host','localhost','output',1,0,NULL,NULL),(3,'failover','','output',1,0,NULL,NULL),(3,'retry_interval','60','output',1,0,NULL,NULL),(3,'buffering_timeout','0','output',1,0,NULL,NULL),(3,'protocol','bbdo','output',1,0,NULL,NULL),(3,'tls','no','output',1,0,NULL,NULL),(3,'private_key','','output',1,0,NULL,NULL),(3,'public_cert','','output',1,0,NULL,NULL),(3,'ca_certificate','','output',1,0,NULL,NULL),(3,'compression','no','output',1,0,NULL,NULL),(3,'compression_level','','output',1,0,NULL,NULL),(3,'compression_buffer','','output',1,0,NULL,NULL),(3,'type','ipv4','output',1,0,NULL,NULL),(3,'blockId','1_3','output',1,0,NULL,NULL),(1,'name','central-broker-master-input','input',1,0,NULL,NULL),(1,'port','5669','input',1,0,NULL,NULL),(1,'host','','input',1,0,NULL,NULL),(1,'failover','','input',1,0,NULL,NULL),(1,'retry_interval','60','input',1,0,NULL,NULL),(1,'buffering_timeout','0','input',1,0,NULL,NULL),(1,'protocol','bbdo','input',1,0,NULL,NULL),(1,'tls','auto','input',1,0,NULL,NULL),(1,'private_key','','input',1,0,NULL,NULL),(1,'public_cert','','input',1,0,NULL,NULL),(1,'ca_certificate','','input',1,0,NULL,NULL),(1,'negotiation','yes','input',1,0,NULL,NULL),(1,'one_peer_retention_mode','no','input',1,0,NULL,NULL),(1,'compression','auto','input',1,0,NULL,NULL),(1,'compression_level','','input',1,0,NULL,NULL),(1,'compression_buffer','','input',1,0,NULL,NULL),(1,'type','ipv4','input',1,0,NULL,NULL),(1,'blockId','2_3','input',1,0,NULL,NULL),(1,'name','/var/log/centreon-broker/central-broker-master.log','logger',1,0,NULL,NULL),(1,'config','yes','logger',1,0,NULL,NULL),(1,'debug','no','logger',1,0,NULL,NULL),(1,'error','yes','logger',1,0,NULL,NULL),(1,'info','no','logger',1,0,NULL,NULL),(1,'level','low','logger',1,0,NULL,NULL),(1,'max_size','','logger',1,0,NULL,NULL),(1,'type','file','logger',1,0,NULL,NULL),(1,'blockId','3_17','logger',1,0,NULL,NULL),(1,'name','central-broker-master-sql','output',1,0,NULL,NULL),(1,'db_type','mysql','output',1,0,NULL,NULL),(1,'failover','','output',1,0,NULL,NULL),(1,'retry_interval','60','output',1,0,NULL,NULL),(1,'buffering_timeout','0','output',1,0,NULL,NULL),(1,'db_host','mysql-centreon','output',1,0,NULL,NULL),(1,'db_port','3306','output',1,0,NULL,NULL),(1,'db_user','centreon','output',1,0,NULL,NULL),(1,'db_password','centreon','output',1,0,NULL,NULL),(1,'db_name','centreon_storage','output',1,0,NULL,NULL),(1,'queries_per_transaction','','output',1,0,NULL,NULL),(1,'read_timeout','','output',1,0,NULL,NULL),(1,'check_replication','no','output',1,0,NULL,NULL),(1,'cleanup_check_interval','','output',1,0,NULL,NULL),(1,'instance_timeout','','output',1,0,NULL,NULL),(1,'type','sql','output',1,0,NULL,NULL),(1,'blockId','1_16','output',1,0,NULL,NULL),(1,'name','centreon-broker-master-rrd','output',2,0,NULL,NULL),(1,'port','5670','output',2,0,NULL,NULL),(1,'host','localhost','output',2,0,NULL,NULL),(1,'failover','','output',2,0,NULL,NULL),(1,'retry_interval','60','output',2,0,NULL,NULL),(1,'buffering_timeout','0','output',2,0,NULL,NULL),(1,'protocol','bbdo','output',2,0,NULL,NULL),(1,'tls','no','output',2,0,NULL,NULL),(1,'private_key','','output',2,0,NULL,NULL),(1,'public_cert','','output',2,0,NULL,NULL),(1,'ca_certificate','','output',2,0,NULL,NULL),(1,'negotiation','yes','output',2,0,NULL,NULL),(1,'one_peer_retention_mode','no','output',2,0,NULL,NULL),(1,'compression','no','output',2,0,NULL,NULL),(1,'compression_level','','output',2,0,NULL,NULL),(1,'compression_buffer','','output',2,0,NULL,NULL),(1,'type','ipv4','output',2,0,NULL,NULL),(1,'blockId','1_3','output',2,0,NULL,NULL),(1,'name','central-broker-master-perfdata','output',3,0,NULL,NULL),(1,'interval','60','output',3,0,NULL,NULL),(1,'retry_interval','60','output',3,0,NULL,NULL),(1,'buffering_timeout','0','output',3,0,NULL,NULL),(1,'failover','','output',3,0,NULL,NULL),(1,'length','15552000','output',3,0,NULL,NULL),(1,'db_type','mysql','output',3,0,NULL,NULL),(1,'db_host','mysql-centreon','output',3,0,NULL,NULL),(1,'db_port','3306','output',3,0,NULL,NULL),(1,'db_user','centreon','output',3,0,NULL,NULL),(1,'db_password','centreon','output',3,0,NULL,NULL),(1,'db_name','centreon_storage','output',3,0,NULL,NULL),(1,'queries_per_transaction','','output',3,0,NULL,NULL),(1,'read_timeout','','output',3,0,NULL,NULL),(1,'check_replication','no','output',3,0,NULL,NULL),(1,'rebuild_check_interval','','output',3,0,NULL,NULL),(1,'store_in_data_bin','yes','output',3,0,NULL,NULL),(1,'insert_in_index_data','1','output',3,0,NULL,NULL),(1,'type','storage','output',3,0,NULL,NULL),(1,'blockId','1_14','output',3,0,NULL,NULL),(2,'name','central-rrd-master-input','input',1,0,NULL,NULL),(2,'port','5670','input',1,0,NULL,NULL),(2,'host','','input',1,0,NULL,NULL),(2,'failover','','input',1,0,NULL,NULL),(2,'retry_interval','60','input',1,0,NULL,NULL),(2,'buffering_timeout','0','input',1,0,NULL,NULL),(2,'protocol','bbdo','input',1,0,NULL,NULL),(2,'tls','auto','input',1,0,NULL,NULL),(2,'private_key','','input',1,0,NULL,NULL),(2,'public_cert','','input',1,0,NULL,NULL),(2,'ca_certificate','','input',1,0,NULL,NULL),(2,'negotiation','yes','input',1,0,NULL,NULL),(2,'one_peer_retention_mode','no','input',1,0,NULL,NULL),(2,'compression','auto','input',1,0,NULL,NULL),(2,'compression_level','','input',1,0,NULL,NULL),(2,'compression_buffer','','input',1,0,NULL,NULL),(2,'type','ipv4','input',1,0,NULL,NULL),(2,'blockId','2_3','input',1,0,NULL,NULL),(2,'name','/var/log/centreon-broker/central-rrd-master.log','logger',1,0,NULL,NULL),(2,'config','yes','logger',1,0,NULL,NULL),(2,'debug','no','logger',1,0,NULL,NULL),(2,'error','yes','logger',1,0,NULL,NULL),(2,'info','no','logger',1,0,NULL,NULL),(2,'level','low','logger',1,0,NULL,NULL),(2,'max_size','','logger',1,0,NULL,NULL),(2,'type','file','logger',1,0,NULL,NULL),(2,'blockId','3_17','logger',1,0,NULL,NULL),(2,'name','central-rrd-master-output','output',1,0,NULL,NULL),(2,'metrics_path','/var/lib/centreon/metrics/','output',1,0,NULL,NULL),(2,'status_path','/var/lib/centreon/status/','output',1,0,NULL,NULL),(2,'failover','','output',1,0,NULL,NULL),(2,'retry_interval','60','output',1,0,NULL,NULL),(2,'buffering_timeout','0','output',1,0,NULL,NULL),(2,'port','','output',1,0,NULL,NULL),(2,'path','','output',1,0,NULL,NULL),(2,'write_metrics','yes','output',1,0,NULL,NULL),(2,'store_in_data_bin','yes','output',1,0,NULL,NULL),(2,'write_status','yes','output',1,0,NULL,NULL),(2,'insert_in_index_data','1','output',1,0,NULL,NULL),(2,'type','rrd','output',1,0,NULL,NULL),(2,'blockId','1_13','output',1,0,NULL,NULL);
/*!40000 ALTER TABLE `cfg_centreonbroker_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfg_cgi`
--

DROP TABLE IF EXISTS `cfg_cgi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_cgi` (
  `cgi_id` int(11) NOT NULL AUTO_INCREMENT,
  `cgi_name` varchar(255) DEFAULT NULL,
  `instance_id` int(11) DEFAULT NULL,
  `main_config_file` varchar(255) DEFAULT NULL,
  `physical_html_path` varchar(255) DEFAULT NULL,
  `url_html_path` varchar(255) DEFAULT NULL,
  `nagios_check_command` varchar(255) DEFAULT NULL,
  `use_authentication` enum('0','1') DEFAULT NULL,
  `default_user_name` varchar(255) DEFAULT NULL,
  `authorized_for_system_information` text,
  `authorized_for_system_commands` text,
  `authorized_for_configuration_information` text,
  `authorized_for_all_hosts` text,
  `authorized_for_all_host_commands` text,
  `authorized_for_all_services` text,
  `authorized_for_all_service_commands` text,
  `statusmap_background_image` varchar(255) DEFAULT NULL,
  `default_statusmap_layout` enum('0','1','2','3','4','5','6') DEFAULT '2',
  `statuswrl_include` varchar(255) DEFAULT NULL,
  `default_statuswrl_layout` enum('0','1','2','3','4') DEFAULT '2',
  `refresh_rate` int(11) DEFAULT NULL,
  `host_unreachable_sound` varchar(255) DEFAULT NULL,
  `host_down_sound` varchar(255) DEFAULT NULL,
  `service_critical_sound` varchar(255) DEFAULT NULL,
  `service_warning_sound` varchar(255) DEFAULT NULL,
  `service_unknown_sound` varchar(255) DEFAULT NULL,
  `ping_syntax` text,
  `cgi_comment` text,
  `cgi_activate` enum('0','1') DEFAULT NULL,
  `action_url_target` varchar(255) DEFAULT NULL,
  `escape_html_tags` enum('0','1','2') DEFAULT '2',
  `lock_author_names` enum('0','1','2') DEFAULT '2',
  `notes_url_target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cgi_id`),
  KEY `fk_cgi_instance_id` (`instance_id`),
  CONSTRAINT `fk_cgi_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `nagios_server` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfg_cgi`
--

LOCK TABLES `cfg_cgi` WRITE;
/*!40000 ALTER TABLE `cfg_cgi` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfg_cgi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfg_nagios`
--

DROP TABLE IF EXISTS `cfg_nagios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_nagios` (
  `nagios_id` int(11) NOT NULL AUTO_INCREMENT,
  `nagios_name` varchar(255) DEFAULT NULL,
  `log_file` varchar(255) DEFAULT NULL,
  `cfg_dir` varchar(255) DEFAULT NULL,
  `object_cache_file` varchar(255) DEFAULT NULL,
  `precached_object_file` varchar(255) DEFAULT NULL,
  `temp_file` varchar(255) DEFAULT NULL,
  `temp_path` varchar(255) DEFAULT NULL,
  `status_file` varchar(255) DEFAULT NULL,
  `check_result_path` varchar(255) DEFAULT NULL,
  `use_check_result_path` enum('0','1') DEFAULT '0',
  `max_check_result_file_age` varchar(255) DEFAULT NULL,
  `p1_file` varchar(255) DEFAULT NULL,
  `status_update_interval` int(11) DEFAULT NULL,
  `nagios_user` varchar(255) DEFAULT NULL,
  `nagios_group` varchar(255) DEFAULT NULL,
  `enable_notifications` enum('0','1','2') DEFAULT NULL,
  `execute_service_checks` enum('0','1','2') DEFAULT NULL,
  `accept_passive_service_checks` enum('0','1','2') DEFAULT NULL,
  `execute_host_checks` enum('0','1','2') DEFAULT NULL,
  `accept_passive_host_checks` enum('0','1','2') DEFAULT NULL,
  `enable_event_handlers` enum('0','1','2') DEFAULT NULL,
  `log_rotation_method` varchar(255) DEFAULT NULL,
  `log_archive_path` varchar(255) DEFAULT NULL,
  `check_external_commands` enum('0','1','2') DEFAULT NULL,
  `external_command_buffer_slots` int(11) DEFAULT NULL,
  `command_check_interval` varchar(255) DEFAULT NULL,
  `command_file` varchar(255) DEFAULT NULL,
  `downtime_file` varchar(255) DEFAULT NULL,
  `comment_file` varchar(255) DEFAULT NULL,
  `lock_file` varchar(255) DEFAULT NULL,
  `retain_state_information` enum('0','1','2') DEFAULT NULL,
  `state_retention_file` varchar(255) DEFAULT NULL,
  `retention_update_interval` int(11) DEFAULT NULL,
  `use_retained_program_state` enum('0','1','2') DEFAULT NULL,
  `use_retained_scheduling_info` enum('0','1','2') DEFAULT NULL,
  `retained_contact_host_attribute_mask` bigint(20) DEFAULT NULL,
  `retained_contact_service_attribute_mask` bigint(20) DEFAULT NULL,
  `retained_process_host_attribute_mask` bigint(20) DEFAULT NULL,
  `retained_process_service_attribute_mask` bigint(20) DEFAULT NULL,
  `retained_host_attribute_mask` bigint(20) DEFAULT NULL,
  `retained_service_attribute_mask` bigint(20) DEFAULT NULL,
  `use_syslog` enum('0','1','2') DEFAULT NULL,
  `log_notifications` enum('0','1','2') DEFAULT NULL,
  `log_service_retries` enum('0','1','2') DEFAULT NULL,
  `log_host_retries` enum('0','1','2') DEFAULT NULL,
  `log_event_handlers` enum('0','1','2') DEFAULT NULL,
  `log_initial_states` enum('0','1','2') DEFAULT NULL,
  `log_external_commands` enum('0','1','2') DEFAULT NULL,
  `log_passive_checks` enum('0','1','2') DEFAULT NULL,
  `global_host_event_handler` int(11) DEFAULT NULL,
  `global_service_event_handler` int(11) DEFAULT NULL,
  `sleep_time` varchar(10) DEFAULT NULL,
  `service_inter_check_delay_method` varchar(255) DEFAULT NULL,
  `host_inter_check_delay_method` varchar(255) DEFAULT NULL,
  `service_interleave_factor` varchar(255) DEFAULT NULL,
  `max_concurrent_checks` int(11) DEFAULT NULL,
  `max_service_check_spread` int(11) DEFAULT NULL,
  `max_host_check_spread` int(11) DEFAULT NULL,
  `check_result_reaper_frequency` int(11) DEFAULT NULL,
  `max_check_result_reaper_time` int(11) DEFAULT NULL,
  `interval_length` int(11) DEFAULT NULL,
  `auto_reschedule_checks` enum('0','1','2') DEFAULT NULL,
  `auto_rescheduling_interval` int(11) DEFAULT NULL,
  `auto_rescheduling_window` int(11) DEFAULT NULL,
  `use_aggressive_host_checking` enum('0','1','2') DEFAULT NULL,
  `enable_flap_detection` enum('0','1','2') DEFAULT NULL,
  `low_service_flap_threshold` varchar(255) DEFAULT NULL,
  `high_service_flap_threshold` varchar(255) DEFAULT NULL,
  `low_host_flap_threshold` varchar(255) DEFAULT NULL,
  `high_host_flap_threshold` varchar(255) DEFAULT NULL,
  `soft_state_dependencies` enum('0','1','2') DEFAULT NULL,
  `service_check_timeout` int(11) DEFAULT NULL,
  `host_check_timeout` int(11) DEFAULT NULL,
  `event_handler_timeout` int(11) DEFAULT NULL,
  `notification_timeout` int(11) DEFAULT NULL,
  `ocsp_timeout` int(11) DEFAULT NULL,
  `ochp_timeout` int(11) DEFAULT NULL,
  `perfdata_timeout` int(11) DEFAULT NULL,
  `obsess_over_services` enum('0','1','2') DEFAULT NULL,
  `ocsp_command` int(11) DEFAULT NULL,
  `obsess_over_hosts` enum('0','1','2') DEFAULT NULL,
  `ochp_command` int(11) DEFAULT NULL,
  `process_performance_data` enum('0','1','2') DEFAULT NULL,
  `host_perfdata_command` int(11) DEFAULT NULL,
  `service_perfdata_command` int(11) DEFAULT NULL,
  `host_perfdata_file` varchar(255) DEFAULT NULL,
  `service_perfdata_file` varchar(255) DEFAULT NULL,
  `host_perfdata_file_template` text,
  `service_perfdata_file_template` text,
  `host_perfdata_file_mode` enum('a','w','2') DEFAULT NULL,
  `service_perfdata_file_mode` enum('a','w','2') DEFAULT NULL,
  `host_perfdata_file_processing_interval` int(11) DEFAULT NULL,
  `service_perfdata_file_processing_interval` int(11) DEFAULT NULL,
  `host_perfdata_file_processing_command` int(11) DEFAULT NULL,
  `service_perfdata_file_processing_command` int(11) DEFAULT NULL,
  `check_for_orphaned_services` enum('0','1','2') DEFAULT NULL,
  `check_for_orphaned_hosts` enum('0','1','2') DEFAULT NULL,
  `check_service_freshness` enum('0','1','2') DEFAULT NULL,
  `service_freshness_check_interval` int(11) DEFAULT NULL,
  `freshness_check_interval` int(11) DEFAULT NULL,
  `check_host_freshness` enum('0','1','2') DEFAULT NULL,
  `host_freshness_check_interval` int(11) DEFAULT NULL,
  `date_format` varchar(255) DEFAULT NULL,
  `illegal_object_name_chars` varchar(255) DEFAULT NULL,
  `illegal_macro_output_chars` varchar(255) DEFAULT NULL,
  `use_regexp_matching` enum('0','1','2') DEFAULT NULL,
  `use_true_regexp_matching` enum('0','1','2') DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_pager` varchar(255) DEFAULT NULL,
  `nagios_comment` text,
  `nagios_activate` enum('0','1') DEFAULT NULL,
  `event_broker_options` varchar(255) DEFAULT NULL,
  `translate_passive_host_checks` int(11) DEFAULT NULL,
  `nagios_server_id` int(11) DEFAULT NULL,
  `enable_predictive_host_dependency_checks` enum('0','1','2') DEFAULT NULL,
  `enable_predictive_service_dependency_checks` enum('0','1','2') DEFAULT NULL,
  `cached_host_check_horizon` int(11) DEFAULT NULL,
  `cached_service_check_horizon` int(11) DEFAULT NULL,
  `passive_host_checks_are_soft` int(11) DEFAULT NULL,
  `use_large_installation_tweaks` enum('0','1','2') DEFAULT NULL,
  `free_child_process_memory` enum('0','1','2') DEFAULT NULL,
  `child_processes_fork_twice` enum('0','1','2') DEFAULT NULL,
  `enable_environment_macros` enum('0','1','2') DEFAULT NULL,
  `use_setpgid` enum('0','1','2') DEFAULT NULL,
  `additional_freshness_latency` int(11) DEFAULT NULL,
  `enable_embedded_perl` enum('0','1','2') DEFAULT NULL,
  `use_embedded_perl_implicitly` enum('0','1','2') DEFAULT NULL,
  `debug_file` varchar(255) DEFAULT NULL,
  `debug_level` int(11) DEFAULT NULL,
  `debug_level_opt` varchar(200) DEFAULT '0',
  `debug_verbosity` enum('0','1','2') DEFAULT NULL,
  `max_debug_file_size` int(11) DEFAULT NULL,
  `daemon_dumps_core` enum('0','1') DEFAULT NULL,
  `cfg_file` varchar(255) NOT NULL DEFAULT 'centengine.cfg',
  `log_pid` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`nagios_id`),
  KEY `cmd1_index` (`global_host_event_handler`),
  KEY `cmd2_index` (`global_service_event_handler`),
  KEY `cmd3_index` (`ocsp_command`),
  KEY `cmd4_index` (`ochp_command`),
  KEY `cmd5_index` (`host_perfdata_command`),
  KEY `cmd6_index` (`service_perfdata_command`),
  KEY `cmd7_index` (`host_perfdata_file_processing_command`),
  KEY `cmd8_index` (`service_perfdata_file_processing_command`),
  KEY `nagios_server_id` (`nagios_server_id`),
  CONSTRAINT `cfg_nagios_ibfk_15` FOREIGN KEY (`service_perfdata_command`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `cfg_nagios_ibfk_18` FOREIGN KEY (`global_host_event_handler`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `cfg_nagios_ibfk_19` FOREIGN KEY (`global_service_event_handler`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `cfg_nagios_ibfk_20` FOREIGN KEY (`ocsp_command`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `cfg_nagios_ibfk_21` FOREIGN KEY (`ochp_command`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `cfg_nagios_ibfk_22` FOREIGN KEY (`host_perfdata_command`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `cfg_nagios_ibfk_23` FOREIGN KEY (`service_perfdata_command`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `cfg_nagios_ibfk_24` FOREIGN KEY (`host_perfdata_file_processing_command`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `cfg_nagios_ibfk_25` FOREIGN KEY (`service_perfdata_file_processing_command`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `cfg_nagios_ibfk_26` FOREIGN KEY (`nagios_server_id`) REFERENCES `nagios_server` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfg_nagios`
--

LOCK TABLES `cfg_nagios` WRITE;
/*!40000 ALTER TABLE `cfg_nagios` DISABLE KEYS */;
INSERT INTO `cfg_nagios` VALUES (1,'Centreon Engine CFG 1','/var/log/centreon-engine/centengine.log','/etc/centreon-engine',NULL,NULL,'/var/log/centreon-engine/centengine.tmp',NULL,'/var/log/centreon-engine/status.dat',NULL,'0',NULL,'@EMBEDDED_PERL@',NULL,'centreon-engine','centreon-engine','1','1','1','2','2','1','d','/var/log/centreon-engine/archives/','1',NULL,'1s','/var/lib/centreon-engine/rw/centengine.cmd',NULL,NULL,'/var/lock/subsys/centengine.lock','1','/var/log/centreon-engine/retention.dat',60,'1','1',NULL,NULL,NULL,NULL,NULL,NULL,'0','1','1','1','1','1','1','2',NULL,NULL,'0.2','s',NULL,'s',400,5,NULL,5,NULL,60,'2',NULL,NULL,'1','0','25.0','50.0','25.0','50.0','0',60,12,30,30,5,5,5,'0',NULL,'2',NULL,'0',NULL,41,NULL,NULL,NULL,NULL,'2','2',NULL,NULL,NULL,NULL,'0','0','1',NULL,NULL,'2',NULL,'euro','~!$%^&amp;*&quot;|&#039;&lt;&gt;?,()=','`~$^&amp;&quot;|&#039;&lt;&gt;','2','2','admin@localhost','admin','Centreon Engine','1','-1',NULL,1,'2','2',60,NULL,NULL,'2','2','2','2',NULL,NULL,'2','2','/var/log/centreon-engine/centengine.debug',0,'0','2',NULL,NULL,'centengine.cfg','1');
/*!40000 ALTER TABLE `cfg_nagios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfg_nagios_broker_module`
--

DROP TABLE IF EXISTS `cfg_nagios_broker_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_nagios_broker_module` (
  `bk_mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `cfg_nagios_id` int(11) DEFAULT NULL,
  `broker_module` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bk_mod_id`),
  KEY `fk_nagios_cfg` (`cfg_nagios_id`),
  CONSTRAINT `fk_nagios_cfg` FOREIGN KEY (`cfg_nagios_id`) REFERENCES `cfg_nagios` (`nagios_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfg_nagios_broker_module`
--

LOCK TABLES `cfg_nagios_broker_module` WRITE;
/*!40000 ALTER TABLE `cfg_nagios_broker_module` DISABLE KEYS */;
INSERT INTO `cfg_nagios_broker_module` VALUES (1,1,'/usr/lib64/centreon-engine/externalcmd.so'),(2,1,'/usr/lib64/nagios/cbmod.so /etc/centreon-broker/central-module.xml');
/*!40000 ALTER TABLE `cfg_nagios_broker_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfg_ndo2db`
--

DROP TABLE IF EXISTS `cfg_ndo2db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_ndo2db` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `ndo2db_user` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `ndo2db_group` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `local` enum('0','1') CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '0',
  `ns_nagios_server` int(11) DEFAULT NULL,
  `socket_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `socket_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tcp_port` int(11) DEFAULT NULL,
  `db_servertype` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `db_host` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `db_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `db_port` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `db_prefix` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `db_user` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `db_pass` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `max_timedevents_age` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `max_systemcommands_age` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `max_servicechecks_age` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `max_hostchecks_age` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `max_eventhandlers_age` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `activate` enum('0','1') CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ns_nagios_server` (`ns_nagios_server`),
  CONSTRAINT `cfg_ndo2db_ibfk_1` FOREIGN KEY (`ns_nagios_server`) REFERENCES `nagios_server` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='configuration base for ndo daemon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfg_ndo2db`
--

LOCK TABLES `cfg_ndo2db` WRITE;
/*!40000 ALTER TABLE `cfg_ndo2db` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfg_ndo2db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfg_ndomod`
--

DROP TABLE IF EXISTS `cfg_ndomod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_ndomod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `local` enum('0','1') CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `ns_nagios_server` int(11) DEFAULT NULL,
  `instance_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `output_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `output` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tcp_port` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `output_buffer_items` int(11) DEFAULT NULL,
  `buffer_file` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `file_rotation_interval` int(11) DEFAULT NULL,
  `file_rotation_command` int(11) DEFAULT NULL,
  `file_rotation_timeout` int(11) DEFAULT NULL,
  `reconnect_interval` int(11) DEFAULT NULL,
  `reconnect_warning_interval` int(11) DEFAULT NULL,
  `data_processing_options` int(11) DEFAULT NULL,
  `config_output_options` int(11) DEFAULT NULL,
  `activate` enum('0','1') CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ns_nagios_server` (`ns_nagios_server`),
  CONSTRAINT `cfg_ndomod_ibfk_1` FOREIGN KEY (`ns_nagios_server`) REFERENCES `nagios_server` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ndomog table config';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfg_ndomod`
--

LOCK TABLES `cfg_ndomod` WRITE;
/*!40000 ALTER TABLE `cfg_ndomod` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfg_ndomod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfg_resource`
--

DROP TABLE IF EXISTS `cfg_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_resource` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) DEFAULT NULL,
  `resource_line` varchar(255) DEFAULT NULL,
  `resource_comment` varchar(255) DEFAULT NULL,
  `resource_activate` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfg_resource`
--

LOCK TABLES `cfg_resource` WRITE;
/*!40000 ALTER TABLE `cfg_resource` DISABLE KEYS */;
INSERT INTO `cfg_resource` VALUES (1,'$USER1$','/usr/lib/nagios/plugins','path to the plugins','1');
/*!40000 ALTER TABLE `cfg_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfg_resource_instance_relations`
--

DROP TABLE IF EXISTS `cfg_resource_instance_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_resource_instance_relations` (
  `resource_id` int(11) NOT NULL,
  `instance_id` int(11) NOT NULL,
  KEY `fk_crir_res_id` (`resource_id`),
  KEY `fk_crir_ins_id` (`instance_id`),
  CONSTRAINT `fk_crir_ins_id` FOREIGN KEY (`instance_id`) REFERENCES `nagios_server` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_crir_res_id` FOREIGN KEY (`resource_id`) REFERENCES `cfg_resource` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfg_resource_instance_relations`
--

LOCK TABLES `cfg_resource_instance_relations` WRITE;
/*!40000 ALTER TABLE `cfg_resource_instance_relations` DISABLE KEYS */;
INSERT INTO `cfg_resource_instance_relations` VALUES (1,1);
/*!40000 ALTER TABLE `cfg_resource_instance_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `command` (
  `command_id` int(11) NOT NULL AUTO_INCREMENT,
  `connector_id` int(10) unsigned DEFAULT NULL,
  `command_name` varchar(200) DEFAULT NULL,
  `command_line` text,
  `command_example` varchar(254) DEFAULT NULL,
  `command_type` tinyint(4) DEFAULT NULL,
  `enable_shell` int(1) unsigned NOT NULL DEFAULT '0',
  `command_comment` text,
  `graph_id` int(11) DEFAULT NULL,
  `cmd_cat_id` int(11) DEFAULT NULL,
  `command_locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`command_id`),
  KEY `connector_id` (`connector_id`),
  CONSTRAINT `command_ibfk_1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command`
--

LOCK TABLES `command` WRITE;
/*!40000 ALTER TABLE `command` DISABLE KEYS */;
INSERT INTO `command` VALUES (1,NULL,'check_host_alive','$USER1$/check_icmp -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -p 1','',2,0,NULL,NULL,NULL,0),(2,NULL,'check_disk_smb','$USER1$/check_disk_smb -H $HOSTADDRESS$ -s $ARG1$ -u $ARG2$ -p $ARG3$ -w $ARG4$ -c $ARG5$','!share!user!passwd!80!90',2,0,NULL,NULL,NULL,0),(3,NULL,'check_distant_disk_space','$USER1$/check_distant_disk_space -H $HOSTADDRESS$ -C $ARG1$ -p $ARG2$ -w $ARG3$ -c $ARG4$','',2,0,NULL,NULL,NULL,0),(4,NULL,'check_centreon_dummy','$USER1$/check_centreon_dummy -s $ARG1$ -o $ARG2$','!0!OK',2,0,NULL,0,NULL,0),(5,NULL,'check_centreon_load_average','$USER1$/check_centreon_snmp_loadaverage -H $HOSTADDRESS$ -v $_HOSTSNMPVERSION$ -C $_HOSTSNMPCOMMUNITY$ -w $ARG1$ -c $ARG2$','!4,3,2!6,5,4',2,0,NULL,8,NULL,0),(6,NULL,'check_centreon_ping','$USER1$/check_icmp -H $HOSTADDRESS$ -n $ARG1$ -w $ARG2$ -c $ARG3$','!3!200,20%!400,50%',2,0,NULL,2,NULL,0),(7,NULL,'check_centreon_process','$USER1$/check_centreon_snmp_process -H $HOSTADDRESS$ -v $_HOSTSNMPVERSION$ -C $_HOSTSNMPCOMMUNITY$ -n -p $ARG1$ -w $ARG2$ -c $ARG3$ ','!httpd!warning!critical',2,0,NULL,0,NULL,0),(8,NULL,'check_centreon_remote_storage','$USER1$/check_centreon_snmp_remote_storage -H $HOSTADDRESS$ -n -d $ARG1$ -w $ARG2$ -c $ARG3$ -v $_HOSTSNMPVERSION$ -C $_HOSTSNMPCOMMUNITY$','!/!80!90',2,0,NULL,3,NULL,0),(10,NULL,'check_centreon_traffic_limited','$USER1$/check_centreon_snmp_traffic -H $HOSTADDRESS$ -n -i $ARG1$ -w $ARG2$ -c $ARG3$ -T $ARG4$ -v $_HOSTSNMPVERSION$ -C $_HOSTSNMPCOMMUNITY$','!eth0!80!90!2',2,0,NULL,7,NULL,0),(11,NULL,'check_hpjd','$USER1$/check_hpjd -H $HOSTADDRESS$ -C public','',2,0,NULL,NULL,NULL,0),(12,NULL,'check_http','$USER1$/check_http -H $HOSTADDRESS$','',2,0,NULL,NULL,NULL,0),(13,NULL,'check_https','$USER1$/check_http -S $HOSTADDRESS$','',2,0,NULL,NULL,NULL,0),(14,NULL,'check_local_swap','$USER1$/check_swap -w $ARG1$ -c $ARG2$ -v','!80!90',2,0,NULL,NULL,NULL,0),(15,NULL,'check_local_disk','$USER1$/check_disk -w $ARG2$ -c $ARG3$ -p $ARG1$','',2,0,NULL,NULL,NULL,0),(16,NULL,'check_local_load','$USER1$/check_load -w $ARG1$ -c $ARG2$','',2,0,NULL,NULL,NULL,0),(17,NULL,'check_local_procs','$USER1$/check_procs -w $ARG1$ -c $ARG2$ -u $ARG3$','',2,0,NULL,NULL,NULL,0),(18,NULL,'check_local_users','$USER1$/check_users -w $ARG1$ -c $ARG2$','',2,0,NULL,NULL,NULL,0),(19,NULL,'check_nt_memuse','$USER1$/check_nt -H $HOSTADDRESS$ -v MEMUSE -p $ARG1$ -w $ARG2$ -c $ARG3$ -s $ARG4$','!12489!80!90!public',2,0,NULL,NULL,NULL,0),(20,NULL,'check_nt_cpu','$USER1$/check_nt -H $HOSTADDRESS$ -v CPULOAD -p $ARG1$ -l 2,90,95 -s $ARG2$','!12489!public',2,0,NULL,NULL,NULL,0),(21,NULL,'check_nt_disk','$USER1$/check_nt -H $HOSTADDRESS$ -v USEDDISKSPACE -p $ARG1$ -l $ARG2$ -w $ARG3$ -c $ARG4$ -s $ARG5$','!12489!C!80!90!public',2,0,NULL,NULL,NULL,0),(23,NULL,'check_tcp','$USER1$/check_tcp -H $HOSTADDRESS$ -p $ARG1$ -w $ARG2$ -c $ARG3$','',2,0,NULL,NULL,NULL,0),(24,NULL,'check_nntp','$USER1$/check_nntp -H $HOSTADDRESS$','',2,0,NULL,NULL,NULL,0),(25,NULL,'check_pop','$USER1$/check_pop -H $HOSTADDRESS$','',2,0,NULL,NULL,NULL,0),(26,NULL,'check_smtp','$USER1$/check_smtp -H $HOSTADDRESS$','',2,0,NULL,NULL,NULL,0),(27,NULL,'check_dns','$USER1$/check_dns -H $ARG1$ -s $HOSTADDRESS$','',2,0,NULL,NULL,NULL,0),(28,NULL,'check_ftp','$USER1$/check_ftp -H $HOSTADDRESS$','!127.0.0.1',2,0,NULL,NULL,NULL,0),(29,NULL,'check_dhcp','$USER1$/check_dhcp -s $HOSTADDRESS$ -i $ARG1$','!eth0',2,0,NULL,NULL,NULL,0),(30,NULL,'check_dig','$USER1$/check_dig -H $HOSTADDRESS$ -l $ARG1$','!www.centreon-nms.org',2,0,NULL,NULL,NULL,0),(31,NULL,'check_snmp','$USER1$/check_snmp -H $HOSTADDRESS$ -o $ARG1$ -w $ARG2$ -c $ARG3$','',2,0,NULL,NULL,NULL,0),(32,NULL,'check_telnet','$USER1$/check_tcp -H $HOSTADDRESS$ -p 23','',2,0,NULL,NULL,NULL,0),(33,NULL,'check_udp','$USER1$/check_udp -H $HOSTADDRESS$ -p $ARG1$','',2,0,NULL,NULL,NULL,0),(34,NULL,'check_centreon_nt','$USER1$/check_nt -H $HOSTADDRESS$ -p 12489 -v $ARG1$ -l $ARG2$ -s $ARG3$ -w $ARG4$ -c $ARG5$','',2,0,NULL,0,NULL,0),(35,NULL,'host-notify-by-email','/usr/bin/printf &quot;%b&quot; &quot;***** centreon Notification *****#BR##BR#Type:$NOTIFICATIONTYPE$#BR#Host: $HOSTNAME$#BR#State: $HOSTSTATE$#BR#Address: $HOSTADDRESS$#BR#Info: $HOSTOUTPUT$#BR#Date/Time: $DATE$&quot; | /bin/mail -s &quot;Host $HOSTSTATE$ alert for $HOSTNAME$!&quot; $CONTACTEMAIL$','',1,1,NULL,NULL,NULL,0),(36,NULL,'service-notify-by-email','/usr/bin/printf &quot;%b&quot; &quot;***** centreon Notification *****#BR##BR#Notification Type: $NOTIFICATIONTYPE$#BR##BR#Service: $SERVICEDESC$#BR#Host: $HOSTALIAS$#BR#Address: $HOSTADDRESS$#BR#State: $SERVICESTATE$#BR##BR#Date/Time: $DATE$ Additional Info : $SERVICEOUTPUT$&quot; | /bin/mail -s &quot;** $NOTIFICATIONTYPE$ alert - $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **&quot; $CONTACTEMAIL$','',1,1,NULL,NULL,NULL,0),(37,NULL,'host-notify-by-epager','/usr/bin/printf &quot;%b&quot; &quot;Host $HOSTALIAS$ is $HOSTSTATE$#BR#Info: $OUTPUT$#BR#Time: $DATETIME$\\&quot; | /bin/mail -s \\&quot;$NOTIFICATIONTYPE$ alert - Host $HOSTNAME$ is $HOSTSTATE$\\&quot; $CONTACTPAGER$','',1,1,NULL,NULL,NULL,0),(38,NULL,'service-notify-by-epager','/usr/bin/printf &quot;%b&quot; &quot;Service: $SERVICEDESC$#BR#Host: $HOSTNAME$#BR#Address: $HOSTADDRESS$#BR#State: $SERVICESTATE$#BR#Info: $OUTPUT$#BR#Date: $DATETIME$&quot; | /bin/mail -s &quot;$NOTIFICATIONTYPE$: $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$&quot; $CONTACTPAGER$','',1,1,NULL,NULL,NULL,0),(39,NULL,'submit-host-check-result','$USER1$/submit_host_check_result $HOSTNAME$ $HOSTSTATE$ &#039;$HOSTOUTPUT$&#039;','',3,0,NULL,NULL,NULL,0),(40,NULL,'submit-service-check-result','$USER1$/submit_service_check_result $HOSTNAME$ $SERVICEDESC$ $SERVICESTATE$ &#039;$SERVICEOUTPUT$&#039;','',3,0,NULL,NULL,NULL,0),(41,NULL,'process-service-perfdata','$USER1$/process-service-perfdata  &quot;$LASTSERVICECHECK$&quot; &quot;$HOSTNAME$&quot; &quot;$SERVICEDESC$&quot; &quot;$LASTSERVICESTATE$&quot; &quot;$SERVICESTATE$&quot; &quot;$SERVICEPERFDATA$&quot;','',3,0,NULL,NULL,NULL,0),(44,NULL,'check_centreon_uptime','$USER1$/check_centreon_snmp_uptime -H $HOSTADDRESS$ -v $_HOSTSNMPVERSION$ -C $_HOSTSNMPCOMMUNITY$ -d','',2,0,NULL,0,NULL,0),(59,NULL,'check_centreon_nb_connections','$USER1$/check_centreon_snmp_TcpConn -H $HOSTADDRESS$ -v $_HOSTSNMPVERSION$ -C $_HOSTSNMPCOMMUNITY$ -p $ARG1$ -w $ARG2$ -c $ARG3$','!80!70!100',2,0,NULL,0,NULL,0),(62,NULL,'check_centreon_traffic','$USER1$/check_centreon_snmp_traffic -H $HOSTADDRESS$ -n -i $ARG1$ -w $ARG2$ -c $ARG3$ -v $_HOSTSNMPVERSION$ -C $_HOSTSNMPCOMMUNITY$','!eth0!80!90',2,0,NULL,7,NULL,0),(76,NULL,'check_load_average','$USER1$/check_load $HOSTADDRESS$ -w $ARG1$ -c $ARG2$','',2,0,NULL,0,NULL,0),(77,NULL,'check_local_cpu_load','$USER1$/check_nt -H $HOSTADDRESS$ -v CPULOAD -l $ARG1$ -s $ARG2$','',2,0,NULL,0,NULL,0),(78,NULL,'check_local_disk_space','$USER1$/check_nt -H $HOSTADDRESS$ -v USEDDISKSPACE -l $ARG1$ -w $ARG2$ -c $ARG3$ -s $ARG2$','',2,0,NULL,0,NULL,0),(79,NULL,'check_maxq','$USER1$/check_maxq_script_return -r $ARG1$ -P $ARG2$','',2,0,NULL,0,NULL,0),(89,NULL,'host-notify-by-jabber','$USER1$/notify_via_jabber  $CONTACTPAGER$ &quot;Host &#039;$HOSTALIAS$&#039; is $HOSTSTATE$ - Info: $HOSTOUTPUT$&quot;','',1,0,NULL,0,NULL,0),(90,NULL,'service-notify-by-jabber','$USER1$/notify_via_jabber $CONTACTPAGER$ &quot;$NOTIFICATIONTYPE$ $HOSTNAME$ $SERVICEDESC$ $SERVICESTATE$ $SERVICEOUTPUT$ $LONGDATETIME$&quot;','',1,0,NULL,0,NULL,0),(94,NULL,'check_centreon_snmp_value','$USER1$/check_centreon_snmp_value -H $HOSTADDRESS$ -v $_HOSTSNMPVERSION$ -C $_HOSTSNMPCOMMUNITY$ -o $ARG1$ -w $ARG2$ -c $ARG3','!1.3.6.1.4.1.705.1.8.1.0!190!210',2,0,NULL,0,NULL,0),(95,NULL,'check_centreon_snmp_proc_detailed','$USER1$/check_centreon_snmp_process_detailed -H $HOSTADDRESS$ -v $_HOSTSNMPVERSION$ -C $_HOSTSNMPCOMMUNITY$ -n $ARG1$ -m $ARG2$','!apache!20,50',2,0,NULL,0,NULL,0),(96,NULL,'check_centreon_cpu','$USER1$/check_centreon_snmp_cpu -H $HOSTADDRESS$ -v $_HOSTSNMPVERSION$ -C $_HOSTSNMPCOMMUNITY$ -c $ARG1$ -w $ARG2$','!80!90',2,0,NULL,5,NULL,0),(97,NULL,'check_centreon_memory','$USER1$/check_centreon_snmp_memory -H $HOSTADDRESS$ -v $_HOSTSNMPVERSION$ -C $_HOSTSNMPCOMMUNITY$ -w 80 -c 90','',2,0,NULL,4,NULL,0),(98,NULL,'check_nrpe_cpu','$USER1$/check_nrpe -H $HOSTADDRESS$ -p 5666 -c checkcpu','!80!90',2,0,'',0,NULL,0),(99,NULL,'check_nrpe_memory','$USER1$/check_nrpe -H $HOSTADDRESS$ -p 5666 -c checkmem','!80!90',2,0,'',0,NULL,0),(100,NULL,'check_nrpe_disk','$USER1$/check_nrpe -H $HOSTADDRESS$ -p 5666 -c check_drivesize','!80!90',2,0,'',0,NULL,0);
/*!40000 ALTER TABLE `command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `command_arg_description`
--

DROP TABLE IF EXISTS `command_arg_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `command_arg_description` (
  `cmd_id` int(11) NOT NULL,
  `macro_name` varchar(255) NOT NULL,
  `macro_description` varchar(255) NOT NULL,
  KEY `command_arg_description_ibfk_1` (`cmd_id`),
  CONSTRAINT `command_arg_description_ibfk_1` FOREIGN KEY (`cmd_id`) REFERENCES `command` (`command_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command_arg_description`
--

LOCK TABLES `command_arg_description` WRITE;
/*!40000 ALTER TABLE `command_arg_description` DISABLE KEYS */;
INSERT INTO `command_arg_description` VALUES (2,'ARG1','share'),(2,'ARG2','user'),(2,'ARG3','password'),(2,'ARG4','warning'),(2,'ARG5','critical'),(4,'ARG1','status'),(4,'ARG2','output'),(5,'ARG1','warning'),(5,'ARG2','critical'),(6,'ARG1','count'),(6,'ARG2','warning'),(6,'ARG3','critical'),(7,'ARG1','process name'),(8,'ARG1','disk number'),(8,'ARG2','warning'),(8,'ARG3','critical'),(10,'ARG1','interface'),(10,'ARG2','warning'),(10,'ARG3','critical'),(10,'ARG6','Max bandwidth'),(14,'ARG1','warning'),(14,'ARG2','critical'),(15,'ARG1','path'),(15,'ARG2','warning'),(15,'ARG3','critical'),(16,'ARG1','warning'),(16,'ARG2','critical'),(17,'ARG1','warning'),(17,'ARG2','critical'),(17,'ARG3','process owner'),(18,'ARG1','warning'),(18,'ARG2','critical'),(21,'ARG1','drive letter'),(21,'ARG2','warning'),(21,'ARG3','critical'),(23,'ARG1','port'),(23,'ARG2','warning'),(23,'ARG3','critical'),(27,'ARG1','hostname'),(29,'ARG1','interface'),(30,'ARG1','query address'),(31,'ARG1','OID'),(31,'ARG2','warning'),(31,'ARG3','critical'),(33,'ARG1','port'),(34,'ARG1','variable'),(34,'ARG2','params'),(34,'ARG3','password'),(34,'ARG4','warning'),(34,'ARG5','critical'),(59,'ARG1','port'),(59,'ARG2','warning'),(59,'ARG3','critical'),(62,'ARG1','interface'),(62,'ARG2','warning'),(62,'ARG3','critical'),(76,'ARG1','warning'),(76,'ARG2','critical'),(78,'ARG1','drive letter'),(78,'ARG2','warning'),(78,'ARG1','critical'),(94,'ARG2','OID'),(94,'ARG3','warning'),(94,'ARG4','critical'),(95,'ARG1','process name'),(95,'ARG2','memory thresholds'),(96,'ARG1','critical'),(96,'ARG2','warning'),(98,'ARG1','warning\r'),(98,'ARG2','critical'),(100,'ARG1','warning\r'),(100,'ARG2','critical'),(99,'ARG1','warning\r'),(99,'ARG2','critical');
/*!40000 ALTER TABLE `command_arg_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `command_categories`
--

DROP TABLE IF EXISTS `command_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `command_categories` (
  `cmd_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_alias` varchar(255) NOT NULL,
  `category_order` int(11) NOT NULL,
  PRIMARY KEY (`cmd_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command_categories`
--

LOCK TABLES `command_categories` WRITE;
/*!40000 ALTER TABLE `command_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `command_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `command_categories_relation`
--

DROP TABLE IF EXISTS `command_categories_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `command_categories_relation` (
  `cmd_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `command_command_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmd_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command_categories_relation`
--

LOCK TABLES `command_categories_relation` WRITE;
/*!40000 ALTER TABLE `command_categories_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `command_categories_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connector`
--

DROP TABLE IF EXISTS `connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connector` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `command_line` varchar(512) NOT NULL,
  `enabled` int(1) unsigned NOT NULL DEFAULT '1',
  `created` int(10) unsigned NOT NULL,
  `modified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector`
--

LOCK TABLES `connector` WRITE;
/*!40000 ALTER TABLE `connector` DISABLE KEYS */;
INSERT INTO `connector` VALUES (1,'Perl Connector','','centreon_connector_perl',1,1472169434,1472169434),(2,'SSH Connector','','centreon_connector_ssh',1,1472169434,1472169434);
/*!40000 ALTER TABLE `connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `timeperiod_tp_id` int(11) DEFAULT NULL,
  `timeperiod_tp_id2` int(11) DEFAULT NULL,
  `contact_name` varchar(200) DEFAULT NULL,
  `contact_alias` varchar(200) DEFAULT NULL,
  `contact_passwd` varchar(255) DEFAULT NULL,
  `contact_lang` varchar(255) DEFAULT NULL,
  `contact_host_notification_options` varchar(200) DEFAULT NULL,
  `contact_service_notification_options` varchar(200) DEFAULT NULL,
  `contact_email` varchar(200) DEFAULT NULL,
  `contact_pager` varchar(200) DEFAULT NULL,
  `contact_address1` varchar(200) DEFAULT NULL,
  `contact_address2` varchar(200) DEFAULT NULL,
  `contact_address3` varchar(200) DEFAULT NULL,
  `contact_address4` varchar(200) DEFAULT NULL,
  `contact_address5` varchar(200) DEFAULT NULL,
  `contact_address6` varchar(200) DEFAULT NULL,
  `contact_comment` text,
  `contact_js_effects` enum('0','1') DEFAULT '0',
  `contact_location` int(11) DEFAULT NULL,
  `contact_oreon` enum('0','1') DEFAULT NULL,
  `contact_enable_notifications` enum('0','1','2') DEFAULT '2',
  `contact_template_id` int(11) DEFAULT NULL,
  `contact_admin` enum('0','1') DEFAULT '0',
  `contact_type_msg` enum('txt','html','pdf') DEFAULT 'txt',
  `contact_activate` enum('0','1') DEFAULT NULL,
  `contact_auth_type` varchar(255) DEFAULT '',
  `contact_ldap_dn` text,
  `ar_id` int(11) DEFAULT NULL,
  `contact_acl_group_list` varchar(255) DEFAULT NULL,
  `contact_autologin_key` varchar(255) DEFAULT NULL,
  `contact_charset` varchar(255) DEFAULT NULL,
  `contact_register` tinyint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`contact_id`),
  KEY `name_index` (`contact_name`),
  KEY `alias_index` (`contact_alias`),
  KEY `tp1_index` (`timeperiod_tp_id`),
  KEY `tp2_index` (`timeperiod_tp_id2`),
  KEY `tmpl_index` (`contact_template_id`),
  KEY `fk_ar_id` (`ar_id`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`timeperiod_tp_id`) REFERENCES `timeperiod` (`tp_id`) ON DELETE SET NULL,
  CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`timeperiod_tp_id2`) REFERENCES `timeperiod` (`tp_id`) ON DELETE SET NULL,
  CONSTRAINT `contact_ibfk_3` FOREIGN KEY (`contact_template_id`) REFERENCES `contact` (`contact_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ar_id` FOREIGN KEY (`ar_id`) REFERENCES `auth_ressource` (`ar_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,1,1,'@firstname@ @lastname@','admin','2995cb0650c5f107230ed569a8c4d6e5','en_US','n','n','@email@',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,'1','1',NULL,'1','txt','1','local',NULL,NULL,NULL,NULL,NULL,1),(17,1,1,'Guest','guest',NULL,'en_US','n','n','guest@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,'0','2',NULL,'0','txt','0','local',NULL,NULL,NULL,NULL,NULL,1),(18,1,1,'User','user',NULL,'en_US','n','n','user@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,'0','2',NULL,'0','txt','0','local',NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_host_relation`
--

DROP TABLE IF EXISTS `contact_host_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_host_relation` (
  `chr_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_host_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`chr_id`),
  KEY `host_index` (`host_host_id`),
  KEY `contact_id` (`contact_id`),
  CONSTRAINT `contact_host_relation_ibfk_1` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `contact_host_relation_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_host_relation`
--

LOCK TABLES `contact_host_relation` WRITE;
/*!40000 ALTER TABLE `contact_host_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_host_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_hostcommands_relation`
--

DROP TABLE IF EXISTS `contact_hostcommands_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_hostcommands_relation` (
  `chr_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_contact_id` int(11) DEFAULT NULL,
  `command_command_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`chr_id`),
  KEY `contact_index` (`contact_contact_id`),
  KEY `command_index` (`command_command_id`),
  CONSTRAINT `contact_hostcommands_relation_ibfk_1` FOREIGN KEY (`contact_contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE,
  CONSTRAINT `contact_hostcommands_relation_ibfk_2` FOREIGN KEY (`command_command_id`) REFERENCES `command` (`command_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_hostcommands_relation`
--

LOCK TABLES `contact_hostcommands_relation` WRITE;
/*!40000 ALTER TABLE `contact_hostcommands_relation` DISABLE KEYS */;
INSERT INTO `contact_hostcommands_relation` VALUES (1,1,35),(2,17,35),(3,18,35);
/*!40000 ALTER TABLE `contact_hostcommands_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_param`
--

DROP TABLE IF EXISTS `contact_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_param` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `cp_key` varchar(255) NOT NULL,
  `cp_value` varchar(255) NOT NULL,
  `cp_contact_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`cp_contact_id`),
  CONSTRAINT `contact_param_ibfk_1` FOREIGN KEY (`cp_contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_param`
--

LOCK TABLES `contact_param` WRITE;
/*!40000 ALTER TABLE `contact_param` DISABLE KEYS */;
INSERT INTO `contact_param` VALUES (1,'report_hour_start','0',NULL),(2,'report_minute_start','0',NULL),(3,'report_hour_end','24',NULL),(4,'report_minute_end','0',NULL),(5,'report_Monday','1',NULL),(6,'report_Tuesday','1',NULL),(7,'report_Wednesday','1',NULL),(8,'report_Thursday','1',NULL),(9,'report_Friday','1',NULL),(10,'report_Saturday','1',NULL),(11,'report_Sunday','1',NULL);
/*!40000 ALTER TABLE `contact_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_service_relation`
--

DROP TABLE IF EXISTS `contact_service_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_service_relation` (
  `csr_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_service_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`csr_id`),
  KEY `service_index` (`service_service_id`),
  KEY `contact_id` (`contact_id`),
  CONSTRAINT `contact_service_relation_ibfk_1` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `contact_service_relation_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_service_relation`
--

LOCK TABLES `contact_service_relation` WRITE;
/*!40000 ALTER TABLE `contact_service_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_service_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_servicecommands_relation`
--

DROP TABLE IF EXISTS `contact_servicecommands_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_servicecommands_relation` (
  `csc_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_contact_id` int(11) DEFAULT NULL,
  `command_command_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`csc_id`),
  KEY `contact_index` (`contact_contact_id`),
  KEY `command_index` (`command_command_id`),
  CONSTRAINT `contact_servicecommands_relation_ibfk_1` FOREIGN KEY (`contact_contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE,
  CONSTRAINT `contact_servicecommands_relation_ibfk_2` FOREIGN KEY (`command_command_id`) REFERENCES `command` (`command_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_servicecommands_relation`
--

LOCK TABLES `contact_servicecommands_relation` WRITE;
/*!40000 ALTER TABLE `contact_servicecommands_relation` DISABLE KEYS */;
INSERT INTO `contact_servicecommands_relation` VALUES (1,1,36),(2,17,36),(3,18,36);
/*!40000 ALTER TABLE `contact_servicecommands_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactgroup`
--

DROP TABLE IF EXISTS `contactgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactgroup` (
  `cg_id` int(11) NOT NULL AUTO_INCREMENT,
  `cg_name` varchar(200) DEFAULT NULL,
  `cg_alias` varchar(200) DEFAULT NULL,
  `cg_comment` text,
  `cg_activate` enum('0','1') DEFAULT NULL,
  `cg_type` varchar(10) DEFAULT 'local',
  `cg_ldap_dn` varchar(255) DEFAULT NULL,
  `ar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cg_id`),
  KEY `name_index` (`cg_name`),
  KEY `alias_index` (`cg_alias`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactgroup`
--

LOCK TABLES `contactgroup` WRITE;
/*!40000 ALTER TABLE `contactgroup` DISABLE KEYS */;
INSERT INTO `contactgroup` VALUES (3,'Guest','Guests Group','','1','local',NULL,NULL),(5,'Supervisors','Centreon supervisors','','1','local',NULL,NULL);
/*!40000 ALTER TABLE `contactgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactgroup_contact_relation`
--

DROP TABLE IF EXISTS `contactgroup_contact_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactgroup_contact_relation` (
  `cgr_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_contact_id` int(11) DEFAULT NULL,
  `contactgroup_cg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cgr_id`),
  KEY `contact_index` (`contact_contact_id`),
  KEY `contactgroup_index` (`contactgroup_cg_id`),
  CONSTRAINT `contactgroup_contact_relation_ibfk_1` FOREIGN KEY (`contact_contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE,
  CONSTRAINT `contactgroup_contact_relation_ibfk_2` FOREIGN KEY (`contactgroup_cg_id`) REFERENCES `contactgroup` (`cg_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactgroup_contact_relation`
--

LOCK TABLES `contactgroup_contact_relation` WRITE;
/*!40000 ALTER TABLE `contactgroup_contact_relation` DISABLE KEYS */;
INSERT INTO `contactgroup_contact_relation` VALUES (76,17,3),(77,1,5),(78,18,3);
/*!40000 ALTER TABLE `contactgroup_contact_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactgroup_host_relation`
--

DROP TABLE IF EXISTS `contactgroup_host_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactgroup_host_relation` (
  `cghr_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_host_id` int(11) DEFAULT NULL,
  `contactgroup_cg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cghr_id`),
  KEY `host_index` (`host_host_id`),
  KEY `contactgroup_index` (`contactgroup_cg_id`),
  CONSTRAINT `contactgroup_host_relation_ibfk_1` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `contactgroup_host_relation_ibfk_2` FOREIGN KEY (`contactgroup_cg_id`) REFERENCES `contactgroup` (`cg_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4426 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactgroup_host_relation`
--

LOCK TABLES `contactgroup_host_relation` WRITE;
/*!40000 ALTER TABLE `contactgroup_host_relation` DISABLE KEYS */;
INSERT INTO `contactgroup_host_relation` VALUES (4425,2,5);
/*!40000 ALTER TABLE `contactgroup_host_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactgroup_hostgroup_relation`
--

DROP TABLE IF EXISTS `contactgroup_hostgroup_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactgroup_hostgroup_relation` (
  `cghgr_id` int(11) NOT NULL AUTO_INCREMENT,
  `contactgroup_cg_id` int(11) DEFAULT NULL,
  `hostgroup_hg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cghgr_id`),
  KEY `contactgroup_index` (`contactgroup_cg_id`),
  KEY `hostgroup_index` (`hostgroup_hg_id`),
  CONSTRAINT `contactgroup_hostgroup_relation_ibfk_1` FOREIGN KEY (`contactgroup_cg_id`) REFERENCES `contactgroup` (`cg_id`) ON DELETE CASCADE,
  CONSTRAINT `contactgroup_hostgroup_relation_ibfk_2` FOREIGN KEY (`hostgroup_hg_id`) REFERENCES `hostgroup` (`hg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactgroup_hostgroup_relation`
--

LOCK TABLES `contactgroup_hostgroup_relation` WRITE;
/*!40000 ALTER TABLE `contactgroup_hostgroup_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactgroup_hostgroup_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactgroup_service_relation`
--

DROP TABLE IF EXISTS `contactgroup_service_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactgroup_service_relation` (
  `cgsr_id` int(11) NOT NULL AUTO_INCREMENT,
  `contactgroup_cg_id` int(11) DEFAULT NULL,
  `service_service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cgsr_id`),
  KEY `contactgroup_index` (`contactgroup_cg_id`),
  KEY `service_index` (`service_service_id`),
  CONSTRAINT `contactgroup_service_relation_ibfk_1` FOREIGN KEY (`contactgroup_cg_id`) REFERENCES `contactgroup` (`cg_id`) ON DELETE CASCADE,
  CONSTRAINT `contactgroup_service_relation_ibfk_2` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactgroup_service_relation`
--

LOCK TABLES `contactgroup_service_relation` WRITE;
/*!40000 ALTER TABLE `contactgroup_service_relation` DISABLE KEYS */;
INSERT INTO `contactgroup_service_relation` VALUES (121,5,1);
/*!40000 ALTER TABLE `contactgroup_service_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactgroup_servicegroup_relation`
--

DROP TABLE IF EXISTS `contactgroup_servicegroup_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactgroup_servicegroup_relation` (
  `cgsgr_id` int(11) NOT NULL AUTO_INCREMENT,
  `servicegroup_sg_id` int(11) DEFAULT NULL,
  `contactgroup_cg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cgsgr_id`),
  KEY `servicegroup_index` (`servicegroup_sg_id`),
  KEY `contactgroup_index` (`contactgroup_cg_id`),
  CONSTRAINT `contactgroup_servicegroup_relation_ibfk_1` FOREIGN KEY (`contactgroup_cg_id`) REFERENCES `contactgroup` (`cg_id`) ON DELETE CASCADE,
  CONSTRAINT `contactgroup_servicegroup_relation_ibfk_2` FOREIGN KEY (`servicegroup_sg_id`) REFERENCES `servicegroup` (`sg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactgroup_servicegroup_relation`
--

LOCK TABLES `contactgroup_servicegroup_relation` WRITE;
/*!40000 ALTER TABLE `contactgroup_servicegroup_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactgroup_servicegroup_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_operation`
--

DROP TABLE IF EXISTS `cron_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) DEFAULT NULL,
  `command` varchar(254) DEFAULT NULL,
  `time_launch` int(11) DEFAULT NULL,
  `last_modification` int(11) DEFAULT '0',
  `system` enum('0','1') DEFAULT NULL,
  `module` enum('0','1') DEFAULT NULL,
  `running` enum('0','1') DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `last_execution_time` int(11) NOT NULL DEFAULT '0',
  `activate` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_operation`
--

LOCK TABLES `cron_operation` WRITE;
/*!40000 ALTER TABLE `cron_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `css_color_menu`
--

DROP TABLE IF EXISTS `css_color_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `css_color_menu` (
  `id_css_color_menu` int(11) NOT NULL AUTO_INCREMENT,
  `menu_nb` int(11) DEFAULT NULL,
  `css_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_css_color_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `css_color_menu`
--

LOCK TABLES `css_color_menu` WRITE;
/*!40000 ALTER TABLE `css_color_menu` DISABLE KEYS */;
INSERT INTO `css_color_menu` VALUES (1,1,'blue_css.php'),(2,2,'green_css.php'),(3,3,'yellow_css.php'),(4,4,'red_css.php'),(5,5,'blue_css.php'),(6,6,'blue_css.php');
/*!40000 ALTER TABLE `css_color_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_view_default`
--

DROP TABLE IF EXISTS `custom_view_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_view_default` (
  `user_id` int(11) NOT NULL,
  `custom_view_id` int(11) NOT NULL,
  KEY `fk_custom_view_default_user_id` (`user_id`),
  KEY `fk_custom_view_default_cv_id` (`custom_view_id`),
  CONSTRAINT `fk_custom_view_default_cv_id` FOREIGN KEY (`custom_view_id`) REFERENCES `custom_views` (`custom_view_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_custom_view_default_user_id` FOREIGN KEY (`user_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_view_default`
--

LOCK TABLES `custom_view_default` WRITE;
/*!40000 ALTER TABLE `custom_view_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_view_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_view_user_relation`
--

DROP TABLE IF EXISTS `custom_view_user_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_view_user_relation` (
  `custom_view_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `usergroup_id` int(11) DEFAULT NULL,
  `locked` tinyint(6) DEFAULT '0',
  `is_owner` tinyint(6) DEFAULT '0',
  `is_consumed` int(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `view_user_unique_index` (`custom_view_id`,`user_id`,`usergroup_id`),
  KEY `fk_custom_views_user_id` (`user_id`),
  KEY `fk_custom_views_usergroup_id` (`usergroup_id`),
  CONSTRAINT `fk_custom_view_user_id` FOREIGN KEY (`custom_view_id`) REFERENCES `custom_views` (`custom_view_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_custom_views_user_id` FOREIGN KEY (`user_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_custom_views_usergroup_id` FOREIGN KEY (`usergroup_id`) REFERENCES `contactgroup` (`cg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_view_user_relation`
--

LOCK TABLES `custom_view_user_relation` WRITE;
/*!40000 ALTER TABLE `custom_view_user_relation` DISABLE KEYS */;
INSERT INTO `custom_view_user_relation` VALUES (1,1,NULL,0,1,1);
/*!40000 ALTER TABLE `custom_view_user_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_views`
--

DROP TABLE IF EXISTS `custom_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_views` (
  `custom_view_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `layout` varchar(255) NOT NULL,
  `public` tinyint(6) DEFAULT '0',
  PRIMARY KEY (`custom_view_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_views`
--

LOCK TABLES `custom_views` WRITE;
/*!40000 ALTER TABLE `custom_views` DISABLE KEYS */;
INSERT INTO `custom_views` VALUES (1,'GTX','column_2',0);
/*!40000 ALTER TABLE `custom_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency`
--

DROP TABLE IF EXISTS `dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(255) DEFAULT NULL,
  `dep_description` varchar(255) DEFAULT NULL,
  `inherits_parent` enum('0','1') DEFAULT NULL,
  `execution_failure_criteria` varchar(255) DEFAULT NULL,
  `notification_failure_criteria` varchar(255) DEFAULT NULL,
  `dep_comment` text,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency`
--

LOCK TABLES `dependency` WRITE;
/*!40000 ALTER TABLE `dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency_hostChild_relation`
--

DROP TABLE IF EXISTS `dependency_hostChild_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency_hostChild_relation` (
  `dhcr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency_dep_id` int(11) DEFAULT NULL,
  `host_host_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dhcr_id`),
  KEY `dependency_index` (`dependency_dep_id`),
  KEY `host_index` (`host_host_id`),
  CONSTRAINT `dependency_hostChild_relation_ibfk_1` FOREIGN KEY (`dependency_dep_id`) REFERENCES `dependency` (`dep_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_hostChild_relation_ibfk_2` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency_hostChild_relation`
--

LOCK TABLES `dependency_hostChild_relation` WRITE;
/*!40000 ALTER TABLE `dependency_hostChild_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency_hostChild_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency_hostParent_relation`
--

DROP TABLE IF EXISTS `dependency_hostParent_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency_hostParent_relation` (
  `dhpr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency_dep_id` int(11) DEFAULT NULL,
  `host_host_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dhpr_id`),
  KEY `dependency_index` (`dependency_dep_id`),
  KEY `host_index` (`host_host_id`),
  CONSTRAINT `dependency_hostParent_relation_ibfk_1` FOREIGN KEY (`dependency_dep_id`) REFERENCES `dependency` (`dep_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_hostParent_relation_ibfk_2` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency_hostParent_relation`
--

LOCK TABLES `dependency_hostParent_relation` WRITE;
/*!40000 ALTER TABLE `dependency_hostParent_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency_hostParent_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency_hostgroupChild_relation`
--

DROP TABLE IF EXISTS `dependency_hostgroupChild_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency_hostgroupChild_relation` (
  `dhgcr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency_dep_id` int(11) DEFAULT NULL,
  `hostgroup_hg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dhgcr_id`),
  KEY `dependency_index` (`dependency_dep_id`),
  KEY `hostgroup_index` (`hostgroup_hg_id`),
  CONSTRAINT `dependency_hostgroupChild_relation_ibfk_1` FOREIGN KEY (`dependency_dep_id`) REFERENCES `dependency` (`dep_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_hostgroupChild_relation_ibfk_2` FOREIGN KEY (`hostgroup_hg_id`) REFERENCES `hostgroup` (`hg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency_hostgroupChild_relation`
--

LOCK TABLES `dependency_hostgroupChild_relation` WRITE;
/*!40000 ALTER TABLE `dependency_hostgroupChild_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency_hostgroupChild_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency_hostgroupParent_relation`
--

DROP TABLE IF EXISTS `dependency_hostgroupParent_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency_hostgroupParent_relation` (
  `dhgpr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency_dep_id` int(11) DEFAULT NULL,
  `hostgroup_hg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dhgpr_id`),
  KEY `dependency_index` (`dependency_dep_id`),
  KEY `hostgroup_index` (`hostgroup_hg_id`),
  CONSTRAINT `dependency_hostgroupParent_relation_ibfk_1` FOREIGN KEY (`dependency_dep_id`) REFERENCES `dependency` (`dep_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_hostgroupParent_relation_ibfk_2` FOREIGN KEY (`hostgroup_hg_id`) REFERENCES `hostgroup` (`hg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency_hostgroupParent_relation`
--

LOCK TABLES `dependency_hostgroupParent_relation` WRITE;
/*!40000 ALTER TABLE `dependency_hostgroupParent_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency_hostgroupParent_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency_metaserviceChild_relation`
--

DROP TABLE IF EXISTS `dependency_metaserviceChild_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency_metaserviceChild_relation` (
  `dmscr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency_dep_id` int(11) DEFAULT NULL,
  `meta_service_meta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dmscr_id`),
  KEY `dependency_index` (`dependency_dep_id`),
  KEY `meta_service_index` (`meta_service_meta_id`),
  CONSTRAINT `dependency_metaserviceChild_relation_ibfk_1` FOREIGN KEY (`dependency_dep_id`) REFERENCES `dependency` (`dep_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_metaserviceChild_relation_ibfk_2` FOREIGN KEY (`meta_service_meta_id`) REFERENCES `meta_service` (`meta_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency_metaserviceChild_relation`
--

LOCK TABLES `dependency_metaserviceChild_relation` WRITE;
/*!40000 ALTER TABLE `dependency_metaserviceChild_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency_metaserviceChild_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency_metaserviceParent_relation`
--

DROP TABLE IF EXISTS `dependency_metaserviceParent_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency_metaserviceParent_relation` (
  `dmspr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency_dep_id` int(11) DEFAULT NULL,
  `meta_service_meta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dmspr_id`),
  KEY `dependency_index` (`dependency_dep_id`),
  KEY `meta_service_index` (`meta_service_meta_id`),
  CONSTRAINT `dependency_metaserviceParent_relation_ibfk_1` FOREIGN KEY (`dependency_dep_id`) REFERENCES `dependency` (`dep_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_metaserviceParent_relation_ibfk_2` FOREIGN KEY (`meta_service_meta_id`) REFERENCES `meta_service` (`meta_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency_metaserviceParent_relation`
--

LOCK TABLES `dependency_metaserviceParent_relation` WRITE;
/*!40000 ALTER TABLE `dependency_metaserviceParent_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency_metaserviceParent_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency_serviceChild_relation`
--

DROP TABLE IF EXISTS `dependency_serviceChild_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency_serviceChild_relation` (
  `dscr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency_dep_id` int(11) DEFAULT NULL,
  `service_service_id` int(11) DEFAULT NULL,
  `host_host_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dscr_id`),
  KEY `dependency_index` (`dependency_dep_id`),
  KEY `service_index` (`service_service_id`),
  KEY `host_index` (`host_host_id`),
  CONSTRAINT `dependency_serviceChild_relation_ibfk_1` FOREIGN KEY (`dependency_dep_id`) REFERENCES `dependency` (`dep_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_serviceChild_relation_ibfk_2` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_serviceChild_relation_ibfk_3` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency_serviceChild_relation`
--

LOCK TABLES `dependency_serviceChild_relation` WRITE;
/*!40000 ALTER TABLE `dependency_serviceChild_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency_serviceChild_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency_serviceParent_relation`
--

DROP TABLE IF EXISTS `dependency_serviceParent_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency_serviceParent_relation` (
  `dspr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency_dep_id` int(11) DEFAULT NULL,
  `service_service_id` int(11) DEFAULT NULL,
  `host_host_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dspr_id`),
  KEY `dependency_index` (`dependency_dep_id`),
  KEY `service_index` (`service_service_id`),
  KEY `host_index` (`host_host_id`),
  CONSTRAINT `dependency_serviceParent_relation_ibfk_1` FOREIGN KEY (`dependency_dep_id`) REFERENCES `dependency` (`dep_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_serviceParent_relation_ibfk_2` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_serviceParent_relation_ibfk_3` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency_serviceParent_relation`
--

LOCK TABLES `dependency_serviceParent_relation` WRITE;
/*!40000 ALTER TABLE `dependency_serviceParent_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency_serviceParent_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency_servicegroupChild_relation`
--

DROP TABLE IF EXISTS `dependency_servicegroupChild_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency_servicegroupChild_relation` (
  `dsgcr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency_dep_id` int(11) DEFAULT NULL,
  `servicegroup_sg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dsgcr_id`),
  KEY `dependency_index` (`dependency_dep_id`),
  KEY `sg_index` (`servicegroup_sg_id`),
  CONSTRAINT `dependency_servicegroupChild_relation_ibfk_1` FOREIGN KEY (`dependency_dep_id`) REFERENCES `dependency` (`dep_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_servicegroupChild_relation_ibfk_2` FOREIGN KEY (`servicegroup_sg_id`) REFERENCES `servicegroup` (`sg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency_servicegroupChild_relation`
--

LOCK TABLES `dependency_servicegroupChild_relation` WRITE;
/*!40000 ALTER TABLE `dependency_servicegroupChild_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency_servicegroupChild_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency_servicegroupParent_relation`
--

DROP TABLE IF EXISTS `dependency_servicegroupParent_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency_servicegroupParent_relation` (
  `dsgpr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency_dep_id` int(11) DEFAULT NULL,
  `servicegroup_sg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dsgpr_id`),
  KEY `dependency_index` (`dependency_dep_id`),
  KEY `sg_index` (`servicegroup_sg_id`),
  CONSTRAINT `dependency_servicegroupParent_relation_ibfk_1` FOREIGN KEY (`dependency_dep_id`) REFERENCES `dependency` (`dep_id`) ON DELETE CASCADE,
  CONSTRAINT `dependency_servicegroupParent_relation_ibfk_2` FOREIGN KEY (`servicegroup_sg_id`) REFERENCES `servicegroup` (`sg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency_servicegroupParent_relation`
--

LOCK TABLES `dependency_servicegroupParent_relation` WRITE;
/*!40000 ALTER TABLE `dependency_servicegroupParent_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency_servicegroupParent_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downtime`
--

DROP TABLE IF EXISTS `downtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downtime` (
  `dt_id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_name` varchar(100) NOT NULL,
  `dt_description` varchar(255) DEFAULT NULL,
  `dt_activate` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`dt_id`),
  UNIQUE KEY `downtime_idx02` (`dt_name`),
  KEY `downtime_idx01` (`dt_id`,`dt_activate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downtime`
--

LOCK TABLES `downtime` WRITE;
/*!40000 ALTER TABLE `downtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `downtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downtime_host_relation`
--

DROP TABLE IF EXISTS `downtime_host_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downtime_host_relation` (
  `dt_id` int(11) NOT NULL,
  `host_host_id` int(11) NOT NULL,
  PRIMARY KEY (`dt_id`,`host_host_id`),
  KEY `downtime_host_relation_ibfk_1` (`host_host_id`),
  CONSTRAINT `downtime_host_relation_ibfk_1` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `downtime_host_relation_ibfk_2` FOREIGN KEY (`dt_id`) REFERENCES `downtime` (`dt_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downtime_host_relation`
--

LOCK TABLES `downtime_host_relation` WRITE;
/*!40000 ALTER TABLE `downtime_host_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `downtime_host_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downtime_hostgroup_relation`
--

DROP TABLE IF EXISTS `downtime_hostgroup_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downtime_hostgroup_relation` (
  `dt_id` int(11) NOT NULL,
  `hg_hg_id` int(11) NOT NULL,
  PRIMARY KEY (`dt_id`,`hg_hg_id`),
  KEY `downtime_hostgroup_relation_ibfk_1` (`hg_hg_id`),
  CONSTRAINT `downtime_hostgroup_relation_ibfk_1` FOREIGN KEY (`hg_hg_id`) REFERENCES `hostgroup` (`hg_id`) ON DELETE CASCADE,
  CONSTRAINT `downtime_hostgroup_relation_ibfk_2` FOREIGN KEY (`dt_id`) REFERENCES `downtime` (`dt_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downtime_hostgroup_relation`
--

LOCK TABLES `downtime_hostgroup_relation` WRITE;
/*!40000 ALTER TABLE `downtime_hostgroup_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `downtime_hostgroup_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downtime_period`
--

DROP TABLE IF EXISTS `downtime_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downtime_period` (
  `dt_id` int(11) NOT NULL,
  `dtp_start_time` time NOT NULL,
  `dtp_end_time` time NOT NULL,
  `dtp_day_of_week` varchar(15) DEFAULT NULL,
  `dtp_month_cycle` enum('first','last','all','none') DEFAULT 'all',
  `dtp_day_of_month` varchar(100) DEFAULT NULL,
  `dtp_fixed` enum('0','1') DEFAULT '1',
  `dtp_duration` int(11) DEFAULT NULL,
  `dtp_next_date` date DEFAULT NULL,
  `dtp_activate` enum('0','1') DEFAULT '1',
  KEY `downtime_period_idx01` (`dt_id`,`dtp_activate`),
  CONSTRAINT `downtime_period_ibfk_1` FOREIGN KEY (`dt_id`) REFERENCES `downtime` (`dt_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downtime_period`
--

LOCK TABLES `downtime_period` WRITE;
/*!40000 ALTER TABLE `downtime_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `downtime_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downtime_service_relation`
--

DROP TABLE IF EXISTS `downtime_service_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downtime_service_relation` (
  `dt_id` int(11) NOT NULL,
  `host_host_id` int(11) NOT NULL,
  `service_service_id` int(11) NOT NULL,
  PRIMARY KEY (`dt_id`,`host_host_id`,`service_service_id`),
  KEY `downtime_service_relation_ibfk_1` (`service_service_id`),
  KEY `downtime_service_relation_ibfk_3` (`host_host_id`),
  CONSTRAINT `downtime_service_relation_ibfk_1` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `downtime_service_relation_ibfk_2` FOREIGN KEY (`dt_id`) REFERENCES `downtime` (`dt_id`) ON DELETE CASCADE,
  CONSTRAINT `downtime_service_relation_ibfk_3` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downtime_service_relation`
--

LOCK TABLES `downtime_service_relation` WRITE;
/*!40000 ALTER TABLE `downtime_service_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `downtime_service_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downtime_servicegroup_relation`
--

DROP TABLE IF EXISTS `downtime_servicegroup_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downtime_servicegroup_relation` (
  `dt_id` int(11) NOT NULL,
  `sg_sg_id` int(11) NOT NULL,
  PRIMARY KEY (`dt_id`,`sg_sg_id`),
  KEY `downtime_servicegroup_relation_ibfk_1` (`sg_sg_id`),
  CONSTRAINT `downtime_servicegroup_relation_ibfk_1` FOREIGN KEY (`sg_sg_id`) REFERENCES `servicegroup` (`sg_id`) ON DELETE CASCADE,
  CONSTRAINT `downtime_servicegroup_relation_ibfk_2` FOREIGN KEY (`dt_id`) REFERENCES `downtime` (`dt_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downtime_servicegroup_relation`
--

LOCK TABLES `downtime_servicegroup_relation` WRITE;
/*!40000 ALTER TABLE `downtime_servicegroup_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `downtime_servicegroup_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalation`
--

DROP TABLE IF EXISTS `escalation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalation` (
  `esc_id` int(11) NOT NULL AUTO_INCREMENT,
  `esc_name` varchar(255) DEFAULT NULL,
  `esc_alias` varchar(255) DEFAULT NULL,
  `first_notification` int(11) DEFAULT NULL,
  `last_notification` int(11) DEFAULT NULL,
  `notification_interval` int(11) DEFAULT NULL,
  `escalation_period` int(11) DEFAULT NULL,
  `escalation_options1` varchar(255) DEFAULT NULL,
  `escalation_options2` varchar(255) DEFAULT NULL,
  `esc_comment` text,
  `host_inheritance_to_services` tinyint(1) NOT NULL DEFAULT '0',
  `hostgroup_inheritance_to_services` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`esc_id`),
  KEY `period_index` (`escalation_period`),
  CONSTRAINT `escalation_ibfk_1` FOREIGN KEY (`escalation_period`) REFERENCES `timeperiod` (`tp_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalation`
--

LOCK TABLES `escalation` WRITE;
/*!40000 ALTER TABLE `escalation` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalation_contactgroup_relation`
--

DROP TABLE IF EXISTS `escalation_contactgroup_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalation_contactgroup_relation` (
  `ecgr_id` int(11) NOT NULL AUTO_INCREMENT,
  `escalation_esc_id` int(11) DEFAULT NULL,
  `contactgroup_cg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ecgr_id`),
  KEY `escalation_index` (`escalation_esc_id`),
  KEY `cg_index` (`contactgroup_cg_id`),
  CONSTRAINT `escalation_contactgroup_relation_ibfk_1` FOREIGN KEY (`escalation_esc_id`) REFERENCES `escalation` (`esc_id`) ON DELETE CASCADE,
  CONSTRAINT `escalation_contactgroup_relation_ibfk_2` FOREIGN KEY (`contactgroup_cg_id`) REFERENCES `contactgroup` (`cg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalation_contactgroup_relation`
--

LOCK TABLES `escalation_contactgroup_relation` WRITE;
/*!40000 ALTER TABLE `escalation_contactgroup_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalation_contactgroup_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalation_host_relation`
--

DROP TABLE IF EXISTS `escalation_host_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalation_host_relation` (
  `ehr_id` int(11) NOT NULL AUTO_INCREMENT,
  `escalation_esc_id` int(11) DEFAULT NULL,
  `host_host_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ehr_id`),
  KEY `escalation_index` (`escalation_esc_id`),
  KEY `host_index` (`host_host_id`),
  CONSTRAINT `escalation_host_relation_ibfk_1` FOREIGN KEY (`escalation_esc_id`) REFERENCES `escalation` (`esc_id`) ON DELETE CASCADE,
  CONSTRAINT `escalation_host_relation_ibfk_2` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalation_host_relation`
--

LOCK TABLES `escalation_host_relation` WRITE;
/*!40000 ALTER TABLE `escalation_host_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalation_host_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalation_hostgroup_relation`
--

DROP TABLE IF EXISTS `escalation_hostgroup_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalation_hostgroup_relation` (
  `ehgr_id` int(11) NOT NULL AUTO_INCREMENT,
  `escalation_esc_id` int(11) DEFAULT NULL,
  `hostgroup_hg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ehgr_id`),
  KEY `escalation_index` (`escalation_esc_id`),
  KEY `hg_index` (`hostgroup_hg_id`),
  CONSTRAINT `escalation_hostgroup_relation_ibfk_1` FOREIGN KEY (`escalation_esc_id`) REFERENCES `escalation` (`esc_id`) ON DELETE CASCADE,
  CONSTRAINT `escalation_hostgroup_relation_ibfk_2` FOREIGN KEY (`hostgroup_hg_id`) REFERENCES `hostgroup` (`hg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalation_hostgroup_relation`
--

LOCK TABLES `escalation_hostgroup_relation` WRITE;
/*!40000 ALTER TABLE `escalation_hostgroup_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalation_hostgroup_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalation_meta_service_relation`
--

DROP TABLE IF EXISTS `escalation_meta_service_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalation_meta_service_relation` (
  `emsr_id` int(11) NOT NULL AUTO_INCREMENT,
  `escalation_esc_id` int(11) DEFAULT NULL,
  `meta_service_meta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emsr_id`),
  KEY `escalation_index` (`escalation_esc_id`),
  KEY `meta_service_index` (`meta_service_meta_id`),
  CONSTRAINT `escalation_meta_service_relation_ibfk_1` FOREIGN KEY (`escalation_esc_id`) REFERENCES `escalation` (`esc_id`) ON DELETE CASCADE,
  CONSTRAINT `escalation_meta_service_relation_ibfk_2` FOREIGN KEY (`meta_service_meta_id`) REFERENCES `meta_service` (`meta_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalation_meta_service_relation`
--

LOCK TABLES `escalation_meta_service_relation` WRITE;
/*!40000 ALTER TABLE `escalation_meta_service_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalation_meta_service_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalation_service_relation`
--

DROP TABLE IF EXISTS `escalation_service_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalation_service_relation` (
  `esr_id` int(11) NOT NULL AUTO_INCREMENT,
  `escalation_esc_id` int(11) DEFAULT NULL,
  `service_service_id` int(11) DEFAULT NULL,
  `host_host_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`esr_id`),
  KEY `escalation_index` (`escalation_esc_id`),
  KEY `service_index` (`service_service_id`),
  KEY `host_index` (`host_host_id`),
  CONSTRAINT `escalation_service_relation_ibfk_1` FOREIGN KEY (`escalation_esc_id`) REFERENCES `escalation` (`esc_id`) ON DELETE CASCADE,
  CONSTRAINT `escalation_service_relation_ibfk_2` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `escalation_service_relation_ibfk_3` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalation_service_relation`
--

LOCK TABLES `escalation_service_relation` WRITE;
/*!40000 ALTER TABLE `escalation_service_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalation_service_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalation_servicegroup_relation`
--

DROP TABLE IF EXISTS `escalation_servicegroup_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalation_servicegroup_relation` (
  `esgr_id` int(11) NOT NULL AUTO_INCREMENT,
  `escalation_esc_id` int(11) DEFAULT NULL,
  `servicegroup_sg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`esgr_id`),
  KEY `escalation_index` (`escalation_esc_id`),
  KEY `sg_index` (`servicegroup_sg_id`),
  CONSTRAINT `escalation_servicegroup_relation_ibfk_1` FOREIGN KEY (`escalation_esc_id`) REFERENCES `escalation` (`esc_id`) ON DELETE CASCADE,
  CONSTRAINT `escalation_servicegroup_relation_ibfk_2` FOREIGN KEY (`servicegroup_sg_id`) REFERENCES `servicegroup` (`sg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalation_servicegroup_relation`
--

LOCK TABLES `escalation_servicegroup_relation` WRITE;
/*!40000 ALTER TABLE `escalation_servicegroup_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalation_servicegroup_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extended_host_information`
--

DROP TABLE IF EXISTS `extended_host_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extended_host_information` (
  `ehi_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_host_id` int(11) DEFAULT NULL,
  `ehi_notes` text,
  `ehi_notes_url` text,
  `ehi_action_url` text,
  `ehi_icon_image` int(11) DEFAULT NULL,
  `ehi_icon_image_alt` varchar(200) DEFAULT NULL,
  `ehi_vrml_image` int(11) DEFAULT NULL,
  `ehi_statusmap_image` int(11) DEFAULT NULL,
  `ehi_2d_coords` varchar(200) DEFAULT NULL,
  `ehi_3d_coords` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ehi_id`),
  UNIQUE KEY `host_host_id` (`host_host_id`),
  KEY `host_index` (`host_host_id`),
  KEY `extended_host_information_ibfk_2` (`ehi_icon_image`),
  KEY `extended_host_information_ibfk_3` (`ehi_vrml_image`),
  KEY `extended_host_information_ibfk_4` (`ehi_statusmap_image`),
  CONSTRAINT `extended_host_information_ibfk_1` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `extended_host_information_ibfk_2` FOREIGN KEY (`ehi_icon_image`) REFERENCES `view_img` (`img_id`) ON DELETE SET NULL,
  CONSTRAINT `extended_host_information_ibfk_3` FOREIGN KEY (`ehi_vrml_image`) REFERENCES `view_img` (`img_id`) ON DELETE SET NULL,
  CONSTRAINT `extended_host_information_ibfk_4` FOREIGN KEY (`ehi_statusmap_image`) REFERENCES `view_img` (`img_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extended_host_information`
--

LOCK TABLES `extended_host_information` WRITE;
/*!40000 ALTER TABLE `extended_host_information` DISABLE KEYS */;
INSERT INTO `extended_host_information` VALUES (1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `extended_host_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extended_service_information`
--

DROP TABLE IF EXISTS `extended_service_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extended_service_information` (
  `esi_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_service_id` int(11) DEFAULT NULL,
  `esi_notes` text,
  `esi_notes_url` text,
  `esi_action_url` text,
  `esi_icon_image` int(11) DEFAULT NULL,
  `esi_icon_image_alt` varchar(200) DEFAULT NULL,
  `graph_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`esi_id`),
  KEY `service_index` (`service_service_id`),
  KEY `graph_index` (`graph_id`),
  KEY `extended_service_information_ibfk_3` (`esi_icon_image`),
  CONSTRAINT `extended_service_information_ibfk_1` FOREIGN KEY (`graph_id`) REFERENCES `giv_graphs_template` (`graph_id`) ON DELETE SET NULL,
  CONSTRAINT `extended_service_information_ibfk_2` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `extended_service_information_ibfk_3` FOREIGN KEY (`esi_icon_image`) REFERENCES `view_img` (`img_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extended_service_information`
--

LOCK TABLES `extended_service_information` WRITE;
/*!40000 ALTER TABLE `extended_service_information` DISABLE KEYS */;
INSERT INTO `extended_service_information` VALUES (1,1,NULL,NULL,NULL,NULL,NULL,NULL),(2,3,NULL,NULL,NULL,NULL,NULL,NULL),(3,4,NULL,NULL,NULL,NULL,NULL,NULL),(4,5,NULL,NULL,NULL,NULL,NULL,NULL),(5,6,NULL,NULL,NULL,NULL,NULL,NULL),(6,7,NULL,NULL,NULL,NULL,NULL,NULL),(7,8,NULL,NULL,NULL,NULL,NULL,NULL),(8,9,NULL,NULL,NULL,NULL,NULL,NULL),(9,10,NULL,NULL,NULL,NULL,NULL,NULL),(10,11,NULL,NULL,NULL,NULL,NULL,NULL),(11,12,NULL,NULL,NULL,NULL,NULL,NULL),(12,13,NULL,NULL,NULL,NULL,NULL,NULL),(13,14,NULL,NULL,NULL,NULL,NULL,NULL),(14,15,NULL,NULL,NULL,NULL,NULL,NULL),(15,16,NULL,NULL,NULL,NULL,NULL,NULL),(16,17,NULL,NULL,NULL,NULL,NULL,NULL),(17,18,NULL,NULL,NULL,NULL,NULL,NULL),(18,19,NULL,NULL,NULL,NULL,NULL,NULL),(23,24,NULL,NULL,NULL,NULL,NULL,NULL),(24,25,NULL,NULL,NULL,NULL,NULL,NULL),(25,26,NULL,NULL,NULL,NULL,NULL,NULL),(26,27,NULL,NULL,NULL,NULL,NULL,NULL),(27,28,NULL,NULL,NULL,NULL,NULL,NULL),(28,29,NULL,NULL,NULL,NULL,NULL,NULL),(29,30,NULL,NULL,NULL,NULL,NULL,NULL),(30,31,NULL,NULL,NULL,NULL,NULL,NULL),(31,32,NULL,NULL,NULL,NULL,NULL,NULL),(35,35,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `extended_service_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giv_components_template`
--

DROP TABLE IF EXISTS `giv_components_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giv_components_template` (
  `compo_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ds_order` int(11) DEFAULT NULL,
  `ds_hidecurve` enum('0','1') DEFAULT NULL,
  `ds_name` varchar(200) DEFAULT NULL,
  `ds_color_line` varchar(255) DEFAULT NULL,
  `ds_color_line_mode` enum('0','1') DEFAULT '0',
  `ds_color_area` varchar(255) DEFAULT NULL,
  `ds_color_area_warn` varchar(14) DEFAULT NULL,
  `ds_color_area_crit` varchar(14) DEFAULT NULL,
  `ds_filled` enum('0','1') DEFAULT NULL,
  `ds_max` enum('0','1') DEFAULT NULL,
  `ds_min` enum('0','1') DEFAULT NULL,
  `ds_minmax_int` enum('0','1') DEFAULT '0',
  `ds_average` enum('0','1') DEFAULT NULL,
  `ds_last` enum('0','1') DEFAULT NULL,
  `ds_total` enum('0','1') DEFAULT '0',
  `ds_tickness` int(11) DEFAULT NULL,
  `ds_transparency` varchar(254) DEFAULT NULL,
  `ds_invert` enum('0','1') DEFAULT NULL,
  `ds_legend` varchar(200) DEFAULT NULL,
  `ds_jumpline` enum('0','1','2','3') DEFAULT NULL,
  `ds_stack` enum('0','1') DEFAULT NULL,
  `default_tpl1` enum('0','1') DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`compo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giv_components_template`
--

LOCK TABLES `giv_components_template` WRITE;
/*!40000 ALTER TABLE `giv_components_template` DISABLE KEYS */;
INSERT INTO `giv_components_template` VALUES (1,NULL,NULL,'Default',1,NULL,'Default','','1','#FFFFFF',NULL,NULL,'0','1','1','0','1','1','0',1,NULL,NULL,NULL,NULL,NULL,'1',NULL),(2,NULL,NULL,'Ok',NULL,NULL,'ok','#1EE045','0','#1EE045',NULL,NULL,'1',NULL,NULL,'0','1',NULL,'0',1,'95',NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,'Ping',1,NULL,'Ping','#1EE045','0','#1EE045',NULL,NULL,'0','1','0','0','1','0','0',1,'75','0',NULL,NULL,NULL,'0',NULL),(4,NULL,NULL,'Total',NULL,NULL,'total','#F33E0B','0','#FFFFFF',NULL,NULL,NULL,NULL,NULL,'0','1','1','0',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,'Used',NULL,NULL,'used','#2B28D7','0','#050AF9',NULL,NULL,'1',NULL,NULL,'0','1','1','0',1,'80',NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,'CPU',NULL,NULL,'cpu','#FF0000','0','#FFFFFF',NULL,NULL,NULL,'1','1','0','1','1','0',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,'UPTIME',1,NULL,'UPTIME','#FF0000','0','#FF0000',NULL,NULL,'1','1','1','0','1','0','0',1,NULL,'0',NULL,NULL,NULL,'0',NULL),(8,NULL,NULL,'Traffic_In',NULL,NULL,'traffic_in','#FF0000','0','#FF0000',NULL,NULL,'1','1',NULL,'0','1',NULL,'0',1,'75','1',NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,'Traffic_Out',NULL,NULL,'traffic_out','#1EE045','0','#1EE045',NULL,NULL,'1','1',NULL,'0','1','1','0',1,'75',NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,NULL,'load_1',NULL,NULL,'load1','#F3D30B','0','#F3D30B',NULL,NULL,NULL,NULL,NULL,'0','1',NULL,'0',1,'75',NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,'load_5',NULL,NULL,'load5','#E97B15','0','#E97B15',NULL,NULL,NULL,NULL,NULL,'0','1',NULL,'0',1,'75',NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,NULL,'load_15',NULL,NULL,'load15','#F11F0D','0','#F11F0D',NULL,NULL,NULL,NULL,NULL,'0','1',NULL,'0',1,'75',NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,NULL,'Time',NULL,NULL,'time','#1AA8E4','0','#08C6F6',NULL,NULL,'1','1',NULL,'0',NULL,'1','0',1,'80',NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,NULL,'Size',NULL,NULL,'size','#F33E0B','0','#F30B51',NULL,NULL,NULL,NULL,NULL,'0','1','1','0',1,'70',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `giv_components_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giv_graphs_template`
--

DROP TABLE IF EXISTS `giv_graphs_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giv_graphs_template` (
  `graph_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `vertical_label` varchar(200) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `base` int(11) DEFAULT '1000',
  `lower_limit` float DEFAULT NULL,
  `upper_limit` float DEFAULT NULL,
  `size_to_max` tinyint(6) NOT NULL DEFAULT '0',
  `default_tpl1` enum('0','1') DEFAULT NULL,
  `stacked` enum('0','1') DEFAULT NULL,
  `split_component` enum('0','1') DEFAULT '0',
  `scaled` enum('0','1') DEFAULT '1',
  `comment` text,
  PRIMARY KEY (`graph_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giv_graphs_template`
--

LOCK TABLES `giv_graphs_template` WRITE;
/*!40000 ALTER TABLE `giv_graphs_template` DISABLE KEYS */;
INSERT INTO `giv_graphs_template` VALUES (1,'Default_Graph','Value',550,140,1000,0,NULL,0,'1',NULL,NULL,'1',NULL),(2,'Latency','Latency',550,140,1000,0,NULL,0,NULL,NULL,NULL,'1',NULL),(3,'Storage','Storage',550,140,1024,0,NULL,0,NULL,NULL,NULL,'1',NULL),(4,'Memory','Memory',550,140,1024,0,NULL,0,NULL,NULL,NULL,'1',NULL),(5,'CPU','Processor Use',550,140,1000,0,110,0,'0',NULL,NULL,'1',NULL),(6,'Uptime','Uptime',550,140,1000,0,NULL,0,NULL,NULL,NULL,'1',NULL),(7,'Traffic','Traffic',550,140,1000,NULL,NULL,0,NULL,NULL,NULL,'1',NULL),(8,'Load_Average','Load_Average',550,140,1000,0,NULL,0,NULL,NULL,NULL,'1',NULL);
/*!40000 ALTER TABLE `giv_graphs_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `host_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_template_model_htm_id` int(11) DEFAULT NULL,
  `command_command_id` int(11) DEFAULT NULL,
  `command_command_id_arg1` text,
  `timeperiod_tp_id` int(11) DEFAULT NULL,
  `timeperiod_tp_id2` int(11) DEFAULT NULL,
  `command_command_id2` int(11) DEFAULT NULL,
  `command_command_id_arg2` text,
  `host_name` varchar(200) DEFAULT NULL,
  `host_alias` varchar(200) DEFAULT NULL,
  `host_address` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `host_max_check_attempts` int(11) DEFAULT NULL,
  `host_check_interval` int(11) DEFAULT NULL,
  `host_retry_check_interval` int(11) DEFAULT NULL,
  `host_active_checks_enabled` enum('0','1','2') DEFAULT NULL,
  `host_passive_checks_enabled` enum('0','1','2') DEFAULT NULL,
  `host_checks_enabled` enum('0','1','2') DEFAULT NULL,
  `initial_state` enum('o','d','u') DEFAULT NULL,
  `host_obsess_over_host` enum('0','1','2') DEFAULT NULL,
  `host_check_freshness` enum('0','1','2') DEFAULT NULL,
  `host_freshness_threshold` int(11) DEFAULT NULL,
  `host_event_handler_enabled` enum('0','1','2') DEFAULT NULL,
  `host_low_flap_threshold` int(11) DEFAULT NULL,
  `host_high_flap_threshold` int(11) DEFAULT NULL,
  `host_flap_detection_enabled` enum('0','1','2') DEFAULT NULL,
  `flap_detection_options` varchar(255) DEFAULT NULL,
  `host_process_perf_data` enum('0','1','2') DEFAULT NULL,
  `host_retain_status_information` enum('0','1','2') DEFAULT NULL,
  `host_retain_nonstatus_information` enum('0','1','2') DEFAULT NULL,
  `host_notification_interval` int(11) DEFAULT NULL,
  `host_notification_options` varchar(200) DEFAULT NULL,
  `host_notifications_enabled` enum('0','1','2') DEFAULT NULL,
  `contact_additive_inheritance` tinyint(1) DEFAULT '0',
  `cg_additive_inheritance` tinyint(1) DEFAULT '0',
  `host_first_notification_delay` int(11) DEFAULT NULL,
  `host_stalking_options` varchar(200) DEFAULT NULL,
  `host_snmp_community` varchar(255) DEFAULT NULL,
  `host_snmp_version` varchar(255) DEFAULT NULL,
  `host_location` int(11) DEFAULT '0',
  `host_comment` text,
  `host_locked` tinyint(1) DEFAULT '0',
  `host_register` enum('0','1','2','3') DEFAULT NULL,
  `host_activate` enum('0','1','2') DEFAULT '1',
  PRIMARY KEY (`host_id`),
  KEY `htm_index` (`host_template_model_htm_id`),
  KEY `cmd1_index` (`command_command_id`),
  KEY `cmd2_index` (`command_command_id2`),
  KEY `tp1_index` (`timeperiod_tp_id`),
  KEY `tp2_index` (`timeperiod_tp_id2`),
  KEY `name_index` (`host_name`),
  KEY `host_id_register` (`host_id`,`host_register`),
  KEY `alias_index` (`host_alias`),
  KEY `host_register` (`host_register`),
  CONSTRAINT `host_ibfk_1` FOREIGN KEY (`command_command_id`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `host_ibfk_2` FOREIGN KEY (`command_command_id2`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `host_ibfk_3` FOREIGN KEY (`timeperiod_tp_id`) REFERENCES `timeperiod` (`tp_id`) ON DELETE SET NULL,
  CONSTRAINT `host_ibfk_4` FOREIGN KEY (`timeperiod_tp_id2`) REFERENCES `timeperiod` (`tp_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (2,NULL,1,NULL,1,1,NULL,NULL,'generic-host','generic-host',NULL,NULL,5,NULL,NULL,'1','0','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',0,'d,r','0',0,0,NULL,NULL,'public','2c',0,NULL,0,'0','1'),(3,2,NULL,NULL,NULL,NULL,NULL,NULL,'Servers-Linux','Linux Servers',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'0','1'),(4,2,NULL,NULL,NULL,NULL,NULL,NULL,'Servers-Win2K','Windows 2000 Servers',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'0','1'),(5,2,NULL,NULL,NULL,NULL,NULL,NULL,'Servers-Win2K3','Windows 2003 Servers',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'0','1'),(6,2,NULL,NULL,NULL,NULL,NULL,NULL,'Switchs-Cisco','Cisco Switchs',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'0','1'),(7,2,NULL,NULL,NULL,NULL,NULL,NULL,'Switchs-3Com','3Com Switchs',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'0','1'),(8,2,NULL,NULL,NULL,NULL,NULL,NULL,'Switchs-HP','HP Switchs',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'0','1'),(9,2,NULL,NULL,NULL,NULL,NULL,NULL,'Switchs-NORTEL','NORTEL Switchs',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'0','1'),(10,2,NULL,NULL,NULL,NULL,NULL,NULL,'Router-Cisco','Cisco Routers',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'0','1'),(11,2,NULL,NULL,NULL,NULL,NULL,NULL,'Router-HP','HP Routers',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'0','1'),(12,2,NULL,NULL,NULL,NULL,NULL,NULL,'Printers','Printers',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'0','1'),(13,2,NULL,NULL,NULL,NULL,NULL,NULL,'UPS','UPS',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'0','1'),(14,3,NULL,NULL,NULL,NULL,NULL,NULL,'Centreon-Server','Monitoring Server','127.0.0.1',NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,'0',0,NULL,0,'1','1'),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Servers-Win7','Windows7 Servers',NULL,NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'0','1'),(16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Windows_7','Windows 7','192.168.127.1',NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'1','1'),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MacBook','MacBook','192.168.1.100',NULL,NULL,NULL,NULL,'2','2','2',NULL,'2','2',NULL,'2',NULL,NULL,'2',NULL,'2','2','2',NULL,NULL,'2',0,0,NULL,NULL,'public','2c',343,NULL,0,'1','1');
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_hostparent_relation`
--

DROP TABLE IF EXISTS `host_hostparent_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_hostparent_relation` (
  `hhr_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_parent_hp_id` int(11) DEFAULT NULL,
  `host_host_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hhr_id`),
  KEY `host1_index` (`host_parent_hp_id`),
  KEY `host2_index` (`host_host_id`),
  CONSTRAINT `host_hostparent_relation_ibfk_1` FOREIGN KEY (`host_parent_hp_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `host_hostparent_relation_ibfk_2` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_hostparent_relation`
--

LOCK TABLES `host_hostparent_relation` WRITE;
/*!40000 ALTER TABLE `host_hostparent_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_hostparent_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_service_relation`
--

DROP TABLE IF EXISTS `host_service_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_service_relation` (
  `hsr_id` int(11) NOT NULL AUTO_INCREMENT,
  `hostgroup_hg_id` int(11) DEFAULT NULL,
  `host_host_id` int(11) DEFAULT NULL,
  `servicegroup_sg_id` int(11) DEFAULT NULL,
  `service_service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hsr_id`),
  KEY `hostgroup_index` (`hostgroup_hg_id`),
  KEY `host_index` (`host_host_id`),
  KEY `servicegroup_index` (`servicegroup_sg_id`),
  KEY `service_index` (`service_service_id`),
  KEY `host_service_index` (`host_host_id`,`service_service_id`),
  KEY `host_host_id` (`host_host_id`,`service_service_id`),
  CONSTRAINT `host_service_relation_ibfk_1` FOREIGN KEY (`hostgroup_hg_id`) REFERENCES `hostgroup` (`hg_id`) ON DELETE CASCADE,
  CONSTRAINT `host_service_relation_ibfk_2` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `host_service_relation_ibfk_3` FOREIGN KEY (`servicegroup_sg_id`) REFERENCES `servicegroup` (`sg_id`) ON DELETE CASCADE,
  CONSTRAINT `host_service_relation_ibfk_4` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_service_relation`
--

LOCK TABLES `host_service_relation` WRITE;
/*!40000 ALTER TABLE `host_service_relation` DISABLE KEYS */;
INSERT INTO `host_service_relation` VALUES (1,NULL,4,NULL,11),(2,NULL,5,NULL,11),(3,NULL,5,NULL,16),(4,NULL,5,NULL,15),(5,NULL,4,NULL,17),(11,NULL,14,NULL,24),(12,NULL,14,NULL,26),(13,NULL,3,NULL,5),(14,NULL,3,NULL,12),(15,NULL,3,NULL,14),(16,NULL,14,NULL,25),(17,NULL,4,NULL,18),(18,NULL,5,NULL,18),(19,NULL,3,NULL,13),(20,NULL,2,NULL,3),(26,NULL,15,NULL,28),(27,NULL,15,NULL,27),(28,NULL,15,NULL,29),(29,NULL,15,NULL,3),(30,NULL,16,NULL,30),(31,NULL,16,NULL,31),(32,NULL,16,NULL,32),(34,NULL,14,NULL,19),(37,NULL,17,NULL,35);
/*!40000 ALTER TABLE `host_service_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_template_relation`
--

DROP TABLE IF EXISTS `host_template_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_template_relation` (
  `host_host_id` int(11) NOT NULL DEFAULT '0',
  `host_tpl_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`host_host_id`,`host_tpl_id`),
  KEY `host_tpl_id` (`host_tpl_id`),
  CONSTRAINT `host_template_relation_ibfk_1` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `host_template_relation_ibfk_2` FOREIGN KEY (`host_tpl_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_template_relation`
--

LOCK TABLES `host_template_relation` WRITE;
/*!40000 ALTER TABLE `host_template_relation` DISABLE KEYS */;
INSERT INTO `host_template_relation` VALUES (3,2,1),(4,2,1),(5,2,1),(6,2,1),(7,2,1),(8,2,1),(9,2,1),(10,2,1),(11,2,1),(12,2,1),(13,2,1),(14,2,1),(15,2,1),(16,15,1),(17,2,1);
/*!40000 ALTER TABLE `host_template_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostcategories`
--

DROP TABLE IF EXISTS `hostcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostcategories` (
  `hc_id` int(11) NOT NULL AUTO_INCREMENT,
  `hc_name` varchar(200) DEFAULT NULL,
  `hc_alias` varchar(200) DEFAULT NULL,
  `level` tinyint(5) DEFAULT NULL,
  `icon_id` int(11) DEFAULT NULL,
  `hc_comment` text,
  `hc_activate` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`hc_id`),
  KEY `name_index` (`hc_name`),
  KEY `alias_index` (`hc_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostcategories`
--

LOCK TABLES `hostcategories` WRITE;
/*!40000 ALTER TABLE `hostcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostcategories_relation`
--

DROP TABLE IF EXISTS `hostcategories_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostcategories_relation` (
  `hcr_id` int(11) NOT NULL AUTO_INCREMENT,
  `hostcategories_hc_id` int(11) DEFAULT NULL,
  `host_host_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hcr_id`),
  KEY `hostcategories_index` (`hostcategories_hc_id`),
  KEY `host_index` (`host_host_id`),
  CONSTRAINT `hostcategories_relation_ibfk_1` FOREIGN KEY (`hostcategories_hc_id`) REFERENCES `hostcategories` (`hc_id`) ON DELETE CASCADE,
  CONSTRAINT `hostcategories_relation_ibfk_2` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostcategories_relation`
--

LOCK TABLES `hostcategories_relation` WRITE;
/*!40000 ALTER TABLE `hostcategories_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostcategories_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostgroup`
--

DROP TABLE IF EXISTS `hostgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostgroup` (
  `hg_id` int(11) NOT NULL AUTO_INCREMENT,
  `hg_name` varchar(200) DEFAULT NULL,
  `hg_alias` varchar(200) DEFAULT NULL,
  `hg_notes` varchar(255) DEFAULT NULL,
  `hg_notes_url` varchar(255) DEFAULT NULL,
  `hg_action_url` varchar(255) DEFAULT NULL,
  `hg_icon_image` int(11) DEFAULT NULL,
  `hg_map_icon_image` int(11) DEFAULT NULL,
  `hg_rrd_retention` int(11) DEFAULT NULL,
  `hg_comment` text,
  `hg_activate` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`hg_id`),
  KEY `name_index` (`hg_name`),
  KEY `alias_index` (`hg_alias`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostgroup`
--

LOCK TABLES `hostgroup` WRITE;
/*!40000 ALTER TABLE `hostgroup` DISABLE KEYS */;
INSERT INTO `hostgroup` VALUES (53,'Linux-Servers','All linux servers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(54,'Windows-Servers','All windows servers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(55,'Networks','All other equipments',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(56,'Printers','All printers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(58,'Routers','All routers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(59,'Switchs','All switchs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(60,'Firewall','All firewalls',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(61,'Unix-Servers','All unix servers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `hostgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostgroup_hg_relation`
--

DROP TABLE IF EXISTS `hostgroup_hg_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostgroup_hg_relation` (
  `hgr_id` int(11) NOT NULL AUTO_INCREMENT,
  `hg_parent_id` int(11) DEFAULT NULL,
  `hg_child_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hgr_id`),
  KEY `hg_parent_id` (`hg_parent_id`),
  KEY `hg_child_id` (`hg_child_id`),
  CONSTRAINT `hostgroup_hg_relation_ibfk_1` FOREIGN KEY (`hg_parent_id`) REFERENCES `hostgroup` (`hg_id`) ON DELETE CASCADE,
  CONSTRAINT `hostgroup_hg_relation_ibfk_2` FOREIGN KEY (`hg_child_id`) REFERENCES `hostgroup` (`hg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostgroup_hg_relation`
--

LOCK TABLES `hostgroup_hg_relation` WRITE;
/*!40000 ALTER TABLE `hostgroup_hg_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostgroup_hg_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostgroup_relation`
--

DROP TABLE IF EXISTS `hostgroup_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostgroup_relation` (
  `hgr_id` int(11) NOT NULL AUTO_INCREMENT,
  `hostgroup_hg_id` int(11) DEFAULT NULL,
  `host_host_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hgr_id`),
  KEY `hostgroup_index` (`hostgroup_hg_id`),
  KEY `host_index` (`host_host_id`),
  CONSTRAINT `hostgroup_relation_ibfk_1` FOREIGN KEY (`hostgroup_hg_id`) REFERENCES `hostgroup` (`hg_id`) ON DELETE CASCADE,
  CONSTRAINT `hostgroup_relation_ibfk_2` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostgroup_relation`
--

LOCK TABLES `hostgroup_relation` WRITE;
/*!40000 ALTER TABLE `hostgroup_relation` DISABLE KEYS */;
INSERT INTO `hostgroup_relation` VALUES (1250,53,14);
/*!40000 ALTER TABLE `hostgroup_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informations`
--

DROP TABLE IF EXISTS `informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informations` (
  `key` varchar(25) DEFAULT NULL,
  `value` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informations`
--

LOCK TABLES `informations` WRITE;
/*!40000 ALTER TABLE `informations` DISABLE KEYS */;
INSERT INTO `informations` VALUES ('version','2.7.6');
/*!40000 ALTER TABLE `informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_contact`
--

DROP TABLE IF EXISTS `meta_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_contact` (
  `meta_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`meta_id`,`contact_id`),
  KEY `contact_id` (`contact_id`),
  CONSTRAINT `meta_contact_ibfk_1` FOREIGN KEY (`meta_id`) REFERENCES `meta_service` (`meta_id`) ON DELETE CASCADE,
  CONSTRAINT `meta_contact_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_contact`
--

LOCK TABLES `meta_contact` WRITE;
/*!40000 ALTER TABLE `meta_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_contactgroup_relation`
--

DROP TABLE IF EXISTS `meta_contactgroup_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_contactgroup_relation` (
  `mcr_id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_id` int(11) DEFAULT NULL,
  `cg_cg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`mcr_id`),
  KEY `meta_index` (`meta_id`),
  KEY `cg_index` (`cg_cg_id`),
  CONSTRAINT `meta_contactgroup_relation_ibfk_1` FOREIGN KEY (`meta_id`) REFERENCES `meta_service` (`meta_id`) ON DELETE CASCADE,
  CONSTRAINT `meta_contactgroup_relation_ibfk_2` FOREIGN KEY (`cg_cg_id`) REFERENCES `contactgroup` (`cg_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_contactgroup_relation`
--

LOCK TABLES `meta_contactgroup_relation` WRITE;
/*!40000 ALTER TABLE `meta_contactgroup_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_contactgroup_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_service`
--

DROP TABLE IF EXISTS `meta_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_service` (
  `meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_name` varchar(254) DEFAULT NULL,
  `meta_display` varchar(254) DEFAULT NULL,
  `check_period` int(11) DEFAULT NULL,
  `max_check_attempts` int(11) DEFAULT NULL,
  `normal_check_interval` int(11) DEFAULT NULL,
  `retry_check_interval` int(11) DEFAULT NULL,
  `notification_interval` int(11) DEFAULT NULL,
  `notification_period` int(11) DEFAULT NULL,
  `notification_options` varchar(255) DEFAULT NULL,
  `notifications_enabled` enum('0','1','2') DEFAULT NULL,
  `calcul_type` enum('SOM','AVE','MIN','MAX') DEFAULT NULL,
  `data_source_type` tinyint(3) NOT NULL DEFAULT '0',
  `meta_select_mode` enum('1','2') DEFAULT '1',
  `regexp_str` varchar(254) DEFAULT NULL,
  `metric` varchar(255) DEFAULT NULL,
  `warning` varchar(254) DEFAULT NULL,
  `critical` varchar(254) DEFAULT NULL,
  `graph_id` int(11) DEFAULT NULL,
  `meta_comment` text,
  `meta_activate` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `name_index` (`meta_name`),
  KEY `check_period_index` (`check_period`),
  KEY `notification_period_index` (`notification_period`),
  KEY `graph_index` (`graph_id`),
  CONSTRAINT `meta_service_ibfk_1` FOREIGN KEY (`check_period`) REFERENCES `timeperiod` (`tp_id`) ON DELETE SET NULL,
  CONSTRAINT `meta_service_ibfk_2` FOREIGN KEY (`notification_period`) REFERENCES `timeperiod` (`tp_id`) ON DELETE SET NULL,
  CONSTRAINT `meta_service_ibfk_3` FOREIGN KEY (`graph_id`) REFERENCES `giv_graphs_template` (`graph_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_service`
--

LOCK TABLES `meta_service` WRITE;
/*!40000 ALTER TABLE `meta_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_service_relation`
--

DROP TABLE IF EXISTS `meta_service_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_service_relation` (
  `msr_id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_id` int(11) DEFAULT NULL,
  `host_id` int(11) DEFAULT NULL,
  `metric_id` int(11) DEFAULT NULL,
  `msr_comment` text,
  `activate` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`msr_id`),
  KEY `meta_index` (`meta_id`),
  KEY `metric_index` (`metric_id`),
  KEY `host_index` (`host_id`),
  CONSTRAINT `meta_service_relation_ibfk_1` FOREIGN KEY (`host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `meta_service_relation_ibfk_2` FOREIGN KEY (`meta_id`) REFERENCES `meta_service` (`meta_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_service_relation`
--

LOCK TABLES `meta_service_relation` WRITE;
/*!40000 ALTER TABLE `meta_service_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_service_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules_informations`
--

DROP TABLE IF EXISTS `modules_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `rname` varchar(255) DEFAULT NULL,
  `mod_release` varchar(255) DEFAULT NULL,
  `is_removeable` enum('0','1') DEFAULT NULL,
  `infos` text,
  `author` varchar(255) DEFAULT NULL,
  `lang_files` enum('0','1') DEFAULT NULL,
  `sql_files` enum('0','1') DEFAULT NULL,
  `php_files` enum('0','1') DEFAULT NULL,
  `svc_tools` enum('0','1') DEFAULT NULL,
  `host_tools` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules_informations`
--

LOCK TABLES `modules_informations` WRITE;
/*!40000 ALTER TABLE `modules_informations` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_macro`
--

DROP TABLE IF EXISTS `nagios_macro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_macro` (
  `macro_id` int(11) NOT NULL AUTO_INCREMENT,
  `macro_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`macro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_macro`
--

LOCK TABLES `nagios_macro` WRITE;
/*!40000 ALTER TABLE `nagios_macro` DISABLE KEYS */;
INSERT INTO `nagios_macro` VALUES (1,'$HOSTNAME$'),(2,'$_HOSTSNMPCOMMUNITY$'),(3,'$_HOSTSNMPVERSION$'),(4,'$_HOSTLOCATION$'),(5,'$ARGn$'),(6,'$HOSTALIAS$'),(7,'$HOSTADDRESS$'),(8,'$HOSTSTATE$'),(9,'$HOSTSTATEID$'),(10,'$HOSTSTATETYPE$'),(11,'$HOSTATTEMPT$'),(12,'$HOSTLATENCY$'),(13,'$HOSTEXECUTIONTIME$'),(14,'$HOSTDURATION$'),(15,'$HOSTDURATIONSEC$'),(16,'$HOSTDOWNTIME$'),(17,'$HOSTPERCENTCHANGE$'),(18,'$HOSTGROUPNAME$'),(19,'$HOSTGROUPALIAS$'),(20,'$LASTHOSTCHECK$'),(21,'$LASTHOSTSTATECHANGE$'),(22,'$LASTHOSTUP$'),(23,'$LASTHOSTDOWN$'),(24,'$LASTHOSTUNREACHABLE$'),(25,'$HOSTOUTPUT$'),(26,'$HOSTPERFDATA$'),(27,'$HOSTCHECKCOMMAND$'),(28,'$HOSTACKAUTHOR$'),(29,'$HOSTACKCOMMENT$'),(30,'$HOSTACTIONURL$'),(31,'$HOSTNOTESURL$'),(32,'$HOSTNOTES$'),(33,'$SERVICEDESC$'),(34,'$SERVICESTATE$'),(35,'$SERVICESTATEID$'),(36,'$SERVICESTATETYPE$'),(37,'$SERVICEATTEMPT$'),(38,'$SERVICELATENCY$'),(39,'$SERVICEEXECUTIONTIME$'),(40,'$SERVICEDURATION$'),(41,'$SERVICEDURATIONSEC$'),(42,'$SERVICEDOWNTIME$'),(43,'$SERVICEPERCENTCHANGE$'),(44,'$SERVICEGROUPNAME$'),(45,'$SERVICEGROUPALIAS$'),(46,'$LASTSERVICECHECK$'),(47,'$LASTSERVICESTATECHANGE$'),(48,'$LASTSERVICEOK$'),(49,'$LASTSERVICEWARNING$'),(50,'$LASTSERVICEUNKNOWN$'),(51,'$LASTSERVICECRITICAL$'),(52,'$SERVICEOUTPUT$'),(53,'$LONGSERVICEOUTPUT$'),(54,'$SERVICEPERFDATA$'),(55,'$SERVICECHECKCOMMAND$'),(56,'$SERVICEACKAUTHOR$'),(57,'$SERVICEACKCOMMENT$'),(58,'$SERVICEACTIONURL$'),(59,'$SERVICENOTESURL$'),(60,'$SERVICENOTES$'),(61,'$TOTALHOSTSUP$'),(62,'$TOTALHOSTSDOWN$'),(63,'$TOTALHOSTSUNREACHABLE$'),(64,'$TOTALHOSTSDOWNUNHANDLED$'),(65,'$TOTALHOSTSUNREACHABLEUNHANDLED$ 	'),(66,'$TOTALHOSTPROBLEMS$'),(67,'$TOTALHOSTPROBLEMSUNHANDLED$'),(68,'$TOTALSERVICESOK$'),(69,'$TOTALSERVICESWARNING$'),(70,'$TOTALSERVICESCRITICAL$'),(71,'$TOTALSERVICESUNKNOWN$'),(72,'$TOTALSERVICESWARNINGUNHANDLED$'),(73,'$TOTALSERVICESCRITICALUNHANDLED$'),(74,'$TOTALSERVICESUNKNOWNUNHANDLED$'),(75,'$TOTALSERVICEPROBLEMS$'),(76,'$TOTALSERVICEPROBLEMSUNHANDLED$'),(77,'$NOTIFICATIONTYPE$'),(78,'$NOTIFICATIONNUMBER$'),(79,'$CONTACTNAME$'),(80,'$CONTACTALIAS$'),(81,'$CONTACTEMAIL$'),(82,'$CONTACTPAGER$'),(83,'$CONTACTADDRESSn$'),(84,'$LONGDATETIME$'),(85,'$SHORTDATETIME$'),(86,'$DATE$'),(87,'$TIME$'),(88,'$TIMET$'),(89,'$MAINCONFIGFILE$'),(90,'$STATUSDATAFILE$'),(91,'$COMMENTDATAFILE$'),(92,'$DOWNTIMEDATAFILE$'),(93,'$RETENTIONDATAFILE$'),(94,'$OBJECTCACHEFILE$'),(95,'$TEMPFILE$'),(96,'$LOGFILE$'),(97,'$RESOURCEFILE$'),(98,'$COMMANDFILE$'),(99,'$HOSTPERFDATAFILE$'),(100,'$SERVICEPERFDATAFILE$'),(101,'$PROCESSSTARTTIME$'),(102,'$ADMINEMAIL$'),(103,'$ADMINPAGER$'),(104,'$USERn$'),(105,'$_HOSTHOST_ID$'),(106,'$_SERVICESERVICE_ID$'),(107,'$_HOSTCRITICALITY_LEVEL$'),(108,'$_SERVICECRITICALITY_LEVEL$'),(109,'$_HOSTCRITICALITY_ID$'),(110,'$_SERVICECRITICALITY_ID$');
/*!40000 ALTER TABLE `nagios_macro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagios_server`
--

DROP TABLE IF EXISTS `nagios_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `localhost` enum('0','1') DEFAULT NULL,
  `is_default` int(11) DEFAULT '0',
  `last_restart` int(11) DEFAULT NULL,
  `ns_ip_address` varchar(255) DEFAULT NULL,
  `ns_activate` enum('1','0') DEFAULT '1',
  `ns_status` enum('0','1','2','3','4') DEFAULT '0',
  `init_script` varchar(255) DEFAULT NULL,
  `monitoring_engine` varchar(20) DEFAULT NULL,
  `nagios_bin` varchar(255) DEFAULT NULL,
  `nagiostats_bin` varchar(255) DEFAULT NULL,
  `nagios_perfdata` varchar(255) DEFAULT NULL,
  `centreonbroker_cfg_path` varchar(255) DEFAULT NULL,
  `centreonbroker_module_path` varchar(255) DEFAULT NULL,
  `centreonconnector_path` varchar(255) DEFAULT NULL,
  `ssh_port` int(11) DEFAULT NULL,
  `ssh_private_key` varchar(255) DEFAULT NULL,
  `init_script_centreontrapd` varchar(255) DEFAULT NULL,
  `snmp_trapd_path_conf` varchar(255) DEFAULT NULL,
  `engine_name` varchar(255) DEFAULT NULL,
  `engine_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagios_server`
--

LOCK TABLES `nagios_server` WRITE;
/*!40000 ALTER TABLE `nagios_server` DISABLE KEYS */;
INSERT INTO `nagios_server` VALUES (1,'Central','1',0,1473635068,'127.0.0.1','1','0','/etc/init.d/centengine','CENGINE','/usr/sbin/centengine','/usr/sbin/centenginestats','/var/log/centreon-engine/service-perfdata','/etc/centreon-broker','/usr/share/centreon/lib/centreon-broker','/usr/lib64/centreon-connector',22,NULL,'/etc/init.d/centreontrapd','/etc/snmp/centreon_traps/',NULL,NULL);
/*!40000 ALTER TABLE `nagios_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_host_relation`
--

DROP TABLE IF EXISTS `ns_host_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_host_relation` (
  `nagios_server_id` int(11) NOT NULL DEFAULT '0',
  `host_host_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nagios_server_id`,`host_host_id`),
  KEY `host_host_id` (`host_host_id`),
  KEY `nagios_server_id` (`nagios_server_id`),
  CONSTRAINT `ns_host_relation_ibfk_2` FOREIGN KEY (`nagios_server_id`) REFERENCES `nagios_server` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ns_host_relation_ibfk_3` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relation Table For centreon Servers and hosts ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_host_relation`
--

LOCK TABLES `ns_host_relation` WRITE;
/*!40000 ALTER TABLE `ns_host_relation` DISABLE KEYS */;
INSERT INTO `ns_host_relation` VALUES (1,14),(1,16),(1,17);
/*!40000 ALTER TABLE `ns_host_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ods_view_details`
--

DROP TABLE IF EXISTS `ods_view_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ods_view_details` (
  `dv_id` int(11) NOT NULL AUTO_INCREMENT,
  `index_id` int(11) DEFAULT NULL,
  `metric_id` varchar(12) DEFAULT NULL,
  `rnd_color` varchar(7) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `all_user` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`dv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ods_view_details`
--

LOCK TABLES `ods_view_details` WRITE;
/*!40000 ALTER TABLE `ods_view_details` DISABLE KEYS */;
INSERT INTO `ods_view_details` VALUES (1,4,'2','#33ffff',1,'0'),(2,4,'1','#cc0033',1,'0'),(3,4,'3','#660099',1,'0'),(4,4,'4','#0099ff',1,'0'),(5,3,'6',NULL,1,'0'),(6,3,'5',NULL,1,'0'),(7,2,'7',NULL,1,'0'),(8,2,'9',NULL,1,'0'),(9,2,'8',NULL,1,'0'),(10,1,'10',NULL,1,'0'),(11,1,'11',NULL,1,'0'),(12,15,'17','#ff6600',1,'0'),(13,15,'16','#333300',1,'0'),(14,15,'18','#cc00cc',1,'0'),(15,14,'19','#666600',1,'0'),(16,14,'20','#cc6699',1,'0'),(17,14,'21','#ff0000',1,'0'),(18,14,'22','#ff00cc',1,'0'),(19,14,'23','#66ff99',1,'0'),(20,14,'24','#00ff33',1,'0'),(21,16,'26','#cccc99',1,'0'),(22,16,'25','#6600cc',1,'0'),(23,16,'27','#666699',1,'0'),(24,13,'13','#cc3300',1,'0'),(25,13,'12','#ff6600',1,'0'),(26,13,'14','#99cc66',1,'0'),(27,13,'15','#3333cc',1,'0'),(28,48,'29','#333300',1,'0'),(29,48,'30','#33cc99',1,'0'),(30,48,'31','#669933',1,'0'),(31,48,'32','#00ffff',1,'0'),(32,48,'28','#3300cc',1,'0'),(33,14,'33','#cc66cc',1,'0'),(34,14,'34','#99ffcc',1,'0'),(35,64,'36','#00cc33',1,'0'),(36,64,'35','#ff3366',1,'0'),(37,64,'37','#99ffff',1,'0'),(38,64,'38','#330099',1,'0'),(39,14,'39','#336666',1,'0'),(40,14,'40','#0000cc',1,'0');
/*!40000 ALTER TABLE `ods_view_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `on_demand_macro_command`
--

DROP TABLE IF EXISTS `on_demand_macro_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `on_demand_macro_command` (
  `command_macro_id` int(11) NOT NULL AUTO_INCREMENT,
  `command_macro_name` varchar(255) NOT NULL,
  `command_macro_desciption` text,
  `command_command_id` int(11) NOT NULL,
  `command_macro_type` enum('1','2') DEFAULT NULL,
  PRIMARY KEY (`command_macro_id`),
  KEY `command_command_id` (`command_command_id`),
  CONSTRAINT `on_demand_macro_command_ibfk_1` FOREIGN KEY (`command_command_id`) REFERENCES `command` (`command_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `on_demand_macro_command`
--

LOCK TABLES `on_demand_macro_command` WRITE;
/*!40000 ALTER TABLE `on_demand_macro_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `on_demand_macro_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `on_demand_macro_host`
--

DROP TABLE IF EXISTS `on_demand_macro_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `on_demand_macro_host` (
  `host_macro_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_macro_name` varchar(255) NOT NULL,
  `host_macro_value` varchar(4096) NOT NULL,
  `is_password` tinyint(2) DEFAULT NULL,
  `description` text,
  `host_host_id` int(11) NOT NULL,
  `macro_order` int(11) DEFAULT '0',
  PRIMARY KEY (`host_macro_id`),
  KEY `host_host_id` (`host_host_id`),
  CONSTRAINT `on_demand_macro_host_ibfk_1` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `on_demand_macro_host`
--

LOCK TABLES `on_demand_macro_host` WRITE;
/*!40000 ALTER TABLE `on_demand_macro_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `on_demand_macro_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `on_demand_macro_service`
--

DROP TABLE IF EXISTS `on_demand_macro_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `on_demand_macro_service` (
  `svc_macro_id` int(11) NOT NULL AUTO_INCREMENT,
  `svc_macro_name` varchar(255) NOT NULL,
  `svc_macro_value` varchar(4096) NOT NULL,
  `is_password` tinyint(2) DEFAULT NULL,
  `description` text,
  `svc_svc_id` int(11) NOT NULL,
  `macro_order` int(11) DEFAULT '0',
  PRIMARY KEY (`svc_macro_id`),
  KEY `svc_svc_id` (`svc_svc_id`),
  CONSTRAINT `on_demand_macro_service_ibfk_1` FOREIGN KEY (`svc_svc_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `on_demand_macro_service`
--

LOCK TABLES `on_demand_macro_service` WRITE;
/*!40000 ALTER TABLE `on_demand_macro_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `on_demand_macro_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES ('cengine_path_connectors','/usr/lib64/centreon-connector/'),('monitoring_engine','CENGINE'),('broker','broker'),('centstorage','0'),('broker_correlator_script','/etc/init.d/cbd'),('enable_perfdata_sync','0'),('enable_logs_sync','0'),('ldap_dns_use_ssl','0'),('ldap_dns_use_tls','0'),('ldap_auth_enable','0'),('ldap_auto_import','0'),('ldap_srv_dns','0'),('ldap_dns_use_domain',''),('ldap_search_timeout','60'),('ldap_search_limit','60'),('ldap_last_acl_update','0'),('ldap_contact_tmpl','0'),('oreon_path','/usr/share/centreon/'),('oreon_web_path','/centreon/'),('session_expire','120'),('maxViewMonitoring','30'),('maxGraphPerformances','5'),('maxViewConfiguration','30'),('AjaxTimeReloadMonitoring','15'),('AjaxTimeReloadStatistic','15'),('template','Centreon-2'),('color_up','#88b917'),('color_down','#e00b3d'),('color_unreachable','#818285'),('color_ok','#88b917'),('color_warning','#ff9a13'),('color_critical','#e00b3d'),('color_pending','#2AD1D4'),('color_unknown','#bcbdc0'),('color_ack','#FAED60'),('color_host_down','#'),('color_host_unreachable','#9CD9F1'),('color_line_critical','#F96461'),('color_downtime','#FBC5E8'),('global_sort_type','host_name'),('global_sort_order','ASC'),('problem_sort_type','last_state_change'),('problem_sort_order','ASC'),('nagios_path','/usr/share/nagios'),('nagios_path_bin','/usr/sbin/nagios'),('nagios_init_script','/etc/init.d/nagios'),('nagios_path_plugins','/usr/lib/nagios/plugins/'),('nagios_version','3'),('mailer_path_bin','/bin/mail'),('snmp_community','public'),('snmp_version','1'),('snmptt_unknowntrap_log_file','snmpttunknown.log'),('snmpttconvertmib_path_bin','/usr/share/centreon/bin/snmpttconvertmib'),('perl_library_path','/usr/local/lib'),('rrdtool_path_bin','/usr/bin/rrdtool'),('rrdtool_version','1.2'),('debug_path','/var/log/centreon/'),('debug_auth','0'),('debug_nagios_import','0'),('debug_rrdtool','0'),('debug_ldap_import','0'),('debug_inventory','0'),('enable_autologin','0'),('display_autologin_shortcut','1'),('monitoring_ack_svc','1'),('monitoring_dwt_duration','3600'),('monitoring_dwt_duration_scale','s'),('monitoring_ack_active_checks','1'),('monitoring_ack_persistent','1'),('monitoring_ack_notify','0'),('monitoring_ack_sticky','1'),('monitoring_dwt_fixed','1'),('monitoring_dwt_svc','1'),('tactical_host_limit','100'),('tactical_service_limit','100'),('tactical_refresh_interval','20'),('index_data','1'),('interval_length','60'),('nagios_path_img','/usr/share/centreon/www/img/media/'),('selectPaginationSize','60');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_command_relations`
--

DROP TABLE IF EXISTS `poller_command_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_command_relations` (
  `poller_id` int(11) NOT NULL,
  `command_id` int(11) NOT NULL,
  `command_order` tinyint(3) DEFAULT NULL,
  KEY `poller_id` (`poller_id`),
  KEY `command_id` (`command_id`),
  CONSTRAINT `poller_command_relations_fk_1` FOREIGN KEY (`poller_id`) REFERENCES `nagios_server` (`id`) ON DELETE CASCADE,
  CONSTRAINT `poller_command_relations_fk_2` FOREIGN KEY (`command_id`) REFERENCES `command` (`command_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_command_relations`
--

LOCK TABLES `poller_command_relations` WRITE;
/*!40000 ALTER TABLE `poller_command_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_command_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_template_model_stm_id` int(11) DEFAULT NULL,
  `command_command_id` int(11) DEFAULT NULL,
  `timeperiod_tp_id` int(11) DEFAULT NULL,
  `command_command_id2` int(11) DEFAULT NULL,
  `timeperiod_tp_id2` int(11) DEFAULT NULL,
  `service_description` varchar(200) DEFAULT NULL,
  `service_alias` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `service_is_volatile` enum('0','1','2') DEFAULT '2',
  `service_max_check_attempts` int(11) DEFAULT NULL,
  `service_normal_check_interval` int(11) DEFAULT NULL,
  `service_retry_check_interval` int(11) DEFAULT NULL,
  `service_active_checks_enabled` enum('0','1','2') DEFAULT '2',
  `service_passive_checks_enabled` enum('0','1','2') DEFAULT '2',
  `initial_state` enum('o','w','u','c') DEFAULT NULL,
  `service_parallelize_check` enum('0','1','2') DEFAULT '2',
  `service_obsess_over_service` enum('0','1','2') DEFAULT '2',
  `service_check_freshness` enum('0','1','2') DEFAULT '2',
  `service_freshness_threshold` int(11) DEFAULT NULL,
  `service_event_handler_enabled` enum('0','1','2') DEFAULT '2',
  `service_low_flap_threshold` int(11) DEFAULT NULL,
  `service_high_flap_threshold` int(11) DEFAULT NULL,
  `service_flap_detection_enabled` enum('0','1','2') DEFAULT '2',
  `service_process_perf_data` enum('0','1','2') DEFAULT '2',
  `service_retain_status_information` enum('0','1','2') DEFAULT '2',
  `service_retain_nonstatus_information` enum('0','1','2') DEFAULT '2',
  `service_notification_interval` int(11) DEFAULT NULL,
  `service_notification_options` varchar(200) DEFAULT NULL,
  `service_notifications_enabled` enum('0','1','2') DEFAULT '2',
  `contact_additive_inheritance` tinyint(1) DEFAULT '0',
  `cg_additive_inheritance` tinyint(1) DEFAULT '0',
  `service_inherit_contacts_from_host` enum('0','1') DEFAULT '1',
  `service_first_notification_delay` int(11) DEFAULT NULL,
  `service_stalking_options` varchar(200) DEFAULT NULL,
  `service_comment` text,
  `command_command_id_arg` text,
  `command_command_id_arg2` text,
  `service_locked` tinyint(1) DEFAULT '0',
  `service_register` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `service_activate` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`service_id`),
  KEY `stm_index` (`service_template_model_stm_id`),
  KEY `cmd1_index` (`command_command_id`),
  KEY `cmd2_index` (`command_command_id2`),
  KEY `tp1_index` (`timeperiod_tp_id`),
  KEY `tp2_index` (`timeperiod_tp_id2`),
  KEY `description_index` (`service_description`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`command_command_id`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `service_ibfk_2` FOREIGN KEY (`command_command_id2`) REFERENCES `command` (`command_id`) ON DELETE SET NULL,
  CONSTRAINT `service_ibfk_3` FOREIGN KEY (`timeperiod_tp_id`) REFERENCES `timeperiod` (`tp_id`) ON DELETE SET NULL,
  CONSTRAINT `service_ibfk_4` FOREIGN KEY (`timeperiod_tp_id2`) REFERENCES `timeperiod` (`tp_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,NULL,NULL,1,NULL,1,'generic-service','generic-service',NULL,'0',3,5,1,'1','0',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',0,'w,c,r','0',0,0,'1',NULL,NULL,NULL,NULL,NULL,0,'0','1'),(3,1,6,NULL,NULL,NULL,'Ping-LAN','Ping',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!3!200,20%!400,50%',NULL,0,'0','1'),(4,1,6,NULL,NULL,NULL,'Ping-WAN','Ping',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!3!400,20%!600,50%',NULL,0,'0','1'),(5,1,8,NULL,NULL,NULL,'SNMP-DISK-/','Disk-/',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!/!80!90',NULL,0,'0','1'),(6,1,8,NULL,NULL,NULL,'SNMP-DISK-/var','Disk-/var',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!/var!80!90',NULL,0,'0','1'),(7,1,8,NULL,NULL,NULL,'SNMP-DISK-/usr','Disk-/usr',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!/usr!80!90',NULL,0,'0','1'),(8,1,8,NULL,NULL,NULL,'SNMP-DISK-/home','Disk-/home',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!/home!80!90',NULL,0,'0','1'),(9,1,8,NULL,NULL,NULL,'SNMP-DISK-/opt','Disk-/opt',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!/opt!80!90',NULL,0,'0','1'),(10,1,8,NULL,NULL,NULL,'SNMP-DISK-C:','Disk-C',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!C:!80!90',NULL,0,'0','1'),(11,1,8,NULL,NULL,NULL,'SNMP-DISK-E:','Disk-E',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!E:!80!90',NULL,0,'0','1'),(12,1,5,NULL,NULL,NULL,'SNMP-Linux-Load-Average','Load',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!4,3,2!6,5,4',NULL,0,'0','1'),(13,1,97,NULL,NULL,NULL,'SNMP-Linux-Memory','Memory',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,NULL,NULL,0,'0','1'),(14,1,8,NULL,NULL,NULL,'SNMP-Linux-Swap','Swap',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!&quot;Swap Space&quot;!80!90',NULL,0,'0','1'),(15,1,8,NULL,NULL,NULL,'SNMP-Win2K3-Memory','Memory',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!&quot;Physical Memory&quot;!80!90',NULL,0,'0','1'),(16,1,8,NULL,NULL,NULL,'SNMP-Win2K3-Swap','Swap',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!&quot;Virtual Memory&quot;!80!90',NULL,0,'0','1'),(17,1,8,NULL,NULL,NULL,'SNMP-Win2K-memory','Memory',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!&quot;Virtual Memory&quot;!80!90',NULL,0,'0','1'),(18,1,96,NULL,NULL,NULL,'SNMP-Windows-CPU','CPU',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!80!90',NULL,0,'0','1'),(19,5,NULL,NULL,NULL,NULL,'Disk-/',NULL,NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,'!\'/etc/centreon\'!80!90',NULL,0,'1','1'),(24,12,NULL,NULL,NULL,NULL,'Load',NULL,NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,NULL,NULL,0,'1','1'),(25,13,NULL,NULL,NULL,NULL,'Memory',NULL,NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,NULL,NULL,0,'1','1'),(26,3,NULL,NULL,NULL,NULL,'Ping',NULL,NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,NULL,NULL,0,'1','1'),(27,1,100,NULL,NULL,NULL,'NRPE-Disk','NRPE-Disk',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'0','1'),(28,1,98,NULL,NULL,NULL,'NRPE-CPU','NRPE-CPU',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'0','1'),(29,1,99,NULL,NULL,NULL,'NRPE-Memory','NRPE-Memory',NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'0','1'),(30,3,NULL,NULL,NULL,NULL,'Ping',NULL,NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'1','1'),(31,27,NULL,NULL,NULL,NULL,'NRPE-Disk',NULL,NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'1','1'),(32,28,NULL,NULL,NULL,NULL,'NRPE-CPU',NULL,NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'1','1'),(35,3,NULL,NULL,NULL,NULL,'Ping',NULL,NULL,'2',NULL,NULL,NULL,'2','2',NULL,'2','2','2',NULL,'2',NULL,NULL,'2','2','2','2',NULL,NULL,'2',0,0,'1',NULL,NULL,NULL,NULL,NULL,0,'1','1');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_categories`
--

DROP TABLE IF EXISTS `service_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_categories` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(255) DEFAULT NULL,
  `sc_description` varchar(255) DEFAULT NULL,
  `level` tinyint(5) DEFAULT NULL,
  `icon_id` int(11) DEFAULT NULL,
  `sc_activate` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Services Catygories For best Reporting';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_categories`
--

LOCK TABLES `service_categories` WRITE;
/*!40000 ALTER TABLE `service_categories` DISABLE KEYS */;
INSERT INTO `service_categories` VALUES (1,'Ping','ping',NULL,NULL,'1'),(2,'Traffic','Traffic',NULL,NULL,'1'),(3,'Disk','Disk',NULL,NULL,'0'),(4,'Memory','Memory',NULL,NULL,'0');
/*!40000 ALTER TABLE `service_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_categories_relation`
--

DROP TABLE IF EXISTS `service_categories_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_categories_relation` (
  `scr_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_service_id` int(11) DEFAULT NULL,
  `sc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`scr_id`),
  KEY `service_service_id` (`service_service_id`),
  KEY `sc_id` (`sc_id`),
  CONSTRAINT `service_categories_relation_ibfk_1` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `service_categories_relation_ibfk_2` FOREIGN KEY (`sc_id`) REFERENCES `service_categories` (`sc_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_categories_relation`
--

LOCK TABLES `service_categories_relation` WRITE;
/*!40000 ALTER TABLE `service_categories_relation` DISABLE KEYS */;
INSERT INTO `service_categories_relation` VALUES (70,5,3),(71,8,3),(72,9,3),(73,7,3),(74,6,3),(75,10,3),(76,11,3),(78,14,4),(79,17,4),(80,15,4),(81,16,4),(82,3,1),(83,4,1),(84,13,4);
/*!40000 ALTER TABLE `service_categories_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicegroup`
--

DROP TABLE IF EXISTS `servicegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicegroup` (
  `sg_id` int(11) NOT NULL AUTO_INCREMENT,
  `sg_name` varchar(200) DEFAULT NULL,
  `sg_alias` varchar(200) DEFAULT NULL,
  `sg_comment` text,
  `sg_activate` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`sg_id`),
  KEY `name_index` (`sg_name`),
  KEY `alias_index` (`sg_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicegroup`
--

LOCK TABLES `servicegroup` WRITE;
/*!40000 ALTER TABLE `servicegroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicegroup_relation`
--

DROP TABLE IF EXISTS `servicegroup_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicegroup_relation` (
  `sgr_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_host_id` int(11) DEFAULT NULL,
  `hostgroup_hg_id` int(11) DEFAULT NULL,
  `service_service_id` int(11) DEFAULT NULL,
  `servicegroup_sg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sgr_id`),
  KEY `service_index` (`service_service_id`),
  KEY `servicegroup_index` (`servicegroup_sg_id`),
  KEY `host_host_id` (`host_host_id`),
  KEY `hostgroup_hg_id` (`hostgroup_hg_id`),
  CONSTRAINT `servicegroup_relation_ibfk_10` FOREIGN KEY (`servicegroup_sg_id`) REFERENCES `servicegroup` (`sg_id`) ON DELETE CASCADE,
  CONSTRAINT `servicegroup_relation_ibfk_7` FOREIGN KEY (`host_host_id`) REFERENCES `host` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `servicegroup_relation_ibfk_8` FOREIGN KEY (`hostgroup_hg_id`) REFERENCES `hostgroup` (`hg_id`) ON DELETE CASCADE,
  CONSTRAINT `servicegroup_relation_ibfk_9` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicegroup_relation`
--

LOCK TABLES `servicegroup_relation` WRITE;
/*!40000 ALTER TABLE `servicegroup_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicegroup_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(256) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `current_page` int(11) DEFAULT NULL,
  `last_reload` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `s_nbHostsUp` int(11) DEFAULT NULL,
  `s_nbHostsDown` int(11) DEFAULT NULL,
  `s_nbHostsUnreachable` int(11) DEFAULT NULL,
  `s_nbHostsPending` int(11) DEFAULT NULL,
  `s_nbServicesOk` int(11) DEFAULT NULL,
  `s_nbServicesWarning` int(11) DEFAULT NULL,
  `s_nbServicesCritical` int(11) DEFAULT NULL,
  `s_nbServicesPending` int(11) DEFAULT NULL,
  `s_nbServicesUnknown` int(11) DEFAULT NULL,
  `update_acl` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`(255)),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (17,'ofa5c5n8cgi73smcaktmlph9k7',1,1,1474249395,'192.168.127.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiod`
--

DROP TABLE IF EXISTS `timeperiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiod` (
  `tp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_name` varchar(200) DEFAULT NULL,
  `tp_alias` varchar(20) DEFAULT NULL,
  `tp_sunday` varchar(2048) DEFAULT NULL,
  `tp_monday` varchar(2048) DEFAULT NULL,
  `tp_tuesday` varchar(2048) DEFAULT NULL,
  `tp_wednesday` varchar(2048) DEFAULT NULL,
  `tp_thursday` varchar(2048) DEFAULT NULL,
  `tp_friday` varchar(2048) DEFAULT NULL,
  `tp_saturday` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`tp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiod`
--

LOCK TABLES `timeperiod` WRITE;
/*!40000 ALTER TABLE `timeperiod` DISABLE KEYS */;
INSERT INTO `timeperiod` VALUES (1,'24x7','24_Hours_A_Day,_7_Da','00:00-24:00','00:00-24:00','00:00-24:00','00:00-24:00','00:00-24:00','00:00-24:00','00:00-24:00'),(2,'none','No Time Is A Good Ti','','','','','','',''),(3,'nonworkhours','Non-Work Hours','00:00-24:00','00:00-09:00,17:00-24:00','00:00-09:00,17:00-24:00','00:00-09:00,17:00-24:00','00:00-09:00,17:00-24:00','00:00-09:00,17:00-24:00','00:00-24:00'),(4,'workhours','Work hours','','09:00-17:00','09:00-17:00','09:00-17:00','09:00-17:00','09:00-17:00','');
/*!40000 ALTER TABLE `timeperiod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiod_exceptions`
--

DROP TABLE IF EXISTS `timeperiod_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiod_exceptions` (
  `exception_id` int(11) NOT NULL AUTO_INCREMENT,
  `timeperiod_id` int(11) NOT NULL,
  `days` varchar(255) NOT NULL,
  `timerange` varchar(255) NOT NULL,
  PRIMARY KEY (`exception_id`),
  KEY `timeperiod_exceptions_relation_ibfk_1` (`timeperiod_id`),
  CONSTRAINT `timeperiod_exceptions_relation_ibfk_1` FOREIGN KEY (`timeperiod_id`) REFERENCES `timeperiod` (`tp_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiod_exceptions`
--

LOCK TABLES `timeperiod_exceptions` WRITE;
/*!40000 ALTER TABLE `timeperiod_exceptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeperiod_exceptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiod_exclude_relations`
--

DROP TABLE IF EXISTS `timeperiod_exclude_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiod_exclude_relations` (
  `exclude_id` int(11) NOT NULL AUTO_INCREMENT,
  `timeperiod_id` int(11) NOT NULL,
  `timeperiod_exclude_id` int(11) NOT NULL,
  PRIMARY KEY (`exclude_id`),
  KEY `timeperiod_id` (`timeperiod_id`),
  KEY `timeperiod_exclude_id` (`timeperiod_exclude_id`),
  CONSTRAINT `timeperiod_exclude_relations_ibfk_1` FOREIGN KEY (`timeperiod_id`) REFERENCES `timeperiod` (`tp_id`) ON DELETE CASCADE,
  CONSTRAINT `timeperiod_exclude_relations_ibfk_2` FOREIGN KEY (`timeperiod_exclude_id`) REFERENCES `timeperiod` (`tp_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiod_exclude_relations`
--

LOCK TABLES `timeperiod_exclude_relations` WRITE;
/*!40000 ALTER TABLE `timeperiod_exclude_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeperiod_exclude_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiod_include_relations`
--

DROP TABLE IF EXISTS `timeperiod_include_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiod_include_relations` (
  `include_id` int(11) NOT NULL AUTO_INCREMENT,
  `timeperiod_id` int(11) NOT NULL,
  `timeperiod_include_id` int(11) NOT NULL,
  PRIMARY KEY (`include_id`),
  KEY `timeperiod_id` (`timeperiod_id`),
  KEY `timeperiod_include_id` (`timeperiod_include_id`),
  CONSTRAINT `timeperiod_include_relations_ibfk_1` FOREIGN KEY (`timeperiod_id`) REFERENCES `timeperiod` (`tp_id`) ON DELETE CASCADE,
  CONSTRAINT `timeperiod_include_relations_ibfk_2` FOREIGN KEY (`timeperiod_include_id`) REFERENCES `timeperiod` (`tp_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiod_include_relations`
--

LOCK TABLES `timeperiod_include_relations` WRITE;
/*!40000 ALTER TABLE `timeperiod_include_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeperiod_include_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezone` (
  `timezone_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `timezone_name` varchar(200) NOT NULL,
  `timezone_offset` varchar(200) NOT NULL,
  `timezone_dst_offset` varchar(200) NOT NULL,
  `timezone_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`timezone_id`),
  UNIQUE KEY `name` (`timezone_name`)
) ENGINE=InnoDB AUTO_INCREMENT=419 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezone`
--

LOCK TABLES `timezone` WRITE;
/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;
INSERT INTO `timezone` VALUES (1,'Africa/Abidjan','-00:00','-00:00',NULL),(2,'Africa/Accra','-00:00','-00:00',NULL),(3,'Africa/Addis_Ababa','+03:00','+03:00',NULL),(4,'Africa/Algiers','+01:00','+01:00',NULL),(5,'Africa/Asmara','+03:00','+03:00',NULL),(6,'Africa/Bamako','-00:00','-00:00',NULL),(7,'Africa/Bangui','+01:00','+01:00',NULL),(8,'Africa/Banjul','-00:00','-00:00',NULL),(9,'Africa/Bissau','-00:00','-00:00',NULL),(10,'Africa/Blantyre','+02:00','+02:00',NULL),(11,'Africa/Brazzaville','+01:00','+01:00',NULL),(12,'Africa/Bujumbura','+02:00','+02:00',NULL),(13,'Africa/Cairo','+02:00','+02:00',NULL),(14,'Africa/Casablanca','-00:00','+01:00',NULL),(15,'Africa/Ceuta','+01:00','+02:00',NULL),(16,'Africa/Conakry','-00:00','-00:00',NULL),(17,'Africa/Dakar','-00:00','-00:00',NULL),(18,'Africa/Dar_es_Salaam','+03:00','+03:00',NULL),(19,'Africa/Djibouti','+03:00','+03:00',NULL),(20,'Africa/Douala','+01:00','+01:00',NULL),(21,'Africa/El_Aaiun','-00:00','+01:00',NULL),(22,'Africa/Freetown','-00:00','-00:00',NULL),(23,'Africa/Gaborone','+02:00','+02:00',NULL),(24,'Africa/Harare','+02:00','+02:00',NULL),(25,'Africa/Johannesburg','+02:00','+02:00',NULL),(26,'Africa/Juba','+03:00','+03:00',NULL),(27,'Africa/Kampala','+03:00','+03:00',NULL),(28,'Africa/Khartoum','+03:00','+03:00',NULL),(29,'Africa/Kigali','+02:00','+02:00',NULL),(30,'Africa/Kinshasa','+01:00','+01:00',NULL),(31,'Africa/Lagos','+01:00','+01:00',NULL),(32,'Africa/Libreville','+01:00','+01:00',NULL),(33,'Africa/Lome','-00:00','-00:00',NULL),(34,'Africa/Luanda','+01:00','+01:00',NULL),(35,'Africa/Lubumbashi','+02:00','+02:00',NULL),(36,'Africa/Lusaka','+02:00','+02:00',NULL),(37,'Africa/Malabo','+01:00','+01:00',NULL),(38,'Africa/Maputo','+02:00','+02:00',NULL),(39,'Africa/Maseru','+02:00','+02:00',NULL),(40,'Africa/Mbabane','+02:00','+02:00',NULL),(41,'Africa/Mogadishu','+03:00','+03:00',NULL),(42,'Africa/Monrovia','-00:00','-00:00',NULL),(43,'Africa/Nairobi','+03:00','+03:00',NULL),(44,'Africa/Ndjamena','+01:00','+01:00',NULL),(45,'Africa/Niamey','+01:00','+01:00',NULL),(46,'Africa/Nouakchott','-00:00','-00:00',NULL),(47,'Africa/Ouagadougou','-00:00','-00:00',NULL),(48,'Africa/Porto-Novo','+01:00','+01:00',NULL),(49,'Africa/Sao_Tome','-00:00','-00:00',NULL),(50,'Africa/Tripoli','+02:00','+02:00',NULL),(51,'Africa/Tunis','+01:00','+01:00',NULL),(52,'Africa/Windhoek','+02:00','+01:00',NULL),(53,'America/Adak','-10:00','-09:00',NULL),(54,'America/Anchorage','-09:00','-08:00',NULL),(55,'America/Anguilla','-04:00','-04:00',NULL),(56,'America/Antigua','-04:00','-04:00',NULL),(57,'America/Araguaina','-03:00','-03:00',NULL),(58,'America/Argentina/Buenos_Aires','-03:00','-03:00',NULL),(59,'America/Argentina/Catamarca','-03:00','-03:00',NULL),(60,'America/Argentina/Cordoba','-03:00','-03:00',NULL),(61,'America/Argentina/Jujuy','-03:00','-03:00',NULL),(62,'America/Argentina/La_Rioja','-03:00','-03:00',NULL),(63,'America/Argentina/Mendoza','-03:00','-03:00',NULL),(64,'America/Argentina/Rio_Gallegos','-03:00','-03:00',NULL),(65,'America/Argentina/Salta','-03:00','-03:00',NULL),(66,'America/Argentina/San_Juan','-03:00','-03:00',NULL),(67,'America/Argentina/San_Luis','-03:00','-03:00',NULL),(68,'America/Argentina/Tucuman','-03:00','-03:00',NULL),(69,'America/Argentina/Ushuaia','-03:00','-03:00',NULL),(70,'America/Aruba','-04:00','-04:00',NULL),(71,'America/Asuncion','-03:00','-04:00',NULL),(72,'America/Atikokan','-05:00','-05:00',NULL),(73,'America/Bahia','-03:00','-03:00',NULL),(74,'America/Bahia_Banderas','-06:00','-05:00',NULL),(75,'America/Barbados','-04:00','-04:00',NULL),(76,'America/Belem','-03:00','-03:00',NULL),(77,'America/Belize','-06:00','-06:00',NULL),(78,'America/Blanc-Sablon','-04:00','-04:00',NULL),(79,'America/Boa_Vista','-04:00','-04:00',NULL),(80,'America/Bogota','-05:00','-05:00',NULL),(81,'America/Boise','-07:00','-06:00',NULL),(82,'America/Cambridge_Bay','-07:00','-06:00',NULL),(83,'America/Campo_Grande','-03:00','-04:00',NULL),(84,'America/Cancun','-06:00','-05:00',NULL),(85,'America/Caracas','-04:30','-04:30',NULL),(86,'America/Cayenne','-03:00','-03:00',NULL),(87,'America/Cayman','-05:00','-05:00',NULL),(88,'America/Chicago','-06:00','-05:00',NULL),(89,'America/Chihuahua','-07:00','-06:00',NULL),(90,'America/Costa_Rica','-06:00','-06:00',NULL),(91,'America/Creston','-07:00','-07:00',NULL),(92,'America/Cuiaba','-03:00','-04:00',NULL),(93,'America/Curacao','-04:00','-04:00',NULL),(94,'America/Danmarkshavn','-00:00','-00:00',NULL),(95,'America/Dawson','-08:00','-07:00',NULL),(96,'America/Dawson_Creek','-07:00','-07:00',NULL),(97,'America/Denver','-07:00','-06:00',NULL),(98,'America/Detroit','-05:00','-04:00',NULL),(99,'America/Dominica','-04:00','-04:00',NULL),(100,'America/Edmonton','-07:00','-06:00',NULL),(101,'America/Eirunepe','-05:00','-05:00',NULL),(102,'America/El_Salvador','-06:00','-06:00',NULL),(103,'America/Fortaleza','-03:00','-03:00',NULL),(104,'America/Glace_Bay','-04:00','-03:00',NULL),(105,'America/Godthab','-03:00','-02:00',NULL),(106,'America/Goose_Bay','-04:00','-03:00',NULL),(107,'America/Grand_Turk','-05:00','-04:00',NULL),(108,'America/Grenada','-04:00','-04:00',NULL),(109,'America/Guadeloupe','-04:00','-04:00',NULL),(110,'America/Guatemala','-06:00','-06:00',NULL),(111,'America/Guayaquil','-05:00','-05:00',NULL),(112,'America/Guyana','-04:00','-04:00',NULL),(113,'America/Halifax','-04:00','-03:00',NULL),(114,'America/Havana','-05:00','-04:00',NULL),(115,'America/Hermosillo','-07:00','-07:00',NULL),(116,'America/Indiana/Indianapolis','-05:00','-04:00',NULL),(117,'America/Indiana/Knox','-06:00','-05:00',NULL),(118,'America/Indiana/Marengo','-05:00','-04:00',NULL),(119,'America/Indiana/Petersburg','-05:00','-04:00',NULL),(120,'America/Indiana/Tell_City','-06:00','-05:00',NULL),(121,'America/Indiana/Vevay','-05:00','-04:00',NULL),(122,'America/Indiana/Vincennes','-05:00','-04:00',NULL),(123,'America/Indiana/Winamac','-05:00','-04:00',NULL),(124,'America/Inuvik','-07:00','-06:00',NULL),(125,'America/Iqaluit','-05:00','-04:00',NULL),(126,'America/Jamaica','-05:00','-05:00',NULL),(127,'America/Juneau','-09:00','-08:00',NULL),(128,'America/Kentucky/Louisville','-05:00','-04:00',NULL),(129,'America/Kentucky/Monticello','-05:00','-04:00',NULL),(130,'America/Kralendijk','-04:00','-04:00',NULL),(131,'America/La_Paz','-04:00','-04:00',NULL),(132,'America/Lima','-05:00','-05:00',NULL),(133,'America/Los_Angeles','-08:00','-07:00',NULL),(134,'America/Lower_Princes','-04:00','-04:00',NULL),(135,'America/Maceio','-03:00','-03:00',NULL),(136,'America/Managua','-06:00','-06:00',NULL),(137,'America/Manaus','-04:00','-04:00',NULL),(138,'America/Marigot','-04:00','-04:00',NULL),(139,'America/Martinique','-04:00','-04:00',NULL),(140,'America/Matamoros','-06:00','-05:00',NULL),(141,'America/Mazatlan','-07:00','-06:00',NULL),(142,'America/Menominee','-06:00','-05:00',NULL),(143,'America/Merida','-06:00','-05:00',NULL),(144,'America/Metlakatla','-08:00','-08:00',NULL),(145,'America/Mexico_City','-06:00','-05:00',NULL),(146,'America/Miquelon','-03:00','-02:00',NULL),(147,'America/Moncton','-04:00','-03:00',NULL),(148,'America/Monterrey','-06:00','-05:00',NULL),(149,'America/Montevideo','-02:00','-03:00',NULL),(150,'America/Montserrat','-04:00','-04:00',NULL),(151,'America/Nassau','-05:00','-04:00',NULL),(152,'America/New_York','-05:00','-04:00',NULL),(153,'America/Nipigon','-05:00','-04:00',NULL),(154,'America/Nome','-09:00','-08:00',NULL),(155,'America/Noronha','-02:00','-02:00',NULL),(156,'America/North_Dakota/Beulah','-06:00','-05:00',NULL),(157,'America/North_Dakota/Center','-06:00','-05:00',NULL),(158,'America/North_Dakota/New_Salem','-06:00','-05:00',NULL),(159,'America/Ojinaga','-07:00','-06:00',NULL),(160,'America/Panama','-05:00','-05:00',NULL),(161,'America/Pangnirtung','-05:00','-04:00',NULL),(162,'America/Paramaribo','-03:00','-03:00',NULL),(163,'America/Phoenix','-07:00','-07:00',NULL),(164,'America/Port-au-Prince','-05:00','-04:00',NULL),(165,'America/Port_of_Spain','-04:00','-04:00',NULL),(166,'America/Porto_Velho','-04:00','-04:00',NULL),(167,'America/Puerto_Rico','-04:00','-04:00',NULL),(168,'America/Rainy_River','-06:00','-05:00',NULL),(169,'America/Rankin_Inlet','-06:00','-05:00',NULL),(170,'America/Recife','-03:00','-03:00',NULL),(171,'America/Regina','-06:00','-06:00',NULL),(172,'America/Resolute','-06:00','-05:00',NULL),(173,'America/Rio_Branco','-05:00','-05:00',NULL),(174,'America/Santa_Isabel','-08:00','-07:00',NULL),(175,'America/Santarem','-03:00','-03:00',NULL),(176,'America/Santiago','-03:00','-03:00',NULL),(177,'America/Santo_Domingo','-04:00','-04:00',NULL),(178,'America/Sao_Paulo','-02:00','-03:00',NULL),(179,'America/Scoresbysund','-01:00','-00:00',NULL),(180,'America/Sitka','-09:00','-08:00',NULL),(181,'America/St_Barthelemy','-04:00','-04:00',NULL),(182,'America/St_Johns','-03:30','-02:30',NULL),(183,'America/St_Kitts','-04:00','-04:00',NULL),(184,'America/St_Lucia','-04:00','-04:00',NULL),(185,'America/St_Thomas','-04:00','-04:00',NULL),(186,'America/St_Vincent','-04:00','-04:00',NULL),(187,'America/Swift_Current','-06:00','-06:00',NULL),(188,'America/Tegucigalpa','-06:00','-06:00',NULL),(189,'America/Thule','-04:00','-03:00',NULL),(190,'America/Thunder_Bay','-05:00','-04:00',NULL),(191,'America/Tijuana','-08:00','-07:00',NULL),(192,'America/Toronto','-05:00','-04:00',NULL),(193,'America/Tortola','-04:00','-04:00',NULL),(194,'America/Vancouver','-08:00','-07:00',NULL),(195,'America/Whitehorse','-08:00','-07:00',NULL),(196,'America/Winnipeg','-06:00','-05:00',NULL),(197,'America/Yakutat','-09:00','-08:00',NULL),(198,'America/Yellowknife','-07:00','-06:00',NULL),(199,'Antarctica/Casey','+08:00','+08:00',NULL),(200,'Antarctica/Davis','+07:00','+07:00',NULL),(201,'Antarctica/DumontDUrville','+10:00','+10:00',NULL),(202,'Antarctica/Macquarie','+11:00','+11:00',NULL),(203,'Antarctica/Mawson','+05:00','+05:00',NULL),(204,'Antarctica/McMurdo','+13:00','+12:00',NULL),(205,'Antarctica/Palmer','-03:00','-03:00',NULL),(206,'Antarctica/Rothera','-03:00','-03:00',NULL),(207,'Antarctica/Syowa','+03:00','+03:00',NULL),(208,'Antarctica/Troll','+02:00','+02:00',NULL),(209,'Antarctica/Vostok','+06:00','+06:00',NULL),(210,'Arctic/Longyearbyen','+01:00','+02:00',NULL),(211,'Asia/Aden','+03:00','+03:00',NULL),(212,'Asia/Almaty','+06:00','+06:00',NULL),(213,'Asia/Amman','+02:00','+03:00',NULL),(214,'Asia/Anadyr','+12:00','+12:00',NULL),(215,'Asia/Aqtau','+05:00','+05:00',NULL),(216,'Asia/Aqtobe','+05:00','+05:00',NULL),(217,'Asia/Ashgabat','+05:00','+05:00',NULL),(218,'Asia/Baghdad','+03:00','+03:00',NULL),(219,'Asia/Bahrain','+03:00','+03:00',NULL),(220,'Asia/Baku','+04:00','+05:00',NULL),(221,'Asia/Bangkok','+07:00','+07:00',NULL),(222,'Asia/Beirut','+02:00','+03:00',NULL),(223,'Asia/Bishkek','+06:00','+06:00',NULL),(224,'Asia/Brunei','+08:00','+08:00',NULL),(225,'Asia/Chita','+08:00','+08:00',NULL),(226,'Asia/Choibalsan','+08:00','+09:00',NULL),(227,'Asia/Colombo','+05:30','+05:30',NULL),(228,'Asia/Damascus','+02:00','+03:00',NULL),(229,'Asia/Dhaka','+06:00','+06:00',NULL),(230,'Asia/Dili','+09:00','+09:00',NULL),(231,'Asia/Dubai','+04:00','+04:00',NULL),(232,'Asia/Dushanbe','+05:00','+05:00',NULL),(233,'Asia/Gaza','+02:00','+03:00',NULL),(234,'Asia/Hebron','+02:00','+03:00',NULL),(235,'Asia/Ho_Chi_Minh','+07:00','+07:00',NULL),(236,'Asia/Hong_Kong','+08:00','+08:00',NULL),(237,'Asia/Hovd','+07:00','+08:00',NULL),(238,'Asia/Irkutsk','+08:00','+08:00',NULL),(239,'Asia/Jakarta','+07:00','+07:00',NULL),(240,'Asia/Jayapura','+09:00','+09:00',NULL),(241,'Asia/Jerusalem','+02:00','+03:00',NULL),(242,'Asia/Kabul','+04:30','+04:30',NULL),(243,'Asia/Kamchatka','+12:00','+12:00',NULL),(244,'Asia/Karachi','+05:00','+05:00',NULL),(245,'Asia/Kathmandu','+05:45','+05:45',NULL),(246,'Asia/Khandyga','+09:00','+09:00',NULL),(247,'Asia/Kolkata','+05:30','+05:30',NULL),(248,'Asia/Krasnoyarsk','+07:00','+07:00',NULL),(249,'Asia/Kuala_Lumpur','+08:00','+08:00',NULL),(250,'Asia/Kuching','+08:00','+08:00',NULL),(251,'Asia/Kuwait','+03:00','+03:00',NULL),(252,'Asia/Macau','+08:00','+08:00',NULL),(253,'Asia/Magadan','+10:00','+10:00',NULL),(254,'Asia/Makassar','+08:00','+08:00',NULL),(255,'Asia/Manila','+08:00','+08:00',NULL),(256,'Asia/Muscat','+04:00','+04:00',NULL),(257,'Asia/Nicosia','+02:00','+03:00',NULL),(258,'Asia/Novokuznetsk','+07:00','+07:00',NULL),(259,'Asia/Novosibirsk','+06:00','+06:00',NULL),(260,'Asia/Omsk','+06:00','+06:00',NULL),(261,'Asia/Oral','+05:00','+05:00',NULL),(262,'Asia/Phnom_Penh','+07:00','+07:00',NULL),(263,'Asia/Pontianak','+07:00','+07:00',NULL),(264,'Asia/Pyongyang','+09:00','+09:00',NULL),(265,'Asia/Qatar','+03:00','+03:00',NULL),(266,'Asia/Qyzylorda','+06:00','+06:00',NULL),(267,'Asia/Rangoon','+06:30','+06:30',NULL),(268,'Asia/Riyadh','+03:00','+03:00',NULL),(269,'Asia/Sakhalin','+10:00','+10:00',NULL),(270,'Asia/Samarkand','+05:00','+05:00',NULL),(271,'Asia/Seoul','+09:00','+09:00',NULL),(272,'Asia/Shanghai','+08:00','+08:00',NULL),(273,'Asia/Singapore','+08:00','+08:00',NULL),(274,'Asia/Srednekolymsk','+11:00','+11:00',NULL),(275,'Asia/Taipei','+08:00','+08:00',NULL),(276,'Asia/Tashkent','+05:00','+05:00',NULL),(277,'Asia/Tbilisi','+04:00','+04:00',NULL),(278,'Asia/Tehran','+03:30','+04:30',NULL),(279,'Asia/Thimphu','+06:00','+06:00',NULL),(280,'Asia/Tokyo','+09:00','+09:00',NULL),(281,'Asia/Ulaanbaatar','+08:00','+09:00',NULL),(282,'Asia/Urumqi','+06:00','+06:00',NULL),(283,'Asia/Ust-Nera','+10:00','+10:00',NULL),(284,'Asia/Vientiane','+07:00','+07:00',NULL),(285,'Asia/Vladivostok','+10:00','+10:00',NULL),(286,'Asia/Yakutsk','+09:00','+09:00',NULL),(287,'Asia/Yekaterinburg','+05:00','+05:00',NULL),(288,'Asia/Yerevan','+04:00','+04:00',NULL),(289,'Atlantic/Azores','-01:00','-00:00',NULL),(290,'Atlantic/Bermuda','-04:00','-03:00',NULL),(291,'Atlantic/Canary','-00:00','+01:00',NULL),(292,'Atlantic/Cape_Verde','-01:00','-01:00',NULL),(293,'Atlantic/Faroe','-00:00','+01:00',NULL),(294,'Atlantic/Madeira','-00:00','+01:00',NULL),(295,'Atlantic/Reykjavik','-00:00','-00:00',NULL),(296,'Atlantic/South_Georgia','-02:00','-02:00',NULL),(297,'Atlantic/St_Helena','-00:00','-00:00',NULL),(298,'Atlantic/Stanley','-03:00','-03:00',NULL),(299,'Australia/Adelaide','+10:30','+09:30',NULL),(300,'Australia/Brisbane','+10:00','+10:00',NULL),(301,'Australia/Broken_Hill','+10:30','+09:30',NULL),(302,'Australia/Currie','+11:00','+10:00',NULL),(303,'Australia/Darwin','+09:30','+09:30',NULL),(304,'Australia/Eucla','+08:45','+08:45',NULL),(305,'Australia/Hobart','+11:00','+10:00',NULL),(306,'Australia/Lindeman','+10:00','+10:00',NULL),(307,'Australia/Lord_Howe','+11:00','+10:30',NULL),(308,'Australia/Melbourne','+11:00','+10:00',NULL),(309,'Australia/Perth','+08:00','+08:00',NULL),(310,'Australia/Sydney','+11:00','+10:00',NULL),(311,'Europe/Amsterdam','+01:00','+02:00',NULL),(312,'Europe/Andorra','+01:00','+02:00',NULL),(313,'Europe/Athens','+02:00','+03:00',NULL),(314,'Europe/Belgrade','+01:00','+02:00',NULL),(315,'Europe/Berlin','+01:00','+02:00',NULL),(316,'Europe/Bratislava','+01:00','+02:00',NULL),(317,'Europe/Brussels','+01:00','+02:00',NULL),(318,'Europe/Bucharest','+02:00','+03:00',NULL),(319,'Europe/Budapest','+01:00','+02:00',NULL),(320,'Europe/Busingen','+01:00','+02:00',NULL),(321,'Europe/Chisinau','+02:00','+03:00',NULL),(322,'Europe/Copenhagen','+01:00','+02:00',NULL),(323,'Europe/Dublin','-00:00','+01:00',NULL),(324,'Europe/Gibraltar','+01:00','+02:00',NULL),(325,'Europe/Guernsey','-00:00','+01:00',NULL),(326,'Europe/Helsinki','+02:00','+03:00',NULL),(327,'Europe/Isle_of_Man','-00:00','+01:00',NULL),(328,'Europe/Istanbul','+02:00','+03:00',NULL),(329,'Europe/Jersey','-00:00','+01:00',NULL),(330,'Europe/Kaliningrad','+02:00','+02:00',NULL),(331,'Europe/Kiev','+02:00','+03:00',NULL),(332,'Europe/Lisbon','-00:00','+01:00',NULL),(333,'Europe/Ljubljana','+01:00','+02:00',NULL),(334,'Europe/London','-00:00','+01:00',NULL),(335,'Europe/Luxembourg','+01:00','+02:00',NULL),(336,'Europe/Madrid','+01:00','+02:00',NULL),(337,'Europe/Malta','+01:00','+02:00',NULL),(338,'Europe/Mariehamn','+02:00','+03:00',NULL),(339,'Europe/Minsk','+03:00','+03:00',NULL),(340,'Europe/Monaco','+01:00','+02:00',NULL),(341,'Europe/Moscow','+03:00','+03:00',NULL),(342,'Europe/Oslo','+01:00','+02:00',NULL),(343,'Europe/Paris','+01:00','+02:00',NULL),(344,'Europe/Podgorica','+01:00','+02:00',NULL),(345,'Europe/Prague','+01:00','+02:00',NULL),(346,'Europe/Riga','+02:00','+03:00',NULL),(347,'Europe/Rome','+01:00','+02:00',NULL),(348,'Europe/Samara','+04:00','+04:00',NULL),(349,'Europe/San_Marino','+01:00','+02:00',NULL),(350,'Europe/Sarajevo','+01:00','+02:00',NULL),(351,'Europe/Simferopol','+03:00','+03:00',NULL),(352,'Europe/Skopje','+01:00','+02:00',NULL),(353,'Europe/Sofia','+02:00','+03:00',NULL),(354,'Europe/Stockholm','+01:00','+02:00',NULL),(355,'Europe/Tallinn','+02:00','+03:00',NULL),(356,'Europe/Tirane','+01:00','+02:00',NULL),(357,'Europe/Uzhgorod','+02:00','+03:00',NULL),(358,'Europe/Vaduz','+01:00','+02:00',NULL),(359,'Europe/Vatican','+01:00','+02:00',NULL),(360,'Europe/Vienna','+01:00','+02:00',NULL),(361,'Europe/Vilnius','+02:00','+03:00',NULL),(362,'Europe/Volgograd','+03:00','+03:00',NULL),(363,'Europe/Warsaw','+01:00','+02:00',NULL),(364,'Europe/Zagreb','+01:00','+02:00',NULL),(365,'Europe/Zaporozhye','+02:00','+03:00',NULL),(366,'Europe/Zurich','+01:00','+02:00',NULL),(367,'Indian/Antananarivo','+03:00','+03:00',NULL),(368,'Indian/Chagos','+06:00','+06:00',NULL),(369,'Indian/Christmas','+07:00','+07:00',NULL),(370,'Indian/Cocos','+06:30','+06:30',NULL),(371,'Indian/Comoro','+03:00','+03:00',NULL),(372,'Indian/Kerguelen','+05:00','+05:00',NULL),(373,'Indian/Mahe','+04:00','+04:00',NULL),(374,'Indian/Maldives','+05:00','+05:00',NULL),(375,'Indian/Mauritius','+04:00','+04:00',NULL),(376,'Indian/Mayotte','+03:00','+03:00',NULL),(377,'Indian/Reunion','+04:00','+04:00',NULL),(378,'Pacific/Apia','+14:00','+13:00',NULL),(379,'Pacific/Auckland','+13:00','+12:00',NULL),(380,'Pacific/Bougainville','+11:00','+11:00',NULL),(381,'Pacific/Chatham','+13:45','+12:45',NULL),(382,'Pacific/Chuuk','+10:00','+10:00',NULL),(383,'Pacific/Easter','-05:00','-05:00',NULL),(384,'Pacific/Efate','+11:00','+11:00',NULL),(385,'Pacific/Enderbury','+13:00','+13:00',NULL),(386,'Pacific/Fakaofo','+13:00','+13:00',NULL),(387,'Pacific/Fiji','+13:00','+12:00',NULL),(388,'Pacific/Funafuti','+12:00','+12:00',NULL),(389,'Pacific/Galapagos','-06:00','-06:00',NULL),(390,'Pacific/Gambier','-08:59','-08:59',NULL),(391,'Pacific/Guadalcanal','+11:00','+11:00',NULL),(392,'Pacific/Guam','+10:00','+10:00',NULL),(393,'Pacific/Honolulu','-10:00','-10:00',NULL),(394,'Pacific/Johnston','-10:00','-10:00',NULL),(395,'Pacific/Kiritimati','+14:00','+14:00',NULL),(396,'Pacific/Kosrae','+11:00','+11:00',NULL),(397,'Pacific/Kwajalein','+12:00','+12:00',NULL),(398,'Pacific/Majuro','+12:00','+12:00',NULL),(399,'Pacific/Marquesas','-09:30','-09:30',NULL),(400,'Pacific/Midway','-11:00','-11:00',NULL),(401,'Pacific/Nauru','+12:00','+12:00',NULL),(402,'Pacific/Niue','-11:00','-11:00',NULL),(403,'Pacific/Norfolk','+11:30','+11:30',NULL),(404,'Pacific/Noumea','+11:00','+11:00',NULL),(405,'Pacific/Pago_Pago','-11:00','-11:00',NULL),(406,'Pacific/Palau','+09:00','+09:00',NULL),(407,'Pacific/Pitcairn','-08:00','-08:00',NULL),(408,'Pacific/Pohnpei','+11:00','+11:00',NULL),(409,'Pacific/Port_Moresby','+10:00','+10:00',NULL),(410,'Pacific/Rarotonga','-10:00','-10:00',NULL),(411,'Pacific/Saipan','+10:00','+10:00',NULL),(412,'Pacific/Tahiti','-10:00','-10:00',NULL),(413,'Pacific/Tarawa','+12:00','+12:00',NULL),(414,'Pacific/Tongatapu','+13:00','+13:00',NULL),(415,'Pacific/Wake','+12:00','+12:00',NULL),(416,'Pacific/Wallis','+12:00','+12:00',NULL),(417,'GMT','-00:00','-00:00',NULL),(418,'UTC','-00:00','-00:00',NULL);
/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topology`
--

DROP TABLE IF EXISTS `topology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topology` (
  `topology_id` int(11) NOT NULL AUTO_INCREMENT,
  `topology_name` varchar(255) DEFAULT NULL,
  `topology_icone` varchar(255) DEFAULT NULL,
  `topology_parent` int(11) DEFAULT NULL,
  `topology_page` int(11) DEFAULT NULL,
  `topology_order` int(11) DEFAULT NULL,
  `topology_group` int(11) DEFAULT NULL,
  `topology_url` varchar(255) DEFAULT NULL,
  `topology_url_opt` varchar(255) DEFAULT NULL,
  `topology_popup` enum('0','1') DEFAULT NULL,
  `topology_modules` enum('0','1') DEFAULT NULL,
  `topology_show` enum('0','1') DEFAULT '1',
  `topology_style_class` varchar(255) DEFAULT NULL,
  `topology_style_id` varchar(255) DEFAULT NULL,
  `topology_OnClick` varchar(255) DEFAULT NULL,
  `readonly` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`topology_id`),
  KEY `topology_page` (`topology_page`),
  KEY `topology_parent` (`topology_parent`),
  KEY `topology_order` (`topology_order`),
  KEY `topology_group` (`topology_group`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topology`
--

LOCK TABLES `topology` WRITE;
/*!40000 ALTER TABLE `topology` DISABLE KEYS */;
INSERT INTO `topology` VALUES (1,'Home',NULL,NULL,1,10,1,'./include/home/home.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(2,'Monitoring',NULL,NULL,2,20,1,NULL,'','0','0','1',NULL,NULL,NULL,'1'),(3,'Reporting',NULL,NULL,3,40,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(5,'Administration',NULL,NULL,5,60,1,NULL,'&o=c','0','0','1',NULL,NULL,NULL,'1'),(6,'Configuration',NULL,NULL,6,50,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(7,'By Status',NULL,202,NULL,NULL,7,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(8,'By Host',NULL,202,NULL,NULL,8,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(9,'By Host Group',NULL,202,NULL,NULL,9,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(10,'Meta Services',NULL,202,NULL,NULL,11,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(11,'Monitoring Engine',NULL,202,NULL,NULL,12,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(12,'By Service Group',NULL,202,NULL,NULL,10,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(15,'Monitoring Engine',NULL,203,NULL,NULL,34,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(16,'Advanced Logs',NULL,203,NULL,NULL,30,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(18,'Hosts','./img/icones/16x16/server_network.gif',202,20202,30,7,'./include/monitoring/status/monitoringHost.php',NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(19,'Hostgroups Summary','./img/icones/16x16/clients.gif',202,20203,120,7,'./include/monitoring/status/monitoringHostGroup.php','&o=hg',NULL,NULL,'1',NULL,NULL,NULL,'1'),(20,'Downtimes',NULL,2,210,60,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(21,'Downtimes','./img/icones/16x16/warning.gif',210,21001,10,1,'./include/monitoring/downtime/downtime.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(24,'Status Details',NULL,2,202,10,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(25,'Services','./img/icones/16x16/row.gif',202,20201,20,7,'./include/monitoring/status/monitoringService.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(28,'Services Grid','./img/icones/16x16/table_view.gif',202,20204,40,7,'./include/monitoring/status/monitoringService.php','&o=svcOV','0','0','1',NULL,NULL,NULL,'1'),(32,'Comments','./img/icones/16x16/messages.gif',210,21002,30,1,'./include/monitoring/comments/comments.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(33,'Monitoring Engine',NULL,201,NULL,NULL,2,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(36,'Meta Services','./img/icones/16x16/calculator.gif',202,20206,61,11,'./include/monitoring/status/monitoringService.php','&o=meta','0','0','1',NULL,NULL,NULL,'1'),(37,'Services by Hostgroup','./img/icones/16x16/table_view.gif',202,20209,40,7,'./include/monitoring/status/monitoringService.php','&o=svcOVHG','0','0','1',NULL,NULL,NULL,'1'),(39,'Services by Servicegroup','./img/icones/16x16/table_view.gif',202,20212,80,7,'./include/monitoring/status/monitoringService.php','&o=svcOVSG','0','0','1',NULL,NULL,NULL,'1'),(62,'Event Logs',NULL,2,203,30,31,'',NULL,'0','0','1',NULL,NULL,NULL,'1'),(64,'Hosts',NULL,6,601,10,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(65,'Services',NULL,6,602,20,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(66,'Users',NULL,6,603,30,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(68,'Hosts','./img/icones/16x16/server_network.gif',601,60101,10,1,'./include/configuration/configObject/host/host.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(69,'Host Groups','./img/icones/16x16/clients.gif',601,60102,20,1,'./include/configuration/configObject/hostgroup/hostGroup.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(70,'Templates','./img/icones/16x16/server_client_ext.gif',601,60103,30,1,'./include/configuration/configObject/host_template_model/hostTemplateModel.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(71,'Downtimes','./img/icones/16x16/warning.gif',601,60106,50,1,'./include/configuration/configDowntime/downtime.php','&type=h','0','0','1',NULL,NULL,NULL,'0'),(72,'Services',NULL,602,NULL,NULL,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(73,'Services by host','./img/icones/16x16/gear.gif',602,60201,10,1,'./include/configuration/configObject/service/serviceByHost.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(74,'Services by host group','./img/icones/16x16/gear.gif',602,60202,20,1,'./include/configuration/configObject/service/serviceByHostGroup.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(75,'Service Groups','./img/icones/16x16/gears.gif',602,60203,30,1,'./include/configuration/configObject/servicegroup/serviceGroup.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(76,'Templates','./img/icones/16x16/gear_information.gif',602,60206,50,1,'./include/configuration/configObject/service_template_model/serviceTemplateModel.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(77,'Downtimes','./img/icones/16x16/warning.gif',602,60216,100,1,'./include/configuration/configDowntime/downtime.php','&type=s','0','0','1',NULL,NULL,NULL,'0'),(78,'Meta Services',NULL,602,NULL,NULL,2,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(79,'Meta Services','./img/icones/16x16/workstation2.gif',602,60204,40,2,'./include/configuration/configObject/meta_service/metaService.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(80,'SNMP Traps',NULL,602,NULL,NULL,3,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(84,'Contacts / Users','./img/icones/16x16/user1.gif',603,60301,10,1,'./include/configuration/configObject/contact/contact.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(85,'Contact Groups','./img/icones/16x16/users_family.gif',603,60302,20,1,'./include/configuration/configObject/contactgroup/contactGroup.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(86,'Time Periods','./img/icones/16x16/calendar.gif',603,60304,40,1,'./include/configuration/configObject/timeperiod/timeperiod.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(88,'Generate','./img/icones/16x16/folder_gear.gif',609,60902,10,1,'./include/configuration/configGenerate/generateFiles.php',NULL,'0','0','0',NULL,NULL,NULL,'1'),(90,'Engine configuration','./img/icones/16x16/text_code_colored.gif',609,60903,30,1,'./include/configuration/configNagios/nagios.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(91,'Resources','./img/icones/16x16/text_code.gif',609,60904,40,1,'./include/configuration/configResources/resources.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(93,'Commands',NULL,6,608,35,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(94,'Checks','./img/icones/16x16/gear_run.gif',608,60801,10,1,'./include/configuration/configObject/command/command.php','&type=2','0','0','1',NULL,NULL,NULL,'0'),(95,'Notifications','./img/icones/16x16/gear_warning.gif',608,60802,20,1,'./include/configuration/configObject/command/command.php','&type=1','0','0','1',NULL,NULL,NULL,'0'),(96,'Miscellaneous','./img/icones/16x16/gear_view.gif',608,60803,30,1,'./include/configuration/configObject/command/command.php','&type=3','0','0','1',NULL,NULL,NULL,'0'),(97,'Performance Management',NULL,501,NULL,20,10,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(98,'Parameters',NULL,5,501,10,1,'./include/options/oreon/myAccount/formMyAccount.php','&o=c','0','0','1',NULL,NULL,NULL,'1'),(101,'Extensions',NULL,5,507,10,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(102,'Extensions',NULL,507,NULL,NULL,1,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(103,'Modules','./img/icones/16x16/press.gif',507,50701,10,1,'./include/options/oreon/modules/modules.php',NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(104,'ACL',NULL,5,502,10,1,'./include/options/LCA/define/lca.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(105,'Sessions',NULL,5,504,13,1,'./include/options/session/connected_user.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(106,'Server Status',NULL,5,505,14,1,'./include/options/sysInfos/index.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(109,'Databases','./img/icones/16x16/data_into.gif',505,50503,60,1,'./include/options/db/viewDBInfos.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(110,'About',NULL,506,NULL,NULL,80,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(111,'About',NULL,5,506,15,1,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(112,'About','./img/icons/info.png',506,50601,16,80,'./include/Administration/about/about.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(119,'My Account','./img/icones/16x16/user1_message.gif',501,50104,40,1,'./include/options/oreon/myAccount/formMyAccount.php','&o=c','0','0','1',NULL,NULL,NULL,'1'),(120,'Centreon UI','./img/icones/16x16/nagios.gif',501,50110,10,1,'./include/options/oreon/generalOpt/generalOpt.php','&o=general','0','0','1',NULL,NULL,NULL,'1'),(121,'Monitoring','./img/icones/16x16/nagios.gif',501,50111,20,1,'./include/options/oreon/generalOpt/generalOpt.php','&o=nagios','0','0','1',NULL,NULL,NULL,'1'),(124,'LDAP','./img/icones/16x16/book_yellow.gif',501,50113,50,1,'./include/options/oreon/generalOpt/generalOpt.php','&o=ldap','0','0','1',NULL,NULL,NULL,'1'),(125,'RRDTool','./img/icones/16x16/column-chart.gif',501,50114,60,1,'./include/options/oreon/generalOpt/generalOpt.php','&o=rrdtool','0','0','1',NULL,NULL,NULL,'1'),(126,'Debug','./img/icones/16x16/nagios.gif',501,50115,70,1,'./include/options/oreon/generalOpt/generalOpt.php','&o=debug','0','0','1',NULL,NULL,NULL,'1'),(127,'CSS','./img/icones/16x16/colors.gif',501,50116,90,1,'./include/options/oreon/generalOpt/generalOpt.php','&o=css','0','0','1',NULL,NULL,NULL,'1'),(128,'CentCore',NULL,501,50117,25,1,'./include/options/oreon/generalOpt/generalOpt.php','&o=centcore','0','0','1',NULL,NULL,NULL,'1'),(129,'Options','./img/icones/16x16/nagios.gif',501,50118,15,10,'./include/options/oreon/generalOpt/generalOpt.php','&o=ods','0','0','1',NULL,NULL,NULL,'1'),(130,'Data','./img/icones/16x16/data_down.gif',501,50119,20,10,'./include/options/centStorage/manageData.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(131,'Dashboard',NULL,307,NULL,NULL,50,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(132,'Dashboard',NULL,3,307,3,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(133,'Hosts','./img/icones/16x16/text_rich_marked.gif',307,30701,10,50,'./include/reporting/dashboard/viewHostLog.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(134,'Services',NULL,307,30702,20,50,'./include/reporting/dashboard/viewServicesLog.php',NULL,'0','0','0',NULL,NULL,NULL,'1'),(135,'Host Groups','./img/icones/16x16/text_rich_colored.gif',307,30703,30,50,'./include/reporting/dashboard/viewHostGroupLog.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(136,'Service Groups','./img/icones/16x16/text_rich_colored.gif',307,30704,40,50,'./include/reporting/dashboard/viewServicesGroupLog.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(137,'Performances',NULL,2,204,10,1,'',NULL,'0','0','1',NULL,NULL,NULL,'1'),(138,'Graphs',NULL,204,NULL,NULL,40,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(139,'Graphs','./img/icones/16x16/column-chart.gif',204,20401,10,40,'./include/views/graphs/graphs.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(140,'Templates',NULL,204,NULL,NULL,43,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(141,'Templates','./img/icones/16x16/layout_vertical.gif',204,20404,40,43,'./include/views/graphs/graphTemplates/graphTemplates.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(142,'Curves','./img/icones/16x16/layout_horizontal.gif',204,20405,50,43,'./include/views/graphs/componentTemplates/componentTemplates.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(143,'Virtuals',NULL,204,NULL,NULL,46,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(144,'Metrics','./img/icones/16x16/chart.gif',204,20408,80,46,'./include/views/graphs/virtualMetrics/virtualMetrics.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(149,'Categories','./img/icones/16x16/cube_green.gif',602,60209,90,1,'./include/configuration/configObject/service_categories/serviceCategories.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(150,'Pollers',NULL,6,609,90,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(153,'Pollers','./img/icones/16x16/text_code_colored.gif',609,60901,10,1,'./include/configuration/configServers/servers.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(154,'Hosts',NULL,601,NULL,NULL,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(155,'Commands',NULL,608,NULL,NULL,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(158,'Notifications',NULL,6,604,40,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(159,'Escalations',NULL,604,NULL,NULL,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(160,'Escalations','./img/icones/16x16/bookmark.gif',604,60401,10,1,'./include/configuration/configObject/escalation/escalation.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(166,'Dependencies',NULL,604,NULL,NULL,2,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(167,'Hosts','./img/icones/16x16/server_network.gif',604,60407,10,2,'./include/configuration/configObject/host_dependency/hostDependency.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(168,'Host Groups','./img/icones/16x16/clients.gif',604,60408,20,2,'./include/configuration/configObject/hostgroup_dependency/hostGroupDependency.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(169,'Services','./img/icones/16x16/gear.gif',604,60409,30,2,'./include/configuration/configObject/service_dependency/serviceDependency.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(170,'Service Groups','./img/icones/16x16/gears.gif',604,60410,40,2,'./include/configuration/configObject/servicegroup_dependency/serviceGroupDependency.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(171,'Meta Services','./img/icones/16x16/workstation2.gif',604,60411,50,2,'./include/configuration/configObject/metaservice_dependency/MetaServiceDependency.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(175,'Poller Statistics',NULL,1,102,10,1,'./include/Administration/corePerformance/nagiosStats.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(176,'Event Logs','./img/icones/16x16/text_code.gif',203,20301,10,30,'./include/eventLogs/viewLog.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(177,'Media',NULL,501,NULL,15,11,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(178,'Images','./img/icones/16x16/download.gif',501,50102,10,11,'./include/options/media/images/images.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(179,'Access List',NULL,502,NULL,NULL,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(180,'Resources Access','./img/icones/16x16/lock_new.gif',502,50202,20,1,'./include/options/accessLists/resourcesACL/resourcesAccess.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(181,'Access Groups','./img/icones/16x16/users_family.gif',502,50203,5,1,'./include/options/accessLists/groupsACL/groupsConfig.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(182,'Menus Access','./img/icones/16x16/lock_new.gif',502,50201,10,1,'./include/options/accessLists/menusACL/menusAccess.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(185,'Actions Access','./img/icones/16x16/lock_new.gif',502,50204,25,1,'./include/options/accessLists/actionsACL/actionsConfig.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(186,'Logs',NULL,5,508,11,1,'./include/Administration/configChangelog/viewLogs.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(187,'Visualisation','./img/icones/16x16/text_code.gif',508,50801,10,80,'./include/Administration/configChangelog/viewLogs.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(189,'Reload ACL','./img/icones/16x16/refresh.gif',502,50205,50,1,'./include/options/accessLists/reloadACL/reloadACL.php',NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(191,'Graphs','./img/icones/16x16/oszillograph.gif',102,10201,20,1,'./include/Administration/corePerformance/nagiosStats.php',NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(192,'Categories','./img/icones/16x16/cube_green.gif',601,60104,40,1,'./include/configuration/configObject/host_categories/hostCategories.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(194,'Broker configuration','./img/icones/16x16/text_code_colored.gif',609,60909,35,1,'./include/configuration/configCentreonBroker/centreon-broker.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(195,'Custom Views',NULL,1,103,1,1,'./include/home/customViews/index.php',NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(196,'Edit View',NULL,103,10301,NULL,NULL,'./include/home/customViews/form.php',NULL,NULL,NULL,'0',NULL,NULL,NULL,'1'),(197,'Share View',NULL,103,10302,NULL,NULL,'./include/home/customViews/shareView.php',NULL,NULL,NULL,'0',NULL,NULL,NULL,'1'),(198,'Widget Parameters',NULL,103,10303,NULL,NULL,'./include/home/customViews/widgetParam.php',NULL,NULL,NULL,'0',NULL,NULL,NULL,'1'),(199,'Add Widget',NULL,103,10304,NULL,NULL,'./include/home/customViews/addWidget.php',NULL,NULL,NULL,'0',NULL,NULL,NULL,'1'),(200,'Rotation',NULL,103,10305,NULL,NULL,'./include/home/customViews/rotation.php',NULL,NULL,NULL,'0',NULL,NULL,NULL,'1'),(202,'Widgets','./img/icones/16x16/press.gif',507,50703,30,1,'./include/options/oreon/widgets/widgets.php',NULL,NULL,NULL,'1',NULL,NULL,NULL,'1'),(203,'Connectors',NULL,608,NULL,NULL,3,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(204,'Connectors','./img/icones/16x16/gauge.gif',608,60806,60,3,'./include/configuration/configObject/connector/connector.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(205,'Wizard',NULL,60909,6090901,40,11,'./include/configuration/configCentreonBroker/wizard.php',NULL,'0','0','0',NULL,NULL,NULL,'1'),(206,'WizardAjax',NULL,60909,6090902,40,11,'./include/configuration/configCentreonBroker/wizard_ajax.php',NULL,'0','0','0',NULL,NULL,NULL,'1'),(207,'Broker Statistics','./img/icones/16x16/document_gear.gif',102,10205,15,1,'./include/Administration/brokerPerformance/brokerPerformance.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(208,'SNMP Traps',NULL,6,617,40,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(209,'SNMP Traps',NULL,617,NULL,40,1,NULL,NULL,'0','0','1',NULL,NULL,NULL,'1'),(210,'SNMP Traps','./img/icones/16x16/funnel_new.gif',617,61701,10,1,'./include/configuration/configObject/traps/traps.php',NULL,NULL,NULL,'1',NULL,NULL,NULL,'0'),(211,'Manufacturer','./img/icones/16x16/factory.gif',617,61702,20,1,'./include/configuration/configObject/traps-manufacturer/mnftr.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(212,'MIBs','./img/icones/16x16/component_add.gif',617,61703,30,1,'./include/configuration/configObject/traps-mibs/mibs.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(213,'Generate','./img/icones/16x16/funnel_new.gif',617,61704,40,1,'./include/configuration/configGenerateTraps/generateTraps.php',NULL,'0','0','1',NULL,NULL,NULL,'1'),(214,'Group','./img/icones/16x16/factory.gif',617,61705,25,1,'./include/configuration/configObject/traps-groups/groups.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(215,'Contact Templates','./img/icones/16x16/user1_information.png',603,60306,13,1,'./include/configuration/configObject/contact_template_model/contact_template.php',NULL,'0','0','1',NULL,NULL,NULL,'0'),(216,'Discovery','./img/icones/16x16/gear_view.gif',608,60807,21,1,'./include/configuration/configObject/command/command.php','&type=4','0','0','1',NULL,NULL,NULL,'0'),(217,'System Logs','./img/icones/16x16/text_code.gif',203,20302,20,30,'./include/eventLogs/viewLog.php','&engine=true','0','0','1',NULL,NULL,NULL,'1'),(218,'Delete View',NULL,103,10306,NULL,NULL,'./include/home/customViews/actionDelete.php',NULL,NULL,NULL,'0',NULL,NULL,NULL,'1'),(219,'Add View',NULL,103,10307,NULL,NULL,'./include/home/customViews/actionAddView.php',NULL,NULL,NULL,'0',NULL,NULL,NULL,'1'),(220,'Set Default',NULL,103,10308,NULL,NULL,'./include/home/customViews/actionSetDefault.php',NULL,NULL,NULL,'0',NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `topology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topology_JS`
--

DROP TABLE IF EXISTS `topology_JS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topology_JS` (
  `id_t_js` int(11) NOT NULL AUTO_INCREMENT,
  `id_page` int(11) DEFAULT NULL,
  `o` varchar(12) DEFAULT NULL,
  `PathName_js` text,
  `Init` text,
  PRIMARY KEY (`id_t_js`),
  KEY `id_page` (`id_page`),
  KEY `id_page_2` (`id_page`,`o`),
  CONSTRAINT `topology_JS_ibfk_1` FOREIGN KEY (`id_page`) REFERENCES `topology` (`topology_page`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topology_JS`
--

LOCK TABLES `topology_JS` WRITE;
/*!40000 ALTER TABLE `topology_JS` DISABLE KEYS */;
INSERT INTO `topology_JS` VALUES (1,2,NULL,'./include/common/javascript/ajaxMonitoring.js','initM'),(2,2020301,NULL,'./include/common/javascript/ajaxMonitoring.js','initM'),(3,2020302,NULL,'./include/common/javascript/ajaxMonitoring.js','initM'),(4,20204,NULL,'./include/common/javascript/ajaxMonitoring.js','initM'),(11,20209,NULL,'./include/common/javascript/ajaxMonitoring.js','initM'),(18,20212,NULL,'./include/common/javascript/ajaxMonitoring.js','initM'),(25,201,NULL,'./include/common/javascript/ajaxMonitoring.js','initM'),(27,202,NULL,'./include/common/javascript/ajaxMonitoring.js',NULL),(28,203,NULL,'./include/common/javascript/changetab.js','initChangeTab'),(40,3,NULL,'./include/common/javascript/Timeline/src/main/webapp/api/timeline-api.js','initTimeline'),(41,307,NULL,'./include/common/javascript/Timeline/src/main/webapp/api/timeline-api.js','initTimeline'),(42,30701,NULL,'./include/common/javascript/Timeline/src/main/webapp/api/timeline-api.js','initTimeline'),(43,30702,NULL,'./include/common/javascript/Timeline/src/main/webapp/api/timeline-api.js','initTimeline'),(44,20404,'c','./include/common/javascript/changetab.js','initChangeTab'),(45,20404,'w','./include/common/javascript/changetab.js','initChangeTab'),(46,20404,'a','./include/common/javascript/changetab.js','initChangeTab'),(47,20404,'a','./include/common/javascript/color_picker_mb.js',NULL),(48,20404,'c','./include/common/javascript/color_picker_mb.js',NULL),(49,20405,'c','./include/common/javascript/changetab.js','initChangeTab'),(50,20405,'w','./include/common/javascript/changetab.js','initChangeTab'),(51,20405,'a','./include/common/javascript/changetab.js','initChangeTab'),(52,20405,'a','./include/common/javascript/color_picker_mb.js',NULL),(53,20405,'c','./include/common/javascript/color_picker_mb.js',NULL),(54,502,'a','./include/common/javascript/changetab.js','initChangeTab'),(55,502,'c','./include/common/javascript/changetab.js','initChangeTab'),(56,502,'w','./include/common/javascript/changetab.js','initChangeTab'),(57,50203,'a','./include/common/javascript/changetab.js','initChangeTab'),(58,50203,'c','./include/common/javascript/changetab.js','initChangeTab'),(59,50203,'w','./include/common/javascript/changetab.js','initChangeTab'),(60,50101,NULL,'./include/common/javascript/changetab.js','initChangeTab'),(61,5010103,NULL,'./include/common/javascript/color_picker_mb.js',NULL),(63,10201,NULL,'./include/common/javascript/changetab.js','initChangeTab'),(65,602,'a','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(66,602,'c','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(67,602,'mc','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(68,60201,'a','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(69,60201,'c','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(70,60201,'mc','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(71,60202,'a','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(72,60202,'c','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(73,60202,'mc','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(74,60206,'a','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(75,60206,'c','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(76,60206,'mc','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(77,601,'a','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(78,601,'c','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(79,601,'mc','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(80,60103,'a','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(81,60103,'c','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(82,60103,'mc','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(83,603,'a','./include/common/javascript/changetab.js','initChangeTab'),(84,603,'c','./include/common/javascript/changetab.js','initChangeTab'),(85,603,'w','./include/common/javascript/changetab.js','initChangeTab'),(86,603,'mc','./include/common/javascript/changetab.js','initChangeTab'),(87,60301,'a','./include/common/javascript/changetab.js','initChangeTab'),(88,60301,'c','./include/common/javascript/changetab.js','initChangeTab'),(89,60301,'w','./include/common/javascript/changetab.js','initChangeTab'),(90,60301,'mc','./include/common/javascript/changetab.js','initChangeTab'),(91,60304,'a','./include/common/javascript/changetab.js','initChangeTab'),(92,60304,'c','./include/common/javascript/changetab.js','initChangeTab'),(93,60304,'w','./include/common/javascript/changetab.js','initChangeTab'),(94,6,'a','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(95,6,'c','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(96,6,'mc','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(97,6,'a','./include/common/javascript/changetab.js','initChangeTab'),(98,6,'w','./include/common/javascript/changetab.js','initChangeTab'),(99,6,'c','./include/common/javascript/changetab.js','initChangeTab'),(100,6,'mc','./include/common/javascript/changetab.js','initChangeTab'),(101,601,'w','./include/common/javascript/changetab.js','initChangeTab'),(102,601,'c','./include/common/javascript/changetab.js','initChangeTab'),(103,601,'a','./include/common/javascript/changetab.js','initChangeTab'),(104,601,'mc','./include/common/javascript/changetab.js','initChangeTab'),(105,602,'w','./include/common/javascript/changetab.js','initChangeTab'),(106,602,'a','./include/common/javascript/changetab.js','initChangeTab'),(107,602,'c','./include/common/javascript/changetab.js','initChangeTab'),(108,602,'mc','./include/common/javascript/changetab.js','initChangeTab'),(109,60101,'c','./include/common/javascript/changetab.js','initChangeTab'),(110,60101,'w','./include/common/javascript/changetab.js','initChangeTab'),(111,60101,'a','./include/common/javascript/changetab.js','initChangeTab'),(112,60101,'mc','./include/common/javascript/changetab.js','initChangeTab'),(113,60103,'a','./include/common/javascript/changetab.js','initChangeTab'),(114,60103,'c','./include/common/javascript/changetab.js','initChangeTab'),(115,60103,'w','./include/common/javascript/changetab.js','initChangeTab'),(116,60103,'mc','./include/common/javascript/changetab.js','initChangeTab'),(117,60201,'a','./include/common/javascript/changetab.js','initChangeTab'),(118,60201,'w','./include/common/javascript/changetab.js','initChangeTab'),(119,60201,'c','./include/common/javascript/changetab.js','initChangeTab'),(120,60201,'mc','./include/common/javascript/changetab.js','initChangeTab'),(121,60202,'w','./include/common/javascript/changetab.js','initChangeTab'),(122,60202,'c','./include/common/javascript/changetab.js','initChangeTab'),(123,60202,'a','./include/common/javascript/changetab.js','initChangeTab'),(124,60202,'mc','./include/common/javascript/changetab.js','initChangeTab'),(125,60206,'a','./include/common/javascript/changetab.js','initChangeTab'),(126,60206,'c','./include/common/javascript/changetab.js','initChangeTab'),(127,60206,'w','./include/common/javascript/changetab.js','initChangeTab'),(128,60206,'mc','./include/common/javascript/changetab.js','initChangeTab'),(140,604,'a','./include/common/javascript/changetab.js ','initChangeTab'),(141,604,'c','./include/common/javascript/changetab.js','initChangeTab'),(142,604,'w','./include/common/javascript/changetab.js','initChangeTab'),(143,604,'mc','./include/common/javascript/changetab.js','initChangeTab'),(144,60401,'c','./include/common/javascript/changetab.js','initChangeTab'),(145,60401,'w','./include/common/javascript/changetab.js','initChangeTab'),(146,60401,'a','./include/common/javascript/changetab.js','initChangeTab'),(162,60409,'a','./include/common/javascript/changetab.js','initChangeTab'),(163,60409,'w','./include/common/javascript/changetab.js','initChangeTab'),(164,60409,'c','./include/common/javascript/changetab.js','initChangeTab'),(170,102,NULL,'./include/common/javascript/changetab.js','initChangeTab'),(178,30703,NULL,'./include/common/javascript/Timeline/src/main/webapp/api/timeline-api.js','initTimeline'),(179,30704,NULL,'./include/common/javascript/Timeline/src/main/webapp/api/timeline-api.js','initTimeline'),(180,20206,NULL,'./include/common/javascript/ajaxMonitoring.js\r\n','initM'),(182,60101,'a','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(183,60101,'c','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(184,60101,'mc','./include/common/javascript/commandGetArgs/cmdGetExample.js',NULL),(187,50202,'a','./include/common/javascript/changetab.js','initChangeTab'),(188,50202,'c','./include/common/javascript/changetab.js','initChangeTab'),(189,50202,'w','./include/common/javascript/changetab.js','initChangeTab'),(190,60101,'a','./include/common/javascript/changetab.js','initChangeTab'),(191,60101,'c','./include/common/javascript/changetab.js','initChangeTab'),(192,60101,'w','./include/common/javascript/changetab.js','initChangeTab'),(193,61704,NULL,'./include/common/javascript/changetab.js','initChangeTab'),(194,60909,'c','./include/common/javascript/changetab.js','initChangeTab'),(195,60909,'a','./include/common/javascript/changetab.js','initChangeTab'),(196,60909,'w','./include/common/javascript/changetab.js','initChangeTab'),(197,60106,'a','./include/common/javascript/changetab.js','initChangeTab'),(198,60106,'c','./include/common/javascript/changetab.js','initChangeTab'),(199,60106,'w','./include/common/javascript/changetab.js','initChangeTab'),(200,60216,'a','./include/common/javascript/changetab.js','initChangeTab'),(201,60216,'c','./include/common/javascript/changetab.js','initChangeTab'),(202,60216,'w','./include/common/javascript/changetab.js','initChangeTab'),(205,61701,'a','./include/common/javascript/changetab.js','initChangeTab'),(206,61701,'c','./include/common/javascript/changetab.js','initChangeTab'),(207,61701,'w','./include/common/javascript/changetab.js','initChangeTab'),(208,61701,NULL,'./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(209,61701,NULL,'./include/common/javascript/centreon/doClone.js',NULL),(210,61701,NULL,'./include/common/javascript/centreon/serviceFilterByHost.js',NULL),(211,5010105,NULL,'./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(212,5010105,NULL,'./include/common/javascript/centreon/doClone.js',NULL),(213,60101,NULL,'./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(214,60101,NULL,'./include/common/javascript/centreon/doClone.js',NULL),(215,60103,NULL,'./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(216,60103,NULL,'./include/common/javascript/centreon/doClone.js',NULL),(217,60201,NULL,'./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(218,60201,NULL,'./include/common/javascript/centreon/doClone.js',NULL),(219,60202,NULL,'./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(220,60202,NULL,'./include/common/javascript/centreon/doClone.js',NULL),(221,60206,NULL,'./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(222,60206,NULL,'./include/common/javascript/centreon/doClone.js',NULL),(223,601,NULL,'./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(224,601,NULL,'./include/common/javascript/centreon/doClone.js',NULL),(225,602,NULL,'./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(226,602,NULL,'./include/common/javascript/centreon/doClone.js',NULL),(227,60901,NULL,'./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(228,60901,NULL,'./include/common/javascript/centreon/doClone.js',NULL),(229,60903,'c','./include/common/javascript/changetab.js','initChangeTab'),(230,60903,'a','./include/common/javascript/changetab.js','initChangeTab'),(231,60903,'w','./include/common/javascript/changetab.js','initChangeTab'),(232,60902,NULL,'./include/common/javascript/changetab.js','initChangeTab'),(233,60902,NULL,'./include/common/javascript/scriptaculous/jsProgressBarHandler.js',NULL),(234,60306,NULL,'./include/common/javascript/changetab.js','initChangeTab'),(235,60101,NULL,'./include/common/javascript/centreon/hostResolve.js',NULL),(236,202,NULL,'./include/common/javascript/jquery/plugins/noty/jquery.noty.js',NULL),(237,202,NULL,'./include/common/javascript/jquery/plugins/noty/themes/default.js',NULL),(238,202,NULL,'./include/common/javascript/jquery/plugins/noty/layouts/bottomRight.js',NULL),(239,20201,NULL,'./include/common/javascript/jquery/plugins/noty/jquery.noty.js',NULL),(240,20201,NULL,'./include/common/javascript/jquery/plugins/noty/themes/default.js',NULL),(241,20201,NULL,'./include/common/javascript/jquery/plugins/noty/layouts/bottomRight.js',NULL),(242,201,NULL,'./include/common/javascript/jquery/plugins/noty/jquery.noty.js',NULL),(243,201,NULL,'./include/common/javascript/jquery/plugins/noty/themes/default.js',NULL),(244,201,NULL,'./include/common/javascript/jquery/plugins/noty/layouts/bottomRight.js',NULL),(245,20203,NULL,'./include/common/javascript/ajaxMonitoring.js','initM'),(246,50113,'ldap','./include/common/javascript/centreon/doClone.js',NULL),(247,50113,'ldap','./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(248,60903,NULL,'./include/common/javascript/changetab.js','initChangeTab'),(249,60903,NULL,'./include/common/javascript/jquery/plugins/sheepit/jquery.sheepItPlugin.min.js',NULL),(250,60903,NULL,'./include/common/javascript/centreon/doClone.js',NULL),(251,20202,NULL,'./include/common/javascript/changetab.js','initChangeTab');
/*!40000 ALTER TABLE `topology_JS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traps`
--

DROP TABLE IF EXISTS `traps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traps` (
  `traps_id` int(11) NOT NULL AUTO_INCREMENT,
  `traps_name` varchar(255) DEFAULT NULL,
  `traps_oid` varchar(255) DEFAULT NULL,
  `traps_args` text,
  `traps_status` enum('-1','0','1','2','3') DEFAULT NULL,
  `severity_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `traps_reschedule_svc_enable` enum('0','1') DEFAULT '0',
  `traps_execution_command` varchar(255) DEFAULT NULL,
  `traps_execution_command_enable` enum('0','1') DEFAULT '0',
  `traps_submit_result_enable` enum('0','1') DEFAULT '0',
  `traps_advanced_treatment` enum('0','1') DEFAULT '0',
  `traps_advanced_treatment_default` enum('0','1','2') DEFAULT '0',
  `traps_timeout` int(11) DEFAULT NULL,
  `traps_exec_interval` int(11) DEFAULT NULL,
  `traps_exec_interval_type` enum('0','1','2') DEFAULT '0',
  `traps_log` enum('0','1') DEFAULT '0',
  `traps_routing_mode` enum('0','1') DEFAULT '0',
  `traps_routing_value` varchar(255) DEFAULT NULL,
  `traps_routing_filter_services` varchar(255) DEFAULT NULL,
  `traps_exec_method` enum('0','1') DEFAULT '0',
  `traps_downtime` enum('0','1','2') DEFAULT '0',
  `traps_output_transform` varchar(255) DEFAULT NULL,
  `traps_customcode` text,
  `traps_comments` text,
  UNIQUE KEY `traps_name` (`traps_name`,`traps_oid`),
  KEY `traps_id` (`traps_id`),
  KEY `traps_ibfk_1` (`manufacturer_id`),
  KEY `traps_ibfk_2` (`severity_id`),
  CONSTRAINT `traps_ibfk_1` FOREIGN KEY (`manufacturer_id`) REFERENCES `traps_vendor` (`id`) ON DELETE CASCADE,
  CONSTRAINT `traps_ibfk_2` FOREIGN KEY (`severity_id`) REFERENCES `service_categories` (`sc_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traps`
--

LOCK TABLES `traps` WRITE;
/*!40000 ALTER TABLE `traps` DISABLE KEYS */;
INSERT INTO `traps` VALUES (1,'linkDown','.1.3.6.1.6.3.1.1.5.3','Link down on interface $2. State: $4.','2',NULL,7,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'A linkDown(2) trap signifies that the sending protocol entity recognizes a failure in one of the communication links represented in the agent&#039;s configuration.'),(2,'linkUp','.1.3.6.1.6.3.1.1.5.4','Link up on interface $2. State: $4.','0',NULL,7,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'A linkUp(3) trap signifies that the sending protocol entity recognizes that one of the communication links represented in the agent&#039;s configuration has come up.'),(3,'warmStart','.1.3.6.1.6.3.1.1.5.2','SNMP is reinitializing','0',NULL,7,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'A warmStart(1) trap signifies that the sending protocol entity is reinitializing itself such that neither the agent configuration nor the protocol entity implementation is altered.'),(4,'coldStart','.1.3.6.1.6.3.1.1.5.1','SNMP is restarting','1',NULL,7,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'A coldStart(0) trap signifies that the sending protocol entity is reinitializing itself such that the agent&#039;s configuration or the protocol entity implementation may be altered.'),(6,'unitDeparture','.1.3.6.1.4.1.43.0.89','This trap is raised by the lowest numbered unit in a stack when $*','0',NULL,3,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This trap is raised by the lowest numbered unit in a stack when\na communications loss is detected to another unit. The raising of this\ntrap is optional.\nVariables:\n  1: stackUnitDesc\n  2: stackUnitSerialNumber\n'),(7,'remPollSuccessTrap','.1.3.6.1.4.1.43.0.74','This trap is generated by the EventTable (if the eventEntry  $*','0',NULL,3,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This trap is generated by the EventTable (if the eventEntry \nis configured to send traps) when the remPollTable receives a reply to a poll \nafter a sequence of un- successful polls.\nVariables:\n  1: remPollAddress\n  2: remPollProtocol\n  3: remPollInformation\n'),(8,'remPollFailureTrap','.1.3.6.1.4.1.43.0.75','This trap is generated by the EventTable (if the eventEntry  $*','0',NULL,3,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This trap is generated by the EventTable (if the eventEntry \nis configured to send traps) when the remPollTable fails to receive a reply to a poll.\nVariables:\n  1: remPollAddress\n  2: remPollProtocol\n  3: remPollInformation\n'),(9,'secureAddressLearned','.1.3.6.1.4.1.43.0.71','This trap is sent when a new station has been learned. The  $*','0',NULL,3,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This trap is sent when a new station has been learned. The \nslot and port on which the address was received are in the first and\nsecond index of secureAddrRowStatus, and the MAC address of the learned\nstation is in the third index.\nVariables:\n  1: secureAddrRowStatus\n'),(10,'secureAddressLearned2','.1.3.6.1.4.1.43.0.85','This trap is sent when a new station has been learned. $*','0',NULL,3,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This trap is sent when a new station has been learned.\nThe slot and port on which the address was received are\nin  the  first and second index of secureAddrRowStatus,\nand  the MAC  address of the learned station is in  the\nthird index.\nVariables:\n  1: secureAddrRowStatus\n  2: a3ComVlanIfGlobalIdentifier\n'),(11,'secureViolation2','.1.3.6.1.4.1.43.0.78','This trap is sent whenever a security violation has occurred.  $*','0',NULL,3,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This trap is sent whenever a security violation has occurred. \nThe slot and port on which the violation occured are in the first and\nsecond index of secureAddrRowStatus, and the MAC address of the offending\nstation is in the third index. rptrPortAdminSTATUS indicates if the port\nhas been disabled because of the violation. The implementation may not\nsend violation traps from the same port at intervals of less than 5\nseconds\nVariables:\n  1: secureAddrRowStatus\n  2: rptrPortAdminStatus\n'),(12,'secureViolation3','.1.3.6.1.4.1.43.0.86','This trap is sent whenever a security violation has  $*','0',NULL,3,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This trap is sent whenever a security violation has \noccured. The slot and port on which the violation occured are in the \nfirst and second index of secureAddrRowStatus, and the MAC address of \nthe offending station is in the third index. ifAdminStatus indicates\nif the port has been disabled because of the violation. \nThe implementation may not send violation traps from the same port\nat intervals of less than 5 seconds.\nVariables:\n  1: secureAddrRowStatus\n  2: ifAdminStatus\n  3: a3ComVlanIfGlobalIdentifier\n'),(13,'secureViolation4','.1.3.6.1.4.1.43.0.88','This trap is sent whenever a security violation has  $*','0',NULL,3,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This trap is sent whenever a security violation has \noccurred. The slot and port on which the violation occurred are in the \nfirst and second index of secureAddrRowStatus, and the MAC address of \nthe offending station is in the third index. ifAdminStatus indicates\nif the port has been disabled because of the violation. \nThe implementation may not send violation traps from the same port\nat intervals of less than 5 seconds.\nVariables:\n  1: secureAddrRowStatus\n  2: ifAdminStatus\n'),(14,'eventGenericTrap','.1.3.6.1.4.1.43.0.82','This trap is sent to management stations when an internal  $*','0',NULL,3,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This trap is sent to management stations when an internal \nRMON event is tiggered and there is no applicable specific trap. The trap \nidentifies the event index triggered and includes a value for \n\'eventDescription\'. Note that the text is not the literal value of the event \ndescription column in this table but rather the descriptive text that would have \nbeen added to the event log.\nVariables:\n  1: eventDescription\n'),(15,'brDatabaseFull','.1.3.6.1.4.1.43.0.65','This trap indicates that either the Filtering  $*','0',NULL,3,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This trap indicates that either the Filtering \ndatabase, the permanent database or the ATM Downlink \ndatabase has become full. If the database occupancy \nexceeds 90% this trap will be sent also. The variable \nbindings enable the trap to be identified as refering to \nthe filtering, permanent, or ATM Downlink database, and \nto differentiate between 90% or 100% full.\nVariables:\n  1: brDatabaseType\n  2: brDatabaseLevel\n'),(16,'trapPrinterOnline','.1.3.6.1.4.1.683.6.0.1','Printer On-Line: Port $1 is On-Line','0',NULL,9,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The printer is on-line.  This trap will be sent\nout after a printer error condition has been cleared.\nVariables:\n  1: outputIndex\n'),(17,'trapPrinterOffline','.1.3.6.1.4.1.683.6.0.2','Printer Off-Line: Port $1 is Off-Line','0',NULL,9,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The printer is off-line.\nVariables:\n  1: outputIndex\n'),(18,'trapNoPrinterAttached','.1.3.6.1.4.1.683.6.0.3','No Printer Attached: Port $1 - No Printer Attached','0',NULL,9,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'No printer is attached to the output port.\nVariables:\n  1: outputIndex\n'),(19,'trapPrinterTonerLow','.1.3.6.1.4.1.683.6.0.4','Toner Low: Port $1 - Toner Low','1',NULL,9,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The printer toner is low.\nVariables:\n  1: outputIndex\n'),(20,'trapPrinterPaperOut','.1.3.6.1.4.1.683.6.0.5','Printer Out of Paper: Port $1 - Out of Paper','1',NULL,9,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The printer is out of paper.\nVariables:\n  1: outputIndex\n'),(21,'trapPrinterPaperJam','.1.3.6.1.4.1.683.6.0.6','Paper Jam: Port $1 - Paper Jam','2',NULL,9,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The printer has a paper jam.\nVariables:\n  1: outputIndex\n'),(22,'trapPrinterDoorOpen','.1.3.6.1.4.1.683.6.0.7','Printer Door Open: Port $1 - Printer Door Open','0',NULL,9,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The printer door is open.\nVariables:\n  1: outputIndex\n'),(23,'trapPrinterError','.1.3.6.1.4.1.683.6.0.16','General Printer Error: Port $1 - Printer Error','1',NULL,9,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'General printer error.\nVariables:\n  1: outputIndex\n'),(281,'alertAutomaticSystemRecovery','.1.3.6.1.4.1.674.10892.1.0.1006','Server Automatic System Recovery: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Automatic system recovery (ASR) was performed.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(295,'alertAmperageProbeNormal','.1.3.6.1.4.1.674.10892.1.0.1202','Server Amperage Normal: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Amperage probe has returned to a normal value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(296,'alertAmperageProbeWarning','.1.3.6.1.4.1.674.10892.1.0.1203','Server Amperage Warning: $3','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Amperage probe has detected a warning value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(297,'alertAmperageProbeFailure','.1.3.6.1.4.1.674.10892.1.0.1204','Server Amperage Failure: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Amperage probe has detected a failure value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(298,'alertAmperageProbeNonRecoverable','.1.3.6.1.4.1.674.10892.1.0.1205','Server Amperage Non-recoverable: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Amperage probe has detected a non-recoverable value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(300,'alertChassisIntrusionDetected','.1.3.6.1.4.1.674.10892.1.0.1254','Server Chassis Intrusion Detected: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Chassis intrusion has been detected.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(313,'alertACPowerCordNoPowerNonRedundant','.1.3.6.1.4.1.674.10892.1.0.1501','Server AC Cord No Power Non-redundant: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'AC power cord does not have power, and the reduncancy mode\nfor its AC power switch has been set to non-redundant.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(314,'alertACPowerCordNormal','.1.3.6.1.4.1.674.10892.1.0.1502','Server AC Cord Normal: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'AC power cord has regained power.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(315,'alertACPowerCordFailure','.1.3.6.1.4.1.674.10892.1.0.1504','Server AC Cord Failure: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'AC power cord has lost power.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(325,'alertBatteryNormal','.1.3.6.1.4.1.674.10892.1.0.1702','Server Battery Normal: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Battery has returned to normal.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(326,'alertBatteryWarning','.1.3.6.1.4.1.674.10892.1.0.1703','Server Battery Warning: $3','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Battery has detected a warning.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(327,'alertBatteryFailure','.1.3.6.1.4.1.674.10892.1.0.1704','Server Battery Failure: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Battery has detected a failure.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(328,'failoverEvent','.1.3.6.1.4.1.4413.1.2.3.0.1','$*','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'\nThis trap is generated to indicate that adapter Fail-Over \nevent has occured\nVariables:\n  1: trapAdapterName\n  2: trapTeamName\n  3: trapCauseDirection\n  4: trapAdapterActivityCause\n'),(344,'dmtfAlert309','.1.3.6.1.4.1.674.10890.1.0.309','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Current sensor warning returned to normal\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(345,'dmtfAlert310','.1.3.6.1.4.1.674.10890.1.0.310','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Power supply lost redundancy detected\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(346,'dmtfAlert311','.1.3.6.1.4.1.674.10890.1.0.311','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Power supply regained redundancy\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(347,'dmtfAlert312','.1.3.6.1.4.1.674.10890.1.0.312','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Power supply degraded redundancy detected\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(348,'dmtfAlert313','.1.3.6.1.4.1.674.10890.1.0.313','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Power supply degraded redundancy returned to normal\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(349,'dmtfAlert314','.1.3.6.1.4.1.674.10890.1.0.314','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Power supply failure detected\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(350,'dmtfAlert315','.1.3.6.1.4.1.674.10890.1.0.315','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Power supply failure returned to normal\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(351,'dmtfAlert320','.1.3.6.1.4.1.674.10890.1.0.320','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Chassis intrusion detected\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(352,'dmtfAlert321','.1.3.6.1.4.1.674.10890.1.0.321','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Chassis intrusion returned to normal\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(353,'dmtfAlert330','.1.3.6.1.4.1.674.10890.1.0.330','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'System Up\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(354,'dmtfAlert323','.1.3.6.1.4.1.674.10890.1.0.323','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Memory ECC fault detected\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(355,'dmtfAlert325','.1.3.6.1.4.1.674.10890.1.0.325','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Lost connection to storage system\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(356,'dmtfAlert326','.1.3.6.1.4.1.674.10890.1.0.326','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Established connection to storage system\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(357,'dmtfAlert327','.1.3.6.1.4.1.674.10890.1.0.327','DMI BASEBRDD Alert Event: Event Data: ($3 on $1)','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Reestablished connection to storage system\n--NMS trap annotation\nVariables:\n  1: a9999AlertSystem\n  2: a9999AlertGroup\n  3: a9999AlertMessage\n  4: a9999AlertSeverity\n  5: a9999AlertData\n'),(363,'virtualDiskCreated','.1.3.6.1.4.1.674.10893.1.1.200.0.505','Array Manager Event: Virtual Disk created: ','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) created.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(364,'virtualDiskDeleted','.1.3.6.1.4.1.674.10893.1.1.200.0.506','Array Manager Event: Virtual Disk deleted: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) deleted.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(365,'virtualDiskConfigChanged','.1.3.6.1.4.1.674.10893.1.1.200.0.507','Array Manager Event: Virtual Disk created: ','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) configuration changed from %s to %s\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n  3: oldVDConfigEv\n  4: newVDConfigEv\n'),(366,'virtualDiskFailed','.1.3.6.1.4.1.674.10893.1.1.200.0.508','Array Manager Event: Virtual Disk failed: ','3',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) failed.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(367,'virtualDiskDegraded','.1.3.6.1.4.1.674.10893.1.1.200.0.509','Array Manager Event: Virtual Disk degraded: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) degraded.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(368,'vdFailedRedundancy','.1.3.6.1.4.1.674.10893.1.1.200.0.510','Array Manager Event: Virtual Disk failed redundancy: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) is no longer redundant.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(370,'vdFormatStarted','.1.3.6.1.4.1.674.10893.1.1.200.0.521','Array Manager Event: Virtual Disk format started: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) format started.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(371,'adFormatStarted','.1.3.6.1.4.1.674.10893.1.1.200.0.522','Array Manager Event: Array Disk format started: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s format started.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(372,'vdInitializeStarted','.1.3.6.1.4.1.674.10893.1.1.200.0.523','Array Manager Event: Virtual Disk initialization started: ','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) initialization started.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(373,'adInitializeStarted','.1.3.6.1.4.1.674.10893.1.1.200.0.524','Array Manager Event: Array Disk initialize started: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s initialize started.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(374,'vdReconfigStarted','.1.3.6.1.4.1.674.10893.1.1.200.0.525','Array Manager Event: Virtual Disk Reconfiguration started: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) reconfiguration from \n%s stripe size to %s stripe size started.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n  3: oldVDConfigEv\n  4: newVDConfigEv\n'),(375,'vdRebuildStarted','.1.3.6.1.4.1.674.10893.1.1.200.0.526','Array Manager Event: Virtual Disk rebuild started: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) rebuild started.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(376,'adRebuildStarted','.1.3.6.1.4.1.674.10893.1.1.200.0.527','Array Manager Event: Array Disk rebuild started: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s rebuild started.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(377,'adDiagStarted','.1.3.6.1.4.1.674.10893.1.1.200.0.528','Array Manager Event: Array Disk diagnostics started: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s diagnostics started.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(379,'vdFormatCancelled','.1.3.6.1.4.1.674.10893.1.1.200.0.530','Array Manager Event: Virtual Disk format cancelled: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) format cancelled.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(380,'adFormatCancelled','.1.3.6.1.4.1.674.10893.1.1.200.0.531','Array Manager Event: Array Disk format cancelled: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s format cancelled.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(381,'vdInitializeCancelled','.1.3.6.1.4.1.674.10893.1.1.200.0.532','Array Manager Event: Virtual Disk initialization cancelled: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) initialization cancelled.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(382,'adInitializeCancelled','.1.3.6.1.4.1.674.10893.1.1.200.0.533','Array Manager Event: Array Disk initialize cancelled: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s initialize cancelled.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(383,'vdReconfigCancelled','.1.3.6.1.4.1.674.10893.1.1.200.0.534','Array Manager Event: Virtual Disk Reconfiguration cancelled: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) reconfiguration cancelled.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(384,'vdRebuildCancelled','.1.3.6.1.4.1.674.10893.1.1.200.0.535','Array Manager Event: Virtual Disk rebuild cancelled: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) rebuild cancelled.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(385,'adRebuildCancelled','.1.3.6.1.4.1.674.10893.1.1.200.0.536','Array Manager Event: Array Disk rebuild cancelled: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s rebuild cancelled.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(386,'adDiagCancelled','.1.3.6.1.4.1.674.10893.1.1.200.0.537','Array Manager Event: Array Disk diagnostics cancelled: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s diagnostics cancelled.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(388,'vdFormatFailed','.1.3.6.1.4.1.674.10893.1.1.200.0.539','Array Manager Event: Virtual Disk format failed: ','3',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) format failed.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(389,'adFormatFailed','.1.3.6.1.4.1.674.10893.1.1.200.0.540','Array Manager Event: Array Disk format failed: ','3',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s format failed.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(390,'vdInitializeFailed','.1.3.6.1.4.1.674.10893.1.1.200.0.541','Array Manager Event: Virtual Disk initialization Failed: ','3',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) initialization Failed.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(391,'adInitializeFailed','.1.3.6.1.4.1.674.10893.1.1.200.0.542','Array Manager Event: Array Disk initialize failed: ','3',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s initialize failed.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(392,'vdReconfigFailed','.1.3.6.1.4.1.674.10893.1.1.200.0.543','Array Manager Event: Virtual Disk Reconfiguration failed: ','3',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) reconfiguration failed.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(393,'vdRebuildFailed','.1.3.6.1.4.1.674.10893.1.1.200.0.544','Array Manager Event: Virtual Disk rebuild failed: ','3',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) rebuild failed.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(394,'adRebuildFailed','.1.3.6.1.4.1.674.10893.1.1.200.0.545','Array Manager Event: Array Disk rebuild failed: ','3',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s rebuild failed.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(395,'adDiagFailed','.1.3.6.1.4.1.674.10893.1.1.200.0.546','Array Manager Event: Array Disk diagnostics failed: ','3',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s diagnostics failed.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(397,'vdFormatCompleted','.1.3.6.1.4.1.674.10893.1.1.200.0.548','Array Manager Event: Virtual Disk format completed: ','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) format completed.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(398,'adFormatCompleted','.1.3.6.1.4.1.674.10893.1.1.200.0.549','Array Manager Event: Array Disk format completed: ','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s format completed.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(399,'vdInitializeCompleted','.1.3.6.1.4.1.674.10893.1.1.200.0.550','Array Manager Event: Virtual Disk initialization completed: ','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) initialization completed.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(400,'adInitializeCompleted','.1.3.6.1.4.1.674.10893.1.1.200.0.551','Array Manager Event: Array Disk initialize completed: ','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s initialize completed.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(401,'vdReconfigCompleted','.1.3.6.1.4.1.674.10893.1.1.200.0.552','Array Manager Event: Virtual Disk Reconfiguration completed: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) reconfiguration completed.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(402,'vdRebuildCompleted','.1.3.6.1.4.1.674.10893.1.1.200.0.553','Array Manager Event: Virtual Disk rebuild completed: ','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, virtual disk (%s) rebuild completed.\nVariables:\n  1: controllerNameEv\n  2: virtualDiskNameEv\n'),(403,'adRebuildCompleted','.1.3.6.1.4.1.674.10893.1.1.200.0.554','Array Manager Event: Array Disk rebuild completed: ','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s rebuild completed.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(404,'adDiagCompleted','.1.3.6.1.4.1.674.10893.1.1.200.0.555','Array Manager Event: Array Disk diagnostics completed: ','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s diagnostics completed.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(405,'percPredictiveFailure','.1.3.6.1.4.1.674.10893.1.1.200.0.570','Array Manager Event: Predictive Failure reported: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s reported predictive failure.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(406,'percSCSISenseData','.1.3.6.1.4.1.674.10893.1.1.200.0.571','Array Manager Event: SCSI sense data: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s, %s SCSI sense failure.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(413,'perc2SmartFPTExceeded','.1.3.6.1.4.1.674.10893.1.1.200.0.585','Array Manager Event: Smart FPT Exceeded: ','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s SMART:FPT EXCEEDED on %s.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(414,'perc2SmartConfigChange','.1.3.6.1.4.1.674.10893.1.1.200.0.586','Array Manager Event: Smart Config Change: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s SMART configuration change on %s.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(415,'perc2SmartWarning','.1.3.6.1.4.1.674.10893.1.1.200.0.587','Array Manager Event: Smart Warning: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s SMART Warning on %s.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(416,'perc2SmartWarningTemp','.1.3.6.1.4.1.674.10893.1.1.200.0.588','Array Manager Event: Smart warning temperature: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s SMART Warning temperature on %s.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(417,'perc2SmartWarningDegraded','.1.3.6.1.4.1.674.10893.1.1.200.0.589','Array Manager Event: Smart warning degraded: ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'%s SMART warning degraded on %s.\nVariables:\n  1: controllerNameEv\n  2: arrayDiskNameEv\n'),(418,'perc2SmartFPTExceededTest','.1.3.6.1.4.1.674.10893.1.1.200.0.590','    Internal Controller has encountered Strong-ARM processor specific error$1 ','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Internal Controller has encountered Strong-ARM processor specific error\nVariables:\n'),(464,'snTrapChasPwrSupply','.1.3.6.1.4.1.11.0.1','The SNMP trap that is generated when a power supply fails $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when a power supply fails\nto operate normally.\nVariables:\n  1: snChasPwrSupplyStatus\n'),(465,'snTrapLockedAddressViolation','.1.3.6.1.4.1.11.0.2','The SNMP trap that is generated when more source MAC addresses $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when more source MAC addresses\nare received from a port than the maximum number of addresses\nconfigured to that port.\nVariables:\n  1: snSwViolatorPortNumber\n  2: snSwViolatorMacAddress\n'),(466,'snTrapOspfIfStateChange','.1.3.6.1.4.1.11.0.3','An ospfIfStateChange trap signifies that there $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfIfStateChange trap signifies that there\nhas been a change in the state of a non-virtual\nOSPF interface. This trap should  be  generated\nwhen  the interface state regresses (e.g., goes\nfrom Dr to Down) or progresses  to  a  terminal\nstate  (i.e.,  Point-to-Point, DR Other, Dr, or\nBackup).\nVariables:\n  1: snOspfRouterId\n  2: snOspfIfStatusIpAddress\n  3: snOspfIfStatusState\n'),(467,'snTrapOspfVirtIfStateChange','.1.3.6.1.4.1.11.0.4','An ospfIfStateChange trap signifies that there $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfIfStateChange trap signifies that there\nhas  been a change in the state of an OSPF vir-\ntual interface.\nThis trap should be generated when  the  inter-\nface  state  regresses  (e.g., goes from Point-\nto-Point to Down) or progresses to  a  terminal\nstate (i.e., Point-to-Point).\nVariables:\n  1: snOspfRouterId\n  2: snOspfVirtIfStatusAreaID\n  3: snOspfVirtIfStatusNeighbor\n  4: snOspfVirtIfStatusState\n'),(468,'snOspfNbrStateChange','.1.3.6.1.4.1.11.0.5','An  ospfNbrStateChange  trap  signifies   that $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An  ospfNbrStateChange  trap  signifies   that\nthere  has been a change in the state of a non-\nvirtual OSPF neighbor.   This  trap  should  be\ngenerated  when  the  neighbor  state regresses\n(e.g., goes from Attempt or Full  to  1-Way  or\nDown)  or progresses to a terminal state (e.g.,\n2-Way or Full).  When an  neighbor  transitions\nfrom  or  to Full on non-broadcast multi-access\nand broadcast networks, the trap should be gen-\nerated  by the designated router.  A designated\nrouter transitioning to Down will be  noted  by\nospfIfStateChange.\nVariables:\n  1: snOspfRouterId\n  2: snOspfNbrIpAddr\n  3: snOspfNbrRtrId\n  4: snOspfNbrState\n'),(469,'snOspfVirtNbrStateChange','.1.3.6.1.4.1.11.0.6','An ospfIfStateChange trap signifies that there $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfIfStateChange trap signifies that there\nhas  been a change in the state of an OSPF vir-\ntual neighbor.  This trap should  be  generated\nwhen  the  neighbor state regresses (e.g., goes\nfrom Attempt or  Full  to  1-Way  or  Down)  or\nprogresses to a terminal state (e.g., Full).\nVariables:\n  1: snOspfRouterId\n  2: snOspfVirtNbrArea\n  3: snOspfVirtNbrRtrId\n  4: snOspfVirtNbrState\n'),(470,'snOspfIfConfigError','.1.3.6.1.4.1.11.0.7','An ospfIfConfigError  trap  signifies  that  a $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfIfConfigError  trap  signifies  that  a\npacket  has  been received on a non-virtual in-\nterface  from  a  router  whose   configuration\nparameters  conflict  with this router\'s confi-\nguration parameters.  Note that the  event  op-\ntionMismatch  should  cause  a  trap only if it\nprevents an adjacency from forming.\nVariables:\n  1: snOspfRouterId\n  2: snOspfIfStatusIpAddress\n  3: snOspfPacketSrc\n  4: snOspfConfigErrorType\n  5: snOspfPacketType\n'),(471,'snOspfVirtIfConfigError','.1.3.6.1.4.1.11.0.8','An ospfConfigError trap signifies that a pack- $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfConfigError trap signifies that a pack-\net  has  been  received  on a virtual interface\nfrom a router  whose  configuration  parameters\nconflict   with   this  router\'s  configuration\nparameters.  Note that the event optionMismatch\nshould  cause a trap only if it prevents an ad-\njacency from forming.\nVariables:\n  1: snOspfRouterId\n  2: snOspfVirtIfStatusAreaID\n  3: snOspfVirtIfStatusNeighbor\n  4: snOspfConfigErrorType\n  5: snOspfPacketType\n'),(472,'snOspfIfAuthFailure','.1.3.6.1.4.1.11.0.9','An ospfIfAuthFailure  trap  signifies  that  a $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfIfAuthFailure  trap  signifies  that  a\npacket  has  been received on a non-virtual in-\nterface from a router whose authentication  key\nor  authentication  type  conflicts  with  this\nrouter\'s authentication key  or  authentication\ntype.\nVariables:\n  1: snOspfRouterId\n  2: snOspfIfStatusIpAddress\n  3: snOspfPacketSrc\n  4: snOspfConfigErrorType\n  5: snOspfPacketType\n'),(473,'snOspfVirtIfAuthFailure','.1.3.6.1.4.1.11.0.10','An ospfVirtIfAuthFailure trap signifies that a $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfVirtIfAuthFailure trap signifies that a\npacket has been received on a virtual interface\nfrom a router whose authentication key  or  au-\nthentication  type conflicts with this router\'s\nauthentication key or authentication type.\nVariables:\n  1: snOspfRouterId\n  2: snOspfVirtIfStatusAreaID\n  3: snOspfVirtIfStatusNeighbor\n  4: snOspfConfigErrorType\n  5: snOspfPacketType\n'),(474,'snOspfIfRxBadPacket','.1.3.6.1.4.1.11.0.11','An ospfIfRxBadPacket trap  signifies  that  an $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfIfRxBadPacket trap  signifies  that  an\nOSPF  packet has been received on a non-virtual\ninterface that cannot be parsed.\nVariables:\n  1: snOspfRouterId\n  2: snOspfIfStatusIpAddress\n  3: snOspfPacketSrc\n  4: snOspfPacketType\n'),(475,'snOspfVirtIfRxBadPacket','.1.3.6.1.4.1.11.0.12','An ospfRxBadPacket trap signifies that an OSPF $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfRxBadPacket trap signifies that an OSPF\npacket has been received on a virtual interface\nthat cannot be parsed.\nVariables:\n  1: snOspfRouterId\n  2: snOspfVirtIfStatusAreaID\n  3: snOspfVirtIfStatusNeighbor\n  4: snOspfPacketType\n'),(476,'snOspfTxRetransmit','.1.3.6.1.4.1.11.0.13','An ospfTxRetransmit  trap  signifies  than  an $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfTxRetransmit  trap  signifies  than  an\nOSPF  packet  has  been retransmitted on a non-\nvirtual interface.  All packets that may be re-\ntransmitted  are associated with an LSDB entry.\nThe LS type, LS ID, and Router ID are  used  to\nidentify the LSDB entry.\nVariables:\n  1: snOspfRouterId\n  2: snOspfIfStatusIpAddress\n  3: snOspfNbrRtrId\n  4: snOspfPacketType\n  5: snOspfLsdbType\n  6: snOspfLsdbLsId\n  7: snOspfLsdbRouterId\n'),(477,'ospfVirtIfTxRetransmit','.1.3.6.1.4.1.11.0.14','An ospfTxRetransmit  trap  signifies  than  an $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfTxRetransmit  trap  signifies  than  an\nOSPF packet has been retransmitted on a virtual\ninterface.  All packets that may be retransmit-\nted  are  associated with an LSDB entry. The LS\ntype, LS ID, and Router ID are used to identify\nthe LSDB entry.\nVariables:\n  1: snOspfRouterId\n  2: snOspfVirtIfStatusAreaID\n  3: snOspfVirtIfStatusNeighbor\n  4: snOspfPacketType\n  5: snOspfLsdbType\n  6: snOspfLsdbLsId\n  7: snOspfLsdbRouterId\n'),(478,'snOspfOriginateLsa','.1.3.6.1.4.1.11.0.15','An ospfOriginateLsa trap signifies that a  new $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfOriginateLsa trap signifies that a  new\nLSA  has  been originated by this router.  This\ntrap should not be invoked for simple refreshes\nof  LSAs  (which happesn every 30 minutes), but\ninstead will only be invoked  when  an  LSA  is\n(re)originated due to a topology change.  Addi-\ntionally, this trap does not include LSAs  that\nare  being  flushed  because  they have reached\nMaxAge.\nVariables:\n  1: snOspfRouterId\n  2: snOspfLsdbAreaId\n  3: snOspfLsdbType\n  4: snOspfLsdbLsId\n  5: snOspfLsdbRouterId\n'),(479,'snOspfMaxAgeLsa','.1.3.6.1.4.1.11.0.16','An ospfMaxAgeLsa trap signifies  that  one  of $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfMaxAgeLsa trap signifies  that  one  of\nthe LSA in the router\'s link-state database has\naged to MaxAge.\nVariables:\n  1: snOspfRouterId\n  2: snOspfLsdbAreaId\n  3: snOspfLsdbType\n  4: snOspfLsdbLsId\n  5: snOspfLsdbRouterId\n'),(480,'snOspfLsdbOverflow','.1.3.6.1.4.1.11.0.17','An ospfLsdbOverflow trap  signifies  that  the $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfLsdbOverflow trap  signifies  that  the\nnumber of LSAs in the router\'s link-state data-\nbase has exceeded ospfExtLsdbLimit.\nVariables:\n  1: snOspfRouterId\n  2: snOspfExtLsdbLimit\n'),(481,'snOspfLsdbApproachingOverflow','.1.3.6.1.4.1.11.0.18','An ospfLsdbApproachingOverflow trap  signifies $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'An ospfLsdbApproachingOverflow trap  signifies\nthat  the  number of LSAs in the router\'s link-\nstate database has exceeded ninety  percent  of\nospfExtLsdbLimit.\nVariables:\n  1: snOspfRouterId\n  2: snOspfExtLsdbLimit\n'),(482,'snTrapL4MaxSessionLimitReached','.1.3.6.1.4.1.11.0.19','The SNMP trap that is generated when the maximum number $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the maximum number\nof connections reached.\nVariables:\n  1: snL4MaxSessionLimit\n'),(483,'snTrapL4TcpSynLimitReached','.1.3.6.1.4.1.11.0.20','The SNMP trap that is generated when the number of TCP $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the number of TCP\nSYN limits reached.\nVariables:\n  1: snL4TcpSynLimit\n'),(484,'snTrapL4RealServerUp','.1.3.6.1.4.1.11.0.21','The SNMP trap that is generated when the load balancing $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the load balancing\nreal server is up.\nVariables:\n  1: snL4TrapRealServerIP\n  2: snL4TrapRealServerName\n'),(485,'snTrapL4RealServerDown','.1.3.6.1.4.1.11.0.22','The SNMP trap that is generated when the load balancing $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the load balancing\nreal server is down.\nVariables:\n  1: snL4TrapRealServerIP\n  2: snL4TrapRealServerName\n'),(486,'snTrapL4RealServerPortUp','.1.3.6.1.4.1.11.0.23','The SNMP trap that is generated when the load balancing $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the load balancing\nreal server TCP port is up.\nVariables:\n  1: snL4TrapRealServerIP\n  2: snL4TrapRealServerName\n  3: snL4TrapRealServerPort\n'),(487,'snTrapL4RealServerPortDown','.1.3.6.1.4.1.11.0.24','The SNMP trap that is generated when the load balancing $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the load balancing\nreal server TCP port is down.\nVariables:\n  1: snL4TrapRealServerIP\n  2: snL4TrapRealServerName\n  3: snL4TrapRealServerPort\n'),(488,'snTrapL4RealServerMaxConnectionLimitReached','.1.3.6.1.4.1.11.0.25','The SNMP trap that is generated when the real server reaches $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the real server reaches\nmaximum number of connections.\nVariables:\n  1: snL4TrapRealServerIP\n  2: snL4TrapRealServerName\n  3: snL4TrapRealServerCurConnections\n'),(489,'snTrapL4BecomeStandby','.1.3.6.1.4.1.11.0.26','The SNMP trap that is generated when the server load $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the server load\nbalancing switch changes state from active to standby.\nVariables:\n'),(490,'snTrapL4BecomeActive','.1.3.6.1.4.1.11.0.27','The SNMP trap that is generated when the server load $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the server load\nbalancing switch changes state from standby to active.\nVariables:\n'),(491,'snTrapModuleInserted','.1.3.6.1.4.1.11.0.28','The SNMP trap that is generated when a module was inserted $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when a module was inserted\nto the chassis during system running.\nVariables:\n  1: snAgentBrdIndex\n'),(492,'snTrapModuleRemoved','.1.3.6.1.4.1.11.0.29','The SNMP trap that is generated when a module was removed $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when a module was removed\nfrom the chassis during system running.\nVariables:\n  1: snAgentBrdIndex\n'),(493,'snTrapChasPwrSupplyFailed','.1.3.6.1.4.1.11.0.30','The SNMP trap that is generated when a power supply fails $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when a power supply fails\nto operate normally.\nVariables:\n  1: snChasPwrSupplyIndex\n  2: snChasPwrSupplyDescription\n'),(494,'snTrapChasFanFailed','.1.3.6.1.4.1.11.0.31','The SNMP trap that is generated when a fan fails $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when a fan fails\nto operate normally.\nVariables:\n  1: snChasFanIndex\n  2: snChasFanDescription\n'),(495,'snTrapLockedAddressViolation2','.1.3.6.1.4.1.11.0.32','The SNMP trap that is generated when more source MAC addresses $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when more source MAC addresses\nare received from a port than the maximum number of addresses\nconfigured to that port.\nVariables:\n  1: snAgGblTrapMessage\n'),(496,'snTrapFsrpIfStateChange','.1.3.6.1.4.1.11.0.33','The SNMP trap that is generated when a FSRP routing device $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when a FSRP routing device\nchanged state from active to standby or vice-versa.\nVariables:\n  1: snAgGblTrapMessage\n'),(497,'snTrapVrrpIfStateChange','.1.3.6.1.4.1.11.0.34','The SNMP trap that is generated when a VRRP routing device $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when a VRRP routing device\nchanged state from master to backup or vice-versa.\nVariables:\n  1: snAgGblTrapMessage\n'),(498,'snTrapMgmtModuleRedunStateChange','.1.3.6.1.4.1.11.0.35','The SNMP trap that is generated when the management module $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the management module\nchanges redundancy state.\nVariables:\n  1: snAgGblTrapMessage\n'),(499,'snTrapTemperatureWarning','.1.3.6.1.4.1.11.0.36','The SNMP trap that is generated when the actual temperature $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the actual temperature\nreading is above the warning temperature threshold.\nVariables:\n  1: snAgGblTrapMessage\n'),(500,'snTrapAccessListDeny','.1.3.6.1.4.1.11.0.37','The SNMP trap that is generated when a packet was denied $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when a packet was denied\nby an access list.\nVariables:\n  1: snAgGblTrapMessage\n'),(501,'snTrapMacFilterDeny','.1.3.6.1.4.1.11.0.38','The SNMP trap that is generated when a packet was denied $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when a packet was denied\nby a MAC address filter.\nVariables:\n  1: snAgGblTrapMessage\n'),(502,'snTrapL4GslbRemoteUp','.1.3.6.1.4.1.11.0.39','The SNMP trap that is generated when the connection to the remote SI is established. $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the connection to the remote SI is established.\nVariables:\n  1: snAgGblTrapMessage\n'),(503,'snTrapL4GslbRemoteDown','.1.3.6.1.4.1.11.0.40','The SNMP trap that is generated when the connection to the remote SI is down. $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the connection to the remote SI is down.\nVariables:\n  1: snAgGblTrapMessage\n'),(504,'snTrapL4GslbRemoteControllerUp','.1.3.6.1.4.1.11.0.41','The SNMP trap that is generated when the connection to the GSLB SI is established. $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the connection to the GSLB SI is established.\nVariables:\n  1: snAgGblTrapMessage\n'),(505,'snTrapL4GslbRemoteControllerDown','.1.3.6.1.4.1.11.0.42','The SNMP trap that is generated when the connection to the GSLB SI is down. $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when the connection to the GSLB SI is down.\nVariables:\n  1: snAgGblTrapMessage\n'),(506,'snTrapL4GslbHealthCheckIpUp','.1.3.6.1.4.1.11.0.43','The SNMP trap that is generated when GSLB health check for an address transitions $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when GSLB health check for an address transitions\nfrom down to active state.\nVariables:\n  1: snAgGblTrapMessage\n'),(507,'snTrapL4GslbHealthCheckIpDown','.1.3.6.1.4.1.11.0.44','The SNMP trap that is generated when GSLB health check for an address transitions $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when GSLB health check for an address transitions\nfrom active to down state.\nVariables:\n  1: snAgGblTrapMessage\n'),(508,'snTrapL4GslbHealthCheckIpPortUp','.1.3.6.1.4.1.11.0.45','The SNMP trap that is generated when a given port for a health check address is up. $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when a given port for a health check address is up.\nVariables:\n  1: snAgGblTrapMessage\n'),(509,'snTrapL4GslbHealthCheckIpPortDown','.1.3.6.1.4.1.11.0.46','The SNMP trap that is generated when a given port for a health check address is down. $*','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The SNMP trap that is generated when a given port for a health check address is down.\nVariables:\n  1: snAgGblTrapMessage\n'),(512,'tapeAlertTrap3','.1.3.6.1.4.1.11.2.3.9.7.1.0.3','HP TapeAlert #3: Hba$1:Channel$2:ScsiID$3 Tape Device Has Detected Read or Write Data Error','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The operation has stopped because an error has\noccured while reading or writing data which the\ndrive cannot correct.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(513,'tapeAlertTrap4','.1.3.6.1.4.1.11.2.3.9.7.1.0.4','HP TapeAlert #4: Hba$1:Channel$2:ScsiID$3 Tape Device Has Detected Faulty Media [$4]','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Your data is at risk:\n1. Copy any data you require from this tape\n2. Do not use this tape again\n3. Restart the operation with a different tape\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n  4: currentMedia\n'),(514,'tapeAlertTrap5','.1.3.6.1.4.1.11.2.3.9.7.1.0.5','HP TapeAlert #5: Hba$1:Channel$2:ScsiID$3 Tape Device May Have Read Fault - Call Helpline','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The tape is damaged or the drive is faulty.\nCall the tape drive supplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(515,'tapeAlertTrap6','.1.3.6.1.4.1.11.2.3.9.7.1.0.6','HP TapeAlert #6: Hba$1:Channel$2:ScsiID$3 Tape Device May Have Write Fault - Call Helpline','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The tape is from a faulty batch or the tape drive\nis faulty:\n1. Use a good tape to test the drive.\n2. If the problem persists, call the tape drive \nsupplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(516,'tapeAlertTrap7','.1.3.6.1.4.1.11.2.3.9.7.1.0.7','HP TapeAlert #7: Hba$1:Channel$2:ScsiID$3 Tape Device Has Detected Worn Out Media [$4]','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The tape cartridge has reached the end of its \ncalculated useful life:\n1. Copy any data you need to another tape\n2. Discard the old tape.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n  4: currentMedia\n'),(517,'tapeAlertTrap8','.1.3.6.1.4.1.11.2.3.9.7.1.0.8','HP TapeAlert #8: Hba$1:Channel$2:ScsiID$3 Media Loaded In Tape Device Is Not Data Grade','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The tape cartridge is not data-grade. \nAny data you back up to the tape is at risk. \nReplace the cartridge with a data-grade tape.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(518,'tapeAlertTrap9','.1.3.6.1.4.1.11.2.3.9.7.1.0.9','HP TapeAlert #9: Hba$1:Channel$2:ScsiID$3 Tape Device Attempted Backup to Write-Protected Tape','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'You are trying to write to a write-protected \ncartridge. Remove the write-protection or use \nanother tape.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(533,'tapeAlertTrap29','.1.3.6.1.4.1.11.2.3.9.7.1.0.29','HP TapeAlert #29: Hba$1:Channel$2:ScsiID$3 Tape Device Requires Preventative Maintenance','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Preventive maintenance of the tape drive is required.\nCheck the tape drive users manual for device specific \npreventive maintenance tasks or call the tape drive \nsupplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(534,'tapeAlertTrap30','.1.3.6.1.4.1.11.2.3.9.7.1.0.30','HP TapeAlert #30: Hba$1:Channel$2:ScsiID$3 Tape Device Has Hardware Fault - Reset Drive','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The tape drive has a hardware fault:\n1. Eject the tape or magazine.\n2. Reset the drive.\n3. Restart the operation.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(535,'tapeAlertTrap31','.1.3.6.1.4.1.11.2.3.9.7.1.0.31','HP TapeAlert #31: Hba$1:Channel$2:ScsiID$3 Tape Device Has Hardware Fault - Call Helpline','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The tape drive has a hardware fault:\n1. Turn the tape drive off and then on again.\n2. Restart the operation.\n3. If the problem persists, call the tape \ndrive supplier helpline.\nCheck the tape drive users manual for device specific \ninstructions on turning the device power on and off.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(536,'tapeAlertTrap32','.1.3.6.1.4.1.11.2.3.9.7.1.0.32','HP TapeAlert #32: Hba$1:Channel$2:ScsiID$3 Tape Device Has Host Interface Fault','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The tape drive has a problem with the host \ninterface:\n1. Check the cables and cable connections.\n2. Restart the operation.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(537,'tapeAlertTrap33','.1.3.6.1.4.1.11.2.3.9.7.1.0.33','HP TapeAlert #33: Hba$1:Channel$2:ScsiID$3 Tape Device Has Eject Media Request','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The operation has failed:\n1. Eject the tape or magazine.\n2. Insert the tape or magazine again.\n3. Restart the operation.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(538,'tapeAlertTrap34','.1.3.6.1.4.1.11.2.3.9.7.1.0.34','HP TapeAlert #34: Hba$1:Channel$2:ScsiID$3 Tape Device Has Firmware Download Fault','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The firmware download has failed because you \nhave tried to use the incorrect firmware for \nthis tape drive.\nObtain the correct firmware and try again.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(539,'tapeAlertTrap35','.1.3.6.1.4.1.11.2.3.9.7.1.0.35','HP TapeAlert #35: Hba$1:Channel$2:ScsiID$3 Tape Device Humidity Specification Exceeded','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Environmental conditions inside the tape drive are \nexceeding the humidity specifications\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(540,'tapeAlertTrap36','.1.3.6.1.4.1.11.2.3.9.7.1.0.36','HP TapeAlert #36: Hba$1:Channel$2:ScsiID$3 Tape Device Temperature Specification Exceeded','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Environmental conditions inside the tape drive are \nexceeding the temperature specifications\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(541,'tapeAlertTrap37','.1.3.6.1.4.1.11.2.3.9.7.1.0.37','HP TapeAlert #37: Hba$1:Channel$2:ScsiID$3 Tape Device Voltage Specification Exceeded','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The voltage supply to the tape drive exceeds specifications\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(542,'tapeAlertTrap38','.1.3.6.1.4.1.11.2.3.9.7.1.0.38','HP TapeAlert #38: Hba$1:Channel$2:ScsiID$3 Tape Device Predicted to Fail - Call Helpline','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'A hardware failure of the tape drive is predicted. \nCall the tape drive supplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(543,'tapeAlertTrap39','.1.3.6.1.4.1.11.2.3.9.7.1.0.39','HP TapeAlert #39: Hba$1:Channel$2:ScsiID$3 Tape Device May Have Hardware Fault - Run Diagnostics','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The tape drive may have a hardware fault.\nRun extended diagnostics to verify and diagnose the problem.\nCheck the tape drive users manual for device specific \ninstructions on running extended diagnostic tests.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(544,'tapeAlertTrap40','.1.3.6.1.4.1.11.2.3.9.7.1.0.40','HP TapeAlert #40: Hba$1:Channel$2:ScsiID$3 Tape Device Has Autoloader Communications Fault','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The changer mechanism is having difficulty \ncommunicating with the tape drive:\n1. Turn the autoloader off then on.\n2. Restart the operation.\n3. If problem persists, call the tape drive \nsupplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(545,'tapeAlertTrap41','.1.3.6.1.4.1.11.2.3.9.7.1.0.41','HP TapeAlert #41: Hba$1:Channel$2:ScsiID$3 Tape Device Detects Stray Tape In Autoloader','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'A tape has been left in the autoloader by a \nprevious hardware fault:\n1. Insert an empty magazine to clear the fault.\n2. If the fault does not clear, turn the autoloader \noff and then on again.\n3. If the problem persists, call the tape drive \nsupplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(546,'tapeAlertTrap42','.1.3.6.1.4.1.11.2.3.9.7.1.0.42','HP TapeAlert #42: Hba$1:Channel$2:ScsiID$3 Tape Device Has Autoloader Mechanism Fault','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'There is a problem with the autoloader mechanism.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(547,'tapeAlertTrap43','.1.3.6.1.4.1.11.2.3.9.7.1.0.43','HP TapeAlert #43: Hba$1:Channel$2:ScsiID$3 Tape Device Has Autoloader Door Open','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The operation has failed because the autoloader \ndoor is open:\n1. Clear any obstructions from the autoloader door.\n2. Eject the magazine and then insert it again.\n3. If the fault does not clear, turn the autoloader \noff and then on again.\n4. If the problem persists, call the tape drive \nsupplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(548,'tapeAlertTrap44','.1.3.6.1.4.1.11.2.3.9.7.1.0.44','HP TapeAlert #44: Hba$1:Channel$2:ScsiID$3 Autoloader Has Hardware Fault - Call Helpline','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The autoloader has a hardware fault:\n1. Turn the autoloader off and then on again.\n2. Restart the operation.\n3. If the problem persists, call the tape drive supplier helpline.\nCheck the autoloader users manual for device specific \ninstructions on turning the device power on and off.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(549,'tapeAlertTrap45','.1.3.6.1.4.1.11.2.3.9.7.1.0.45','HP TapeAlert #45: Hba$1:Channel$2:ScsiID$3 Autoloader Cannot Operate Without Magazine','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The autoloader cannot operate without the magazine.\n1. Insert the magazine into the autoloader\n2. Restart the operation.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(550,'tapeAlertTrap46','.1.3.6.1.4.1.11.2.3.9.7.1.0.46','HP TapeAlert #46: Hba$1:Channel$2:ScsiID$3 Autoloader Predicted to Fail - Call Helpline','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'A hardware failure of the changer mechanism is predicted. \nCall the tape drive supplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(557,'tapeAlertTrap262','.1.3.6.1.4.1.11.2.3.9.7.1.0.262','HP TapeAlert #262: Hba$1:Channel$2:ScsiID$3 Library Predicted to Fail - Call Helpline','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'A hardware failure of the library is predicted. \nCall the library supplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(559,'tapeAlertTrap264','.1.3.6.1.4.1.11.2.3.9.7.1.0.264','HP TapeAlert #264: Hba$1:Channel$2:ScsiID$3 Library Humidity Specification Exceeded','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'General environmental conditions inside the library have \nexceeded the humidity specifications.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(561,'tapeAlertTrap266','.1.3.6.1.4.1.11.2.3.9.7.1.0.266','HP TapeAlert #266: Hba$1:Channel$2:ScsiID$3 Library Voltage Specification Exceeded','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'he voltage supply to the library exceeds specifications.  \nThere is a potential problem with the power supply or failure \nof a redundant power supply\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(562,'tapeAlertTrap267','.1.3.6.1.4.1.11.2.3.9.7.1.0.267','HP TapeAlert #267: Hba$1:Channel$2:ScsiID$3 Library Detects Stray Tape In Drive','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'A cartridge has been left in a drive inside the library by a \nprevious hardware fault:\n1. Insert an empty magazine to clear the fault.\n2. If the fault does not clear, turn the library off and then on again.\n3. If the problem persists, call the library supplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(563,'tapeAlertTrap268','.1.3.6.1.4.1.11.2.3.9.7.1.0.268','HP TapeAlert #268: Hba$1:Channel$2:ScsiID$3 Library Has Problems Picking Cartridge from Slot','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'There is a potential problem with a drive ejecting cartridges short or \nwith the library mechanism picking a cartridge from a slot.\n1. No action needs to be taken at this time. \n2. If the problem persists, call the library supplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(564,'tapeAlertTrap269','.1.3.6.1.4.1.11.2.3.9.7.1.0.269','HP TapeAlert #269: Hba$1:Channel$2:ScsiID$3 Library Has Problems Placing Cartridge into Slot','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'There is a potential problem with the library mechanism \nplacing a cartridge into a slot\n1. No action needs to be taken at this time. \n2. If the problem persists, call the library supplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(565,'tapeAlertTrap270','.1.3.6.1.4.1.11.2.3.9.7.1.0.270','HP TapeAlert #270: Hba$1:Channel$2:ScsiID$3 Library Has Problems Loading Cartridge into Drive','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'There is a potential problem with a drive or the library \nmechanism loading cartridges, or an incompatible cartridge.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(566,'tapeAlertTrap271','.1.3.6.1.4.1.11.2.3.9.7.1.0.271','HP TapeAlert #271: Hba$1:Channel$2:ScsiID$3 Library Door is Open','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The operation has failed because the library door is open:\n1. Clear any obstructions from the library door.\n2. Close the library door.\n3. If the problem persists, call the library supplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(567,'tapeAlertTrap272','.1.3.6.1.4.1.11.2.3.9.7.1.0.272','HP TapeAlert #272: Hba$1:Channel$2:ScsiID$3 Library Has Mechanical Fault with Mailslot','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'There is a mechanical problem with the \nlibrary media import/export mailslot.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(568,'tapeAlertTrap273','.1.3.6.1.4.1.11.2.3.9.7.1.0.273','HP TapeAlert #273: Hba$1:Channel$2:ScsiID$3 Library Cannot Operate Without Magazine','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The library cannot operate without the magazine.\n1. Insert the magazine into the library\n2. Restart the operation.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(569,'tapeAlertTrap274','.1.3.6.1.4.1.11.2.3.9.7.1.0.274','HP TapeAlert #274: Hba$1:Channel$2:ScsiID$3 Library Security Has Been Compromised','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Library security has been compromised\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(570,'tapeAlertTrap275','.1.3.6.1.4.1.11.2.3.9.7.1.0.275','HP TapeAlert #275: Hba$1:Channel$2:ScsiID$3 Library Security Mode Changed','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The security mode of the library has been changed.\nThe library has either been put into secure mode, \nor the library has exited the secure mode.\nThis is for information purposes only. No action is required.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(571,'tapeAlertTrap276','.1.3.6.1.4.1.11.2.3.9.7.1.0.276','HP TapeAlert #276: Hba$1:Channel$2:ScsiID$3 Library Manually Turned Offline','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The library has been manually turned offline and is unavailable for use.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(572,'tapeAlertTrap277','.1.3.6.1.4.1.11.2.3.9.7.1.0.277','HP TapeAlert #277: Hba$1:Channel$2:ScsiID$3 Library Drive Turned Offline','0',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'A drive inside the library has been taken offline.\nThis is for information purposes only. No action is required.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(573,'tapeAlertTrap278','.1.3.6.1.4.1.11.2.3.9.7.1.0.278','HP TapeAlert #278: Hba$1:Channel$2:ScsiID$3 Library Has Problems Reading Barcode Labels','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'There is a potential problem with the barcode label or \nthe scanner hardware in the library mechanism.\n1. No action needs to be taken at this time. \n2. If the problem persists, call the library supplier helpline.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(574,'tapeAlertTrap279','.1.3.6.1.4.1.11.2.3.9.7.1.0.279','HP TapeAlert #279: Hba$1:Channel$2:ScsiID$3 Library Inventory is Inconsistent','2',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'The library has detected a inconsistency in its inventory.\n1. Redo the library inventory to correct inconsistency.\n2. Restart the operation \nCheck the applications users manual or the hardware users \nmanual for specific instructions on redoing the library inventory.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(575,'tapeAlertTrap280','.1.3.6.1.4.1.11.2.3.9.7.1.0.280','HP TapeAlert #280: Hba$1:Channel$2:ScsiID$3 Invalid Library Operation Attempted','1',NULL,2,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'A library operation has been attempted that is invalid at this time.\nVariables:\n  1: hbaNumber\n  2: hbaChannel\n  3: driveScsiID\n'),(576,'alertSystemUp','.1.3.6.1.4.1.674.10892.1.0.1001','Server Administrator Startup Complete: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Server Administrator has completed its initialization.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(577,'alertThermalShutdown','.1.3.6.1.4.1.674.10892.1.0.1004','Server Thermal Shutdown: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Thermal shutdown protection has been initiated.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(578,'alertTemperatureProbeNormal','.1.3.6.1.4.1.674.10892.1.0.1052','Server Temperature Normal: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Temperature probe has returned to a normal value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(579,'alertTemperatureProbeWarning','.1.3.6.1.4.1.674.10892.1.0.1053','Server Temperature Warning: $3','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Temperature probe has detected a warning value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(580,'alertTemperatureProbeFailure','.1.3.6.1.4.1.674.10892.1.0.1054','Server Temperature Failure: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Temperature probe has detected a failure value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(581,'alertTemperatureProbeNonRecoverable','.1.3.6.1.4.1.674.10892.1.0.1055','Server Temperature Non-recoverable: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Temperature probe has detected a non-recoverable value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(582,'alertCoolingDeviceNormal','.1.3.6.1.4.1.674.10892.1.0.1102','Server Cooling Device Normal: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Cooling device sensor has returned to a normal value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(583,'alertCoolingDeviceWarning','.1.3.6.1.4.1.674.10892.1.0.1103','Server Cooling Device Warning: $3','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Cooling device sensor has detected a warning value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(584,'alertCoolingDeviceFailure','.1.3.6.1.4.1.674.10892.1.0.1104','Server Cooling Device Failure: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Cooling device sensor has detected a failure value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(585,'alertCoolingDeviceNonRecoverable','.1.3.6.1.4.1.674.10892.1.0.1105','Server Cooling Device Non-recoverable: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Cooling device sensor has detected a non-recoverable value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(586,'alertVoltageProbeNormal','.1.3.6.1.4.1.674.10892.1.0.1152','Server Voltage Normal: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Voltage probe has returned to a normal value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(587,'alertVoltageProbeWarning','.1.3.6.1.4.1.674.10892.1.0.1153','Server Voltage Warning: $3','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Voltage probe has detected a warning value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(588,'alertVoltageProbeFailure','.1.3.6.1.4.1.674.10892.1.0.1154','Server Voltage Failure: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Voltage probe has detected a failure value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(589,'alertVoltageProbeNonRecoverable','.1.3.6.1.4.1.674.10892.1.0.1155','Server Voltage Non-recoverable: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Voltage probe has detected a non-recoverable value.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(590,'alertChassisIntrusionNormal','.1.3.6.1.4.1.674.10892.1.0.1252','Server Chassis Intrusion Normal: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Chassis intrusion has returned to normal.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(591,'alertRedundancyNormal','.1.3.6.1.4.1.674.10892.1.0.1304','Server Redundancy Normal: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Redundancy has returned to normal.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(592,'alertRedundancyDegraded','.1.3.6.1.4.1.674.10892.1.0.1305','Server Redundancy Degraded: $3','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Redundancy has been degraded.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(593,'alertRedundancyLost','.1.3.6.1.4.1.674.10892.1.0.1306','Server Redundancy Lost: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Redundancy has been lost.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(594,'alertPowerSupplyNormal','.1.3.6.1.4.1.674.10892.1.0.1352','Server Power Supply Normal: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Power supply has returned to normal.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(595,'alertPowerSupplyFailure','.1.3.6.1.4.1.674.10892.1.0.1354','Server Power Supply Failure: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Power supply has failed.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(596,'alertMemoryDeviceWarning','.1.3.6.1.4.1.674.10892.1.0.1403','Server Memory ECC Count Warning: $3','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Memory device ECC correctable error count crossed a warning threshold.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(597,'alertMemoryDeviceFailure','.1.3.6.1.4.1.674.10892.1.0.1404','Server Memory ECC Count Failure: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Memory device ECC correctable error count crossed a failure threshold.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(598,'alertMemoryDeviceNonRecoverable','.1.3.6.1.4.1.674.10892.1.0.1405','Server Memory ECC Count Non-recoverable: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Memory device ECC correctable error count crossed a non-recoverable threshold.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(599,'alertFanEnclosureInsertion','.1.3.6.1.4.1.674.10892.1.0.1452','Server Fan Enclosure Insertion: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Fan enclosure has been inserted into system.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(600,'alertFanEnclosureRemoval','.1.3.6.1.4.1.674.10892.1.0.1453','Server Fan Enclosure Removal: $3','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Fan enclosure has been removed from system.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(601,'alertFanEnclosureExtendedRemoval','.1.3.6.1.4.1.674.10892.1.0.1454','Server Fan Enclosure Extended Removal: $3','2',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Fan enclosure has been removed from system for an extended amount of time.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(602,'alertLogNormal','.1.3.6.1.4.1.674.10892.1.0.1552','Server Log Normal: $3','0',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Log size returned to a normal level.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(603,'alertLogWarning','.1.3.6.1.4.1.674.10892.1.0.1553','Server Log Warning: $3','1',NULL,6,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Log size is near or at capacity.\n--Novell NMS trap annotation\nVariables:\n  1: alertSystem\n  2: alertTableIndexOID\n  3: alertMessage\n  4: alertCurrentStatus\n  5: alertPreviousStatus\n  6: alertData\n'),(604,'ciscoConfigManEvent','.1.3.6.1.4.1.9.9.43.2.0.1','Notification of a configuration management event as $*','0',NULL,1,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'Notification of a configuration management event as\nrecorded in ccmHistoryEventTable.\nVariables:\n  1: ccmHistoryEventCommandSource\n  2: ccmHistoryEventConfigSource\n  3: ccmHistoryEventConfigDestination\n'),(605,'ccmCLIRunningConfigChanged','.1.3.6.1.4.1.9.9.43.2.0.2','This notification indicates that the running $*','0',NULL,1,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This notification indicates that the running\nconfiguration of the managed system has changed\nfrom the CLI.\nIf the managed system supports a separate \nconfiguration mode(where the configuration commands \nare entered under a  configuration session which \naffects the running configuration of the system), \nthen this notification is sent when the configuration \nmode is exited.\nDuring this configuration session there can be \none or more running configuration changes.\nVariables:\n  1: ccmHistoryRunningLastChanged\n  2: ccmHistoryEventTerminalType\n'),(606,'ccmCTIDRolledOver','.1.3.6.1.4.1.9.9.43.2.0.3','This notification indicates that the Config Change Tracking $*','0',NULL,1,'0',NULL,'0','0','0','0',NULL,NULL,'0','0','0',NULL,NULL,'0','0',NULL,NULL,'This notification indicates that the Config Change Tracking\nID has rolled over and will be reset.\nVariables:\n');
/*!40000 ALTER TABLE `traps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traps_group`
--

DROP TABLE IF EXISTS `traps_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traps_group` (
  `traps_group_id` int(11) DEFAULT NULL,
  `traps_group_name` varchar(255) NOT NULL,
  KEY `traps_group_id` (`traps_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traps_group`
--

LOCK TABLES `traps_group` WRITE;
/*!40000 ALTER TABLE `traps_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `traps_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traps_group_relation`
--

DROP TABLE IF EXISTS `traps_group_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traps_group_relation` (
  `traps_group_id` int(11) NOT NULL,
  `traps_id` int(11) NOT NULL,
  KEY `traps_group_id` (`traps_group_id`),
  KEY `traps_id` (`traps_id`),
  CONSTRAINT `traps_group_relation_ibfk_1` FOREIGN KEY (`traps_id`) REFERENCES `traps` (`traps_id`) ON DELETE CASCADE,
  CONSTRAINT `traps_group_relation_ibfk_2` FOREIGN KEY (`traps_group_id`) REFERENCES `traps_group` (`traps_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traps_group_relation`
--

LOCK TABLES `traps_group_relation` WRITE;
/*!40000 ALTER TABLE `traps_group_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `traps_group_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traps_matching_properties`
--

DROP TABLE IF EXISTS `traps_matching_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traps_matching_properties` (
  `tmo_id` int(11) NOT NULL AUTO_INCREMENT,
  `trap_id` int(11) DEFAULT NULL,
  `tmo_order` int(11) DEFAULT NULL,
  `tmo_regexp` varchar(255) DEFAULT NULL,
  `tmo_string` varchar(255) DEFAULT NULL,
  `tmo_status` int(11) DEFAULT NULL,
  `severity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tmo_id`),
  KEY `trap_id` (`trap_id`),
  KEY `traps_matching_properties_ibfk_2` (`severity_id`),
  CONSTRAINT `traps_matching_properties_ibfk_1` FOREIGN KEY (`trap_id`) REFERENCES `traps` (`traps_id`) ON DELETE CASCADE,
  CONSTRAINT `traps_matching_properties_ibfk_2` FOREIGN KEY (`severity_id`) REFERENCES `service_categories` (`sc_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traps_matching_properties`
--

LOCK TABLES `traps_matching_properties` WRITE;
/*!40000 ALTER TABLE `traps_matching_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `traps_matching_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traps_preexec`
--

DROP TABLE IF EXISTS `traps_preexec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traps_preexec` (
  `trap_id` int(11) DEFAULT NULL,
  `tpe_order` int(11) DEFAULT NULL,
  `tpe_string` varchar(512) DEFAULT NULL,
  KEY `trap_id` (`trap_id`),
  CONSTRAINT `traps_preexec_ibfk_1` FOREIGN KEY (`trap_id`) REFERENCES `traps` (`traps_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traps_preexec`
--

LOCK TABLES `traps_preexec` WRITE;
/*!40000 ALTER TABLE `traps_preexec` DISABLE KEYS */;
/*!40000 ALTER TABLE `traps_preexec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traps_service_relation`
--

DROP TABLE IF EXISTS `traps_service_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traps_service_relation` (
  `tsr_id` int(11) NOT NULL AUTO_INCREMENT,
  `traps_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tsr_id`),
  KEY `service_index` (`service_id`),
  KEY `traps_index` (`traps_id`),
  CONSTRAINT `traps_service_relation_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `traps_service_relation_ibfk_3` FOREIGN KEY (`traps_id`) REFERENCES `traps` (`traps_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traps_service_relation`
--

LOCK TABLES `traps_service_relation` WRITE;
/*!40000 ALTER TABLE `traps_service_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `traps_service_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traps_vendor`
--

DROP TABLE IF EXISTS `traps_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traps_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) DEFAULT NULL,
  `alias` varchar(254) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traps_vendor`
--

LOCK TABLES `traps_vendor` WRITE;
/*!40000 ALTER TABLE `traps_vendor` DISABLE KEYS */;
INSERT INTO `traps_vendor` VALUES (1,'Cisco','Cisco Networks',''),(2,'HP','HP Networks',''),(3,'3com','3Com',NULL),(4,'Linksys','Linksys',''),(6,'Dell','Dell',''),(7,'Generic','Generic','References Generic Traps'),(9,'Zebra','Zebra',''),(11,'HP-Compaq','HP and Compaq Systems','');
/*!40000 ALTER TABLE `traps_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_img`
--

DROP TABLE IF EXISTS `view_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_name` varchar(255) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `img_comment` text,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_img`
--

LOCK TABLES `view_img` WRITE;
/*!40000 ALTER TABLE `view_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_img_dir`
--

DROP TABLE IF EXISTS `view_img_dir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_img_dir` (
  `dir_id` int(11) NOT NULL AUTO_INCREMENT,
  `dir_name` varchar(255) DEFAULT NULL,
  `dir_alias` varchar(255) DEFAULT NULL,
  `dir_comment` text,
  PRIMARY KEY (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_img_dir`
--

LOCK TABLES `view_img_dir` WRITE;
/*!40000 ALTER TABLE `view_img_dir` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_img_dir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_img_dir_relation`
--

DROP TABLE IF EXISTS `view_img_dir_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_img_dir_relation` (
  `vidr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dir_dir_parent_id` int(11) DEFAULT NULL,
  `img_img_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vidr_id`),
  KEY `directory_parent_index` (`dir_dir_parent_id`),
  KEY `image_index` (`img_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_img_dir_relation`
--

LOCK TABLES `view_img_dir_relation` WRITE;
/*!40000 ALTER TABLE `view_img_dir_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_img_dir_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_metrics`
--

DROP TABLE IF EXISTS `virtual_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_metrics` (
  `vmetric_id` int(11) NOT NULL AUTO_INCREMENT,
  `index_id` int(11) DEFAULT NULL,
  `vmetric_name` varchar(255) DEFAULT NULL,
  `def_type` enum('0','1') DEFAULT '0',
  `rpn_function` varchar(255) DEFAULT NULL,
  `warn` int(11) DEFAULT NULL,
  `crit` int(11) DEFAULT NULL,
  `unit_name` varchar(32) DEFAULT NULL,
  `hidden` enum('0','1') DEFAULT '0',
  `comment` text,
  `vmetric_activate` enum('0','1') DEFAULT NULL,
  `ck_state` enum('0','1','2') DEFAULT NULL,
  PRIMARY KEY (`vmetric_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_metrics`
--

LOCK TABLES `virtual_metrics` WRITE;
/*!40000 ALTER TABLE `virtual_metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_models`
--

DROP TABLE IF EXISTS `widget_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_models` (
  `widget_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `directory` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `screenshot` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `autoRefresh` int(11) DEFAULT NULL,
  PRIMARY KEY (`widget_model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_models`
--

LOCK TABLES `widget_models` WRITE;
/*!40000 ALTER TABLE `widget_models` DISABLE KEYS */;
INSERT INTO `widget_models` VALUES (1,'Graph Monitoring','Widget for displaying RRD graphs','./widgets/graph-monitoring/index.php','1.3.0','graph-monitoring','Centreon','contact@centreon.com','http://www.centreon.com','centreon, widget, rrd, monitoring','','./widgets/graph-monitoring/resources/centreon-logo.png',10),(2,'Host Monitoring','Widget for displaying host monitoring information','./widgets/host-monitoring/index.php','1.4.2','host-monitoring','Centreon','contact@centreon.com','http://www.centreon.com','centreon, widget, host, monitoring','','./widgets/host-monitoring/resources/centreon-logo.png',10),(3,'Hostgroup Monitoring','Widget for displaying hostgroup monitoring information','./widgets/hostgroup-monitoring/index.php','1.3.0','hostgroup-monitoring','Centreon','contact@centreon.com','http://www.centreon.com','centreon, widget, hostgroup, host, monitoring','','./widgets/hostgroup-monitoring/resources/centreon-logo.png',10),(4,'Service Monitoring','Widget for displaying service monitoring information','./widgets/service-monitoring/index.php','1.4.2','service-monitoring','Centreon','contact@centreon.com','http://www.centreon.com','centreon, widget, service, monitoring','','./widgets/service-monitoring/resources/centreon-logo.png',10),(5,'Servicegroup Monitoring','Widget for displaying servicegroup monitoring information','./widgets/servicegroup-monitoring/index.php','1.3.1','servicegroup-monitoring','Centreon','contact@centreon.com','http://www.centreon.com','centreon, widget, servicegroup, service, monitoring','','./widgets/servicegroup-monitoring/resources/centreon-logo.png',10);
/*!40000 ALTER TABLE `widget_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_parameters`
--

DROP TABLE IF EXISTS `widget_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_parameters` (
  `parameter_id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(255) NOT NULL,
  `parameter_code_name` varchar(255) NOT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `parameter_order` tinyint(6) NOT NULL,
  `header_title` varchar(255) DEFAULT NULL,
  `require_permission` varchar(255) NOT NULL,
  `widget_model_id` int(11) NOT NULL,
  `field_type_id` int(11) NOT NULL,
  PRIMARY KEY (`parameter_id`),
  KEY `fk_widget_param_widget_id` (`widget_model_id`),
  KEY `fk_widget_field_type_id` (`field_type_id`),
  CONSTRAINT `fk_widget_field_type_id` FOREIGN KEY (`field_type_id`) REFERENCES `widget_parameters_field_type` (`field_type_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_widget_param_widget_id` FOREIGN KEY (`widget_model_id`) REFERENCES `widget_models` (`widget_model_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_parameters`
--

LOCK TABLES `widget_parameters` WRITE;
/*!40000 ALTER TABLE `widget_parameters` DISABLE KEYS */;
INSERT INTO `widget_parameters` VALUES (1,'Service','service','',1,'Resource','0',1,15),(2,'Graph period','graph_period','',2,'Filter','0',1,5),(3,'Refresh Interval (seconds)','refresh_interval','60',3,'Misc','0',1,1),(4,'Host Name Search','host_name_search','',1,'Filters','0',2,7),(5,'Display Up','host_up','1',2,NULL,'0',2,2),(6,'Display Down','host_down','1',3,NULL,'0',2,2),(7,'Display Unreachable','host_unreachable','1',4,NULL,'0',2,2),(8,'Criticities Filters (criticities name separated by \',\')','criticality_filter','',5,NULL,'0',2,1),(9,'Acknowledgement Filter','acknowledgement_filter','',6,NULL,'0',2,5),(10,'Downtime Filter','downtime_filter','',7,NULL,'0',2,5),(11,'State Type','state_type_filter','',8,NULL,'0',2,5),(12,'Hostgroup','hostgroup','',9,NULL,'0',2,13),(13,'Results','entries','50',10,NULL,'0',2,6),(14,'Display Host Name','display_host_name','1',11,'Columns','0',2,2),(15,'Display Severities','display_severities','1',12,NULL,'0',2,2),(16,'Display Host Alias','display_host_alias','0',13,NULL,'0',2,2),(17,'Display Status','display_status','1',14,NULL,'0',2,2),(18,'Display IP','display_ip','1',15,NULL,'0',2,2),(19,'Display Last Check','display_last_check','1',16,NULL,'0',2,2),(20,'Display Duration','display_duration','1',17,NULL,'0',2,2),(21,'Display Hard State Duration','display_hard_state_duration','1',18,NULL,'0',2,2),(22,'Display Tries','display_tries','1',19,NULL,'0',2,2),(23,'Display Output','display_output','1',20,NULL,'0',2,2),(24,'Output Length','output_length','50',21,NULL,'0',2,6),(25,'Display Last Comment','display_last_comment','0',22,NULL,'0',2,2),(26,'Comment Length','comment_length','50',23,NULL,'0',2,6),(27,'Order By','order_by','',24,NULL,'0',2,8),(28,'Refresh Interval (seconds)','refresh_interval','30',25,'Misc','0',2,1),(29,'Enable pagination and more actions','more_views','0',26,NULL,'0',2,2),(30,'Hostgroup Name Search','hg_name_search','',1,'Filters','0',3,7),(31,'Enable Detailed Mode','enable_detailed_mode','0',2,NULL,'0',3,2),(32,'Results','entries','20',3,NULL,'0',3,6),(33,'Order By','order_by','',4,NULL,'0',3,8),(34,'Refresh Interval (seconds)','refresh_interval','30',5,'Misc','0',3,1),(35,'Host Name','host_name_search','',1,'Filters','0',4,7),(36,'Service Description','service_description_search','',2,NULL,'0',4,7),(37,'Display Ok','svc_ok','1',3,NULL,'0',4,2),(38,'hide services with DOWN host','hide_down_host','0',4,NULL,'0',4,2),(39,'Display Warning','svc_warning','1',5,NULL,'0',4,2),(40,'Display Critical','svc_critical','1',6,NULL,'0',4,2),(41,'Display Unknown','svc_unknown','1',7,NULL,'0',4,2),(42,'Display Pending','svc_pending','1',8,NULL,'0',4,2),(43,'Criticities Filters (criticities name separated by \',\')','criticality_filter','',9,NULL,'0',4,1),(44,'Acknowledgement Filter','acknowledgement_filter','all',10,NULL,'0',4,5),(45,'Downtime Filter','downtime_filter','all',11,NULL,'0',4,5),(46,'State Type','state_type_filter','',12,NULL,'0',4,5),(47,'Hostgroup','hostgroup','',13,NULL,'0',4,13),(48,'Servicegroup','servicegroup','',14,NULL,'0',4,14),(49,'Results','entries','50',15,NULL,'0',4,6),(50,'Output','output_search','',16,NULL,'0',4,7),(51,'Display Severities','display_severities','1',17,'Columns','0',4,2),(52,'Display Host Name','display_host_name','1',18,NULL,'0',4,2),(53,'Display Service Description','display_svc_description','1',19,NULL,'0',4,2),(54,'Display Output','display_output','1',20,NULL,'0',4,2),(55,'Output Length','output_length','50',21,NULL,'0',4,6),(56,'Display Status','display_status','1',22,NULL,'0',4,2),(57,'Display Last Check','display_last_check','1',23,NULL,'0',4,2),(58,'Display Duration','display_duration','1',24,NULL,'0',4,2),(59,'Display Hard State Duration','display_hard_state_duration','1',25,NULL,'0',4,2),(60,'Display Tries','display_tries','1',26,NULL,'0',4,2),(61,'Display Last Comment','display_last_comment','0',27,NULL,'0',4,2),(62,'Display Latency','display_latency','0',28,NULL,'0',4,2),(63,'Display Execution Time','display_execution_time','0',29,NULL,'0',4,2),(64,'Comment Length','comment_length','50',30,NULL,'0',4,6),(65,'Order By','order_by','',31,NULL,'0',4,8),(66,'Refresh Interval (seconds)','refresh_interval','30',32,'Misc','0',4,1),(67,'Enable pagination and more actions','more_views','0',33,NULL,'0',4,2),(68,'Servicegroup Name Search','sg_name_search','',1,'Filters','0',5,7),(69,'Enable Detailed Mode','enable_detailed_mode','0',2,NULL,'0',5,2),(70,'Results','entries','10',3,NULL,'0',5,6),(71,'Order By','order_by','',4,NULL,'0',5,8),(72,'Refresh Interval (seconds)','refresh_interval','30',5,'Misc','0',5,1),(73,'Enable pagination and more actions','more_views','0',6,NULL,'0',5,2);
/*!40000 ALTER TABLE `widget_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_parameters_field_type`
--

DROP TABLE IF EXISTS `widget_parameters_field_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_parameters_field_type` (
  `field_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `ft_typename` varchar(50) NOT NULL,
  `is_connector` tinyint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_parameters_field_type`
--

LOCK TABLES `widget_parameters_field_type` WRITE;
/*!40000 ALTER TABLE `widget_parameters_field_type` DISABLE KEYS */;
INSERT INTO `widget_parameters_field_type` VALUES (1,'text',0),(2,'boolean',0),(3,'hidden',0),(4,'password',0),(5,'list',0),(6,'range',0),(7,'compare',0),(8,'sort',0),(9,'date',0),(10,'host',1),(11,'hostTemplate',1),(12,'serviceTemplate',1),(13,'hostgroup',1),(14,'servicegroup',1),(15,'service',1),(16,'poller',1),(17,'hostCategories',1),(18,'serviceCategories',1),(19,'metric',1),(20,'ba',1),(21,'bv',1);
/*!40000 ALTER TABLE `widget_parameters_field_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_parameters_multiple_options`
--

DROP TABLE IF EXISTS `widget_parameters_multiple_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_parameters_multiple_options` (
  `parameter_id` int(11) NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `option_value` varchar(255) NOT NULL,
  KEY `fk_option_parameter_id` (`parameter_id`),
  CONSTRAINT `fk_option_parameter_id` FOREIGN KEY (`parameter_id`) REFERENCES `widget_parameters` (`parameter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_parameters_multiple_options`
--

LOCK TABLES `widget_parameters_multiple_options` WRITE;
/*!40000 ALTER TABLE `widget_parameters_multiple_options` DISABLE KEYS */;
INSERT INTO `widget_parameters_multiple_options` VALUES (2,'Last 3 hours','10800'),(2,'Last 6 hours','21600'),(2,'Last 12 hours','43200'),(2,'Last 24 hours','86400'),(2,'Last 2 days','172800'),(2,'Last 3 days','259200'),(2,'Last 4 days','302400'),(2,'Last 5 days','432000'),(2,'Last 7 days','604800'),(2,'Last 14 days','1209600'),(2,'Last 28 days','2419200'),(2,'Last 30 days','2592000'),(2,'Last 31 days','2678400'),(2,'Last 2 months','5184000'),(2,'Last 4 months','10368000'),(2,'Last 6 months','15552000'),(2,'Last year','31104000'),(9,'Acknowledged','ack'),(9,'Not Acknowleged','nack'),(10,'In downtime','downtime'),(10,'Not in downtime','ndowntime'),(11,'Hard Only','hardonly'),(11,'Soft Only','softonly'),(27,'Host Name','h.name'),(27,'Severity','criticality'),(27,'Address','address'),(27,'Status','state'),(27,'Output','output'),(27,'Check attempt','check_attempt'),(27,'Last Check','last_check'),(27,'Duration','last_state_change'),(27,'Hard State Duration','last_hard_state_change'),(33,'Hostgroup Name','name'),(44,'Acknowledged','ack'),(44,'Not Acknowleged','nack'),(45,'In downtime','downtime'),(45,'Not in downtime','ndowntime'),(46,'Hard Only','hardonly'),(46,'Soft Only','softonly'),(65,'Host Name','hostname'),(65,'Host Status','h_state'),(65,'Service Description','description'),(65,'Service Status','s_state'),(65,'Severity','criticality_level'),(65,'Service Output','output'),(65,'Check attempt','check_attempt'),(65,'Last Check','last_check'),(65,'Duration','last_state_change'),(65,'Hard State Duration','last_hard_state_change'),(71,'Hostgroup Name','name');
/*!40000 ALTER TABLE `widget_parameters_multiple_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_parameters_range`
--

DROP TABLE IF EXISTS `widget_parameters_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_parameters_range` (
  `parameter_id` int(11) NOT NULL,
  `min_range` int(11) NOT NULL,
  `max_range` int(11) NOT NULL,
  `step` int(11) NOT NULL,
  KEY `fk_option_range_id` (`parameter_id`),
  CONSTRAINT `fk_option_range_id` FOREIGN KEY (`parameter_id`) REFERENCES `widget_parameters` (`parameter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_parameters_range`
--

LOCK TABLES `widget_parameters_range` WRITE;
/*!40000 ALTER TABLE `widget_parameters_range` DISABLE KEYS */;
INSERT INTO `widget_parameters_range` VALUES (13,10,100,10),(24,50,500,50),(26,50,500,50),(32,10,100,10),(49,10,100,10),(55,50,500,50),(64,50,500,50),(70,10,100,10);
/*!40000 ALTER TABLE `widget_parameters_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_preferences`
--

DROP TABLE IF EXISTS `widget_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_preferences` (
  `widget_view_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `preference_value` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `widget_preferences_unique_index` (`widget_view_id`,`parameter_id`,`user_id`),
  KEY `fk_widget_parameter_id` (`parameter_id`),
  CONSTRAINT `fk_widget_parameter_id` FOREIGN KEY (`parameter_id`) REFERENCES `widget_parameters` (`parameter_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_widget_view_id` FOREIGN KEY (`widget_view_id`) REFERENCES `widget_views` (`widget_view_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_preferences`
--

LOCK TABLES `widget_preferences` WRITE;
/*!40000 ALTER TABLE `widget_preferences` DISABLE KEYS */;
INSERT INTO `widget_preferences` VALUES (1,1,'16-32',1),(1,2,'43200',1),(1,3,'60',1),(2,1,'16-34',1),(2,2,'43200',1),(2,3,'60',1),(3,1,'14-24',1),(3,2,'43200',1),(3,3,'60',1),(4,1,'14-25',1),(4,2,'43200',1),(4,3,'60',1);
/*!40000 ALTER TABLE `widget_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_views`
--

DROP TABLE IF EXISTS `widget_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_views` (
  `widget_view_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_view_id` int(11) NOT NULL,
  `widget_id` int(11) NOT NULL,
  `widget_order` varchar(255) NOT NULL,
  PRIMARY KEY (`widget_view_id`),
  KEY `fk_custom_view_id` (`custom_view_id`),
  KEY `fk_widget_id` (`widget_id`),
  CONSTRAINT `fk_custom_view_id` FOREIGN KEY (`custom_view_id`) REFERENCES `custom_views` (`custom_view_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_widget_id` FOREIGN KEY (`widget_id`) REFERENCES `widgets` (`widget_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_views`
--

LOCK TABLES `widget_views` WRITE;
/*!40000 ALTER TABLE `widget_views` DISABLE KEYS */;
INSERT INTO `widget_views` VALUES (1,1,1,'0_0'),(2,1,2,'1_0'),(3,1,3,'0_1'),(4,1,4,'1_1');
/*!40000 ALTER TABLE `widget_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `widget_id` int(11) NOT NULL AUTO_INCREMENT,
  `widget_model_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`widget_id`),
  KEY `fk_wdg_model_id` (`widget_model_id`),
  CONSTRAINT `fk_wdg_model_id` FOREIGN KEY (`widget_model_id`) REFERENCES `widget_models` (`widget_model_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'Graphs'),(2,1,''),(3,1,''),(4,1,'');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_token`
--

DROP TABLE IF EXISTS `ws_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_token` (
  `contact_id` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `generate_date` datetime NOT NULL,
  UNIQUE KEY `token` (`token`),
  KEY `contact_id` (`contact_id`),
  CONSTRAINT `ws_token_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_token`
--

LOCK TABLES `ws_token` WRITE;
/*!40000 ALTER TABLE `ws_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-21 20:09:34
