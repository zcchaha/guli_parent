/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.21-log : Database - guli_edu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `edu_chapter` */

DROP TABLE IF EXISTS `edu_chapter`;

CREATE TABLE `edu_chapter` (
  `id` char(19) NOT NULL COMMENT '章节ID',
  `course_id` char(19) NOT NULL COMMENT '课程ID',
  `title` varchar(50) NOT NULL COMMENT '章节名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示排序',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程';

/*Data for the table `edu_chapter` */

insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1199603984386056194','18','第七章：多态和抽象',70,'2019-11-27 16:20:52','2019-11-27 16:24:16'),('15','18','第一章：Java入门',0,'2019-01-01 12:27:40','2019-01-01 12:27:40'),('32','18','第二章：控制台输入和输出',0,'2019-01-01 12:27:40','2019-01-01 12:27:40'),('44','18','第三章：控制流',0,'2019-01-01 12:27:40','2019-01-01 12:27:40'),('48','18','第四章：类的定义',0,'2019-01-01 12:27:40','2019-01-01 12:27:40'),('63','18','第五章：数组',0,'2019-01-01 12:27:40','2019-01-01 12:27:40'),('64','18','第六章：继承',0,'2019-01-01 12:27:40','2019-01-01 12:27:40');

/*Table structure for table `edu_comment` */

DROP TABLE IF EXISTS `edu_comment`;

CREATE TABLE `edu_comment` (
  `id` char(19) NOT NULL COMMENT '讲师ID',
  `course_id` char(19) NOT NULL DEFAULT '' COMMENT '课程id',
  `teacher_id` char(19) NOT NULL DEFAULT '' COMMENT '讲师id',
  `member_id` char(19) NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '会员头像',
  `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_teacher_id` (`teacher_id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论';

/*Data for the table `edu_comment` */

/*Table structure for table `edu_course` */

DROP TABLE IF EXISTS `edu_course`;

CREATE TABLE `edu_course` (
  `id` char(19) NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) NOT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) NOT NULL COMMENT '课程专业父级ID',
  `title` varchar(50) NOT NULL COMMENT '课程标题',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `view_count` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `status` varchar(10) NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`),
  KEY `idx_subject_id` (`subject_id`),
  KEY `idx_teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程';

/*Data for the table `edu_course` */

insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`gmt_create`,`gmt_modified`) values ('14','1','1199187006080974850','1199187006060003330','XHTML CSS2 JS整站制作教程课程学习','0.00',3,'https://online-teach-file-helen.oss-cn-beijing.aliyuncs.com/cover/2019/11/27/0f1fbe64-9271-4bb4-b07e-5ec8b4b1269e.jpg',3,40,1,'Normal','2018-04-02 18:33:34','2019-12-03 06:48:27'),('15','1','1199187006080974850','1199187006060003330','HTML5入门课程学习','0.00',23,'https://online-teach-file-helen.oss-cn-beijing.aliyuncs.com/cover/2019/11/27/0f1fbe64-9271-4bb4-b07e-5ec8b4b1269e.jpg',0,39,1,'Normal','2018-04-02 18:34:32','2019-03-13 06:04:22'),('17','2','1199187005963534337','1199187005938368513','MySql从入门到精通','0.00',100,'https://online-teach-file-helen.oss-cn-beijing.aliyuncs.com/cover/2019/11/27/0f1fbe64-9271-4bb4-b07e-5ec8b4b1269e.jpg',34,134,1,'Normal','2018-04-02 21:13:58','2019-12-10 13:46:58'),('18','2','1199187005963534337','1199187005938368513','Java精品课程','0.01',99,'https://online-teach-file-helen.oss-cn-beijing.aliyuncs.com/cover/2019/11/27/20fdc382-914b-4390-b9cc-2ba08b50b381.jpg',153,684,1,'Normal','2018-04-02 21:28:46','2019-12-11 04:28:17');

/*Table structure for table `edu_course_collect` */

DROP TABLE IF EXISTS `edu_course_collect`;

CREATE TABLE `edu_course_collect` (
  `id` char(19) NOT NULL COMMENT '收藏ID',
  `course_id` char(19) NOT NULL COMMENT '课程讲师ID',
  `member_id` char(19) NOT NULL DEFAULT '' COMMENT '课程专业ID',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程收藏';

/*Data for the table `edu_course_collect` */

insert  into `edu_course_collect`(`id`,`course_id`,`member_id`,`gmt_create`,`gmt_modified`) values ('1204276455316406274','18','1203065189981810689','2019-12-10 13:47:36','2019-12-10 13:47:36');

/*Table structure for table `edu_course_description` */

DROP TABLE IF EXISTS `edu_course_description`;

CREATE TABLE `edu_course_description` (
  `id` char(19) NOT NULL COMMENT '课程ID',
  `description` text COMMENT '课程简介',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程简介';

/*Data for the table `edu_course_description` */

insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('14','','2019-03-13 06:04:43','2019-03-13 06:05:33'),('15','','2019-03-13 06:03:33','2019-03-13 06:04:22'),('17','','2019-03-13 05:59:11','2019-03-13 06:00:56'),('18','<p>1本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>\n<p>------------------------------------</p>\n<p>视频特点：</p>\n<p>通过学习本Java视频教程，大家能够真正将Java基础知识学以致用、活学活用，构架Java编程思想，牢牢掌握\"源码级\"的Javase核心技术，并为后续JavaWeb等技术的学习奠定扎实基础。<br /><br />1.通俗易懂，细致入微：每个知识点高屋建瓴，深入浅出，简洁明了的说明问题<br />2.具实战性：全程真正代码实战，涵盖上百个企业应用案例及练习<br />3.深入：源码分析，更有 Java 反射、动态代理的实际应用等<br />4.登录尚硅谷官网，技术讲师免费在线答疑</p>','2019-03-06 18:06:36','2019-11-27 16:14:28');

/*Table structure for table `edu_subject` */

DROP TABLE IF EXISTS `edu_subject`;

CREATE TABLE `edu_subject` (
  `id` char(19) NOT NULL COMMENT '课程类别ID',
  `title` varchar(10) NOT NULL COMMENT '类别名称',
  `parent_id` char(19) NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程科目';

/*Data for the table `edu_subject` */

insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1199187005938368513','后端开发','0',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187005963534337','Java','1199187005938368513',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006039031810','Python','1199187005938368513',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006060003330','前端开发','0',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006080974850','HTML/CSS','1199187006060003330',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006114529282','JavaScript','1199187006060003330',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006131306497','云计算','0',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006156472322','Docker','1199187006131306497',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006185832450','Linux','1199187006131306497',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006210998273','系统/运维','0',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006227775490','Linux','1199187006210998273',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006261329921','Windows','1199187006210998273',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006282301442','数据库','0',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006307467266','MySQL','1199187006282301442',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006336827393','MongoDB','1199187006282301442',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006353604609','大数据','0',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006378770433','Hadoop','1199187006353604609',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006403936257','Spark','1199187006353604609',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006420713473','人工智能','0',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006420713474','Python','1199187006420713473',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006420713475','编程语言','0',0,'2019-11-26 12:43:57','2019-11-26 12:43:57'),('1199187006420713476','Java','1199187006420713475',0,'2019-11-26 12:43:57','2019-11-26 12:43:57');

/*Table structure for table `edu_teacher` */

DROP TABLE IF EXISTS `edu_teacher`;

CREATE TABLE `edu_teacher` (
  `id` char(19) NOT NULL COMMENT '讲师ID',
  `name` varchar(20) NOT NULL COMMENT '讲师姓名',
  `intro` varchar(500) NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(500) DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `level` int(10) unsigned NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) DEFAULT NULL COMMENT '讲师头像',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `join_date` date DEFAULT NULL COMMENT '入驻时间',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='讲师';

/*Data for the table `edu_teacher` */

insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`join_date`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1','刘德华','毕业于师范大学数学系，热爱教育事业，执教数学思维6年有余','具备深厚的数学思维功底、丰富的小学教育经验，授课风格生动活泼，擅长用形象生动的比喻帮助理解、简单易懂的语言讲解难题，深受学生喜欢',2,'https://online-teach-file-helen.oss-cn-beijing.aliyuncs.com/avatar/2019/11/25/03.jpg',10,'2019-10-29',0,'2018-03-30 17:15:57','2019-04-28 05:02:18'),('10','唐嫣','北京师范大学法学院副教授','北京师范大学法学院副教授、清华大学法学博士。自2004年至今已有9年的司法考试培训经验。长期从事司法考试辅导，深知命题规律，了解解题技巧。内容把握准确，授课重点明确，层次分明，调理清晰，将法条法理与案例有机融合，强调综合，深入浅出。',1,'http://guli-file.oss-cn-beijing.aliyuncs.com/avatar/2019/02/27/073eb5d2-f5f4-488a-82ed-aec8a5289a5d.png',20,'2019-10-29',0,'2018-04-03 14:32:19','2019-02-22 02:01:26'),('2','周润发','中国人民大学附属中学数学一级教师','中国科学院数学与系统科学研究院应用数学专业博士，研究方向为数字图像处理，中国工业与应用数学学会会员。参与全国教育科学“十五”规划重点课题“信息化进程中的教育技术发展研究”的子课题“基与课程改革的资源开发与应用”，以及全国“十五”科研规划全国重点项目“掌上型信息技术产品在教学中的运用和开发研究”的子课题“用技术学数学”。',2,'https://online-teach-file-helen.oss-cn-beijing.aliyuncs.com/avatar/2019/11/25/01.jpg',1,'2019-10-28',0,'2018-03-30 18:28:26','2019-11-25 07:19:44'),('3','钟汉良','钟汉良钟汉良钟汉良钟汉良','中教一级职称。讲课极具亲和力。',1,'http://guli-file.oss-cn-beijing.aliyuncs.com/avatar/2019/02/26/250bab5f-bbd6-49ab-80c3-7413ce806e83.jpg',2,'2019-10-29',0,'2018-03-31 09:20:46','2019-02-22 02:01:27'),('4','周杰伦','长期从事考研政治课讲授和考研命题趋势与应试对策研究。考研辅导新锐派的代表。','政治学博士、管理学博士后，北京师范大学马克思主义学院副教授。多年来总结出了一套行之有效的应试技巧与答题方法，针对性和实用性极强，能帮助考生在轻松中应考，在激励的竞争中取得高分，脱颖而出。',1,'https://online-teach-file-helen.oss-cn-beijing.aliyuncs.com/avatar/2019/11/25/fee1e99f-8852-4da0-a256-9732e55bb608.jpg',1,'2019-10-27',0,'2018-04-03 14:13:51','2019-10-29 19:52:46'),('5','陈伟霆','人大附中2009届毕业生','北京大学数学科学学院2008级本科生，2012年第八届学生五四奖章获得者，在数学领域取得多项国际国内奖项，学术研究成绩突出。曾被两次评为北京大学三好学生、一次评为北京大学三好标兵，获得过北京大学国家奖学金、北京大学廖凯原奖学金、北京大学星光国际一等奖学金、北京大学明德新生奖学金等。',1,'',1,'2019-10-29',0,'2018-04-03 14:15:36','2019-02-22 02:01:29'),('6','姚晨','华东师范大学数学系硕士生导师，中国数学奥林匹克高级教练','曾参与北京市及全国多项数学活动的命题和组织工作，多次带领北京队参加高中、初中、小学的各项数学竞赛，均取得优异成绩。教学活而新，能够调动学生的学习兴趣并擅长对学生进行思维点拨，对学生学习习惯的养成和非智力因素培养有独到之处，是一位深受学生喜爱的老师。',1,'',1,'2019-10-29',0,'2018-04-01 14:19:28','2019-02-22 02:01:29'),('7','胡歌','考研政治辅导实战派专家，全国考研政治命题研究组核心成员。','法学博士，北京师范大学马克思主义学院副教授，专攻毛泽东思想概论、邓小平理论，长期从事考研辅导。出版著作两部，发表学术论文30余篇，主持国家社会科学基金项目和教育部重大课题子课题各一项，参与中央实施马克思主义理论研究和建设工程项目。',2,'',8,'2019-09-04',0,'2018-04-03 14:21:03','2019-02-22 02:01:30'),('8','谢娜','资深课程设计专家，专注10年AACTP美国培训协会认证导师','十年课程研发和培训咨询经验，曾任国企人力资源经理、大型外企培训经理，负责企业大学和培训体系搭建；曾任专业培训机构高级顾问、研发部总监，为包括广东移动、东莞移动、深圳移动、南方电网、工商银行、农业银行、民生银行、邮储银行、TCL集团、清华大学继续教育学院、中天路桥、广西扬翔股份等超过200家企业提供过培训与咨询服务，并担任近50个大型项目的总负责人。',1,'',10,'2019-10-29',0,'2018-04-03 14:23:33','2019-11-23 08:38:09');

/*Table structure for table `edu_video` */

DROP TABLE IF EXISTS `edu_video`;

CREATE TABLE `edu_video` (
  `id` char(19) NOT NULL COMMENT '视频ID',
  `course_id` char(19) NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) NOT NULL COMMENT '章节ID',
  `title` varchar(50) NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
  `play_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '播放次数',
  `is_free` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT '0' COMMENT '视频时长（秒）',
  `status` varchar(20) NOT NULL DEFAULT 'Empty' COMMENT '状态',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '视频源文件大小（字节）',
  `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_chapter_id` (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程视频';

/*Data for the table `edu_video` */

insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('17','18','15','第一节：Java简介','7011161ed49c45d0bf0a89208b618ae6','6',1,1000,1,100,'',0,1,'2019-01-01 13:08:57','2019-11-30 02:59:03'),('18','18','15','第二节：表达式和赋值语句','','',2,999,1,100,'',0,1,'2019-01-01 13:09:02','2019-03-08 03:30:27'),('19','18','15','第三节：String类','','',3,888,0,100,'',0,1,'2019-01-01 13:09:05','2019-02-21 20:46:10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
