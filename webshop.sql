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