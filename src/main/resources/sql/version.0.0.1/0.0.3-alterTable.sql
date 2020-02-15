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