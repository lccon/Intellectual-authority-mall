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
