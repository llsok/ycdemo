SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hero`
-- ----------------------------
DROP TABLE IF EXISTS `hero`;
CREATE TABLE `hero` (
  `id` int(3) NOT NULL,
  `seq` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '108中的排名,例:第一',
  `starname` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '三十二天罡,七十二地煞,例;天魁星',
  `nickname` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '花名,例:及时雨',
  `truename` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '真实姓名,例:宋江',
  `description` varchar(1024) COLLATE utf8_bin NOT NULL COMMENT '性格描述',
  `img` text COLLATE utf8_bin COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of hero
-- ----------------------------
INSERT INTO `hero` VALUES ('1', '第一', '天魁星', '及时雨（呼保义）', '宋江', '孝顺忠君 有领导才能', null);
INSERT INTO `hero` VALUES ('2', '第二', '天罡星', '玉麒麟', '卢俊义', '武功高强，为人固执', null);
INSERT INTO `hero` VALUES ('3', '第三', '天机星', '智多星', '吴用', '足智多谋，善用计策', null);
INSERT INTO `hero` VALUES ('4', '第四', '天闲星', '入云龙', '公孙胜', '正直大气，武艺高强', null);
INSERT INTO `hero` VALUES ('5', '第五', '天勇星', '大刀', '关胜', '文武双全，赤胆忠心', null);
INSERT INTO `hero` VALUES ('6', '第六', '天雄星', '豹子头', '林冲', '为人正直，隐忍善良', null);
INSERT INTO `hero` VALUES ('7', '第七', '天猛星', '霹雳火', '秦明', '性格急躁，声如雷霆', null);
INSERT INTO `hero` VALUES ('8', '第八', '天威星', '双鞭', '呼延灼', '正直，大气', null);
INSERT INTO `hero` VALUES ('9', '第九', '天英星', '小李广', '花荣', '武功高强，为人仗义', null);
INSERT INTO `hero` VALUES ('10', '第十', ' 天贵星', '小旋风', '柴进', ' 为人慷慨，见义勇为', null);
INSERT INTO `hero` VALUES ('11', '第十一', '天富星', '扑天雕', '李应', '嫉恶如仇，见义勇为', null);
INSERT INTO `hero` VALUES ('12', '第十二', '天满星', '美髯公', '朱仝', '仗义疏财，义字当头', null);
INSERT INTO `hero` VALUES ('13', '第十三', '天孤星', '花和尚', '鲁智深', '心地刚直，生性凶顽', null);
INSERT INTO `hero` VALUES ('14', '第十四', '天伤星', '行者', '武松', '光明磊落，敢作敢为', null);
INSERT INTO `hero` VALUES ('15', '第十五', '天立星', '双枪将', '董平', '冲动 忠肝义胆  好胜', null);
INSERT INTO `hero` VALUES ('16', '第十六', '天捷星', '没羽箭', '张清', '性格内向,非常内敛', null);
INSERT INTO `hero` VALUES ('17', '第十七', '天暗星', '青面兽', '杨志', '勤快，身手不凡', null);
INSERT INTO `hero` VALUES ('18', '第十八', '天佑星', '金枪手', '徐宁', '胆大,有万夫不挡之勇', null);
INSERT INTO `hero` VALUES ('19', '第十九', '天空星', '急先锋', '索超', '性子急，执着，鲁莽', null);
INSERT INTO `hero` VALUES ('20', '第二十', '天速星', '神行太保', '戴宗', '嫉恶如仇、侠肝义胆、脾气火爆', null);
INSERT INTO `hero` VALUES ('21', '第二十一', '天异星', '赤发鬼', '刘唐', '勇猛莽撞', null);
INSERT INTO `hero` VALUES ('22', '第二十二', '天杀星', '黒旋风', '李逵 ', '正直粗鲁，勇猛无比', null);
INSERT INTO `hero` VALUES ('23', '第二十三', '天微星', '九纹龙', '史进', '武艺高超，嫉恶如仇', null);
INSERT INTO `hero` VALUES ('24', '第二十四', '天究星', '没遮拦', '穆弘', '平凡善良、耐心平和、持重端庄', null);
INSERT INTO `hero` VALUES ('25', '第二十五', '天退星', '插翅虎', '雷横', '脾气暴躁，为人耿直', null);
INSERT INTO `hero` VALUES ('26', '第二十六', '天寿星', '混江龙', '李俊', '为人正直，水中功夫超强', null);
INSERT INTO `hero` VALUES ('27', '第二十七', '天剑星', '立地太岁', '阮小二', '武艺出众，英勇善战', null);
INSERT INTO `hero` VALUES ('28', '第二十八', '天平星', '船火儿', '张横', '英勇善战', null);
INSERT INTO `hero` VALUES ('29', '第二十九', '天罪星', '短命二郎', '阮小五', '水中好汉，奋勇杀敌', null);
INSERT INTO `hero` VALUES ('30', '第三十', '天损星', '浪里白条', '张顺', '水中功夫好，豪爽仗义，惩恶济善，有仇必报', null);
INSERT INTO `hero` VALUES ('31', '第三十一', '天败星', '活阎罗', '阮小七', '心快口快', null);
INSERT INTO `hero` VALUES ('32', '第三十二', '天牢星', '病关索', '杨雄', '为人正直', null);
INSERT INTO `hero` VALUES ('33', '第三十三', '天慧星', '拼命三郎', '石秀', '打抱不平', null);
INSERT INTO `hero` VALUES ('34', '第三十四', '天暴星', '两头蛇', '解珍', '作战英勇', null);
INSERT INTO `hero` VALUES ('35', '第三十五', '天哭星', '双尾蝎', '解宝', '为人灵活，作战英勇', null);
INSERT INTO `hero` VALUES ('36', '第三十六', '天巧星', '浪子', '燕青', '武功高强，为人风流', null);
INSERT INTO `hero` VALUES ('37', '第三十七', '地魁星', '神机军师', '朱武', '精通阵法，广有谋略', null);
INSERT INTO `hero` VALUES ('38', '第三十八', '地煞星', '镇三山', '黄信', '一身好武艺，英勇善战', null);
INSERT INTO `hero` VALUES ('39', '第三十九', '地勇星', '病尉迟', '孙立', '精熟弓马，武艺过人，正直', null);
INSERT INTO `hero` VALUES ('40', '第四十', '地杰星', '丑郡马', '宣赞', '相貌丑陋，武艺出众', null);
INSERT INTO `hero` VALUES ('41', '第四十一', '地雄星', '井木犴', '郝思文', '仗义侠胆，有勇有谋', null);
INSERT INTO `hero` VALUES ('42', '第四十二', '地威星', '百胜将', '韩滔', '力大无穷，有勇有谋', null);
INSERT INTO `hero` VALUES ('43', '第四十三', '地英星', '天目将', '彭玘', '扶危救困，义气第一', null);
INSERT INTO `hero` VALUES ('44', '第四十四', '地奇星', '圣水将', '单廷圭', '风流潇洒，气宇轩昂', null);
INSERT INTO `hero` VALUES ('45', '第四十五', '地猛星', '神火将', '魏定国', '风流潇洒，礼貌待人', null);
INSERT INTO `hero` VALUES ('46', '第四十六', '地文星', '圣手书生', '萧让', '擅长写字，不爱说话', null);
INSERT INTO `hero` VALUES ('47', '第四十七', '地正星', '铁面孔目', '裴宣', '忍辱负重，忠诚憨厚', null);
INSERT INTO `hero` VALUES ('48', '第四十八', '地阔星', '摩云金翅', '欧鹏', '武功不低，挫折感强，比较谨慎', null);
INSERT INTO `hero` VALUES ('49', '第四十九', '地阖星', '火眼狻猊', '邓飞', '武功不差，舍己为人', null);
INSERT INTO `hero` VALUES ('50', '第五十', '地强星', '锦毛虎', '燕顺', '有情有义，重英雄', null);
INSERT INTO `hero` VALUES ('51', '第五十一', '地暗星', '锦豹子', '杨林', '聪明，比较谨慎', null);
INSERT INTO `hero` VALUES ('52', '第五十二', '地轴星', '轰天雷', '凌振', '精通武艺，是一个非常厉害的人物', null);
INSERT INTO `hero` VALUES ('53', '第五十三', '地会星', '神算子', '蒋敬', '武艺高强，胆大', null);
INSERT INTO `hero` VALUES ('54', '第五十四', '地佐星', '小温侯', '吕方', '为人忠义 武功高强 不服输', null);
INSERT INTO `hero` VALUES ('55', '第五十五', '地佑星', '赛仁贵', '郭盛', '有勇无谋,义气为重', null);
INSERT INTO `hero` VALUES ('56', '第五十六', '地灵星', '神医', '安道全', '医术高明，好色', null);
INSERT INTO `hero` VALUES ('57', '第五十七', '地兽星', '紫髯伯', '皇甫端', '医道高明，诊治马病，手到病除，胡须大紫', null);
INSERT INTO `hero` VALUES ('58', '第五十八', '地微星', '矮脚虎', '王英', '身材矮小，脾气暴躁', null);
INSERT INTO `hero` VALUES ('59', '第五十九', '地慧星', '一丈青', '扈三娘', '机智聪明，为人仗义', null);
INSERT INTO `hero` VALUES ('60', '第六十', '地暴星', '丧门神', '鲍旭', '正直粗鲁，勇猛无比', null);
INSERT INTO `hero` VALUES ('61', '第六十一', '地然星', '混世魔王', '樊瑞', '阴柔有余、阳刚不足', null);
INSERT INTO `hero` VALUES ('62', '第六十二', '地猖星', '毛头星', '孔明', '为人行侠仗义 武艺平平 忠肝义胆', null);
INSERT INTO `hero` VALUES ('63', '第六十三', '地狂星', '独火星', '孔亮', '本事低微，武功很差', null);
INSERT INTO `hero` VALUES ('64', '第六十四', '地飞星', '八臂哪吒', '项充', '有情有义，武艺高强', null);
INSERT INTO `hero` VALUES ('65', '第六十五', '地走星', '飞天大圣', '李衮', ' 武艺高强 四海之内皆兄', null);
INSERT INTO `hero` VALUES ('66', '第六十六', '地巧星', '玉臂匠', '金大坚', '技艺高超，善于雕刻', null);
INSERT INTO `hero` VALUES ('67', '第六十七', '地明星', '铁笛仙', '马麟', '好勇斗狠，讲义气', null);
INSERT INTO `hero` VALUES ('68', '第六十八', '地进星', '出洞蛟', '童威', '能伏水，会驾船', null);
INSERT INTO `hero` VALUES ('69', '第六十九', '地退星', '翻江蜃', '童猛', '水性极好', null);
INSERT INTO `hero` VALUES ('70', '第七十', '地满星', '玉幡竿', '孟康', '人高马大，善于制造大小船只', null);
INSERT INTO `hero` VALUES ('71', '第七十一', '地遂星', '通臂猿', '侯健', '飞针走线，技艺高超', null);
INSERT INTO `hero` VALUES ('72', '第七十二', '地周星', '跳涧虎', '陈达', '体魄强健,生性粗鲁', null);
INSERT INTO `hero` VALUES ('73', '第七十三', '地隐星', '白花蛇', '杨春', '使一口大杆刀，武艺精熟', null);
INSERT INTO `hero` VALUES ('74', '第七十四', '地异星', '白面郎君', '郑天寿', '鲁莽，比较重义气', null);
INSERT INTO `hero` VALUES ('75', '第七十五', '地理星', '九尾龟', '陶宗旺', '力大无比，正直勇敢', null);
INSERT INTO `hero` VALUES ('76', '第七十六', '地俊星', '铁扇子', '宋清', '为人诚恳，热情好客', null);
INSERT INTO `hero` VALUES ('77', '第七十七', '地乐星', '铁叫子', '乐和', '文武全行、且兴趣广泛、聪明绝顶', null);
INSERT INTO `hero` VALUES ('78', '第七十八', '地捷星', '花项虎', '龚旺', '一生行侠仗义，性格耿直', null);
INSERT INTO `hero` VALUES ('79', '第七十九', '地速星', '中箭虎', '丁得孙', '为人勇猛 武艺高强 艺高 胆大 有义气', null);
INSERT INTO `hero` VALUES ('80', '第八十', '地镇星', '小遮拦', '穆春', '武艺高强 崇尚忠义', null);
INSERT INTO `hero` VALUES ('81', '第八十一', '地羁星', '操刀鬼', '曹正', '平时像个孩子，性格天真 活泼。但战斗时，不顾一切战斗', null);
INSERT INTO `hero` VALUES ('82', '第八十二', '地魔星', '云里金刚', '宋万', '高大威猛，武艺平常', null);
INSERT INTO `hero` VALUES ('83', '第八十三', '地妖星', '摸着天', '杜迁', '本事平平，武艺一般', null);
INSERT INTO `hero` VALUES ('84', '第八十四', '地幽星', '病大虫', '薛永', '讲义气，重朋友', null);
INSERT INTO `hero` VALUES ('85', '第八十五', '地僻星', '打虎将', '李忠', '做事悭吝小气 不慷慨', null);
INSERT INTO `hero` VALUES ('86', '第八十六', '地空星', '小霸王', '周通', '鲁莽，粗暴，不仗义', null);
INSERT INTO `hero` VALUES ('87', '第八十七', '地孤星', '金钱豹子', '汤隆', '为人义气，性情耿直，为山寨尽心竭力', null);
INSERT INTO `hero` VALUES ('88', '第八十八', '地全星', '鬼脸儿', '杜兴', '鲁莽，讲义气', null);
INSERT INTO `hero` VALUES ('89', '第八十九', '地短星', '出林龙', '邹渊', '冲动 好赌 贪婪', null);
INSERT INTO `hero` VALUES ('90', '第九十', '地角星', '独角龙', '邹润', '慷慨大义', null);
INSERT INTO `hero` VALUES ('91', '第九十一', '地囚星', '旱地忽律', '朱贵', '性格直率，善良', null);
INSERT INTO `hero` VALUES ('92', '第九十二', '地藏星', '笑面虎', '朱富', '行侠仗义 嫉恶如仇 仔细 谨慎', null);
INSERT INTO `hero` VALUES ('93', '第九十三', '地伏星', '金眼彪', '施恩', '使得一身好拳棒，会施展恩惠', null);
INSERT INTO `hero` VALUES ('94', '第九十四', '地平星', '铁臂膊', '蔡福', '替天行道，正义', null);
INSERT INTO `hero` VALUES ('95', '第九十五', '地损星', '一枝花', '蔡庆', '大义，武功高强', null);
INSERT INTO `hero` VALUES ('96', '第九十六', '地奴星', '催命判官', '李立', '武艺高超，为人仗义', null);
INSERT INTO `hero` VALUES ('97', '第九十七', '地察星', '青眼虎', '李云', '率直 仗义', null);
INSERT INTO `hero` VALUES ('98', '第九十八', '地恶星', '没面目', '焦挺', '拳脚熟练，讲义气', null);
INSERT INTO `hero` VALUES ('99', '第九十九', '地丑星', '石将军', '石勇', '武功一般，粗蛮胆大', null);
INSERT INTO `hero` VALUES ('100', '第一百', '地数星', '小尉迟', '孙新', '正直勇敢，讲义气', null);
INSERT INTO `hero` VALUES ('101', '第一百零一', '地阴星', '母大虫', '顾大嫂', '豪爽急躁，倔强暴躁', null);
INSERT INTO `hero` VALUES ('102', '第一百零二', '地刑星', '菜园子', '张青', '性格内向,憨厚老实', null);
INSERT INTO `hero` VALUES ('103', '第一百零三', '地壮星', '母夜叉', '孙二娘', '性情暴躁,举止粗鲁', null);
INSERT INTO `hero` VALUES ('104', '第一百零四', '地劣星', '活闪婆', '王定六', '嫉恶如仇 识英雄 路见不平拔刀相助', null);
INSERT INTO `hero` VALUES ('105', '第一百零五', '地健星', '险道神', '郁保四', '忠义双全 重英雄', null);
INSERT INTO `hero` VALUES ('106', '第一百零六', '地耗星', '白日鼠', '白胜', '仗义，坚定', null);
INSERT INTO `hero` VALUES ('107', '第一百零七', '地贼星', '鼓上蚤', '时迁', '聪明机智，社会经验丰富 ，善于乔装打扮', null);
INSERT INTO `hero` VALUES ('108', '第一百零八', '地狗星', '金毛犬', '段景住', '性格沉稳，脾气好', null);