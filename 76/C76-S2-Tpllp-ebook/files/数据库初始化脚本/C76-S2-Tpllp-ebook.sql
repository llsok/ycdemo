/*
Navicat MySQL Data Transfer

Source Server         : localhost-root:a
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : c76-s2-tpllp-ebook

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2020-01-03 13:40:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` int(11) NOT NULL auto_increment,
  `bname` varchar(200) default NULL,
  `buniversity` varchar(50) default NULL,
  `bucollege` varchar(50) default NULL,
  `bumajor` varchar(50) default NULL,
  `bclass` varchar(50) default NULL,
  `bcontent` varchar(20000) default NULL,
  `bimg` varchar(1000) default NULL,
  `bprice` double(10,1) default NULL,
  `bstate` int(2) default '1',
  `btid` int(11) default NULL,
  `btemp` varchar(30) default NULL,
  `btemp1` varchar(255) default NULL,
  `bnum` int(11) default '1',
  `bauthor` varchar(30) default NULL,
  `bdate` varchar(20) default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '微机原理与接口技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111215479 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871112154792dfedf3.jpg', '29.0', '1', '7', null, null, '736', '吉海彦', '2020-01-01', '0');
INSERT INTO `book` VALUES ('2', '计算机辅助设计AutoCAD', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787508461144 中国水利水电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978750846114415465ac.jpg', '28.0', '1', '7', null, null, '575', '王立峰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('3', '微机原理与接口技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111215479 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871112154792dfedf3.jpg', '29.0', '1', '7', null, null, '736', '吉海彦', '2020-01-01', '0');
INSERT INTO `book` VALUES ('4', '计算机辅助设计AutoCAD', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787508461144 中国水利水电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978750846114415465ac.jpg', '28.0', '1', '7', null, null, '575', '王立峰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('5', '微机原理与接口技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111215479 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871112154792dfedf3.jpg', '29.0', '1', '7', null, null, '736', '吉海彦', '2020-01-01', '0');
INSERT INTO `book` VALUES ('6', '计算机辅助设计AutoCAD', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787508461144 中国水利水电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978750846114415465ac.jpg', '28.0', '1', '7', null, null, '575', '王立峰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('7', '数据库Access2003应用教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787115156020 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787115156020.jpg', '29.0', '1', '7', null, null, '468', '卢湘鸿', '2020-01-01', '0');
INSERT INTO `book` VALUES ('8', '计算机网络技术及应用', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302201199 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730220119919019b0.jpg', '39.0', '1', '7', null, null, '261', '高阳', '2020-01-01', '0');
INSERT INTO `book` VALUES ('9', '遥感导论', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040072648 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978704007264801b91c2.jpg', '35.4', '1', '7', null, null, '211', '梅安新', '2020-01-01', '0');
INSERT INTO `book` VALUES ('10', '办公自动化技术与应用', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787115220813 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711522081302ed2b0.jpg', '32.0', '1', '7', null, null, '210', '李岚', '2020-01-01', '0');
INSERT INTO `book` VALUES ('11', '单片机原理及应用', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787113081850 中国铁道出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711308185008c8802.jpg', '24.0', '1', '7', null, null, '188', '何桥', '2020-01-01', '0');
INSERT INTO `book` VALUES ('12', 'TCP/IP协议与网络管理标准教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '978730215228 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302152286049444e.jpg', '43.0', '1', '7', null, null, '156', '肖新峰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('13', '计算机控制技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111212942 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711121294208a9827.jpg', '29.0', '1', '7', null, null, '146', '于海生', '2020-01-01', '0');
INSERT INTO `book` VALUES ('14', 'C#面向对象程序设计', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787115206565 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787115206565.jpg', '38.0', '1', '7', null, null, '137', '郑宇军', '2020-01-01', '0');
INSERT INTO `book` VALUES ('15', '计算机组成原理学习指导与习题解答', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040176223 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787040176223.jpg', '33.0', '1', '7', null, null, '124', '唐朔飞', '2020-01-01', '0');
INSERT INTO `book` VALUES ('16', '自动控制原理', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111220893 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787111220893.jpg', '36.0', '1', '7', null, null, '117', '孟华', '2020-01-01', '0');
INSERT INTO `book` VALUES ('17', '现场总线与工业以太网及其应用技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111356073 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871113560730f8efe8.jpg', '58.0', '1', '7', null, null, '109', '李正军', '2020-01-01', '0');
INSERT INTO `book` VALUES ('18', '软件工程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302198123 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730219812317ef757.jpg', '29.5', '1', '7', null, null, '103', '张海藩', '2020-01-01', '0');
INSERT INTO `book` VALUES ('19', '微机原理及接口技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111234951 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871112349510e1be9d.jpg', '34.0', '1', '7', null, null, '98', '王惠中', '2020-01-01', '0');
INSERT INTO `book` VALUES ('20', 'ASPNET动态网站设计教程——基础C#', '中南大学', '计算机与信息科学学院', '软件工程', '大二', 'Server 李春葆', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302251224063e602.jpg', '39.0', '1', '7', null, null, '94', 'SQL', '2020-01-01', '0');
INSERT INTO `book` VALUES ('21', '程序员考试辅导', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '浓林兴 9787560614359', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978756061435905fe525.jpg', '40.0', '1', '7', null, null, '87', '张淑平', '2020-01-01', '0');
INSERT INTO `book` VALUES ('22', '现代交换原理与通信网技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787563510559 北京邮电大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787563510559.jpg', '36.0', '1', '7', null, null, '85', '卞佳丽', '2020-01-01', '0');
INSERT INTO `book` VALUES ('23', '地理信息系统原理及应用', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787030216618 科学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870302166180f34fde.jpg', '32.0', '1', '7', null, null, '76', '刘贵明', '2020-01-01', '0');
INSERT INTO `book` VALUES ('24', '计算机网络', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111229681 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871112296810ed8e0c.jpg', '35.0', '1', '7', null, null, '72', '蔡开裕', '2020-01-01', '0');
INSERT INTO `book` VALUES ('25', '过程控制系统', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111250425 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787111250425.jpg', '30.0', '1', '7', null, null, '72', '郭一楠', '2020-01-01', '0');
INSERT INTO `book` VALUES ('26', '计算机导论实验教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787030161222 科学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787030161222159d553.jpg', '22.0', '1', '7', null, null, '71', '陈叶芳', '2020-01-01', '0');
INSERT INTO `book` VALUES ('27', '面向对象程序设计Java', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787560616056 西安电子科技大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787560616056.jpg', '26.0', '1', '7', null, null, '69', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('28', '系统分析与设计', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302193814 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302193814168f650.jpg', '43.0', '1', '7', null, null, '67', '李代平', '2020-01-01', '0');
INSERT INTO `book` VALUES ('29', '地理信息系统教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787307034327 武汉大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730703432719c7924.jpg', '29.0', '1', '7', null, null, '65', '胡鹏', '2020-01-01', '0');
INSERT INTO `book` VALUES ('30', '平面动画制作Flash', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040225846 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787040225846003604b.jpg', '22.3', '1', '7', null, null, '64', '李淑华', '2020-01-01', '0');
INSERT INTO `book` VALUES ('31', '计算机组成原理与汇编语言', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302193319 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730219331918b9844.jpg', '39.0', '1', '7', null, null, '59', '易小琳', '2020-01-01', '0');
INSERT INTO `book` VALUES ('32', 'Web开发技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040202250 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787040202250103a0cf.jpg', '29.3', '1', '7', null, null, '58', '郝兴伟', '2020-01-01', '0');
INSERT INTO `book` VALUES ('33', '局域网技术与组网工程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302217442 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730221744203cd374.jpg', '29.5', '1', '7', null, null, '58', '苗凤君', '2020-01-01', '0');
INSERT INTO `book` VALUES ('34', 'Delphi面向对象程序设计', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040160666 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787040160666065a66f.jpg', '28.0', '1', '7', null, null, '56', '李俊平', '2020-01-01', '0');
INSERT INTO `book` VALUES ('35', '计算机网络简明教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787121051319 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978712105131900e6071.jpg', '25.0', '1', '7', null, null, '54', '谢希仁', '2020-01-01', '0');
INSERT INTO `book` VALUES ('36', '我的J2EE成功之路', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787121094675 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978712109467511a31a6.jpg', '79.0', '1', '7', null, null, '53', '郭锋', '2020-01-01', '0');
INSERT INTO `book` VALUES ('37', '网页设计与制作', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040214758 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978704021475809879ba.jpg', '20.8', '1', '7', null, null, '49', '李京文', '2020-01-01', '0');
INSERT INTO `book` VALUES ('38', '数据库系统简明教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040154733 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978704015473308f88b6.jpg', '25.1', '1', '7', null, null, '48', '王珊', '2020-01-01', '0');
INSERT INTO `book` VALUES ('39', '智能控制理论及应用', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111229223 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711122922304d9418.jpg', '24.0', '1', '7', null, null, '47', '王耀南', '2020-01-01', '0');
INSERT INTO `book` VALUES ('40', '计算机电子电路技术电路与模拟电子部分', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787560607757 西安电子科技大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875606077570c0dc1d.jpg', '25.0', '1', '7', null, null, '44', '江晓安', '2020-01-01', '0');
INSERT INTO `book` VALUES ('41', '计算机导论', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787121016486 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871210164860c2dc68.jpg', '20.0', '1', '7', null, null, '43', '朱战立', '2020-01-01', '0');
INSERT INTO `book` VALUES ('42', 'Linux操作系统', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787121053948 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787121053948026f224.jpg', '38.0', '1', '7', null, null, '42', '邵国金', '2020-01-01', '0');
INSERT INTO `book` VALUES ('43', '计算机系统结构', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040232547 高等教育出版社　', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978704023254716d5626.jpg', '33.0', '1', '7', null, null, '42', '张晨曦', '2020-01-01', '0');
INSERT INTO `book` VALUES ('44', '软件工程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787115210265 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787115210265.jpg', '39.8', '1', '7', null, null, '41', '郑人杰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('45', 'Visual', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '第三版 黄维', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873022569460071029.jpg', '36.0', '1', '7', null, null, '36', 'C++面向对象与可视化程序设计', '2020-01-01', '0');
INSERT INTO `book` VALUES ('46', 'Access2003数据库技术及应用', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040245271 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787040245271012a1b5.jpg', '19.4', '1', '7', null, null, '35', '李雁翎', '2020-01-01', '0');
INSERT INTO `book` VALUES ('47', 'java2面向对象程序设计', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '何嘉 9787113058678', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871130586780b02b40.jpg', '30.0', '1', '7', null, null, '34', '洪维恩', '2020-01-01', '0');
INSERT INTO `book` VALUES ('48', 'C#NET程序设计教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302218661 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302218661099f9e4.jpg', '45.0', '1', '7', null, null, '34', '江红', '2020-01-01', '0');
INSERT INTO `book` VALUES ('49', '数字图像处理基础', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302196112 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730219611213b63ad.jpg', '35.0', '1', '7', null, null, '33', '阮秋琦', '2020-01-01', '0');
INSERT INTO `book` VALUES ('50', '微机原理与接口技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787508477077 中国水利水电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787508477077.jpg', '35.0', '1', '7', null, null, '32', '李云强', '2020-01-01', '0');
INSERT INTO `book` VALUES ('51', 'Java语言程序设计', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '马皓 9787302111450', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302111450013312f.jpg', '35.0', '1', '7', null, null, '32', '吕凤翥', '2020-01-01', '0');
INSERT INTO `book` VALUES ('52', 'ARM嵌入式系统原理及应用开发', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787560627366 西安电子科技大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978756062736600380c1.jpg', '43.0', '1', '7', null, null, '32', '谭会生', '2020-01-01', '0');
INSERT INTO `book` VALUES ('53', 'MCS51单片机原理及接口技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '马家辰 9787560312071', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787560312071.jpg', '26.0', '1', '7', null, null, '31', '修订版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('54', '单片机原理与应用技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787301107607 北京大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787301107607.jpg', '25.0', '1', '7', null, null, '31', '魏立峰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('55', '大学计算机基础教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302201519 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873022015190e8ae34.jpg', '32.0', '1', '8', null, null, '30', '刘学民', '2020-01-01', '0');
INSERT INTO `book` VALUES ('56', '工业机器人运用技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787030222305 科学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870302223050ac2ac1.jpg', '27.0', '1', '8', null, null, '30', '郭洪红', '2020-01-01', '0');
INSERT INTO `book` VALUES ('57', 'Visual', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '第2版 黄维通', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302082019172e725.jpg', '32.0', '1', '8', null, null, '28', 'C++面向对象与可视化程序设计', '2020-01-01', '0');
INSERT INTO `book` VALUES ('58', '控制工程基础', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787512404267 北京航空航天大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787512404267.jpg', '25.5', '1', '8', null, null, '27', '王华', '2020-01-01', '0');
INSERT INTO `book` VALUES ('59', 'DSP技术及应用', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787121047299 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787121047299142341c.jpg', '23.0', '1', '8', null, null, '26', '黄仁欣', '2020-01-01', '0');
INSERT INTO `book` VALUES ('60', 'UML系统建模与分析设计', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111213840 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871112138403af5a0b.jpg', '33.0', '1', '8', null, null, '25', '刁成嘉', '2020-01-01', '0');
INSERT INTO `book` VALUES ('61', 'J2ME移动应用开发', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '李向前 9787810828079', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787810828079091a9e5.jpg', '45.0', '1', '8', null, null, '25', '郝玉龙', '2020-01-01', '0');
INSERT INTO `book` VALUES ('62', 'ARM嵌入式系统教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111245537 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871112455370a91a53.jpg', '33.0', '1', '8', null, null, '25', '张石', '2020-01-01', '0');
INSERT INTO `book` VALUES ('63', 'MATLAB程序设计与工程应用', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302247685 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302247685023d24d.jpg', '39.0', '1', '8', null, null, '24', '张德丰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('64', 'Java程序设计', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302235057 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873022350570f65fe0.jpg', '33.0', '1', '8', null, null, '24', '陆晶', '2020-01-01', '0');
INSERT INTO `book` VALUES ('65', 'JSP动态网站设计项目教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787300120607 中国人民大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873001206070f36f11.jpg', '28.0', '1', '8', null, null, '24', '张兴科', '2020-01-01', '0');
INSERT INTO `book` VALUES ('66', '计算机导论', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787563509720 北京邮电大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875635097201b60be3.jpg', '28.0', '1', '8', null, null, '24', '甘岚', '2020-01-01', '0');
INSERT INTO `book` VALUES ('67', 'Eclipse与J2EE应用开发', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787301130681 北京大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873011306810a12af4.jpg', '44.0', '1', '8', null, null, '23', '李长云', '2020-01-01', '0');
INSERT INTO `book` VALUES ('68', '自动控制原理简明教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787030116192 科学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787030116192.jpg', '25.0', '1', '8', null, null, '22', '胡寿松', '2020-01-01', '0');
INSERT INTO `book` VALUES ('69', 'Java程序设计之网络编程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302123224 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302123224170a719.jpg', '39.0', '1', '8', null, null, '21', '李芝兴', '2020-01-01', '0');
INSERT INTO `book` VALUES ('70', 'J2ME实用教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787115163141 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871151631410d25d8b.jpg', '25.0', '1', '8', null, null, '21', '李新力', '2020-01-01', '0');
INSERT INTO `book` VALUES ('71', '人工智能教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040232615 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870402326151fb1f08.jpg', '30.5', '1', '8', null, null, '20', '张仰森', '2020-01-01', '0');
INSERT INTO `book` VALUES ('72', '计算机网络安全基础', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '第三版 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787115169150061d62b.jpg', '35.0', '1', '8', null, null, '20', '袁津生', '2020-01-01', '0');
INSERT INTO `book` VALUES ('73', '信息系统分析与设计', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111234845 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711123484507c2765.jpg', '31.0', '1', '8', null, null, '20', '姜同强', '2020-01-01', '0');
INSERT INTO `book` VALUES ('74', '计算机辅助设计与制造', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040145168 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787040145168.jpg', '34.1', '1', '8', null, null, '20', '刘极峰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('75', '网络工程设计教程系统集成方法', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '第二版 9787111237112', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711123711206f36a7.jpg', '33.0', '1', '8', null, null, '19', '陈鸣', '2020-01-01', '0');
INSERT INTO `book` VALUES ('76', '单片机原理及其接口技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787508379869 中国电力出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978750837986916f669c.jpg', '19.0', '1', '8', null, null, '19', '王懿华', '2020-01-01', '0');
INSERT INTO `book` VALUES ('77', '面向对象程序设计及C', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787115170347 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787115170347056a5ec.jpg', '25.0', '1', '8', null, null, '19', '朱立华', '2020-01-01', '0');
INSERT INTO `book` VALUES ('78', '信息经济学', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040106244 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787040106244.jpg', '19.3', '1', '8', null, null, '17', '乌家培', '2020-01-01', '0');
INSERT INTO `book` VALUES ('79', '软件测试工具实用教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302201243 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730220124301e51f8.jpg', '23.0', '1', '8', null, null, '17', '程宝雷', '2020-01-01', '0');
INSERT INTO `book` VALUES ('80', '单片机原理与应用设计', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787560327020 哈尔滨工业大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875603270201506551.jpg', '30.0', '1', '8', null, null, '17', '张毅刚', '2020-01-01', '0');
INSERT INTO `book` VALUES ('81', '网络化办公应用教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '孙印杰 9787121091445', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871210914451573549.jpg', '29.8', '1', '8', null, null, '17', '修订版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('82', 'SketchUp', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '童滋雨 9787112093564', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871120935641ad3a49.jpg', '46.0', '1', '8', null, null, '16', '建筑建模详解教程', '2020-01-01', '0');
INSERT INTO `book` VALUES ('83', '无线网络技术导论', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302168713 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021687130149169.jpg', '27.0', '1', '8', null, null, '16', '汪涛', '2020-01-01', '0');
INSERT INTO `book` VALUES ('84', 'UML基础与Rose建模实用教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '沈懿卓 97873021', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021853900a8bad3.jpg', '39.0', '1', '8', null, null, '16', '谢星星', '2020-01-01', '0');
INSERT INTO `book` VALUES ('85', '自动控制原理', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787508438832 中国水利水电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875084388320fbcfed.jpg', '27.5', '1', '8', null, null, '15', '田思庆', '2020-01-01', '0');
INSERT INTO `book` VALUES ('86', 'MATLAB数学实验', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040193695 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787040193695.jpg', '24.2', '1', '8', null, null, '15', '胡良剑', '2020-01-01', '0');
INSERT INTO `book` VALUES ('87', '计算机组成原理教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '张基温 9787302164203', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730216420303323e0.jpg', '25.0', '1', '8', null, null, '15', '第四版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('88', '软件工程经济学', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787560621050 西安电子科技大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875606210500ea1e23.jpg', '23.0', '1', '8', null, null, '15', '赵玮', '2020-01-01', '0');
INSERT INTO `book` VALUES ('89', '计算机网络', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302067061 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730206706106af67b.jpg', '34.0', '1', '8', null, null, '14', '吴功宜', '2020-01-01', '0');
INSERT INTO `book` VALUES ('90', '数据结构及应用算法教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302040125 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787302040125.jpg', '29.0', '1', '8', null, null, '14', '严蔚敏', '2020-01-01', '0');
INSERT INTO `book` VALUES ('91', 'UML统一建模实用教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302195603 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302195603179871c.jpg', '28.0', '1', '8', null, null, '14', '王先国', '2020-01-01', '0');
INSERT INTO `book` VALUES ('92', '自动控制原理', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111209553 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871112095530d83db8.jpg', '35.0', '1', '8', null, null, '14', '任彦硕', '2020-01-01', '0');
INSERT INTO `book` VALUES ('93', '计算机网络安全', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787115124982 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787115124982007e0a1.jpg', '31.0', '1', '8', null, null, '13', '邓亚平', '2020-01-01', '0');
INSERT INTO `book` VALUES ('94', '单片机原理与应用设计', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '彭喜元 9787121061622', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978712106162208bf810.jpg', '29.5', '1', '8', null, null, '13', '张毅刚', '2020-01-01', '0');
INSERT INTO `book` VALUES ('95', '中文Premiere', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '陈明红 978750', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978750276251309da981.jpg', '45.0', '1', '8', null, null, '13', 'Pro影视动画非线性编辑', '2020-01-01', '0');
INSERT INTO `book` VALUES ('96', '网页设计解析', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787302195238 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021952381c4cc0c.jpg', '62.0', '1', '8', null, null, '13', '周陟', '2020-01-01', '0');
INSERT INTO `book` VALUES ('97', '微机原理与接口技术', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '牛勇 9787560953496', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978756095349611231e9.jpg', '39.6', '1', '8', null, null, '13', '谢维成', '2020-01-01', '0');
INSERT INTO `book` VALUES ('98', '单片微型机原理应用与实验', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '张友德 9787309051490', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873090514901d8dd7c.jpg', '36.0', '1', '8', null, null, '13', '第五版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('99', '数据结构——C语言描述', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787040164572 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787040164572029e270.jpg', '28.0', '1', '8', null, null, '12', '耿国华', '2020-01-01', '0');
INSERT INTO `book` VALUES ('100', '网页制作与开发教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787115177919 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871151779191a81a38.jpg', '28.0', '1', '8', null, null, '12', '张强', '2020-01-01', '0');
INSERT INTO `book` VALUES ('101', '软件技术基础', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787115086167 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787115086167.jpg', '30.0', '1', '8', null, null, '12', '冯博琴', '2020-01-01', '0');
INSERT INTO `book` VALUES ('102', '软件测试教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787111248972 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787111248972038735d.jpg', '29.0', '1', '8', null, null, '12', '宫云战', '2020-01-01', '0');
INSERT INTO `book` VALUES ('103', '信息管理学教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '杜栋 9787302144861', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021448610b96bfd.jpg', '25.0', '1', '8', null, null, '12', '第三版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('104', '多媒体技术教程', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '胡晓锋 9787115138989', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871151389891a99a4d.jpg', '29.0', '1', '8', null, null, '11', '修订版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('105', '自动控制原理', '中南大学', '计算机与信息科学学院', '软件工程', '大二', '9787502536336 化学工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787502536336024f2ea.jpg', '39.0', '1', '8', null, null, '11', '孙德宝', '2020-01-01', '0');
INSERT INTO `book` VALUES ('106', '机器人技术基础', '中南大学', '计算机与信息科学学院', '软件工程', '大一', '9787040193053 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870401930530cb9cc0.jpg', '29.5', '1', '8', null, null, '11', '刘极峰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('107', '会计信息系统实践教程', '中南大学', '计算机与信息科学学院', '软件工程', '大一', '9787542929136 立信会计出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787542929136023523e.jpg', '39.0', '1', '8', null, null, '11', '徐玮', '2020-01-01', '0');
INSERT INTO `book` VALUES ('108', '网络工程设计与实践', '中南大学', '计算机与信息科学学院', '软件工程', '大一', '9787560615530 西安电子科技大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787560615530.jpg', '31.0', '1', '8', null, null, '11', '夏靖波', '2020-01-01', '0');
INSERT INTO `book` VALUES ('109', '网页设计三合一实训教程', '湖南大学', '机械学院', '机械设计制造及其自动化', '大四', '马晓峰编 978711308', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711308048807da736.jpg', '30.0', '1', '8', null, null, '10', '王兴玲', '2020-01-01', '0');
INSERT INTO `book` VALUES ('110', '多媒体技术基础与应用', '湖南大学', '机械学院', '机械设计制造及其自动化', '大四', '鄂大伟 978704013325', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978704013325713b934c.jpg', '28.9', '1', '8', null, null, '10', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('111', 'ARM嵌入式系统实验教程', '湖南大学', '机械学院', '机械设计制造及其自动化', '大四', '周立功 9787810775762', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787810775762.jpg', '26.0', '1', '8', null, null, '10', '一', '2020-01-01', '0');
INSERT INTO `book` VALUES ('112', '软件工程方法与实践', '湖南大学', '机械学院', '机械设计制造及其自动化', '大四', '9787121049569 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871210495691cdac21.jpg', '28.5', '1', '8', null, null, '10', '许家珆', '2020-01-01', '0');
INSERT INTO `book` VALUES ('113', 'Visual', '湖南大学', '机械学院', '机械设计制造及其自动化', '大二', '第二版 温', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730218621208ff8f4.jpg', '33.0', '1', '8', null, null, '10', 'C++面向对象程序设计教程与实验', '2020-01-01', '0');
INSERT INTO `book` VALUES ('114', '软件测试技术基础', '湖南大学', '机械学院', '机械设计制造及其自动化', '大二', '9787302174936 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021749360fa4f2d.jpg', '19.8', '1', '8', null, null, '10', '陈汶滨', '2020-01-01', '0');
INSERT INTO `book` VALUES ('115', 'PHOTOSHOP基础教程', '湖南大学', '机械学院', '机械设计制造及其自动化', '大二', '丁易名 9787811272703', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97878112727032a3eae7.jpg', '46.8', '1', '8', null, null, '9', '周雅铭', '2020-01-01', '0');
INSERT INTO `book` VALUES ('116', '计算机图形学', '湖南大学', '机械学院', '机械设计制造及其自动化', '大二', '何援军 9787111182344', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711118234416cd624.jpg', '33.0', '1', '8', null, null, '9', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('117', 'C程序设计题解与上机指导', '湖南大学', '机械学院', '机械设计制造及其自动化', '大一', '谭浩强 978730203', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873020391120132163.jpg', '19.5', '1', '8', null, null, '9', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('118', 'JSP程序设计教程', '湖南大学', '机械学院', '机械设计制造及其自动化', '大一', '9787115139696 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787115139696.jpg', '25.0', '1', '8', null, null, '9', '向学哲', '2020-01-01', '0');
INSERT INTO `book` VALUES ('119', '多媒体实用教程', '湖南大学', '机械学院', '机械设计制造及其自动化', '大一', '9787121047565 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871210475650da9db6.jpg', '39.0', '1', '8', null, null, '9', '郑阿奇', '2020-01-01', '0');
INSERT INTO `book` VALUES ('120', '动画片场景设计与镜头运用', '湖南大学', '机械学院', '机械设计制造及其自动化', '大一', '赵前 何嵘', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873001107830ed1eb6.jpg', '64.0', '1', '8', null, null, '9', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('121', '80X86汇编语言程序设计', '湖南大学', '机械学院', '机械设计制造及其自动化', '大一', '9787560933573 华中科技大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978756093357300ac0d7.jpg', '32.0', '1', '9', null, null, '9', '王元珍', '2020-01-01', '0');
INSERT INTO `book` VALUES ('122', '汇编语言与接口技术', '湖南大学', '计算机与信息科学学院', '物联网工程', '大三', '9787111168058 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871111680580f47ff3.jpg', '27.0', '1', '9', null, null, '9', '叶继华', '2020-01-01', '0');
INSERT INTO `book` VALUES ('123', 'Linux基础教程', '湖南大学', '计算机与信息科学学院', '物联网工程', '大三', '9787302204442 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730220444204ab475.jpg', '26.0', '1', '9', null, null, '9', '孟庆昌', '2020-01-01', '0');
INSERT INTO `book` VALUES ('124', 'ASPNET', '湖南大学', '计算机与信息科学学院', '物联网工程', '大三', '郑阿奇 9787121090509', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978712109050929cc9d2.jpg', '46.0', '1', '9', null, null, '8', '35实用教程', '2020-01-01', '0');
INSERT INTO `book` VALUES ('125', '单片机原理与接口技术', '湖南大学', '计算机与信息科学学院', '物联网工程', '大三', '9787121056239 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978712105623900ec098.jpg', '32.0', '1', '9', null, null, '8', '牛昱光', '2020-01-01', '0');
INSERT INTO `book` VALUES ('126', '2013版计算机组成原理高分笔记', '湖南大学', '计算机与信息科学学院', '物联网工程', '大二', '9787111388463 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711138846307ae7ef.jpg', '39.0', '1', '9', null, null, '7', '周伟', '2020-01-01', '0');
INSERT INTO `book` VALUES ('127', '计算机控制系统', '湖南大学', '计算机与信息科学学院', '物联网工程', '大一', '9787040164329 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870401643290d02db6.jpg', '28.0', '1', '9', null, null, '7', '李元春', '2020-01-01', '0');
INSERT INTO `book` VALUES ('128', 'C++面向对象程序设计', '湖南大学', '计算机与信息科学学院', '信息工程', '大四', '冯建华 9787302124115', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730212411501ad16a.jpg', '34.0', '1', '9', null, null, '7', '王萍', '2020-01-01', '0');
INSERT INTO `book` VALUES ('129', '计算机导论', '湖南大学', '计算机与信息科学学院', '信息工程', '大四', '9787302181606 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730218160615db598.jpg', '28.0', '1', '9', null, null, '7', '陈明', '2020-01-01', '0');
INSERT INTO `book` VALUES ('130', '人工智能导论', '湖南大学', '计算机与信息科学学院', '信息工程', '大四', '9787030166999 科学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978703016699912702e4.jpg', '33.0', '1', '9', null, null, '6', '王勋', '2020-01-01', '0');
INSERT INTO `book` VALUES ('131', 'ASPNET实用教程', '湖南大学', '计算机与信息科学学院', '网络工程', '大四', '9787121002861 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787121002861.jpg', '28.0', '1', '9', null, null, '6', '邓阿奇', '2020-01-01', '0');
INSERT INTO `book` VALUES ('132', '微型计算机接口技术', '湖南大学', '计算机与信息科学学院', '网络工程', '大四', '9787111144014 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871111440140ccfc05.jpg', '30.0', '1', '9', null, null, '6', '张弥左', '2020-01-01', '0');
INSERT INTO `book` VALUES ('133', '计算机软件技术基础', '湖南大学', '计算机与信息科学学院', '网络工程', '大四', '麦中凡 9787040115628', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870401156280491441.jpg', '32.0', '1', '9', null, null, '6', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('134', '数据库应用基础基于Visual', '湖南大学', '计算机与信息科学学院', '信息工程', '大一', '90 第2版', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871211539380b40be2.jpg', '39.9', '1', '9', null, null, '6', 'FoxPro', '2020-01-01', '0');
INSERT INTO `book` VALUES ('135', 'C#程序设计基础教程与实验指导', '湖南大学', '计算机与信息科学学院', '信息工程', '大一', '冉晓旻 97873', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021758651cb5ccd.jpg', '39.0', '1', '9', null, null, '6', '孙晓非', '2020-01-01', '0');
INSERT INTO `book` VALUES ('136', '多媒体技术基础', '湖南大学', '计算机与信息科学学院', '信息工程', '大一', '9787508427829 中国水利水电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787508427829039c36c.jpg', '29.5', '1', '9', null, null, '6', '雷运发', '2020-01-01', '0');
INSERT INTO `book` VALUES ('137', '从理论到实践Fedord', '湖南大学', '计算机与信息科学学院', '软件工程', '大四', '李蔚泽 9787030240439', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978703024043916a868f.jpg', '55.0', '1', '9', null, null, '5', 'Liunx全方位学习', '2020-01-01', '0');
INSERT INTO `book` VALUES ('138', '数字图像处理', '湖南大学', '计算机与信息科学学院', '软件工程', '大四', '9787111180098 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711118009801cb10b.jpg', '33.0', '1', '9', null, null, '5', '姚敏', '2020-01-01', '0');
INSERT INTO `book` VALUES ('139', '微型计算机控制技术实用教程', '湖南大学', '计算机与信息科学学院', '软件工程', '大四', '9787121020506 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978712102050605ef533.jpg', '29.0', '1', '9', null, null, '5', '潘新民', '2020-01-01', '0');
INSERT INTO `book` VALUES ('140', '有限元法及ANSYS程序应用基础', '湖南大学', '计算机与信息科学学院', '软件工程', '大四', '9787030227355 科学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978703022735500970bc.jpg', '25.0', '1', '9', null, null, '5', '张力', '2020-01-01', '0');
INSERT INTO `book` VALUES ('141', '地理信息系统', '湖南大学', '计算机与信息科学学院', '软件工程', '大四', '9787040155174 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787040155174.jpg', '26.5', '1', '9', null, null, '5', '陆守一', '2020-01-01', '0');
INSERT INTO `book` VALUES ('142', '全国计算机等级考试二级教程公共基础知识', '湖南大学', '计算机与信息科学学院', '软件工程', '大四', '教育部考试中心 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/其他/978704031100617f97b3.jpg', '19.0', '1', '9', null, null, '5', '2011年', '2020-01-01', '0');
INSERT INTO `book` VALUES ('143', '计算机网络操作系统原理与运用', '湖南大学', '计算机与信息科学学院', '软件工程', '大二', '978711118336 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787111183365229b24b.jpg', '29.0', '1', '9', null, null, '5', '孔宪君', '2020-01-01', '0');
INSERT INTO `book` VALUES ('144', '安全人机工程学', '湖南大学', '计算机与信息科学学院', '软件工程', '大二', '9787502021719 煤炭工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787502021719033b3db.jpg', '30.5', '1', '9', null, null, '5', '欧阳文昭', '2020-01-01', '0');
INSERT INTO `book` VALUES ('145', 'C++程序设计基础', '湖南大学', '计算机与信息科学学院', '软件工程', '大一', '张基温 9787040123029', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870401230290cfec6a.jpg', '25.7', '1', '9', null, null, '5', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('146', 'Visual', '湖南大学', '计算机与信息科学学院', '软件工程', '大一', '第二版 刘', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871131009571059080.jpg', '21.0', '1', '9', null, null, '5', 'FoxPro程序设计习题及实验指导', '2020-01-01', '0');
INSERT INTO `book` VALUES ('147', '软件测试实用技术与常用模板', '南开大学', '机械学院', '机械设计制造及其自动化', '大四', '9787111319504 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787111319504015c144.jpg', '45.0', '1', '9', null, null, '5', '李龙', '2020-01-01', '0');
INSERT INTO `book` VALUES ('148', '信息论基础教程', '南开大学', '机械学院', '机械设计制造及其自动化', '大四', '9787563509102 北京邮电大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875635091020c1dc58.jpg', '22.0', '1', '9', null, null, '5', '李亦农', '2020-01-01', '0');
INSERT INTO `book` VALUES ('149', '计算机软件技术基础', '南开大学', '机械学院', '机械设计制造及其自动化', '大四', '席晓慧 9787563508617', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875635086170f04f40.jpg', '28.0', '1', '9', null, null, '5', '王永玲', '2020-01-01', '0');
INSERT INTO `book` VALUES ('150', '系统工程教程', '南开大学', '机械学院', '机械设计制造及其自动化', '大四', '9787810826921 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787810826921088f847.jpg', '30.0', '1', '9', null, null, '5', '喻湘存', '2020-01-01', '0');
INSERT INTO `book` VALUES ('151', '信息管理学', '南开大学', '机械学院', '机械设计制造及其自动化', '大四', '9787040118414 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978704011841403073ce.jpg', '30.6', '1', '9', null, null, '5', '杨善林', '2020-01-01', '0');
INSERT INTO `book` VALUES ('152', '实用化学化工计算机软件基础', '南开大学', '机械学院', '机械设计制造及其自动化', '大二', '田文德 978712205', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978712205282723e434d.jpg', '19.8', '1', '9', null, null, '5', '汪海', '2020-01-01', '0');
INSERT INTO `book` VALUES ('153', '现代软件工程', '南开大学', '机械学院', '机械设计制造及其自动化', '大二', '9787111253525 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711125352505bf599.jpg', '45.0', '1', '9', null, null, '5', '张家浩', '2020-01-01', '0');
INSERT INTO `book` VALUES ('154', '旧书', '南开大学', '机械学院', '机械设计制造及其自动化', '大二', '谭浩强 9787302159704', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021597040bb5b41.jpg', '28.0', '1', '9', null, null, '5', 'C程序设计教程学习辅导', '2020-01-01', '0');
INSERT INTO `book` VALUES ('155', '嵌入式Linux应用编程', '南开大学', '机械学院', '机械设计制造及其自动化', '大二', '贾智平 9787111204831', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711120483103bc3d3.jpg', '29.0', '1', '9', null, null, '5', '许信顺', '2020-01-01', '0');
INSERT INTO `book` VALUES ('156', 'Java面向对象程序设计教程', '南开大学', '机械学院', '机械设计制造及其自动化', '大一', '李发致 9787302', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873022065070aeaa59.jpg', '39.5', '1', '9', null, null, '5', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('157', '计算机网络系统集成', '南开大学', '计算机与信息科学学院', '物联网工程', '大四', '李战国 9787301104637', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787301104637026a24d.jpg', '22.0', '1', '9', null, null, '5', '斯桃枝', '2020-01-01', '0');
INSERT INTO `book` VALUES ('158', 'VisualFoxPro程序设计教程', '南开大学', '计算机与信息科学学院', '物联网工程', '大四', '孟宪平 9787313042880', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873130428800cc0cf9.jpg', '29.0', '1', '9', null, null, '5', '孟宪平 ', '2020-01-01', '0');
INSERT INTO `book` VALUES ('159', 'ASPNET20程序设计案例教程', '南开大学', '计算机与信息科学学院', '物联网工程', '大四', '马瑞新 9787302197652', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730219765213e13b9.jpg', '39.0', '1', '9', null, null, '5', '马瑞新', '2020-01-01', '0');
INSERT INTO `book` VALUES ('160', '微机原理与接口技术', '南开大学', '计算机与信息科学学院', '物联网工程', '大三', '陈建铎 9787040232264', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870402322640e56e62.jpg', '25.4', '1', '9', null, null, '4', '陈建铎', '2020-01-01', '0');
INSERT INTO `book` VALUES ('161', 'UML系统建模与分析设计课程设计', '南开大学', '计算机与信息科学学院', '物联网工程', '大三', '9787111224761 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787111224761.jpg', '24.0', '1', '9', null, null, '4', '刁奕', '2020-01-01', '0');
INSERT INTO `book` VALUES ('162', '数据库原理及应用', '南开大学', '计算机与信息科学学院', '物联网工程', '大二', '钱雪忠 9787563514700', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978756351470043423b0.jpg', '29.8', '1', '9', null, null, '4', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('163', '信息资源管理', '南开大学', '计算机与信息科学学院', '物联网工程', '大二', '方美琪 9787040226874', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870402268740b6cb53.jpg', '34.4', '1', '9', null, null, '4', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('164', '单片机的C语言应用程序设计', '南开大学', '计算机与信息科学学院', '物联网工程', '大二', '第4版 9787810779722', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97878107797220d27d3a.jpg', '32.0', '1', '9', null, null, '4', '马忠梅', '2020-01-01', '0');
INSERT INTO `book` VALUES ('165', 'Excel在市场调查工作中的应用', '南开大学', '计算机与信息科学学院', '物联网工程', '大一', '9787500669838 中国青年出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875006698381c0fc05.jpg', '22.0', '1', '9', null, null, '4', '何俊', '2020-01-01', '0');
INSERT INTO `book` VALUES ('166', '信息系统分析与设计', '南开大学', '计算机与信息科学学院', '物联网工程', '大一', '9787302193692 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730219369210f108e.jpg', '19.0', '1', '9', null, null, '4', '卫红春', '2020-01-01', '0');
INSERT INTO `book` VALUES ('167', '信息科学与技术导论', '南开大学', '计算机与信息科学学院', '信息工程', '大四', '9787563515370 北京邮电大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875635153701872872.jpg', '26.0', '1', '9', null, null, '4', '钟义信', '2020-01-01', '0');
INSERT INTO `book` VALUES ('168', '网络测试与故障诊断实验教程', '南开大学', '计算机与信息科学学院', '信息工程', '大四', '洪飞 978730213', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021340080ed4e72.jpg', '17.0', '1', '9', null, null, '4', '曹庆华', '2020-01-01', '0');
INSERT INTO `book` VALUES ('169', 'VisualFoxPro数据库应用技术', '南开大学', '计算机与信息科学学院', '信息工程', '大二', ' 9787040151183', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870401511830946917.jpg', '23.0', '1', '9', null, null, '4', '李雁翎', '2020-01-01', '0');
INSERT INTO `book` VALUES ('170', 'VisualFoxPro程序设计基础与项目实训', '南开大学', '计算机与信息科学学院', '信息工程', '大二', 'FoxPro程序设计基础与项目实训', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873000993610fd4f38.jpg', '38.0', '1', '9', null, null, '4', '孙承爱 李堂', '2020-01-01', '0');
INSERT INTO `book` VALUES ('171', 'C语言大学实用教程学习指导', '南开大学', '计算机与信息科学学院', '信息工程', '大二', '苏小红 97871210', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871210906841548541.jpg', '32.0', '1', '9', null, null, '4', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('172', '数字图像处理', '南开大学', '计算机与信息科学学院', '信息工程', '大二', '9787302148852 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302148852128b2c4.jpg', '29.0', '1', '9', null, null, '4', '陈天华', '2020-01-01', '0');
INSERT INTO `book` VALUES ('173', '数据结构教程上机实验指导', '南开大学', '计算机与信息科学学院', '信息工程', '大一', '9787302108269 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302108269036e3b4.jpg', '26.0', '1', '9', null, null, '3', '李春葆', '2020-01-01', '0');
INSERT INTO `book` VALUES ('174', '网站规划与网页设计', '南开大学', '计算机与信息科学学院', '网络工程', '大四', '9787505384835 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978750538483501e11fd.jpg', '30.0', '1', '9', null, null, '3', '任永功', '2020-01-01', '0');
INSERT INTO `book` VALUES ('175', '多媒体技术及应用', '南开大学', '计算机与信息科学学院', '网络工程', '大四', '潘沛生 9787040199017', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870401990170ff7f54.jpg', '32.9', '1', '9', null, null, '3', '卢官明', '2020-01-01', '0');
INSERT INTO `book` VALUES ('176', 'MCS51单片机原理及应用技术教程', '南开大学', '计算机与信息科学学院', '网络工程', '大四', '9787115196262 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787115196262.jpg', '35.0', '1', '9', null, null, '3', '高洪志', '2020-01-01', '0');
INSERT INTO `book` VALUES ('177', '通信原理概论', '南开大学', '计算机与信息科学学院', '网络工程', '大四', '9787560921648 华中科技大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787560921648075f732.jpg', '24.8', '1', '9', null, null, '3', '贺贵明', '2020-01-01', '0');
INSERT INTO `book` VALUES ('178', 'CortexM3嵌入式处理器原理与应用', '南开大学', '计算机与信息科学学院', '网络工程', '大三', '9787121126468 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871211264680cc3c4a.jpg', '39.0', '1', '9', null, null, '3', '范书瑞', '2020-01-01', '0');
INSERT INTO `book` VALUES ('179', '计算机网络配置、管理与应用', '南开大学', '计算机与信息科学学院', '网络工程', '大三', '吴怡 97870402563', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870402563694b5db58.jpg', '30.6', '1', '9', null, null, '3', '2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('180', '单片微型机原理、应用与实验', '南开大学', '计算机与信息科学学院', '网络工程', '大三', '张友德 赵志', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787309026450028529c.jpg', '36.0', '1', '9', null, null, '3', '第四版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('181', '自动控制原理', '南开大学', '计算机与信息科学学院', '网络工程', '大二', '9787040118667 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870401186672549592.jpg', '39.2', '1', '9', null, null, '3', '程鹏', '2020-01-01', '0');
INSERT INTO `book` VALUES ('182', '计算机系统结构', '南开大学', '计算机与信息科学学院', '网络工程', '大二', '9787115128751 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871151287510c4ccf9.jpg', '28.0', '1', '9', null, null, '3', '张先俊', '2020-01-01', '0');
INSERT INTO `book` VALUES ('183', '软件过程管理', '南开大学', '计算机与信息科学学院', '网络工程', '大二', '9787302146407 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021464070365354.jpg', '28.0', '1', '14', null, null, '3', '朱少民', '2020-01-01', '0');
INSERT INTO `book` VALUES ('184', '自动控制原理及其应用', '南开大学', '计算机与信息科学学院', '网络工程', '大一', '黄坚 9787040283426', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870402834260fe7f00.jpg', '21.8', '1', '14', null, null, '3', '第3版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('185', '办公软件高级应用与案例精选', '南开大学', '计算机与信息科学学院', '网络工程', '大一', '宣军英 9787113', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787113122331048441a.jpg', '31.0', '1', '14', null, null, '3', '陈宝明', '2020-01-01', '0');
INSERT INTO `book` VALUES ('186', '计算机网络管理技术', '南开大学', '计算机与信息科学学院', '网络工程', '大一', '9787302172574 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730217257402362c4.jpg', '25.0', '1', '14', null, null, '3', '王群', '2020-01-01', '0');
INSERT INTO `book` VALUES ('187', '人机工程学', '南开大学', '计算机与信息科学学院', '软件工程', '大四', '高等教育出版社 9787040187120', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870401871200c0cc87.jpg', '36.2', '1', '14', null, null, '3', '赵江洪', '2020-01-01', '0');
INSERT INTO `book` VALUES ('188', '单片机原理及接口技术', '南开大学', '计算机与信息科学学院', '软件工程', '大四', '梅丽凤 978781082281', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978781082281713e8378.jpg', '33.0', '1', '14', null, null, '3', '修订本', '2020-01-01', '0');
INSERT INTO `book` VALUES ('189', '编译原理', '南开大学', '计算机与信息科学学院', '软件工程', '大四', '徐兰芳 9787121014543', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978712101454305795c7.jpg', '22.0', '1', '14', null, null, '3', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('190', '实用软件工程', '南开大学', '计算机与信息科学学院', '软件工程', '大三', '赵池龙 9787121028373', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871210283730dc7d67.jpg', '28.0', '1', '14', null, null, '3', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('191', '系统建模与仿真', '南开大学', '计算机与信息科学学院', '软件工程', '大三', '9787302129592 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302129592047d41a.jpg', '32.0', '1', '14', null, null, '3', '张晓华', '2020-01-01', '0');
INSERT INTO `book` VALUES ('192', 'Visual', '南开大学', '计算机与信息科学学院', '软件工程', '大三', '鄂大伟 张', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875615190280137138.jpg', '17.5', '1', '14', null, null, '3', 'FoxPro60程序设计与应用学习指导', '2020-01-01', '0');
INSERT INTO `book` VALUES ('193', '图形图像处理应用教程', '南开大学', '计算机与信息科学学院', '软件工程', '大二', '张思民 9787302243632', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730224363207b573e.jpg', '49.5', '1', '14', null, null, '2', '梁维娜', '2020-01-01', '0');
INSERT INTO `book` VALUES ('194', '大学计算机基础', '南开大学', '计算机与信息科学学院', '软件工程', '大一', '9787115210234 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787115210234075f772.jpg', '37.0', '1', '14', null, null, '2', '甘勇', '2020-01-01', '0');
INSERT INTO `book` VALUES ('195', '3ds', '南开大学', '计算机与信息科学学院', '软件工程', '大一', '王琦 9787115163608', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711516360806c76c2.jpg', '88.0', '1', '14', null, null, '2', 'Max9大风暴', '2020-01-01', '0');
INSERT INTO `book` VALUES ('196', '软件工程基础', '南开大学', '计算机与信息科学学院', '软件工程', '大一', '97870402207 高等教育出版社73', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870402207730edfed2.jpg', '28.8', '1', '14', null, null, '2', '胡飞', '2020-01-01', '0');
INSERT INTO `book` VALUES ('197', 'TCP/IP协议分析及应用', '南京大学', '机械学院', '机械设计制造及其自动化', '大四', '9787111208983 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871112089831e8ee16.jpg', '29.0', '1', '14', null, null, '2', '杨延双', '2020-01-01', '0');
INSERT INTO `book` VALUES ('198', '多媒体技术及应用', '南京大学', '机械学院', '机械设计制造及其自动化', '大四', '梁宇涛 9787121038495', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787121038495017e1f8.jpg', '26.0', '1', '14', null, null, '2', '陆芳', '2020-01-01', '0');
INSERT INTO `book` VALUES ('199', '计算机操作系统实验指导', '南京大学', '机械学院', '机械设计制造及其自动化', '大四', '9787302178934 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021789340380351.jpg', '29.0', '1', '14', null, null, '2', '郁红英', '2020-01-01', '0');
INSERT INTO `book` VALUES ('200', 'MATLAB程序设计教程', '南京大学', '机械学院', '机械设计制造及其自动化', '大三', '9787508426600 中国水利水电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875084266002bd8bb7.jpg', '30.0', '1', '14', null, null, '2', '刘卫国', '2020-01-01', '0');
INSERT INTO `book` VALUES ('201', '计算机组成与维护', '南京大学', '机械学院', '机械设计制造及其自动化', '大三', '王洲伟 9787121045035', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871210450351dc1d3d.jpg', '29.0', '1', '14', null, null, '2', '王占伟', '2020-01-01', '0');
INSERT INTO `book` VALUES ('202', 'Java程序设计基础', '南京大学', '机械学院', '机械设计制造及其自动化', '大二', '陈国君 9787302255345', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302255345053f55b.jpg', '33.0', '1', '14', null, null, '2', '第3版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('203', '多媒体CAI课件基本原理与制作技术', '南京大学', '机械学院', '机械设计制造及其自动化', '大二', '张森 978', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787810776882061861b.jpg', '34.0', '1', '14', null, null, '2', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('204', '局域网技术与应用', '南京大学', '机械学院', '机械设计制造及其自动化', '大一', '姜春雨 9787302087571', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302087571086789b.jpg', '18.0', '1', '14', null, null, '2', '李琳', '2020-01-01', '0');
INSERT INTO `book` VALUES ('205', '数据库原理与应用', '南京大学', '机械学院', '机械设计制造及其自动化', '大一', '9787111198710 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871111987100a50aa1.jpg', '32.0', '1', '14', null, null, '2', '何玉洁', '2020-01-01', '0');
INSERT INTO `book` VALUES ('206', 'UML基础与ROSE建模案例', '南京大学', '机械学院', '机械设计制造及其自动化', '大一', '吴建 9787115158918', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871151589181dbad2a.jpg', '28.0', '1', '14', null, null, '2', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('207', 'ARM嵌入式系统结构与编程', '南京大学', '机械学院', '机械设计制造及其自动化', '大一', '9787302194064 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730219406414d04f3.jpg', '35.0', '1', '14', null, null, '2', '邱铁', '2020-01-01', '0');
INSERT INTO `book` VALUES ('208', '嵌入式系统原理与设计', '南京大学', '计算机与信息科学学院', '物联网工程', '大二', '9787308050098 浙江大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787308050098.jpg', '28.0', '1', '14', null, null, '2', '王勇', '2020-01-01', '0');
INSERT INTO `book` VALUES ('209', '空间分析建模与原理', '南京大学', '计算机与信息科学学院', '物联网工程', '大二', '史文中 7030168860', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870301688630ed6e69.jpg', '36.0', '1', '14', null, null, '2', '朱长青', '2020-01-01', '0');
INSERT INTO `book` VALUES ('210', '软件开发技术', '南京大学', '计算机与信息科学学院', '物联网工程', '大二', '9787121075421 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871210754211130178.jpg', '48.0', '1', '14', null, null, '2', '张帆', '2020-01-01', '0');
INSERT INTO `book` VALUES ('211', 'SQL', '南京大学', '计算机与信息科学学院', '物联网工程', '大三', '第二版 卫琳', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730224453009239fa.jpg', '35.0', '1', '14', null, null, '2', 'Server2008数据库应用与开发教程', '2020-01-01', '0');
INSERT INTO `book` VALUES ('212', '信息管理导论', '南京大学', '计算机与信息科学学院', '物联网工程', '大四', '张凯 9787302118930', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730211893010b7077.jpg', '39.0', '1', '14', null, null, '2', '宋克振', '2020-01-01', '0');
INSERT INTO `book` VALUES ('213', '软件测试与质量保证', '南京大学', '计算机与信息科学学院', '信息工程', '大四', '9787563515967 北京邮电大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787563515967085987d.jpg', '32.0', '1', '14', null, null, '2', '袁玉宇', '2020-01-01', '0');
INSERT INTO `book` VALUES ('214', '信息技术及其在金融中的应用', '南京大学', '计算机与信息科学学院', '信息工程', '大四', '于锋 97875049441', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978750494412208bb80d.jpg', '32.0', '1', '14', null, null, '2', '郑岩', '2020-01-01', '0');
INSERT INTO `book` VALUES ('215', 'Visual', '南京大学', '计算机与信息科学学院', '信息工程', '大四', '邵鹏鸣 9787302105138', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730210513801ae1be.jpg', '35.0', '1', '14', null, null, '2', 'C#程序设计基础教程', '2020-01-01', '0');
INSERT INTO `book` VALUES ('216', 'ASPNET程序设计', '南京大学', '计算机与信息科学学院', '信息工程', '大二', '9787810822671 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978781082267108f18ee.jpg', '34.0', '1', '14', null, null, '1', '尚俊杰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('217', '软件测试技术经典教程', '南京大学', '计算机与信息科学学院', '信息工程', '大一', '9787030185174 科学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787030185174140c4ae.jpg', '79.0', '1', '14', null, null, '1', '赵斌', '2020-01-01', '0');
INSERT INTO `book` VALUES ('218', '办公软件应用', '南京大学', '计算机与信息科学学院', '信息工程', '大一', 'Windows 98/2000/XPOffi', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870303079890ffbff3.jpg', '39.8', '1', '14', null, null, '1', 'Windows平台', '2020-01-01', '0');
INSERT INTO `book` VALUES ('219', '单片机中级教程原理与应用', '南京大学', '计算机与信息科学学院', '信息工程', '大一', '第2版 北京航空航天大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787810778404138635e.jpg', '24.0', '1', '14', null, null, '1', '张俊馍', '2020-01-01', '0');
INSERT INTO `book` VALUES ('220', '微型计算机原理及接口技术', '南京大学', '计算机与信息科学学院', '信息工程', '大一', '9787302097693 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873020976930518593.jpg', '26.0', '1', '14', null, null, '1', '李伯成', '2020-01-01', '0');
INSERT INTO `book` VALUES ('221', 'Linux操作系统实用教程', '南京大学', '计算机与信息科学学院', '网络工程', '大四', '9787302212300 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873022123000ae6ab7.jpg', '26.0', '1', '14', null, null, '1', '文东戈', '2020-01-01', '0');
INSERT INTO `book` VALUES ('222', 'TCP/IP网络原理与技术', '南京大学', '计算机与信息科学学院', '网络工程', '大四', '赵小敏 9787040188240', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870401882400ed5e6d.jpg', '29.9', '1', '14', null, null, '1', '陈庆章', '2020-01-01', '0');
INSERT INTO `book` VALUES ('223', '实用软件工程教程', '南京大学', '计算机与信息科学学院', '网络工程', '大四', '9787111261094 机械工业出版社　', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871112610940b8db9b.jpg', '26.0', '1', '14', null, null, '1', '陈雄峰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('224', 'ASP', '南京大学', '计算机与信息科学学院', '网络工程', '大四', '周伶俐 9787030203090', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870302030900f48f47.jpg', '45.0', '1', '14', null, null, '1', '毕业设计指南与项目实践', '2020-01-01', '0');
INSERT INTO `book` VALUES ('225', 'C语言程序设计习题解答与上机指导', '南京大学', '计算机与信息科学学院', '网络工程', '大三', '林小茶 9', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871130821610561538.jpg', '21.0', '1', '14', null, null, '1', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('226', 'Photoshop全面攻克', '南京大学', '计算机与信息科学学院', '网络工程', '大三', '石少军 9787811331561', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97878113315610a97a2d.jpg', '49.0', '1', '14', null, null, '1', '帅茨平', '2020-01-01', '0');
INSERT INTO `book` VALUES ('227', '计算机图形学基础', '南京大学', '计算机与信息科学学院', '网络工程', '大二', '9787111137542 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787111137542021225f.jpg', '20.0', '1', '14', null, null, '1', '杜晓增', '2020-01-01', '0');
INSERT INTO `book` VALUES ('228', '计算机辅助制造', '南京大学', '计算机与信息科学学院', '网络工程', '大二', '第2版 9787302183419', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021834191b03b86.jpg', '46.0', '1', '14', null, null, '1', '王先逵', '2020-01-01', '0');
INSERT INTO `book` VALUES ('229', '计算机操作系统教程习题解答与实验指导', '南京大学', '计算机与信息科学学院', '网络工程', '大二', '第3版 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021362930e7de75.jpg', '15.0', '1', '14', null, null, '1', '张尧', '2020-01-01', '0');
INSERT INTO `book` VALUES ('230', 'XML实用教程', '南京大学', '计算机与信息科学学院', '网络工程', '大一', '9787301104620 北京大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730110462019bc9c1.jpg', '26.0', '1', '14', null, null, '1', '丁跃潮', '2020-01-01', '0');
INSERT INTO `book` VALUES ('231', 'Visual', '南京大学', '计算机与信息科学学院', '网络工程', '大一', '第3版 龚沛曾', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870402095010e46e82.jpg', '20.3', '1', '14', null, null, '1', 'Basic程序设计实验指导与测试', '2020-01-01', '0');
INSERT INTO `book` VALUES ('232', '旧书', '南京大学', '计算机与信息科学学院', '网络工程', '大一', '9787302183648 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730218364809b79a5.jpg', '38.0', '1', '14', null, null, '1', '程序员历年试题分析与解答', '2020-01-01', '0');
INSERT INTO `book` VALUES ('233', 'office在商务办公中的应用', '南京大学', '计算机与信息科学学院', '网络工程', '大一', '9787500678496 中国青年出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978750067849605c957f.jpg', '45.0', '1', '14', null, null, '1', '恒盛杰资讯', '2020-01-01', '0');
INSERT INTO `book` VALUES ('234', '微机原理与接口技术', '南京大学', '计算机与信息科学学院', '软件工程', '大三', '9787111135371 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871111353710f47f59.jpg', '27.0', '1', '14', null, null, '1', '何莉', '2020-01-01', '0');
INSERT INTO `book` VALUES ('235', '计算机组装与维护', '南京大学', '计算机与信息科学学院', '软件工程', '大三', '蔡中民 9787115177797', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711517779704d0446.jpg', '29.0', '1', '14', null, null, '1', '潘秀琴', '2020-01-01', '0');
INSERT INTO `book` VALUES ('236', 'C语言大学实用教程学习指导', '南京大学', '计算机与信息科学学院', '软件工程', '大三', '孙志岗 97871210', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978712103989802c0224.jpg', '32.0', '1', '14', null, null, '1', '苏小红', '2020-01-01', '0');
INSERT INTO `book` VALUES ('237', '路由器及其应用技术', '南京大学', '计算机与信息科学学院', '软件工程', '大二', '9787302086079 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302086079019b1de.jpg', '28.8', '1', '14', null, null, '1', '黎连业', '2020-01-01', '0');
INSERT INTO `book` VALUES ('238', 'Photoshop', '南京大学', '计算机与信息科学学院', '软件工程', '大二', '雷波 9787040250312', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870402503120fd1f81.jpg', '31.7', '1', '14', null, null, '1', 'CS3中文版标准教程', '2020-01-01', '0');
INSERT INTO `book` VALUES ('239', '程序员教程', '南京大学', '计算机与信息科学学院', '软件工程', '大二', '著 9787302043713', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873020437130b4dbec.jpg', '38.0', '1', '14', null, null, '1', '王春森', '2020-01-01', '0');
INSERT INTO `book` VALUES ('240', 'C语言程序设计教程习题与上机指导', '南京大学', '计算机与信息科学学院', '软件工程', '大一', '王树武 9', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97878104578661d48d50.jpg', '20.0', '1', '14', null, null, '1', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('241', 'C++程序设计实验指导与习题解答', '南京大学', '计算机与信息科学学院', '软件工程', '大一', '刘天印 978730', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873011046750533521.jpg', '20.0', '1', '14', null, null, '1', '李兰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('242', '数据结构', '上海交通大学', '机械学院', '机械设计制造及其自动化', '大三', '杨秀金 9787560608549', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875606085490e2fe31.jpg', '16.0', '1', '14', null, null, '1', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('243', '单片机课程设计指导', '上海交通大学', '机械学院', '机械设计制造及其自动化', '大三', '李光飞 9787811240832', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97878112408321fa2f6b.jpg', '39.0', '1', '14', null, null, '1', '楼然苗', '2020-01-01', '0');
INSERT INTO `book` VALUES ('244', '网络安全基础教程', '上海交通大学', '机械学院', '机械设计制造及其自动化', '大二', '9787115202154 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787115202154128c21a.jpg', '36.0', '1', '14', null, null, '1', '张仕斌', '2020-01-01', '0');
INSERT INTO `book` VALUES ('245', 'Dreamweaver网页制作实用教程', '上海交通大学', '机械学院', '机械设计制造及其自动化', '大二', '彭宗勤 97873021', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302162711086b8ea.jpg', '39.0', '1', '14', null, null, '1', '缪亮', '2020-01-01', '0');
INSERT INTO `book` VALUES ('246', '软件工程', '上海交通大学', '机械学院', '机械设计制造及其自动化', '大二', '毕建权 9787308049061', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873080490610d7dd52.jpg', '25.0', '1', '14', null, null, '1', '王慧芳', '2020-01-01', '0');
INSERT INTO `book` VALUES ('247', '电脑组装和维护教程', '上海交通大学', '机械学院', '机械设计制造及其自动化', '大一', 'wo 9787561212639', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875612126390c93ced.jpg', '22.0', '1', '14', null, null, '1', '第3版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('248', '多媒体技术实验教程', '上海交通大学', '机械学院', '机械设计制造及其自动化', '大一', '孙一林 9787111188254', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787111188254032b3a8.jpg', '25.0', '1', '14', null, null, '1', '彭波', '2020-01-01', '0');
INSERT INTO `book` VALUES ('249', '16位微型计算机原理', '上海交通大学', '计算机与信息科学学院', '物联网工程', '大四', '9787312009372 中国科学技术大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787312009372.jpg', '24.0', '1', '16', null, null, '1', '周佩玲', '2020-01-01', '0');
INSERT INTO `book` VALUES ('250', '2008版电脑短训班教程', '上海交通大学', '计算机与信息科学学院', '物联网工程', '大四', '李飞 9787810654029', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97878106540295040043.jpg', '12.8', '1', '16', null, null, '1', '第八版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('251', '中小型网络组建技术', '上海交通大学', '计算机与信息科学学院', '物联网工程', '大四', '9787115196248 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871151962481d39d8b.jpg', '32.0', '1', '16', null, null, '1', '余明辉', '2020-01-01', '0');
INSERT INTO `book` VALUES ('252', '面向对象技术UML教程', '上海交通大学', '计算机与信息科学学院', '物联网工程', '大三', '9787302077404 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873020774040180127.jpg', '24.0', '1', '16', null, null, '1', '王少锋', '2020-01-01', '0');
INSERT INTO `book` VALUES ('253', '网络安全基础教程与实训', '上海交通大学', '计算机与信息科学学院', '物联网工程', '大三', '尹少平 9787301168', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787301168776083b804.jpg', '30.0', '1', '16', null, null, '1', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('254', '基于Matlab的图像处理', '上海交通大学', '计算机与信息科学学院', '物联网工程', '大二', '9787302169062 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787302169062.jpg', '24.0', '1', '16', null, null, '1', '于万波', '2020-01-01', '0');
INSERT INTO `book` VALUES ('255', '计算机辅助工业产品设计', '上海交通大学', '计算机与信息科学学院', '物联网工程', '大二', '罗军 9787302142881', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302142881055e5c7.jpg', '25.0', '1', '16', null, null, '1', '汤晓山', '2020-01-01', '0');
INSERT INTO `book` VALUES ('256', '网站建设教程', '上海交通大学', '计算机与信息科学学院', '物联网工程', '大二', '吴彬 9787040123180', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978704012318000d60ff.jpg', '29.0', '1', '16', null, null, '1', '金旭亮', '2020-01-01', '0');
INSERT INTO `book` VALUES ('257', '操作系统', '上海交通大学', '计算机与信息科学学院', '信息工程', '大三', '孟庆昌 9787505398993', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875053989930cbec87.jpg', '34.0', '1', '16', null, null, '1', '孟庆昌', '2020-01-01', '0');
INSERT INTO `book` VALUES ('258', 'Flash动画设计与制作', '上海交通大学', '计算机与信息科学学院', '信息工程', '大三', '董明忠 9787302201076', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873022010761bfcb6c.jpg', '29.5', '1', '16', null, null, '1', '李青', '2020-01-01', '0');
INSERT INTO `book` VALUES ('259', '软件测试大学教程', '上海交通大学', '计算机与信息科学学院', '信息工程', '大二', '9787302206552 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302206552088f859.jpg', '35.0', '1', '16', null, null, '1', '蔡建平', '2020-01-01', '0');
INSERT INTO `book` VALUES ('260', '数字图像处理', '上海交通大学', '计算机与信息科学学院', '信息工程', '大二', '9787307039964 武汉大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730703996402ae2e3.jpg', '24.0', '1', '16', null, null, '1', '贾永红', '2020-01-01', '0');
INSERT INTO `book` VALUES ('261', '多媒体CAI课件制作实例教程', '上海交通大学', '计算机与信息科学学院', '信息工程', '大二', '方其桂 97873021', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021854820b68b76.jpg', '32.0', '1', '16', null, null, '1', '第3版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('262', '大学计算机应用基础教程', '上海交通大学', '计算机与信息科学学院', '网络工程', '大三', '詹国华 9787302193258', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730219325815395c6.jpg', '27.0', '1', '16', null, null, '1', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('263', 'Visual', '上海交通大学', '计算机与信息科学学院', '网络工程', '大三', '龚沛曾 9787040066869', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870400668690ee1ef0.jpg', '25.0', '1', '16', null, null, '1', 'Basic程序设计教程', '2020-01-01', '0');
INSERT INTO `book` VALUES ('264', 'XML技术应用', '上海交通大学', '计算机与信息科学学院', '网络工程', '大三', '王强 9787302149583', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021495831fa3f3d.jpg', '24.0', '1', '16', null, null, '1', '贾素玲', '2020-01-01', '0');
INSERT INTO `book` VALUES ('265', 'Java语言程序设计', '上海交通大学', '计算机与信息科学学院', '网络工程', '大三', '9787302106357 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/最新上传/9787302106357.jpg', '38.0', '1', '16', null, null, '1', '郎波', '2020-01-01', '0');
INSERT INTO `book` VALUES ('266', 'After', '上海交通大学', '计算机与信息科学学院', '网络工程', '大三', '张天骐 97871', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711521502414f648b.jpg', '98.0', '1', '16', null, null, '1', 'Effects影视合成与特效火星风暴', '2020-01-01', '0');
INSERT INTO `book` VALUES ('267', '计算机网络实验教程', '上海交通大学', '计算机与信息科学学院', '网络工程', '大二', '9787040172379 高等教育出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978704017237906f36f0.jpg', '32.0', '1', '16', null, null, '1', '钱德沛', '2020-01-01', '0');
INSERT INTO `book` VALUES ('268', 'C语言程序设计', '上海交通大学', '计算机与信息科学学院', '网络工程', '大一', '林小茶 9787113080044', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711308004415485d4.jpg', '28.0', '1', '16', null, null, '1', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('269', '全国计算机等级考试三级教程数据库技术考点与题解', '上海交通大学', '计算机与信息科学学院', '网络工程', '大一', '9787501755707 中国经济出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978750175570708638ea.jpg', '23.0', '1', '16', null, null, '1', '考试研究中心', '2020-01-01', '0');
INSERT INTO `book` VALUES ('270', 'Java', '上海交通大学', '计算机与信息科学学院', '网络工程', '大一', '印旻 9787302039273', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873020392735d5ed37.jpg', '23.5', '1', '16', null, null, '1', '语言与面向对象程序设计', '2020-01-01', '0');
INSERT INTO `book` VALUES ('271', '网络安全技术及应用', '上海交通大学', '计算机与信息科学学院', '软件工程', '大四', '9787111259305 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787111259305195c9e6.jpg', '41.0', '1', '16', null, null, '1', '贾铁军', '2020-01-01', '0');
INSERT INTO `book` VALUES ('272', '全国计算机等级考试笔试二级Visual', '上海交通大学', '计算机与信息科学学院', '软件工程', '大四', '9787115244291 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871152442910f44f5e.jpg', '29.8', '1', '16', null, null, '1', '本社', '2020-01-01', '0');
INSERT INTO `book` VALUES ('273', '网络安全技术', '上海交通大学', '计算机与信息科学学院', '软件工程', '大三', '9787111304661 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711130466100810f4.jpg', '39.8', '1', '16', null, null, '1', '刘化君', '2020-01-01', '0');
INSERT INTO `book` VALUES ('274', 'IBMPC宏汇编语言程序设计', '上海交通大学', '计算机与信息科学学院', '软件工程', '大三', '王元珍 97875609', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978756091357503b7369.jpg', '26.0', '1', '16', null, null, '1', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('275', 'Android/OPhone', '上海交通大学', '计算机与信息科学学院', '软件工程', '大二', '李宁 9787508475271', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978750847527109ee90c.jpg', '58.0', '1', '16', null, null, '1', '开发完全讲义', '2020-01-01', '0');
INSERT INTO `book` VALUES ('276', '计算机图形学实用技术', '上海交通大学', '计算机与信息科学学院', '软件工程', '大一', '陈元琰 9787302147169', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730214716916826dc.jpg', '30.0', '1', '16', null, null, '1', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('277', 'PIC单片机原理及应用', '北京大学', '机械学院', '机械设计制造及其自动化', '大四', '李荣正 9787810779272', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97878107792720e20ec0.jpg', '29.5', '1', '16', null, null, '1', '第3版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('278', 'C#实用教程', '北京大学', '机械学院', '机械设计制造及其自动化', '大四', '9787121054785 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871210547850d56d3b.jpg', '34.8', '1', '16', null, null, '1', '郑阿奇', '2020-01-01', '0');
INSERT INTO `book` VALUES ('279', '计算机应用基础', '北京大学', '机械学院', '机械设计制造及其自动化', '大四', '9787313054975 上海交通大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978731305497509049f2.jpg', '30.0', '1', '16', null, null, '1', '高国红', '2020-01-01', '0');
INSERT INTO `book` VALUES ('280', '财务软件实用教程', '北京大学', '机械学院', '机械设计制造及其自动化', '大四', '孙莲香 9787302', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730218044900d402e.jpg', '35.0', '1', '16', null, null, '1', '用友ERPU861版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('281', '单片机轻松入门', '北京大学', '机械学院', '机械设计制造及其自动化', '大三', '周坚 9787810778183', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978781077818313c3320.jpg', '28.0', '1', '16', null, null, '1', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('282', '现代操作系统', '北京大学', '机械学院', '机械设计制造及其自动化', '大三', '特纳鲍姆 97871110915', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871110915610f16f9b.jpg', '48.0', '1', '16', null, null, '1', '英文版第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('283', 'Java', '北京大学', '机械学院', '机械设计制造及其自动化', '大三', 'JSP+Servlet 李', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021917731ddcdd8.jpg', '39.0', '1', '16', null, null, '1', 'Web开发教程——入门与提高篇', '2020-01-01', '0');
INSERT INTO `book` VALUES ('284', 'Struts基础与案例开发详解', '北京大学', '机械学院', '机械设计制造及其自动化', '大三', '张孝祥 徐', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302208563067b6c0.jpg', '58.0', '1', '16', null, null, '1', '软件开发课堂', '2020-01-01', '0');
INSERT INTO `book` VALUES ('285', '软件需求工程', '北京大学', '机械学院', '机械设计制造及其自动化', '大二', '9787111248095 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871112480950cc2c21.jpg', '25.0', '1', '16', null, null, '1', '毋国庆', '2020-01-01', '0');
INSERT INTO `book` VALUES ('286', '软件工程实验教程', '北京大学', '机械学院', '机械设计制造及其自动化', '大二', '9787111266419 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787111266419120f225.jpg', '29.0', '1', '16', null, null, '1', '窦万峰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('287', '数据结构实验与实训教程', '北京大学', '机械学院', '机械设计制造及其自动化', '大二', '邓文华 97873022364', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873022364050d33d2c.jpg', '22.0', '1', '16', null, null, '1', '第3版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('288', '计算机应用培训教程Flash', '北京大学', '机械学院', '机械设计制造及其自动化', '大二', '马凌云 9787313030146', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787313030146083d837.jpg', '27.0', '1', '16', null, null, '1', '8', '2020-01-01', '0');
INSERT INTO `book` VALUES ('289', '软件工程实用教程', '北京大学', '计算机与信息科学学院', '物联网工程', '大四', '杨一平 9787115145345', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978711514534501ac167.jpg', '26.0', '1', '16', null, null, '1', '郭宁', '2020-01-01', '0');
INSERT INTO `book` VALUES ('290', '基于Eclipse环境的J2ME应用程序开发', '北京大学', '计算机与信息科学学院', '物联网工程', '大三', '王军 9787', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021888101b71bb7.jpg', '46.0', '1', '16', null, null, '1', '万辉', '2020-01-01', '0');
INSERT INTO `book` VALUES ('291', '计算机组成与体系结构', '北京大学', '计算机与信息科学学院', '物联网工程', '大三', '宋佳兴 9787302077459', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873020774590c83c34.jpg', '29.8', '1', '16', null, null, '1', '王诚', '2020-01-01', '0');
INSERT INTO `book` VALUES ('292', '计算机导论实验指导', '北京大学', '计算机与信息科学学院', '物联网工程', '大三', '9787302205913 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730220591310f6047.jpg', '22.0', '1', '16', null, null, '1', '李宁', '2020-01-01', '0');
INSERT INTO `book` VALUES ('293', '大学计算机应用基础实验教程', '北京大学', '计算机与信息科学学院', '物联网工程', '大二', '詹国华 9787302', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021932412068029.jpg', '23.0', '1', '16', null, null, '1', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('294', '计算机网络基础', '北京大学', '计算机与信息科学学院', '物联网工程', '大二', '姚鸿 9787115149695', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871151496953d62d31.jpg', '26.0', '1', '16', null, null, '1', '杜煜', '2020-01-01', '0');
INSERT INTO `book` VALUES ('295', 'J2EE电子商务系统开发', '北京大学', '计算机与信息科学学院', '物联网工程', '大一', '9787302140825 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730214082504a647f.jpg', '49.0', '1', '16', null, null, '1', '陈松', '2020-01-01', '0');
INSERT INTO `book` VALUES ('296', '计算机组装与维护教程', '北京大学', '计算机与信息科学学院', '物联网工程', '大一', '9787303085675 北京师范大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873030856752e75ec5.jpg', '26.5', '1', '16', null, null, '1', '赵宝', '2020-01-01', '0');
INSERT INTO `book` VALUES ('297', 'Java程序设计', '北京大学', '计算机与信息科学学院', '信息工程', '大四', '严千钧 9787302109495', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730210949508a98af.jpg', '27.0', '1', '16', null, null, '1', '宋中山', '2020-01-01', '0');
INSERT INTO `book` VALUES ('298', '网页设计与制作', '北京大学', '计算机与信息科学学院', '信息工程', '大四', '梁芳 9787302174530', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021745300b9fb95.jpg', '29.5', '1', '16', null, null, '1', '蔡立燕', '2020-01-01', '0');
INSERT INTO `book` VALUES ('299', '计算机网络故障诊断与排除', '北京大学', '计算机与信息科学学院', '信息工程', '大三', '罗昶 97873022483', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730224839203ee3b9.jpg', '33.8', '1', '16', null, null, '1', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('300', '计算机控制系统', '北京大学', '计算机与信息科学学院', '信息工程', '大三', '张虎 9787502572747', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875025727470cafc5f.jpg', '25.0', '1', '16', null, null, '1', '马应魁', '2020-01-01', '0');
INSERT INTO `book` VALUES ('301', '数据库技术与应用——Visual', '北京大学', '计算机与信息科学学院', '信息工程', '大二', '第2版 郭力平', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871151773150027052.jpg', '26.0', '1', '16', null, null, '1', 'FoxPro', '2020-01-01', '0');
INSERT INTO `book` VALUES ('302', 'ARM嵌入式系统实验教程', '北京大学', '计算机与信息科学学院', '信息工程', '大二', '周立功 9787810777261', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787810777261051355d.jpg', '32.0', '1', '16', null, null, '1', '三', '2020-01-01', '0');
INSERT INTO `book` VALUES ('303', '算法与数据结构', '北京大学', '计算机与信息科学学院', '信息工程', '大二', '王秀丽 9787302118657', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021186571f91fd1.jpg', '23.0', '1', '16', null, null, '1', '宁正元', '2020-01-01', '0');
INSERT INTO `book` VALUES ('304', 'Java', '北京大学', '计算机与信息科学学院', '信息工程', '大二', '郑阿奇 9787121097270', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871210972701e81ec0.jpg', '42.0', '1', '16', null, null, '1', 'EE实用教程', '2020-01-01', '0');
INSERT INTO `book` VALUES ('305', '精通J2EE网络编程', '北京大学', '计算机与信息科学学院', '信息工程', '大一', '肖峰 9787302146926', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021469260b2cb12.jpg', '59.0', '1', '16', null, null, '1', '邓子云', '2020-01-01', '0');
INSERT INTO `book` VALUES ('306', '中文版Photoshop', '北京大学', '计算机与信息科学学院', '信息工程', '大一', '全彩版 九州书源', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730219844418768ce.jpg', '69.8', '1', '16', null, null, '1', 'CS3从入门到精通', '2020-01-01', '0');
INSERT INTO `book` VALUES ('307', '单片机原理与接口技术', '北京大学', '计算机与信息科学学院', '信息工程', '大一', '毕万新 978756111993', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875611199380926963.jpg', '32.0', '1', '16', null, null, '1', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('308', '2011计算机等级考试考眼分析', '北京大学', '计算机与信息科学学院', '信息工程', '大一', '9787563524785 北京邮电大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978756352478509d59d4.jpg', '39.8', '1', '16', null, null, '1', '刘家琪', '2020-01-01', '0');
INSERT INTO `book` VALUES ('309', '精通Struts基于MVC的Java', '北京大学', '计算机与信息科学学院', '网络工程', '大四', '孙卫琴 97', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978712100052204ba4f9.jpg', '49.0', '1', '16', null, null, '1', 'Web设计与开发', '2020-01-01', '0');
INSERT INTO `book` VALUES ('310', '微机常见故障会诊', '北京大学', '计算机与信息科学学院', '网络工程', '大四', '9787302026792 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873020267920c41cd4.jpg', '21.0', '1', '16', null, null, '1', '杜昌领', '2020-01-01', '0');
INSERT INTO `book` VALUES ('311', 'AutoCAD', '北京大学', '计算机与信息科学学院', '网络工程', '大四', '余强 9787121119576', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978712111957609d299a.jpg', '38.0', '1', '16', null, null, '1', '2011中文版应用教程', '2020-01-01', '0');
INSERT INTO `book` VALUES ('312', 'ASP动态网站开发教程', '北京大学', '计算机与信息科学学院', '网络工程', '大四', '陈建伟 9787302099598', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730209959801301ec.jpg', '28.0', '1', '16', null, null, '1', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('313', 'FoxPro及其应用系统开发', '北京大学', '计算机与信息科学学院', '网络工程', '大四', '9787302028833 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302028833062860a.jpg', '23.0', '1', '16', null, null, '1', '史济民', '2020-01-01', '0');
INSERT INTO `book` VALUES ('314', 'Flash二维动画设计与制作', '北京大学', '计算机与信息科学学院', '网络工程', '大三', '吴学会 9787302236', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302236887097e92d.jpg', '39.0', '1', '16', null, null, '1', '詹青龙', '2020-01-01', '0');
INSERT INTO `book` VALUES ('315', '计算机网络技术基础', '北京大学', '计算机与信息科学学院', '网络工程', '大三', '尚晓航 9787040245875', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97870402458750a77a2d.jpg', '28.1', '1', '16', null, null, '1', '尚晓航', '2020-01-01', '0');
INSERT INTO `book` VALUES ('316', 'C++语言程序设计案例教程', '北京大学', '计算机与信息科学学院', '网络工程', '大一', '张瑞丰 978730210852', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021085280914933.jpg', '39.0', '1', '16', null, null, '1', '郑莉', '2020-01-01', '0');
INSERT INTO `book` VALUES ('317', 'DREAMWEAVER', '北京大学', '计算机与信息科学学院', '软件工程', '大四', '本社 9787115155306', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787115155306234e3b2.jpg', '28.0', '1', '16', null, null, '1', '8认证考试指南', '2020-01-01', '0');
INSERT INTO `book` VALUES ('318', '网站建设与网页设计完全实用手册', '北京大学', '计算机与信息科学学院', '软件工程', '大四', '9787121124242 电子工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787121124242034436f.jpg', '69.0', '1', '16', null, null, '1', '郭娜', '2020-01-01', '0');
INSERT INTO `book` VALUES ('319', '多媒体技术基础', '北京大学', '计算机与信息科学学院', '软件工程', '大四', '林福宗 9787302057055', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730205705523223b3.jpg', '37.0', '1', '16', null, null, '1', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('320', '网页设计与Web编程', '北京大学', '计算机与信息科学学院', '软件工程', '大四', '9787115198419 人民邮电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787115198419127b2e8.jpg', '33.0', '1', '16', null, null, '1', '吴黎兵', '2020-01-01', '0');
INSERT INTO `book` VALUES ('321', '电脑培训班教程', '北京大学', '计算机与信息科学学院', '软件工程', '大四', '曾向红 9787313038944', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787313038944295e95b.jpg', '13.8', '1', '16', null, null, '1', '2005版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('322', '计算机图形学基础', '北京大学', '计算机与信息科学学院', '软件工程', '大三', '陆枫 7505371576', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978750537157606536bc.jpg', '28.0', '1', '16', null, null, '1', '陈传波', '2020-01-01', '0');
INSERT INTO `book` VALUES ('323', '计算机网络应用技术教程', '北京大学', '计算机与信息科学学院', '软件工程', '大三', '9787302118893 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873021188930a8ba11.jpg', '26.0', '1', '16', null, null, '1', '孙践知', '2020-01-01', '0');
INSERT INTO `book` VALUES ('324', '计算机文化基础', '北京大学', '计算机与信息科学学院', '软件工程', '大三', '山东省教育厅组 7563621814', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875636218112d11d0b.jpg', '26.8', '1', '16', null, null, '1', '第六版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('325', 'C语言程序设计教程', '北京大学', '计算机与信息科学学院', '软件工程', '大二', '9787111183853 机械工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787111183853054d525.jpg', '24.0', '1', '16', null, null, '1', '刘新铭', '2020-01-01', '0');
INSERT INTO `book` VALUES ('326', '网页设计与制作实验指导', '北京大学', '计算机与信息科学学院', '软件工程', '大二', '杨选辉 97873021772', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302177296019a1d5.jpg', '18.0', '1', '16', null, null, '1', '第2版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('327', '软件测试教程', '衡阳师范学院', '城市与旅游学院', '自然地理与资源环境', '大四', '9787302167884 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730216788403043da.jpg', '22.0', '1', '16', null, null, '1', '杜文洁', '2020-01-01', '0');
INSERT INTO `book` VALUES ('328', 'Windows', '衡阳师范学院', '城市与旅游学院', '自然地理与资源环境', '大四', '东方人华 978730', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730209646704cc448.jpg', '32.0', '1', '16', null, null, '1', 'XP和Office2003入门与提高', '2020-01-01', '0');
INSERT INTO `book` VALUES ('329', '计算机技术软件专业技术', '衡阳师范学院', '城市与旅游学院', '自然地理与资源环境', '大四', '9787508433714 中国水利水电出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875084337140f70f4f.jpg', '36.0', '1', '16', null, null, '1', '郑若忠', '2020-01-01', '0');
INSERT INTO `book` VALUES ('330', 'C语言与面向对象的设计', '衡阳师范学院', '城市与旅游学院', '自然地理与资源环境', '大四', '张志明 重庆大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875624235460516509.jpg', '25.0', '1', '16', null, null, '1', '第二版', '2020-01-01', '0');
INSERT INTO `book` VALUES ('331', '现代财务软件实训教程', '衡阳师范学院', '外国语学院', '翻译', '大四', '9787811382006 西南财经大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97878113820061d31d7a.jpg', '21.8', '1', '16', null, null, '1', '刘勇', '2020-01-01', '0');
INSERT INTO `book` VALUES ('332', 'FLASH', '衡阳师范学院', '外国语学院', '翻译', '大四', '罗二平 9787802486003', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787802486003047e41d.jpg', '49.8', '1', '16', null, null, '1', '标准教程', '2020-01-01', '0');
INSERT INTO `book` VALUES ('333', '微型计算机原理', '衡阳师范学院', '外国语学院', '翻译', '大四', '王珏 9787560612454', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875606124541bcdb4f.jpg', '18.0', '1', '16', null, null, '1', '学习与实验指导', '2020-01-01', '0');
INSERT INTO `book` VALUES ('334', '网页设计教程侯文彬', '衡阳师范学院', '外国语学院', '翻译', '大四', '9787302091875 清华大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/978730209187503a332c.jpg', '23.0', '1', '16', null, null, '1', '康辉', '2020-01-01', '0');
INSERT INTO `book` VALUES ('335', 'Access数据库应用教程', '衡阳师范学院', '外国语学院', '翻译', '大四', '9787302222255 中国轻工业出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787302222255094f901.jpg', '29.0', '1', '16', null, null, '1', '徐秀花', '2020-01-01', '0');
INSERT INTO `book` VALUES ('336', 'C++程序设计', '衡阳师范学院', '外国语学院', '翻译', '大四', '李福亮 9787301104668', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97873011046680f40f32.jpg', '33.0', '1', '16', null, null, '1', '刘天印', '2020-01-01', '0');
INSERT INTO `book` VALUES ('337', '数据结构', '衡阳师范学院', '数学与统计学院', '数学与应用数学', '大二', '箸 9787121027949', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97871210279490f7afcc.jpg', '29.0', '1', '16', null, null, '1', '田鲁怀', '2020-01-01', '0');
INSERT INTO `book` VALUES ('338', '新编Visual', '衡阳师范学院', '数学与统计学院', '数学与应用数学', '大二', '孙建国//海滨 97878109', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97878109001192f3cf2f.jpg', '13.0', '1', '16', null, null, '1', 'Basic实验指导书', '2020-01-01', '0');
INSERT INTO `book` VALUES ('339', '中文版Flash', '衡阳师范学院', '文学院', '戏剧影视文学', '大三', '杨文广 9787542737', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/97875427373731a04a58.jpg', '42.0', '1', '16', null, null, '1', '8动画制作经典208例', '2020-01-01', '0');
INSERT INTO `book` VALUES ('340', '计算机网络规划与设计', '衡阳师范学院', '文学院', '戏剧影视文学', '大三', '9787308041850 浙江大学出版社', 'https://2sjc.oss-cn-hangzhou.aliyuncs.com/img/计算机与网络/9787308041850075775a.jpg', '39.0', '1', '16', null, null, '1', '段水福', '2020-01-01', '0');
INSERT INTO `book` VALUES ('341', '残雪作品典藏版解读博尔赫斯', '湖南工学院', '计算机与信息科学学院', '物联网工程', '大四', '残雪作品典藏版解读博尔赫斯 431', 'http://img3m4.ddimg.cn/74/28/27949754-1_l_3.jpg', '31.7', '1', '5', null, null, '104', '残雪', '2020-01-01', '0');
INSERT INTO `book` VALUES ('342', '青春期孩子的正面管教（50万册纪念升级版，一本书解决青春期孩子的关键难题）', '湖南工学院', '计算机与信息科学学院', '物联网工程', '大三', '青春期孩子的正面管教（50万册纪念升级版，一本书解决青春期孩子的关键难题） 432', 'http://img3m7.ddimg.cn/5/32/28473197-1_l_3.jpg', '41.3', '1', '5', null, null, '105', '王莉', '2020-01-01', '0');
INSERT INTO `book` VALUES ('343', '残雪作品典藏版辉煌的裂变：卡尔维诺的艺术生存', '湖南工学院', '计算机与信息科学学院', '物联网工程', '大三', '残雪作品典藏版辉煌的裂变：卡尔维诺的艺术生存 435', 'http://img3m5.ddimg.cn/75/29/27949755-1_l_3.jpg', '44.8', '1', '5', null, null, '103', '残雪', '2020-01-01', '0');
INSERT INTO `book` VALUES ('344', '梦的解析（2019全新手绘版）【果麦经典】', '湖南工学院', '计算机与信息科学学院', '物联网工程', '大二', '梦的解析（2019全新手绘版）【果麦经典】 436', 'http://img3m6.ddimg.cn/51/32/28477896-1_l_3.jpg', '61.6', '1', '5', null, null, '103', '山东文艺出版社', '2020-01-01', '0');
INSERT INTO `book` VALUES ('345', '梁实秋：简单有趣过生活（老树画画封面插画和齐白石精美国画彩插）', '湖南工学院', '计算机与信息科学学院', '物联网工程', '大二', '梁实秋：简单有趣过生活（老树画画封面插画和齐白石精美国画彩插） 437', 'http://img3m9.ddimg.cn/39/11/27947739-1_l_3.jpg', '33.1', '1', '5', null, null, '102', '梁实秋', '2020-01-01', '0');
INSERT INTO `book` VALUES ('346', '女人艾灸：驱寒养颜补气血（汉竹）', '湖南工学院', '计算机与信息科学学院', '物联网工程', '大二', '女人艾灸：驱寒养颜补气血（汉竹） 438', 'http://img3m2.ddimg.cn/71/32/28479302-1_l_3.jpg', '27.4', '1', '5', null, null, '102', '江苏科学技术出版社', '2020-01-01', '0');
INSERT INTO `book` VALUES ('347', '梁实秋：人间食色，至味清欢（老树画画封面插画和齐白石精美国画彩插）', '湖南工学院', '计算机与信息科学学院', '物联网工程', '大二', '梁实秋：人间食色，至味清欢（老树画画封面插画和齐白石精美国画彩插） 439', 'http://img3m1.ddimg.cn/41/13/27947741-1_l_3.jpg', '29.7', '1', '5', null, null, '102', '梁实秋', '2020-01-01', '0');
INSERT INTO `book` VALUES ('348', '奇兽：山海经动物图鉴（全3册）', '湖南工学院', '计算机与信息科学学院', '物联网工程', '大一', '奇兽：山海经动物图鉴（全3册） 440', 'http://img3m3.ddimg.cn/70/27/27928663-1_l_3.jpg', '198.7', '1', '5', null, null, '104', '兰心仪', '2020-01-01', '0');
INSERT INTO `book` VALUES ('349', '公文写作从入门到精通(签名版）', '湖南工学院', '计算机与信息科学学院', '物联网工程', '大一', '公文写作从入门到精通(签名版） 441', 'http://img3m7.ddimg.cn/83/4/28471097-1_l_1.jpg', '40.7', '1', '5', null, null, '102', '谢海德', '2020-01-01', '0');
INSERT INTO `book` VALUES ('350', '残雪作品典藏版永生的操练：解读《神曲》', '湖南工学院', '计算机与信息科学学院', '物联网工程', '大一', '残雪作品典藏版永生的操练：解读《神曲》 442', 'http://img3m1.ddimg.cn/71/25/27949751-1_l_2.jpg', '31.7', '1', '5', null, null, '102', '残雪', '2020-01-01', '0');
INSERT INTO `book` VALUES ('351', '文选(中华经典名著全本全注全译?全6册）', '湖南工学院', '计算机与信息科学学院', '信息工程', '大四', '文选(中华经典名著全本全注全译?全6册） 443', 'http://img3m0.ddimg.cn/18/10/27931680-1_l_9.jpg', '218.0', '1', '5', null, null, '129', '张启成', '2020-01-01', '0');
INSERT INTO `book` VALUES ('352', '区块链金融：技术变革重塑金融未来', '湖南工学院', '计算机与信息科学学院', '信息工程', '大四', '区块链金融：技术变革重塑金融未来 447', 'http://img3m5.ddimg.cn/47/18/28478585-1_l_4.jpg', '40.0', '1', '5', null, null, '101', '北京大学出版社', '2020-01-01', '0');
INSERT INTO `book` VALUES ('353', '征服自然：水、景观与现代德国的形成', '湖南工学院', '计算机与信息科学学院', '信息工程', '大四', '征服自然：水、景观与现代德国的形成 448', 'http://img3m2.ddimg.cn/42/27/28475412-1_l_1.jpg', '65.5', '1', '5', null, null, '101', '大卫?布莱克本', '2020-01-01', '0');
INSERT INTO `book` VALUES ('354', '刘墉：“给年轻人的入世指南”系列', '湖南工学院', '计算机与信息科学学院', '信息工程', '大三', '刘墉：“给年轻人的入世指南”系列 449', 'http://img3m3.ddimg.cn/30/4/27886053-1_l_2.jpg', '61.3', '1', '5', null, null, '101', '刘墉', '2020-01-01', '0');
INSERT INTO `book` VALUES ('355', '一生', '湖南工学院', '计算机与信息科学学院', '信息工程', '大三', '一生 450', 'http://img3m0.ddimg.cn/24/18/27932280-1_l_6.jpg', '39.8', '1', '5', null, null, '1122', '张德军', '2020-01-01', '0');
INSERT INTO `book` VALUES ('356', '听李四光讲地球的故事', '湖南工学院', '计算机与信息科学学院', '信息工程', '大三', '听李四光讲地球的故事 451', 'http://img3m3.ddimg.cn/30/27/27940503-1_l_1.jpg', '44.9', '1', '5', null, null, '101', '李四光纪念馆', '2020-01-01', '0');
INSERT INTO `book` VALUES ('357', '我的神奇马桶（奇思妙趣三部曲）（全3册）', '湖南工学院', '计算机与信息科学学院', '信息工程', '大二', '我的神奇马桶（奇思妙趣三部曲）（全3册） 452', 'http://img3m0.ddimg.cn/40/15/27849730-1_l_3.jpg', '65.3', '1', '5', null, null, '446', '铃木典丈', '2020-01-01', '0');
INSERT INTO `book` VALUES ('358', '刑法学习定律（独家签名版）', '湖南工学院', '计算机与信息科学学院', '信息工程', '大二', '刑法学习定律（独家签名版） 458', 'http://img3m6.ddimg.cn/96/36/28480416-1_l_2.jpg', '40.7', '1', '5', null, null, '99', '北京大学出版社', '2020-01-01', '0');
INSERT INTO `book` VALUES ('359', '所谓好运气，不过是机会遇到了努力的你', '湖南工学院', '计算机与信息科学学院', '信息工程', '大一', '所谓好运气，不过是机会遇到了努力的你 459', 'http://img3m3.ddimg.cn/78/33/27935403-1_l_3.jpg', '28.9', '1', '5', null, null, '101', '李小糖罐', '2020-01-01', '0');
INSERT INTO `book` VALUES ('360', '历史的季节：读史当明势', '湖南工学院', '计算机与信息科学学院', '信息工程', '大一', '历史的季节：读史当明势 460', 'http://img3m2.ddimg.cn/23/13/28469552-1_l_3.jpg', '40.0', '1', '5', null, null, '100', '冯敏飞', '2020-01-01', '0');
INSERT INTO `book` VALUES ('361', '出发！可爱的虫虫世界（蛋蛋学校万物探秘之旅.第二辑）', '湖南工学院', '计算机与信息科学学院', '信息工程', '大一', '出发！可爱的虫虫世界（蛋蛋学校万物探秘之旅.第二辑） 461', 'http://img3m3.ddimg.cn/73/1/28469503-1_l_4.jpg', '138.6', '1', '5', null, null, '99', '宋海东', '2020-01-01', '0');
INSERT INTO `book` VALUES ('362', '中央帝国的军事密码', '湖南工学院', '计算机与信息科学学院', '网络工程', '大四', '中央帝国的军事密码 462', 'http://img3m6.ddimg.cn/21/28/27921486-1_l_3.jpg', '51.0', '1', '5', null, null, '319', '郭建龙', '2020-01-01', '0');
INSERT INTO `book` VALUES ('363', '杀死一只知更鸟（精装）', '湖南工学院', '计算机与信息科学学院', '网络工程', '大四', '杀死一只知更鸟（精装） 463', 'http://img3m2.ddimg.cn/1/34/24185602-1_l_1.jpg', '28.8', '1', '5', null, null, '1706', '哈珀?李', '2020-01-01', '0');
INSERT INTO `book` VALUES ('364', '罗尔德?达尔作品典藏（彩图拼音版）―了不起的狐狸爸爸', '湖南工学院', '计算机与信息科学学院', '网络工程', '大四', '罗尔德?达尔作品典藏（彩图拼音版）―了不起的狐狸爸爸 466', 'http://img3m7.ddimg.cn/38/28/25575797-1_l_2.jpg', '20.5', '1', '5', null, null, '864', '罗尔德?达尔', '2020-01-01', '0');
INSERT INTO `book` VALUES ('365', '价值投资从入门到精通', '湖南工学院', '计算机与信息科学学院', '网络工程', '大四', '价值投资从入门到精通 469', 'http://img3m5.ddimg.cn/61/15/27942415-1_l_3.jpg', '40.7', '1', '5', null, null, '98', '吴晓冬', '2020-01-01', '0');
INSERT INTO `book` VALUES ('366', '一只特立独行的猪', '湖南工学院', '计算机与信息科学学院', '网络工程', '大三', '一只特立独行的猪 470', 'http://img3m0.ddimg.cn/35/24/24516890-1_l_3.jpg', '17.5', '1', '5', null, null, '3923', '王小波', '2020-01-01', '0');
INSERT INTO `book` VALUES ('367', '朝花夕拾（“教育部统编《语文》推荐阅读丛书”）部编教材七年级上册推荐阅读', '湖南工学院', '计算机与信息科学学院', '网络工程', '大二', '朝花夕拾（“教育部统编《语文》推荐阅读丛书”）部编教材七年级上册推荐阅读 475', 'http://img3m3.ddimg.cn/77/27/25267253-1_l_3.jpg', '18.7', '1', '5', null, null, '4995', '鲁迅', '2020-01-01', '0');
INSERT INTO `book` VALUES ('368', '学会高效记忆：世界记忆冠军的刻意练习法', '湖南工学院', '计算机与信息科学学院', '网络工程', '大二', '学会高效记忆：世界记忆冠军的刻意练习法 477', 'http://img3m0.ddimg.cn/70/35/28469500-1_l_2.jpg', '40.7', '1', '11', null, null, '97', '乔纳森?汉考克', '2020-01-01', '0');
INSERT INTO `book` VALUES ('369', '商业仪表盘可视化解决方案', '湖南工学院', '计算机与信息科学学院', '网络工程', '大二', '商业仪表盘可视化解决方案 480', 'http://img3m8.ddimg.cn/87/35/27951648-1_l_1.jpg', '89.0', '1', '11', null, null, '96', '史蒂夫?韦克斯勒', '2020-01-01', '0');
INSERT INTO `book` VALUES ('370', '活着（精装版，余华代表作，易烊千玺推荐阅读版本）', '湖南工学院', '计算机与信息科学学院', '网络工程', '大二', '活着（精装版，余华代表作，易烊千玺推荐阅读版本） 481', 'http://img3m9.ddimg.cn/93/8/25092039-1_l_3.jpg', '21.0', '1', '11', null, null, '8746', '余华', '2020-01-01', '0');
INSERT INTO `book` VALUES ('371', '信谊世界精选图画书?爷爷一定有办法', '湖南工学院', '计算机与信息科学学院', '网络工程', '大一', '信谊世界精选图画书?爷爷一定有办法 482', 'http://img3m9.ddimg.cn/60/36/25227339-1_l_3.jpg', '29.0', '1', '11', null, null, '1978', '菲比?吉尔曼', '2020-01-01', '0');
INSERT INTO `book` VALUES ('372', '一生时光如许有限，请不要荒凉了自己', '湖南工学院', '计算机与信息科学学院', '网络工程', '大一', '一生时光如许有限，请不要荒凉了自己 484', 'http://img3m3.ddimg.cn/15/10/27950883-1_l_3.jpg', '31.9', '1', '11', null, null, '96', '高紫桐', '2020-01-01', '0');
INSERT INTO `book` VALUES ('373', '肖秀荣2020考研政治知识点提要', '湖南工学院', '计算机与信息科学学院', '网络工程', '大一', '肖秀荣2020考研政治知识点提要 486', 'http://img3m2.ddimg.cn/79/2/26914912-1_l_8.jpg', '23.4', '1', '11', null, null, '230', '肖秀荣', '2020-01-01', '0');
INSERT INTO `book` VALUES ('374', '把坏脾气收起来', '湖南工学院', '计算机与信息科学学院', '软件工程', '大四', '把坏脾气收起来 487', 'http://img3m5.ddimg.cn/64/14/25102405-1_l_3.jpg', '20.2', '1', '11', null, null, '2319', '卡罗尔?罗思', '2020-01-01', '0');
INSERT INTO `book` VALUES ('375', '傅雷家书（部编本语文教材八年级下册推荐阅读）', '湖南工学院', '计算机与信息科学学院', '软件工程', '大四', '傅雷家书（部编本语文教材八年级下册推荐阅读） 488', 'http://img3m7.ddimg.cn/70/12/25187947-1_l_9.jpg', '23.1', '1', '11', null, null, '2773', '傅雷', '2020-01-01', '0');
INSERT INTO `book` VALUES ('376', '社会学经典入门（第14版）', '湖南工学院', '计算机与信息科学学院', '软件工程', '大四', '社会学经典入门（第14版） 490', 'http://img3m9.ddimg.cn/28/25/27925849-1_l_4.jpg', '88.3', '1', '11', null, null, '95', '约翰?J.麦休尼斯', '2020-01-01', '0');
INSERT INTO `book` VALUES ('377', '优雅女神赫本传：岁月从不败美人', '湖南工学院', '计算机与信息科学学院', '软件工程', '大三', '优雅女神赫本传：岁月从不败美人 491', 'http://img3m5.ddimg.cn/70/17/27940345-1_l_3.jpg', '31.3', '1', '11', null, null, '96', '纪云裳', '2020-01-01', '0');
INSERT INTO `book` VALUES ('378', '花婆婆', '湖南工学院', '计算机与信息科学学院', '软件工程', '大三', '花婆婆 492', 'http://img3m7.ddimg.cn/51/14/23633727-1_l_10.jpg', '24.0', '1', '11', null, null, '5599', '芭芭拉库尼', '2020-01-01', '0');
INSERT INTO `book` VALUES ('379', '草房子（当当网定制版）', '湖南工学院', '计算机与信息科学学院', '软件工程', '大三', '草房子（当当网定制版） 493', 'http://img3m2.ddimg.cn/32/4/23662022-1_l_6.jpg', '18.7', '1', '11', null, null, '5508', '曹文轩', '2020-01-01', '0');
INSERT INTO `book` VALUES ('380', '西藏生死书（布面精装版）', '湖南工学院', '计算机与信息科学学院', '软件工程', '大三', '西藏生死书（布面精装版） 495', 'http://img3m0.ddimg.cn/55/19/25297030-1_l_1.jpg', '43.5', '1', '5', null, null, '1094', '索甲仁波切', '2020-01-01', '0');
INSERT INTO `book` VALUES ('381', '爱打嗝的斑马（精装）', '湖南工学院', '计算机与信息科学学院', '软件工程', '大二', '爱打嗝的斑马（精装） 497', 'http://img3m4.ddimg.cn/9/35/23234814-1_l_7.jpg', '23.3', '1', '5', null, null, '3117', '大卫', '2020-01-01', '0');
INSERT INTO `book` VALUES ('382', '掌控习惯（樊登读书创始人樊登博士倾力推荐）', '湖南工学院', '计算机与信息科学学院', '软件工程', '大二', '掌控习惯（樊登读书创始人樊登博士倾力推荐） 498', 'http://img3m8.ddimg.cn/68/15/27885398-1_l_5.jpg', '33.0', '1', '5', null, null, '1335', '詹姆斯?克利尔', '2020-01-01', '0');
INSERT INTO `book` VALUES ('383', 'DK博物大百科――自然界的视觉盛宴', null, null, null, null, 'DK博物大百科――自然界的视觉盛宴 99.9%推荐', 'http://img3m0.ddimg.cn/95/1/27887900-1_l_1.jpg', '297.3', '1', '5', null, null, '207', '英国DK公司', '2020-01-01', '0');
INSERT INTO `book` VALUES ('384', '摆渡人（系列畅销千万册。如果命运是一条孤独的河流，谁会是你灵魂的摆渡人·《摆渡人》完结篇即将上市！）', null, null, null, null, '摆渡人（系列畅销千万册。如果命运是一条孤独的河流，谁会是你灵魂的摆渡人·《摆渡人》完结篇即将上市！） 99.9%推荐', 'http://img3m7.ddimg.cn/86/32/23694647-1_l_8.jpg', '26.9', '1', '5', null, null, '11739', '克莱儿?麦克福尔', '2020-01-01', '0');
INSERT INTO `book` VALUES ('385', '天堂囚徒（“风之影四部曲”第三部，谜团上叠加更多谜团。“风之影四部曲”简体中文完整版首登陆中国）', null, null, null, null, '天堂囚徒（“风之影四部曲”第三部，谜团上叠加更多谜团。“风之影四部曲”简体中文完整版首登陆中国） 99.7%推荐', 'http://img3m7.ddimg.cn/90/33/27939177-1_l_2.jpg', '28.8', '1', '5', null, null, '312', '卡洛斯?鲁依兹?萨丰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('386', '断舍离（2019新版，全新修订50%以上内容）宫崎骏、张德芬、李冰冰的减法哲学', null, null, null, null, '断舍离（2019新版，全新修订50%以上内容）宫崎骏、张德芬、李冰冰的减法哲学 99.9%推荐', 'http://img3m9.ddimg.cn/56/27/26482259-1_l_10.jpg', '33.6', '1', '5', null, null, '979', '山下英子', '2020-01-01', '0');
INSERT INTO `book` VALUES ('387', '岛上书店（李现推荐，每个人的生命中，都有无比艰难的那一年，将人生变得美好而辽阔。加?泽文感动全球千万读者的治愈小说！）', null, null, null, null, '岛上书店（李现推荐，每个人的生命中，都有无比艰难的那一年，将人生变得美好而辽阔。加?泽文感动全球千万读者的治愈小说！） 99.9%推荐', 'http://img3m9.ddimg.cn/74/1/23685329-1_l_31.jpg', '19.3', '1', '5', null, null, '7538', '加?泽文', '2020-01-01', '0');
INSERT INTO `book` VALUES ('388', '高晓松指南&矮大紧指北（蜻蜓FM王牌付费节目?套装全三册）', null, null, null, null, '高晓松指南&矮大紧指北（蜻蜓FM王牌付费节目?套装全三册） 99.4%推荐', 'http://img3m1.ddimg.cn/3/12/27896421-1_l_10.jpg', '79.6', '1', '5', null, null, '113', '高晓松', '2020-01-01', '0');
INSERT INTO `book` VALUES ('389', '聊斋志异会校会注会评本(典藏版)(全四册)(中国古典文学丛书)', null, null, null, null, '聊斋志异会校会注会评本(典藏版)(全四册)(中国古典文学丛书) 99.3%推荐', 'http://img3m2.ddimg.cn/81/12/27920952-1_l_3.jpg', '276.0', '1', '5', null, null, '146', '蒲松龄', '2020-01-01', '0');
INSERT INTO `book` VALUES ('390', '写给儿童的中国地理（全14册）', null, null, null, null, '写给儿童的中国地理（全14册） 99.9%推荐', 'http://img3m3.ddimg.cn/15/4/24044343-1_l_6.jpg', '267.1', '1', '5', null, null, '3966', '陈卫平', '2020-01-01', '0');
INSERT INTO `book` VALUES ('391', '格局：世界永远不缺聪明人（吴军作品）', null, null, null, null, '格局：世界永远不缺聪明人（吴军作品） 98.3%推荐', 'http://img3m4.ddimg.cn/62/20/27943604-1_l_3.jpg', '40.7', '1', '5', null, null, '110', '吴军', '2020-01-01', '0');
INSERT INTO `book` VALUES ('392', '默读（全三册套装）（P大作品）当当专供', null, null, null, null, '默读（全三册套装）（P大作品）当当专供 99.9%推荐', 'http://img3m0.ddimg.cn/85/26/25352500-1_l_1.jpg', '83.1', '1', '5', null, null, '1338', 'Priest', '2020-01-01', '0');
INSERT INTO `book` VALUES ('393', '人世间（第十届茅盾文学奖获奖作品）', null, null, null, null, '人世间（第十届茅盾文学奖获奖作品） 99.9%推荐', 'http://img3m3.ddimg.cn/5/1/25207583-1_l_2.jpg', '138.1', '1', '5', null, null, '455', '梁晓声', '2020-01-01', '0');
INSERT INTO `book` VALUES ('394', '你的善良必须有点锋芒', null, null, null, null, '你的善良必须有点锋芒 99.9%推荐', 'http://img3m5.ddimg.cn/8/24/24015725-1_l_11.jpg', '20.8', '1', '5', null, null, '3894', '慕颜歌', '2020-01-01', '0');
INSERT INTO `book` VALUES ('395', '呀!故宫(精装)', null, null, null, null, '呀!故宫(精装) 99.9%推荐', 'http://img3m4.ddimg.cn/17/35/26917424-1_l_2.jpg', '19.7', '1', '5', null, null, '871', '陈和伟', '2020-01-01', '0');
INSERT INTO `book` VALUES ('396', '肖秀荣2020考研政治考点预测（背诵版）', null, null, null, null, '肖秀荣2020考研政治考点预测（背诵版） 99.1%推荐', 'http://img3m9.ddimg.cn/86/9/26914919-1_l_9.jpg', '23.6', '1', '4', null, null, '101', '肖秀荣', '2020-01-01', '0');
INSERT INTO `book` VALUES ('397', '耶路撒冷三千年（第十届文津奖获奖图书）深圳读书月2015年度十大好书', null, null, null, null, '耶路撒冷三千年（第十届文津奖获奖图书）深圳读书月2015年度十大好书 99.9%推荐', 'http://img3m5.ddimg.cn/11/28/23576465-1_l_3.jpg', '58.5', '1', '4', null, null, '1995', '西蒙?蒙蒂菲奥里', '2020-01-01', '0');
INSERT INTO `book` VALUES ('398', '列奥纳多?达芬奇传：从凡人到天才的创造力密码（樊登读书推荐）', null, null, null, null, '列奥纳多?达芬奇传：从凡人到天才的创造力密码（樊登读书推荐） 99.9%推荐', 'http://img3m5.ddimg.cn/35/22/25296515-1_l_11.jpg', '68.3', '1', '4', null, null, '791', '沃尔特?艾萨克森', '2020-01-01', '0');
INSERT INTO `book` VALUES ('399', '儿时的原', null, null, null, null, '儿时的原 99.6%推荐', 'http://img3m6.ddimg.cn/83/32/25223006-1_l.jpg', '12.5', '1', '4', null, null, '246', '太白文艺出版社', '2020-01-01', '0');
INSERT INTO `book` VALUES ('400', '汪曾祺散文精选集：万事有心，人间有味（麦家、冯唐、贾平凹等极力推崇）', null, null, null, null, '汪曾祺散文精选集：万事有心，人间有味（麦家、冯唐、贾平凹等极力推崇） 99.9%推荐', 'http://img3m9.ddimg.cn/3/24/27856029-1_l_4.jpg', '29.3', '1', '4', null, null, '1112', '汪曾祺', '2020-01-01', '0');
INSERT INTO `book` VALUES ('401', '红与黑（高晓松推荐、央视官方收藏版本）（法文直译无删节，法国国家图书馆藏本，中国社科院翻译家罗新璋先生翻译并全新修订内文）', null, null, null, null, '红与黑（高晓松推荐、央视官方收藏版本）（法文直译无删节，法国国家图书馆藏本，中国社科院翻译家罗新璋先生翻译并全新修订内文） 99.9%推荐', 'http://img3m7.ddimg.cn/48/21/24043287-1_l_9.jpg', '21.0', '1', '4', null, null, '1367', '司汤达', '2020-01-01', '0');
INSERT INTO `book` VALUES ('402', '人间词话（近代极富盛名的词话著作，集编、校、释、评于一体，赏读于一书）（1-9年级必读书单）', null, null, null, null, '人间词话（近代极富盛名的词话著作，集编、校、释、评于一体，赏读于一书）（1-9年级必读书单） 99.9%推荐', 'http://img3m7.ddimg.cn/84/13/23715237-1_l_2.jpg', '20.9', '1', '4', null, null, '5513', '王国维', '2020-01-01', '0');
INSERT INTO `book` VALUES ('403', '元素周期表', null, null, null, null, '元素周期表 99.9%推荐', 'http://img3m0.ddimg.cn/8/32/23992460-1_l_3.jpg', '2.2', '1', '4', null, null, '1444', '汪斌', '2020-01-01', '0');
INSERT INTO `book` VALUES ('404', '异地恋的我们：一约既定，万山无阻', null, null, null, null, '异地恋的我们：一约既定，万山无阻 99%推荐', 'http://img3m4.ddimg.cn/41/20/27942494-1_l_3.jpg', '36.4', '1', '4', null, null, '101', '夏至', '2020-01-01', '0');
INSERT INTO `book` VALUES ('405', '蜜汁炖鱿鱼（《亲爱的热爱的》原著小说，随书送杨紫、李现明信片，新增“婚礼+蜜月”高甜番外完整版，剧方唯.1正版授权）', null, null, null, null, '蜜汁炖鱿鱼（《亲爱的热爱的》原著小说，随书送杨紫、李现明信片，新增“婚礼+蜜月”高甜番外完整版，剧方唯.1正版授权） 99.9%推荐', 'http://img3m6.ddimg.cn/9/10/26923356-1_l_1.jpg', '24.8', '1', '4', null, null, '1530', '墨宝非宝', '2020-01-01', '0');
INSERT INTO `book` VALUES ('406', '小鸡球球触感玩具书：全5册', null, null, null, null, '小鸡球球触感玩具书：全5册 99.9%推荐', 'http://img3m1.ddimg.cn/8/17/24105221-1_l_25.jpg', '170.4', '1', '4', null, null, '2974', '入山智', '2020-01-01', '0');
INSERT INTO `book` VALUES ('407', '所谓情商高，就是会说话', null, null, null, null, '所谓情商高，就是会说话 99.9%推荐', 'http://img3m9.ddimg.cn/58/23/24026269-1_l_11.jpg', '23.0', '1', '4', null, null, '5071', '佐佐木圭一', '2020-01-01', '0');
INSERT INTO `book` VALUES ('408', '朝圣者', null, null, null, null, '朝圣者 100%推荐', 'http://img3m8.ddimg.cn/62/8/25141508-1_l_3.jpg', '45.2', '1', '3', null, null, '19534', '泰瑞?海耶斯', '2020-01-01', '0');
INSERT INTO `book` VALUES ('409', '阴谋与爱情', null, null, null, null, '阴谋与爱情 100%推荐', 'http://img3m0.ddimg.cn/65/35/28470980-1_l_5.jpg', '28.6', '1', '3', null, null, '12134', 'J?B?卞若琳', '2020-01-01', '0');
INSERT INTO `book` VALUES ('410', '自游加州全攻略', null, null, null, null, '自游加州全攻略 100%推荐', 'http://img3m9.ddimg.cn/21/27/28470639-1_l_5.jpg', '34.5', '1', '3', null, null, '10484', '李?福斯特', '2020-01-01', '0');
INSERT INTO `book` VALUES ('411', '安妮日记', null, null, null, null, '安妮日记 100%推荐', 'http://img3m7.ddimg.cn/61/16/25580077-1_l_3.jpg', '23.8', '1', '3', null, null, '10298', '安妮?弗兰克', '2020-01-01', '0');
INSERT INTO `book` VALUES ('412', '名人传', null, null, null, null, '名人传 100%推荐', 'http://img3m0.ddimg.cn/85/3/27898780-1_l_1.jpg', '23.8', '1', '3', null, null, '10281', '罗曼?罗兰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('413', '给青年的十二封信', null, null, null, null, '给青年的十二封信 99.9%推荐', 'http://img3m8.ddimg.cn/53/8/27898748-1_l_1.jpg', '23.8', '1', '3', null, null, '10250', '朱光潜', '2020-01-01', '0');
INSERT INTO `book` VALUES ('414', '领导者习惯：卓越管理的22个必备技能', null, null, null, null, '领导者习惯：卓越管理的22个必备技能 100%推荐', 'http://img3m2.ddimg.cn/98/21/25585262-1_l_3.jpg', '25.9', '1', '3', null, null, '10758', '马丁?拉尼克', '2020-01-01', '0');
INSERT INTO `book` VALUES ('415', '间谍之死', null, null, null, null, '间谍之死 99.9%推荐', 'http://img3m0.ddimg.cn/10/28/25345990-1_l_3.jpg', '41.0', '1', '3', null, null, '39314', '丹?马里兰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('416', '向上管理：与你的领导相互成就', null, null, null, null, '向上管理：与你的领导相互成就 100%推荐', 'http://img3m3.ddimg.cn/93/36/27869583-1_l_2.jpg', '25.9', '1', '3', null, null, '9726', '萧雨', '2020-01-01', '0');
INSERT INTO `book` VALUES ('417', '大转折时代：报纸覆盖下的美国五十年', null, null, null, null, '大转折时代：报纸覆盖下的美国五十年 100%推荐', 'http://img3m8.ddimg.cn/17/5/27853568-1_l_3.jpg', '29.7', '1', '3', null, null, '10278', '茱莉亚?瓜尔内里', '2020-01-01', '0');
INSERT INTO `book` VALUES ('418', '呼叫空港', null, null, null, null, '呼叫空港 100%推荐', 'http://img3m8.ddimg.cn/19/27/25317388-1_l_3.jpg', '27.4', '1', '3', null, null, '10247', '巫山', '2020-01-01', '0');
INSERT INTO `book` VALUES ('419', '《另类间谍》', null, null, null, null, '《另类间谍》 100%推荐', 'http://img3m1.ddimg.cn/46/27/25254451-1_l_5.jpg', '20.8', '1', '3', null, null, '24022', '莉比?菲舍尔?赫尔曼', '2020-01-01', '0');
INSERT INTO `book` VALUES ('420', '内向者的竞争力', null, null, null, null, '内向者的竞争力 100%推荐', 'http://img3m8.ddimg.cn/85/6/27896008-1_l_2.jpg', '25.9', '1', '3', null, null, '10353', '谭云飞', '2020-01-01', '0');
INSERT INTO `book` VALUES ('421', '销售培训：让每个销售员都成为销售高手', null, null, null, null, '销售培训：让每个销售员都成为销售高手 100%推荐', 'http://img3m4.ddimg.cn/80/8/27912734-1_l_3.jpg', '32.2', '1', '3', null, null, '5954', '龙晴', '2020-01-01', '0');
INSERT INTO `book` VALUES ('422', '脱口而出，妙语连珠', null, null, null, null, '脱口而出，妙语连珠 99.9%推荐', 'http://img3m2.ddimg.cn/97/23/24157582-1_l_13.jpg', '32.4', '1', '3', null, null, '14812', '安德里?赛德涅夫', '2020-01-01', '0');
INSERT INTO `book` VALUES ('423', '此刻花开', null, null, null, null, '此刻花开 99.8%推荐', 'http://img3m1.ddimg.cn/78/2/24134991-1_l_14.jpg', '30.6', '1', '3', null, null, '11933', '徐静', '2020-01-01', '0');
INSERT INTO `book` VALUES ('424', '与其夸夸其谈，不如静心聆听', null, null, null, null, '与其夸夸其谈，不如静心聆听 100%推荐', 'http://img3m3.ddimg.cn/53/31/27898253-1_l_1.jpg', '25.9', '1', '3', null, null, '10566', '阿川佐和子', '2020-01-01', '0');
INSERT INTO `book` VALUES ('425', '呐喊――大屠杀回忆录', null, null, null, null, '呐喊――大屠杀回忆录 100%推荐', 'http://img3m3.ddimg.cn/94/21/25069963-1_l_16.jpg', '26.2', '1', '3', null, null, '26182', '曼尼?斯坦伯格', '2020-01-01', '0');
INSERT INTO `book` VALUES ('426', '一生别离（全二册）', null, null, null, null, '一生别离（全二册） 100%推荐', 'http://img3m0.ddimg.cn/56/21/27949340-1_l_5.jpg', '34.3', '1', '3', null, null, '5475', '?m若一', '2020-01-01', '0');
INSERT INTO `book` VALUES ('427', '谈美?谈美书简', null, null, null, null, '谈美?谈美书简 100%推荐', 'http://img3m0.ddimg.cn/75/30/27898770-1_l_3.jpg', '23.8', '1', '3', null, null, '10028', '朱光潜', '2020-01-01', '0');
INSERT INTO `book` VALUES ('428', '城南旧事', null, null, null, null, '城南旧事 100%推荐', 'http://img3m9.ddimg.cn/93/29/25578129-1_l_2.jpg', '23.8', '1', '3', null, null, '10183', '林海音', '2020-01-01', '0');
INSERT INTO `book` VALUES ('429', '悠长假日', null, null, null, null, '悠长假日 100%推荐', 'http://img3m6.ddimg.cn/45/4/27921906-1_l_3.jpg', '12.8', '1', '3', null, null, '5412', '阿米特?乔杜里', '2020-01-01', '0');
INSERT INTO `book` VALUES ('430', '谎言心理学', null, null, null, null, '谎言心理学 100%推荐', 'http://img3m7.ddimg.cn/15/28/27941577-1_l_3.jpg', '27.4', '1', '3', null, null, '5171', '米兰达?道尔', '2020-01-01', '0');
INSERT INTO `book` VALUES ('431', '微表情密码', null, null, null, null, '微表情密码 100%推荐', 'http://img3m6.ddimg.cn/0/11/27926316-1_l_3.jpg', '25.9', '1', '3', null, null, '5224', '卡西亚?韦佐夫斯基', '2020-01-01', '0');
INSERT INTO `book` VALUES ('432', '焦虑日志', null, null, null, null, '焦虑日志 99.9%推荐', 'http://img3m3.ddimg.cn/20/26/27939503-1_l_3.jpg', '34.3', '1', '3', null, null, '5145', '柯瑞妮?斯威特', '2020-01-01', '0');
INSERT INTO `book` VALUES ('433', '艾迪的告别（法国版《乡下人的悲歌》，比《无声告白》更真实的人生）', null, null, null, null, '艾迪的告别（法国版《乡下人的悲歌》，比《无声告白》更真实的人生） 100%推荐', 'http://img3m6.ddimg.cn/65/24/27921926-1_l_3.jpg', '27.4', '1', '3', null, null, '5488', '爱德华?路易斯', '2020-01-01', '0');
INSERT INTO `book` VALUES ('434', '朝与同歌暮与酒', null, null, null, null, '朝与同歌暮与酒 100%推荐', 'http://img3m7.ddimg.cn/55/16/27918847-1_l_9.jpg', '33.1', '1', '3', null, null, '5511', '关东野客', '2020-01-01', '0');
INSERT INTO `book` VALUES ('435', '愤怒的葡萄', null, null, null, null, '愤怒的葡萄 100%推荐', 'http://img3m0.ddimg.cn/70/3/26914210-1_l_2.jpg', '20.3', '1', '10', null, null, '5072', '约翰?斯坦贝克', '2020-01-01', '0');
INSERT INTO `book` VALUES ('436', '单独中的洞见', null, null, null, null, '单独中的洞见 99.9%推荐', 'http://img3m2.ddimg.cn/73/1/25293682-1_l_3.jpg', '28.4', '1', '10', null, null, '5242', '张方宇', '2020-01-01', '0');
INSERT INTO `book` VALUES ('437', '别让拖延症毁掉你', null, null, null, null, '别让拖延症毁掉你 99.9%推荐', 'http://img3m4.ddimg.cn/38/36/25200884-1_l_3.jpg', '25.9', '1', '10', null, null, '4658', '李世强', '2020-01-01', '0');
INSERT INTO `book` VALUES ('438', '策略：如何在复杂世界里成为高手', null, null, null, null, '策略：如何在复杂世界里成为高手 99.8%推荐', 'http://img3m6.ddimg.cn/6/33/25344996-1_l_3.jpg', '25.9', '1', '10', null, null, '5391', '江潮', '2020-01-01', '0');
INSERT INTO `book` VALUES ('439', '你不该输在情绪上', null, null, null, null, '你不该输在情绪上 99.9%推荐', 'http://img3m5.ddimg.cn/39/0/25200885-1_l_3.jpg', '25.9', '1', '10', null, null, '4653', '李世强', '2020-01-01', '0');
INSERT INTO `book` VALUES ('440', '找回迷失的自己：从自耗到高效逆转', null, null, null, null, '找回迷失的自己：从自耗到高效逆转 100%推荐', 'http://img3m1.ddimg.cn/80/5/25333091-1_l_3.jpg', '24.1', '1', '10', null, null, '21661', '程志良', '2020-01-01', '0');
INSERT INTO `book` VALUES ('441', '零售运营：连锁企业管理手册', null, null, null, null, '零售运营：连锁企业管理手册 100%推荐', 'http://img3m3.ddimg.cn/79/7/27912733-1_l_3.jpg', '32.2', '1', '10', null, null, '4401', '龙晴', '2020-01-01', '0');
INSERT INTO `book` VALUES ('442', '浮生六记', null, null, null, null, '浮生六记 100%推荐', 'http://img3m5.ddimg.cn/11/19/27863165-1_l_6.jpg', '23.8', '1', '10', null, null, '9916', '沈复', '2020-01-01', '0');
INSERT INTO `book` VALUES ('443', '怪你过分美丽（全2册）', null, null, null, null, '怪你过分美丽（全2册） 100%推荐', 'http://img3m5.ddimg.cn/51/25/27948345-1_l_3.jpg', '37.2', '1', '10', null, null, '5689', '未再', '2020-01-01', '0');
INSERT INTO `book` VALUES ('444', '销售团队管理全案：制度管人+流程管事+实用表格', null, null, null, null, '销售团队管理全案：制度管人+流程管事+实用表格 100%推荐', 'http://img3m6.ddimg.cn/36/30/28474416-1_l_3.jpg', '73.0', '1', '10', null, null, '3944', '文希岳', '2020-01-01', '0');
INSERT INTO `book` VALUES ('445', '始料未及爱上你', null, null, null, null, '始料未及爱上你 100%推荐', 'http://img3m1.ddimg.cn/55/11/27928351-1_l_3.jpg', '27.4', '1', '10', null, null, '6018', '惜双双', '2020-01-01', '0');
INSERT INTO `book` VALUES ('446', '永久记录（“棱镜门主角”斯诺登揭露美国监控全世界的真相）', null, null, null, null, '永久记录（“棱镜门主角”斯诺登揭露美国监控全世界的真相） 100%推荐', 'http://img3m5.ddimg.cn/86/22/28475555-1_l_4.jpg', '34.0', '1', '10', null, null, '4951', '民主与建设出版社', '2020-01-01', '0');
INSERT INTO `book` VALUES ('447', '藏在回忆里的风景（全二册）', null, null, null, null, '藏在回忆里的风景（全二册） 100%推荐', 'http://img3m0.ddimg.cn/87/10/25303200-1_l_1.jpg', '34.3', '1', '6', null, null, '9574', '素光同', '2020-01-01', '0');
INSERT INTO `book` VALUES ('448', '林徽因传：时光无言自歌挽', null, null, null, null, '林徽因传：时光无言自歌挽 100%推荐', 'http://img3m1.ddimg.cn/74/28/27909461-1_l_3.jpg', '25.9', '1', '6', null, null, '2332', '孟斜阳', '2020-01-01', '0');
INSERT INTO `book` VALUES ('449', '空间简史(与《时间简史》《人类简史》《未来简史》并称“四大简史”)', null, null, null, null, '空间简史(与《时间简史》《人类简史》《未来简史》并称“四大简史”) 99.9%推荐', 'http://img3m1.ddimg.cn/86/2/25546541-1_l_9.jpg', '9.9', '1', '6', null, null, '4268', '托马斯?马卡卡罗', '2020-01-01', '0');
INSERT INTO `book` VALUES ('450', '玩就对了', null, null, null, null, '玩就对了 100%推荐', 'http://img3m9.ddimg.cn/44/6/28475909-1_l_3.jpg', '29.7', '1', '6', null, null, '2037', '怪兽君', '2020-01-01', '0');
INSERT INTO `book` VALUES ('451', '乖，摸摸头2.0（大冰作品！当当专享100%大冰签名。和大冰一起，DIY专属自己的小乖！）', null, null, null, null, '乖，摸摸头2.0（大冰作品！当当专享100%大冰签名。和大冰一起，DIY专属自己的小乖！） 99.3%推荐', 'http://img3m3.ddimg.cn/43/36/28470463-1_l_12.jpg', '23.3', '1', '6', null, null, '2053', '大冰', '2020-01-01', '0');
INSERT INTO `book` VALUES ('452', '最佳命中率', null, null, null, null, '最佳命中率 100%推荐', 'http://img3m2.ddimg.cn/24/16/25301652-1_l_3.jpg', '34.3', '1', '6', null, null, '8485', '六识', '2020-01-01', '0');
INSERT INTO `book` VALUES ('453', '马男波杰克：幕后艺术集―当当专享角色异形书签版', null, null, null, null, '马男波杰克：幕后艺术集―当当专享角色异形书签版 100%推荐', 'http://img3m5.ddimg.cn/86/18/27873635-1_l_6.jpg', '49.9', '1', '6', null, null, '2170', '克里斯?麦克唐纳', '2020-01-01', '0');
INSERT INTO `book` VALUES ('454', '无可替代的你', null, null, null, null, '无可替代的你 99.9%推荐', 'http://img3m8.ddimg.cn/90/28/25197768-1_l_8.jpg', '19.4', '1', '6', null, null, '7712', '四十二吨', '2020-01-01', '0');
INSERT INTO `book` VALUES ('455', '品牌营销：新零售时代品牌运营', null, null, null, null, '品牌营销：新零售时代品牌运营 99.9%推荐', 'http://img3m6.ddimg.cn/11/6/26482016-1_l_4.jpg', '41.9', '1', '6', null, null, '5106', '官税冬', '2020-01-01', '0');
INSERT INTO `book` VALUES ('456', '云深知景年', null, null, null, null, '云深知景年 100%推荐', 'http://img3m8.ddimg.cn/26/24/26490248-1_l_15.jpg', '14.8', '1', '6', null, null, '10221', '安念青', '2020-01-01', '0');
INSERT INTO `book` VALUES ('457', '安娜（“没有人写的比梅根?莱丽好！”星际宇宙、身世之谜、变异、幻觉、暗恋、成长……校园科幻小说经典之作，在这里追溯本源，探寻真实）纤阅出品', null, null, null, null, '安娜（“没有人写的比梅根?莱丽好！”星际宇宙、身世之谜、变异、幻觉、暗恋、成长……校园科幻小说经典之作，在这里追溯本源，探寻真实）纤阅出品 100%推荐', 'http://img3m7.ddimg.cn/7/25/25345987-1_l_3.jpg', '39.6', '1', '6', null, null, '6335', '梅根?莱丽', '2020-01-01', '0');
INSERT INTO `book` VALUES ('458', '欧布奥特曼宇宙浪客炫图故事（全4册）', null, null, null, null, '欧布奥特曼宇宙浪客炫图故事（全4册） 100%推荐', 'http://img3m9.ddimg.cn/23/10/27904559-1_l_3.jpg', '57.4', '1', '6', null, null, '939', '上海新创华文化发展有限公司', '2020-01-01', '0');
INSERT INTO `book` VALUES ('459', '人人都能学会的刷屏文案写作技巧', null, null, null, null, '人人都能学会的刷屏文案写作技巧 100%推荐', 'http://img3m8.ddimg.cn/3/21/27928398-1_l_3.jpg', '33.8', '1', '14', null, null, '995', '吕白', '2020-01-01', '0');
INSERT INTO `book` VALUES ('460', '快手营销138招：一本书教会你玩赚快手', null, null, null, null, '快手营销138招：一本书教会你玩赚快手 100%推荐', 'http://img3m9.ddimg.cn/66/36/27943509-1_l_3.jpg', '40.7', '1', '14', null, null, '1087', '共响新商业研究院', '2020-01-01', '0');
INSERT INTO `book` VALUES ('461', '我们向往的生活――12道家常菜的生活哲学', null, null, null, null, '我们向往的生活――12道家常菜的生活哲学 99.9%推荐', 'http://img3m0.ddimg.cn/84/25/27942240-1_l_6.jpg', '43.3', '1', '14', null, null, '1018', '向往的生活', '2020-01-01', '0');
INSERT INTO `book` VALUES ('462', '爆款文案：内容写作技巧与营销策划实操', null, null, null, null, '爆款文案：内容写作技巧与营销策划实操 100%推荐', 'http://img3m3.ddimg.cn/69/10/28477023-1_l_1.jpg', '40.8', '1', '14', null, null, '994', '电子工业出版社', '2020-01-01', '0');
INSERT INTO `book` VALUES ('463', '所有的人生磨难，不过是命运馈赠的礼物（专供亲笔签名本，新锐人气作者怡安首本励志随笔集！全网超千万阅读，无数读者找到共鸣!赠明信片3张）', null, null, null, null, '所有的人生磨难，不过是命运馈赠的礼物（专供亲笔签名本，新锐人气作者怡安首本励志随笔集！全网超千万阅读，无数读者找到共鸣!赠明信片3张） 100%推荐', 'http://img3m7.ddimg.cn/17/25/27943757-1_l_9.jpg', '16.3', '1', '14', null, null, '1007', '怡安', '2020-01-01', '0');
INSERT INTO `book` VALUES ('464', '牛虻（没有信念的人生，不值得活！中国人的信念之书，口碑译本，刘小枫教授解读推荐，新课标课外阅读推荐书目）【果麦经典】', null, null, null, null, '牛虻（没有信念的人生，不值得活！中国人的信念之书，口碑译本，刘小枫教授解读推荐，新课标课外阅读推荐书目）【果麦经典】 100%推荐', 'http://img3m2.ddimg.cn/67/14/27940342-1_l_6.jpg', '24.9', '1', '14', null, null, '997', '埃塞尔?丽莲?伏尼契', '2020-01-01', '0');
INSERT INTO `book` VALUES ('465', '给教师的建议：全新修订版（中国教育学会副会长朱永新诚挚推荐）', null, null, null, null, '给教师的建议：全新修订版（中国教育学会副会长朱永新诚挚推荐） 100%推荐', 'http://img3m3.ddimg.cn/11/26/27912863-1_l_3.jpg', '29.3', '1', '14', null, null, '995', '叶圣陶', '2020-01-01', '0');
INSERT INTO `book` VALUES ('466', '伊索寓言（精装彩插全集）（译自牛津百年经典版本；新锐插画师40幅手绘大图；经典名著，给孩子高品质的精装超值版）【果麦经典】', null, null, null, null, '伊索寓言（精装彩插全集）（译自牛津百年经典版本；新锐插画师40幅手绘大图；经典名著，给孩子高品质的精装超值版）【果麦经典】 100%推荐', 'http://img3m5.ddimg.cn/65/17/27941825-1_l_2.jpg', '39.0', '1', '13', null, null, '936', '伊索', '2020-01-01', '0');
INSERT INTO `book` VALUES ('467', '锁定高端：中小企业的出路（中国600家龙头企业实战验证的方法论，卫哲、江南春亲笔作序！）', null, null, null, null, '锁定高端：中小企业的出路（中国600家龙头企业实战验证的方法论，卫哲、江南春亲笔作序！） 100%推荐', 'http://img3m2.ddimg.cn/82/13/27931942-1_l_3.jpg', '46.9', '1', '13', null, null, '928', '李践', '2020-01-01', '0');
INSERT INTO `book` VALUES ('468', '文心：全新修订版（豆瓣9.1高分评论，北京四中、人大附中名师推荐）', null, null, null, null, '文心：全新修订版（豆瓣9.1高分评论，北京四中、人大附中名师推荐） 100%推荐', 'http://img3m6.ddimg.cn/23/13/27912776-1_l_3.jpg', '30.6', '1', '13', null, null, '990', '夏?D尊', '2020-01-01', '0');
INSERT INTO `book` VALUES ('469', '七十二堂写作课：全新修订版（文学爱好者、教育工作者、新媒体从业人员常备案头书）', null, null, null, null, '七十二堂写作课：全新修订版（文学爱好者、教育工作者、新媒体从业人员常备案头书） 100%推荐', 'http://img3m2.ddimg.cn/59/12/27912812-1_l_3.jpg', '46.6', '1', '13', null, null, '995', '夏?D尊', '2020-01-01', '0');
INSERT INTO `book` VALUES ('470', '人间值得（90岁心理医生恒子奶奶写给生活的哲思小书）', null, null, null, null, '人间值得（90岁心理医生恒子奶奶写给生活的哲思小书） 99.9%推荐', 'http://img3m6.ddimg.cn/39/17/27931206-1_l_544.jpg', '37.2', '1', '13', null, null, '3087', '中村恒子', '2020-01-01', '0');
INSERT INTO `book` VALUES ('471', '爆单法则：打赢餐饮外卖的下半场', null, null, null, null, '爆单法则：打赢餐饮外卖的下半场 100%推荐', 'http://img3m0.ddimg.cn/59/10/28476320-1_l_3.jpg', '48.1', '1', '13', null, null, '852', '中国铁道出版社', '2020-01-01', '0');
INSERT INTO `book` VALUES ('472', '妖怪杂货店（日本悬疑志怪小说重磅巅峰之作！14篇凄迷曲折的鬼魅故事，离奇诡异、窥探人心！）', null, null, null, null, '妖怪杂货店（日本悬疑志怪小说重磅巅峰之作！14篇凄迷曲折的鬼魅故事，离奇诡异、窥探人心！） 99.9%推荐', 'http://img3m1.ddimg.cn/89/3/27915911-1_l_3.jpg', '16.3', '1', '13', null, null, '880', '冈本绮堂', '2020-01-01', '0');
INSERT INTO `book` VALUES ('473', '四时之美：丰子恺节令书', null, null, null, null, '四时之美：丰子恺节令书 100%推荐', 'http://img3m8.ddimg.cn/37/17/27931798-1_l_9.jpg', '19.4', '1', '12', null, null, '843', '丰子恺', '2020-01-01', '0');
INSERT INTO `book` VALUES ('474', '怎样写作：全新修订版（备受推崇的21堂极简写作进阶课，上海市教育委员会官微推荐）', null, null, null, null, '怎样写作：全新修订版（备受推崇的21堂极简写作进阶课，上海市教育委员会官微推荐） 100%推荐', 'http://img3m7.ddimg.cn/5/20/27912857-1_l_3.jpg', '46.6', '1', '12', null, null, '998', '叶圣陶', '2020-01-01', '0');
INSERT INTO `book` VALUES ('475', '外卖超级运营术', null, null, null, null, '外卖超级运营术 99.9%推荐', 'http://img3m6.ddimg.cn/97/28/27906316-1_l_6.jpg', '41.2', '1', '12', null, null, '839', '饿了么', '2020-01-01', '0');
INSERT INTO `book` VALUES ('476', '大师和玛格丽特（余华5674字内容导读，独家收录10幅俄罗斯金奖插画！又译作“大师与玛格丽特”）【果麦经典】', null, null, null, null, '大师和玛格丽特（余华5674字内容导读，独家收录10幅俄罗斯金奖插画！又译作“大师与玛格丽特”）【果麦经典】 100%推荐', 'http://img3m6.ddimg.cn/65/20/27942716-1_l_8.jpg', '32.5', '1', '12', null, null, '1001', '布尔加科夫', '2020-01-01', '0');
INSERT INTO `book` VALUES ('477', '别说你懂红酒', null, null, null, null, '别说你懂红酒 100%推荐', 'http://img3m4.ddimg.cn/90/6/27938484-1_l_3.jpg', '43.3', '1', '12', null, null, '997', '小久保尊', '2020-01-01', '0');
INSERT INTO `book` VALUES ('478', '人间失格（日本小说家太宰治的自传体小说，李现推荐）', null, null, null, null, '人间失格（日本小说家太宰治的自传体小说，李现推荐） 100%推荐', 'http://img3m5.ddimg.cn/56/4/23761145-1_l_6.jpg', '17.5', '1', '12', null, null, '16395', '太宰治', '2020-01-01', '0');
INSERT INTO `book` VALUES ('479', '谜案鉴赏', null, null, null, null, '谜案鉴赏 100%推荐', 'http://img3m1.ddimg.cn/66/36/28470981-1_l_3.jpg', '35.8', '1', '12', null, null, '17634', '莉比?菲舍尔?赫尔曼', '2020-01-01', '0');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `btid` int(11) NOT NULL auto_increment,
  `btname` varchar(20) default NULL,
  `btnamesecond` varchar(20) default NULL,
  `btnamethird` varchar(20) default NULL,
  `bttemp` varchar(255) default NULL,
  `btstate` int(2) default '1',
  PRIMARY KEY  (`btid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '教材区', null, null, '', '1');
INSERT INTO `booktype` VALUES ('2', '工具书区', null, null, null, '1');
INSERT INTO `booktype` VALUES ('3', '分享区', null, null, null, '1');
INSERT INTO `booktype` VALUES ('4', '教材区', '成功励志', null, null, '1');
INSERT INTO `booktype` VALUES ('5', '教材区', '法律', null, null, '1');
INSERT INTO `booktype` VALUES ('6', '教材区', '管理', null, null, '1');
INSERT INTO `booktype` VALUES ('7', '教材区', '计算机与网络', null, null, '1');
INSERT INTO `booktype` VALUES ('8', '教材区', '教育考试', null, null, '1');
INSERT INTO `booktype` VALUES ('9', '教材区', '科技工程', null, null, '1');
INSERT INTO `booktype` VALUES ('10', '教材区', '生活时尚', null, null, '1');
INSERT INTO `booktype` VALUES ('11', '教材区', '文化历史', null, null, '1');
INSERT INTO `booktype` VALUES ('12', '工具书区', '英语四六级', null, null, '1');
INSERT INTO `booktype` VALUES ('13', '工具书区', '公务员资料', null, null, '1');
INSERT INTO `booktype` VALUES ('14', '工具书区', '考研资料', null, null, '1');
INSERT INTO `booktype` VALUES ('15', '工具书区', '雅思托福', null, null, '1');
INSERT INTO `booktype` VALUES ('16', '工具书区', '其他', null, null, '1');
INSERT INTO `booktype` VALUES ('17', '教材区', '成功励志', '名人名言', null, '1');
INSERT INTO `booktype` VALUES ('18', '教材区', '成功励志', '名人传记', null, '1');

-- ----------------------------
-- Table structure for control
-- ----------------------------
DROP TABLE IF EXISTS `control`;
CREATE TABLE `control` (
  `conid` int(11) NOT NULL auto_increment,
  `coname` varchar(11) default NULL,
  `conamesecond` varchar(11) default NULL,
  `conadd` int(2) default '1',
  `condelete` int(2) default '1',
  `coninsert` int(2) default '1',
  `conupdate` int(2) default '1',
  `concheck` int(2) default '1',
  `uid` int(11) default NULL,
  `constate` int(11) default '1',
  `contemp` varchar(255) default NULL,
  PRIMARY KEY  (`conid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of control
-- ----------------------------
INSERT INTO `control` VALUES ('1', '书籍管理', null, '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('2', '书籍管理', '书籍类表', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('3', '书籍管理', '分类管理', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('4', '图片管理', null, '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('5', '图片管理', '广告管理', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('6', '支付管理', '', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('7', '支付管理', '支付方式', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('8', '支付管理', '支付配置', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('9', '用户管理', null, '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('10', '用户管理', '用户列表', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('11', '用户管理', '等级管理', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('12', '用户管理', '用户记录', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('13', '消息管理', null, '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('14', '消息管理', '留言列表', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('15', '消息管理', '意见反馈', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('16', '公告管理', null, '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('17', '公告管理', '公告列表', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('18', '公告管理', '公告管理', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('19', '系统管理', null, '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('20', '系统管理', '系统栏目', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('21', '系统管理', '系统日志', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('22', '管理员管理', null, '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('23', '管理员管理', '权限管理', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('24', '管理员管理', '管理员列表', '1', '1', '1', '1', '1', null, '1', null);
INSERT INTO `control` VALUES ('25', '管理员管理', '个人信息', '1', '1', '1', '1', '1', null, '1', null);

-- ----------------------------
-- Table structure for eorder
-- ----------------------------
DROP TABLE IF EXISTS `eorder`;
CREATE TABLE `eorder` (
  `eoid` varchar(32) NOT NULL,
  `uid` int(11) default NULL,
  `eostate` int(2) default '1',
  `eotime` varchar(20) default NULL,
  `eotemp` varchar(255) default NULL,
  `uname` varchar(20) default NULL,
  `eoaddr` varchar(1000) default NULL,
  `eotype` varchar(10) default NULL,
  `eoespress` varchar(20) default NULL,
  `eopaytypeid` int(10) default NULL,
  PRIMARY KEY  (`eoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eorder
-- ----------------------------
INSERT INTO `eorder` VALUES ('1446bc2d89544dbdb5747763110cd6b4', '1', '1', '2019-12-01', '18873251434', '三儿', '湖南工学院', '在线支付', '天天快递', '1');
INSERT INTO `eorder` VALUES ('2', '2', '2', '2019-12-07', '18873251434', '李四', '天子脚下', '在线支付', '天天快递', '2');
INSERT INTO `eorder` VALUES ('3', '1', '3', '2019-12-01', '18873251434', '张胜男', '天子脚下', '货到付款', '圆通快递', '2');
INSERT INTO `eorder` VALUES ('4', '1', '5', '2019-8-10', '', '张三', '天子脚下', '在线支付', '韵达快递', '1');
INSERT INTO `eorder` VALUES ('5324cc04cf19429e9d057bd6287d39e8', '1', '2', '2019-12-21', '18873251434', '小苹果', '湖南省湘乡市', '在线支付', null, '1');
INSERT INTO `eorder` VALUES ('6f0467820f6c43d2ba3dc27b29167767', '1', '2', '2019-12-01', '18873252332', '小四', '计信学院', '店面接取', '天天快递', '1');
INSERT INTO `eorder` VALUES ('7a2bb74453194537be593a826403a46d', '1', '2', '2019-12-21', '18873251434', '小红果', '湖南省湘西市', '在线支付', null, '1');
INSERT INTO `eorder` VALUES ('98585bc6249e49a1ab8a419f05ed0bbb', '1', '7', '2019-12-01', '', '不知名', '天子脚下', '货到付款', '中通快递', '2');
INSERT INTO `eorder` VALUES ('bba288d434394e9bb5ddade67221c067', '1', '2', '2019-12-21', '18873251434', '小红果', '湖南省湘西市', '在线支付', null, '1');
INSERT INTO `eorder` VALUES ('c3eafec8d5474c31aa5fee7c6b25f9a1', '1', '3', '2019-12-17', '', '彭算泉', '湖南省衡阳市珠晖区湖南工学院', '在线支付', '', '2');
INSERT INTO `eorder` VALUES ('deea4513abc84e4d8742f3ce9da8a1b2', '1', '2', '2019-12-21', '18873251434', '贝克汉姆', '天子脚下湖南工学院', '在线支付', null, '1');
INSERT INTO `eorder` VALUES ('ef6ea077f42846ea9dc82822544cb8c7', '1', '3', '2019-12-21', '', '小红果', '湖南省湘西市', '在线支付', '天天快递', '1');

-- ----------------------------
-- Table structure for eorderitem
-- ----------------------------
DROP TABLE IF EXISTS `eorderitem`;
CREATE TABLE `eorderitem` (
  `itemid` varchar(32) NOT NULL,
  `count` int(10) default '1',
  `bid` int(11) default NULL,
  `eoid` varchar(32) default NULL,
  `total` double(12,1) default NULL,
  `eitemp` varchar(255) default NULL,
  `uid` int(11) default NULL,
  `cartstate` int(2) default '1',
  `carttime` varchar(30) default NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eorderitem
-- ----------------------------
INSERT INTO `eorderitem` VALUES ('05a01b0fdf02407eac5763685f4452f1', '1', '5', '', '56.0', '', '1', '1', '2019-12-01');
INSERT INTO `eorderitem` VALUES ('094b04cbd033467389adb59b1cad6316', '12', '4', '98585bc6249e49a1ab8a419f05ed0bbb', '672.0', '', '1', '2', '2019-12-01');
INSERT INTO `eorderitem` VALUES ('1591172de87d438b94d4755c4027f3e6', '1', '1035', '1446bc2d89544dbdb5747763110cd6b4', '23.8', '', '1', '2', '2019-12-01');
INSERT INTO `eorderitem` VALUES ('17b0cfe535d841808fa7a2bf61341976', '1', '1037', null, '35.8', '', '1', '1', '2019-12-07');
INSERT INTO `eorderitem` VALUES ('28999d6a34d7448489088d646de30dd0', '12', '5', '813f79877db54234b0f79079f191e467', '672.0', '', '1', '2', '2019-12-01');
INSERT INTO `eorderitem` VALUES ('2a7935526c764137a9db96f9ce02eccc', '1', '5', null, '56.0', null, '1', '1', '2019-12-17');
INSERT INTO `eorderitem` VALUES ('2b3b11021f3d4ac0a1849f1a1db90b9a', '1', '1037', '6f0467820f6c43d2ba3dc27b29167767', '35.8', '', '1', '2', '2019-12-01');
INSERT INTO `eorderitem` VALUES ('3', '3', '3', '2', '174.0', '', '2', '2', '2019-8-10');
INSERT INTO `eorderitem` VALUES ('323cb71fa94d42f0bcb6334446b0f939', '1', '5', null, '56.0', null, '1', '2', '2019-12-17');
INSERT INTO `eorderitem` VALUES ('3a385c67a3e74020b891e8c52b5dfad3', '1', '6', null, '56.0', null, '1', '1', '2019-12-17');
INSERT INTO `eorderitem` VALUES ('3eabf94445064c6a8a09859e4e95e2f6', '2', '1', null, '89.7', null, '1', '1', '2019-12-17');
INSERT INTO `eorderitem` VALUES ('4', '4', '4', '4', '23232.0', '', '1', '2', '2019-8-10');
INSERT INTO `eorderitem` VALUES ('5362e280a7a04dd7ac18191fe3bc0176', '1', '1', 'bba288d434394e9bb5ddade67221c067', '89.7', '', '1', '2', '2019-12-17');
INSERT INTO `eorderitem` VALUES ('6', '1', '6', '3', '56.0', '', '1', '2', '2019-8-10');
INSERT INTO `eorderitem` VALUES ('6809d270023948098f5e18b772daf386', '1', '1', 'ef6ea077f42846ea9dc82822544cb8c7', '89.7', null, '1', '2', '2019-12-17');
INSERT INTO `eorderitem` VALUES ('7', '7', '695', '5324cc04cf19429e9d057bd6287d39e8', '313.0', '', '1', '2', '2019-8-10');
INSERT INTO `eorderitem` VALUES ('8', '8', '696', '5', '314.0', '', '1', '2', '2019-8-10');
INSERT INTO `eorderitem` VALUES ('97e10451b4bd4fdf916cae1e85230d93', '12', '4', null, '672.0', '', '1', '1', '2019-12-01');
INSERT INTO `eorderitem` VALUES ('9d82b651464f4ac2ad58cf6861c30848', '1', '1', null, '89.7', null, '1', '1', '2019-12-17');
INSERT INTO `eorderitem` VALUES ('ae2373c63bfd40bea20bfc3ea3b12d85', '1', '1', null, '89.7', null, '1', '1', '2019-12-17');
INSERT INTO `eorderitem` VALUES ('afb8050b017c4ab1bda9004bed64ce9a', '2', '1', null, '179.4', null, '1', '1', '2019-12-17');
INSERT INTO `eorderitem` VALUES ('ba755a46b3594dbeba7297c0f045ffd8', '1', '1035', null, '23.8', '', '15', '1', '2019-12-01');
INSERT INTO `eorderitem` VALUES ('bebf895167154ce5b73990e68418570a', '1', '6', 'c3eafec8d5474c31aa5fee7c6b25f9a1', '56.0', '', '1', '2', '2019-12-17');
INSERT INTO `eorderitem` VALUES ('c0bb15c24f5a48ee8d85b5255be80fbe', '1', '1616', '7a2bb74453194537be593a826403a46d', '25.2', '', '15', '2', '2019-12-01');
INSERT INTO `eorderitem` VALUES ('d3328a18f11544288e3419e6b695bac3', '1', '1', null, '89.7', null, '1', '1', '2019-12-17');
INSERT INTO `eorderitem` VALUES ('d86ab23bb392444a98c302da6d24b033', '12', '1037', null, '429.6', '', '1', '1', '2019-12-07');
INSERT INTO `eorderitem` VALUES ('f7cdea3a3be54e7c80956d91b11242fa', '1', '700', null, '39.0', null, '1', '1', '2019-12-12');
INSERT INTO `eorderitem` VALUES ('fbecdcb1c02c425e84fffab6df387f9a', '2', '1', null, '179.4', null, '1', '1', '2019-12-17');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `nid` int(11) NOT NULL auto_increment,
  `ntime` varchar(255) default NULL,
  `nnumber` int(11) default '1',
  `nauthor` varchar(20) default NULL,
  `ncontent` varchar(20000) default NULL,
  `nstate` int(2) default '1',
  `ntemp` varchar(255) default NULL,
  `ntitle` varchar(255) default NULL,
  PRIMARY KEY  (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '2019/9/10', '500', '易书网客服中心', '亲爱的易书网顾客，您好：\r\n天津：受天津地区突发事件的影响，发往滨海新区（塘沽）的订单会有延迟配送的情况，如果您订购的商品未能及时送达，请先耐心等待！感谢大家的理解，惟愿平安！\r\n福建：受暴雨天气影响，8月19日易书网在福建地区的配送服务将无法正常进行，受影响的订单预计推迟1天配送，如果您订购的商品未能及时送达，请先耐心等待。\r\n江苏：受暴雨天气影响，8月19日至8月20日期间，易书网在江苏地区的配送服务将无法正常进行，受影响的订单预计推迟1天配送，如果您订购的商品未能及时送达，请先耐心等待。\r\n湖北、湖南、广西：受暴雨天气影响，8月18日至8月19日期间，易书网在湖北、湖南、广西部分地区的配送服务将无法正常进行，受影响的订单预计于暴雨过后推迟1天配送,如果您订购的商品未能及时送达，千万别着急，暴雨过后，我们一定会快马加鞭，马不停蹄地为您配。\r\n云南、贵州、四川：受暴雨天气影响，8月20日至8月21日期间，易书网在云南、贵州、四川部分地区的配送服务将无法正常进行，受影响的订单预计于暴雨过后推迟1天配送,如果您订购的商品未能及时送达，千万别着急，暴雨过后，我们一定会快马加鞭，马不停蹄地为您配。\r\n给亲爱的造成的不便，请谅解！祝您生活愉快！\r\n', '1', '0', '华南地区');
INSERT INTO `notice` VALUES ('2', '2019/10/10', '245', '易书网客服中心', '亲爱的易书网顾客，您好：\r\n天津：受天津地区突发事件的影响，发往滨海新区（塘沽）的订单会有延迟配送的情况，如果您订购的商品未能及时送达，请先耐心等待！感谢大家的理解，惟愿平安！\r\n福建：受暴雨天气影响，8月19日易书网在福建地区的配送服务将无法正常进行，受影响的订单预计推迟1天配送，如果您订购的商品未能及时送达，请先耐心等待。\r\n江苏：受暴雨天气影响，8月19日至8月20日期间，易书网在江苏地区的配送服务将无法正常进行，受影响的订单预计推迟1天配送，如果您订购的商品未能及时送达，请先耐心等待。\r\n湖北、湖南、广西：受暴雨天气影响，8月18日至8月19日期间，易书网在湖北、湖南、广西部分地区的配送服务将无法正常进行，受影响的订单预计于暴雨过后推迟1天配送,如果您订购的商品未能及时送达，千万别着急，暴雨过后，我们一定会快马加鞭，马不停蹄地为您配。\r\n云南、贵州、四川：受暴雨天气影响，8月20日至8月21日期间，易书网在云南、贵州、四川部分地区的配送服务将无法正常进行，受影响的订单预计于暴雨过后推迟1天配送,如果您订购的商品未能及时送达，千万别着急，暴雨过后，我们一定会快马加鞭，马不停蹄地为您配。\r\n给亲爱的造成的不便，请谅解！祝您生活愉快！\r\n', '1', null, '华南地区');
INSERT INTO `notice` VALUES ('3', '2019/10/17', '888', '易书网客服中心', '亲爱的易书网顾客，您好：\r\n天津：受天津地区突发事件的影响，发往滨海新区（塘沽）的订单会有延迟配送的情况，如果您订购的商品未能及时送达，请先耐心等待！感谢大家的理解，惟愿平安！\r\n福建：受暴雨天气影响，8月19日易书网在福建地区的配送服务将无法正常进行，受影响的订单预计推迟1天配送，如果您订购的商品未能及时送达，请先耐心等待。\r\n江苏：受暴雨天气影响，8月19日至8月20日期间，易书网在江苏地区的配送服务将无法正常进行，受影响的订单预计推迟1天配送，如果您订购的商品未能及时送达，请先耐心等待。\r\n湖北、湖南、广西：受暴雨天气影响，8月18日至8月19日期间，易书网在湖北、湖南、广西部分地区的配送服务将无法正常进行，受影响的订单预计于暴雨过后推迟1天配送,如果您订购的商品未能及时送达，千万别着急，暴雨过后，我们一定会快马加鞭，马不停蹄地为您配。\r\n云南、贵州、四川：受暴雨天气影响，8月20日至8月21日期间，易书网在云南、贵州、四川部分地区的配送服务将无法正常进行，受影响的订单预计于暴雨过后推迟1天配送,如果您订购的商品未能及时送达，千万别着急，暴雨过后，我们一定会快马加鞭，马不停蹄地为您配。\r\n给亲爱的造成的不便，请谅解！祝您生活愉快！\r\n', '1', '0', '华南地区');
INSERT INTO `notice` VALUES ('4', '2019/11/10', '354', '易书网客服中心', '受天津地区突发事件的影响，发往滨海新区（塘沽）的订单会有延迟配送的情况，如果您订购的商品未能及时送达，请先耐心等待！感谢大家的理解，惟愿平安！', '1', '0', '华南地区');

-- ----------------------------
-- Table structure for paytype
-- ----------------------------
DROP TABLE IF EXISTS `paytype`;
CREATE TABLE `paytype` (
  `eopaytypeid` int(11) NOT NULL auto_increment,
  `eopayname` varchar(30) default NULL,
  `eopaystate` int(11) default '1',
  `eopaytemp` varchar(255) default NULL,
  PRIMARY KEY  (`eopaytypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paytype
-- ----------------------------
INSERT INTO `paytype` VALUES ('1', '支付宝', '1', null);
INSERT INTO `paytype` VALUES ('2', '线下支付', '1', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `uname` varchar(20) default NULL,
  `uphone` varchar(11) default NULL,
  `university` varchar(20) default NULL,
  `ucollege` varchar(20) default NULL,
  `umajor` varchar(20) default NULL,
  `uclass` varchar(10) default NULL,
  `upassword` varchar(20) default NULL,
  `ustate` int(2) default '1',
  `utemp` varchar(255) default NULL,
  `utype` int(2) default '2',
  `uemail` varchar(30) default NULL,
  `utime` varchar(30) default NULL,
  `usex` int(2) default '0',
  `uage` int(3) default '0',
  `uminname` varchar(50) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '张三', '15873252399', '湖南理工学院', '机械学院', '电子及其自动化工程', '大二', 'psq520', '1', '', '4', '1139286771@qq.com', '2017-10-9', '1', '34', '我是大老虎');
INSERT INTO `user` VALUES ('2', '李四', '18873251434', '湖南工学院', '计算机与信息科学', '软件工程', '大二', 'lisi12', '1', '', '2', '1139356771@qq.com', '2018-10-9', '1', '25', '小四');
INSERT INTO `user` VALUES ('3', '小红', '18873251434', '湖南工学院', '外国语', '英语', '大三', 'xiaohong', '1', '', '3', '1138386771@qq.com', '2015-10-9', '2', '32', '小红');
INSERT INTO `user` VALUES ('4', '王五', '18873251434', null, null, null, '', 'wangwu', '1', '', '5', '1179386771@qq.com', '2010-10-9', '1', '32', '小五');
INSERT INTO `user` VALUES ('5', 'admin', '18934334544', null, null, null, null, 'psq520', '1', '', '1', '14574899935@qq.com', '2010-10-19', '1', '37', 'admin');
INSERT INTO `user` VALUES ('7', '完颜阿骨打', '18873251434', null, null, null, null, 'aaaa8888', '1', '', '3', null, '2010-10-19', '0', '0', null);
INSERT INTO `user` VALUES ('9', '彭算泉', '18873251434', null, null, null, null, 'psq520', '1', null, '5', '1169386771@qq.com', '2010-10-19', '0', '0', null);
INSERT INTO `user` VALUES ('10', 'nihao', '18873251434', null, null, null, null, 'aaa111', '1', null, '5', '1159386771@qq.com', '2010-10-19', '0', '0', null);
INSERT INTO `user` VALUES ('11', 'fdsaf', '18873251434', null, null, null, null, 'qqq111', '1', null, '5', '1149386771@qq.com', '2010-10-19', '0', '0', null);
INSERT INTO `user` VALUES ('12', 'qwe', '18873251434', null, null, null, null, 'psq123', '1', '', '5', '1239386771@qq.com', '2010-10-19', '1', '0', null);
INSERT INTO `user` VALUES ('13', '张笑天', '18873251444', '湖南大学', '外国语学院', '机械设计制造及其自动化', null, 'qqq111', '1', null, '2', '1139386772@qq.com', '2010-10-19', '0', '0', null);
INSERT INTO `user` VALUES ('14', 'lh', '13898734562', '北京大学', '计算机与信息科学学院', '软件工程', null, 'aa123123', '1', null, '2', '1511181137@qq.com', '2010-10-19', '0', '0', null);
INSERT INTO `user` VALUES ('15', 'lyw', '13948642457', '湖南工学院', '机械学院', '机械设计制造及其自动化', null, 'aa123123', '1', null, '2', '565533463@qq.com', '2010-10-19', '0', '0', null);
INSERT INTO `user` VALUES ('16', 'qw', null, null, null, null, null, 'aa111111', '2', '', '2', null, '2010-10-19', '0', '0', null);
INSERT INTO `user` VALUES ('17', '小黑', '18873251435', '南开大学', '外国语学院', '网络工程', null, 'Psq123', '1', null, '2', '1139386777@qq.com', '2010-10-19', '0', '0', null);
INSERT INTO `user` VALUES ('18', '张胜男', '18873251436', '南京大学', '机械学院', '建筑学', null, 'psq520', '1', null, '2', '1139386778@qq.com', '2010-10-19', '0', '0', null);
INSERT INTO `user` VALUES ('19', '王胜', '18873251439', '湖南工学院', '机械学院', '建筑学', null, 'psq520', '1', null, '2', '1139386770@qq.com', '2019-12-11', '0', '0', '用户d87218937c');
INSERT INTO `user` VALUES ('20', '疾风剑豪', '18873252337', null, null, null, null, 'aaaa8888', '1', null, '2', '1139386776@qq.com', '2019-12-11', '0', '0', '用户d86218937c');
INSERT INTO `user` VALUES ('21', '德玛西亚', '18873252332', null, null, null, null, 'aaaa8888', '1', null, '2', '1139386779@qq.com', '2019-12-18', '0', '0', '用户716692dd76');
INSERT INTO `user` VALUES ('22', '德玛西亚之力', '18873251223', null, null, null, null, 'aaaa8888', '1', '', '2', '1139389776@qq.com', '2019-12-18', '0', '0', '用户78ac425791');
INSERT INTO `user` VALUES ('23', '张浩', '18873252334', null, null, null, null, 'aaaa8888', '1', null, '5', '1139386771@qq.com', '2019-12-19', '1', '0', null);
INSERT INTO `user` VALUES ('24', '李湘', '18893251434', null, null, null, null, 'aaaa8888', '1', null, '5', '1132386776@qq.com', '2019-12-19', '0', '0', null);

-- ----------------------------
-- Table structure for usercontrol
-- ----------------------------
DROP TABLE IF EXISTS `usercontrol`;
CREATE TABLE `usercontrol` (
  `ucon` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `conid` int(11) default NULL,
  PRIMARY KEY  (`ucon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usercontrol
-- ----------------------------
INSERT INTO `usercontrol` VALUES ('1', '5', '1');
INSERT INTO `usercontrol` VALUES ('2', '5', '4');
INSERT INTO `usercontrol` VALUES ('3', '5', '9');
INSERT INTO `usercontrol` VALUES ('4', '5', '13');
INSERT INTO `usercontrol` VALUES ('5', '5', '16');
INSERT INTO `usercontrol` VALUES ('6', '5', '19');
INSERT INTO `usercontrol` VALUES ('7', '5', '22');
INSERT INTO `usercontrol` VALUES ('8', '5', '6');
INSERT INTO `usercontrol` VALUES ('9', '4', '1');
INSERT INTO `usercontrol` VALUES ('10', '5', '12');
INSERT INTO `usercontrol` VALUES ('11', '5', '11');
INSERT INTO `usercontrol` VALUES ('12', '5', '10');
INSERT INTO `usercontrol` VALUES ('13', '5', '21');
INSERT INTO `usercontrol` VALUES ('14', '5', '20');
INSERT INTO `usercontrol` VALUES ('15', '5', '25');
INSERT INTO `usercontrol` VALUES ('16', '5', '24');
INSERT INTO `usercontrol` VALUES ('17', '5', '23');
INSERT INTO `usercontrol` VALUES ('18', '5', '5');
INSERT INTO `usercontrol` VALUES ('19', '5', '3');
INSERT INTO `usercontrol` VALUES ('20', '5', '2');
INSERT INTO `usercontrol` VALUES ('21', '5', '18');
INSERT INTO `usercontrol` VALUES ('22', '5', '17');
INSERT INTO `usercontrol` VALUES ('23', '5', '15');
INSERT INTO `usercontrol` VALUES ('24', '5', '14');
