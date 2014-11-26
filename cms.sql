/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2014-11-26 22:22:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `permission_code` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `pid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_19cm2v2q9irnibyextbdgkxmi` (`pid`),
  CONSTRAINT `FK_19cm2v2q9irnibyextbdgkxmi` FOREIGN KEY (`pid`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '系统管理', 'system', '1', null);
INSERT INTO `permission` VALUES ('2', '用户管理', 'system.user', '1', '1');
INSERT INTO `permission` VALUES ('3', '角色管理', 'system.role', '1', '1');
INSERT INTO `permission` VALUES ('4', '权限管理', 'system.permission', '1', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '2014-11-26 22:16:41', '系统管理', 'admin');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `rid` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  KEY `FK_4ynr9t0w2nob78a192y84k7lr` (`pid`),
  KEY `FK_dp6gwvoc3ytvbckpfp8ar7jkd` (`rid`),
  CONSTRAINT `FK_dp6gwvoc3ytvbckpfp8ar7jkd` FOREIGN KEY (`rid`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_4ynr9t0w2nob78a192y84k7lr` FOREIGN KEY (`pid`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('1', '2');
INSERT INTO `role_permission` VALUES ('1', '3');
INSERT INTO `role_permission` VALUES ('1', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', null, '2014-11-26 22:19:24', '2014-11-26 22:19:27', 'slaton@qq.com', '192.168.7.1', '管理员', '3ef7164d1f6167cb9f2658c07d3c2f0a', '吴辉', '1', '2014-11-26 22:20:27', 'admin');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `uid` bigint(20) NOT NULL,
  `rid` bigint(20) NOT NULL,
  KEY `FK_q7oskmwmmyn5usc6cqsi2g28g` (`rid`),
  KEY `FK_r5y4sx1dta0whavqah04r5uu8` (`uid`),
  CONSTRAINT `FK_r5y4sx1dta0whavqah04r5uu8` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_q7oskmwmmyn5usc6cqsi2g28g` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
