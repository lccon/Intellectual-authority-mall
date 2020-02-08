-- 前端普通用户
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_name` varchar(32) NOT NULL COMMENT '用户名',
  `pass_word` varchar(250) NOT NULL COMMENT '密码',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
   head_portrait VARCHAR(200) DEFAULT NULL COMMENT '头像',
   identity tinyint(1) NOT NULL COMMENT '用户身份 1:管理员 2:普通用户',
   authorize_type tinyint(1) DEFAULT NULL COMMENT '认证类型 1，企业认证 2，个人认证',
   virtual_coin bigint(20) DEFAULT 0 COMMENT '虚拟币数量',
   account_yue bigint(20) DEFAULT 0 COMMENT '账户余额',
   free_message_num int(10) DEFAULT 0 COMMENT '可发布免费信息数量',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 用户权限
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
  `mobile` VARCHAR (11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 个人/企业认证
CREATE TABLE user_authorize(
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  authorize_style tinyint(1) DEFAULT NULL COMMENT '认证样式 1，企业认证 2，个人认证',
  authorize_result tinyint(1) DEFAULT NULL COMMENT '认证结果 0，未认证  1，已认证',
  name varchar(32) DEFAULT NULL COMMENT '姓名',
  company_name varchar(50) DEFAULT NULL COMMENT '企业名称',
  company_person VARCHAR (32) DEFAULT NULL COMMENT '企业联系人',
  business_license VARCHAR (50) DEFAULT NULL COMMENT '营业执照编码',
   mobile varchar(32) DEFAULT NULL COMMENT '联系方式',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 代办的网站(轮播图)
CREATE TABLE authorize_site (
   id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   address_url varchar(500) NOT NULL COMMENT '链接地址',
   site_picture_url VARCHAR (200) NOT NULL COMMENT '图片',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 知识产权商城
CREATE TABLE intellectual_task (
   id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   product_name VARCHAR (200) DEFAULT NULL COMMENT '商品名称',
   product_brief VARCHAR (1000) NOT NULL COMMENT '商品简介',
   product_details VARCHAR(5000) NOT NULL COMMENT '商品详情',
   patent_number VARCHAR (200) DEFAULT NULL COMMENT '专利号',
   product_category tinyint(1) NOT NULL COMMENT '知识产权商城 1:发明，2:实用新型，3:外观，4:商标，5:版权',
   industry_category tinyint(1) NOT NULL COMMENT '行业分类',
   product_picture_url varchar(500) DEFAULT NULL COMMENT '图片地址',
   product_video_url VARCHAR(500) DEFAULT NULL COMMENT '视频地址',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 任务发布
CREATE TABLE task_release(
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  task_category tinyint(1) NOT NULL COMMENT '任务分类 1:申请，2:购买',
  intellectual_property tinyint(1) NOT NULL COMMENT '知识产权类型 1，发明 2，实用新型，3:外观，4:商标，5:版权',
  industry_belongs tinyint(1) NOT NULL COMMENT '行业所属 1，生活需要 2，电气化工 3，农林牧渔 4,电子科技',
  purpose VARCHAR (500) DEFAULT NULL COMMENT '用途',
  detailed_desc VARCHAR (1000) DEFAULT NULL COMMENT '详细说明',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 代办公司
CREATE TABLE authorize_company (
   id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   company_name varchar(50) NOT NULL COMMENT '公司名称',
   business_category tinyint(1) NOT NULL COMMENT '业务分类 1:申请专利，2:证书买卖，3:技术成果转让，4:法律咨询',
   company_describe VARCHAR (1000) NOT NULL COMMENT '公司详情',
   company_picture_url VARCHAR (500) DEFAULT NULL COMMENT '公司图片地址',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 模块置顶表
CREATE TABLE roof_place(
   id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   module_type tinyint(1) NOT NULL COMMENT '模块类型，1:知识产权，2:代办公司，3:需求任务',
   module_type_id bigint(20) NOT NULL COMMENT '模块id',
   authorize_state tinyint(1) DEFAULT 0 COMMENT '认证状态 0:待审核 1:驳回 2:置顶',
   top_duration int(10) DEFAULT NULL COMMENT '置顶时长 数字1，2，3，4',
   top_start_time datetime DEFAULT NULL COMMENT '置顶开始时间',
   top_end_time datetime DEFAULT NULL COMMENT '置顶结束时间',
   `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
   `create_date` datetime NOT NULL COMMENT '新增时间',
   `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
   `update_date` datetime DEFAULT NULL COMMENT '修改时间',
   PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 政策资讯
CREATE TABLE policy_advice(
   id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   advice_category bigint(1) NOT NULL COMMENT '资讯分类 1：政策法规，2：平台动态，3：新闻实事，4：行业知识',
   advice_title VARCHAR (200) NOT NULL COMMENT '资讯标题',
   advice_subtitle VARCHAR (600) DEFAULT NULL COMMENT '资讯副标题',
   advice_content VARCHAR (5000) NOT NULL COMMENT '资讯内容',
   advice_picture_url VARCHAR (200) DEFAULT NULL COMMENT '资讯图片',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 充值记录
CREATE TABLE recharge_record (
   id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   recharge_amount bigint(20) DEFAULT NULL COMMENT '充值金额',
   consume_amount bigint(20) DEFAULT NULL COMMENT '消费金额',
   user_id bigint(20) NOT NULL COMMENT '所属用户',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 留言
CREATE TABLE leave_message(
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   message varchar(1000) DEFAULT NULL COMMENT '留言内容',
   message_state bigint(1) DEFAULT 0 COMMENT '留言状态, 0:待查看 1:已处理',
  `create_user` varchar(32) NOT NULL COMMENT '新增人名称',
  `create_date` datetime NOT NULL COMMENT '新增时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
