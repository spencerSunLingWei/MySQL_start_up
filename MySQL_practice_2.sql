#initilizing databases
create database q_two;
use q_two;

# 创建部门表
create table dept(
	id int primary key auto_increment,
	name varchar(20)
);

insert into dept (name) values ('开发部'),('市场部'),('财务部');

# 创建员工表
create table employee (
	id int primary key auto_increment,
	name varchar(10),
	gender char(1),   -- 性别
	salary double,   -- 工资
	join_date date,  -- 入职日期
	dept_id int,
	foreign key (dept_id) references dept(id) -- 外键，关联部门表(部门表的主键)
);

insert into employee(name,gender,salary,join_date,dept_id) values('孙悟空','男',7200,'2013-02-24',1);
insert into employee(name,gender,salary,join_date,dept_id) values('猪八戒','男',3600,'2010-12-02',2);
insert into employee(name,gender,salary,join_date,dept_id) values('唐僧','男',9000,'2008-08-08',2);
insert into employee(name,gender,salary,join_date,dept_id) values('白骨精','女',5000,'2015-10-07',3);
insert into employee(name,gender,salary,join_date,dept_id) values('蜘蛛精','女',4500,'2011-03-14',1);

-- 按要求实现下面的查询功能 

	#1) 查询工资最高的员工是谁？
	select name from employee where salary = (select max(salary) from employee);

	#2) 查询工资小于平均工资的员工有哪些？
	select name from employee where salary < (select avg(salary) from employee);

	#3) 查询大于5000的员工，来至于哪些部门，输出部门的名字
	select e.name, d.name from employee e join dept d on e.dept_id = d.id where e.salary > 5000;

	#4) 查询开发部与财务部所有的员工信息，分别使用子查询和表连接实现
	select e.* from employee e join dept d on e.dept_id = d.id where d.name in ('开发部','财务部');
	select * from employee where dept_id in (select id from dept where name in ('开发部','财务部'));

	#5) 查询2011年以后入职的员工信息和部门信息，分别使用子查询和表连接实现
	select e.* , d.name as "dept_name" from employee e join dept d on e.dept_id = d.id where e.join_date > "2011-01-01";