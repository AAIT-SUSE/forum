-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: aait_forum
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
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
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,文章id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `article_time` datetime DEFAULT NULL COMMENT '文章发表时间',
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文章标题',
  `is_valid` tinyint(4) DEFAULT NULL COMMENT '文章是否有效（0 无效，1 有效，无效时存在文章回收站中，之在回收站显示）',
  `content` text COLLATE utf8_bin COMMENT '文章内容',
  `article_board_id` int(11) DEFAULT NULL COMMENT '文章版本id',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='论坛发表文章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_board`
--

DROP TABLE IF EXISTS `article_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post_comment` (
  `post_comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,评论id',
  `user_id` int(11) DEFAULT NULL COMMENT '评论人的userid',
  `post_comment_content` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '帖子评论内容',
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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

-- Dump completed on 2018-09-01 21:03:53
