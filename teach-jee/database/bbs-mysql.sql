/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-08-26 15:08:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_board
-- ----------------------------
DROP TABLE IF EXISTS `tbl_board`;
CREATE TABLE `tbl_board` (
  `boardid` int(11) NOT NULL AUTO_INCREMENT,
  `boardname` varchar(50) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`boardid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_board
-- ----------------------------
INSERT INTO `tbl_board` VALUES ('1', '.net版块', '0');
INSERT INTO `tbl_board` VALUES ('2', 'java版块', '0');
INSERT INTO `tbl_board` VALUES ('3', '数据库版块', '0');
INSERT INTO `tbl_board` VALUES ('4', '软件工程版块', '0');
INSERT INTO `tbl_board` VALUES ('5', 'ado.net', '1');
INSERT INTO `tbl_board` VALUES ('6', 'asp.net', '1');
INSERT INTO `tbl_board` VALUES ('7', 'vb.net', '1');
INSERT INTO `tbl_board` VALUES ('8', 'jsp', '2');
INSERT INTO `tbl_board` VALUES ('9', 'struts', '2');
INSERT INTO `tbl_board` VALUES ('10', 'hibernate', '2');
INSERT INTO `tbl_board` VALUES ('11', 'sql', '3');
INSERT INTO `tbl_board` VALUES ('12', 'oracle', '3');
INSERT INTO `tbl_board` VALUES ('13', 'mysql', '3');

-- ----------------------------
-- Table structure for tbl_reply
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reply`;
CREATE TABLE `tbl_reply` (
  `replyid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `publishtime` datetime DEFAULT NULL,
  `modifytime` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `topicid` int(11) DEFAULT NULL,
  PRIMARY KEY (`replyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_reply
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_topic
-- ----------------------------
DROP TABLE IF EXISTS `tbl_topic`;
CREATE TABLE `tbl_topic` (
  `topicid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `publishtime` datetime DEFAULT NULL,
  `modifytime` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `boardid` int(11) DEFAULT NULL,
  PRIMARY KEY (`topicid`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_topic
-- ----------------------------
INSERT INTO `tbl_topic` VALUES ('1', '测试标题1', '测试内容1', '2019-08-26 15:05:58', '2019-08-26 15:05:58', '1', '2');
INSERT INTO `tbl_topic` VALUES ('2', '测试标题2', '测试内容2', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('3', '测试标题3', '测试内容3', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('4', '测试标题4', '测试内容4', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('5', '测试标题5', '测试内容5', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('6', '测试标题6', '测试内容6', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('7', '测试标题7', '测试内容7', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('8', '测试标题8', '测试内容8', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('9', '测试标题9', '测试内容9', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('10', '测试标题10', '测试内容10', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('11', '测试标题11', '测试内容11', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('12', '测试标题12', '测试内容12', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('13', '测试标题13', '测试内容13', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('14', '测试标题14', '测试内容14', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('15', '测试标题15', '测试内容15', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('16', '测试标题16', '测试内容16', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('17', '测试标题17', '测试内容17', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('18', '测试标题18', '测试内容18', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('19', '测试标题19', '测试内容19', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('20', '测试标题20', '测试内容20', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('21', '测试标题21', '测试内容21', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('22', '测试标题22', '测试内容22', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('23', '测试标题23', '测试内容23', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('24', '测试标题24', '测试内容24', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('25', '测试标题25', '测试内容25', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('26', '测试标题26', '测试内容26', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('27', '测试标题27', '测试内容27', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('28', '测试标题28', '测试内容28', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('29', '测试标题29', '测试内容29', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('30', '测试标题30', '测试内容30', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('31', '测试标题31', '测试内容31', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('32', '测试标题32', '测试内容32', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('33', '测试标题33', '测试内容33', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('34', '测试标题34', '测试内容34', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('35', '测试标题35', '测试内容35', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('36', '测试标题36', '测试内容36', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('37', '测试标题37', '测试内容37', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('38', '测试标题38', '测试内容38', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('39', '测试标题39', '测试内容39', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('40', '测试标题40', '测试内容40', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('41', '测试标题41', '测试内容41', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('42', '测试标题42', '测试内容42', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('43', '测试标题43', '测试内容43', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('44', '测试标题44', '测试内容44', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('45', '测试标题45', '测试内容45', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('46', '测试标题46', '测试内容46', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('47', '测试标题47', '测试内容47', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('48', '测试标题48', '测试内容48', '2019-08-26 15:06:19', '2019-08-26 15:06:19', '1', '2');
INSERT INTO `tbl_topic` VALUES ('49', '测试标题49', '测试内容49', '2019-08-26 15:06:20', '2019-08-26 15:06:20', '1', '2');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) DEFAULT NULL,
  `upass` varchar(100) DEFAULT NULL,
  `head` varchar(100) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'a', 'a', '1.gif', '2019-08-25 16:57:54', '1');
