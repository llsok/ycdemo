/*
Navicat MySQL Data Transfer

Source Server         : localhost-root:a
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : c0-s3-ply-mybatis

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2020-01-03 10:25:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for actor
-- ----------------------------
DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL auto_increment,
  `aname` varchar(255) default NULL,
  `height` int(11) default NULL,
  `second_name` varchar(255) default NULL,
  `position` varchar(255) default 'actor',
  `country` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `birthday` datetime default NULL,
  `nation` varchar(255) default '民族',
  `birthplace` varchar(255) default NULL,
  `constellation` varchar(255) default '星座',
  `description` varchar(255) default '介绍',
  `pic` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actor
-- ----------------------------
INSERT INTO `actor` VALUES ('1', '刘昊然', null, 'liuhaoran', 'actor', '中国', '男', '2019-06-04 08:00:00', '民族', '', '星座', '<p>介绍</p>', null);
INSERT INTO `actor` VALUES ('2', '谭松韵', null, 'a', 'actor', '中国湖南衡阳', '', '2019-06-05 08:00:00', '民族', '', '星座', '<p>介绍</p>', null);
INSERT INTO `actor` VALUES ('3', '谭维维', null, 'aa', 'actor', '', '女', '2019-07-17 08:00:00', '民族', '', '星座', '<p>介绍</p>', null);
INSERT INTO `actor` VALUES ('4', '吴磊', '192', 'a2', 'actor', '中国', '男', '2019-06-11 08:00:00', '民族', null, '星座', '<p>是吴磊啊</p>', null);
INSERT INTO `actor` VALUES ('5', '范冰冰', null, '', 'actor', '', '女', '2019-06-04 08:00:00', '民族', null, '星座', '<p>介绍</p>', null);
INSERT INTO `actor` VALUES ('6', '易烊千玺', null, '', 'actor', '', '男', null, '民族', '', '星座', '<p>介绍</p>', null);
INSERT INTO `actor` VALUES ('8', '测试', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('9', '乔杉', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('10', '王宝强', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('11', '刘端端', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('12', '邵斌', null, '', 'actor', '', '', '2019-07-10 08:00:00', '民族', '', '星座', '<p>好演员</p>', null);
INSERT INTO `actor` VALUES ('13', '宋威龙', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('14', '宋芸桦', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('15', '何润东', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('16', '白百何', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('17', '宫崎骏', null, '', 'director', '', '', '1951-07-04 08:00:00', '大和民族', '', '星座', '<p>介绍</p>', '17.jpg');
INSERT INTO `actor` VALUES ('18', '刘晶', null, null, 'director', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('19', '周冬雨', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', '19.jpg');
INSERT INTO `actor` VALUES ('20', '克里斯·海姆斯沃斯', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', '20.jpg');
INSERT INTO `actor` VALUES ('21', 'F·加里·格雷', null, null, 'director', null, null, null, '民族', null, '星座', '介绍', '21.jpg');
INSERT INTO `actor` VALUES ('22', '泰莎·汤普森', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', '22.jpg');
INSERT INTO `actor` VALUES ('23', '丽贝卡·弗格森', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', '23.jpg');
INSERT INTO `actor` VALUES ('24', '连姆·尼森\r\n', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', '24.jpg');
INSERT INTO `actor` VALUES ('25', '\r\n柊瑠美', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', '25.jpg');
INSERT INTO `actor` VALUES ('26', '\r\n入野自由', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', '26.jpg');
INSERT INTO `actor` VALUES ('27', '井柏然', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', '27.jpg');
INSERT INTO `actor` VALUES ('47', 'aaa', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('48', 'cxw', null, null, 'director', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('49', '连姆·尼森', null, null, 'director', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('50', '洪金宝', null, '', 'actor', '', '男', null, '', '', '', '', null);
INSERT INTO `actor` VALUES ('51', '唐纳德·格诺夫', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('52', '塞恩·罗根', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('53', '詹姆斯·厄嗯·诺斯', null, null, 'actor', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('54', '乔恩·费儒', null, null, 'director', null, null, null, '民族', null, '星座', '介绍', null);
INSERT INTO `actor` VALUES ('55', '', null, null, '演员', null, null, null, '民族', null, '星座', '介绍', null);

-- ----------------------------
-- Table structure for cinema
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `address` varchar(255) default NULL COMMENT '详细地址',
  `gps` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cinema
-- ----------------------------
INSERT INTO `cinema` VALUES ('4', '鑫都国际影城', '湖南,衡阳,珠晖区鑫都国际广场四楼', '112.635487,26.893882', '鑫都.jpg');
INSERT INTO `cinema` VALUES ('5', '进步影城', '湖南,衡阳,石鼓区中三北路26-28号', '112.619379,26.904508', '1_0429204702.jpg');
INSERT INTO `cinema` VALUES ('6', '崇尚国际影城', '湖南,衡阳,雁峰区蒸阳南路3号崇尚百货五楼', '112.619379,26.904508', '__3129898__7872500.jpg');
INSERT INTO `cinema` VALUES ('7', '搏广电影院', '湖南,衡阳,衡南县雅园南路三元超市隔壁', '112.685875,26.749691', 'baoguan.jpg');
INSERT INTO `cinema` VALUES ('8', '中影星美湘核影城', '湖南,衡阳,蒸湘区愉景新城中心广场北侧负一层', '112.549151,26.90429', 'zhongyin.jpg');
INSERT INTO `cinema` VALUES ('9', '星美国际影商城（环星城店）', '湖南,衡阳,耒阳市体育路五环星城二楼', '112.848341,26.422868', 'xingmei.jpg');
INSERT INTO `cinema` VALUES ('10', '万达影城（衡阳万象城店）', '湖南,衡阳,雁峰区解放大道121号4楼万达影城（永兴阁旁)', '112.609891,26.900785', 'wanda.jpg');
INSERT INTO `cinema` VALUES ('11', '潇湘国际影城（耒阳店）', '湖南,衡阳,耒阳市五一路28号万亿百货5楼', '112.865815,26.414465', 'xiaoxiang.jpg');
INSERT INTO `cinema` VALUES ('12', '金逸IMAX影城（中心城店）', '湖南,衡阳,蒸湘区解放大道与长丰大道交界处21号（步步高广场四楼）市政府斜面（近太阳广场）', '112.573194,26.89884', '金逸.jpg');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `comments` varchar(500) default NULL,
  `movie_id` int(11) default NULL,
  `comments_time` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  `score` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '1', '把之前没看懂的情节都补上了。片尾曲特别好听', '2', '2019-06-11 19:28:44', '10');
INSERT INTO `comments` VALUES ('2', '1', '太棒了太棒了太棒了！ 就是因为它，我才喜欢上的动画 希望以后能从事相关行业', '2', '2019-06-23 10:46:07', '8');
INSERT INTO `comments` VALUES ('3', '1', '无论看多少遍依旧会让人感动的动画，每个细节都值得推敲，环保、和平与爱是贯穿宫崎骏所有动画的主题，这不是简单的儿童动画，而是值得所有孩子大人都去看的具有深刻寓意的动画。伟大的河神被当做污神，清澈的河水堆满了各种垃圾，这样的情景怎能不引起我们的反思?汤婆婆的宝宝是否是在映射某些家庭教育之下的巨婴?当爱与被爱的时候，我们能找到自己的名字，找回自我，能战胜孤独战胜邪恶。这些所有从影片传达出来的和我感受到的美好情感和希冀，都让我的内心无比感动无比柔软，也因此产生了想将这种美好传递下去的愿望，此生也要像宫爷爷一样做一个传递温暖的人。', '2', '2019-06-22 19:34:41', '10');
INSERT INTO `comments` VALUES ('4', '1', '童年补票，感谢陪伴❤️❤️❤️ 小时候 以为 千寻的世界是一场梦 长大 才发现 它是我们 真实走过的人生 小时候 相信自己 一定会成为 千寻 坚强勇敢 拥有爱 现在终于明白 成长为千寻这样的人 真的好难 小时候 不懂 白龙找回名字 为什么那么开心 长大后 为他能找回自己 而感到的流泪 小时候坚信 千寻和白龙会 再重逢 长大后才知道 松手说了的再见 就真的 再也不见 小时候 不明白 小火车为什么 只去不回 长大后 才知道 这条叫成长的路 只能向前 无法回头 小时候 羡慕千寻的冒险 长大后 发现 自己也勇敢的走过了 独一无二的人生 长大 就是 不能回头 一直向前 别丢了自己 一直向前', '2', '2019-06-23 11:04:41', '10');
INSERT INTO `comments` VALUES ('5', '1', '国语版本的，千寻声音很好听，推荐看原版', '2', '2019-06-22 19:35:07', '10');
INSERT INTO `comments` VALUES ('6', '1', '看的是原音，好看', '2', '2019-06-23 11:04:45', '6');
INSERT INTO `comments` VALUES ('7', '2', '动画真是太迷人了。这就是Anime的魅力，这样的情节，这样的画面，只有动画才能展现。 一个愿望:中国什么时候才能做出这种水平的动画电影呢？', '2', '2019-06-23 19:53:32', '8');
INSERT INTO `comments` VALUES ('20', '1', '五分', '2', '2019-06-26 01:21:40', '10');
INSERT INTO `comments` VALUES ('21', '1', '一般般吧', '2', '2019-06-26 15:55:49', '6');
INSERT INTO `comments` VALUES ('22', '1', '还行吧', '1', '2019-06-26 16:09:18', '8');
INSERT INTO `comments` VALUES ('23', '1', '五分好评', '4', '2019-06-26 19:12:44', '10');
INSERT INTO `comments` VALUES ('24', '1', '111', '2', '2019-06-26 20:17:07', '4');
INSERT INTO `comments` VALUES ('25', '1', '333', '1', '2019-06-26 20:19:31', '6');
INSERT INTO `comments` VALUES ('26', '1', '5555', '2', '2019-06-26 20:23:59', '10');
INSERT INTO `comments` VALUES ('27', '1', '五分', '1', '2019-06-27 23:19:49', '10');
INSERT INTO `comments` VALUES ('28', '1', '我评论的时候是9.0分的', '1', '2019-06-27 23:28:13', '6');
INSERT INTO `comments` VALUES ('29', '1', '3分不能再多', '3', '2019-06-28 18:44:15', '8');
INSERT INTO `comments` VALUES ('30', '2', '五分', '4', '2019-06-29 16:55:45', '10');
INSERT INTO `comments` VALUES ('31', '1', '5分吧', '3', '2019-07-06 19:43:27', '10');
INSERT INTO `comments` VALUES ('32', '18', '1分', '5', '2019-07-10 09:36:22', '2');
INSERT INTO `comments` VALUES ('33', '18', '3分。。。', '5', '2019-07-13 10:39:19', '6');
INSERT INTO `comments` VALUES ('34', '21', '5555', '5', '2019-07-13 18:29:01', '10');
INSERT INTO `comments` VALUES ('35', '18', '5', '6', '2019-07-13 19:12:08', '10');
INSERT INTO `comments` VALUES ('36', '25', '55', '2', '2019-07-13 20:52:12', '10');
INSERT INTO `comments` VALUES ('37', '30', 'aaaa', '2', '2019-07-16 12:27:23', '4');
INSERT INTO `comments` VALUES ('38', '31', '5分好评', '2', '2019-07-16 12:48:33', '10');

-- ----------------------------
-- Table structure for hall
-- ----------------------------
DROP TABLE IF EXISTS `hall`;
CREATE TABLE `hall` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `hall_type` varchar(255) default NULL COMMENT '影厅类型',
  `capacity` int(11) default NULL COMMENT '人数容量',
  `cinema_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hall
-- ----------------------------
INSERT INTO `hall` VALUES ('1', '3号厅', '2D', '110', '4');
INSERT INTO `hall` VALUES ('2', '2号厅', '2', '64', '4');
INSERT INTO `hall` VALUES ('3', '1号激光巨幕厅', '2D', '144', '4');
INSERT INTO `hall` VALUES ('4', '1号厅', '3D', '64', '10');
INSERT INTO `hall` VALUES ('5', '1号厅', 'big', '144', '5');
INSERT INTO `hall` VALUES ('6', '2号厅', 'middle', '110', '5');
INSERT INTO `hall` VALUES ('7', '3号厅', 'small', '62', '5');
INSERT INTO `hall` VALUES ('10', '一号厅', '2D', '88', '8');
INSERT INTO `hall` VALUES ('11', '一号厅', '2D', '66', '7');
INSERT INTO `hall` VALUES ('12', 'aaa', '1', '77', '4');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `duration` int(11) default NULL COMMENT '持续时间',
  `release_time` date default NULL COMMENT '上映时间',
  `foreign_name` varchar(255) default NULL COMMENT '外国名称',
  `region` varchar(255) default NULL COMMENT '发行地区',
  `language` varchar(255) default NULL COMMENT '语言及类型',
  `description` varchar(2048) default NULL COMMENT '剧情简介',
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', '黑衣人：全球追缉', '134', '2019-06-20', 'a', '美国', '英语', '英国黑衣人总部王牌探员H（克里斯&middot;海姆斯沃斯 饰）与新晋探员M（泰莎&middot;汤普森 饰）在阻止外星团伙入侵的过程中意外铲除了隐藏在黑衣人组织中的内奸，成功拯救世界', 'typical');
INSERT INTO `movie` VALUES ('2', '千与千寻', '110', '2019-05-06', '千と千尋の神隠し', '日本', '日语', '千寻和爸爸妈妈一同驱车前往新家，在郊外的小路上不慎进入了神秘的隧道&mdash;&mdash;他们去到了另外一个诡异世界&mdash;一个中世纪的小镇。远处飘来食物的香味，爸爸妈妈大快朵颐，孰料之后变成了猪！这时小镇上渐渐来了许多样子古怪、半透明的人。千寻仓皇逃出，一个叫小白的人救了他，喂了她阻止身体消失的药，并且告诉她怎样去找锅炉爷爷以及汤婆婆，而且必须获得一份工作才能不被魔法变成别的东西。千寻在小白的帮助下幸运地获得了一份在浴池打杂的工作。渐渐她不再被那些怪模怪样的人吓倒，并从小玲那儿知道了小白是凶恶的汤婆婆的弟子。一次，千寻发现小白被一群白色飞舞的纸人打伤，为了救受伤的小白，她用河神送给她的药丸驱出了小白身体内的封印以及守封印的小妖精，但小白还是没有醒过来。为了救小白，千寻又踏上了她的冒险之旅。', 'showing');
INSERT INTO `movie` VALUES ('3', '最好的我们', '125', '2019-06-07', 'My Best Summer', '中国大陆', '国语', '每个人的心里大概都藏着一个念念不忘的人。一个偶然被提及的名字，让女摄 影师耿耿（何蓝逗 饰）内心掀起万千波澜，触动了回忆的开关，那个撩人心动的少年余淮（陈飞宇 饰）再度闯进她的思绪。那是记忆里最好的时光，&ldquo;学渣&rdquo;耿耿和&ldquo;学霸&rdquo;余淮成了同桌，还结识了简单（王初伊 饰）、贝塔（周楚濋 饰）、徐延亮（陈帅 饰）。校园里充盈着专属少男少女们的懵懂、青涩、怦然心动和勇敢，耿耿余淮也拥有了他们的约定。高考后，当耿耿满怀期待憧憬约定兑现之时，余淮却忽然消失 不见了。七年后两人重逢，余淮当年未说出口的那句话、他不辞而别的秘密，耿耿能否得到解答？这段耿耿于怀的过往，让两人再度面临情感的抉择', 'showing');
INSERT INTO `movie` VALUES ('4', '玩具总动员4', '122', '2019-06-19', 'Toy Story 4', '美国', '英语', '当邦妮将所有玩具带上房车家庭旅行时，胡迪（汤姆&middot;汉克斯 配音）与伙伴们将共同踏上全新的冒险之旅，领略房间外面的世界有多广阔，甚至偶遇老朋友牧羊女（安妮&middot;波茨 配音）。在多年的独自闯荡中，牧羊女已经变得热爱冒险，不再只是一个精致的洋娃娃。正当胡迪和牧羊女发现彼此对玩具的使命的意义大相径庭时，他们很快意识到更大的威胁即将到来。', 'showing');
INSERT INTO `movie` VALUES ('5', '蜘蛛侠：英雄远征', '133', '2019-06-04', 'Spider-Man: Far From Home', '英国', '英语', '全面延续&ldquo;复联4&rdquo;，蜘蛛侠志承钢铁侠远征欧洲，独挑大梁对抗群敌！新角色&ldquo;神秘客&rdquo;穿越多元宇宙霸气登场！神盾局局长尼克&middot;弗瑞回归领军！&ldquo;漫威新铁三角&rdquo;组合强势出击！全新蜘蛛战衣酷炫升级！史诗对决燃爆今夏突破想象极限！', 'showing');
INSERT INTO `movie` VALUES ('6', '我的青春都是你', '111', '2019-05-27', 'Love The Way You Are', '中国', '英语', '周林林（宋芸桦 饰）高考发挥超常进入东方大学，与同校理科状元方予可（宋威龙 饰）一同进入了最高学府。郎有情妾无意，方予可其实从幼儿园时期就心系周林林，人生若只如初见，儿时的初遇相见便立下了日久的暗恋情愫！但万人瞩目的帅哥方予可身边有天之骄女茹庭（林妍柔 饰），从小暗恋状元对周林林看不顺眼，周林林则对方予可身边的同为校园风云人物的小西学长（黄俊捷 饰）心存爱慕，修习大学恋爱秘籍，苦练恋爱通关技巧，十八般武艺七十二变法轮番上阵！四人之间情感纠葛，在校园里上演了一幕青春爱情喜剧！', 'showing');
INSERT INTO `movie` VALUES ('7', '哥斯拉2：怪兽之王', '132', '2019-06-20', 'Godzilla: King of the Monsters', '美国', '英语', '随着《哥斯拉》和《金刚：骷髅岛》在全球范围内的成功，华纳兄弟影片公司和传奇影业联手开启了怪兽宇宙系列电影的新篇章—一部史诗级动作冒险巨制。在这部电影中，哥斯拉将和众多大家在流行文化中所熟知的怪兽展开较量。全新故事中，研究神秘动物学的机构“帝王组织”成员将勇敢直面巨型怪兽，其中强大的哥斯拉也将和魔斯拉、拉顿和它的死对头——三头王基多拉展开激烈对抗。当这些只存在于传说里的超级生物再度崛起时，它们将展开王者争霸，人类的命运岌岌可危……', 'showing');
INSERT INTO `movie` VALUES ('8', '\r\n追龙Ⅱ', '110', '2019-06-22', 'Chasing the Dragon Ⅱ', '中国', '英语', '悍匪龙志强（梁家辉 饰），在香港回归前，趁香港英政府不作为，而屡犯巨案，先后绑架富豪利家及雷家之长子，勒索超过二十亿元，事主怕被报复, 交赎款后都不敢报警。中国公安部极为关注，与香港警方合力，派香港警员何天（古天乐 饰）卧底潜入龙志强犯罪团伙，发现他正策划绑架澳门富豪贺不凡，最终陆港警察合力勇擒龙志强，救出贺不凡。', 'typical');
INSERT INTO `movie` VALUES ('9', '少年的你', '135', '2019-07-20', 'Better Days', '中国大陆 ', '国语', '一场高考前夕的校园意外，改变了两个少年的命运。 陈念（周冬雨 饰）性格内向，是学校里的优等生，努力复习、考上好大学是高三的她唯一的念头。同班同学的意外坠楼牵扯出一连串不为人知的故事，陈念也被一点点卷入其中……在她最孤独的时刻，一个叫“小北”（易烊千玺 饰）的少年闯入了她的世界……大多数人的18岁都是明媚、快乐的，而他们却在18岁这个夏天提前尝到了成人世界的漠然。一场秘而不宣的“战斗”正在上演，他们将一起守护少年的尊严。', 'upcoming');
INSERT INTO `movie` VALUES ('10', '超级的我', '112', '2019-07-25', 'Super Me', '中国大陆', '国语', '18线小编剧桑榆（王大陆 饰）原本生活困顿经济拮据，但一夜之间发现拥有超能力的他，依靠从梦境中变现的宝物和金钱，人生发生了天翻地覆的变化，甚至豪掷千金终于追到暗恋多年的女神花儿（宋佳 饰）。然而在梦境中快意掠取的桑榆却逐渐发现，这场躺赢的美梦并没有那么简单。', 'upcoming');
INSERT INTO `movie` VALUES ('11', '潜行者', '94', '2019-07-03', '臥虎潛龍', '中国大陆', '粤语', '故事开始于卧底警察潜伏黑帮，意外的坐上了黑帮老大的位置，不料被大毒枭设计一步步拖入公海的魔鬼运输船；恰逢此时，一支神秘的第三方部队正在展开他们的复仇计划，命运的纠葛从此开始。在三方力量的角逐中，激烈的搏斗、刀战、枪战、狙击战、遥控炸弹，层层升级步步惊心。在法与情，爱与恨，兄弟和女人之间，有些事情总要有人去做。', 'upcoming');
INSERT INTO `movie` VALUES ('12', '\r\n你咪理，我爱你！', '122', '2019-06-29', 'I Love You, You Are Perfect, Now Change...', '中国香港', '粤语', '自上帝造⼈以來，⼈間就誕生了千千萬萬個男⼈和女⼈的愛情故事。本片由十三個關於愛情的小故事組成，從個人、家庭、社會等不同層面出發，探討這個永恆的人生議題——愛情！', 'upcoming');
INSERT INTO `movie` VALUES ('13', '学区房72小时', '121', '2019-06-21', 'If You are Happy', '中国大陆', '国语', '某大学副教授傅重（管轩 饰）为了让女儿进入市重点小学，在72小时内出售现有房子，凑足钱款，买下对口学校的学区房。由于时间紧迫，傅重不得不以200万价格降价出售，钟点工牛阿姨（徐幸 饰）声称儿子小宝正急于购买婚房，拿出自己多年的积蓄，双方一拍即合，立刻签约。正在皆大欢喜的时候，傅重又接到坏消息——卖方坐地起价40万。傅重正为难之际，中介来电说有客户愿以市场价250万一次性付款购买傅重的住宅，这样，所有问题便可解决…… 而这位客户，正是有求于傅重的学生家长袁主席。是坚守诚信与牛阿姨履行合约，还是为孩子的未来，毁约将住宅高价转售他人，傅重面临两难抉择……', 'upcoming');
INSERT INTO `movie` VALUES ('14', '最后一刻', '99', '2019-06-18', 'Crazy House', '中国大陆', '国语', '龙小种参加最爱你房地产公司《疯狂的房子》比赛，过五关斩六将勇夺冠军，奖励别墅一套，咸鱼终翻身，却遭三个绑架犯绑架，老板雷震宇被人设计，酒吧老板王金水遭遇活埋，而好友李大炮的女儿甜甜也突然失踪，这一切似乎都跟神秘的疯女人黄雨欣有关，三年前的离奇往事渐渐浮出水面', 'upcoming');
INSERT INTO `movie` VALUES ('15', '逆流大叔', '123', '2019-06-21', 'Men on the Dragon', '中国香港 ', '国语', '男人，就是要逆流而上。阿龙(吴镇宇 饰)、淑仪(潘灿良 饰)、泰哥(黄德斌 饰)、威廉(胡子彤 饰)，四个高不成低不就、做事得过且过的宽频网络公司员工，见公司掀起了裁员风暴，为表对公司忠诚以「保饭碗」，误打误碰地加入了公司新成立的龙舟队！面对男人之苦，这班本来选择逃避的大叔们，坐到只许前进不许后退的龙舟之上，竟重拾了人生久违了的冲劲。一鼓作气的他们，不但参与了难度更高的长途龙舟大赛，更借着重新燃起的斗志，迈步去迎接自己人生里一道又一道的逆流…', 'upcoming');
INSERT INTO `movie` VALUES ('16', '攀登者', '99', '2019-06-18', 'The Climbers', '中国大陆', '国语', '1960年，中国登山队向珠峰发起冲刺，完成了世界首次北坡登顶这一不可能的任务。15 年后，方五洲和曲松林在气象学家徐缨的帮助下，带领李国梁、杨光等年轻队员再次挑战世界之巅。迎接他们的将是更加 严酷的现实，也是生与死的挑战......', 'upcoming');
INSERT INTO `movie` VALUES ('28', '妈阁是座城', '134', '2019-06-14', '千と千尋の神隠し', '中国大陆', '日语', '女叠码仔梅晓鸥（白百何 饰）历尽沧桑，在妈阁（澳门）这座赌城中与来历迥异的赌徒打交道，有地产商段凯文（吴刚 饰）、有艺术家史奇澜（黄觉 饰），也有来自不同阶级的政商人员，连早已堕落低谷的前夫卢晋桐（耿乐 饰）都重新卷入她的人生。这些人入赌场就搏杀，出赌场就赖账，女叠码仔过的就是放债和讨债的生活。 赌博让人迷失本性，叠码仔与赌徒周旋，也等于与魔鬼打交道，一时假仁假义，一时恩断情绝，赌至终局，谁能寻回本性，谁能鸿运当头？', 'showing');
INSERT INTO `movie` VALUES ('29', '扫毒2天地对决', '100', '2019-06-30', 'The White Storm 2', '中国香港', '国语', '毒品市场维持四分天下的格局已久，但自从地藏与墨西哥大毒枭跨境合作扩展势力，再加上一连串黑吃黑的动作，毒界变得风声鹤唳。另一方面，因儿时亲眼目睹父亲被毒品所毁而嫉毒如仇的慈善家兼金融巨子余顺天，正悬赏一亿歼灭香港最大毒贩，此举在社会上引起轩然大波。警员林正风本致力搜证拘捕地藏，毒贩却因巨额悬赏导致人身安全受威胁，他在执行保护毒贩的任务时深感无奈，但又被余顺天的出价所诱惑，陷入黑白正邪的心理挣扎。原来，余顺天和地藏有不可告人的同门关系，一场天地对决一触即发。', 'showing');
INSERT INTO `movie` VALUES ('30', '功夫', '120', '2012-06-10', 'aaaa', '中国香港', '国语', null, 'showing');
INSERT INTO `movie` VALUES ('33', '演员', '115', '2019-06-29', 'Men in Black International', '中国大陆', '国语', '这是一部电影', 'showing');
INSERT INTO `movie` VALUES ('34', '源代码', '134', '2019-07-06', 'Men in Black International', '美国', '英语', '<p>111111111111111111111111111111111</p>', 'showing');
INSERT INTO `movie` VALUES ('35', '狮子王', '134', '2019-07-05', 'Lion King', '美国', '英语', '<p>小狮子王辛巴（唐纳德&middot;格洛弗 配音）在众多热情的朋友的陪伴下，不但经历了生命中最光荣的时刻，也遭遇了最艰难的挑战，最后终于成为了森林之王，也在周而复始生生不息的自然中体会出生命的真义。非洲大草原上一轮红日冉冉升起，为高大的乞力马扎罗山披上层金色的光纱，所有的动物涌向了同一个地方&mdash;&mdash;荣耀石，兴奋地等待着一个重大消息的宣布：它们的国王木法沙将迎来自己的新生儿。这个新生儿就是小狮子辛巴，它是木法沙的法定接班人、荣耀石未来的国王。</p>', 'showing');
INSERT INTO `movie` VALUES ('36', 'aaa', '115', '2019-07-16', 'Men in Black International', '美国', '英语', '<p>aaa</p>', 'showing');

-- ----------------------------
-- Table structure for movie_actor
-- ----------------------------
DROP TABLE IF EXISTS `movie_actor`;
CREATE TABLE `movie_actor` (
  `id` int(11) NOT NULL auto_increment,
  `movie_id` int(11) default NULL,
  `actor_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_actor
-- ----------------------------
INSERT INTO `movie_actor` VALUES ('9', '7', '2');
INSERT INTO `movie_actor` VALUES ('10', '8', '1');
INSERT INTO `movie_actor` VALUES ('11', '9', '2');
INSERT INTO `movie_actor` VALUES ('12', '10', '1');
INSERT INTO `movie_actor` VALUES ('13', '11', '2');
INSERT INTO `movie_actor` VALUES ('14', '12', '1');
INSERT INTO `movie_actor` VALUES ('15', '13', '2');
INSERT INTO `movie_actor` VALUES ('17', '15', '2');
INSERT INTO `movie_actor` VALUES ('22', '5', '2');
INSERT INTO `movie_actor` VALUES ('23', '5', '5');
INSERT INTO `movie_actor` VALUES ('28', '29', '7');
INSERT INTO `movie_actor` VALUES ('29', '30', '8');
INSERT INTO `movie_actor` VALUES ('43', '16', '1');
INSERT INTO `movie_actor` VALUES ('49', '28', '16');
INSERT INTO `movie_actor` VALUES ('56', '14', '1');
INSERT INTO `movie_actor` VALUES ('57', '14', '18');
INSERT INTO `movie_actor` VALUES ('58', '27', '8');
INSERT INTO `movie_actor` VALUES ('59', '27', '8');
INSERT INTO `movie_actor` VALUES ('70', '3', '1');
INSERT INTO `movie_actor` VALUES ('71', '3', '2');
INSERT INTO `movie_actor` VALUES ('72', '3', '6');
INSERT INTO `movie_actor` VALUES ('73', '3', '8');
INSERT INTO `movie_actor` VALUES ('74', '6', '1');
INSERT INTO `movie_actor` VALUES ('75', '6', '13');
INSERT INTO `movie_actor` VALUES ('76', '6', '14');
INSERT INTO `movie_actor` VALUES ('77', '6', '15');
INSERT INTO `movie_actor` VALUES ('78', '6', '8');
INSERT INTO `movie_actor` VALUES ('79', '2', '19');
INSERT INTO `movie_actor` VALUES ('80', '2', '17');
INSERT INTO `movie_actor` VALUES ('83', '31', '8');
INSERT INTO `movie_actor` VALUES ('84', '31', '8');
INSERT INTO `movie_actor` VALUES ('85', '32', '8');
INSERT INTO `movie_actor` VALUES ('86', '32', '8');
INSERT INTO `movie_actor` VALUES ('93', '2', '26');
INSERT INTO `movie_actor` VALUES ('94', '2', '27');
INSERT INTO `movie_actor` VALUES ('95', '2', '25');
INSERT INTO `movie_actor` VALUES ('96', '4', '8');
INSERT INTO `movie_actor` VALUES ('97', '4', '2');
INSERT INTO `movie_actor` VALUES ('98', '4', '3');
INSERT INTO `movie_actor` VALUES ('99', '4', '4');
INSERT INTO `movie_actor` VALUES ('140', '33', '47');
INSERT INTO `movie_actor` VALUES ('141', '33', '48');
INSERT INTO `movie_actor` VALUES ('142', '34', '8');
INSERT INTO `movie_actor` VALUES ('143', '34', '8');
INSERT INTO `movie_actor` VALUES ('150', '35', '51');
INSERT INTO `movie_actor` VALUES ('151', '35', '52');
INSERT INTO `movie_actor` VALUES ('152', '35', '53');
INSERT INTO `movie_actor` VALUES ('153', '35', '54');
INSERT INTO `movie_actor` VALUES ('163', '1', '21');
INSERT INTO `movie_actor` VALUES ('164', '1', '23');
INSERT INTO `movie_actor` VALUES ('165', '1', '20');
INSERT INTO `movie_actor` VALUES ('166', '1', '22');
INSERT INTO `movie_actor` VALUES ('168', '1', '24');
INSERT INTO `movie_actor` VALUES ('169', '36', '47');
INSERT INTO `movie_actor` VALUES ('170', '36', '47');

-- ----------------------------
-- Table structure for movie_image
-- ----------------------------
DROP TABLE IF EXISTS `movie_image`;
CREATE TABLE `movie_image` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `movie_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_image
-- ----------------------------
INSERT INTO `movie_image` VALUES ('1', 'cover_type', '2.jpg', '1');
INSERT INTO `movie_image` VALUES ('2', 'cover_type', '3.jpg', '2');
INSERT INTO `movie_image` VALUES ('3', 'cover_type', '1.jpg', '3');
INSERT INTO `movie_image` VALUES ('4', 'cover_type', '4.jpg', '4');
INSERT INTO `movie_image` VALUES ('5', 'cover_type', '5.jpg', '5');
INSERT INTO `movie_image` VALUES ('6', 'cover_type', '6.jpg', '6');
INSERT INTO `movie_image` VALUES ('7', 'cover_type', '7.jpg', '7');
INSERT INTO `movie_image` VALUES ('8', 'cover_type', '8.jpg', '8');
INSERT INTO `movie_image` VALUES ('9', 'cover_type', '9.jpg', '9');
INSERT INTO `movie_image` VALUES ('10', 'cover_type', '10.jpg', '10');
INSERT INTO `movie_image` VALUES ('11', 'cover_type', '11.jpg', '11');
INSERT INTO `movie_image` VALUES ('12', 'cover_type', '12.jpg', '12');
INSERT INTO `movie_image` VALUES ('13', 'cover_type', '13.jpg', '13');
INSERT INTO `movie_image` VALUES ('14', 'cover_type', '14.jpg', '14');
INSERT INTO `movie_image` VALUES ('15', 'cover_type', '15.jpg', '15');
INSERT INTO `movie_image` VALUES ('16', 'cover_type', '16.jpg', '16');
INSERT INTO `movie_image` VALUES ('20', 'cover_type', '6.jpg', '27');
INSERT INTO `movie_image` VALUES ('21', 'cover_type', '1.png', '28');
INSERT INTO `movie_image` VALUES ('22', 'cover_type', '111111.jpg', '29');
INSERT INTO `movie_image` VALUES ('23', 'cover_type', 'dx.jpg', '30');
INSERT INTO `movie_image` VALUES ('24', 'big_img_type', 'b1.jpg', '1');
INSERT INTO `movie_image` VALUES ('25', 'big_img_type', 'b2.jpg', '2');
INSERT INTO `movie_image` VALUES ('26', 'big_img_type', 'b3.jpg', '3');
INSERT INTO `movie_image` VALUES ('27', 'big_img_type', 'b4.jpg', '4');
INSERT INTO `movie_image` VALUES ('28', 'small_img_type', 's1_1.jpg', '1');
INSERT INTO `movie_image` VALUES ('29', 'small_img_type', 's1_2.jpg', '1');
INSERT INTO `movie_image` VALUES ('30', 'small_img_type', 's1_3.jpg', '1');
INSERT INTO `movie_image` VALUES ('31', 'small_img_type', 's1_4.jpg', '1');
INSERT INTO `movie_image` VALUES ('32', 'small_img_type', 's2_1.jpg', '2');
INSERT INTO `movie_image` VALUES ('33', 'small_img_type', 's2_2.jpg', '2');
INSERT INTO `movie_image` VALUES ('34', 'small_img_type', 's2_3.jpg', '2');
INSERT INTO `movie_image` VALUES ('35', 'small_img_type', 's2_4.jpg', '2');
INSERT INTO `movie_image` VALUES ('36', 'small_img_type', 's3_1.jpg', '3');
INSERT INTO `movie_image` VALUES ('37', 'small_img_type', 's3_2.jpg', '3');
INSERT INTO `movie_image` VALUES ('38', 'small_img_type', 's3_3.jpg', '3');
INSERT INTO `movie_image` VALUES ('39', 'small_img_type', 's3_4.jpg', '3');
INSERT INTO `movie_image` VALUES ('40', 'small_img_type', 's4_1.jpg', '4');
INSERT INTO `movie_image` VALUES ('41', 'small_img_type', 's4_2.jpg', '4');
INSERT INTO `movie_image` VALUES ('42', 'small_img_type', 's4_3.jpg', '4');
INSERT INTO `movie_image` VALUES ('43', 'small_img_type', 's4_4.jpg', '4');
INSERT INTO `movie_image` VALUES ('44', 'big_img_type', '1.PNG', '1');
INSERT INTO `movie_image` VALUES ('45', 'small_img_type', '2.PNG', '1');
INSERT INTO `movie_image` VALUES ('46', 'cover_type', '006a3b87e950352aa285d1455343fbf2b3118b34.jpg', '33');
INSERT INTO `movie_image` VALUES ('47', 'cover_type', '}AIDMU1$)@ZO2LVOS{GNJ@K.png', '34');
INSERT INTO `movie_image` VALUES ('48', 'cover_type', '狮子王.jpg', '35');
INSERT INTO `movie_image` VALUES ('49', 'cover_type', 'timg.jpg', '36');

-- ----------------------------
-- Table structure for movie_type
-- ----------------------------
DROP TABLE IF EXISTS `movie_type`;
CREATE TABLE `movie_type` (
  `id` int(11) NOT NULL auto_increment,
  `type_id` int(11) default NULL,
  `movie_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_type
-- ----------------------------
INSERT INTO `movie_type` VALUES ('29', '3', '5');
INSERT INTO `movie_type` VALUES ('30', '2', '5');
INSERT INTO `movie_type` VALUES ('35', '4', '7');
INSERT INTO `movie_type` VALUES ('36', '5', '8');
INSERT INTO `movie_type` VALUES ('37', '1', '9');
INSERT INTO `movie_type` VALUES ('38', '6', '10');
INSERT INTO `movie_type` VALUES ('61', '1', '16');
INSERT INTO `movie_type` VALUES ('62', '7', '16');
INSERT INTO `movie_type` VALUES ('66', '8', '28');
INSERT INTO `movie_type` VALUES ('71', '1', '14');
INSERT INTO `movie_type` VALUES ('72', '1', '13');
INSERT INTO `movie_type` VALUES ('75', '14', '11');
INSERT INTO `movie_type` VALUES ('76', '13', '12');
INSERT INTO `movie_type` VALUES ('77', '12', '13');
INSERT INTO `movie_type` VALUES ('78', '11', '15');
INSERT INTO `movie_type` VALUES ('79', '10', '13');
INSERT INTO `movie_type` VALUES ('80', '9', '29');
INSERT INTO `movie_type` VALUES ('81', '8', '30');
INSERT INTO `movie_type` VALUES ('87', '6', '3');
INSERT INTO `movie_type` VALUES ('88', '7', '3');
INSERT INTO `movie_type` VALUES ('89', '2', '6');
INSERT INTO `movie_type` VALUES ('90', '3', '2');
INSERT INTO `movie_type` VALUES ('91', '4', '2');
INSERT INTO `movie_type` VALUES ('94', '1', '31');
INSERT INTO `movie_type` VALUES ('95', '2', '31');
INSERT INTO `movie_type` VALUES ('96', '4', '32');
INSERT INTO `movie_type` VALUES ('99', '1', '4');
INSERT INTO `movie_type` VALUES ('100', '2', '4');
INSERT INTO `movie_type` VALUES ('111', '1', '33');
INSERT INTO `movie_type` VALUES ('112', '1', '34');
INSERT INTO `movie_type` VALUES ('115', '2', '35');
INSERT INTO `movie_type` VALUES ('116', '9', '35');
INSERT INTO `movie_type` VALUES ('117', '10', '35');
INSERT INTO `movie_type` VALUES ('120', '1', '1');
INSERT INTO `movie_type` VALUES ('121', '4', '1');
INSERT INTO `movie_type` VALUES ('122', '1', '36');
INSERT INTO `movie_type` VALUES ('123', '2', '36');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '喜剧');
INSERT INTO `type` VALUES ('2', '动作');
INSERT INTO `type` VALUES ('3', '奇幻');
INSERT INTO `type` VALUES ('4', '冒险');
INSERT INTO `type` VALUES ('5', '科幻');
INSERT INTO `type` VALUES ('6', '爱情');
INSERT INTO `type` VALUES ('7', '剧情');
INSERT INTO `type` VALUES ('8', '惊悚');
INSERT INTO `type` VALUES ('9', '战争');
INSERT INTO `type` VALUES ('10', '动画');
INSERT INTO `type` VALUES ('11', '犯罪');
INSERT INTO `type` VALUES ('12', '家庭');
INSERT INTO `type` VALUES ('13', '历史');
INSERT INTO `type` VALUES ('14', '青春');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `head_img` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `status` int(11) default '0',
  `regtime` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'cxw', 'aaa', '1054735192@qq.com', 'user_head.jpg', '15074763853', '1', null);
INSERT INTO `user` VALUES ('17', 'lgm', 'xiaoshabi123', '2336583532@qq.com', 'reg_default.png', '17674521458', '1', null);
INSERT INTO `user` VALUES ('18', 'abc', 'aaaaaa', '1054735193@qq.com', 'timg.jpg', '13509864008', '1', null);
INSERT INTO `user` VALUES ('20', 'gzl', 'aaaaaa', '961977096@qq.com', '1.jpg', '15074763852', '0', null);
INSERT INTO `user` VALUES ('21', '小米', 'aaaaaa', '1054735193@qq.com', 'timg.jpg', '13509864001', '0', null);
INSERT INTO `user` VALUES ('22', '网友1号', 'aaaaaa', '1054735193@qq.com', '2.jpg', '13509864002', '0', null);
INSERT INTO `user` VALUES ('25', '忧郁丿男孩', '18F8057BC296C006EA9210D642AB05D1', '1054735193@qq.com', 'http://thirdqq.qlogo.cn/g?b=oidb&k=icnibiclKfmoAQVLaOiboU1GhQ&s=100&t=1555414884', null, null, null);
INSERT INTO `user` VALUES ('26', 'cxw1111', 'aaaaaa', '1054735123@qq.com', 'reg_default.png', '13509864005', '0', null);
INSERT INTO `user` VALUES ('27', '潇哥的账号', '35BA6D27496BE9A36E8447144FE8CC4C', null, 'http://thirdqq.qlogo.cn/g?b=oidb&k=xmw6araE58eDftBFqmurHw&s=100&t=1562716310', null, null, null);
INSERT INTO `user` VALUES ('28', 'wewer', 'aaaaaa', '1022735193@qq.com', 'reg_default.png', '13509864004', '0', null);
INSERT INTO `user` VALUES ('29', 'wwww', 'aaaaaa', '1054735193@qq.com', 'reg_default.png', '18073404071', '0', null);
INSERT INTO `user` VALUES ('30', 'cxw111', 'aaaaaa', '1054735193@qq.com', 'reg_default.png', '15113437840', '0', null);
INSERT INTO `user` VALUES ('31', 'ccc', 'aaaaaa', '1054735193@qq.com', '22.png', '13509864007', '0', null);
