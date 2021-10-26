-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: soul
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add ËìùÁî®Êà∑',7,'add_user'),(26,'Can change ËìùÁî®Êà∑',7,'change_user'),(27,'Can delete ËìùÁî®Êà∑',7,'delete_user'),(28,'Can view ËìùÁî®Êà∑',7,'view_user'),(29,'Can add ÁßÅÊúçÂô® ÈÖçÁΩÆ',8,'add_backupconf'),(30,'Can change ÁßÅÊúçÂô® ÈÖçÁΩÆ',8,'change_backupconf'),(31,'Can delete ÁßÅÊúçÂô® ÈÖçÁΩÆ',8,'delete_backupconf'),(32,'Can view ÁßÅÊúçÂô® ÈÖçÁΩÆ',8,'view_backupconf'),(33,'Can add Â∑•‰ΩúËÆ∞ÂΩï',9,'add_backupwork'),(34,'Can change Â∑•‰ΩúËÆ∞ÂΩï',9,'change_backupwork'),(35,'Can delete Â∑•‰ΩúËÆ∞ÂΩï',9,'delete_backupwork'),(36,'Can view Â∑•‰ΩúËÆ∞ÂΩï',9,'view_backupwork'),(37,'Can add django job',10,'add_djangojob'),(38,'Can change django job',10,'change_djangojob'),(39,'Can delete django job',10,'delete_djangojob'),(40,'Can view django job',10,'view_djangojob'),(41,'Can add django job execution',11,'add_djangojobexecution'),(42,'Can change django job execution',11,'change_djangojobexecution'),(43,'Can delete django job execution',11,'delete_djangojobexecution'),(44,'Can view django job execution',11,'view_djangojobexecution');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$0sFGsbIKOMDA$aWCFHC4/PbccBEE9Wq3QZK9G/BTpRI0dwnpbpQooNcE=','2021-10-25 03:13:18.411295',1,'VcrTing','','','vcrting@163.com',1,1,'2021-10-25 02:56:17.617008');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_backupconf`
--

DROP TABLE IF EXISTS `backup_backupconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_backupconf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `named` varchar(60) NOT NULL,
  `user` varchar(20) NOT NULL,
  `addr` varchar(60) NOT NULL,
  `port` int(11) NOT NULL,
  `salt` varchar(60) NOT NULL,
  `card` varchar(120) NOT NULL,
  `file_path` varchar(120) NOT NULL,
  `is_dir` tinyint(1) NOT NULL,
  `work_status` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_backupconf`
--

LOCK TABLES `backup_backupconf` WRITE;
/*!40000 ALTER TABLE `backup_backupconf` DISABLE KEYS */;
INSERT INTO `backup_backupconf` VALUES (1,'123Medhk','root','45.32.114.202',34567,'vcrting','2{sPJVqUT),@3$S=','/root/Backup/*',1,1,1,'2021-10-25 03:14:34.353870'),(2,'Gogo','root','crm09.svr.up5d.com',34567,'vcrting','F!u7@+83rU7.53Q?','/root/Backup/*',1,1,1,'2021-10-25 03:15:02.978716'),(3,'Cheung','root','crm08.svr.up5d.com',34567,'vcrting','P4,j1,Vtc$%3D-Rv','/root/Backup/*',1,1,1,'2021-10-25 03:15:29.928923'),(4,'Buonvino','root','crm07.svr.up5d.com',34567,'vcrting','{C9jt(qx5]N{K9Bd','/root/Backup/*',1,1,1,'2021-10-25 03:15:59.034040'),(5,'Age','root','crm06.svr.up5d.com',34567,'vcrting','g7!P5ss7hqfzhkzo','/root/Backup/*',1,1,1,'2021-10-25 03:16:21.376008'),(6,'Mouton','root','crm10.svr.up5d.com',34567,'vcrting','wN,2T%_2ALDBsFjd','/root/Backup/*',1,1,1,'2021-10-25 03:16:52.091799'),(7,'Glorious','root','crm05.svr.up5d.com',34567,'vcrting','}jE48(a)k9gSu!d7','/root/Backup/*',1,1,1,'2021-10-25 03:17:15.608101'),(8,'Visocare','root','crm03.svr.up5d.com',34567,'vcrting','x%T36twnf}%Ad(7y','/root/Backup/*',1,1,1,'2021-10-25 03:17:42.301900');
/*!40000 ALTER TABLE `backup_backupconf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_backupwork`
--

DROP TABLE IF EXISTS `backup_backupwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_backupwork` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_time` varchar(60) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `saveing_path` varchar(120) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `conf_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backup_backupwork_conf_id_795802d6_fk_backup_backupconf_id` (`conf_id`),
  CONSTRAINT `backup_backupwork_conf_id_795802d6_fk_backup_backupconf_id` FOREIGN KEY (`conf_id`) REFERENCES `backup_backupconf` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_backupwork`
--

LOCK TABLES `backup_backupwork` WRITE;
/*!40000 ALTER TABLE `backup_backupwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_backupwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-10-25 03:14:34.354797','1','ÈÖçÁΩÆ1',1,'[{\"added\": {}}]',8,1),(2,'2021-10-25 03:15:02.980871','2','ÈÖçÁΩÆ2',1,'[{\"added\": {}}]',8,1),(3,'2021-10-25 03:15:29.929788','3','ÈÖçÁΩÆ3',1,'[{\"added\": {}}]',8,1),(4,'2021-10-25 03:15:59.034842','4','ÈÖçÁΩÆ4',1,'[{\"added\": {}}]',8,1),(5,'2021-10-25 03:16:21.376905','5','ÈÖçÁΩÆ5',1,'[{\"added\": {}}]',8,1),(6,'2021-10-25 03:16:52.092645','6','ÈÖçÁΩÆ6',1,'[{\"added\": {}}]',8,1),(7,'2021-10-25 03:17:15.608863','7','ÈÖçÁΩÆ7',1,'[{\"added\": {}}]',8,1),(8,'2021-10-25 03:17:42.302716','8','ÈÖçÁΩÆ8',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_apscheduler_djangojob`
--

DROP TABLE IF EXISTS `django_apscheduler_djangojob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_apscheduler_djangojob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `next_run_time` datetime(6) DEFAULT NULL,
  `job_state` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_apscheduler_djangojob_next_run_time_2f022619` (`next_run_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_apscheduler_djangojob`
--

LOCK TABLES `django_apscheduler_djangojob` WRITE;
/*!40000 ALTER TABLE `django_apscheduler_djangojob` DISABLE KEYS */;
INSERT INTO `django_apscheduler_djangojob` VALUES (1,'sora','2021-10-25 04:25:59.810720',_binary 'Äï\“\0\0\0\0\0\0}î(åversionîKåidîåsoraîåfuncîåAppis.web.views:funîåtriggerîåapscheduler.triggers.intervalîåIntervalTriggerîìî)Åî}î(hKåtimezoneîåpytzîå_pîìî(å\rAsia/ShanghaiîM\ËqK\0åLMTîtîRîå\nstart_dateîådatetimeîådatetimeîìîC\n\Â\n;^\‡îh(hMÄpK\0åCSTîtîRîÜîRîåend_dateîNåintervalîhå	timedeltaîìîK\0MXK\0áîRîåjitterîNubåexecutorîådefaultîåargsî)åkwargsî}îånameîåfunîåmisfire_grace_timeîKåcoalesceîâå\rmax_instancesîKå\rnext_run_timeîhC\n\Â\n;^\‡îhÜîRîu.');
/*!40000 ALTER TABLE `django_apscheduler_djangojob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_apscheduler_djangojobexecution`
--

DROP TABLE IF EXISTS `django_apscheduler_djangojobexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_apscheduler_djangojobexecution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `run_time` datetime(6) NOT NULL,
  `duration` decimal(15,2) DEFAULT NULL,
  `started` decimal(15,2) DEFAULT NULL,
  `finished` decimal(15,2) DEFAULT NULL,
  `exception` varchar(1000) DEFAULT NULL,
  `traceback` longtext,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_apscheduler_d_job_id_daf5090a_fk_django_ap` (`job_id`),
  KEY `django_apscheduler_djangojobexecution_run_time_16edd96b` (`run_time`),
  CONSTRAINT `django_apscheduler_d_job_id_daf5090a_fk_django_ap` FOREIGN KEY (`job_id`) REFERENCES `django_apscheduler_djangojob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_apscheduler_djangojobexecution`
--

LOCK TABLES `django_apscheduler_djangojobexecution` WRITE;
/*!40000 ALTER TABLE `django_apscheduler_djangojobexecution` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_apscheduler_djangojobexecution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'backup','backupconf'),(9,'backup','backupwork'),(5,'contenttypes','contenttype'),(10,'django_apscheduler','djangojob'),(11,'django_apscheduler','djangojobexecution'),(6,'sessions','session'),(7,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-10-23 09:22:06.514131'),(2,'auth','0001_initial','2021-10-23 09:22:06.549461'),(3,'admin','0001_initial','2021-10-23 09:22:06.614067'),(4,'admin','0002_logentry_remove_auto_add','2021-10-23 09:22:06.630547'),(5,'admin','0003_logentry_add_action_flag_choices','2021-10-23 09:22:06.636863'),(6,'contenttypes','0002_remove_content_type_name','2021-10-23 09:22:06.657188'),(7,'auth','0002_alter_permission_name_max_length','2021-10-23 09:22:06.666151'),(8,'auth','0003_alter_user_email_max_length','2021-10-23 09:22:06.678320'),(9,'auth','0004_alter_user_username_opts','2021-10-23 09:22:06.686026'),(10,'auth','0005_alter_user_last_login_null','2021-10-23 09:22:06.697133'),(11,'auth','0006_require_contenttypes_0002','2021-10-23 09:22:06.698365'),(12,'auth','0007_alter_validators_add_error_messages','2021-10-23 09:22:06.705153'),(13,'auth','0008_alter_user_username_max_length','2021-10-23 09:22:06.716373'),(14,'auth','0009_alter_user_last_name_max_length','2021-10-23 09:22:06.728303'),(15,'auth','0010_alter_group_name_max_length','2021-10-23 09:22:06.739311'),(16,'auth','0011_update_proxy_permissions','2021-10-23 09:22:06.745058'),(17,'backup','0001_initial','2021-10-23 09:22:06.759508'),(18,'django_apscheduler','0001_initial','2021-10-23 09:22:06.885113'),(19,'django_apscheduler','0002_auto_20180412_0758','2021-10-23 09:22:06.903902'),(20,'sessions','0001_initial','2021-10-23 09:22:06.911278'),(21,'user','0001_initial','2021-10-23 09:22:06.921277');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9q6w53dew0abe8zsoszhjeauxmi93jol','YjI4ZjczZmFmOGU4ZDZiZDZhMjJjMTljNmIzODA2NDdmN2FiOTdkMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YTQ1YWQ1MmViZTEzMGI4NWNlMTIxYjAyOTlhNzNhN2Y2MGVkZjY0In0=','2021-11-08 03:13:18.413686');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `named` varchar(60) NOT NULL,
  `pwd` varchar(90) NOT NULL,
  `bg` smallint(6) DEFAULT NULL,
  `salt` varchar(60) NOT NULL,
  `bad_account` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-25  4:16:07
