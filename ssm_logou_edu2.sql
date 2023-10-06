/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.7.28-log : Database - ssm_lagou_edu2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_lagou_edu2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ssm_lagou_edu2`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `money` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `account` */

insert  into `account`(`id`,`name`,`money`) values (1,'张三',1000),(2,'李四',1000);

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_name` varchar(255) DEFAULT NULL COMMENT '课程名',
  `brief` varchar(255) DEFAULT '' COMMENT '课程一句话简介',
  `price` double(10,2) DEFAULT NULL COMMENT '原价',
  `price_tag` varchar(255) DEFAULT '' COMMENT '原价标签',
  `discounts` double(10,2) DEFAULT NULL COMMENT '优惠价',
  `discounts_tag` varchar(255) DEFAULT NULL COMMENT '优惠标签',
  `course_description_mark_down` varchar(1000) DEFAULT NULL COMMENT '描述markdown',
  `course_description` varchar(1000) DEFAULT NULL COMMENT '课程描述',
  `course_img_url` varchar(255) DEFAULT NULL COMMENT '课程分享图片url',
  `is_new` tinyint(1) DEFAULT NULL COMMENT '是否新品',
  `is_new_des` varchar(255) DEFAULT NULL COMMENT '广告语',
  `last_operator_id` int(11) DEFAULT NULL COMMENT '最后操作者',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `total_duration` int(11) DEFAULT NULL COMMENT '总时长(分钟)',
  `course_list_img` varchar(255) DEFAULT NULL COMMENT '课程列表展示图片',
  `status` int(2) DEFAULT '0' COMMENT '课程状态，0-草稿，1-上架',
  `sort_num` int(11) DEFAULT NULL COMMENT '课程排序，用于后台保存草稿时用到',
  `preview_first_field` varchar(255) DEFAULT NULL COMMENT '课程预览第一个字段',
  `preview_second_field` varchar(255) DEFAULT NULL COMMENT '课程预览第二个字段',
  `sales` int(11) DEFAULT '0' COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`id`,`course_name`,`brief`,`price`,`price_tag`,`discounts`,`discounts_tag`,`course_description_mark_down`,`course_description`,`course_img_url`,`is_new`,`is_new_des`,`last_operator_id`,`is_del`,`total_duration`,`course_list_img`,`status`,`sort_num`,`preview_first_field`,`preview_second_field`,`sales`) values (31,'王伯','1',25.00,'80',5.00,'201','50','123','0',10,'50',NULL,0,NULL,'浇水',1,NULL,NULL,NULL,0);

/*Table structure for table `course_lesson` */

DROP TABLE IF EXISTS `course_lesson`;

CREATE TABLE `course_lesson` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `section_id` int(11) NOT NULL DEFAULT '0' COMMENT '章节id',
  `theme` varchar(255) NOT NULL COMMENT '课时主题',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '课时时长(分钟)',
  `is_free` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否免费',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `order_num` int(11) DEFAULT NULL COMMENT '排序字段',
  `status` int(2) DEFAULT '0' COMMENT '课时状态,0-隐藏，1-未发布，2-已发布',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `course_id_index` (`course_id`,`section_id`) USING BTREE,
  KEY `idx_sectionId_orderNum` (`section_id`,`order_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='课程节内容';

/*Data for the table `course_lesson` */

insert  into `course_lesson`(`id`,`course_id`,`section_id`,`theme`,`duration`,`is_free`,`create_time`,`update_time`,`is_del`,`order_num`,`status`) values (8,7,7,'从小白到文案高手',0,1,'2020-07-10 10:35:30','2020-07-27 14:26:47',0,1,2),(9,7,7,'手把手教你写出爆款文案',0,0,'2020-07-10 10:35:53','2020-07-27 14:26:47',0,0,2),(10,7,8,'重点内容',0,0,'2020-07-10 10:36:09','2020-07-27 14:26:52',0,1,2),(11,7,8,'内容总结',0,0,'2020-07-10 10:36:21','2020-07-27 14:26:52',0,0,2),(12,8,9,'开篇词 | 解析 Vue.js 源码，提升编码能力',0,1,'2020-07-10 11:21:49','2020-07-22 12:10:49',0,0,2),(13,8,9,'导读 | 一文看懂 Vue.js 3.0 的优化',0,0,'2020-07-10 11:22:13','2020-07-22 12:10:49',0,1,2),(14,9,10,'11111',0,0,'2020-07-10 11:30:47','2020-07-13 15:54:52',0,0,2),(15,10,11,'撒短发',0,1,'2020-07-17 12:33:20','2020-07-17 12:35:23',0,22,2),(16,7,7,'文案高手养成',15,0,'2020-08-05 11:52:24','2020-08-05 11:52:24',0,2,0),(17,20,16,'第一讲 什么是Java',15,0,'2020-08-05 13:45:01','2020-08-05 13:45:01',0,2,0),(18,20,16,'第二讲 Java环境安装',15,0,'2020-08-05 13:45:33','2020-08-05 13:45:33',0,2,0),(19,20,16,'第三讲 HelloWord',15,0,'2020-08-05 13:45:51','2020-08-05 13:45:51',0,2,0),(20,20,17,'第一讲 Java中的变量',15,0,'2020-08-05 13:46:41','2020-08-05 13:46:41',0,2,0),(21,20,17,'第二讲 Java中的数据类型',15,0,'2020-08-05 13:47:06','2020-08-05 13:47:48',0,3,0),(22,27,19,'第一讲 我是琦玉01',2,0,'2020-08-13 15:11:27','2020-08-14 10:33:37',0,1,0),(23,27,19,'第二讲 琦玉是我',10,1,'2020-08-13 15:12:41','2020-08-13 15:12:41',0,2,0),(24,27,20,'第一讲 琦玉打怪兽一打二',18,1,'2020-08-13 15:13:12','2020-08-13 15:16:58',0,2,0),(25,27,20,'第二讲 琦玉打boss',10,1,'2020-08-13 15:13:33','2020-08-13 15:13:33',0,2,0);

/*Table structure for table `course_media` */

DROP TABLE IF EXISTS `course_media`;

CREATE TABLE `course_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程媒体主键ID',
  `course_id` int(11) DEFAULT NULL COMMENT '课程Id',
  `section_id` int(11) DEFAULT NULL COMMENT '章ID',
  `lesson_id` int(11) DEFAULT NULL COMMENT '课时ID',
  `cover_image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面图URL',
  `duration` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '时长（06:02）',
  `file_edk` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '媒体资源文件对应的EDK',
  `file_size` double(10,2) DEFAULT NULL COMMENT '文件大小MB',
  `file_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `file_dk` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '媒体资源文件对应的DK',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除，0未删除，1删除',
  `duration_num` int(11) DEFAULT NULL COMMENT '时长，秒数（主要用于音频在H5控件中使用）',
  `file_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '媒体资源文件ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_lessonid_channel_mediatype_idx` (`lesson_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `course_media` */

insert  into `course_media`(`id`,`course_id`,`section_id`,`lesson_id`,`cover_image_url`,`duration`,`file_edk`,`file_size`,`file_name`,`file_dk`,`create_time`,`update_time`,`is_del`,`duration_num`,`file_id`) values (5,7,7,8,'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/7FDABE200A424897A7ED5CE05764BB4C-6-2.png?Expires=1594363749&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=dqBQJCvfJY1wDCBgCGnI5cPInww%3D','00:11','YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlRjdaVUlmYTUwYWkwR3pwK1YzZENnUjExMnI1VkxiVFhBQUFBQUFBQUFBQ3FJN3pnZnFQUndad24rT2djTmM4MkxXb3ZXcDNNNkk0RENXeW9NRDVrZFNucHFiaUxRNm4r',1.90,'屏幕录制2020-07-10 13.48.08.mov','JPagaxcX6Ihpn5nu+dLi0Q==','2020-07-10 11:14:51','2020-07-10 13:49:14',0,11,'4f0dfb878a4d4d4881428b950396228a'),(6,7,8,10,'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/DBA8C56E2EA44F6382DCF5B7AD5763E6-6-2.png?Expires=1594356125&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=s5jKXcyQzw%2BjJKah75oBobYEy3g%3D','00:08','YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlNDlJL3pGM0dvS1IzSFhxMkFzNnYwcnhBelB6bUU3NENBQUFBQUFBQUFBQkxYTzQ4Q2JyK05XTHRoKzZiWmpoZG55azJ5NFVYUWtIRUhWb1BuQ3FZd2FPTVhPM2d6UDJ4',0.64,'测试视频课程.mp4','T3q/VVunsKwx7aNeRtaLGg==','2020-07-10 11:17:38','2020-07-10 11:42:10',0,8,'8dbf98ac948a4b389f99f17034c998cd'),(7,8,9,12,'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/07ED3325C001418AA46A95F88B1DA6C8-6-2.png?Expires=1594969610&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=biyZXbn1V2gY4GxmPiXKBME3E7I%3D','00:05','YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlaWxjVHdDaW5NSDJGTWdqZnYxWFg1YWZ6OUJXc0cvS3FBQUFBQUFBQUFBQzVwV2NTQUh4NjhiaU1YZ1drYlFZQnlVKyt0YkdTRzdlVXJmRFVOZHRESWM3T3ZSdEwwM1hN',11.37,'test.mov','BRRHQV/DivcEwf0Zosn9dA==','2020-07-10 11:40:29','2020-07-17 14:06:55',0,5,'a029c496959a457e92eb9e4f480e0018'),(8,7,8,11,'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/8D2E8BB920F94ECAB32CCAA73222DF32-6-2.png?Expires=1594625842&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=H2rqXRF0a%2FjY1dnrVtACXinwBRI%3D','00:08','YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlQnBqQnBlU042WEd4UWx2eVEwV1hZS2JQdE5PS1dBYVpBQUFBQUFBQUFBQ0ViRHkrd0U1WWVLRGhObFJGOFE5OGJMYlppRzNwdnVWc2xuUnpINnVhN3dkay9QMDlucXhR',0.64,'测试视频课程.mp4','MWGs74Qco6LYjlCXc7ymEg==','2020-07-10 11:43:10','2020-07-13 14:37:27',0,8,'bb7d23a9334c4b07abb1187a2c61ce1f'),(9,8,9,13,'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/1B8791F4BC4B48B08A37C2B7B669FE52-6-2.png?Expires=1594356307&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=QISH8TpvWX%2F0G%2B%2F1rA0OJqTug3g%3D','00:08','YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlSHk2RWhDUURHejlyYzN1cnNNaE9ubG9jVUZlb2NTbFFBQUFBQUFBQUFBQjRRV0lGOHRvUGxIcCtINGhTdWxBR3JWV1ZmR3ZDT3R2YnVJcDlkS0NjSWxoL1EwMmpHcVdK',0.64,'测试视频课程.mp4','B0CqECTjmT1JeCVndYvXtg==','2020-07-10 11:45:13','2020-07-10 11:45:13',0,8,'717bc01edbb24283937d7fa903f06d60'),(10,9,10,14,'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/EEB28294E90F4D85A2609A2A978A9264-6-2.png?Expires=1594356669&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=wR9JpRJp6UMBs%2B55QSWSFYBM%2FCs%3D','00:08','YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlajlJcXU0RGYyc0V2blZ5c0pXMGVDaUdNT0ZVZlNYODVBQUFBQUFBQUFBQjFKWCtoZGU4WDZPTXM3RnZmanFXTWxzVVh0Uy80OEt6U2ttY1h1TDJURlJ6dlJ3V2ZpcjFT',0.64,'测试视频课程.mp4','6I5a1R2dG/WrUCQotk6Uxw==','2020-07-10 11:51:14','2020-07-10 11:51:14',0,8,'451d48ec785646b8ab1aa97ae3741100');

/*Table structure for table `course_section` */

DROP TABLE IF EXISTS `course_section`;

CREATE TABLE `course_section` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  `section_name` varchar(255) NOT NULL DEFAULT '' COMMENT '章节名',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '章节描述',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_de` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `order_num` int(11) DEFAULT NULL COMMENT '排序字段',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0:隐藏；1：待更新；2：已发布',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `course_id_index` (`course_id`) USING BTREE,
  KEY `idx_course_id` (`course_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `course_section` */

insert  into `course_section`(`id`,`course_id`,`section_name`,`description`,`create_time`,`update_time`,`is_de`,`order_num`,`status`) values (7,7,'开篇词 | 从小白到文案高手，手把手教你写出爆款文案','你好，我是兔妈！第一次见面，我用几句话简单介绍下自己','2020-07-10 10:34:47','2020-08-05 11:10:21',0,1,1),(8,7,'重点内容总结','重点内容总结','2020-07-10 10:35:05','2020-07-10 17:08:57',0,2,2),(9,8,'开篇词','Vue的简单介绍','2020-07-10 11:21:35','2020-07-10 11:41:05',0,1,2),(10,9,'1111','1111','2020-07-10 11:30:38','2020-07-10 11:51:46',0,1111,2),(11,10,'第一章','第一章','2020-07-17 12:33:00','2020-07-17 12:33:07',0,12,2),(12,0,'微服务架构','跟着药水一起学习如何使用微服务','2020-08-05 10:26:32','2020-08-05 10:26:32',0,0,0),(13,8,'Vue路由','单页面应用导航','2020-08-05 10:28:40','2020-08-05 10:46:13',0,0,0),(14,8,'VueCLI脚手架','快速搭建Vue项目','2020-08-05 10:30:06','2020-08-05 10:30:06',0,2,0),(15,8,'VueCLI脚手架','快速搭建Vue项目','2020-08-05 10:47:08','2020-08-05 10:47:08',0,2,0),(16,20,'Java入门','Java入门','2020-08-05 13:42:56','2020-08-05 13:42:56',0,2,0),(17,20,'Java基础1','Java基础1','2020-08-05 13:43:53','2020-08-05 13:43:53',0,2,0),(18,20,'Java基础2','Java基础2','2020-08-05 13:43:57','2020-08-05 13:43:57',0,2,0),(19,27,'第一集','琦玉买菜回家','2020-08-13 14:14:08','2020-08-13 15:01:46',0,1,1),(20,27,'第二集','琦玉打怪02','2020-08-13 14:15:50','2020-08-13 14:53:44',0,2,1),(21,27,'第三集','琦玉玩牌','2020-08-13 14:22:17','2020-08-13 14:31:15',0,3,0);

/*Table structure for table `growthsituation` */

DROP TABLE IF EXISTS `growthsituation`;

CREATE TABLE `growthsituation` (
  `pname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pno` int(11) DEFAULT NULL,
  `data` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Growth situation` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `area` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `planting area` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `growthsituation` */

insert  into `growthsituation`(`pname`,`pno`,`data`,`Growth situation`,`area`,`planting area`) values ('何首乌',1,'2018.2.6','正常','河东一号大棚','10亩'),('何首乌',2,'2022.5.6','蔫死','河西二号大棚','5亩'),('田七',3,'2020.3.2','蚜虫啃食','山北一号大棚','10亩'),('藏红花',5,'2021.3.4','正常','山南一号大棚','20亩'),('藏红花',4,'2020.2.6','枯叶病','河西一号大棚','24亩'),('何首乌',1,'2018.2.6','正常','河东一号大棚','10亩'),('何首乌',2,'2022.5.6','蔫死','河西二号大棚','5亩'),('田七',3,'2020.3.2','蚜虫啃食','山北一号大棚','10亩'),('藏红花',5,'2021.3.4','正常','山南一号大棚','20亩'),('藏红花',4,'2020.2.6','枯叶病','河西一号大棚','24亩');

/*Table structure for table `landmanagement` */

DROP TABLE IF EXISTS `landmanagement`;

CREATE TABLE `landmanagement` (
  `id` varchar(100) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `host` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `Land_no` int(10) DEFAULT NULL,
  `temperature` int(10) DEFAULT NULL,
  `humidity` int(10) DEFAULT NULL,
  `ph` int(10) DEFAULT NULL,
  `nitrogenContent` int(10) DEFAULT NULL,
  `phosphorus_content` int(10) DEFAULT NULL,
  `potassium_content` int(10) DEFAULT NULL,
  `vacant_area` varchar(10) DEFAULT NULL,
  `land_area` varchar(10) DEFAULT NULL,
  `service_life` varchar(10) DEFAULT NULL,
  `operate` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `landmanagement` */

insert  into `landmanagement`(`id`,`name`,`host`,`Land_no`,`temperature`,`humidity`,`ph`,`nitrogenContent`,`phosphorus_content`,`potassium_content`,`vacant_area`,`land_area`,`service_life`,`operate`) values ('1','河东一号大棚','王伯',1,25,80,5,201,50,123,'0','10','50','浇水'),('2','河西一号大棚','王伯',2,21,52,6,213,52,153,'1','25','50','升温'),('3','山北一号大棚','王伯',3,29,49,7,253,23,159,'0','10','50','降温'),('4','山南一号大棚','王伯',4,23,95,8,203,53,143,'0','20','50','通风'),('5','河东二号大棚','王伯',5,24,52,6,169,26,125,'20','20','50','无'),('6','河西二号大棚','王伯',6,31,32,6,189,232,151,'5','10','50','无');

/*Table structure for table `medicinalprice` */

DROP TABLE IF EXISTS `medicinalprice`;

CREATE TABLE `medicinalprice` (
  `pname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pno` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `DryPrice` int(11) DEFAULT NULL,
  `WetPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `medicinalprice` */

insert  into `medicinalprice`(`pname`,`pno`,`age`,`DryPrice`,`WetPrice`) values ('田七',1,3,100,65),('田七',2,5,200,150),('藏红花',3,1,52,30),('何首乌',4,10,310,210);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(11) NOT NULL COMMENT '父菜单id',
  `href` varchar(200) DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(200) DEFAULT NULL COMMENT '菜单图标',
  `name` varchar(200) DEFAULT NULL COMMENT '菜单名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `order_num` int(11) DEFAULT NULL COMMENT '排序号',
  `shown` tinyint(2) DEFAULT '1' COMMENT '是否展示',
  `level` int(11) NOT NULL COMMENT '菜单层级，从0开始',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';

/*Data for the table `menu` */

insert  into `menu`(`id`,`parent_id`,`href`,`icon`,`name`,`description`,`order_num`,`shown`,`level`,`created_time`,`updated_time`,`created_by`,`updated_by`) values (1,-1,'','lock','权限管理','管理系统角色、菜单、资源',1,1,0,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(2,1,'Role','lock','角色列表','管理系统角色',1,1,1,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(3,1,'Menu','lock','菜单列表','管理系统菜单',2,1,1,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(4,1,'Resource','lock','资源列表','管理系统资源',3,1,1,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(5,-1,'Courses','film','土地管理','课程的新增、修改、查看、发布、上下架',2,1,0,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(6,-1,'Users','user','用户管理','用户的查询、禁用、启用',3,1,0,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(7,-1,'','setting','规划','',4,1,0,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(8,7,'Advertise','setting','种植计划','种植计划',1,1,1,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(9,7,'AdvertiseSpace','setting','药材生长','药材生长',2,1,1,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(10,1,'AllocMenu','setting','给角色分配菜单页面','给角色分配菜单页面路由',4,0,1,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(11,1,'AllocResource','setting','给角色分配资源页面','给角色分配资源页面路由',5,0,1,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(12,1,'AddMenu','setting','添加菜单页面','添加菜单页路由',6,0,1,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(13,1,'UpdateMenu','setting','更新菜单页面','更新菜单页路由',7,0,1,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(14,1,'ResourceCategory','setting','资源分类列表页面','资源分类列表页面路由',8,0,1,'2020-07-20 15:41:38','2020-07-20 15:41:38','system','system'),(22,1,'addOrder','lock','订单管理修改','订单系统管理修改',1,0,0,'2020-08-10 20:32:41','2020-08-10 20:32:41','system','system'),(25,-1,'User','icon','人员管理','管理员工',1,1,0,'2020-08-17 18:12:22','2020-08-17 18:12:22','system','system'),(26,25,'Guanli','set','管理客服人员','管理客服人员',0,1,1,'2020-08-17 18:17:13','2020-08-17 18:17:13','system','system');

/*Table structure for table `plantingscheme` */

DROP TABLE IF EXISTS `plantingscheme`;

CREATE TABLE `plantingscheme` (
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `land` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `plant` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `environment` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `time` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `area` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `investment` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `host` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `remarks` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plantingscheme` */

insert  into `plantingscheme`(`name`,`land`,`plant`,`environment`,`time`,`area`,`investment`,`host`,`remarks`) values ('田七第一季度种植','河东二号大棚','田七','干燥','三月初','20亩','5000元','王伯','田七为阴生植物，注意遮阳');

/*Table structure for table `promotion_ad` */

DROP TABLE IF EXISTS `promotion_ad`;

CREATE TABLE `promotion_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '广告名',
  `spaceId` int(11) DEFAULT NULL COMMENT '广告位id',
  `keyword` varchar(255) DEFAULT NULL COMMENT '精确搜索关键词',
  `htmlContent` varchar(11) DEFAULT NULL COMMENT '静态广告的内容',
  `text` varchar(255) DEFAULT NULL COMMENT '文字一',
  `link` varchar(255) DEFAULT NULL COMMENT '链接一',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0 下线,1 上线',
  `priority` int(4) unsigned DEFAULT '0' COMMENT '优先级',
  `img` varchar(255) DEFAULT NULL COMMENT '广告图片地址',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `promotion_ad_SEG` (`spaceId`,`startTime`,`endTime`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1094 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `promotion_ad` */

insert  into `promotion_ad`(`id`,`name`,`spaceId`,`keyword`,`htmlContent`,`text`,`link`,`startTime`,`endTime`,`createTime`,`updateTime`,`status`,`priority`,`img`) values (1093,'田七第一季度种植',160,'河东二号大棚','干燥','田七为阴声植物，注意遮阳','王伯','2020-08-20 11:42:20','2020-08-25 00:00:00','2020-08-20 11:42:50','2020-08-20 11:43:07',20,5000,'三月初');

/*Table structure for table `promotion_space` */

DROP TABLE IF EXISTS `promotion_space`;

CREATE TABLE `promotion_space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `spaceKey` varchar(255) DEFAULT NULL COMMENT '广告位key',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `isDel` int(2) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `promotion_space_key_isDel` (`spaceKey`,`isDel`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `promotion_space` */

insert  into `promotion_space`(`id`,`name`,`spaceKey`,`createTime`,`updateTime`,`isDel`) values (1,'首页顶部推荐位','666','2020-07-14 13:03:31','2020-07-17 13:13:21',0),(2,'首页侧边广告位','888','2020-07-14 13:03:31','2020-07-17 11:53:02',0),(3,'首页顶部轮播','999','2020-07-14 13:03:31','2020-07-17 13:13:03',0),(160,'首页中部轮播图','123','2020-07-14 13:03:31','2020-08-17 14:19:23',0),(161,'课程页面轮播图','456','2020-07-14 13:03:31','2020-08-17 14:19:47',0),(162,'广告名称','789','2020-07-14 13:03:31','2020-07-14 13:03:11',0),(163,'广告名称','78911111','2020-07-14 13:03:31','2020-07-14 13:03:11',0),(164,'广告名称','78911111','2020-07-14 13:03:31','2020-07-14 13:03:11',0),(165,'广告名称','78911111','2020-07-14 13:03:31','2020-07-14 13:03:11',0),(166,'广告名称','78911111','2020-07-14 13:03:31','2020-07-14 13:03:11',0),(167,'广告名称','78911111','2020-07-14 13:03:31','2020-07-14 13:03:11',0),(168,'广告名称111','33333','2020-07-14 13:03:31','2020-07-14 13:03:49',0),(169,'名称','abcd','2020-07-14 16:30:38','2020-07-14 16:31:31',0),(170,'冰淇淋套餐',NULL,'2020-07-14 17:39:19','2020-07-14 17:40:24',0),(171,'12111111',NULL,'2020-07-15 12:18:47','2020-07-15 12:19:06',0),(172,'首页底部页脚位置','a718dfbc-3d9b-40a0-be53-c57712b1a4e4','2020-08-17 13:56:41','2020-08-17 13:56:41',NULL),(173,'搜素页面顶部','f22e659c-2077-409d-a07b-c1f4aed58e52','2020-08-18 13:55:14','2020-08-18 13:55:14',NULL);

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `name` varchar(200) NOT NULL COMMENT '资源名称',
  `url` varchar(200) NOT NULL COMMENT '资源url',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `description` varchar(500) DEFAULT NULL COMMENT '简介',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

/*Data for the table `resource` */

insert  into `resource`(`id`,`name`,`url`,`category_id`,`description`,`created_time`,`updated_time`,`created_by`,`updated_by`) values (1,'获取所有角色','/boss/role/all',1,'获取所有角色','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(2,'给用户分配角色','/boss/role/allocateUserRoles',1,'给用户分配角色','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(3,'按条件查询角色','/boss/role/getRolePages',1,'按条件查询角色','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(4,'列出所有角色并标记用户是否拥有','/boss/role/getRolesWithUserPermission',1,'列出所有角色并标记用户是否拥有','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(5,'保存或者更新角色','/boss/role/saveOrUpdate',1,'保存或者更新角色','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(6,'查询用户角色','/boss/role/user/{userId}',1,'查询用户角色','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(7,'获取角色','/boss/role/{id}',1,'获取角色','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(8,'删除角色','/boss/role/{id}',1,'删除角色','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(9,'给角色分配菜单','/boss/menu/allocateRoleMenus',2,'给角色分配菜单','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(10,'获取所有菜单','/boss/menu/getAll',2,'获取所有菜单','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(11,'获取编辑菜单页面信息','/boss/menu/getEditMenuInfo',2,'获取编辑菜单页面信息','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(12,'获取所有菜单并按层级展示','/boss/menu/getMenuNodeList',2,'获取所有菜单并按层级展示','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(13,'按条件分页查询菜单','/boss/menu/getMenuPages',2,'按条件分页查询菜单','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(14,'获取角色拥有的菜单列表','/boss/menu/getRoleMenus',2,'获取角色拥有的菜单列表','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(15,'保存或新增菜单','/boss/menu/saveOrUpdate',2,'保存或新增菜单','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(16,'是否显示开关','/boss/menu/switchShown',2,'是否显示开关','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(17,'根据ID查询菜单','/boss/menu/{id}',2,'根据ID查询菜单','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(18,'删除菜单','/boss/menu/{id}',2,'删除菜单','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(19,'给角色分配资源','/boss/resource/allocateRoleResources',3,'给角色分配资源','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(20,'查询资源分类列表','/boss/resource/category/getAll',3,'查询资源分类列表','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(21,'保存或更新资源分类','/boss/resource/category/saveOrderUpdate',3,'保存或更新资源分类','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(22,'删除资源分类','/boss/resource/category/{id}',3,'删除资源分类','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(23,'获取所有资源','/boss/resource/getAll',3,'获取所有资源','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(24,'按条件分页查询资源','/boss/resource/getResourcePages',3,'按条件分页查询资源','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(25,'获取角色拥有的资源列表','/boss/resource/getRoleResources',3,'获取角色拥有的资源列表','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(26,'保存或者更新资源','/boss/resource/saveOrUpdate',3,'保存或者更新资源','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(27,'获取资源','/boss/resource/{id}',3,'获取资源','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(28,'删除资源','/boss/resource/{id}',3,'删除资源','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(29,'封禁用户','/boss/user/forbidUser',5,'封禁用户','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(30,'分页查询用户信息','/boss/user/getUserPages',5,'分页查询用户信息','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(31,'获取用户菜单和资源权限列表','/boss/permission/getUserPermissions',5,'获取用户菜单和资源权限列表','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(32,'查询用户角色','/boss/role/user/{userId}',1,'查询用户角色','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(33,'课程上下架','/boss/course/changeState',4,'课程上下架','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(34,'新建课程页面路由','/#/courses/new',4,'新建课程页面路由','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(35,'通过课程Id获取课程信息','/boss/course/getCourseById',4,'通过课程Id获取课程信息','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(36,'分页查询课程信息','/boss/course/getQueryCourses',4,'分页查询课程信息','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(37,'保存或者更新课程信息','/boss/course/saveOrUpdateCourse',4,'保存或者更新课程信息','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(38,'上传图片','/boss/course/upload',4,'上传图片','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(39,'保存活动商品','/boss/activityCourse/save',4,'保存活动商品','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(40,'更新活动商品状态','/boss/activityCourse/updateStatus',4,'更新活动商品状态','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(41,'获取章节','/boss/course/section/getBySectionId',4,'获取章节','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(42,'获取章节和课时','/boss/course/section/getSectionAndLesson',4,'获取章节和课时','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(43,'保存或更新章节','/boss/course/section/saveOrUpdateSection',4,'保存或更新章节','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(44,'获取课时内容','/boss/course/lesson/getById',4,'获取课时内容','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(45,'保存或更新课时','/boss/course/lesson/saveOrUpdate',4,'保存或更新课时','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(46,'获取阿里云图片上传凭证','/boss/course/upload/aliyunImagUploadAddressAdnAuth.json',6,'获取阿里云图片上传凭证','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(47,'阿里云转码请求','/boss/course/upload/aliyunTransCode.json',6,'阿里云转码请求','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(48,'阿里云转码进度','/boss/course/upload/aliyunTransCodePercent.json',6,'阿里云转码进度','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(49,'获取阿里云视频上传凭证','/boss/course/upload/aliyunVideoUploadAddressAdnAuth.json',6,'获取阿里云视频上传凭证','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(50,'获取媒体信息','/boss/course/upload/getMediaByLessonId.json',6,'获取媒体信息','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system'),(51,'刷新阿里云视频上传凭证','/boss/course/upload/refreshAliyunVideoUploadAddressAdnAuth.json',6,'刷新阿里云视频上传凭证','2020-07-20 15:41:57','2020-07-20 15:41:57','system','system');

/*Table structure for table `resource_category` */

DROP TABLE IF EXISTS `resource_category`;

CREATE TABLE `resource_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='资源分类表';

/*Data for the table `resource_category` */

insert  into `resource_category`(`id`,`name`,`sort`,`created_time`,`updated_time`,`created_by`,`updated_by`) values (1,'角色管理',1,'2020-07-20 15:41:46','2020-07-20 15:41:46','system','system'),(2,'菜单管理',2,'2020-07-20 15:41:46','2020-07-20 15:41:46','system','system'),(3,'资源管理',3,'2020-07-20 15:41:46','2020-07-20 15:41:46','system','system'),(4,'课程管理',4,'2020-07-20 15:41:46','2020-07-20 15:41:46','system','system'),(5,'用户管理',5,'2020-07-20 15:41:46','2020-07-20 15:41:46','system','system'),(6,'阿里上传',6,'2020-07-20 15:41:46','2020-07-20 15:41:46','system','system'),(7,'广告管理',0,'2020-07-20 07:57:10','2020-07-20 07:57:10','15510792994','15510792994'),(9,'废品管理',7,'2020-08-18 13:38:23','2020-08-18 13:38:23','system','system');

/*Table structure for table `role_menu_relation` */

DROP TABLE IF EXISTS `role_menu_relation`;

CREATE TABLE `role_menu_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4126 DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关系表';

/*Data for the table `role_menu_relation` */

insert  into `role_menu_relation`(`id`,`menu_id`,`role_id`,`created_time`,`updated_time`,`created_by`,`updated_by`) values (4023,1,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4024,2,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4025,3,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4026,4,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4027,10,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4028,11,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4029,12,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4030,13,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4031,14,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4032,22,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4033,5,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4034,6,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4035,7,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4036,8,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4037,9,85,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(4038,25,85,'2022-07-13 22:58:11','2022-07-13 22:58:11','system','system'),(4039,26,85,'2022-07-13 22:58:11','2022-07-13 22:58:11','system','system'),(4051,1,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4052,2,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4053,3,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4054,4,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4055,10,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4056,11,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4057,12,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4058,13,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4059,14,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4060,22,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4061,5,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4062,6,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4063,7,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4064,8,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4065,9,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4066,25,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4067,26,1,'2022-07-13 23:05:25','2022-07-13 23:05:25','system','system'),(4068,7,86,'2022-07-14 08:42:06','2022-07-14 08:42:06','system','system'),(4069,8,86,'2022-07-14 08:42:06','2022-07-14 08:42:06','system','system'),(4070,9,86,'2022-07-14 08:42:06','2022-07-14 08:42:06','system','system'),(4072,1,87,'2022-07-14 08:43:06','2022-07-14 08:43:06','system','system'),(4073,2,87,'2022-07-14 08:43:06','2022-07-14 08:43:06','system','system'),(4074,3,87,'2022-07-14 08:43:06','2022-07-14 08:43:06','system','system'),(4075,4,87,'2022-07-14 08:43:06','2022-07-14 08:43:06','system','system'),(4076,10,87,'2022-07-14 08:43:06','2022-07-14 08:43:06','system','system'),(4077,11,87,'2022-07-14 08:43:06','2022-07-14 08:43:06','system','system'),(4078,12,87,'2022-07-14 08:43:06','2022-07-14 08:43:06','system','system'),(4079,13,87,'2022-07-14 08:43:06','2022-07-14 08:43:06','system','system'),(4080,14,87,'2022-07-14 08:43:06','2022-07-14 08:43:06','system','system'),(4081,22,87,'2022-07-14 08:43:06','2022-07-14 08:43:06','system','system'),(4082,5,87,'2022-07-14 08:43:06','2022-07-14 08:43:06','system','system'),(4109,1,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4110,2,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4111,3,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4112,4,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4113,10,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4114,11,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4115,12,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4116,13,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4117,14,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4118,22,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4119,5,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4120,6,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4121,7,88,'2022-07-14 08:51:56','2022-07-14 08:51:56','system','system'),(4122,8,88,'2022-07-14 08:51:57','2022-07-14 08:51:57','system','system'),(4123,9,88,'2022-07-14 08:51:57','2022-07-14 08:51:57','system','system'),(4124,25,88,'2022-07-14 08:51:57','2022-07-14 08:51:57','system','system'),(4125,26,88,'2022-07-14 08:51:57','2022-07-14 08:51:57','system','system');

/*Table structure for table `role_resource_relation` */

DROP TABLE IF EXISTS `role_resource_relation`;

CREATE TABLE `role_resource_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系id',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COMMENT='角色和资源关系表';

/*Data for the table `role_resource_relation` */

insert  into `role_resource_relation`(`id`,`resource_id`,`role_id`,`created_time`,`updated_time`,`created_by`,`updated_by`) values (1,1,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(2,2,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(3,3,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(4,4,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(5,5,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(6,6,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(7,7,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(8,8,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(9,9,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(10,10,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(11,11,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(12,12,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(13,13,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(14,14,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(15,15,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(16,16,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(17,17,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(18,18,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(19,19,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(20,20,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(21,21,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(22,22,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(23,23,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(24,24,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(25,25,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(26,26,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(27,27,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(28,28,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(29,29,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(30,30,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(31,31,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(32,32,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(33,33,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(34,34,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(35,35,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(36,36,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(37,37,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(38,38,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(39,39,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(40,40,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(41,41,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(42,42,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(43,43,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(44,44,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(45,45,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(46,46,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(47,47,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(48,48,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(49,49,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(50,50,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(51,51,1,'2020-07-20 15:42:11','2020-07-20 15:42:11','system','system'),(52,1,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(53,2,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(54,3,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(55,4,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(56,5,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(57,6,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(58,7,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(59,8,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(60,9,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(61,10,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(62,11,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(63,12,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(64,13,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(65,14,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(66,15,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(67,16,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(68,17,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(69,18,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(70,19,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(71,20,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(72,21,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(73,22,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(74,23,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(75,24,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(76,25,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(77,26,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(78,27,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(79,28,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(80,29,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(81,30,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(82,31,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(83,32,2,'2020-07-20 07:50:39','2020-07-20 07:50:39','15510792994','15510792994'),(84,33,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(85,34,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(86,35,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(87,36,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(88,37,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(89,38,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(90,39,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(91,40,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(92,41,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(93,42,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(94,43,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(95,44,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(96,45,3,'2020-07-20 07:55:32','2020-07-20 07:55:32','15510792994','15510792994'),(97,32,4,'2020-07-22 04:23:25','2020-07-22 04:23:25','15321919577','15321919577'),(98,1,4,'2020-07-22 04:23:25','2020-07-22 04:23:25','15321919577','15321919577'),(99,2,4,'2020-07-22 04:23:25','2020-07-22 04:23:25','15321919577','15321919577'),(100,3,4,'2020-07-22 04:23:25','2020-07-22 04:23:25','15321919577','15321919577'),(101,4,4,'2020-07-22 04:23:25','2020-07-22 04:23:25','15321919577','15321919577'),(102,5,4,'2020-07-22 04:23:25','2020-07-22 04:23:25','15321919577','15321919577'),(103,6,4,'2020-07-22 04:23:25','2020-07-22 04:23:25','15321919577','15321919577'),(104,7,4,'2020-07-22 04:23:25','2020-07-22 04:23:25','15321919577','15321919577');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `code` varchar(100) NOT NULL COMMENT '角色code',
  `name` varchar(200) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(500) DEFAULT NULL COMMENT '简介',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

/*Data for the table `roles` */

insert  into `roles`(`id`,`code`,`name`,`description`,`created_time`,`updated_time`,`created_by`,`updated_by`) values (1,'ADMIN3','土地管理人','后台管理员，初始拥有权限管理功能','2020-07-20 15:41:29','2020-07-20 15:41:29','system','system'),(85,'000','所有权限',NULL,'2022-07-13 22:58:10','2022-07-13 22:58:10','system','system'),(86,'007','土地规划',NULL,'2022-07-14 08:42:05','2022-07-14 08:42:05','system','system'),(87,'008','土地管理者',NULL,'2022-07-14 08:42:58','2022-07-14 08:42:58','system','system'),(88,'0019','土地规划师',NULL,'2022-07-14 08:51:01','2022-07-14 08:51:01','system','system');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_id` int(11) DEFAULT '0' COMMENT '课程ID',
  `teacher_name` varchar(255) DEFAULT NULL COMMENT '讲师姓名',
  `position` varchar(100) DEFAULT '' COMMENT '职务',
  `description` text COMMENT '讲师介绍',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_courseId` (`course_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`course_id`,`teacher_name`,`position`,`description`,`create_time`,`update_time`,`is_del`) values (158,7,'兔妈','有赞高级讲师','多家平台的头部商家文案顾问，有赞高级讲师，具有 8 年文案营销实战经验','2020-07-10 10:33:56','2020-07-10 10:33:56',0),(159,8,'那朋','前京东资深','掌握框架原理，精通经典应用场景','2020-07-10 11:20:43','2020-07-17 14:05:25',0),(160,9,'秒杀11','秒杀','秒杀1','2020-07-10 11:24:31','2020-07-10 11:24:31',0),(161,10,'React 入门','React 入门','React 入门','2020-07-17 12:32:43','2020-07-17 12:32:43',0),(162,15,'维尼','高级讲师','多年企业实战经验','2020-08-04 15:15:06','2020-08-04 15:15:06',0),(163,16,'药水哥','超级讲师','多年药水企业实战经验','2020-08-04 15:23:17','2020-08-04 16:54:00',0),(164,17,'药水哥','超级讲师','多年药水企业实战经验','2020-08-04 15:29:26','2020-08-04 16:53:27',0),(165,18,'药水哥','超级讲师','多年药水企业实战经验','2020-08-04 16:54:45','2020-08-04 16:54:45',0),(166,19,'药水哥aaa','超级讲师aa','多年药水企业实战经验aaa','2020-08-04 16:56:41','2020-08-04 16:56:41',0),(167,20,'药水哥aaa','超级讲师aa','多年药水企业实战经验aaa','2020-08-05 13:42:08','2020-08-05 13:42:08',0),(168,21,'一拳超人一拳超人','一拳超人','一拳超人','2020-08-12 17:34:26','2020-08-12 17:34:26',0),(169,22,'岸本齐史','高级讲师','高级讲师','2020-08-12 17:44:39','2020-08-12 17:44:39',0),(170,23,'卡卡西','高级讲师','木叶 卡卡西','2020-08-12 18:08:57','2020-08-12 18:08:57',0),(171,24,'药水哥','超级讲师','多年药水企业实战经验','2020-08-12 18:12:44','2020-08-12 18:12:44',0),(172,25,'一拳超人一拳超人','一拳超人','一拳超人','2020-08-12 18:13:57','2020-08-12 18:13:57',0),(173,26,'岸本齐史','高级讲师','高级讲师','2020-08-12 18:15:16','2020-08-12 18:15:16',0),(174,27,'琦玉2','高级讲师','一拳超人','2020-08-12 18:19:16','2020-08-12 18:20:00',0),(175,28,'大是大非三11111','大是大非三1111','大是大非三111','2020-08-12 18:53:42','2020-08-12 18:55:41',0),(176,29,'好大哥','高级讲师','溜达秘籍溜达秘籍','2020-08-14 18:08:24','2020-08-14 18:08:24',0),(177,30,'燕寄雨','掌门','天下刀宗天下刀宗天下刀宗','2020-08-19 11:53:13','2020-08-19 11:54:02',0);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '用户昵称',
  `portrait` varchar(255) DEFAULT NULL COMMENT '用户头像地址',
  `phone` varchar(255) NOT NULL COMMENT '注册手机',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码（可以为空，支持只用验证码注册、登录）',
  `reg_ip` varchar(255) DEFAULT NULL COMMENT '注册ip',
  `account_non_expired` bit(1) DEFAULT b'1' COMMENT '是否有效用户',
  `credentials_non_expired` bit(1) DEFAULT b'1' COMMENT '账号是否未过期',
  `account_non_locked` bit(1) DEFAULT b'1' COMMENT '是否未锁定',
  `status` varchar(20) NOT NULL DEFAULT 'ENABLE' COMMENT '用户状态：ENABLE能登录，DISABLE不能登录',
  `is_del` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_phone_is_del` (`phone`,`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100030156 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`portrait`,`phone`,`password`,`reg_ip`,`account_non_expired`,`credentials_non_expired`,`account_non_locked`,`status`,`is_del`,`create_time`,`update_time`) values (100030131,'傅强',NULL,'184770496596','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-05 08:35:10','2022-06-05 08:35:10'),(100030132,'戴明',NULL,'197968389210','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-05 08:35:11','2022-06-05 08:35:11'),(100030133,'汤秀兰',NULL,'211166281824','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-05 08:35:12','2022-06-05 08:35:12'),(100030134,'毛静',NULL,'224364174438','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-05 08:35:13','2022-06-05 08:35:13'),(100030135,'张洋',NULL,'237562067052','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-05 08:35:14','2022-06-05 08:35:14'),(100030136,'许涛',NULL,'250759959666','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-05 08:35:15','2022-06-05 08:35:15'),(100030137,'易敏',NULL,'263957852280','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-05 08:35:16','2022-06-05 08:35:16'),(100030138,'郭秀英',NULL,'277155744894','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-05 08:35:17','2022-06-05 08:35:17'),(100030141,'汪秀兰',NULL,'316749422736','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-05 08:35:20','2022-06-05 08:35:20'),(100030142,'顾超',NULL,'329947315350','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-05 08:35:21','2022-06-05 08:35:21'),(100030146,'胡勇',NULL,'343145207964','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-05 14:29:22','2022-06-05 14:29:22'),(100030152,'只要课程的学生',NULL,'8888','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-06 07:46:14','2022-06-06 07:46:14'),(100030153,'学生-001',NULL,'001','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-06 10:00:01','2022-06-06 10:00:01'),(100030154,'学生-001001',NULL,'001001','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-09 09:23:11','2022-06-09 09:23:11'),(100030155,'学生007',NULL,'007007','f00485441dfb815c75a13f3c3389c0b9',NULL,'','','','ENABLE','\0','2022-06-10 09:35:07','2022-06-10 09:35:07');

/*Table structure for table `user_phone_verification_code` */

DROP TABLE IF EXISTS `user_phone_verification_code`;

CREATE TABLE `user_phone_verification_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) DEFAULT '' COMMENT '手机号',
  `verification_code` varchar(15) DEFAULT '' COMMENT '验证码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `isCheck` bit(1) DEFAULT b'0' COMMENT '验证码是否校验过',
  `check_times` int(2) DEFAULT '0' COMMENT '校验次数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `l_phone_verification_code_ind_01` (`phone`,`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33317 DEFAULT CHARSET=utf8;

/*Data for the table `user_phone_verification_code` */

insert  into `user_phone_verification_code`(`id`,`phone`,`verification_code`,`create_time`,`isCheck`,`check_times`) values (33305,'18201288775','111111','2020-07-03 23:59:31','',80),(33306,'008615321919577','472148','2020-07-17 16:41:21','\0',0),(33307,'008615321919577','254709','2020-07-17 16:53:02','\0',0),(33308,'0086','149696','2020-07-17 17:33:19','\0',0),(33309,'0086','164595','2020-07-17 18:00:48','\0',0),(33310,'008615321919577','994241','2020-07-17 18:01:27','\0',0),(33311,'008615321919577','775431','2020-07-17 18:04:31','\0',0),(33312,'008615321919577','610538','2020-07-17 18:06:45','\0',0),(33313,'008615321919577','317040','2020-07-17 18:17:05','\0',0),(33314,'008618201288770','956444','2020-07-23 16:18:56','',2),(33315,'18201288771','029570','2020-07-23 18:01:20','',2),(33316,'18201288771','058365','2020-07-23 19:11:35','',2);

/*Table structure for table `user_role_relation` */

DROP TABLE IF EXISTS `user_role_relation`;

CREATE TABLE `user_role_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关系表';

/*Data for the table `user_role_relation` */

insert  into `user_role_relation`(`id`,`user_id`,`role_id`,`created_time`,`updated_time`,`created_by`,`updated_by`) values (13,100030058,1,'2022-05-31 21:55:52','2022-05-31 21:55:52','system','system'),(73,100030119,85,'2022-06-05 08:35:01','2022-06-05 08:35:01','system','system'),(85,100030131,88,'2022-06-05 08:35:10','2022-06-05 08:35:10','system','system'),(86,100030132,1,'2022-06-05 08:35:11','2022-06-05 08:35:11','system','system'),(87,100030133,1,'2022-06-05 08:35:12','2022-06-05 08:35:12','system','system'),(88,100030134,1,'2022-06-05 08:35:13','2022-06-05 08:35:13','system','system'),(89,100030135,1,'2022-06-05 08:35:14','2022-06-05 08:35:14','system','system'),(90,100030136,1,'2022-06-05 08:35:15','2022-06-05 08:35:15','system','system'),(91,100030137,1,'2022-06-05 08:35:16','2022-06-05 08:35:16','system','system'),(92,100030138,1,'2022-06-05 08:35:17','2022-06-05 08:35:17','system','system'),(95,100030141,1,'2022-06-05 08:35:20','2022-06-05 08:35:20','system','system'),(96,100030142,1,'2022-06-05 08:35:21','2022-06-05 08:35:21','system','system'),(97,100030146,1,'2022-06-05 14:29:22','2022-06-05 14:29:22','system','system'),(98,100030147,1,'2022-06-05 14:30:45','2022-06-05 14:30:45','system','system'),(99,100030152,1,'2022-06-06 07:46:14','2022-06-06 07:46:14','system','system'),(100,100030153,1,'2022-06-06 10:00:01','2022-06-06 10:00:01','system','system'),(101,100030154,1,'2022-06-09 09:23:11','2022-06-09 09:23:11','system','system'),(102,100030155,1,'2022-06-10 09:35:07','2022-06-10 09:35:07','system','system');

/*Table structure for table `user_weixin` */

DROP TABLE IF EXISTS `user_weixin`;

CREATE TABLE `user_weixin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `union_id` varchar(255) NOT NULL DEFAULT '' COMMENT '认证id,微信对应的时unionId',
  `open_id` varchar(255) DEFAULT NULL COMMENT 'openId',
  `nick_name` varchar(255) NOT NULL COMMENT '昵称',
  `portrait` varchar(512) DEFAULT NULL COMMENT '头像',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `sex` int(11) DEFAULT NULL COMMENT '性别, 1-男，2-女',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_del` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `oauthId_and_oauthType_unique` (`union_id`,`open_id`,`is_del`) USING BTREE,
  UNIQUE KEY `userId_and_oauthType_unique_index` (`user_id`,`open_id`,`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=506562 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `user_weixin` */

insert  into `user_weixin`(`id`,`user_id`,`union_id`,`open_id`,`nick_name`,`portrait`,`city`,`sex`,`create_time`,`update_time`,`is_del`) values (506561,100030019,'oXEX_svcbl-mCDhWloqlEFNVHgP8','oGYgl0u0vZMKVAByQ3hR0i7jpKew','leo','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epKy1c3YeeI5vRqSxqDkaYc9XDuPao1BRLFKGf65SiaRIFqHTpeJg90RfrCXCo7WkicpfsPdKTdNTpA/132','',1,'2020-07-23 19:12:21','2020-07-23 19:12:21','\0');

/*Table structure for table `weather` */

DROP TABLE IF EXISTS `weather`;

CREATE TABLE `weather` (
  `pressure` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `windForce` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `windDirection` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `sunlight` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `rainfall` varchar(10) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `weather` */

insert  into `weather`(`pressure`,`windForce`,`windDirection`,`sunlight`,`rainfall`) values ('正常','微风','东南','弱','小雨');

/*Table structure for table `workpieceprocess` */

DROP TABLE IF EXISTS `workpieceprocess`;

CREATE TABLE `workpieceprocess` (
  `plantname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pNO` int(11) DEFAULT NULL,
  `condition` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `next` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `storehouse` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `workpieceprocess` */

insert  into `workpieceprocess`(`plantname`,`pNO`,`condition`,`next`,`storehouse`) values ('田七',1,'切片','烘干','A012'),('藏红花',2,'完成采摘','清洗','B01'),('何首乌',3,'烘干','打包封装','C03');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
