/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50736 (5.7.36-log)
 Source Host           : localhost:3306
 Source Schema         : flowerstore

 Target Server Type    : MySQL
 Target Server Version : 50736 (5.7.36-log)
 File Encoding         : 65001

 Date: 20/01/2024 20:58:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` int(11) NOT NULL COMMENT '评论id',
  `comment_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `flower_id` int(11) NULL DEFAULT NULL COMMENT '鲜花id',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `u`(`user_id`) USING BTREE,
  INDEX `o`(`order_id`) USING BTREE,
  INDEX `f`(`flower_id`) USING BTREE,
  CONSTRAINT `f` FOREIGN KEY (`flower_id`) REFERENCES `flower` (`flower_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `o` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (650596382, '552522', 647188458, 192181812, 297109811);
INSERT INTO `comment` VALUES (651438362, '', 642923757, 192181812, 297024091);
INSERT INTO `comment` VALUES (651449340, '挺好的', 642923757, 192181812, 297024091);
INSERT INTO `comment` VALUES (651493791, '我是一枝花', 651471586, 192181812, 297178368);
INSERT INTO `comment` VALUES (653291537, '好漂亮', 653269464, 192181812, 297178368);
INSERT INTO `comment` VALUES (653976003, '1111111', 644340159, 192181812, 297024091);

-- ----------------------------
-- Table structure for flower
-- ----------------------------
DROP TABLE IF EXISTS `flower`;
CREATE TABLE `flower`  (
  `flower_id` int(11) NOT NULL COMMENT '鲜花的id开头2',
  `flower_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `flower_price` double(5, 2) NULL DEFAULT NULL COMMENT '价格',
  `flower_priced` double(5, 2) NULL DEFAULT NULL COMMENT '原价',
  `flower_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图像',
  `flower_sales` int(255) NULL DEFAULT NULL COMMENT '销量',
  `flower_specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `flower_detail1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详情1',
  `flower_detail2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详情2',
  `flower_detail3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详情3',
  PRIMARY KEY (`flower_id`) USING BTREE,
  INDEX `flower_name`(`flower_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of flower
-- ----------------------------
INSERT INTO `flower` VALUES (297024091, '专属浪漫', 70.00, 84.00, 'http://localhost:8080/static/1.jpg', 1120, '一束', 'http://localhost:8080/static/t1.jpg', 'http://localhost:8080/static/t2.jpg', 'http://localhost:8080/static/t3.jpg');
INSERT INTO `flower` VALUES (297061880, '我的女神', 190.00, 228.00, 'http://localhost:8080/static/2.jpg', 3040, '一束', 'http://localhost:8080/static/t1.jpg', 'http://localhost:8080/static/t2.jpg', 'http://localhost:8080/static/t3.jpg');
INSERT INTO `flower` VALUES (297071792, '浪漫相伴', 180.00, 216.00, 'http://localhost:8080/static/3.jpg', 2880, '一束', 'http://localhost:8080/static/t1.jpg', 'http://localhost:8080/static/t2.jpg', 'http://localhost:8080/static/t3.jpg');
INSERT INTO `flower` VALUES (297082869, '微微一笑', 90.00, 108.00, 'http://localhost:8080/static/4.jpg', 1440, '一束', 'http://localhost:8080/static/t1.jpg', 'http://localhost:8080/static/t2.jpg', 'http://localhost:8080/static/t3.jpg');
INSERT INTO `flower` VALUES (297109811, '星光璀璨', 20.00, 24.00, 'http://localhost:8080/static/5.jpg', 320, '一束', 'http://localhost:8080/static/t1.jpg', 'http://localhost:8080/static/t2.jpg', 'http://localhost:8080/static/t3.jpg');
INSERT INTO `flower` VALUES (297122924, '偏偏喜欢你', 120.00, 144.00, 'http://localhost:8080/static/6.jpg', 1920, '一束', 'http://localhost:8080/static/t1.jpg', 'http://localhost:8080/static/t2.jpg', 'http://localhost:8080/static/t3.jpg');
INSERT INTO `flower` VALUES (297133642, '深深祝福', 150.00, 180.00, 'http://localhost:8080/static/7.jpg', 2400, '一束', 'http://localhost:8080/static/t1.jpg', 'http://localhost:8080/static/t2.jpg', 'http://localhost:8080/static/t3.jpg');
INSERT INTO `flower` VALUES (297178368, '求婚', 110.00, 132.00, 'http://localhost:8080/static/8.jpg', 1760, '一束', 'http://localhost:8080/static/t1.jpg', 'http://localhost:8080/static/t2.jpg', 'http://localhost:8080/static/t3.jpg');
INSERT INTO `flower` VALUES (297185995, '初恋滋味', 10.00, 12.00, 'http://localhost:8080/static/9.jpg', 160, '一束', 'http://localhost:8080/static/t1.jpg', 'http://localhost:8080/static/t2.jpg', 'http://localhost:8080/static/t3.jpg');

-- ----------------------------
-- Table structure for flowertype
-- ----------------------------
DROP TABLE IF EXISTS `flowertype`;
CREATE TABLE `flowertype`  (
  `type_id` int(11) NOT NULL COMMENT '开头3',
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `flower_id` int(11) NULL DEFAULT NULL COMMENT '鲜花',
  PRIMARY KEY (`type_id`) USING BTREE,
  INDEX `flower_id`(`flower_id`) USING BTREE,
  CONSTRAINT `flower_id` FOREIGN KEY (`flower_id`) REFERENCES `flower` (`flower_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of flowertype
-- ----------------------------
INSERT INTO `flowertype` VALUES (372997185, '生日鲜花', 297185995);
INSERT INTO `flowertype` VALUES (373014714, '开业鲜花', 297061880);
INSERT INTO `flowertype` VALUES (373026008, '表白鲜花', 297122924);
INSERT INTO `flowertype` VALUES (373033598, '长辈鲜花', 297178368);
INSERT INTO `flowertype` VALUES (373039016, '创意鲜花', 297061880);
INSERT INTO `flowertype` VALUES (373057638, '婚庆鲜花', 297178368);
INSERT INTO `flowertype` VALUES (373066315, '祝福鲜花', 297071792);
INSERT INTO `flowertype` VALUES (373110878, '爆款推荐', 297178368);
INSERT INTO `flowertype` VALUES (374074627, '爆款推荐', 297122924);
INSERT INTO `flowertype` VALUES (374074982, '爆款推荐', 297185995);
INSERT INTO `flowertype` VALUES (374075382, '爆款推荐', 297122924);
INSERT INTO `flowertype` VALUES (374075605, '爆款推荐', 297082869);
INSERT INTO `flowertype` VALUES (374075842, '爆款推荐', 297122924);
INSERT INTO `flowertype` VALUES (374076034, '爆款推荐', 297133642);
INSERT INTO `flowertype` VALUES (374087471, '生日鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374087684, '生日鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374087874, '生日鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374088063, '生日鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374088254, '生日鲜花', 297082869);
INSERT INTO `flowertype` VALUES (374088434, '生日鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374088615, '生日鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374088806, '生日鲜花', 297122924);
INSERT INTO `flowertype` VALUES (374096964, '祝福鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374097162, '祝福鲜花', 297122924);
INSERT INTO `flowertype` VALUES (374097338, '祝福鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374097521, '祝福鲜花', 297082869);
INSERT INTO `flowertype` VALUES (374097685, '祝福鲜花', 297122924);
INSERT INTO `flowertype` VALUES (374098041, '祝福鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374098225, '祝福鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374098425, '祝福鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374098639, '祝福鲜花', 297082869);
INSERT INTO `flowertype` VALUES (374098816, '祝福鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374099009, '祝福鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374099213, '祝福鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374099401, '祝福鲜花', 297185995);
INSERT INTO `flowertype` VALUES (374099605, '祝福鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374099801, '祝福鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374106406, '开业鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374106616, '开业鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374106790, '开业鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374106974, '开业鲜花', 297185995);
INSERT INTO `flowertype` VALUES (374107170, '开业鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374107342, '开业鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374107527, '开业鲜花', 297082869);
INSERT INTO `flowertype` VALUES (374107714, '开业鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374107894, '开业鲜花', 297082869);
INSERT INTO `flowertype` VALUES (374108074, '开业鲜花', 297122924);
INSERT INTO `flowertype` VALUES (374108262, '开业鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374108454, '开业鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374108631, '开业鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374117874, '婚庆鲜花', 297185995);
INSERT INTO `flowertype` VALUES (374118080, '婚庆鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374118264, '婚庆鲜花', 297133642);
INSERT INTO `flowertype` VALUES (374118451, '婚庆鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374118636, '婚庆鲜花', 297082869);
INSERT INTO `flowertype` VALUES (374118829, '婚庆鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374119009, '婚庆鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374119188, '婚庆鲜花', 297185995);
INSERT INTO `flowertype` VALUES (374119377, '婚庆鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374119561, '婚庆鲜花', 297185995);
INSERT INTO `flowertype` VALUES (374119745, '婚庆鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374119929, '婚庆鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374120113, '婚庆鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374120293, '婚庆鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374120476, '婚庆鲜花', 297082869);
INSERT INTO `flowertype` VALUES (374120666, '婚庆鲜花', 297185995);
INSERT INTO `flowertype` VALUES (374120848, '婚庆鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374121617, '婚庆鲜花', 297133642);
INSERT INTO `flowertype` VALUES (374121813, '婚庆鲜花', 297122924);
INSERT INTO `flowertype` VALUES (374138331, '爱情鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374138539, '爱情鲜花', 297122924);
INSERT INTO `flowertype` VALUES (374138731, '爱情鲜花', 297133642);
INSERT INTO `flowertype` VALUES (374138926, '爱情鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374139135, '爱情鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374139349, '爱情鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374139535, '爱情鲜花', 297185995);
INSERT INTO `flowertype` VALUES (374139735, '爱情鲜花', 297185995);
INSERT INTO `flowertype` VALUES (374139918, '爱情鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374140110, '爱情鲜花', 297185995);
INSERT INTO `flowertype` VALUES (374140306, '爱情鲜花', 297122924);
INSERT INTO `flowertype` VALUES (374140494, '爱情鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374140694, '爱情鲜花', 297185995);
INSERT INTO `flowertype` VALUES (374140894, '爱情鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374169552, '表白鲜花', 297122924);
INSERT INTO `flowertype` VALUES (374169745, '表白鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374169932, '表白鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374170119, '表白鲜花', 297122924);
INSERT INTO `flowertype` VALUES (374170504, '表白鲜花', 297082869);
INSERT INTO `flowertype` VALUES (374170704, '表白鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374170905, '表白鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374171092, '表白鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374171281, '表白鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374171468, '表白鲜花', 297133642);
INSERT INTO `flowertype` VALUES (374171666, '表白鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374171852, '表白鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374172029, '表白鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374196616, '长辈鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374196816, '长辈鲜花', 297133642);
INSERT INTO `flowertype` VALUES (374197020, '长辈鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374197221, '长辈鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374197420, '长辈鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374197608, '长辈鲜花', 297122924);
INSERT INTO `flowertype` VALUES (374197804, '长辈鲜花', 297061880);
INSERT INTO `flowertype` VALUES (374198021, '长辈鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374198233, '长辈鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374198445, '长辈鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374198644, '长辈鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374198841, '长辈鲜花', 297178368);
INSERT INTO `flowertype` VALUES (374199044, '长辈鲜花', 297071792);
INSERT INTO `flowertype` VALUES (374199232, '长辈鲜花', 297109811);
INSERT INTO `flowertype` VALUES (374199432, '长辈鲜花', 297122924);
INSERT INTO `flowertype` VALUES (374199645, '长辈鲜花', 297082869);
INSERT INTO `flowertype` VALUES (374199837, '长辈鲜花', 297133642);

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `location_id` int(11) NOT NULL COMMENT '地址id 开头4',
  `location_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `location_state` int(5) NULL DEFAULT 0 COMMENT '是否默认地址 默认为1 不默认为0',
  PRIMARY KEY (`location_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES (440028424, '北京222', 192181812, 1);
INSERT INTO `location` VALUES (441078694, '河北', 192181812, 0);
INSERT INTO `location` VALUES (452724020, '上海', 192181812, 0);
INSERT INTO `location` VALUES (453876444, '江西', 192181812, 0);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(11) NOT NULL COMMENT '订单id 开头是6',
  `order_no` int(11) NULL DEFAULT NULL COMMENT '编号',
  `flower_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `order_number` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `order_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `location_id` int(11) NULL DEFAULT NULL COMMENT '地址id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `comment_state` int(5) NULL DEFAULT 0 COMMENT '是否评价 评价是1 默认是0',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `user_id2`(`user_id`) USING BTREE,
  INDEX `location_id`(`location_id`) USING BTREE,
  CONSTRAINT `location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `user_id2` FOREIGN KEY (`user_id`) REFERENCES `location` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (642923757, 0, 297024091, 1, 70.00, 441078694, 192181812, 1);
INSERT INTO `order` VALUES (644340159, 0, 297024091, 2, 70.00, 441078694, 192181812, 1);
INSERT INTO `order` VALUES (644611764, 0, 297024091, 2, 70.00, 441078694, 192181812, 0);
INSERT INTO `order` VALUES (646718060, 0, 297122924, 1, 120.00, 441078694, 192181812, 0);
INSERT INTO `order` VALUES (647188458, 0, 297109811, 1, 20.00, 440028424, 192181812, 1);
INSERT INTO `order` VALUES (651471586, 0, 297178368, 1, 110.00, 440028424, 192181812, 1);
INSERT INTO `order` VALUES (653269464, 0, 297178368, 1, 110.00, 452724020, 192181812, 1);
INSERT INTO `order` VALUES (654579121, 0, 297061880, 1, 190.00, 440028424, 192181812, 0);
INSERT INTO `order` VALUES (654609029, 0, 297082869, 1, 90.00, 440028424, 192181812, 0);

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart`  (
  `shop_id` int(11) NOT NULL COMMENT '购物车id 开头5',
  `shop_number` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `flower_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`shop_id`) USING BTREE,
  INDEX `flowerId`(`flower_id`) USING BTREE,
  INDEX `userId`(`user_id`) USING BTREE,
  CONSTRAINT `flowerId` FOREIGN KEY (`flower_id`) REFERENCES `flower` (`flower_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userId` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shopcart
-- ----------------------------
INSERT INTO `shopcart` VALUES (554633384, 1, 297133642, 192181812);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL COMMENT '用户id开头1',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `user_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (154091525, '2', NULL, '123');
INSERT INTO `user` VALUES (160933195, 'yyy', NULL, '123');
INSERT INTO `user` VALUES (192074472, '1', NULL, '1');
INSERT INTO `user` VALUES (192079306, '12', NULL, '1');
INSERT INTO `user` VALUES (192081925, '123', NULL, '1');
INSERT INTO `user` VALUES (192084172, '1234', NULL, '1');
INSERT INTO `user` VALUES (192181812, 'admin', NULL, '123');

SET FOREIGN_KEY_CHECKS = 1;
