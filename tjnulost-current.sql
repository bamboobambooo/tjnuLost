/*
Navicat MySQL Data Transfer

Source Server         : loc
Source Server Version : 50539
Source Host           : 127.0.0.1:3306
Source Database       : tjnulost

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2015-04-01 03:17:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `realname` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dep_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dep_id` (`dep_id`),
  CONSTRAINT `fk_dep_id` FOREIGN KEY (`dep_id`) REFERENCES `t_department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', null, 'admin', '15936596555', 'hnnk@qq.com', '1');
INSERT INTO `t_admin` VALUES ('7', 'uiq', null, 'uiq', '111', '111', '2');
INSERT INTO `t_admin` VALUES ('8', 'swas', null, 'swas', '131', 'hnnk@qq.com', '2');
INSERT INTO `t_admin` VALUES ('9', '333', null, '333', '333', '333', '2');
INSERT INTO `t_admin` VALUES ('10', '444', null, '444', '444', '444', '2');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('1', 'admin');
INSERT INTO `t_department` VALUES ('2', '图书馆222');
INSERT INTO `t_department` VALUES ('3', '???');
INSERT INTO `t_department` VALUES ('4', '来吧试试');
INSERT INTO `t_department` VALUES ('5', '策策');
INSERT INTO `t_department` VALUES ('6', '小树苗');
INSERT INTO `t_department` VALUES ('7', 'a');
INSERT INTO `t_department` VALUES ('8', 'b');
INSERT INTO `t_department` VALUES ('9', 'bb');
INSERT INTO `t_department` VALUES ('10', 'bbb');
INSERT INTO `t_department` VALUES ('11', 'ccc');
INSERT INTO `t_department` VALUES ('12', 'abcds');

-- ----------------------------
-- Table structure for t_info
-- ----------------------------
DROP TABLE IF EXISTS `t_info`;
CREATE TABLE `t_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(2) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `pub_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `publish_admin_id` int(11) DEFAULT NULL,
  `publish_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_info
-- ----------------------------
INSERT INTO `t_info` VALUES ('1', '2', 'sdasad', null, 'dsasd', null, null, null, '1');
INSERT INTO `t_info` VALUES ('2', '2', '11', null, '11', null, null, null, '1');
INSERT INTO `t_info` VALUES ('3', '2', '123', null, '123', null, null, null, '5');
INSERT INTO `t_info` VALUES ('4', '2', '00', null, '00', null, null, null, '5');
INSERT INTO `t_info` VALUES ('5', '-2', '测试', null, '测试', null, null, null, '5');
INSERT INTO `t_info` VALUES ('6', '-2', '啊哈', null, '啊哈', null, null, null, '5');
INSERT INTO `t_info` VALUES ('7', '0', '劝学楼', '书包', '蓝色的！萌萌的！', null, null, null, '5');
INSERT INTO `t_info` VALUES ('8', '-2', 'aa, aa', null, 'aaa', null, null, '1', null);
INSERT INTO `t_info` VALUES ('9', '-2', '劝学楼', '港币', '港币港币', null, null, '1', null);
INSERT INTO `t_info` VALUES ('10', '-2', '玻璃楼', '水杯', '圆圆的 高高的', null, null, null, '5');
INSERT INTO `t_info` VALUES ('11', '-2', '娃娃', '娃娃', '娃娃', null, null, '7', null);
INSERT INTO `t_info` VALUES ('12', '-2', 'ewew', null, 'ewew', null, null, '9', null);
INSERT INTO `t_info` VALUES ('13', '-2', 'ewew22', null, 'ewew', null, null, '9', null);
INSERT INTO `t_info` VALUES ('14', '2', 'sa', null, 'sa', null, null, null, '1');
INSERT INTO `t_info` VALUES ('15', '2', 'sasa', null, 'sasa3', '2015-04-01 03:06:18', '2015-04-01 03:06:55', null, '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `realname` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `mobile` bigint(255) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '123', null, '123', null, null);
INSERT INTO `t_user` VALUES ('2', '1234', null, '1234555', null, null);
INSERT INTO `t_user` VALUES ('3', '36', null, '36', null, null);
INSERT INTO `t_user` VALUES ('4', 'lgh', null, 'lgh', '18902234360', 'hnnk@qq.com');
INSERT INTO `t_user` VALUES ('5', 'll', 'll', 'll', '18902234360', 'hnnk@qq.com');
INSERT INTO `t_user` VALUES ('8', 'll2', 'll', '22', null, '002023');
INSERT INTO `t_user` VALUES ('9', '121', '121', '121', '121', '121');
INSERT INTO `t_user` VALUES ('10', '12112', '121', '121', '121', '121');
INSERT INTO `t_user` VALUES ('11', '123122', '22', '22', '22', '22');
INSERT INTO `t_user` VALUES ('12', 'lghh', 'lghh', 'lghh', '12', '12');
INSERT INTO `t_user` VALUES ('13', '21e', 'ee', 'ee', null, 'ee');
INSERT INTO `t_user` VALUES ('14', '231', '231', '231', '231', '231');
INSERT INTO `t_user` VALUES ('15', '12f', '你猜', 'nask', null, 'sad');
INSERT INTO `t_user` VALUES ('16', '12', '123', '12', '123', '123');
DROP TRIGGER IF EXISTS `trigger_t_info_pub_time`;
DELIMITER ;;
CREATE TRIGGER `trigger_t_info_pub_time` BEFORE INSERT ON `t_info` FOR EACH ROW BEGIN 
set NEW.pub_time = now() ;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_t_info_update_time`;
DELIMITER ;;
CREATE TRIGGER `trigger_t_info_update_time` BEFORE UPDATE ON `t_info` FOR EACH ROW BEGIN 
set NEW.update_time = now() ;
END
;;
DELIMITER ;
