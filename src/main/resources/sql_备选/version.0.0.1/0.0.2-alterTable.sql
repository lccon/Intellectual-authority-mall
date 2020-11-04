-- 知识产权新增用户姓名和手机号
ALTER TABLE intellectual_task ADD COLUMN real_name VARCHAR(32) DEFAULT null COMMENT '真实姓名' after product_video_url;
ALTER TABLE intellectual_task ADD COLUMN mobile VARCHAR(11) DEFAULT null COMMENT '手机号' after real_name;

-- 任务发布新增用户姓名和手机号
ALTER TABLE task_release ADD COLUMN real_name VARCHAR(32) DEFAULT null COMMENT '真实姓名' after detailed_desc;
ALTER TABLE task_release ADD COLUMN mobile VARCHAR(11) DEFAULT null COMMENT '手机号' after real_name;

-- 代办公司新增用户姓名和手机号
ALTER TABLE authorize_company ADD COLUMN real_name VARCHAR(32) DEFAULT null COMMENT '真实姓名' after company_picture_url;
ALTER TABLE authorize_company ADD COLUMN mobile VARCHAR(11) DEFAULT null COMMENT '手机号' after real_name;
ALTER TABLE authorize_company ADD COLUMN friendship_link VARCHAR(11) DEFAULT null COMMENT '友情链接' after mobile;

-- 添加状态
ALTER TABLE intellectual_task ADD COLUMN state tinyint(1) DEFAULT 1 COMMENT '0:驳回 1:待审核 2:已发布' after mobile;
ALTER TABLE task_release ADD COLUMN state tinyint(1) DEFAULT 1 COMMENT '0:驳回 1:待审核 2:已发布' after mobile;
ALTER TABLE authorize_company ADD COLUMN state tinyint(1) DEFAULT 1 COMMENT '0:驳回 1:待审核 2:已发布' after friendship_link;

-- 留言添加字段
ALTER TABLE leave_message ADD COLUMN real_name VARCHAR(20) DEFAULT NULL comment '真实姓名' after message_state;
ALTER TABLE leave_message ADD COLUMN mobile VARCHAR (11) DEFAULT NULL comment '联系方式' after real_name;
ALTER TABLE leave_message ADD COLUMN mail_address VARCHAR (30) DEFAULT NULL comment '邮箱地址' after mobile;

-- 添加用户id
ALTER TABLE intellectual_task ADD COLUMN user_id bigint(20) DEFAULT null COMMENT '用户id' after state;
ALTER TABLE task_release ADD COLUMN user_id bigint(20) DEFAULT null COMMENT '用户id' after state;
ALTER TABLE authorize_company ADD COLUMN user_id bigint(20) DEFAULT null COMMENT '用户id' after state;

-- 浏览量
ALTER TABLE intellectual_task ADD COLUMN browse_volume int(11) DEFAULT 0 COMMENT '浏览量' after user_id;
ALTER TABLE task_release ADD COLUMN browse_volume int(11) DEFAULT 0 COMMENT '浏览量' after user_id;
ALTER TABLE authorize_company ADD COLUMN browse_volume int(11) DEFAULT 0 COMMENT '浏览量' after user_id;
ALTER TABLE policy_advice ADD COLUMN browse_volume int(11) DEFAULT 0 COMMENT '浏览量' after advice_picture_url;
ALTER TABLE policy_advice ADD COLUMN user_id int(11) DEFAULT 0 COMMENT '用户id' after browse_volume;

-- 轮播图结束时间
ALTER TABLE authorize_site ADD COLUMN end_time datetime DEFAULT NULL COMMENT '结束时间' after site_picture_url;
ALTER TABLE authorize_site ADD COLUMN site_type tinyint(1) DEFAULT NULL COMMENT '站点类型' after end_time;

-- 认证添加用户id和公司性质
ALTER TABLE trade_authorize ADD COLUMN user_id bigint(20) DEFAULT NULL COMMENT '用户id' after license_picture;
ALTER TABLE trade_authorize ADD COLUMN company_nature bigint(20) DEFAULT NULL COMMENT '公司性质' after license_picture;

-- 知识产权商品简介置空
ALTER TABLE intellectual_task modify product_brief varchar(100) DEFAULT NULL;
