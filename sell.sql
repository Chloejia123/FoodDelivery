create table `product_info`(
	`product_id` int(32) not null;
	`product_info` varchar(32) not null.
	`product_name` varchar(64) not null,
	`product_price` decimal(8,2) not null,
	`product_stock` int not null,
	`product_description` varchar(64),
	`product_icon` varchar(512),
	`category_type` int not null,
	`create_time` timestamp not null default current_timestamp,
	`update_time` timestamp not null default current_timestamp on update current_timestamp

	primary key(`product_id`)
) comment '商品表'


create table `proudct_category`(
	`category_id` int not null auto_increment,
	`category_name` varchar(64) not null,
	`category_type` int not null,
	`create_time` timestamp not null default current_timestamp,
	`update_time` timestamp not null default current_timestamp on update current_timestamp

	primary key(`category_id`),
	unique key `uqe_category_type` (`category_type`)
) comment '类目表';

create table `order_master`(
	`order_id` varchar(32) not null,
	`buyer_name` varchar(32) not null,
	`buyer_phone` varchar(32) not null,
	`buyer_address` varchar(128) not null,
	`buyer_openid` varchar(64) not null comment '买家微信',
	`order_amount` decimal(8,2) not null,
	`order_status` tinyint(3) not null default'0' comment '订单状态, 默认0新下单',
	`pay_status` tinyint(3) not null default'0' comment '支付状态0为未支付',
	`create_time` timestamp not null default current_timestamp,
	`update_time` timestamp not null default current_timestamp on update current_timestamp

) comment '订单表';

create table `order_detail` (
    `detail_id` varchar(32) not null,
    `order_id` varchar(32) not null,
    `product_id` varchar(32) not null,
    `product_name` varchar(64) not null comment '商品名称',
    `product_price` decimal(8,2) not null comment '当前价格,单位分',
    `product_quantity` int not null comment '数量',
    `product_icon` varchar(512) comment '小图',
    `create_time` timestamp not null default current_timestamp comment '创建时间',
    `update_time` timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key (`detail_id`),
    key `idx_order_id` (`order_id`),
    foreign key(`order_id`) REFERENCES order_master(`order_id`)
) comment '订单详情';

create table `seller_info` (
    `id` varchar(32) not null,
    `username` varchar(32) not null,
    `password` varchar(32) not null,
    `openid` varchar(64) not null comment '微信openid',
    `create_time` timestamp not null default current_timestamp comment '创建时间',
    `update_time` timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key (`id`)
) comment '卖家信息表';
