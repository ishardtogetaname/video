/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2020-02-07 14:29:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'wsgly', 'static/images/管理员头像.png');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(10) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '电影', '0');
INSERT INTO `category` VALUES ('2', '动漫', '0');
INSERT INTO `category` VALUES ('3', '电视剧', '0');
INSERT INTO `category` VALUES ('4', 'IT学习', '0');
INSERT INTO `category` VALUES ('5', '爱情', '1');
INSERT INTO `category` VALUES ('6', '动作', '1');
INSERT INTO `category` VALUES ('7', '喜剧', '1');
INSERT INTO `category` VALUES ('8', '战争', '1');
INSERT INTO `category` VALUES ('9', '科幻', '1');
INSERT INTO `category` VALUES ('10', '剧情', '1');
INSERT INTO `category` VALUES ('11', '武侠', '1');
INSERT INTO `category` VALUES ('12', '冒险', '1');
INSERT INTO `category` VALUES ('13', '枪战', '1');
INSERT INTO `category` VALUES ('14', '恐怖', '1');
INSERT INTO `category` VALUES ('15', '悬疑', '1');
INSERT INTO `category` VALUES ('16', '奇幻', '1');
INSERT INTO `category` VALUES ('17', '动画', '1');
INSERT INTO `category` VALUES ('18', '惊悚', '1');
INSERT INTO `category` VALUES ('19', '经典', '1');
INSERT INTO `category` VALUES ('20', '青春', '1');
INSERT INTO `category` VALUES ('21', '古装', '1');
INSERT INTO `category` VALUES ('22', '文艺', '1');
INSERT INTO `category` VALUES ('23', '热血', '2');
INSERT INTO `category` VALUES ('24', '爱情', '2');
INSERT INTO `category` VALUES ('25', '搞笑', '2');
INSERT INTO `category` VALUES ('26', '少儿', '2');
INSERT INTO `category` VALUES ('27', '亲子', '2');
INSERT INTO `category` VALUES ('28', '魔法', '2');
INSERT INTO `category` VALUES ('29', '运动', '2');
INSERT INTO `category` VALUES ('30', '机战', '2');
INSERT INTO `category` VALUES ('31', '科幻', '2');
INSERT INTO `category` VALUES ('32', '校园', '2');
INSERT INTO `category` VALUES ('33', '动物', '2');
INSERT INTO `category` VALUES ('34', '冒险', '2');
INSERT INTO `category` VALUES ('35', '神话', '2');
INSERT INTO `category` VALUES ('36', '推理', '2');
INSERT INTO `category` VALUES ('37', '剧情', '2');
INSERT INTO `category` VALUES ('38', '战争', '2');
INSERT INTO `category` VALUES ('39', '经典', '2');
INSERT INTO `category` VALUES ('40', '男性向', '2');
INSERT INTO `category` VALUES ('41', '女性向', '2');
INSERT INTO `category` VALUES ('42', 'java', '4');
INSERT INTO `category` VALUES ('43', 'javaScript', '4');
INSERT INTO `category` VALUES ('44', 'html+css', '4');
INSERT INTO `category` VALUES ('45', 'mybatis', '4');
INSERT INTO `category` VALUES ('46', 'spring', '4');
INSERT INTO `category` VALUES ('47', 'springmvc', '4');
INSERT INTO `category` VALUES ('48', 'layui', '4');
INSERT INTO `category` VALUES ('49', 'android', '4');

-- ----------------------------
-- Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `episode` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('1', '7', '1', '绿皮书', '2019-11-18 20:20:19', 'file/video/images/绿皮书.jpg', '绿皮书', '1');
INSERT INTO `history` VALUES ('2', '5', '1', '我想吃掉你的胰脏', '2019-11-18 20:41:25', 'file/video/images/我想吃掉你的胰脏.jpg', '我想吃掉你的胰脏', '1');
INSERT INTO `history` VALUES ('3', '4', '1', '左耳', '2019-12-13 19:14:20', 'file/video/images/左耳.png', '左耳 HD1280高清国语中字版', '1');
INSERT INTO `history` VALUES ('4', '12', '1', '悬崖上的金鱼姬', '2019-12-02 21:22:29', 'file/video/images/悬崖上的金鱼姬.png', '悬崖上的金鱼姬', '1');
INSERT INTO `history` VALUES ('5', '7', '3', '绿皮书', '2019-11-18 18:36:14', 'file/video/images/绿皮书.jpg', '绿皮书', '1');
INSERT INTO `history` VALUES ('6', '10', '1', '分手大师', '2019-12-13 19:16:10', 'file/video/images/分手大师.jpg', '分手大师 BD1280高清国语中英双字', '1');
INSERT INTO `history` VALUES ('7', '1', '1', '诛仙', '2019-11-30 17:59:13', 'file/video/images/诛仙.jpg', '诛仙	HDTC国语中字版', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '测试01', '13741338355', '123', 'file/user/avatar/测试01-1574082105175.png', '23', '1995-12-07', '男');
INSERT INTO `user` VALUES ('2', '测试02', '13031516546', '111111', 'file/user/avatar/测试02-1572346933596.png', '20', '1999-10-20', '女');
INSERT INTO `user` VALUES ('3', '刘爸爸', '13538978202', '111111', 'file/user/avatar/刘爸爸-1574072845324.png', '21', '1998-10-20', '男');
INSERT INTO `user` VALUES ('4', '测试0003', '13031516546', '111111', 'file/user/avatar/d95cb271-12b0-4a96-8d60-e3650a262ed9.png', '22', '1997-01-21', '女');
INSERT INTO `user` VALUES ('5', '隔壁老王', '13484888464', '111111', 'file/user/avatar/4f456e40-1415-408d-adb1-c376456e4402.png', '0', null, null);

-- ----------------------------
-- Table structure for `user_collection`
-- ----------------------------
DROP TABLE IF EXISTS `user_collection`;
CREATE TABLE `user_collection` (
  `uid` int(11) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_collection
-- ----------------------------
INSERT INTO `user_collection` VALUES ('3', '10');
INSERT INTO `user_collection` VALUES ('3', '12');
INSERT INTO `user_collection` VALUES ('3', '9');
INSERT INTO `user_collection` VALUES ('3', '5');
INSERT INTO `user_collection` VALUES ('3', '7');
INSERT INTO `user_collection` VALUES ('3', '4');
INSERT INTO `user_collection` VALUES ('4', '9');
INSERT INTO `user_collection` VALUES ('4', '7');
INSERT INTO `user_collection` VALUES ('1', '9');
INSERT INTO `user_collection` VALUES ('1', '4');
INSERT INTO `user_collection` VALUES ('1', '10');
INSERT INTO `user_collection` VALUES ('1', '7');
INSERT INTO `user_collection` VALUES ('1', '12');
INSERT INTO `user_collection` VALUES ('1', '5');
INSERT INTO `user_collection` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `videos`
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  `current_episode` int(4) DEFAULT NULL,
  `total_episode` int(4) DEFAULT NULL,
  `img_src` varchar(255) DEFAULT NULL,
  `starring` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `type` int(10) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `publish_date` year(4) DEFAULT NULL,
  `finished` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('1', '诛仙', '1', '1', 'file/video/images/诛仙.jpg', '肖战   李沁   孟美岐   唐艺昕', '《诛仙I》是新丽传媒有限责任公司出品的古装玄幻电影，由程小东执导，肖战、李沁、孟美岐领衔主演，唐艺昕特邀主演。该片改编自萧鼎同名小说，讲述了平凡少年张小凡经草庙村惨案拜入青云门，机缘巧合之下获得法器烧火棍，从而卷入正邪两道之间隐秘斗争的故事。于2019年9月13日在中国大陆上映。', '1', '内地', '2019', '1');
INSERT INTO `videos` VALUES ('4', '左耳', '1', '1', 'file/video/images/左耳.png', '陈都灵   欧豪   杨洋   马思纯   关晓彤   胡夏   段博文', '单纯美丽的李珥（陈都灵 饰）左耳失聪，无法听见声音，然而，生理上的缺陷并没有令她感到自卑，正相反，她的个性温顺又温柔。一次偶然中，李珥结识了名叫吧啦（马思纯 饰）的女孩，吧啦的个性和李珥截然相反，她无拘无束，桀骜不驯，向往自由的生活。在吧啦的身上，李珥看到了自己内心里叛 逆执着的一面。\r\n　　让李珥没有想到的是，吧啦竟然和自己一直暗恋的男生许弋（杨洋 饰）走到了一起，这让李珥开始体会到了青春的残酷。然而，吧啦的内心里其实喜欢着名为张漾（欧豪 饰）的男生，命运让他们的爱情成为了悲剧，并且最终夺走了吧啦年轻的生命，这场意外让几个懵懂的孩子们迅速蜕变成长，绽放出了最艳丽绝望的青春之花', '1', '内地', '2015', '1');
INSERT INTO `videos` VALUES ('5', '我想吃掉你的胰脏', '1', '1', 'file/video/images/我想吃掉你的胰脏.jpg', '高杉真宙   Lynn   藤井雪代   内田雄马   福岛润   田中敦子   三木真一郎', '“没有名字的我，没有未来的她”，对他人毫无兴趣，总是独自一人读书的高中生“我”。这样的“我”有一天，偶然捡到一册写着《共病文库》的文库本。那是，天真烂漫的班上人气王·山内樱良私下记录的日记本。里面记载着她身患胰脏的疾病，已经时日无多......。隐藏自己的疾病度过日常的樱良，与知晓其秘密的“我”。——两人的距离，还没有名字。', '1', '日本', '2018', '1');
INSERT INTO `videos` VALUES ('7', '绿皮书', '1', '1', 'file/video/images/绿皮书.jpg', '维果·莫特森   马赫沙拉·阿里', '托尼（维果·莫腾森 Viggo Mortensen 饰）是一个吊儿郎当游手好闲的混混，在一家夜总会做侍者。这间夜总会因故要停业几个月，可托尼所要支付的房租和生活费不会因此取消，所以他的当务之急是去寻找另一份工作来填补这几个月的空缺。在这个节骨眼上，一位名叫唐雪莉（马赫沙拉·阿里 Mahershala Ali 饰）的黑人钢琴家提出雇佣托尼。\r\n　　唐雪莉即将开始为期八个星期的南下巡回演出，可是，那个时候南方对黑人的歧视非常的严重，于是托尼便成为了唐雪莉的司机兼保镖。一路上，两人迥异的性格使得他们之间产生了很多的矛盾，与此同时，唐雪莉在南方所遭受的种种不公平的对待也让托尼对种族歧视感到深恶痛绝。', '1', '美国', '2018', '1');
INSERT INTO `videos` VALUES ('9', '十二个想死的孩子', '1', '1', 'file/video/images/十二个想死的孩子.jpg', '杉咲花  新田真剑佑', '當活着比死更需勇氣，十二個少年來到荒廢醫院，進行本以為是12 比0 的投票，通過後便可集體自殺，卻發現房間多了一具屍體，必須找出兇手和企圖破壞契約的潛入者。劇情以新本格派推理展開，同時進行「十二怒漢」式針鋒相對。原來再厭世，內心極渴望別人聆聽自己故事。每一個都可疑，每一個都隨時被說服，結局示範最令人心悅誠服的反轉。《20 世紀少年》（2008-09）、《愛的成人式》（2015）導演堤幸彥巧妙觸碰少年自殺的禁忌，像補完計劃般置諸死地，在絕望深淵，一次擁抱可拯救一個靈魂。', '1', '日本', '2019', '1');
INSERT INTO `videos` VALUES ('10', '分手大师', '1', '1', 'file/video/images/分手大师.jpg', '邓超   杨幂   梁超   古力娜扎  柳岩', '梅远贵（邓超 饰）是一个情感经历极为丰富的男人，虽然有过这样那样的失败恋情，却也帮他铺就了一条通往荣华复归的康庄大道。现如今的梅远贵生活在首都北京，与其精英团队操办起帮人分手的奇葩业务，无论你有着怎样的感情和生活，只要票子给足，他总会高效率地完成任务。爱情那么虚幻的东西太不可靠，还是钱最让他放心。这一天，梅照例接了一单生意，那就是帮客户甩掉美丽女孩叶小春（杨幂 饰）。小春是一个自强不息的北漂姑娘，她渴望可以让之依靠休息的港湾，同时也为了美好的明天奋力打拼。原本踌躇满志的梅远贵，从和小春接触的第一天起，他们彼此的人生就发生了改变……\r\n　　本片根据同名人气话剧改编。', '1', '内地', '2014', '1');
INSERT INTO `videos` VALUES ('12', '悬崖上的金鱼姬', '1', '1', 'file/video/images/悬崖上的金鱼姬.png', '奈良柚莉爱   山口智子   长岛一茂    天海祐希   柊瑠美', '金鱼姬是一条活泼好动的小鱼，一次偶然的机会，它在涨潮时被冲进了玻璃瓶中无法脱身。此时，刚好来海边度假的男孩宗介路过，帮它解困，从此人鱼相识。宗介把金鱼抱回家里喂养，一起玩耍，感情甚笃。由于海员父亲终日出航，宗介只得跟母亲相依为命，这让他的性格孤僻自闭，甚至对长辈也不理不睬。但是，遇到金鱼姬后，宗介逐渐改变了对生活的冷漠态度，这也让他慢慢修复了性格中的缺陷。一次意外的海啸中，宗介撞伤了身体，金鱼姬沾染到了人类的血，飘回了大海之中。原来海洋中还有另外一个世界，那里有个操控水文环境的古怪男子藤本，因为发现了人类污染环境的丑陋，所以自造了另一个水中世界。他发现金鱼姬沾染了人气，正准备用魔法将它打回原形，却事与愿违……', '1', '日本', '2008', '1');
INSERT INTO `videos` VALUES ('13', '好小子们', '1', '1', 'file/video/images/好小子们.png', '雅各布·特瑞布雷', '三个六年级的男孩离开学校，带着意外被盗的毒品，被十几岁的女孩追捕的同时试图及时回家参加期待已久的派对，他们踏上了一段史诗般的旅程。', '1', '美国', '2019', '1');
INSERT INTO `videos` VALUES ('18', '柳列的音乐专辑', '1', '1', 'file/video/images/325.png', '金高银、丁海寅', '       在韩国上世纪末的IMF时期，通过“柳烈的音乐专辑”广播电台发送自己的故事渐渐产生爱情的美洙（金高银饰）和玄雨（丁海寅饰）之间的浪漫故事', '1', '其他', '2019', '1');
INSERT INTO `videos` VALUES ('19', '请以你的名字呼唤我', '1', '1', 'file/video/images/1323.png', '提莫西·查拉梅、艾米·汉莫、迈克尔·斯图巴', '故事发生在20世纪80年代的意大利里维埃拉，突如其来的爱仿佛林中奔出的野兽，攫住了17岁少年艾利欧的身与心。他爱上了大他6岁、来意大利游历的美国博士生奥利弗。两人对彼此着迷、犹疑、试探，让情欲在涌动中迸发，成就了一段仅仅为时六周的初恋。这段美好的夏日之恋，在两人心中留下了不可磨灭的印记', '1', '美国', '2017', '1');
INSERT INTO `videos` VALUES ('20', '入间同学入魔了', '12', '12', 'file/video/images/入间同学入魔了.png', '西修（にし おさむ）', '被笨蛋双亲卖给恶魔当孙子的可怜少年入间，却得到了没有孙子的恶魔爷爷沙利文的溺爱。但是，沙利文却要求他进入到恶魔学校·巴比尔斯里去上学！于是，入间一边要隐藏自己身为人类的身份，一边要迎来学校生活。但是，与他本人意愿相反的是，由于自己是学园理事长的孙子，入间因此在学校里一直备受瞩目。\r\n       当各种各样的麻烦找上门来时，入间却凭借着老实、坚强的性格，在无意中不断提高着自己在学园内的地位……', '2', '内地', '2019', '1');
INSERT INTO `videos` VALUES ('21', '在地下城寻求邂逅是否搞错了什么 第二季', '13', '13', 'file/video/images/在地下城寻求邂逅是否搞错了什么 第二季.jpg', '大森藤野', '故事发生在拥有通称“地下城”的广阔的地下迷宫的迷宫都市欧拉丽，想成为冒险者并且向往像英雄冒险谭中那样的“与异性命运的邂逅”的主人公贝尔·克朗尼，在这个地方遇见了一位小“神仙”赫斯缇雅，而她正四处寻找自己“眷族”的成员。吃了不少“眷族”闭门羹的贝尔在听了其劝诱后，立马就决定加入。某日，贝尔在地下城遭到了怪物“弥诺陶洛斯”的袭击，由于水平之差而无计可施的贝尔面临走投无路的危机，而在千钧一发之际，最强冒险者艾丝·华伦斯坦出手相助。就在这一瞬间，贝尔对艾丝一见钟情。就这样，一段眷族神话正式拉开帷幕。', '2', '日本', '2019', '1');
INSERT INTO `videos` VALUES ('23', '好莱坞往事', '1', '1', 'file/video/images/好莱坞往事.png', '莱昂纳多·迪卡普里奥，布拉德·皮特，玛格特·罗比', '1969年，美国洛杉矶社会政治动荡与反叛文化的兴起，旧电影制度和观念的瓦解，电视业的蓬勃发展，欧洲新电影的冲击，都像狂风暴雨一样冲击着当时的好莱坞。在这样的变革中，过气的动作片演员里克·达尔顿（莱昂纳多·迪卡普里奥饰）和他的御用替身克里夫·布斯（布拉德·皮特饰）挣扎着想要在他们已经不再熟悉的好莱坞翻红。与此同时，里克·达尔顿的邻居著名女星莎朗·塔特（玛格特·罗比饰），也是著名导演罗曼·波兰斯基的妻子，惨遭好莱坞邪教曼森家族残忍杀害，震惊全美。而华人巨星李小龙（麦克·毛饰），曾是罗曼·波兰斯基的私人教练，他遗失的一副墨镜也成为这起凶杀案的物证', '1', '美国', '2019', '1');

-- ----------------------------
-- Table structure for `video_category`
-- ----------------------------
DROP TABLE IF EXISTS `video_category`;
CREATE TABLE `video_category` (
  `video_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_category
-- ----------------------------
INSERT INTO `video_category` VALUES ('1', '5');
INSERT INTO `video_category` VALUES ('1', '21');
INSERT INTO `video_category` VALUES ('1', '16');
INSERT INTO `video_category` VALUES ('9', '15');
INSERT INTO `video_category` VALUES ('10', '7');
INSERT INTO `video_category` VALUES ('10', '5');
INSERT INTO `video_category` VALUES ('7', '10');
INSERT INTO `video_category` VALUES ('7', '7');
INSERT INTO `video_category` VALUES ('5', '5');
INSERT INTO `video_category` VALUES ('5', '17');
INSERT INTO `video_category` VALUES ('4', '5');
INSERT INTO `video_category` VALUES ('13', '7');
INSERT INTO `video_category` VALUES ('12', '17');
INSERT INTO `video_category` VALUES ('12', '12');
INSERT INTO `video_category` VALUES ('12', '16');
INSERT INTO `video_category` VALUES ('21', '23');
INSERT INTO `video_category` VALUES ('21', '28');
INSERT INTO `video_category` VALUES ('21', '34');
INSERT INTO `video_category` VALUES ('20', '25');
INSERT INTO `video_category` VALUES ('20', '32');
INSERT INTO `video_category` VALUES ('20', '28');
INSERT INTO `video_category` VALUES ('18', '5');
INSERT INTO `video_category` VALUES ('18', '10');
INSERT INTO `video_category` VALUES ('19', '5');
INSERT INTO `video_category` VALUES ('19', '10');
INSERT INTO `video_category` VALUES ('23', '10');
INSERT INTO `video_category` VALUES ('23', '18');

-- ----------------------------
-- Table structure for `video_detail`
-- ----------------------------
DROP TABLE IF EXISTS `video_detail`;
CREATE TABLE `video_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `episode` int(10) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_detail
-- ----------------------------
INSERT INTO `video_detail` VALUES ('1', '诛仙	HDTC国语中字版', '1', '诛仙 HDTC国语中字版.mp4', '2019-10-10 00:00:00', '1');
INSERT INTO `video_detail` VALUES ('2', '左耳 HD1280高清国语中字版', '1', '左耳 HD1280高清国语中字版.mp4', '2019-10-10 00:00:00', '4');
INSERT INTO `video_detail` VALUES ('3', '我想吃掉你的胰脏', '1', '我想吃掉你的胰脏.mkv', '2019-10-10 00:00:00', '5');
INSERT INTO `video_detail` VALUES ('4', '绿皮书', '1', '绿皮书.mp4', '2019-10-10 00:00:00', '7');
INSERT INTO `video_detail` VALUES ('5', '十二个想死的孩子', '1', '十二个想死的孩子.mp4', '2019-10-10 00:00:00', '9');
INSERT INTO `video_detail` VALUES ('6', '分手大师 BD1280高清国语中英双字', '1', '分手大师 BD1280高清国语中英双字.mkv', '2019-10-10 00:00:00', '10');
INSERT INTO `video_detail` VALUES ('7', '悬崖上的金鱼姬', '1', '悬崖上的金鱼姬.mkv', '2019-10-10 00:00:00', '12');
INSERT INTO `video_detail` VALUES ('10', '这是第一集', '1', null, null, '18');
INSERT INTO `video_detail` VALUES ('11', '这是第二集', '2', null, null, '18');
INSERT INTO `video_detail` VALUES ('12', '这是第3集', '3', null, null, '18');
INSERT INTO `video_detail` VALUES ('14', '5', '5', null, null, '18');
INSERT INTO `video_detail` VALUES ('15', '6', '6', null, null, '18');
INSERT INTO `video_detail` VALUES ('16', '7', '7', null, null, '18');
INSERT INTO `video_detail` VALUES ('18', '好小子们-01', '1', '好小子们-01.mp4', '2019-12-11 14:05:20', '13');
