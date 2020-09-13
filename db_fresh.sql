/*
Navicat MySQL Data Transfer

Source Server         : szhDB
Source Server Version : 50730
Source Host           : localhost:3306
Source Database       : db_fresh

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2020-09-13 20:29:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` int(10) NOT NULL COMMENT '用户id',
  `realName` varchar(100) NOT NULL COMMENT '真实姓名',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `status` int(1) NOT NULL COMMENT '状态（是不是默认地址）',
  `createDate` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地址表';

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userName` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '登录密码',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `createDate` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录表';

-- ----------------------------
-- Records of login
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `newsImg` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `content` varchar(500) NOT NULL COMMENT '文章内容',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯表';

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `productId` int(10) NOT NULL COMMENT '商品id',
  `userId` int(10) NOT NULL COMMENT '用户id',
  `remarkId` int(10) NOT NULL COMMENT '评价id',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `num` int(10) NOT NULL COMMENT '数量',
  `money` float(10,2) NOT NULL COMMENT '总价',
  `status` int(1) DEFAULT NULL COMMENT '状态（0 未付款 1 未发货 2 未收货 3 未评价）',
  `pay` varchar(50) DEFAULT NULL COMMENT '支付方式',
  `send` varchar(50) DEFAULT NULL COMMENT '配送方式',
  `payTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `sendTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `getTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收货时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `category` varchar(100) NOT NULL COMMENT '种类',
  `remarkId` int(10) NOT NULL COMMENT '评论ID',
  `price` int(20) NOT NULL COMMENT '单价',
  `stock` int(20) NOT NULL COMMENT '库存',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `text` varchar(255) NOT NULL COMMENT '商品简介',
  `description` varchar(255) NOT NULL COMMENT '商品描述',
  `remarkNum` int(20) NOT NULL COMMENT '评论数',
  `saleNum` int(20) NOT NULL COMMENT '销量',
  `status` int(1) NOT NULL COMMENT '状态（0是推荐，1是下架，2是正常商品）',
  `addDate` datetime NOT NULL COMMENT '上架时间',
  `createDate` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for remarks
-- ----------------------------
DROP TABLE IF EXISTS `remarks`;
CREATE TABLE `remarks` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `productId` int(10) NOT NULL COMMENT '商品id',
  `userId` int(10) NOT NULL COMMENT '用户id',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `type` int(10) DEFAULT '0' COMMENT '评论类型(0 好评 1 中评 2 差评)',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastModfiyTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of remarks
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `productId` int(10) NOT NULL COMMENT '商品id',
  `userId` int(10) NOT NULL COMMENT '用户id',
  `num` int(10) NOT NULL COMMENT '数量',
  `status` int(1) DEFAULT '0' COMMENT '状态（0在收藏夹，1在购物车）',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车/收藏夹';

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userName` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '登录密码',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `sex` varchar(1) NOT NULL COMMENT '性别',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `realName` varchar(100) NOT NULL COMMENT '真实姓名',
  `img` varchar(255) NOT NULL COMMENT '头像',
  `createDate` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
