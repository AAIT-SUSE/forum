-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: aait_forum
-- ------------------------------------------------------
-- Server version	5.7.21-1

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `administrator_id` int(10) unsigned NOT NULL COMMENT '主键,管理员id',
  `user_id` int(11) NOT NULL COMMENT '管理员的用户id',
  PRIMARY KEY (`administrator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='网站管理员类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,文章id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `article_time` datetime DEFAULT NULL COMMENT '文章发表时间',
  `title` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '文章标题',
  `is_valid` tinyint(4) DEFAULT NULL COMMENT '文章是否有效（0 无效，1 有效，无效时存在文章回收站中，之在回收站显示）',
  `content` text COLLATE utf8_bin COMMENT '文章内容',
  `article_board_id` int(11) DEFAULT NULL COMMENT '文章版本id',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='论坛发表文章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,8,NULL,'sfsdfsdf',1,'sdfsdf',1),(2,8,'2020-02-02 13:00:00','sfsdfsdf',1,'sdfsdf',1);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_board`
--

DROP TABLE IF EXISTS `article_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_board` (
  `article_board_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,文章版块id',
  `board_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '版块名',
  `board_description` text COLLATE utf8_bin COMMENT '文章版块描述',
  `last_article_id` int(11) DEFAULT NULL COMMENT '最新发表文章的id',
  PRIMARY KEY (`article_board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章版块';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_board`
--

LOCK TABLES `article_board` WRITE;
/*!40000 ALTER TABLE `article_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_comment`
--

DROP TABLE IF EXISTS `article_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_comment` (
  `article_comment_id` int(10) unsigned NOT NULL COMMENT '主键,文章评论id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `article_id` int(11) DEFAULT NULL COMMENT '文章id',
  `content` text COLLATE utf8_bin COMMENT '评论内容',
  `time` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`article_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章评论类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_comment`
--

LOCK TABLES `article_comment` WRITE;
/*!40000 ALTER TABLE `article_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'admin');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,32),(2,1,115);
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
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add administrator',7,'add_administrator'),(26,'Can change administrator',7,'change_administrator'),(27,'Can delete administrator',7,'delete_administrator'),(28,'Can view administrator',7,'view_administrator'),(29,'Can add article',8,'add_article'),(30,'Can change article',8,'change_article'),(31,'Can delete article',8,'delete_article'),(32,'Can view article',8,'view_article'),(33,'Can add article board',9,'add_articleboard'),(34,'Can change article board',9,'change_articleboard'),(35,'Can delete article board',9,'delete_articleboard'),(36,'Can view article board',9,'view_articleboard'),(37,'Can add article comment',10,'add_articlecomment'),(38,'Can change article comment',10,'change_articlecomment'),(39,'Can delete article comment',10,'delete_articlecomment'),(40,'Can view article comment',10,'view_articlecomment'),(41,'Can add goods',11,'add_goods'),(42,'Can change goods',11,'change_goods'),(43,'Can delete goods',11,'delete_goods'),(44,'Can view goods',11,'view_goods'),(45,'Can add group',12,'add_group'),(46,'Can change group',12,'change_group'),(47,'Can delete group',12,'delete_group'),(48,'Can view group',12,'view_group'),(49,'Can add group activity',13,'add_groupactivity'),(50,'Can change group activity',13,'change_groupactivity'),(51,'Can delete group activity',13,'delete_groupactivity'),(52,'Can view group activity',13,'view_groupactivity'),(53,'Can add group bulletin',14,'add_groupbulletin'),(54,'Can change group bulletin',14,'change_groupbulletin'),(55,'Can delete group bulletin',14,'delete_groupbulletin'),(56,'Can view group bulletin',14,'view_groupbulletin'),(57,'Can add group members',15,'add_groupmembers'),(58,'Can change group members',15,'change_groupmembers'),(59,'Can delete group members',15,'delete_groupmembers'),(60,'Can view group members',15,'view_groupmembers'),(61,'Can add group task',16,'add_grouptask'),(62,'Can change group task',16,'change_grouptask'),(63,'Can delete group task',16,'delete_grouptask'),(64,'Can view group task',16,'view_grouptask'),(65,'Can add group task join',17,'add_grouptaskjoin'),(66,'Can change group task join',17,'change_grouptaskjoin'),(67,'Can delete group task join',17,'delete_grouptaskjoin'),(68,'Can view group task join',17,'view_grouptaskjoin'),(69,'Can add join group activity',18,'add_joingroupactivity'),(70,'Can change join group activity',18,'change_joingroupactivity'),(71,'Can delete join group activity',18,'delete_joingroupactivity'),(72,'Can view join group activity',18,'view_joingroupactivity'),(73,'Can add poromodo clock',19,'add_poromodoclock'),(74,'Can change poromodo clock',19,'change_poromodoclock'),(75,'Can delete poromodo clock',19,'delete_poromodoclock'),(76,'Can view poromodo clock',19,'view_poromodoclock'),(77,'Can add post',20,'add_post'),(78,'Can change post',20,'change_post'),(79,'Can delete post',20,'delete_post'),(80,'Can view post',20,'view_post'),(81,'Can add post board',21,'add_postboard'),(82,'Can change post board',21,'change_postboard'),(83,'Can delete post board',21,'delete_postboard'),(84,'Can view post board',21,'view_postboard'),(85,'Can add post comment',22,'add_postcomment'),(86,'Can change post comment',22,'change_postcomment'),(87,'Can delete post comment',22,'delete_postcomment'),(88,'Can view post comment',22,'view_postcomment'),(89,'Can add post comment reply',23,'add_postcommentreply'),(90,'Can change post comment reply',23,'change_postcommentreply'),(91,'Can delete post comment reply',23,'delete_postcommentreply'),(92,'Can view post comment reply',23,'view_postcommentreply'),(93,'Can add post theme',24,'add_posttheme'),(94,'Can change post theme',24,'change_posttheme'),(95,'Can delete post theme',24,'delete_posttheme'),(96,'Can view post theme',24,'view_posttheme'),(97,'Can add prize',25,'add_prize'),(98,'Can change prize',25,'change_prize'),(99,'Can delete prize',25,'delete_prize'),(100,'Can view prize',25,'view_prize'),(101,'Can add schedule',26,'add_schedule'),(102,'Can change schedule',26,'change_schedule'),(103,'Can delete schedule',26,'delete_schedule'),(104,'Can view schedule',26,'view_schedule'),(105,'Can add schedule classify',27,'add_scheduleclassify'),(106,'Can change schedule classify',27,'change_scheduleclassify'),(107,'Can delete schedule classify',27,'delete_scheduleclassify'),(108,'Can view schedule classify',27,'view_scheduleclassify'),(109,'Can add schedule tag',28,'add_scheduletag'),(110,'Can change schedule tag',28,'change_scheduletag'),(111,'Can delete schedule tag',28,'delete_scheduletag'),(112,'Can view schedule tag',28,'view_scheduletag'),(113,'Can add user',29,'add_user'),(114,'Can change user',29,'change_user'),(115,'Can delete user',29,'delete_user'),(116,'Can view user',29,'view_user'),(117,'Can add user account',30,'add_useraccount'),(118,'Can change user account',30,'change_useraccount'),(119,'Can delete user account',30,'delete_useraccount'),(120,'Can view user account',30,'view_useraccount');
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
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$sD9AIj0L8MmJ$EobfhxPoFgg/HYvFwmIBwUww/d6G/1//ySPTlbiFGx4=','2018-09-13 23:04:33.000000',1,'admin','','','admin@qq.com',1,1,'2018-09-13 23:03:32.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-09-14 06:11:39.968631','1','admin',1,'[{\"added\": {}}]',3,1),(2,'2018-09-14 06:12:35.353762','1','admin',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(3,'2018-09-14 06:13:32.625118','1','User object (1)',1,'[{\"added\": {}}]',29,1),(4,'2018-09-14 06:13:54.194149','1','User object (1)',3,'',29,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'AAIT_official_forum','administrator'),(8,'AAIT_official_forum','article'),(9,'AAIT_official_forum','articleboard'),(10,'AAIT_official_forum','articlecomment'),(11,'AAIT_official_forum','goods'),(12,'AAIT_official_forum','group'),(13,'AAIT_official_forum','groupactivity'),(14,'AAIT_official_forum','groupbulletin'),(15,'AAIT_official_forum','groupmembers'),(16,'AAIT_official_forum','grouptask'),(17,'AAIT_official_forum','grouptaskjoin'),(18,'AAIT_official_forum','joingroupactivity'),(19,'AAIT_official_forum','poromodoclock'),(20,'AAIT_official_forum','post'),(21,'AAIT_official_forum','postboard'),(22,'AAIT_official_forum','postcomment'),(23,'AAIT_official_forum','postcommentreply'),(24,'AAIT_official_forum','posttheme'),(25,'AAIT_official_forum','prize'),(26,'AAIT_official_forum','schedule'),(27,'AAIT_official_forum','scheduleclassify'),(28,'AAIT_official_forum','scheduletag'),(29,'AAIT_official_forum','user'),(30,'AAIT_official_forum','useraccount'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'AAIT_official_forum','0001_initial','2018-09-13 22:59:29.146966'),(2,'contenttypes','0001_initial','2018-09-13 22:59:29.640849'),(3,'auth','0001_initial','2018-09-13 22:59:31.125749'),(4,'admin','0001_initial','2018-09-13 22:59:31.247179'),(5,'admin','0002_logentry_remove_auto_add','2018-09-13 22:59:31.263986'),(6,'admin','0003_logentry_add_action_flag_choices','2018-09-13 22:59:31.289625'),(7,'contenttypes','0002_remove_content_type_name','2018-09-13 22:59:31.406843'),(8,'auth','0002_alter_permission_name_max_length','2018-09-13 22:59:31.455804'),(9,'auth','0003_alter_user_email_max_length','2018-09-13 22:59:33.161136'),(10,'auth','0004_alter_user_username_opts','2018-09-13 22:59:33.185222'),(11,'auth','0005_alter_user_last_login_null','2018-09-13 22:59:33.279403'),(12,'auth','0006_require_contenttypes_0002','2018-09-13 22:59:33.305016'),(13,'auth','0007_alter_validators_add_error_messages','2018-09-13 22:59:33.334082'),(14,'auth','0008_alter_user_username_max_length','2018-09-13 22:59:33.383195'),(15,'auth','0009_alter_user_last_name_max_length','2018-09-13 22:59:33.438794'),(16,'sessions','0001_initial','2018-09-13 22:59:33.479495');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('oreivk4rjpw8qsqxgd35ne8t0xki3cb7','NjMzNWZjZmExNTg0OGZmY2YzZTE0MTZhMTk1ZWNkNzNmZmQxYWEyMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2QzOTZiMjk0OTQ5NWQ3OTRmYjMyZDUwMTk2NzQwYWNkZGI2ZWE2In0=','2018-09-27 23:04:33.949548');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,商品id',
  `price` bigint(20) DEFAULT NULL COMMENT '价格',
  `stock` bigint(20) DEFAULT NULL COMMENT '库存',
  `goods_image` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '商品主图',
  `goods_info` text COLLATE utf8_bin COMMENT '商品详情',
  `is_online` tinyint(4) DEFAULT NULL COMMENT '是否上架（0 未上架，1已上架,未上架时可以在仓库显示）',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='虚拟商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,群组id',
  `user_id` int(11) DEFAULT NULL COMMENT '群主userid',
  `create_time` datetime DEFAULT NULL COMMENT '群创建时间',
  `is_close` tinyint(4) DEFAULT NULL COMMENT '是否关闭群（0 未关闭,1 已关闭）',
  `description` text COLLATE utf8_bin COMMENT '群描述',
  `group_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '群名',
  `group_type` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '群类型',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='群组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_activity`
--

DROP TABLE IF EXISTS `group_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_activity` (
  `group_activity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,，群活动id',
  `group_id` int(11) DEFAULT NULL COMMENT '群活动所属的群',
  `user_id` int(11) DEFAULT NULL COMMENT '创建活动人id',
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `description` text COLLATE utf8_bin COMMENT '群活动描述',
  `is_close` tinyint(4) DEFAULT NULL COMMENT '是否关闭(0 未关闭,1 已关闭，关闭之后可以在回收站看到)',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `group_activity_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '群活动名字',
  `remind_time` datetime DEFAULT NULL COMMENT '提醒时间',
  `appendix` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '附件的url地址',
  `group_activity_cover` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '活动封面图片地址',
  PRIMARY KEY (`group_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='群活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_activity`
--

LOCK TABLES `group_activity` WRITE;
/*!40000 ALTER TABLE `group_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_bulletin`
--

DROP TABLE IF EXISTS `group_bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_bulletin` (
  `group_bulletin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,群公告id',
  `group_id` int(11) DEFAULT NULL COMMENT '群id',
  `time` datetime DEFAULT NULL COMMENT '公告发布时间',
  `content` text COLLATE utf8_bin COMMENT '群公告内容',
  `user_id` int(11) DEFAULT NULL COMMENT '发表人id',
  PRIMARY KEY (`group_bulletin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='群公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_bulletin`
--

LOCK TABLES `group_bulletin` WRITE;
/*!40000 ALTER TABLE `group_bulletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_bulletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_members`
--

DROP TABLE IF EXISTS `group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_members` (
  `group_members_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，群成员表id',
  `user_id` int(11) DEFAULT NULL COMMENT '群员的用户id',
  `is_administrator` tinyint(4) DEFAULT NULL COMMENT '是否是管理员(0 不是管理员，1是管理员)',
  `group_id` int(11) DEFAULT NULL COMMENT '群员所属群组id',
  PRIMARY KEY (`group_members_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='群成员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_members`
--

LOCK TABLES `group_members` WRITE;
/*!40000 ALTER TABLE `group_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_task`
--

DROP TABLE IF EXISTS `group_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_task` (
  `group_task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，群任务id',
  `group_id` int(11) DEFAULT NULL COMMENT '群组id',
  `create_time` datetime DEFAULT NULL COMMENT '群任务创建时间',
  `description` text COLLATE utf8_bin COMMENT '群任务描述',
  `is_close` tinyint(4) DEFAULT NULL COMMENT '是否关闭(0 未关闭,1 已关闭,已关闭的任务可以在任务回收站中显示)',
  `user_id` int(11) DEFAULT NULL COMMENT '发表任务的用户id',
  `appendix` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '附件的url地址',
  `group_task_cover` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '群任务封面',
  PRIMARY KEY (`group_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='群任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_task`
--

LOCK TABLES `group_task` WRITE;
/*!40000 ALTER TABLE `group_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_task_join`
--

DROP TABLE IF EXISTS `group_task_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_task_join` (
  `group_task_join_id` int(11) NOT NULL COMMENT '主键,群任务参与id',
  `group_task_id` int(11) DEFAULT NULL COMMENT '参与的群任务id',
  `user_id` int(11) DEFAULT NULL COMMENT '参与群组的群员的用户id',
  `is_finish` tinyint(4) DEFAULT NULL COMMENT '是否完成任务(0 未完成,1 已完成)',
  `group_id` int(11) DEFAULT NULL COMMENT '群任务所属群组id',
  `finish_time` datetime DEFAULT NULL COMMENT '任务完成时间',
  `join_time` datetime DEFAULT NULL COMMENT '任务参与时间',
  PRIMARY KEY (`group_task_join_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='参与群任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_task_join`
--

LOCK TABLES `group_task_join` WRITE;
/*!40000 ALTER TABLE `group_task_join` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_task_join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `join_group_activity`
--

DROP TABLE IF EXISTS `join_group_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `join_group_activity` (
  `join_group_activity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,参与群活动id',
  `group_id` int(11) DEFAULT NULL COMMENT '群活动所属群id',
  `user_id` int(11) DEFAULT NULL COMMENT '参与活动的群员id',
  `group_activity_id` int(11) DEFAULT NULL COMMENT '群活动id',
  `join_time` datetime DEFAULT NULL COMMENT '参与时间',
  `is_join_finish` tinyint(4) DEFAULT NULL COMMENT '是否全程参与(0 未全程参与,1 是全程参与)',
  `is_expire` tinyint(4) DEFAULT NULL COMMENT '是否超时(0 未超时,1 已超时)',
  PRIMARY KEY (`join_group_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='参与群活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `join_group_activity`
--

LOCK TABLES `join_group_activity` WRITE;
/*!40000 ALTER TABLE `join_group_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `join_group_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poromodo_clock`
--

DROP TABLE IF EXISTS `poromodo_clock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poromodo_clock` (
  `Poromodo_Clock_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,番茄时钟id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `clock_count` smallint(6) DEFAULT NULL COMMENT '时钟数',
  `invalid_poromodo_clock` smallint(6) DEFAULT NULL COMMENT '放弃的番茄时钟数',
  PRIMARY KEY (`Poromodo_Clock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='番茄时钟';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poromodo_clock`
--

LOCK TABLES `poromodo_clock` WRITE;
/*!40000 ALTER TABLE `poromodo_clock` DISABLE KEYS */;
/*!40000 ALTER TABLE `poromodo_clock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,贴子id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `post_time` datetime DEFAULT NULL COMMENT '发帖时间',
  `post_content` text COLLATE utf8_bin COMMENT '贴子内容',
  `title` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '贴子标题',
  `post_board_id` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '贴子版块id',
  `is_vaild` tinyint(4) DEFAULT NULL COMMENT '是否有效:0 无效，1 有效（贴子无效时，存在贴子回收站中，只能在回收站中显示）',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='论坛贴子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_board`
--

DROP TABLE IF EXISTS `post_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_board` (
  `post_board_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,板块id',
  `board_description` text COLLATE utf8_bin COMMENT '板块描述',
  `post_theme_id` int(11) DEFAULT NULL COMMENT '板块所属主题',
  `last_post_id` int(11) DEFAULT NULL COMMENT '最新发帖id',
  `board_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '板块名',
  PRIMARY KEY (`post_board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='论坛贴子版块';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_board`
--

LOCK TABLES `post_board` WRITE;
/*!40000 ALTER TABLE `post_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comment`
--

DROP TABLE IF EXISTS `post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_comment` (
  `post_comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,评论id',
  `user_id` int(11) DEFAULT NULL COMMENT '评论人的userid',
  `post_comment_content` text COLLATE utf8_bin COMMENT '帖子评论内容',
  `post_comment_time` datetime DEFAULT NULL COMMENT '论坛帖子发表时间',
  `post_id` int(11) DEFAULT NULL COMMENT '论坛帖子id',
  `is_have_comment` tinyint(4) DEFAULT NULL COMMENT '是否有二级回复',
  PRIMARY KEY (`post_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='论坛帖子评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comment`
--

LOCK TABLES `post_comment` WRITE;
/*!40000 ALTER TABLE `post_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comment_reply`
--

DROP TABLE IF EXISTS `post_comment_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_comment_reply` (
  `post_comment_reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,二级回复id',
  `post_comment_id` int(11) DEFAULT NULL COMMENT '贴子评论id',
  `user_id` int(11) DEFAULT NULL COMMENT '回复人userid',
  `reply_content` text COLLATE utf8_bin COMMENT '回复内容',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`post_comment_reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='论坛贴子评论的二级回复';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comment_reply`
--

LOCK TABLES `post_comment_reply` WRITE;
/*!40000 ALTER TABLE `post_comment_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_comment_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_theme`
--

DROP TABLE IF EXISTS `post_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_theme` (
  `post_theme_id` int(11) NOT NULL COMMENT '主键,主题id',
  `theme_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '论坛主题名',
  PRIMARY KEY (`post_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='贴子版块主题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_theme`
--

LOCK TABLES `post_theme` WRITE;
/*!40000 ALTER TABLE `post_theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prize`
--

DROP TABLE IF EXISTS `prize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prize` (
  `prize_id` int(11) NOT NULL COMMENT '主键,奖品id',
  `prize_image` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品主图',
  `title` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品标题',
  `price` smallint(6) DEFAULT NULL COMMENT '奖品所需积分',
  `prize_description` text COLLATE utf8_bin COMMENT '奖品描述',
  `prize_stock` int(11) DEFAULT NULL COMMENT '奖品库存',
  `is_online` tinyint(2) DEFAULT NULL COMMENT '是否上架(0 未上架,1 已上架，未上架的奖品可以在仓库中看到)',
  PRIMARY KEY (`prize_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实物奖品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prize`
--

LOCK TABLES `prize` WRITE;
/*!40000 ALTER TABLE `prize` DISABLE KEYS */;
/*!40000 ALTER TABLE `prize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,日程id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `description` text COLLATE utf8_bin COMMENT '日程描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `schedule_class_id` int(11) DEFAULT NULL COMMENT '日程分类id',
  `is_finish` tinyint(4) DEFAULT NULL COMMENT '是否完成（0 未完成,1 完成）',
  `is_delete` tinyint(4) DEFAULT NULL COMMENT '是否删除(0 未删除，1 已删除，删除后只在回收站显示)',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_classify`
--

DROP TABLE IF EXISTS `schedule_classify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_classify` (
  `schedule_classify_id` int(11) NOT NULL COMMENT '主键,日程分类id',
  `classify_info` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '日程分类',
  PRIMARY KEY (`schedule_classify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日程分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_classify`
--

LOCK TABLES `schedule_classify` WRITE;
/*!40000 ALTER TABLE `schedule_classify` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_classify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_tag`
--

DROP TABLE IF EXISTS `schedule_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_tag` (
  `schedule_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `schedule_id` int(11) DEFAULT NULL COMMENT '日程id',
  `tag` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '标签内容',
  PRIMARY KEY (`schedule_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_tag`
--

LOCK TABLES `schedule_tag` WRITE;
/*!40000 ALTER TABLE `schedule_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,用户ID',
  `username` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '用户密码，md5密文',
  `salt` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '盐值，用于验证用户名和密码',
  `e_mail` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '用户邮箱',
  `user_logo` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像url地址',
  `user_rank` int(11) DEFAULT NULL COMMENT '用户等级',
  `user_description` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '个人简介',
  `last_post_id` int(11) DEFAULT NULL COMMENT '最新贴子ID',
  `last_article_id` int(11) DEFAULT NULL COMMENT '最新文章ID',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='论坛用户类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `user_account_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,账户id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `user_score` int(11) DEFAULT NULL COMMENT '用户积分',
  PRIMARY KEY (`user_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='论坛用户积分账户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-18  7:54:36
