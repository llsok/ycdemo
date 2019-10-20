SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bookid` int(11) default NULL,
  `bookname` varchar(40) default NULL,
  `bookpress` varchar(40) default NULL,
  `pressdate` varchar(40) default NULL,
  `bookauthor` varchar(40) default NULL,
  `bookcount` int(11) default NULL,
  `bookincount` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('101', '计算机组成原理', '川大出版社', '2005-03-19', '张永强', '3', '3');
INSERT INTO `books` VALUES ('102', '数据库', '清华出版社', '2007-10-04', '周杰伦', '2', '2');
INSERT INTO `books` VALUES ('103', '徐志摩诗集', '永强出版社', '2001-02-29', '徐志摩', '1', '1');
INSERT INTO `books` VALUES ('104', '高等数学', '晶晶出版社', '2008-04-01', '周传雄', '3', '3');
INSERT INTO `books` VALUES ('105', '中国历史', '人民出版社', '2010-01-01', '温家宝', '2', '2');
INSERT INTO `books` VALUES ('106', '盗梦空间', '神话出版社', '2010-02-25', 'mary', '1', '1');
