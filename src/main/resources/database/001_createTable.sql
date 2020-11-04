CREATE TABLE `authorize_company` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL COMMENT '公司名称',
  `business_category` tinyint(1) NOT NULL COMMENT '业务分类 1:申请专利，2:证书买卖，3:技术成果转让，4:法律咨询',
  `company_describe` varchar(1000) NOT NULL COMMENT '公司详情',
  `company_picture_url` varchar(500) DEFAULT NULL COMMENT '公司图片地址',
  `real_name` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `friendship_link` varchar(11) DEFAULT NULL COMMENT '友情链接',
  `state` tinyint(1) DEFAULT '1' COMMENT '0:驳回 1:待审核 2:已发布',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `browse_volume` int(11) DEFAULT '0' COMMENT '浏览量',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `authorize_site` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `address_url` varchar(500) NOT NULL COMMENT '链接地址',
  `site_picture_url` varchar(200) NOT NULL COMMENT '图片',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `site_type` tinyint(1) DEFAULT NULL COMMENT '站点类型',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `business_browse` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_type` tinyint(1) NOT NULL COMMENT '模块类型，1:知识产权，2:代办公司，3:需求任务',
  `module_type_id` bigint(20) NOT NULL COMMENT '模块id',
  `visitor_id` bigint(20) NOT NULL COMMENT '访客id',
  `publisher_id` bigint(20) NOT NULL COMMENT '发布id',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `business_collected` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_type` tinyint(1) NOT NULL COMMENT '模块类型，1:知识产权，2:代办公司，3:需求任务',
  `module_type_id` bigint(20) NOT NULL COMMENT '模块id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_module_info` (`user_id`,`module_type`,`module_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `intellectual_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) DEFAULT NULL COMMENT '名称',
  `product_brief` varchar(100) DEFAULT NULL,
  `product_details` varchar(5000) NOT NULL COMMENT '文字详情',
  `patent_number` varchar(200) DEFAULT NULL COMMENT '专利号',
  `product_category` tinyint(1) NOT NULL COMMENT '知识产权商城 1:发明，2:实用新型，3:外观，4:商标，5:版权',
  `industry_category` tinyint(1) NOT NULL COMMENT '行业分类',
  `product_picture_url` varchar(500) DEFAULT NULL COMMENT '图片地址',
  `product_video_url` varchar(500) DEFAULT NULL COMMENT '视频地址',
  `real_name` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `state` tinyint(1) DEFAULT '1' COMMENT '0:驳回 1:待审核 2:已发布',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `browse_volume` int(11) DEFAULT '0' COMMENT '浏览量',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `leave_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) DEFAULT NULL COMMENT '留言内容',
  `message_state` bigint(1) DEFAULT '0' COMMENT '留言状态, 0:待查看 1:已处理',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `mail_address` varchar(30) DEFAULT NULL COMMENT '邮箱地址',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `policy_advice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `advice_category` bigint(1) NOT NULL COMMENT '资讯分类 1：政策法规，2：平台动态，3：新闻实事，4：行业知识',
  `advice_title` varchar(200) NOT NULL COMMENT '资讯标题',
  `advice_subtitle` varchar(600) DEFAULT NULL COMMENT '资讯副标题',
  `advice_content` varchar(5000) NOT NULL COMMENT '资讯内容',
  `advice_picture_url` varchar(200) DEFAULT NULL COMMENT '资讯图片',
  `browse_volume` int(11) DEFAULT '0' COMMENT '浏览量',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `recharge_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recharge_amount` bigint(20) DEFAULT NULL COMMENT '充值金额',
  `consume_amount` bigint(20) DEFAULT NULL COMMENT '消费金额',
  `alipay_order_num` varchar(50) DEFAULT NULL COMMENT '支付宝订单号',
  `alipay_trade_num` varchar(50) DEFAULT NULL COMMENT '支付宝交易号',
  `wechat_order_num` varchar(50) DEFAULT NULL COMMENT '微信订单号',
  `wechat_trade_num` varchar(50) DEFAULT NULL COMMENT '微信交易号',
  `account_yue` bigint(20) DEFAULT '0' COMMENT '账户余额',
  `user_id` bigint(20) NOT NULL COMMENT '所属用户',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `roof_place` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_type` tinyint(1) NOT NULL COMMENT '模块类型，1:知识产权，2:代办公司，3:需求任务',
  `module_type_id` bigint(20) NOT NULL COMMENT '模块id',
  `authorize_state` tinyint(1) DEFAULT '1' COMMENT '认证状态 1:待审核  2:置顶',
  `top_duration` int(10) DEFAULT NULL COMMENT '置顶时长 数字1，2，3，4',
  `top_start_time` datetime DEFAULT NULL COMMENT '置顶开始时间',
  `top_end_time` datetime DEFAULT NULL COMMENT '置顶结束时间',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_module_typeAndId` (`module_type`,`module_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `task_release` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_category` tinyint(1) NOT NULL COMMENT '任务分类 1:申请，2:购买',
  `intellectual_property` tinyint(1) NOT NULL COMMENT '知识产权类型 1，发明 2，实用新型，3:外观，4:商标，5:版权',
  `industry_belongs` tinyint(1) NOT NULL COMMENT '行业所属 1，生活需要 2，电气化工 3，农林牧渔 4,电子科技',
  `purpose` varchar(500) DEFAULT NULL COMMENT '用途',
  `detailed_desc` varchar(1000) DEFAULT NULL COMMENT '详细说明',
  `real_name` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `state` tinyint(1) DEFAULT '1' COMMENT '0:驳回 1:待审核 2:已发布',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `browse_volume` int(11) DEFAULT '0' COMMENT '浏览量',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `trade_authorize` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `authorize_style` tinyint(1) DEFAULT NULL COMMENT '认证样式 0，不认证 1，企业认证 2，个人认证',
  `authorize_result` tinyint(1) DEFAULT NULL COMMENT '认证结果 0，未认证  1，已认证',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `company_name` varchar(50) DEFAULT NULL COMMENT '企业名称',
  `company_person` varchar(32) DEFAULT NULL COMMENT '企业联系人',
  `business_license` varchar(50) DEFAULT NULL COMMENT '营业执照编码',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `license_picture` varchar(200) DEFAULT NULL COMMENT '营业执照图',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_name` varchar(32) NOT NULL COMMENT '用户名',
  `pass_word` varchar(250) NOT NULL COMMENT '密码',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `head_portrait` varchar(200) DEFAULT NULL COMMENT '头像',
  `identity` tinyint(1) NOT NULL COMMENT '用户身份 1:管理员 2:普通用户',
  `authorize_type` tinyint(1) DEFAULT NULL COMMENT '认证类型 1，企业认证 2，个人认证',
  `virtual_coin` bigint(20) DEFAULT '0' COMMENT '虚拟币数量',
  `account_yue` bigint(20) DEFAULT '0' COMMENT '账户余额',
  `free_message_num` int(10) DEFAULT '0' COMMENT '可发布免费信息数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

CREATE TABLE `user_session` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(48) NOT NULL,
  `user_id` bigint(10) unsigned DEFAULT NULL,
  `user_name` varchar(48) DEFAULT NULL,
  `access_ip` varchar(120) DEFAULT NULL,
  `access_time` datetime DEFAULT NULL,
  `is_login` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `login_date` datetime DEFAULT NULL,
  `last_url` varchar(240) DEFAULT NULL,
  `login_ip` varchar(32) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
