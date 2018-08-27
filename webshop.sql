#创建 items 表
CREATE TABLE `items` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` VARCHAR(32) NOT NULL COMMENT '商品名称',
`price` FLOAT(10,1) NOT NULL COMMENT '商品价格',
`detail` text COMMENT '商品描述',
`pic` varchar(64) DEFAULT NULL COMMENT '商品图片',
`createtime` datetime NOT NULL COMMENT '生产日期',
PRIMARY KEY (`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

#user表创建语句
CREATE TABLE `user` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`username` varchar(32) NOT NULL COMMENT '用户姓名',
`brithday` date DEFAULT null COMMENT '用户生日',
`sex` char(1) DEFAULT NULL COMMENT '性别',
`address` varchar(256)DEFAULT NULL COMMENT '用户地址',
PRIMARY KEY (`id`)
)ENGINE=INNODB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

#订单表orders创建语句
CREATE TABLE `orders` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NOT NULL COMMENT '下单用户id',
`number` varchar(32) NOT null COMMENT '订单号',
`createtime` datetime not null COMMENT '创建订单时间',
`note` VARCHAR(100) DEFAULT NULL COMMENT '备注',
PRIMARY KEY (`id`),
constraint `FK_orders_id` foreign key (`user_id`) REFERENCES `user` (`id`) on DELETE no action on UPDATE no action
)ENGINE=INNODB auto_INCREMENT=6 default CHARSET=utf8;

#订单详情表orderdetail创建语句
CREATE TABLE `orderdetail` (
`id` int(11) not null AUTO_INCREMENT,
`orders_id` int(11) not null comment '订单id',
`items_id` int(11) not null comment '商品id',
`items_num` int (11) DEFAULT null comment '商品购买量',
PRIMARY key (`id`),
CONSTRAINT `FK_orderdetail_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) on DELETE no action on UPDATE no action,
CONSTRAINT `FK_orderdetail_2` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`) on DELETE no action on UPDATE no action
)ENGINE=INNODB default CHARSET=utf8;


#初始数据
INSERT INTO `items` VALUES (1, '台式机', 3000.0, '该电脑质量非常好！！！！', NULL, '2015-2-3 13:22:53');
INSERT INTO `items` VALUES (2, '笔记本', 6000.0, '笔记本性能好，质量好！！！！！', NULL, '2015-2-9 13:22:57');
INSERT INTO `items` VALUES (3, '背包', 200.0, '名牌背包，容量大质量好！！！！', NULL, '2015-2-6 13:23:02');

INSERT INTO `user` VALUES (1, '王五', '2016-1-5', '2', '天津');
INSERT INTO `user` VALUES (10, '张三', '2014-7-10', '1', '北京市');
INSERT INTO `user` VALUES (16, '张小明', '2016-2-9', '1', '浙江杭州');
INSERT INTO `user` VALUES (22, '陈小明', '2016-9-25', '1', '福建厦门');
INSERT INTO `user` VALUES (24, '张三丰', '2016-9-17', '1', '湖北武汉');
INSERT INTO `user` VALUES (25, '陈小明', '2016-2-17', '1', '上海');
INSERT INTO `user` VALUES (26, '王五', '2010-7-6', '2', '深圳');

INSERT INTO `orders` VALUES (3, 1, '1000010', '2016-8-16 13:22:35', NULL);
INSERT INTO `orders` VALUES (4, 1, '1000011', '2016-6-23 13:22:41', NULL);
INSERT INTO `orders` VALUES (5, 10, '1000012', '2016-9-22 16:13:23', NULL);

INSERT INTO `orderdetail` VALUES (1, 3, 1, 1);
INSERT INTO `orderdetail` VALUES (2, 3, 2, 3);
INSERT INTO `orderdetail` VALUES (3, 4, 3, 4);
INSERT INTO `orderdetail` VALUES (4, 4, 2, 3);