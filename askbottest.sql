-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: askbot
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `is_auditted` tinyint(1) NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `active_at` datetime NOT NULL DEFAULT '2011-12-16 21:39:18',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_type` smallint(6) NOT NULL,
  `question_id` int(11),
  `summary` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_403f60f` (`user_id`),
  KEY `activity_1bb8f392` (`content_type_id`),
  KEY `activity_1f92e550` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (0,1,1,36,'2011-12-18 04:26:11',1,1,1,'abc def jhklm sfdsajlfkdjsalfds\nthis is testing image.\navatar.jpg\n ...'),(0,1,1,36,'2011-12-18 04:26:11',2,15,1,''),(0,1,1,38,'2011-12-18 04:26:36',3,16,1,''),(0,2,1,36,'2012-01-02 22:24:21',4,1,2,'hello\n\ntis thisdf skjltjf sfd df\n ...'),(0,2,1,36,'2012-01-02 22:24:21',5,15,2,''),(0,3,1,36,'2012-01-02 22:25:04',6,1,3,'testing testitni sfdit\n ...'),(0,3,1,36,'2012-01-02 22:25:04',7,15,3,'');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_receiving_users`
--

DROP TABLE IF EXISTS `activity_receiving_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_receiving_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activity_receiving_users_activity_id_4fab449d_uniq` (`activity_id`,`user_id`),
  KEY `activity_receiving_users_45b57829` (`activity_id`),
  KEY `activity_receiving_users_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_receiving_users`
--

LOCK TABLES `activity_receiving_users` WRITE;
/*!40000 ALTER TABLE `activity_receiving_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_receiving_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `wiki` tinyint(1) NOT NULL DEFAULT '0',
  `vote_up_count` int(11) NOT NULL DEFAULT '0',
  `offensive_flag_count` smallint(6) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locked_at` datetime DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  `html` longtext,
  `vote_down_count` int(11) NOT NULL DEFAULT '0',
  `last_edited_by_id` int(11) DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `locked_by_id` int(11) DEFAULT NULL,
  `added_at` datetime NOT NULL DEFAULT '2011-12-16 21:39:18',
  `deleted_by_id` int(11) DEFAULT NULL,
  `wikified_at` datetime DEFAULT NULL,
  `last_edited_at` datetime DEFAULT NULL,
  `text` longtext,
  PRIMARY KEY (`id`),
  KEY `answer_337b96ff` (`author_id`),
  KEY `answer_1f92e550` (`question_id`),
  KEY `answer_4979023e` (`last_edited_by_id`),
  KEY `answer_4e65607d` (`locked_by_id`),
  KEY `answer_513df729` (`deleted_by_id`),
  FULLTEXT KEY `askbot_answer_full_text_index` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_activityauditstatus`
--

DROP TABLE IF EXISTS `askbot_activityauditstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_activityauditstatus` (
  `status` smallint(6) NOT NULL DEFAULT '0',
  `activity_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_activityauditstatus_45b57829` (`activity_id`),
  KEY `askbot_activityauditstatus_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_activityauditstatus`
--

LOCK TABLES `askbot_activityauditstatus` WRITE;
/*!40000 ALTER TABLE `askbot_activityauditstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_activityauditstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_anonymousanswer`
--

DROP TABLE IF EXISTS `askbot_anonymousanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_anonymousanswer` (
  `wiki` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addr` char(15) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext NOT NULL,
  `question_id` int(11) NOT NULL,
  `added_at` datetime NOT NULL DEFAULT '2011-12-16 21:39:18',
  `summary` varchar(180) NOT NULL,
  `session_key` varchar(40) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `askbot_anonymousanswer_337b96ff` (`author_id`),
  KEY `askbot_anonymousanswer_1f92e550` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_anonymousanswer`
--

LOCK TABLES `askbot_anonymousanswer` WRITE;
/*!40000 ALTER TABLE `askbot_anonymousanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_anonymousanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_anonymousquestion`
--

DROP TABLE IF EXISTS `askbot_anonymousquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_anonymousquestion` (
  `wiki` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addr` char(15) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `tagnames` varchar(125) NOT NULL,
  `text` longtext NOT NULL,
  `title` varchar(300) NOT NULL,
  `added_at` datetime NOT NULL DEFAULT '2011-12-16 21:39:18',
  `summary` varchar(180) NOT NULL,
  `session_key` varchar(40) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_anonymous` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_anonymousquestion_337b96ff` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_anonymousquestion`
--

LOCK TABLES `askbot_anonymousquestion` WRITE;
/*!40000 ALTER TABLE `askbot_anonymousquestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_anonymousquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_badgedata`
--

DROP TABLE IF EXISTS `askbot_badgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_badgedata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `awarded_count` int(10) unsigned NOT NULL DEFAULT '0',
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `askbot_badgedata_slug_uniq` (`slug`),
  KEY `badge_56ae2a2a` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_badgedata`
--

LOCK TABLES `askbot_badgedata` WRITE;
/*!40000 ALTER TABLE `askbot_badgedata` DISABLE KEYS */;
INSERT INTO `askbot_badgedata` VALUES (1,0,'disciplined'),(2,0,'peer-pressure'),(3,0,'nice-answer'),(4,0,'nice-question'),(5,0,'pundit'),(6,0,'popular-question'),(7,0,'citizen-patrol'),(8,0,'cleanup'),(9,0,'critic'),(10,0,'editor'),(11,0,'organizer'),(12,0,'scholar'),(13,0,'student'),(14,0,'supporter'),(15,0,'teacher'),(16,0,'autobiographer'),(17,0,'self-learner'),(18,0,'great-answer'),(19,0,'great-question'),(20,0,'stellar-question'),(21,0,'famous-question'),(22,0,'alpha'),(23,0,'good-answer'),(24,0,'good-question'),(25,0,'favorite-question'),(26,0,'civic-duty'),(27,0,'strunk-and-white'),(28,0,'generalist'),(29,0,'expert'),(30,0,'yearling'),(31,0,'notable-question'),(32,0,'enlightened'),(33,0,'beta'),(34,0,'guru'),(35,0,'necromancer'),(36,0,'taxonomist'),(37,0,'enthusiast'),(38,0,'commentator');
/*!40000 ALTER TABLE `askbot_badgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_emailfeedsetting`
--

DROP TABLE IF EXISTS `askbot_emailfeedsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_emailfeedsetting` (
  `reported_at` datetime DEFAULT NULL,
  `added_at` datetime NOT NULL,
  `subscriber_id` int(11) NOT NULL,
  `feed_type` varchar(16) NOT NULL,
  `frequency` varchar(8) NOT NULL DEFAULT 'n',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `askbot_emailfeedsetting_feed_type_6da6fdcd_uniq` (`feed_type`,`subscriber_id`),
  KEY `askbot_emailfeedsetting_41d15c8` (`subscriber_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_emailfeedsetting`
--

LOCK TABLES `askbot_emailfeedsetting` WRITE;
/*!40000 ALTER TABLE `askbot_emailfeedsetting` DISABLE KEYS */;
INSERT INTO `askbot_emailfeedsetting` VALUES (NULL,'2011-12-17 08:49:36',1,'q_all','n',1),(NULL,'2011-12-17 08:49:36',1,'q_sel','n',2),(NULL,'2011-12-17 08:49:36',1,'q_ask','n',3),(NULL,'2011-12-17 08:49:36',1,'q_ans','n',4),(NULL,'2011-12-17 08:49:36',1,'m_and_c','n',5),(NULL,'2011-12-18 04:54:11',2,'q_all','w',6),(NULL,'2011-12-18 04:54:11',2,'q_sel','w',7),(NULL,'2011-12-18 04:54:11',2,'q_ask','w',8),(NULL,'2011-12-18 04:54:11',2,'q_ans','w',9),(NULL,'2011-12-18 04:54:11',2,'m_and_c','w',10);
/*!40000 ALTER TABLE `askbot_emailfeedsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_markedtag`
--

DROP TABLE IF EXISTS `askbot_markedtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_markedtag` (
  `reason` varchar(16) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_markedtag_3747b463` (`tag_id`),
  KEY `askbot_markedtag_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_markedtag`
--

LOCK TABLES `askbot_markedtag` WRITE;
/*!40000 ALTER TABLE `askbot_markedtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_markedtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_postrevision`
--

DROP TABLE IF EXISTS `askbot_postrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_postrevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_type` smallint(6) NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  `author_id` int(11) NOT NULL,
  `revised_at` datetime NOT NULL,
  `summary` varchar(300) NOT NULL,
  `text` longtext NOT NULL,
  `title` varchar(300) NOT NULL DEFAULT '',
  `tagnames` varchar(125) NOT NULL DEFAULT '',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `answer_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `askbot_postrevision_answer_id_4016cc8f_uniq` (`answer_id`,`revision`),
  UNIQUE KEY `askbot_postrevision_question_id_3ba3b4bf_uniq` (`question_id`,`revision`),
  KEY `askbot_postrevision_337b96ff` (`author_id`),
  KEY `askbot_postrevision_2c9474d0` (`answer_id`),
  KEY `askbot_postrevision_1f92e550` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_postrevision`
--

LOCK TABLES `askbot_postrevision` WRITE;
/*!40000 ALTER TABLE `askbot_postrevision` DISABLE KEYS */;
INSERT INTO `askbot_postrevision` VALUES (1,1,1,1,'2011-12-18 04:26:11','initial version','abc def jhklm sfdsajlfkdjsalfds\r\nthis is testing image.\r\n[avatar.jpg](/upfiles/1324203960755131.jpg)','testing testing','testing image',0,NULL,1),(2,1,1,1,'2012-01-02 22:24:21','initial version','hello\r\n\r\ntis thisdf skjltjf sfd df','i think this should be something else','test',0,NULL,2),(3,1,1,1,'2012-01-02 22:25:04','initial version','testing testitni sfdit','may be yyou are wrong','testing',0,NULL,3);
/*!40000 ALTER TABLE `askbot_postrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_questionview`
--

DROP TABLE IF EXISTS `askbot_questionview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_questionview` (
  `when` datetime NOT NULL,
  `who_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `askbot_questionview_450e6bfb` (`who_id`),
  KEY `askbot_questionview_1f92e550` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_questionview`
--

LOCK TABLES `askbot_questionview` WRITE;
/*!40000 ALTER TABLE `askbot_questionview` DISABLE KEYS */;
INSERT INTO `askbot_questionview` VALUES ('2012-01-03 05:45:19',1,1,1),('2012-01-03 05:45:05',1,2,2),('2012-01-03 05:41:14',1,3,3);
/*!40000 ALTER TABLE `askbot_questionview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'askbot_moderators');
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add migration history',9,'add_migrationhistory'),(26,'Can change migration history',9,'change_migrationhistory'),(27,'Can delete migration history',9,'delete_migrationhistory'),(28,'Can add setting',10,'add_setting'),(29,'Can change setting',10,'change_setting'),(30,'Can delete setting',10,'delete_setting'),(31,'Can add long setting',11,'add_longsetting'),(32,'Can change long setting',11,'change_longsetting'),(33,'Can delete long setting',11,'delete_longsetting'),(34,'Can add url',12,'add_url'),(35,'Can change url',12,'change_url'),(36,'Can delete url',12,'delete_url'),(37,'Can add rule',13,'add_rule'),(38,'Can change rule',13,'change_rule'),(39,'Can delete rule',13,'delete_rule'),(40,'Can add task meta',14,'add_taskmeta'),(41,'Can change task meta',14,'change_taskmeta'),(42,'Can delete task meta',14,'delete_taskmeta'),(43,'Can add taskset meta',15,'add_tasksetmeta'),(44,'Can change taskset meta',15,'change_tasksetmeta'),(45,'Can delete taskset meta',15,'delete_tasksetmeta'),(46,'Can add interval',16,'add_intervalschedule'),(47,'Can change interval',16,'change_intervalschedule'),(48,'Can delete interval',16,'delete_intervalschedule'),(49,'Can add crontab',17,'add_crontabschedule'),(50,'Can change crontab',17,'change_crontabschedule'),(51,'Can delete crontab',17,'delete_crontabschedule'),(52,'Can add periodic tasks',18,'add_periodictasks'),(53,'Can change periodic tasks',18,'change_periodictasks'),(54,'Can delete periodic tasks',18,'delete_periodictasks'),(55,'Can add periodic task',19,'add_periodictask'),(56,'Can change periodic task',19,'change_periodictask'),(57,'Can delete periodic task',19,'delete_periodictask'),(58,'Can add worker',20,'add_workerstate'),(59,'Can change worker',20,'change_workerstate'),(60,'Can delete worker',20,'delete_workerstate'),(61,'Can add task',21,'add_taskstate'),(62,'Can change task',21,'change_taskstate'),(63,'Can delete task',21,'delete_taskstate'),(64,'Can add queue',22,'add_queue'),(65,'Can change queue',22,'change_queue'),(66,'Can delete queue',22,'delete_queue'),(67,'Can add message',23,'add_message'),(68,'Can change message',23,'change_message'),(69,'Can delete message',23,'delete_message'),(70,'Can add followuser',24,'add_followuser'),(71,'Can change followuser',24,'change_followuser'),(72,'Can delete followuser',24,'delete_followuser'),(73,'Can add badge data',25,'add_badgedata'),(74,'Can change badge data',25,'change_badgedata'),(75,'Can delete badge data',25,'delete_badgedata'),(76,'Can add award',26,'add_award'),(77,'Can change award',26,'change_award'),(78,'Can delete award',26,'delete_award'),(79,'Can add repute',27,'add_repute'),(80,'Can change repute',27,'change_repute'),(81,'Can delete repute',27,'delete_repute'),(82,'Can add activity audit status',28,'add_activityauditstatus'),(83,'Can change activity audit status',28,'change_activityauditstatus'),(84,'Can delete activity audit status',28,'delete_activityauditstatus'),(85,'Can add activity',29,'add_activity'),(86,'Can change activity',29,'change_activity'),(87,'Can delete activity',29,'delete_activity'),(88,'Can add email feed setting',30,'add_emailfeedsetting'),(89,'Can change email feed setting',30,'change_emailfeedsetting'),(90,'Can delete email feed setting',30,'delete_emailfeedsetting'),(91,'Can add vote',31,'add_vote'),(92,'Can change vote',31,'change_vote'),(93,'Can delete vote',31,'delete_vote'),(94,'Can add comment',32,'add_comment'),(95,'Can change comment',32,'change_comment'),(96,'Can delete comment',32,'delete_comment'),(97,'Can add tag',33,'add_tag'),(98,'Can change tag',33,'change_tag'),(99,'Can delete tag',33,'delete_tag'),(100,'Can add marked tag',34,'add_markedtag'),(101,'Can change marked tag',34,'change_markedtag'),(102,'Can delete marked tag',34,'delete_markedtag'),(103,'Can add post revision',35,'add_postrevision'),(104,'Can change post revision',35,'change_postrevision'),(105,'Can delete post revision',35,'delete_postrevision'),(106,'Can add question',36,'add_question'),(107,'Can change question',36,'change_question'),(108,'Can delete question',36,'delete_question'),(109,'Can add question view',37,'add_questionview'),(110,'Can change question view',37,'change_questionview'),(111,'Can delete question view',37,'delete_questionview'),(112,'Can add favorite question',38,'add_favoritequestion'),(113,'Can change favorite question',38,'change_favoritequestion'),(114,'Can delete favorite question',38,'delete_favoritequestion'),(115,'Can add anonymous question',39,'add_anonymousquestion'),(116,'Can change anonymous question',39,'change_anonymousquestion'),(117,'Can delete anonymous question',39,'delete_anonymousquestion'),(118,'Can add answer',40,'add_answer'),(119,'Can change answer',40,'change_answer'),(120,'Can delete answer',40,'delete_answer'),(121,'Can add anonymous answer',41,'add_anonymousanswer'),(122,'Can change anonymous answer',41,'change_anonymousanswer'),(123,'Can delete anonymous answer',41,'delete_anonymousanswer'),(124,'Can add nonce',42,'add_nonce'),(125,'Can change nonce',42,'change_nonce'),(126,'Can delete nonce',42,'delete_nonce'),(127,'Can add association',43,'add_association'),(128,'Can change association',43,'change_association'),(129,'Can delete association',43,'delete_association'),(130,'Can add user association',44,'add_userassociation'),(131,'Can change user association',44,'change_userassociation'),(132,'Can delete user association',44,'delete_userassociation'),(133,'Can add user password queue',45,'add_userpasswordqueue'),(134,'Can change user password queue',45,'change_userpasswordqueue'),(135,'Can delete user password queue',45,'delete_userpasswordqueue');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  `status` varchar(2) NOT NULL,
  `email_isvalid` tinyint(1) NOT NULL,
  `email_key` varchar(32) DEFAULT NULL,
  `reputation` int(10) unsigned NOT NULL,
  `gravatar` varchar(32) NOT NULL,
  `avatar_type` varchar(1) NOT NULL,
  `gold` smallint(6) NOT NULL,
  `silver` smallint(6) NOT NULL,
  `bronze` smallint(6) NOT NULL,
  `questions_per_page` smallint(6) NOT NULL,
  `last_seen` datetime NOT NULL,
  `real_name` varchar(100) NOT NULL,
  `website` varchar(200) NOT NULL,
  `location` varchar(100) NOT NULL,
  `country` varchar(2) NOT NULL,
  `show_country` tinyint(1) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `about` longtext NOT NULL,
  `interesting_tags` longtext NOT NULL,
  `ignored_tags` longtext NOT NULL,
  `email_tag_filter_strategy` smallint(6) NOT NULL,
  `display_tag_filter_strategy` smallint(6) NOT NULL,
  `new_response_count` int(11) NOT NULL,
  `seen_response_count` int(11) NOT NULL,
  `consecutive_days_visit_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'khanh','','','thtkhanh@gmail.com','!',1,1,1,'2012-01-02 22:22:31','2011-12-17 08:49:35','w',0,NULL,1,'e8a4fd22af7c2878fd2eb7ea4d66b485','n',0,0,0,10,'2012-01-03 05:56:41','','','','',0,NULL,'','','',1,0,0,0,0),(2,'khanhkhanh','','','','sha1$d5dd5$fa1dd52dca24674f4daf99cc98cd9b6f33eada9d',0,1,0,'2011-12-18 04:54:11','2011-12-18 04:54:11','w',0,NULL,1,'d41d8cd98f00b204e9800998ecf8427e','n',0,0,0,10,'2011-12-18 04:54:11','','','','',0,NULL,'','','',1,0,0,0,0);
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award` (
  `awarded_at` datetime NOT NULL DEFAULT '2011-12-16 21:39:18',
  `notified` tinyint(1) NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `award_403f60f` (`user_id`),
  KEY `award_1bb8f392` (`content_type_id`),
  KEY `award_7f24a4dc` (`badge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award`
--

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;
/*!40000 ALTER TABLE `award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime NOT NULL,
  `traceback` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment` varchar(2048) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `added_at` datetime NOT NULL DEFAULT '2011-12-16 21:39:18',
  `content_type_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `html` varchar(2048) NOT NULL,
  `score` int(11) NOT NULL,
  `offensive_flag_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_1bb8f392` (`content_type_id`),
  KEY `comment_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2011-12-18 04:54:11',1,3,'2','khanhkhanh',1,''),(2,'2011-12-18 04:54:20',1,36,'1','testing testing',2,'Changed html, summary and followed_by.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_authopenid_association`
--

DROP TABLE IF EXISTS `django_authopenid_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_authopenid_association` (
  `handle` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `server_url` longtext NOT NULL,
  `assoc_type` longtext NOT NULL,
  `secret` longtext NOT NULL,
  `lifetime` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_authopenid_association`
--

LOCK TABLES `django_authopenid_association` WRITE;
/*!40000 ALTER TABLE `django_authopenid_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_authopenid_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_authopenid_nonce`
--

DROP TABLE IF EXISTS `django_authopenid_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_authopenid_nonce` (
  `timestamp` int(11) NOT NULL,
  `salt` varchar(40) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_authopenid_nonce`
--

LOCK TABLES `django_authopenid_nonce` WRITE;
/*!40000 ALTER TABLE `django_authopenid_nonce` DISABLE KEYS */;
INSERT INTO `django_authopenid_nonce` VALUES (1324133289,'TUcYf5WpDQvHsA',1,'https://www.google.com/accounts/o8/ud'),(1324133693,'X9ZTihm7fX2Nag',2,'https://www.google.com/accounts/o8/ud'),(1325564779,'5szQApV_jMazeQ',3,'https://www.google.com/accounts/o8/ud');
/*!40000 ALTER TABLE `django_authopenid_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_authopenid_userassociation`
--

DROP TABLE IF EXISTS `django_authopenid_userassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_authopenid_userassociation` (
  `user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid_url` varchar(255) NOT NULL,
  `provider_name` varchar(64) NOT NULL,
  `last_used_timestamp` datetime,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_authopenid_userassociation_provider_name_7b967c81_uniq` (`provider_name`,`user_id`),
  UNIQUE KEY `django_authopenid_userassociation_provider_name_6c3ea038_uniq` (`provider_name`,`openid_url`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_authopenid_userassociation`
--

LOCK TABLES `django_authopenid_userassociation` WRITE;
/*!40000 ALTER TABLE `django_authopenid_userassociation` DISABLE KEYS */;
INSERT INTO `django_authopenid_userassociation` VALUES (1,1,'https://www.google.com/accounts/o8/id?id=AItOawlbN_5Ai1TVj1aP0rtT3xC_bcZItqPoblg','google','2012-01-02 22:22:31');
/*!40000 ALTER TABLE `django_authopenid_userassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_authopenid_userpasswordqueue`
--

DROP TABLE IF EXISTS `django_authopenid_userpasswordqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_authopenid_userpasswordqueue` (
  `new_password` varchar(30) NOT NULL,
  `confirm_key` varchar(40) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_authopenid_userpasswordqueue`
--

LOCK TABLES `django_authopenid_userpasswordqueue` WRITE;
/*!40000 ALTER TABLE `django_authopenid_userpasswordqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_authopenid_userpasswordqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'migration history','south','migrationhistory'),(10,'setting','livesettings','setting'),(11,'long setting','livesettings','longsetting'),(12,'url','robots','url'),(13,'rule','robots','rule'),(14,'task meta','djcelery','taskmeta'),(15,'taskset meta','djcelery','tasksetmeta'),(16,'interval','djcelery','intervalschedule'),(17,'crontab','djcelery','crontabschedule'),(18,'periodic tasks','djcelery','periodictasks'),(19,'periodic task','djcelery','periodictask'),(20,'worker','djcelery','workerstate'),(21,'task','djcelery','taskstate'),(22,'queue','djkombu','queue'),(23,'message','djkombu','message'),(24,'followuser','followit','followuser'),(25,'badge data','askbot','badgedata'),(26,'award','askbot','award'),(27,'repute','askbot','repute'),(28,'activity audit status','askbot','activityauditstatus'),(29,'activity','askbot','activity'),(30,'email feed setting','askbot','emailfeedsetting'),(31,'vote','askbot','vote'),(32,'comment','askbot','comment'),(33,'tag','askbot','tag'),(34,'marked tag','askbot','markedtag'),(35,'post revision','askbot','postrevision'),(36,'question','askbot','question'),(37,'question view','askbot','questionview'),(38,'favorite question','askbot','favoritequestion'),(39,'anonymous question','askbot','anonymousquestion'),(40,'answer','askbot','answer'),(41,'anonymous answer','askbot','anonymousanswer'),(42,'nonce','django_authopenid','nonce'),(43,'association','django_authopenid','association'),(44,'user association','django_authopenid','userassociation'),(45,'user password queue','django_authopenid','userpasswordqueue');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('551bacd09c8d2ae3f585d938e56876ee','ZDdlMzkyMDNmNDA4YTZhYzUzY2FkMTVlZGFiYWRkYjQyNzVhMjQxOTqAAn1xAShVCHZpZXdfbG9n\nY2Fza2JvdC5zZWFyY2guc3RhdGVfbWFuYWdlcgpWaWV3TG9nCnECKYFxA31xBChVBWRlcHRocQVL\nA1UFdmlld3NxBl1xByhVBnNpZ25pbnEIVQlxdWVzdGlvbnNxCVUFaW5kZXhxCmV1YlUMc2VhcmNo\nX3N0YXRlY2Fza2JvdC5zZWFyY2guc3RhdGVfbWFuYWdlcgpTZWFyY2hTdGF0ZQpxCymBcQx9cQ0o\nVQRzb3J0cQ5VDWFjdGl2aXR5LWRlc2NVBnNlYXJjaHEPTlULcXVlcnlfdGl0bGVxEE5VC3F1ZXJ5\nX3VzZXJzcRFdVQZhdXRob3JxEk5VCnF1ZXJ5X3RhZ3NxE11VBHRhZ3NxFE5VCXBhZ2Vfc2l6ZXEV\nSx5VBHBhZ2VxFksBVQ5zdHJpcHBlZF9xdWVyeXEXTlUJbG9nZ2VkX2lucRiJVQVxdWVyeXEZTlUF\nc2NvcGVxGlUDYWxsdWJVDGdyZWV0aW5nX3NldIhVCXBhZ2Vfc2l6ZUsKdS4=\n','2011-12-31 02:52:14'),('8cc636327d02ab2a781f8c3be63e8d13','YWI5MWFjYmY3ZmU2OWY4MTZhNWNjYzM2NGQzYTE3M2JmZGI2YThjODqAAn1xAShVCHZpZXdfbG9n\nY2Fza2JvdC5zZWFyY2guc3RhdGVfbWFuYWdlcgpWaWV3TG9nCnECKYFxA31xBChVBWRlcHRocQVL\nA1UFdmlld3NxBl1xByhVBnNpZ25pbnEIVQZzaWduaW5xCVUJcXVlc3Rpb25zcQpldWJVDHNlYXJj\naF9zdGF0ZWNhc2tib3Quc2VhcmNoLnN0YXRlX21hbmFnZXIKU2VhcmNoU3RhdGUKcQspgXEMfXEN\nKFUEc29ydHEOVQ1hY3Rpdml0eS1kZXNjVQZzZWFyY2hxD05VC3F1ZXJ5X3RpdGxlcRBOVQtxdWVy\neV91c2Vyc3ERXVUGYXV0aG9ycRJOVQpxdWVyeV90YWdzcRNdVQR0YWdzcRROVQlsb2dnZWRfaW5x\nFYlVCXBhZ2Vfc2l6ZXEWSx5VDnN0cmlwcGVkX3F1ZXJ5cRdOVQVxdWVyeXEYTlUFc2NvcGVxGVUD\nYWxsVQRwYWdlcRpLAXViVQxncmVldGluZ19zZXSIVQlwYWdlX3NpemVLCnUu\n','2012-01-01 04:20:49'),('263379bc52079ec6a063fe0b44b6a23e','MTNhMWJkZGI3M2ExMjY5MmM5ODIyYmZlZDNhZmYzNzdjODA1YzAzZTqAAn1xAShVCHVzZXJuYW1l\nVQBVBm9wZW5pZChjYXNrYm90LmRlcHMuZGphbmdvX2F1dGhvcGVuaWQudXRpbApPcGVuSUQKcQJv\nfXEDKFUIaXNfaW5hbWVxBIlVBm9wZW5pZHEFVVBodHRwczovL3d3dy5nb29nbGUuY29tL2FjY291\nbnRzL284L2lkP2lkPUFJdE9hd2xiTl81QWkxVFZqMWFQMHJ0VDN4Q19iY1pJdHFQb2JsZ1UEc3Jl\nZ3EGfVUFYXR0cnNxB11xCChYEgAAAG9wZW5pZC5vcF9lbmRwb2ludHEJWBEAAABvcGVuaWQuY2xh\naW1lZF9pZHEKWA8AAABvcGVuaWQuaWRlbnRpdHlxC1gQAAAAb3BlbmlkLnJldHVybl90b3EMWBUA\nAABvcGVuaWQucmVzcG9uc2Vfbm9uY2VxDVgTAAAAb3BlbmlkLmFzc29jX2hhbmRsZXEOZVUGaXNz\ndWVkcQ9Kh4ICT3ViVQ1fYXV0aF91c2VyX2lkigEBVRNxdWVzdGlvbl92aWV3X3RpbWVzfXEQKIoB\nAWNkYXRldGltZQpkYXRldGltZQpxEVUKB9wBAwUtEw2NfYVScRKKAQJoEVUKB9wBAwUtBQj+VYVS\ncROKAQNoEVUKB9wBAwUpDgsO74VScRR1VQlwYWdlX3NpemVLClUMc2VhcmNoX3N0YXRlY2Fza2Jv\ndC5zZWFyY2guc3RhdGVfbWFuYWdlcgpTZWFyY2hTdGF0ZQpxFSmBcRZ9cRcoVQRzb3J0cRhVDWFj\ndGl2aXR5LWRlc2NVCXBhZ2Vfc2l6ZXEZSx5VBnNlYXJjaHEaTlULcXVlcnlfdGl0bGVxG05VC3F1\nZXJ5X3VzZXJzcRxdVQR0YWdzcR1jX19idWlsdGluX18Kc2V0CnEeXXEfWAcAAAB0ZXN0aW5ncSBh\nhVJxIVUGYXV0aG9ycSJOVQpxdWVyeV90YWdzcSNdVQVzY29wZXEkVQNhbGxVDnN0cmlwcGVkX3F1\nZXJ5cSVOVQlsb2dnZWRfaW5xJohVBXF1ZXJ5cSdOVQRwYWdlcShLAXViVRJfYXV0aF91c2VyX2Jh\nY2tlbmRVMmFza2JvdC5kZXBzLmRqYW5nb19hdXRob3BlbmlkLmJhY2tlbmRzLkF1dGhCYWNrZW5k\nVQh2aWV3X2xvZ2Nhc2tib3Quc2VhcmNoLnN0YXRlX21hbmFnZXIKVmlld0xvZwpxKSmBcSp9cSso\nVQVkZXB0aHEsSwNVBXZpZXdzcS1dcS4oVQNhc2txL1UJcXVlc3Rpb25zcTBVCHF1ZXN0aW9ucTFl\ndWJVBWVtYWlsVQB1Lg==\n','2012-01-17 05:56:41'),('50f14509d185d73935a2a8c4402089a2','MzBhZjM2ZGIyZjY1MDE3YWVmMjQwOWYzOGY5Mzc3OWE0MDcyNGVkMzqAAn1xAShVCHVzZXJuYW1l\nVQBVBm9wZW5pZChjYXNrYm90LmRlcHMuZGphbmdvX2F1dGhvcGVuaWQudXRpbApPcGVuSUQKcQJv\nfXEDKFUIaXNfaW5hbWVxBIlVBm9wZW5pZHEFVVBodHRwczovL3d3dy5nb29nbGUuY29tL2FjY291\nbnRzL284L2lkP2lkPUFJdE9hd2xiTl81QWkxVFZqMWFQMHJ0VDN4Q19iY1pJdHFQb2JsZ1UEc3Jl\nZ3EGfVUFYXR0cnNxB11xCChYEgAAAG9wZW5pZC5vcF9lbmRwb2ludHEJWBEAAABvcGVuaWQuY2xh\naW1lZF9pZHEKWA8AAABvcGVuaWQuaWRlbnRpdHlxC1gQAAAAb3BlbmlkLnJldHVybl90b3EMWBUA\nAABvcGVuaWQucmVzcG9uc2Vfbm9uY2VxDVgTAAAAb3BlbmlkLmFzc29jX2hhbmRsZXEOZVUGaXNz\ndWVkcQ9KSa3sTnViVQ1fYXV0aF91c2VyX2lkigEBVRNxdWVzdGlvbl92aWV3X3RpbWVzfXEQigEB\nY2RhdGV0aW1lCmRhdGV0aW1lCnERVQoH2wwTBCwzDMPahVJxEnNVCnRlc3Rjb29raWVVBndvcmtl\nZFUJcGFnZV9zaXplSwpVDHNlYXJjaF9zdGF0ZWNhc2tib3Quc2VhcmNoLnN0YXRlX21hbmFnZXIK\nU2VhcmNoU3RhdGUKcRMpgXEUfXEVKFUEc29ydHEWVQ1hY3Rpdml0eS1kZXNjVQZzZWFyY2hxF05V\nC3F1ZXJ5X3RpdGxlcRhOVQtxdWVyeV91c2Vyc3EZXVUGYXV0aG9ycRpOVQpxdWVyeV90YWdzcRtd\nVQR0YWdzcRxOVQlwYWdlX3NpemVxHUseVQRwYWdlcR5LAVUOc3RyaXBwZWRfcXVlcnlxH05VCWxv\nZ2dlZF9pbnEgiFUFcXVlcnlxIU5VBXNjb3BlcSJVA2FsbHViVRJfYXV0aF91c2VyX2JhY2tlbmRV\nMmFza2JvdC5kZXBzLmRqYW5nb19hdXRob3BlbmlkLmJhY2tlbmRzLkF1dGhCYWNrZW5kVQh2aWV3\nX2xvZ2Nhc2tib3Quc2VhcmNoLnN0YXRlX21hbmFnZXIKVmlld0xvZwpxIymBcSR9cSUoVQVkZXB0\naHEmSwNVBXZpZXdzcSddcSgoVQhxdWVzdGlvbnEpVQlxdWVzdGlvbnNxKlUFaW5kZXhxK2V1YlUF\nZW1haWxVAHUu\n','2012-01-02 04:44:53');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_crontabschedule`
--

DROP TABLE IF EXISTS `djcelery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

DROP TABLE IF EXISTS `djcelery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

DROP TABLE IF EXISTS `djcelery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_periodictask_17d2d99d` (`interval_id`),
  KEY `djcelery_periodictask_7aa5fda` (`crontab_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

DROP TABLE IF EXISTS `djcelery_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

DROP TABLE IF EXISTS `djcelery_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_355bfc27` (`state`),
  KEY `djcelery_taskstate_52094d6e` (`name`),
  KEY `djcelery_taskstate_f459b00` (`tstamp`),
  KEY `djcelery_taskstate_20fc5b84` (`worker_id`),
  KEY `djcelery_taskstate_c91f1bf` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

DROP TABLE IF EXISTS `djcelery_workerstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_1475381c` (`last_heartbeat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djkombu_message`
--

DROP TABLE IF EXISTS `djkombu_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djkombu_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visible` tinyint(1) NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  `payload` longtext NOT NULL,
  `queue_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djkombu_message_16b2708a` (`visible`),
  KEY `djkombu_message_774871ae` (`sent_at`),
  KEY `djkombu_message_1e72d6b8` (`queue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djkombu_message`
--

LOCK TABLES `djkombu_message` WRITE;
/*!40000 ALTER TABLE `djkombu_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `djkombu_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djkombu_queue`
--

DROP TABLE IF EXISTS `djkombu_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djkombu_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djkombu_queue`
--

LOCK TABLES `djkombu_queue` WRITE;
/*!40000 ALTER TABLE `djkombu_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `djkombu_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_question`
--

DROP TABLE IF EXISTS `favorite_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_question` (
  `question_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_at` datetime NOT NULL DEFAULT '2011-12-16 21:39:18',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorite_question_1f92e550` (`question_id`),
  KEY `favorite_question_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_question`
--

LOCK TABLES `favorite_question` WRITE;
/*!40000 ALTER TABLE `favorite_question` DISABLE KEYS */;
INSERT INTO `favorite_question` VALUES (1,1,'2011-12-18 04:26:36',1);
/*!40000 ALTER TABLE `favorite_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followit_followuser`
--

DROP TABLE IF EXISTS `followit_followuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followit_followuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `followit_followuser_403f60f` (`user_id`),
  KEY `followit_followuser_7d61c803` (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followit_followuser`
--

LOCK TABLES `followit_followuser` WRITE;
/*!40000 ALTER TABLE `followit_followuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `followit_followuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livesettings_longsetting`
--

DROP TABLE IF EXISTS `livesettings_longsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livesettings_longsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `group` varchar(100) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`,`group`,`key`),
  KEY `livesettings_longsetting_6223029` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livesettings_longsetting`
--

LOCK TABLES `livesettings_longsetting` WRITE;
/*!40000 ALTER TABLE `livesettings_longsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `livesettings_longsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livesettings_setting`
--

DROP TABLE IF EXISTS `livesettings_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livesettings_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `group` varchar(100) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`,`group`,`key`),
  KEY `livesettings_setting_6223029` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livesettings_setting`
--

LOCK TABLES `livesettings_setting` WRITE;
/*!40000 ALTER TABLE `livesettings_setting` DISABLE KEYS */;
INSERT INTO `livesettings_setting` VALUES (1,1,'GENERAL_SKIN_SETTINGS','MEDIA_RESOURCE_REVISION','2'),(2,1,'GENERAL_SKIN_SETTINGS','MEDIA_RESOURCE_REVISION_HASH','f9eb04f7ad91034926324e146f925dfcf4e8fa91');
/*!40000 ALTER TABLE `livesettings_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `wiki` tinyint(1) NOT NULL DEFAULT '0',
  `vote_up_count` int(11) NOT NULL DEFAULT '0',
  `answer_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `offensive_flag_count` smallint(6) NOT NULL DEFAULT '0',
  `closed_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_activity_by_id` int(11) NOT NULL,
  `view_count` int(10) unsigned NOT NULL DEFAULT '0',
  `locked_at` datetime DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL,
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  `html` longtext,
  `vote_down_count` int(11) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `last_edited_by_id` int(11) DEFAULT NULL,
  `favourite_count` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `summary` varchar(180) NOT NULL,
  `answer_count` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity_at` datetime NOT NULL DEFAULT '2011-12-16 21:39:18',
  `closed_by_id` int(11) DEFAULT NULL,
  `close_reason` smallint(6) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `tagnames` varchar(125) NOT NULL,
  `locked_by_id` int(11) DEFAULT NULL,
  `added_at` datetime NOT NULL DEFAULT '2011-12-16 21:39:18',
  `deleted_by_id` int(11) DEFAULT NULL,
  `wikified_at` datetime DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `last_edited_at` datetime DEFAULT NULL,
  `text` longtext,
  `is_anonymous` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_3078eefc` (`last_activity_by_id`),
  KEY `question_337b96ff` (`author_id`),
  KEY `question_4979023e` (`last_edited_by_id`),
  KEY `question_1cd278eb` (`closed_by_id`),
  KEY `question_4e65607d` (`locked_by_id`),
  KEY `question_513df729` (`deleted_by_id`),
  FULLTEXT KEY `askbot_question_full_text_index` (`title`,`text`,`tagnames`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (0,0,0,0,NULL,NULL,1,1,1,NULL,0,1,0,'[latex]H_2O[/latex]',0,0,NULL,1,0,'abc def jhklm sfdsajlfkdjsalfds this is testing image. avatar.jpg',0,'2011-12-18 04:26:11',NULL,NULL,0,'testing image',NULL,'2011-12-18 04:26:11',NULL,NULL,'testing testing',NULL,'abc def jhklm sfdsajlfkdjsalfds\r\nthis is testing image.\r\n[avatar.jpg](/upfiles/1324203960755131.jpg)',0),(0,0,0,0,NULL,NULL,2,1,0,NULL,0,1,0,'<p>hello</p>\n\n<p>tis thisdf skjltjf sfd df</p>\n',0,0,NULL,0,0,'hello\n\ntis thisdf skjltjf sfd df\n',0,'2012-01-02 22:24:21',NULL,NULL,0,'test',NULL,'2012-01-02 22:24:21',NULL,NULL,'i think this should be something else',NULL,'hello\r\n\r\ntis thisdf skjltjf sfd df',0),(0,0,0,0,NULL,NULL,3,1,0,NULL,0,1,0,'<p>testing testitni sfdit</p>\n',0,0,NULL,0,0,'testing testitni sfdit\n',0,'2012-01-02 22:25:04',NULL,NULL,0,'testing',NULL,'2012-01-02 22:25:04',NULL,NULL,'may be yyou are wrong',NULL,'testing testitni sfdit',0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_followed_by`
--

DROP TABLE IF EXISTS `question_followed_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_followed_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question_followed_by_question_id_2ee2b8ae_uniq` (`question_id`,`user_id`),
  KEY `question_followed_by_1f92e550` (`question_id`),
  KEY `question_followed_by_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_followed_by`
--

LOCK TABLES `question_followed_by` WRITE;
/*!40000 ALTER TABLE `question_followed_by` DISABLE KEYS */;
INSERT INTO `question_followed_by` VALUES (1,1,1);
/*!40000 ALTER TABLE `question_followed_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_tags`
--

DROP TABLE IF EXISTS `question_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question_tags_question_id_37b2f428_uniq` (`question_id`,`tag_id`),
  KEY `question_tags_1f92e550` (`question_id`),
  KEY `question_tags_3747b463` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_tags`
--

LOCK TABLES `question_tags` WRITE;
/*!40000 ALTER TABLE `question_tags` DISABLE KEYS */;
INSERT INTO `question_tags` VALUES (4,1,2),(3,1,1),(5,2,3),(6,3,2);
/*!40000 ALTER TABLE `question_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repute`
--

DROP TABLE IF EXISTS `repute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repute` (
  `positive` smallint(6) NOT NULL DEFAULT '0',
  `question_id` int(11),
  `negative` smallint(6) NOT NULL DEFAULT '0',
  `reputation_type` smallint(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reputed_at` datetime NOT NULL DEFAULT '2011-12-16 21:39:18',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reputation` int(11) NOT NULL DEFAULT '1',
  `comment` varchar(128),
  PRIMARY KEY (`id`),
  KEY `repute_1f92e550` (`question_id`),
  KEY `repute_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repute`
--

LOCK TABLES `repute` WRITE;
/*!40000 ALTER TABLE `repute` DISABLE KEYS */;
/*!40000 ALTER TABLE `repute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule`
--

DROP TABLE IF EXISTS `robots_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `robot` varchar(255) NOT NULL,
  `crawl_delay` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule`
--

LOCK TABLES `robots_rule` WRITE;
/*!40000 ALTER TABLE `robots_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_allowed`
--

DROP TABLE IF EXISTS `robots_rule_allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_allowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_id` (`rule_id`,`url_id`),
  KEY `robots_rule_allowed_1c671d36` (`rule_id`),
  KEY `robots_rule_allowed_7cc357c4` (`url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_allowed`
--

LOCK TABLES `robots_rule_allowed` WRITE;
/*!40000 ALTER TABLE `robots_rule_allowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_allowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_disallowed`
--

DROP TABLE IF EXISTS `robots_rule_disallowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_disallowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_id` (`rule_id`,`url_id`),
  KEY `robots_rule_disallowed_1c671d36` (`rule_id`),
  KEY `robots_rule_disallowed_7cc357c4` (`url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_disallowed`
--

LOCK TABLES `robots_rule_disallowed` WRITE;
/*!40000 ALTER TABLE `robots_rule_disallowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_disallowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_sites`
--

DROP TABLE IF EXISTS `robots_rule_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_id` (`rule_id`,`site_id`),
  KEY `robots_rule_sites_1c671d36` (`rule_id`),
  KEY `robots_rule_sites_6223029` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_sites`
--

LOCK TABLES `robots_rule_sites` WRITE;
/*!40000 ALTER TABLE `robots_rule_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_url`
--

DROP TABLE IF EXISTS `robots_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_url`
--

LOCK TABLES `robots_url` WRITE;
/*!40000 ALTER TABLE `robots_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'askbot','0001_initial','2011-12-17 03:39:19'),(2,'askbot','0002_auto__add_field_answer_text__chg_field_answer_html__add_field_question','2011-12-17 03:39:20'),(3,'askbot','0003_copy_denorm_text_record_to_posts_for_fulltext_search','2011-12-17 03:39:20'),(4,'askbot','0004_install_full_text_indexes_for_mysql','2011-12-17 03:39:20'),(5,'askbot','0005_install_badges','2011-12-17 03:39:20'),(6,'askbot','0006_add_subscription_setting_for_comments_and_mentions','2011-12-17 03:39:20'),(7,'askbot','0007_install_mentions_model','2011-12-17 03:39:20'),(8,'askbot','0008_add_html_field_to_comments','2011-12-17 03:39:20'),(9,'askbot','0009_calculate_html_field_for_comments','2011-12-17 03:39:21'),(10,'askbot','0010_add_receiving_user_to_activity_model','2011-12-17 03:39:21'),(11,'askbot','0011_merge_mentions_into_activity','2011-12-17 03:39:21'),(12,'askbot','0012_delete_some_unused_models','2011-12-17 03:39:21'),(13,'askbot','0013_add_response_count__to_user','2011-12-17 03:39:21'),(14,'askbot','0014_rename_schema_from_forum_to_askbot','2011-12-17 03:39:21'),(15,'askbot','0015_rename_forum_contenttypes_to_askbot','2011-12-17 03:39:21'),(16,'askbot','0016_auto__del_validationhash','2011-12-17 03:39:21'),(17,'askbot','0017_add_group__moderators','2011-12-17 03:39:21'),(18,'askbot','0018_add___status__field_to_user_model','2011-12-17 03:39:21'),(19,'askbot','0019_populate_user_status_field','2011-12-17 03:39:21'),(20,'askbot','0020_auto__add_field_repute_comment__chg_field_repute_question','2011-12-17 03:39:22'),(21,'askbot','0021_auto__add_field_comment_score','2011-12-17 03:39:22'),(22,'askbot','0022_init_postgresql_full_text_search','2011-12-17 03:39:22'),(23,'askbot','0023_auto__add_activityauditstatus','2011-12-17 03:39:22'),(24,'askbot','0024_add_recipients_m2m_to_activity_and_denorm_question_on_activity','2011-12-17 03:39:22'),(25,'askbot','0025_transfer_flagged_items_to_activity','2011-12-17 03:39:22'),(26,'askbot','0026_add_seen_and_new_response_counts_to_user','2011-12-17 03:39:22'),(27,'askbot','0027_populate_new_response_counts','2011-12-17 03:39:22'),(28,'askbot','0028_delete_response_count_column_from_user_model','2011-12-17 03:39:22'),(29,'askbot','0029_auto__del_flaggeditem','2011-12-17 03:39:23'),(30,'askbot','0030_rename_badge_to_badgedata','2011-12-17 03:39:23'),(31,'askbot','0031_synchronize_badge_slug_with_name','2011-12-17 03:39:23'),(32,'askbot','0032_auto__del_field_badgedata_multiple__del_field_badgedata_description__d','2011-12-17 03:39:23'),(33,'askbot','0033_add__consecutive_days_visit_count__to__auth_user','2011-12-17 03:39:23'),(34,'askbot','0034_auto__add_field_user_avatar_url','2011-12-17 03:39:23'),(35,'askbot','0035_add_country_fields_to_user','2011-12-17 03:39:23'),(36,'askbot','0036_auto__add_field_anonymousquestion_is_anonymous__add_field_questionrevi','2011-12-17 03:39:23'),(37,'askbot','0037_add_marked_tags_to_user_profile','2011-12-17 03:39:23'),(38,'askbot','0038_add_tag_filter_strategies','2011-12-17 03:39:24'),(39,'askbot','0039_populate_tag_filter_strategies','2011-12-17 03:39:24'),(40,'askbot','0040_delete_old_tag_filter_strategies','2011-12-17 03:39:24'),(41,'askbot','0041_add_field_comment_offensive_flag_count','2011-12-17 03:39:24'),(42,'askbot','0042_auto__add_field_activity_summary','2011-12-17 03:39:24'),(43,'askbot','0043_add_temporal_extra_column_for_datamigration','2011-12-17 03:39:24'),(44,'askbot','0044_migrate_has_custom_avatar_field','2011-12-17 03:39:24'),(45,'askbot','0045_delete_has_custom_avatar','2011-12-17 03:39:24'),(46,'askbot','0046_add_uniques_to_email_feed_settings','2011-12-17 03:39:24'),(47,'askbot','0047_auto__add_field_answerrevision_revision_type__add_field_answerrevision','2011-12-17 03:39:24'),(48,'askbot','0048_set_proper_revision_types','2011-12-17 03:39:25'),(49,'askbot','0049_add_postrevision_model','2011-12-17 03:39:25'),(50,'askbot','0050_move_qa_revisions_to_postrevision','2011-12-17 03:39:25'),(51,'askbot','0051_proxify_qa_rev_models','2011-12-17 03:39:25'),(52,'django_authopenid','0001_initial','2011-12-17 03:42:18'),(53,'django_authopenid','0002_make_multiple_openids_possible','2011-12-17 03:42:18'),(54,'django_authopenid','0003_fill_in_provider_names','2011-12-17 03:42:18'),(55,'django_authopenid','0004_auto__add_field_userassociation_last_used_timestamp__add_unique_useras','2011-12-17 03:42:18'),(56,'django_authopenid','0005_auto__del_externallogindata','2011-12-17 03:42:18');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `name` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int(11) NOT NULL,
  `deleted_by_id` int(11) DEFAULT NULL,
  `used_count` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `tag_4a21cf42` (`created_by_id`),
  KEY `tag_513df729` (`deleted_by_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES ('image',0,1,NULL,1,NULL,1),('testing',0,1,NULL,2,NULL,2),('test',0,1,NULL,1,NULL,3);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `object_id` int(10) unsigned NOT NULL,
  `voted_at` datetime NOT NULL DEFAULT '2011-12-16 21:39:18',
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `vote` smallint(6) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vote_content_type_id_73c504b6_uniq` (`content_type_id`,`object_id`,`user_id`),
  KEY `vote_403f60f` (`user_id`),
  KEY `vote_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-01-03 19:58:01
