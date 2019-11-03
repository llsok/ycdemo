/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : wowo

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2019-09-28 18:24:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `A_ID` int NOT NULL AUTO_INCREMENT,
  `A_NAME` varchar(20) DEFAULT NULL,
  `A_PWD` varchar(20) DEFAULT NULL,
  `A_MARK` varchar(200) DEFAULT NULL,
  `A_STATE` decimal(10,4) NOT NULL,
  PRIMARY KEY (`A_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo` VALUES ('1', 'a', 'a', '描述.....', '1');
INSERT INTO `admininfo` VALUES ('2', 'b', 'a', '描述.....', '1');

-- ----------------------------
-- Table structure for chargeback
-- ----------------------------
DROP TABLE IF EXISTS `chargeback`;
CREATE TABLE `chargeback` (
  `C_ID` int NOT NULL AUTO_INCREMENT,
  `O_ID` int DEFAULT NULL,
  `C_DIS` int DEFAULT NULL,
  `C_DATE` datetime DEFAULT NULL,
  `C_STATE` decimal(10,4) DEFAULT NULL,
  `C_TEMP1` varchar(255) DEFAULT NULL,
  `C_TEMP2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chargeback
-- ----------------------------

-- ----------------------------
-- Table structure for commentinfo
-- ----------------------------
DROP TABLE IF EXISTS `commentinfo`;
CREATE TABLE `commentinfo` (
  `CO_ID` int NOT NULL AUTO_INCREMENT,
  `O_ID` int DEFAULT NULL,
  `M_ID` int DEFAULT NULL,
  `CO_TITLE` varchar(255) DEFAULT NULL,
  `CO_CONTENT` longtext,
  `CO_RANK` decimal(10,4) DEFAULT NULL,
  `CO_PIC` varchar(255) DEFAULT NULL,
  `CO_DATE` datetime DEFAULT NULL,
  `CO_TEMP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commentinfo
-- ----------------------------

-- ----------------------------
-- Table structure for goodinfo
-- ----------------------------
DROP TABLE IF EXISTS `goodinfo`;
CREATE TABLE `goodinfo` (
  `G_ID` int NOT NULL AUTO_INCREMENT,
  `S_ID` int DEFAULT NULL,
  `T_ID` int DEFAULT NULL,
  `G_NAME` varchar(200) DEFAULT NULL,
  `G_MARK` varchar(200) DEFAULT NULL,
  `G_PRICE` decimal(10,4) DEFAULT NULL,
  `G_TEMP1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`G_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodinfo
-- ----------------------------

-- ----------------------------
-- Table structure for goodtype
-- ----------------------------
DROP TABLE IF EXISTS `goodtype`;
CREATE TABLE `goodtype` (
  `T_ID` int NOT NULL AUTO_INCREMENT,
  `T_NAME` varchar(200) DEFAULT NULL,
  `T_DISC` varchar(255) DEFAULT NULL,
  `T_PARENT` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`T_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodtype
-- ----------------------------
INSERT INTO `goodtype` VALUES ('1', '美食', null, '0');

-- ----------------------------
-- Table structure for groupbuy
-- ----------------------------
DROP TABLE IF EXISTS `groupbuy`;
CREATE TABLE `groupbuy` (
  `GB_ID` int NOT NULL AUTO_INCREMENT,
  `GD_NAME` varchar(200) DEFAULT NULL,
  `GD_PRICE` decimal(10,4) DEFAULT NULL,
  `GD_START` datetime DEFAULT NULL,
  `GD_END` datetime DEFAULT NULL,
  `GD_PROMPT` varchar(255) DEFAULT NULL,
  `GD_HOTTIP` varchar(255) DEFAULT NULL,
  `GD_DESCRIBE` varchar(255) DEFAULT NULL,
  `GD_CLICK` decimal(10,4) DEFAULT NULL,
  `GD_NUM` decimal(10,4) DEFAULT NULL,
  `GD_TEMP1` varchar(255) DEFAULT NULL,
  `GD_TEMP2` varchar(255) DEFAULT NULL,
  `GD_IMAGE` varchar(255) DEFAULT NULL,
  `S_ID` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`GB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groupbuy
-- ----------------------------

-- ----------------------------
-- Table structure for logininfo
-- ----------------------------
DROP TABLE IF EXISTS `logininfo`;
CREATE TABLE `logininfo` (
  `L_ID` int NOT NULL AUTO_INCREMENT,
  `M_ID` int DEFAULT NULL,
  `L_IP` varchar(255) DEFAULT NULL,
  `L_DATE` datetime DEFAULT NULL,
  `L_ADDR` varchar(255) DEFAULT NULL,
  `L_STATE` varchar(255) DEFAULT NULL,
  `L_TEMP1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`L_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logininfo
-- ----------------------------

-- ----------------------------
-- Table structure for memberinfo
-- ----------------------------
DROP TABLE IF EXISTS `memberinfo`;
CREATE TABLE `memberinfo` (
  `M_ID` int NOT NULL AUTO_INCREMENT,
  `M_NAME` varchar(20) NOT NULL,
  `M_PWD` varchar(40) NOT NULL,
  `M_TEL` varchar(20) NOT NULL,
  `M_SEX` varchar(4) NOT NULL,
  `M_EMAIL` varchar(50) NOT NULL,
  `M_REG` datetime NOT NULL,
  `M_SCORE` decimal(10,4) NOT NULL,
  `M_RANK` decimal(10,4) DEFAULT NULL,
  `M_MONEY` decimal(10,4) DEFAULT NULL,
  `M_PIC` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`M_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of memberinfo
-- ----------------------------
INSERT INTO `memberinfo` VALUES ('1', 'yt', 'a', '18175970260', '女', 'qing.yt@163.com', '2019-09-28 18:15:26', '0', '1', '0', null);

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `O_ID` int NOT NULL AUTO_INCREMENT,
  `M_ID` int DEFAULT NULL,
  `SM_ID` int DEFAULT NULL,
  `O_NUM` varchar(30) DEFAULT NULL,
  `O_PRICE` decimal(10,4) DEFAULT NULL,
  `O_AMOUNT` decimal(10,4) DEFAULT NULL,
  `O_DATE` datetime DEFAULT NULL,
  `O_STATE` decimal(10,4) DEFAULT NULL,
  `O_DIS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`O_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------

-- ----------------------------
-- Table structure for sellerinfo
-- ----------------------------
DROP TABLE IF EXISTS `sellerinfo`;
CREATE TABLE `sellerinfo` (
  `S_ID` int NOT NULL AUTO_INCREMENT,
  `S_NAME` varchar(20) DEFAULT NULL,
  `S_PWD` varchar(20) DEFAULT NULL,
  `S_TEL` varchar(20) DEFAULT NULL,
  `S_LICENCE` varchar(200) DEFAULT NULL,
  `S_ADDR` varchar(255) DEFAULT NULL,
  `S_EMAIL` varchar(50) DEFAULT NULL,
  `S_PIC` varchar(255) DEFAULT NULL,
  `S_STATE` decimal(10,4) DEFAULT NULL,
  `AUDIT_STATE` decimal(10,4) DEFAULT NULL,
  `S_DATE` datetime DEFAULT NULL,
  `S_TEMP1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`S_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sellerinfo
-- ----------------------------
INSERT INTO `sellerinfo` VALUES ('40001', 'lydia', 'a', '18175970260', null, '湖南省衡阳市珠晖区', 'qing.yt@163.com', null, '1', '1', '2019-09-28 18:15:26', null);

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal` (
  `SM_ID` int NOT NULL AUTO_INCREMENT,
  `GB_ID` int DEFAULT NULL,
  `SM_NAME` varchar(255) DEFAULT NULL,
  `SM_CONTENT` varchar(255) DEFAULT NULL,
  `SM_DIS` varchar(50) DEFAULT NULL,
  `SM_TEMP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
