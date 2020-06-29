/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3506
Source Database       : hx191117

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-05-01 10:09:07
*/

DROP DATABASE IF EXISTS `hx191117`;
CREATE DATABASE `hx191117` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
SET FOREIGN_KEY_CHECKS=0;
use `hx191117`;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) DEFAULT NULL COMMENT '菜单名',
  `preId` int(50) DEFAULT NULL COMMENT '上一级id',
  `menuUrl` varchar(255) DEFAULT NULL COMMENT '菜单地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '个人中心', '0', '');
INSERT INTO `menu` VALUES ('2', '角色管理', '0', '');
INSERT INTO `menu` VALUES ('3', '员工管理', '0', '');
INSERT INTO `menu` VALUES ('4', '分类管理', '0', '');
INSERT INTO `menu` VALUES ('5', '资源管理', '0', '');
INSERT INTO `menu` VALUES ('6', 'VIP管理', '0', '');
INSERT INTO `menu` VALUES ('7', '用户管理', '0', '');
INSERT INTO `menu` VALUES ('8', '评论管理', '0', '');
INSERT INTO `menu` VALUES ('9', '聊天管理', '0', '');
INSERT INTO `menu` VALUES ('10', '报表管理', '0', '');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `roleDesc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '整个系统');
INSERT INTO `role` VALUES ('2', '员工和资源管理员', '负责后端');
INSERT INTO `role` VALUES ('3', '用户和客服管理员', '负责前端');
INSERT INTO `role` VALUES ('4', '报表管理员', '负责报表');
INSERT INTO `role` VALUES ('5', '普通管理员', '灵活管理');

-- ----------------------------
-- Table structure for permit
-- ----------------------------
DROP TABLE IF EXISTS `permit`;
CREATE TABLE `permit` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `roleId` int(50) DEFAULT NULL COMMENT '角色id',
  `menuId` varchar(250) DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='菜单和角色的关系表';

-- ----------------------------
-- Records of permit
-- ----------------------------
INSERT INTO `permit` VALUES ('1', '1', '1,2,3,4,5,6,7,8,9,10');
INSERT INTO `permit` VALUES ('2', '2', '3,4,5');
INSERT INTO `permit` VALUES ('3', '3', '6,7,8,9,10');
INSERT INTO `permit` VALUES ('4', '4', '10');
INSERT INTO `permit` VALUES ('5', '5', '3');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `staffAcc` varchar(50) DEFAULT NULL COMMENT '账号',
  `staffPwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `staffName` varchar(50) DEFAULT NULL COMMENT '昵称',
  `staffImg` varchar(255) DEFAULT NULL COMMENT '头像',
  `staffState` int(50) DEFAULT NULL COMMENT '状态',
  `roleId` int(50) DEFAULT NULL COMMENT '角色id',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `loginTime` datetime DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', 'admin', '39dc4f1ee693e5adabddd872247e451f','王一','View/images/admin.png', '1', '1', '2020-05-01 17:52:20', '2020-05-01 17:52:20');
INSERT INTO `staff` VALUES ('2', 'admin2', '39dc4f1ee693e5adabddd872247e451f','孙二','View/images/admin2.png', '1', '2', '2020-05-02 17:52:20', '2020-05-05 17:52:20');
INSERT INTO `staff` VALUES ('3', 'admin3', '39dc4f1ee693e5adabddd872247e451f', '赵三','View/images/admin3.png','1', '3', '2020-05-03 17:52:20', '2020-05-06 17:52:20');
INSERT INTO `staff` VALUES ('4', 'admin4', '39dc4f1ee693e5adabddd872247e451f', '陈四','View/images/admin4.png','1', '4', '2020-05-04 17:52:20', '2020-05-08 17:52:20');
INSERT INTO `staff` VALUES ('5', 'admin5', '39dc4f1ee693e5adabddd872247e451f', '李六','View/images/moren.png','0', '4', '2020-05-05 17:52:20', '2020-05-08 17:52:20');

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `sortName` varchar(50) DEFAULT NULL COMMENT '分类名',
  `preId` int(50) DEFAULT NULL COMMENT '上一级id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES ('1', '电视剧', '0');
INSERT INTO `sort` VALUES ('2', '电影', '0');
INSERT INTO `sort` VALUES ('3', '综艺', '0');
INSERT INTO `sort` VALUES ('4', '音乐', '0');
INSERT INTO `sort` VALUES ('5', '纪录片', '0');
INSERT INTO `sort` VALUES ('6', '生活', '0');
INSERT INTO `sort` VALUES ('7', '古装剧', '1');
INSERT INTO `sort` VALUES ('8', '动作电影', '2');
INSERT INTO `sort` VALUES ('9', '日韩综艺', '3');
INSERT INTO `sort` VALUES ('10', '内地音乐', '4');
INSERT INTO `sort` VALUES ('11', '欧美纪录', '5');
INSERT INTO `sort` VALUES ('12', '人生百态', '6');

-- ----------------------------
-- Table structure for res
-- ----------------------------
DROP TABLE IF EXISTS `res`;
CREATE TABLE `res` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `resName` varchar(50) DEFAULT NULL COMMENT '菜单名',
  `sortId` int(50) DEFAULT NULL COMMENT '分类id',
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '封面地址',
  `videoUrl` varchar(255) DEFAULT NULL COMMENT '视频地址',
  `isVip` int(50) DEFAULT NULL COMMENT '是否vip',
  `director` varchar(255) DEFAULT NULL COMMENT '导演',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of res
-- ----------------------------
INSERT INTO `res` VALUES ('1', '仙剑', '7', '../resource/bg.png','../resource/xianjian.mp4','0','导演');
INSERT INTO `res` VALUES ('2', '老酒馆', '7', '../resource/bg2.png','../resource/xianjian.mp4','0','导演2');
INSERT INTO `res` VALUES ('3', '知否知否', '7', '../resource/bg3.png','../resource/xianjian.mp4','0','导演3');
INSERT INTO `res` VALUES ('4', '都挺好', '7', '../resource/bg4.png','../resource/xianjian.mp4','0','导演4');
INSERT INTO `res` VALUES ('5', '外交风云', '7', '../resource/bg5.png','../resource/xianjian.mp4','0','导演5');
INSERT INTO `res` VALUES ('6', '我是真的讨厌异地恋', '8', '../resource/bg6.png','../resource/xianjian.mp4','0','导演6');
INSERT INTO `res` VALUES ('7', '你好世界', '8', '../resource/bg7.png','../resource/xianjian.mp4','0','导演7');
INSERT INTO `res` VALUES ('8', '阿凡达', '8', '../resource/bg8.png','../resource/xianjian.mp4','0','导演8');
INSERT INTO `res` VALUES ('9', '倩女幽魂人间情', '8', '../resource/bg9.png','../resource/xianjian.mp4','0','导演9');
INSERT INTO `res` VALUES ('10', '西行纪大电影', '8', '../resource/bg10.png','../resource/xianjian.mp4','0','导演10');
INSERT INTO `res` VALUES ('11', '创造营', '9', '../resource/bg11.png','../resource/xianjian.mp4','0','导演11');
INSERT INTO `res` VALUES ('12', '拜托了冰箱', '9', '../resource/bg12.png','../resource/xianjian.mp4','0','导演12');
INSERT INTO `res` VALUES ('13', '天赐的声音', '9', '../resource/bg13.png','../resource/xianjian.mp4','0','导演13');
INSERT INTO `res` VALUES ('14', '王牌对王牌', '9', '../resource/bg14.png','../resource/xianjian.mp4','0','导演14');
INSERT INTO `res` VALUES ('15', '欢乐喜剧人', '9', '../resource/bg15.png','../resource/xianjian.mp4','0','导演15');
INSERT INTO `res` VALUES ('16', '说好不哭', '10', '../resource/bg16.png','../resource/xianjian.mp4','0','导演16');
INSERT INTO `res` VALUES ('17', '七里香', '10', '../resource/bg17.png','../resource/xianjian.mp4','0','导演17');
INSERT INTO `res` VALUES ('18', '温柔', '10', '../resource/bg18.png','../resource/xianjian.mp4','0','导演18');
INSERT INTO `res` VALUES ('19', '慢慢喜欢你', '10', '../resource/bg19.png','../resource/xianjian.mp4','0','导演19');
INSERT INTO `res` VALUES ('20', '等风雨经过', '10', '../resource/bg20.png','../resource/xianjian.mp4','0','导演20');
INSERT INTO `res` VALUES ('21', '荒野间谍', '11', '../resource/bg21.png','../resource/xianjian.mp4','0','导演21');
INSERT INTO `res` VALUES ('22', '书房里的世界观', '11', '../resource/bg22.png','../resource/xianjian.mp4','0','导演22');
INSERT INTO `res` VALUES ('23', '记住乡愁', '11', '../resource/bg23.png','../resource/xianjian.mp4','0','导演23');
INSERT INTO `res` VALUES ('24', '奇迹之地', '11', '../resource/bg24.png','../resource/xianjian.mp4','0','导演24');
INSERT INTO `res` VALUES ('25', '西部明星', '11', '../resource/bg25.png','../resource/xianjian.mp4','0','导演25');
INSERT INTO `res` VALUES ('26', '专访武汉抗疫一线护士', '12', '../resource/bg26.png','../resource/xianjian.mp4','0','导演24');
INSERT INTO `res` VALUES ('27', '小猪佩奇全集', '12', '../resource/bg27.png','../resource/xianjian.mp4','0','导演27');
INSERT INTO `res` VALUES ('28', '明星花式秀恩爱', '12', '../resource/bg28.png','../resource/xianjian.mp4','0','导演28');
INSERT INTO `res` VALUES ('29', '海外旅游城市', '12', '../resource/bg29.png','../resource/xianjian.mp4','0','导演29');
INSERT INTO `res` VALUES ('30', '寻访传说中的城', '12', '../resource/bg30.png','../resource/xianjian.mp4','0','导演30');

-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `vipName` varchar(50) DEFAULT NULL COMMENT 'vip名称',
  `vipTime` varchar(50) DEFAULT NULL COMMENT 'vip时间',
  `vipMoney` varchar(50) DEFAULT NULL COMMENT 'vip价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='vip表';

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('1', '普通会员(包月)', '30','10');
INSERT INTO `vip` VALUES ('2', '白银会员(包季)', '120','40');
INSERT INTO `vip` VALUES ('3', '黄金会员(包年)', '365','158');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userImg` varchar(255) DEFAULT '' COMMENT '头像',
  `userName` varchar(50) DEFAULT NULL COMMENT '昵称',
  `userAcc` varchar(50) DEFAULT NULL COMMENT '账号',
  `userPwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `userState` varchar(50) DEFAULT NULL COMMENT '状态',
  `userTel` varchar(50) DEFAULT NULL COMMENT '电话',
  `userAdd` varchar(50) DEFAULT NULL COMMENT '地址',
  `userMoney` varchar(50) DEFAULT NULL COMMENT '余额',
  `regTime` datetime DEFAULT NULL COMMENT '注册时间',
  `loginTime` datetime DEFAULT NULL COMMENT '登录时间',
  `payTime` datetime DEFAULT NULL COMMENT '充值时间',
  `outTime` datetime DEFAULT NULL COMMENT '过期时间',
  `vipId` varchar(50) DEFAULT NULL COMMENT 'vip类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'View/images/user.png', '张三', '11111', '39dc4f1ee693e5adabddd872247e451f', '1', '05961234567', '厦门', '0', '2020-01-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20','1');
INSERT INTO `user` VALUES ('2', 'View/images/user2.png', '李四', '22222', '39dc4f1ee693e5adabddd872247e451f', '0', '05961234567', '厦门', '0', '2020-01-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20','2');
INSERT INTO `user` VALUES ('3', 'View/images/user3.png', '王五', '33333', '39dc4f1ee693e5adabddd872247e451f', '1', '05961234567', '厦门', '0', '2020-01-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20','3');
INSERT INTO `user` VALUES ('4', 'View/images/user4.png', '赵六', '44444', '39dc4f1ee693e5adabddd872247e451f', '1', '05961234567', '厦门', '0', '2020-02-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20','1');
INSERT INTO `user` VALUES ('5', 'View/images/user5.png', '陈七', '55555', '39dc4f1ee693e5adabddd872247e451f', '1', '05961234567', '厦门', '0', '2020-02-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20','2');
INSERT INTO `user` VALUES ('6', 'View/images/user2.png', '李三', '66666', '39dc4f1ee693e5adabddd872247e451f', '1', '05961234567', '厦门', '0', '2020-03-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20','2');
INSERT INTO `user` VALUES ('7', 'View/images/user3.png', '王二', '77777', '39dc4f1ee693e5adabddd872247e451f', '1', '05961234567', '厦门', '0', '2020-04-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20','2');
INSERT INTO `user` VALUES ('8', 'View/images/user4.png', '三四', '88888', '39dc4f1ee693e5adabddd872247e451f', '1', '05961234567', '厦门', '0', '2020-04-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20','2');
INSERT INTO `user` VALUES ('9', 'View/images/user3.png', '五六', '99999', '39dc4f1ee693e5adabddd872247e451f', '1', '05961234567', '厦门', '0', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20','2');
INSERT INTO `user` VALUES ('10', 'View/images/user5.png', '六七', '85225', '39dc4f1ee693e5adabddd872247e451f', '1', '05961234567', '厦门', '0', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20','2');
INSERT INTO `user` VALUES ('11', 'View/images/user2.png', '七八', '25852', '39dc4f1ee693e5adabddd872247e451f', '1', '05961234567', '厦门', '0', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20', '2020-05-01 17:52:20','2');

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userAcc` varchar(50) DEFAULT NULL COMMENT '用户',
  `resName` varchar(50) DEFAULT NULL COMMENT '作品',
  `disContent` varchar(50) DEFAULT NULL COMMENT '内容',
  `disTime` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES ('1', '11111', '老酒馆','真好看哈哈哈哈','2020-05-01 17:52:20');
INSERT INTO `discuss` VALUES ('2', '22222', '你好世界','真好看呀呀呀','2020-05-01 17:52:20');
INSERT INTO `discuss` VALUES ('3', '33333', '创造营','真好看呀呀呀','2020-05-01 17:52:20');
INSERT INTO `discuss` VALUES ('4', '44444', '说好不哭','真好看呀呀呀','2020-05-01 17:52:20');
INSERT INTO `discuss` VALUES ('5', '55555', '奇迹之地','真好看呀呀呀','2020-05-01 17:52:20');
INSERT INTO `discuss` VALUES ('6', '66666', '小猪佩奇全集','真好看呀呀呀','2020-05-01 17:52:20');
INSERT INTO `discuss` VALUES ('7', '77777', '天赐的声音','真好看呀呀呀','2020-05-01 17:52:20');
INSERT INTO `discuss` VALUES ('8', '88888', '知否知否','真好看呀呀呀','2020-05-01 17:52:20');
INSERT INTO `discuss` VALUES ('9', '99999', '都挺好','真好看呀呀呀','2020-05-01 17:52:20');

-- ----------------------------
-- Table structure for orderList
-- ----------------------------
DROP TABLE IF EXISTS `orderList`;
CREATE TABLE `orderList` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userAcc` varchar(50) DEFAULT NULL COMMENT '用户',
  `vipName` varchar(50) DEFAULT NULL COMMENT 'vip名',
  `vipMoney` varchar(50) DEFAULT NULL COMMENT '价钱',
  `orderState` varchar(50) DEFAULT NULL COMMENT '订单状态',
  `orderTime` datetime DEFAULT NULL COMMENT '订单时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='vip订单表';

-- ----------------------------
-- Records of orderList
-- ----------------------------
INSERT INTO `orderList` VALUES ('1', '11111', '普通会员(包月)','10','已支付','2019-05-01 10:52:20');
INSERT INTO `orderList` VALUES ('2', '11111', '普通会员(包月)','10','已支付','2019-08-01 00:52:20');
INSERT INTO `orderList` VALUES ('3', '11111', '普通会员(包月)','10','已支付','2019-12-01 00:52:20');

-- ----------------------------
-- Table structure for clickList
-- ----------------------------
DROP TABLE IF EXISTS `clickList`;
CREATE TABLE `clickList` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userAcc` varchar(50) DEFAULT NULL COMMENT '用户',
  `resName` varchar(50) DEFAULT NULL COMMENT '视频名称',
  `clickId` varchar(50) DEFAULT NULL COMMENT '点击次数',
  `clickTime` datetime DEFAULT NULL COMMENT '点击时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='播放记录表';

-- ----------------------------
-- Records of clickList
-- ----------------------------
INSERT INTO `clickList` VALUES ('1', '11111', '仙剑','1','2020-01-01 10:52:20');
INSERT INTO `clickList` VALUES ('2', '11111', '老酒馆','1','2020-01-01 00:52:20');
INSERT INTO `clickList` VALUES ('3', '11111', '知否知否','1','2020-03-01 00:52:20');
INSERT INTO `clickList` VALUES ('4', '11111', '都挺好','1','2020-04-03 00:52:20');
INSERT INTO `clickList` VALUES ('5', '11111', '外交风云','1','2020-05-03 00:52:20');
INSERT INTO `clickList` VALUES ('6', '22222', '我是真的讨厌异地恋','1','2020-01-01 10:52:20');
INSERT INTO `clickList` VALUES ('7', '33333', '你好世界','1','2020-02-01 00:52:20');
INSERT INTO `clickList` VALUES ('8', '44444', '阿凡达','1','2020-03-01 00:52:20');
INSERT INTO `clickList` VALUES ('9', '55555', '倩女幽魂人间情','1','2020-05-03 00:52:20');
INSERT INTO `clickList` VALUES ('10', '66666', '西行纪大电影','1','2020-05-03 00:52:20');
INSERT INTO `clickList` VALUES ('11', '77777', '创造营','1','2020-01-01 10:52:20');
INSERT INTO `clickList` VALUES ('12', '88888', '拜托了冰箱','1','2020-01-01 00:52:20');
INSERT INTO `clickList` VALUES ('13', '99999', '天赐的声音','1','2020-03-01 00:52:20');
INSERT INTO `clickList` VALUES ('14', '11111', '王牌对王牌','1','2020-03-03 00:52:20');
INSERT INTO `clickList` VALUES ('15', '11111', '欢乐喜剧人','1','2020-05-03 00:52:20');
INSERT INTO `clickList` VALUES ('16', '77777', '说好不哭','1','2020-01-01 10:52:20');
INSERT INTO `clickList` VALUES ('17', '88888', '七里香','1','2020-02-01 00:52:20');
INSERT INTO `clickList` VALUES ('18', '99999', '温柔','1','2020-03-01 00:52:20');
INSERT INTO `clickList` VALUES ('19', '00000', '慢慢喜欢你','1','2020-04-03 00:52:20');
INSERT INTO `clickList` VALUES ('20', '00000', '等风雨经过','1','2020-05-03 00:52:20');
INSERT INTO `clickList` VALUES ('21', '77777', '书房里的世界观','1','2020-01-01 10:52:20');
INSERT INTO `clickList` VALUES ('22', '88888', '记住乡愁','1','2020-01-01 00:52:20');
INSERT INTO `clickList` VALUES ('23', '99999', '奇迹之地','1','2020-05-01 00:52:20');
INSERT INTO `clickList` VALUES ('24', '12345', '西部明星','1','2020-04-03 00:52:20');
INSERT INTO `clickList` VALUES ('25', '11111', '小猪佩奇全集','1','2020-05-03 00:52:20');
INSERT INTO `clickList` VALUES ('26', '77777', '明星花式秀恩爱','1','2020-01-01 10:52:20');
INSERT INTO `clickList` VALUES ('27', '88888', '海外旅游城市','1','2020-04-01 00:52:20');
INSERT INTO `clickList` VALUES ('28', '99999', '寻访传说中的城','1','2020-02-01 00:52:20');
INSERT INTO `clickList` VALUES ('29', '12345', '荒野间谍','1','2020-04-03 00:52:20');
INSERT INTO `clickList` VALUES ('30', '45678', '专访武汉抗疫一线护士','1','2020-05-03 00:52:20');

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fromUser` varchar(255) DEFAULT NULL COMMENT '发送者',
  `toUser` varchar(255) DEFAULT NULL COMMENT '接收者',
  `chatContent` text COMMENT '聊天内容',
  `chatTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '聊天时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat
-- ----------------------------





