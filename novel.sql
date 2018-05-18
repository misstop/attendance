/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : novel

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2018-05-18 09:39:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add user', '7', 'add_user');
INSERT INTO `auth_permission` VALUES ('20', 'Can change user', '7', 'change_user');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete user', '7', 'delete_user');
INSERT INTO `auth_permission` VALUES ('22', 'Can add attendance', '8', 'add_attendance');
INSERT INTO `auth_permission` VALUES ('23', 'Can change attendance', '8', 'change_attendance');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete attendance', '8', 'delete_attendance');
INSERT INTO `auth_permission` VALUES ('25', 'Can add employee info', '9', 'add_employeeinfo');
INSERT INTO `auth_permission` VALUES ('26', 'Can change employee info', '9', 'change_employeeinfo');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete employee info', '9', 'delete_employeeinfo');
INSERT INTO `auth_permission` VALUES ('28', 'Can add leave', '10', 'add_leave');
INSERT INTO `auth_permission` VALUES ('29', 'Can change leave', '10', 'change_leave');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete leave', '10', 'delete_leave');
INSERT INTO `auth_permission` VALUES ('31', 'Can add overtime', '11', 'add_overtime');
INSERT INTO `auth_permission` VALUES ('32', 'Can change overtime', '11', 'change_overtime');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete overtime', '11', 'delete_overtime');
INSERT INTO `auth_permission` VALUES ('34', 'Can add statistics', '12', 'add_statistics');
INSERT INTO `auth_permission` VALUES ('35', 'Can change statistics', '12', 'change_statistics');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete statistics', '12', 'delete_statistics');
INSERT INTO `auth_permission` VALUES ('37', 'Can add vacate', '13', 'add_vacate');
INSERT INTO `auth_permission` VALUES ('38', 'Can change vacate', '13', 'change_vacate');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete vacate', '13', 'delete_vacate');
INSERT INTO `auth_permission` VALUES ('40', 'Can add reply', '14', 'add_reply');
INSERT INTO `auth_permission` VALUES ('41', 'Can change reply', '14', 'change_reply');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete reply', '14', 'delete_reply');
INSERT INTO `auth_permission` VALUES ('43', 'Can add articles', '15', 'add_articles');
INSERT INTO `auth_permission` VALUES ('44', 'Can change articles', '15', 'change_articles');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete articles', '15', 'delete_articles');
INSERT INTO `auth_permission` VALUES ('46', 'Can add comments', '16', 'add_comments');
INSERT INTO `auth_permission` VALUES ('47', 'Can change comments', '16', 'change_comments');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete comments', '16', 'delete_comments');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$100000$ozgCxBqfbrR8$lYL0KJZMtmbnGzicHK+mugvUQdSiA8jdqMBDvQcy1HY=', '2018-04-18 04:27:35', '1', 'admin', '', '', 'admin@example.com', '1', '1', '2018-04-18 04:23:54');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
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

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('15', 'novel', 'articles');
INSERT INTO `django_content_type` VALUES ('8', 'novel', 'attendance');
INSERT INTO `django_content_type` VALUES ('16', 'novel', 'comments');
INSERT INTO `django_content_type` VALUES ('9', 'novel', 'employeeinfo');
INSERT INTO `django_content_type` VALUES ('10', 'novel', 'leave');
INSERT INTO `django_content_type` VALUES ('11', 'novel', 'overtime');
INSERT INTO `django_content_type` VALUES ('14', 'novel', 'reply');
INSERT INTO `django_content_type` VALUES ('12', 'novel', 'statistics');
INSERT INTO `django_content_type` VALUES ('7', 'novel', 'user');
INSERT INTO `django_content_type` VALUES ('13', 'novel', 'vacate');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-04-18 02:45:35');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-04-18 02:45:38');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-04-18 02:45:38');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-04-18 02:45:38');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-04-18 02:45:39');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-04-18 02:45:39');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-04-18 02:45:39');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-04-18 02:45:40');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-04-18 02:45:40');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-04-18 02:45:40');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-04-18 02:45:40');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2018-04-18 02:45:40');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0009_alter_user_last_name_max_length', '2018-04-18 02:45:41');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-04-18 02:45:41');
INSERT INTO `django_migrations` VALUES ('15', 'novel', '0001_initial', '2018-04-18 04:20:58');
INSERT INTO `django_migrations` VALUES ('16', 'novel', '0002_auto_20180426_1242', '2018-04-26 04:42:33');
INSERT INTO `django_migrations` VALUES ('17', 'novel', '0002_employeeinfo', '2018-04-26 09:38:32');
INSERT INTO `django_migrations` VALUES ('18', 'novel', '0003_auto_20180426_1833', '2018-04-26 10:33:13');
INSERT INTO `django_migrations` VALUES ('19', 'novel', '0004_articles_comments_reply', '2018-05-10 15:11:45');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ux8qkxan00u2b0oevh3p1u8l9l9m5it8', 'YzVjYmIyYTM3ZDE4Nzg0N2IyMjkwMTM4YTRkZjhkOGQ1ZjZjNzA2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODM4M2ViMjQwNTI2MTE5MWY0NmMxYmQxMTRiYmY1ZDI4YjNjMGVkIiwiaWQiOjEsImVtcElEIjoiMTEzIiwiYXJ0aWNsZV9saXN0IjoiW3tcIm1vZGVsXCI6IFwibm92ZWwuYXJ0aWNsZXNcIiwgXCJwa1wiOiAxLCBcImZpZWxkc1wiOiB7XCJhdXRob3JcIjogXCJcXHU2NzRlXFx1OWY5OVxcdTk4ZGVcIiwgXCJ0aXRsZVwiOiBcIlxcdTZkNGJcXHU4YmQ1XFx1OGQzNFwiLCBcImNvbnRlbnRcIjogXCI8cD5cXHU4ZmQ5XFx1NjYyZlxcdTRlMDBcXHU0ZTJhXFx1NmQ0YlxcdThiZDVcXHU4ZDM0PC9wPlwiLCBcImNyZWF0ZWRfYXRcIjogXCIyMDE4LTA1LTEwVDE1OjE4OjA3WlwiLCBcInVwZGF0ZWRfYXRcIjogXCIyMDE4LTA1LTEwVDE1OjE4OjA3WlwifX0sIHtcIm1vZGVsXCI6IFwibm92ZWwuYXJ0aWNsZXNcIiwgXCJwa1wiOiAzLCBcImZpZWxkc1wiOiB7XCJhdXRob3JcIjogXCJcXHU2NzRlXFx1OWY5OVxcdTk4ZGVcIiwgXCJ0aXRsZVwiOiBcIlxcdTZkNGJcXHU4YmQ1M1wiLCBcImNvbnRlbnRcIjogXCI8cD5cXHU1NGE2XFx1NTRhNlxcdTU0YTZcXHU1NGE2XFx1NTRhNjwvcD5cIiwgXCJjcmVhdGVkX2F0XCI6IFwiMjAxOC0wNS0xMFQxNToyMDozNlpcIiwgXCJ1cGRhdGVkX2F0XCI6IFwiMjAxOC0wNS0xMFQxNToyMDozNlpcIn19XSIsImVycm9yX21zZyI6IiIsInEiOiIiLCJzaWduX2luIjoiIiwic2lnbl9vdXQiOiIifQ==', '2018-05-31 16:40:54');

-- ----------------------------
-- Table structure for novel_articles
-- ----------------------------
DROP TABLE IF EXISTS `novel_articles`;
CREATE TABLE `novel_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(200) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `novel_articles_author_7c30303f` (`author`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_articles
-- ----------------------------
INSERT INTO `novel_articles` VALUES ('1', '李龙飞', '测试贴', '<p>这是一个测试贴</p>', '2018-05-10 15:18:07', '2018-05-10 15:18:07');
INSERT INTO `novel_articles` VALUES ('2', '李龙飞', '策划师', '<p>哈哈哈哈哈</p>', '2018-05-10 15:19:32', '2018-05-10 15:19:32');
INSERT INTO `novel_articles` VALUES ('3', '李龙飞', '测试3', '<p>咦咦咦咦咦</p>', '2018-05-10 15:20:36', '2018-05-10 15:20:36');
INSERT INTO `novel_articles` VALUES ('4', '李龙飞', '123', '<p>嘻嘻嘻嘻</p>', '2018-05-10 16:13:53', '2018-05-10 16:13:53');
INSERT INTO `novel_articles` VALUES ('5', '李龙飞', '斜体', '<p><em>测试斜体</em></p>', '2018-05-10 16:42:45', '2018-05-10 16:42:45');
INSERT INTO `novel_articles` VALUES ('6', '侯启蒙', '粗体测试', '<p><strong>myapp 要给力</strong></p>', '2018-05-15 08:43:10', '2018-05-15 08:43:10');

-- ----------------------------
-- Table structure for novel_attendance
-- ----------------------------
DROP TABLE IF EXISTS `novel_attendance`;
CREATE TABLE `novel_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empID` varchar(200) NOT NULL,
  `attNum` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `novel_attendance_empID_d0a1d158` (`empID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_attendance
-- ----------------------------
INSERT INTO `novel_attendance` VALUES ('1', '113', '1', '2018-05-14 08:06:38', '2018-05-14 08:06:38');
INSERT INTO `novel_attendance` VALUES ('2', '113', '1', '2018-05-14 08:08:15', '2018-05-14 08:08:15');
INSERT INTO `novel_attendance` VALUES ('3', '113', '1', '2018-05-14 08:09:22', '2018-05-14 08:09:22');
INSERT INTO `novel_attendance` VALUES ('4', '113', '1', '2018-05-14 08:09:42', '2018-05-14 08:09:42');
INSERT INTO `novel_attendance` VALUES ('5', '113', '1', '2018-05-14 08:09:53', '2018-05-14 08:09:53');
INSERT INTO `novel_attendance` VALUES ('6', '113', '1', '2018-05-14 08:11:10', '2018-05-14 08:11:10');
INSERT INTO `novel_attendance` VALUES ('7', '113', '1', '2018-05-14 08:13:45', '2018-05-14 08:13:45');
INSERT INTO `novel_attendance` VALUES ('8', '113', '1', '2018-05-14 08:17:25', '2018-05-14 08:17:25');
INSERT INTO `novel_attendance` VALUES ('9', '113', '1', '2018-05-14 10:33:39', '2018-05-14 10:33:39');
INSERT INTO `novel_attendance` VALUES ('10', '113', '1', '2018-05-14 10:38:40', '2018-05-14 10:38:40');
INSERT INTO `novel_attendance` VALUES ('11', '113', '1', '2018-05-14 10:39:21', '2018-05-14 10:39:21');
INSERT INTO `novel_attendance` VALUES ('12', '113', '1', '2018-05-14 15:01:04', '2018-05-14 15:01:04');
INSERT INTO `novel_attendance` VALUES ('13', '113', '1', '2018-05-14 15:22:35', '2018-05-14 15:22:35');
INSERT INTO `novel_attendance` VALUES ('14', '113', '1', '2018-05-14 15:25:40', '2018-05-14 15:25:40');
INSERT INTO `novel_attendance` VALUES ('15', '113', '1', '2018-05-14 15:25:49', '2018-05-14 15:25:49');
INSERT INTO `novel_attendance` VALUES ('16', '113', '1', '2018-05-14 15:25:51', '2018-05-14 15:25:51');
INSERT INTO `novel_attendance` VALUES ('17', '113', '1', '2018-05-14 15:27:54', '2018-05-14 15:27:54');
INSERT INTO `novel_attendance` VALUES ('18', '113', '1', '2018-05-14 15:27:58', '2018-05-14 15:27:58');
INSERT INTO `novel_attendance` VALUES ('19', '113', '1', '2018-05-14 15:28:00', '2018-05-14 15:28:00');
INSERT INTO `novel_attendance` VALUES ('20', '113', '1', '2018-05-14 15:53:56', '2018-05-14 15:53:56');
INSERT INTO `novel_attendance` VALUES ('21', '113', '1', '2018-05-14 15:54:19', '2018-05-14 15:54:19');
INSERT INTO `novel_attendance` VALUES ('22', '113', '1', '2018-05-14 15:54:40', '2018-05-14 15:54:40');
INSERT INTO `novel_attendance` VALUES ('23', '113', '1', '2018-05-14 15:54:57', '2018-05-14 15:54:57');
INSERT INTO `novel_attendance` VALUES ('24', '113', '1', '2018-05-14 15:57:59', '2018-05-14 15:57:59');
INSERT INTO `novel_attendance` VALUES ('25', '113', '1', '2018-05-15 01:40:03', '2018-05-15 01:40:03');
INSERT INTO `novel_attendance` VALUES ('26', '113', '1', '2018-05-15 02:14:45', '2018-05-15 02:14:45');
INSERT INTO `novel_attendance` VALUES ('27', '113', '1', '2018-05-15 07:24:20', '2018-05-15 07:24:20');
INSERT INTO `novel_attendance` VALUES ('28', '113', '1', '2018-05-15 08:13:35', '2018-05-15 08:13:35');
INSERT INTO `novel_attendance` VALUES ('29', '113', '1', '2018-05-15 08:13:51', '2018-05-15 08:13:51');
INSERT INTO `novel_attendance` VALUES ('30', '060', '1', '2018-05-15 08:37:29', '2018-05-15 08:37:29');
INSERT INTO `novel_attendance` VALUES ('31', '060', '1', '2018-05-15 08:54:18', '2018-05-15 08:54:18');
INSERT INTO `novel_attendance` VALUES ('32', '113', '1', '2018-05-15 10:01:51', '2018-05-15 10:01:51');
INSERT INTO `novel_attendance` VALUES ('33', '113', '1', '2018-05-15 10:02:48', '2018-05-15 10:02:48');
INSERT INTO `novel_attendance` VALUES ('34', '113', '1', '2018-05-16 01:18:03', '2018-05-16 01:18:03');
INSERT INTO `novel_attendance` VALUES ('35', '113', '1', '2018-05-16 01:50:14', '2018-05-16 01:50:14');
INSERT INTO `novel_attendance` VALUES ('36', '113', '1', '2018-05-16 02:04:26', '2018-05-16 02:04:26');
INSERT INTO `novel_attendance` VALUES ('37', '060', '1', '2018-05-16 14:47:10', '2018-05-16 14:47:10');

-- ----------------------------
-- Table structure for novel_comments
-- ----------------------------
DROP TABLE IF EXISTS `novel_comments`;
CREATE TABLE `novel_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `articles_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `novel_comments_articles_id_bc2b8368_fk_novel_articles_id` (`articles_id`),
  KEY `novel_comments_author_fdc2a670` (`author`),
  CONSTRAINT `novel_comments_articles_id_bc2b8368_fk_novel_articles_id` FOREIGN KEY (`articles_id`) REFERENCES `novel_articles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_comments
-- ----------------------------

-- ----------------------------
-- Table structure for novel_employeeinfo
-- ----------------------------
DROP TABLE IF EXISTS `novel_employeeinfo`;
CREATE TABLE `novel_employeeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empID` varchar(200) NOT NULL,
  `name` varchar(50) NOT NULL,
  `dept` varchar(200) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `ownEmail` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `novel_employeeinfo_empID_03394137` (`empID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_employeeinfo
-- ----------------------------
INSERT INTO `novel_employeeinfo` VALUES ('14', '113', '李龙飞', '开发部', '男', '河南中医药大学', '17521010905', 'wait_you@qq.com', '2018-05-16 02:15:58', '2018-05-16 02:15:58');
INSERT INTO `novel_employeeinfo` VALUES ('15', '060', '侯启蒙', '编辑部', '男', '河南中医药大学', '18239968916', '514939067@qq.com', '2018-05-16 02:16:49', '2018-05-16 02:16:49');

-- ----------------------------
-- Table structure for novel_leave
-- ----------------------------
DROP TABLE IF EXISTS `novel_leave`;
CREATE TABLE `novel_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empID` varchar(200) NOT NULL,
  `leaveType` varchar(50) NOT NULL,
  `leaveReason` varchar(200) NOT NULL,
  `staTime` varchar(200) NOT NULL,
  `endTime` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `novel_leave_empID_b25947cb` (`empID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_leave
-- ----------------------------
INSERT INTO `novel_leave` VALUES ('1', '113', '已同意', '上海业务出差', '2018-05-18T00:00', '2018-05-19T09:00', '2018-05-17 16:31:54', '2018-05-17 16:37:35');
INSERT INTO `novel_leave` VALUES ('2', '060', '已同意', '部署项目', '2018-05-18T09:00', '2018-05-18T17:00', '2018-05-17 16:40:26', '2018-05-17 16:41:13');

-- ----------------------------
-- Table structure for novel_overtime
-- ----------------------------
DROP TABLE IF EXISTS `novel_overtime`;
CREATE TABLE `novel_overtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empID` varchar(200) NOT NULL,
  `overType` varchar(50) NOT NULL,
  `staTime` varchar(200) NOT NULL,
  `endTime` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `novel_overtime_empID_d5ab0927` (`empID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_overtime
-- ----------------------------
INSERT INTO `novel_overtime` VALUES ('1', '113', '正常加班', '2018-05-15T19:00', '2018-05-15T21:00', '2018-05-15 04:42:29', '2018-05-15 04:42:29');
INSERT INTO `novel_overtime` VALUES ('2', '113', '额外加班', '2018-05-15T19:00', '2018-05-15T21:00', '2018-05-15 04:46:22', '2018-05-15 04:46:22');
INSERT INTO `novel_overtime` VALUES ('3', '113', '正常加班', '2018-05-15T18:00', '2018-05-15T21:00', '2018-05-15 07:22:55', '2018-05-15 07:22:55');
INSERT INTO `novel_overtime` VALUES ('4', '113', '111', '2018-05-15T11:11', '2018-05-15T22:22', '2018-05-15 07:24:52', '2018-05-15 07:24:52');
INSERT INTO `novel_overtime` VALUES ('5', '113', '222', '2018-05-15T19:00', '2018-05-15T21:00', '2018-05-15 07:26:40', '2018-05-15 07:26:40');
INSERT INTO `novel_overtime` VALUES ('6', '060', '正常加班', '2018-05-15T19:00', '2018-05-15T21:00', '2018-05-15 08:40:46', '2018-05-15 08:40:46');
INSERT INTO `novel_overtime` VALUES ('7', '113', '生病', '2018-05-16T00:00', '2018-05-17T09:00', '2018-05-16 15:37:26', '2018-05-16 15:37:26');

-- ----------------------------
-- Table structure for novel_reply
-- ----------------------------
DROP TABLE IF EXISTS `novel_reply`;
CREATE TABLE `novel_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `novel_reply_comment_id_6205a7bf_fk_novel_comments_id` (`comment_id`),
  KEY `novel_reply_author_bef3b039` (`author`),
  CONSTRAINT `novel_reply_comment_id_6205a7bf_fk_novel_comments_id` FOREIGN KEY (`comment_id`) REFERENCES `novel_comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_reply
-- ----------------------------

-- ----------------------------
-- Table structure for novel_statistics
-- ----------------------------
DROP TABLE IF EXISTS `novel_statistics`;
CREATE TABLE `novel_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empID` varchar(200) NOT NULL,
  `attNum` int(11) NOT NULL,
  `oveNum` int(11) NOT NULL,
  `vacNum` int(11) NOT NULL,
  `leaNum` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `novel_statistics_empID_7edd307a` (`empID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_statistics
-- ----------------------------
INSERT INTO `novel_statistics` VALUES ('1', '113', '8', '2', '2', '7', '2018-05-14 08:09:42', '2018-05-17 16:37:35');
INSERT INTO `novel_statistics` VALUES ('2', '060', '3', '1', '1', '1', '2018-05-15 08:37:29', '2018-05-17 16:41:14');

-- ----------------------------
-- Table structure for novel_user
-- ----------------------------
DROP TABLE IF EXISTS `novel_user`;
CREATE TABLE `novel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `empID` varchar(200) NOT NULL,
  `role` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `novel_user_userName_a6fa2c9c_uniq` (`userName`),
  KEY `novel_user_empID_df79b19e` (`empID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_user
-- ----------------------------
INSERT INTO `novel_user` VALUES ('1', '2014181113', '181113', '113', 'admin', '2018-04-24 11:00:10', '2018-04-24 11:00:31');
INSERT INTO `novel_user` VALUES ('2', '2014181060', '181060', '060', 'common', '2018-05-15 16:34:19', '2018-05-15 16:34:24');

-- ----------------------------
-- Table structure for novel_vacate
-- ----------------------------
DROP TABLE IF EXISTS `novel_vacate`;
CREATE TABLE `novel_vacate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empID` varchar(200) NOT NULL,
  `vacateType` varchar(50) NOT NULL,
  `vReason` varchar(200) NOT NULL,
  `staTime` varchar(200) NOT NULL,
  `endTime` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `novel_vacate_empID_b457c1a6` (`empID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_vacate
-- ----------------------------
INSERT INTO `novel_vacate` VALUES ('1', '113', '已同意', '生病', '2018-05-16T00:00', '2018-05-17T00:00', '2018-05-16 15:39:43', '2018-05-17 16:35:58');
INSERT INTO `novel_vacate` VALUES ('2', '113', '已同意', '回老家有急事', '2018-05-17T17:00', '2018-05-19T08:00', '2018-05-16 18:16:16', '2018-05-16 20:07:47');
INSERT INTO `novel_vacate` VALUES ('3', '060', '已同意', '写毕业设计', '2018-05-17T01:05', '2018-05-19T01:00', '2018-05-16 18:22:17', '2018-05-16 20:10:09');
