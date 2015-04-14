/*
Navicat MySQL Data Transfer

Source Server         : loc
Source Server Version : 50539
Source Host           : 127.0.0.1:3306
Source Database       : tjnulost

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2015-04-15 01:12:29
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', null, 'admin', '15936596555', 'hnnk@qq.com', '1');
INSERT INTO `t_admin` VALUES ('7', 'uiq', null, 'uiq', '111', '111', '2');
INSERT INTO `t_admin` VALUES ('9', '333', null, '333', '333', '333', '2');
INSERT INTO `t_admin` VALUES ('10', '444', null, '444', '444', '10', '2');
INSERT INTO `t_admin` VALUES ('12', 'nas', null, 'nas', '33', '10', '2');
INSERT INTO `t_admin` VALUES ('13', 'a', null, null, null, null, '2');
INSERT INTO `t_admin` VALUES ('14', 'a', null, null, null, null, '2');
INSERT INTO `t_admin` VALUES ('15', 'a', null, null, null, null, '2');
INSERT INTO `t_admin` VALUES ('16', 'a', null, null, null, null, '2');
INSERT INTO `t_admin` VALUES ('17', 'a', null, null, null, null, '2');
INSERT INTO `t_admin` VALUES ('18', 'a', null, null, null, null, '2');
INSERT INTO `t_admin` VALUES ('19', 'a', null, null, null, null, '2');
INSERT INTO `t_admin` VALUES ('20', 'a', null, null, null, null, '2');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_department` VALUES ('13', '图书馆');

-- ----------------------------
-- Table structure for t_info
-- ----------------------------
DROP TABLE IF EXISTS `t_info`;
CREATE TABLE `t_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(2) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `pub_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `publish_admin_id` int(11) DEFAULT NULL,
  `publish_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_info
-- ----------------------------
INSERT INTO `t_info` VALUES ('1', '2', 'sdasad', '手表', null, 'dsasd', null, '2015-04-01 09:29:23', null, '1');
INSERT INTO `t_info` VALUES ('2', '2', '劝学楼', '手机', null, '11', null, '2015-04-01 09:29:37', null, '1');
INSERT INTO `t_info` VALUES ('3', '2', '123', '手表', null, '123', null, '2015-04-01 09:30:59', null, '5');
INSERT INTO `t_info` VALUES ('4', '2', '00', '手表', null, '00', null, '2015-04-01 09:31:01', null, '5');
INSERT INTO `t_info` VALUES ('5', '-2', '测试', '手表', null, '测试', null, '2015-04-01 09:31:01', null, '5');
INSERT INTO `t_info` VALUES ('6', '-2', '啊哈', '手表', null, '啊哈', null, '2015-04-01 09:31:03', null, '5');
INSERT INTO `t_info` VALUES ('7', '0', '劝学楼', '书包', null, '蓝色的！萌萌的！', null, null, null, '5');
INSERT INTO `t_info` VALUES ('8', '-2', '师大', '手表', null, 'aaa', null, '2015-04-01 09:31:04', '1', null);
INSERT INTO `t_info` VALUES ('9', '-2', '劝学楼', '港币', null, '港币港币', null, null, '1', null);
INSERT INTO `t_info` VALUES ('10', '-2', '玻璃楼', '水杯', null, '圆圆的 高高的', null, null, null, '5');
INSERT INTO `t_info` VALUES ('11', '-2', '娃娃', '娃娃', null, '娃娃', null, null, '7', null);
INSERT INTO `t_info` VALUES ('12', '-2', '师大', '手表', null, 'ewew', null, '2015-04-01 09:31:04', '9', null);
INSERT INTO `t_info` VALUES ('13', '-2', '师大', '手表', null, 'ewew', null, '2015-04-01 09:31:05', '9', null);
INSERT INTO `t_info` VALUES ('14', '2', '师大', '手表', null, 'sa', null, '2015-04-01 09:31:06', null, '1');
INSERT INTO `t_info` VALUES ('15', '2', '工大', '电脑', null, '唔唔唔3', '2015-04-01 03:06:18', '2015-04-01 10:28:24', null, '1');
INSERT INTO `t_info` VALUES ('16', '-2', '劝学楼', '钢笔', '1428135169158.null', '英雄 黑色', '2015-04-04 16:12:49', null, null, '5');
INSERT INTO `t_info` VALUES ('17', '-2', '图书馆', '书包', '1428135606775.image/jpeg', '绿色的', '2015-04-04 16:20:19', null, null, '5');
INSERT INTO `t_info` VALUES ('18', '-2', '图书馆', '书包', '1428135654004.image/jpeg', '绿色的', '2015-04-04 16:21:05', null, null, '5');
INSERT INTO `t_info` VALUES ('19', '-2', '兴文楼', '书包', '1428135909783.jpg', '蓝色的', '2015-04-04 16:25:09', null, null, '5');
INSERT INTO `t_info` VALUES ('20', '-2', '劝学楼', '书包', '1428161556100.jpg', '蓝蓝的。。。', '2015-04-04 23:32:37', null, null, '5');
INSERT INTO `t_info` VALUES ('21', '-2', '劝学楼', '书包', '1428161556100.jpg', '蓝蓝的。。。', '2015-04-05 22:44:30', '2015-04-05 22:45:10', null, '5');
INSERT INTO `t_info` VALUES ('22', '2', 'weqqw', 'weqqw', '', '<p style=\"text-align: right;\">eqq<span style=\"text-decoration:underline;\">wwq</span></p>', '2015-04-07 00:58:39', null, null, '5');
INSERT INTO `t_info` VALUES ('23', '-2', 'dasasa', 'adsadssad', '1428339770558.jpg', '<p>sa</p><hr/><p>s<span style=\"color:#c00000\">asas</span></p>', '2015-04-07 01:02:50', null, null, '5');

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
INSERT INTO `t_user` VALUES ('5', 'll', '刘各22', 'll', '15936596555', 'hnnk@qq.com');
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
