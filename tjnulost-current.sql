/*
Navicat MySQL Data Transfer

Source Server         : loc
Source Server Version : 50539
Source Host           : 127.0.0.1:3306
Source Database       : tjnulost

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2015-03-19 12:14:31
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', null, 'admin', '15936596555', 'hnnk@qq.com', '1');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('1', 'admin');

-- ----------------------------
-- Table structure for t_info
-- ----------------------------
DROP TABLE IF EXISTS `t_info`;
CREATE TABLE `t_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(2) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `pub_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `publish_admin_id` int(11) DEFAULT NULL,
  `publish_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_info
-- ----------------------------
INSERT INTO `t_info` VALUES ('1', '2', 'sdasad', 'dsasd', null, null, null, '0');
INSERT INTO `t_info` VALUES ('2', '2', '11', '11', null, null, null, '0');
INSERT INTO `t_info` VALUES ('3', '2', '123', '123', null, null, null, '5');
INSERT INTO `t_info` VALUES ('4', '2', '00', '00', null, null, null, '5');
INSERT INTO `t_info` VALUES ('5', '-2', '测试', '测试', null, null, null, '5');
INSERT INTO `t_info` VALUES ('6', '-2', '啊哈', '啊哈', null, null, null, '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
