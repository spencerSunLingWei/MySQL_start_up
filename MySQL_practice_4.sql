#initialzing database
create database q_four CHARACTER set utf8;
use q_four;

#讲师表
create table teacher(
		id int primary key, 		-- 讲师ID 主键 int类型
		name varchar(20),			-- 讲师姓名 VARCHAR类型
		description varchar(100), 	-- 讲师简介 VARCHAR类型
		level char(4) 				-- 讲师级别 char类型 高级讲师&首席讲师
);

create unique index ind_name on teacher(name); -- 为讲师姓名添加索引
		
#课程分类表
create table course(
		id int primary key, 		-- 课程分类ID 主键 int类型
		type varchar(50), 			-- 课程分类名称 VARCHAR类型 比如前端开发 后端开发 数据库DBA......
		description varchar(200),	-- 课程分类描述 VARCHAR类型 
		create_date datetime, 		-- 创建时间 datetime类型
		update_date datetime 		-- 更新时间 datetime类型
);
		
#课程表
create table schedule(
		id int primary key, 		-- 课程ID 主键 int类型
		teacher_id int, 			-- 课程讲师ID 外键 用于描述课程的授课老师
		course_id int, 				-- 课程分类ID 外键 用于描述课程所属的分类 比如 Java课程就属于后端分类
		title varchar(10), 			-- 课程标题 VARCHAR类型 比如Java VUE PHP ......
		time_length int, 			-- 总课时 int类型 
		browser_amount BIGINT, 		-- 浏览数量 bigint类型
		status char(1), 			-- 课程状态 char 类型,  0 未发布(默认)  1 已发布
		FOREIGN KEY (teacher_id) REFERENCES teacher(id),
		FOREIGN KEY (course_id) REFERENCES course(id)
);

create index index ind_title on schedule(title); -- 为课程标题字段添加索引

-- 向讲师表插入两条数据
INSERT INTO teacher 
VALUES (1, '刘德华', '毕业于清华大学，主攻前端技术,授课风格生动活泼,深受学员喜爱', 
'高级讲师');
INSERT INTO teacher 
VALUES (2, '郭富城', '毕业于北京大学，多年的IT经验，研发多项Java课题,授课经验丰富', 
'首席讲师');

-- 向课程分类表中插入两条数据
INSERT INTO course VALUES (1, '后端开发', '后端课程包括 Java PHP Python', '2020-03-27 00:44:04', '2020-03-27 00:44:04');
INSERT INTO course VALUES (2, '前端开发', '前端课程包括 JQuery VUE angularJS', '2020-02-27 10:00:04', '2020-02-27 18:44:04');

-- 向课程表中插入两条数据
-- 插入Java课程
INSERT INTO schedule VALUES (1,1,1 ,'Java', 300,250000, '1');
-- 插入VUE课程
INSERT INTO schedule VALUES (2,2,2, 'VUE', 400,200000,'1');

#查询刘德华老师所教的课程属于哪个课程分类
select type from course where id = (select course_id from schedule where teacher_id = (select id from teacher where name = "刘德华"));


