#initialzing databases
create database lianxi01 character set utf8;

use lianxi01;

CREATE TABLE product(
	pid INT,#主键ID
	pname VARCHAR(20),#商品名称
	price DOUBLE,#商品价格
	category_name VARCHAR(32)#商品分类名称
);

INSERT INTO product(pid,pname,price,category_name) VALUES(1,'联想电脑',5000,'电脑办公');
INSERT INTO product(pid,pname,price,category_name) VALUES(2,'海尔电脑',3000,'电脑办公');
INSERT INTO product(pid,pname,price,category_name) VALUES(3,'雷神电脑',5000,'电脑办公');

INSERT INTO product(pid,pname,price,category_name) VALUES(4,'JACK JONES',800,'服装');
INSERT INTO product(pid,pname,price,category_name) VALUES(5,'真维斯',200,'服装');
INSERT INTO product(pid,pname,price,category_name) VALUES(6,'花花公子',440,'服装');
INSERT INTO product(pid,pname,price,category_name) VALUES(7,'劲霸',2000,'服装');

INSERT INTO product(pid,pname,price,category_name) VALUES(8,'香奈儿',800,'女士用品');
INSERT INTO product(pid,pname,price,category_name) VALUES(9,'相宜本草',200,'女士用品');
INSERT INTO product(pid,pname,price,category_name) VALUES(10,'面霸',5,'女士用品');

INSERT INTO product(pid,pname,price,category_name) VALUES(11,'雪碧',56,'饮料饮品');
INSERT INTO product(pid,pname,price,category_name) VALUES(12,'香飘飘奶茶',1,'饮料饮品');

INSERT INTO product(pid,pname,price,category_name) VALUES(13,'iPhone9',8000,NULL);

-- 查询练习
	#1.查询所有的商品
	SELECT * FROM product;
    
	#2.查询商品名和商品价格
	select pname,price from product;
    
	#3.别名查询.使用的关键字是as（as可以省略的）.	
	select pname as "product name", price as "product price" from product;
    
	#4.查询商品价格，对价格去除重复；
	select distinct price from product;
    
	#5.查询结果是表达式（运算查询）：将所有商品的价格+10元进行显示.
	select price + 10 from product;
    
	#6.查询商品名称为“花花公子”的商品所有信息：
	select * from product where pname = "花花公子";
    
	#7.查询价格为800商品
	select pname from product where price = 800;
    
	#8.查询价格不是800的所有商品
	select pname from product where not price = 800;
    
	#9.查询商品价格大于60元的所有商品信息
	select * from product where price > 60;
    
	#10.查询商品价格在200到1000之间所有商品
	select pname from product where price between 200 and 1000;
    
	#11.查询商品价格是200或800的所有商品
	select pname from product where price in (200,800);
    
	#12.查询含有'霸'字的所有商品
	select pname from product where pname like "%霸%";
    
	#13.查询以'香'开头的所有商品
	select pname from product where pname like "香%";
    
	#14.查询第二个字为'想'的所有商品
	select pname from product where pname like "_想%";
    
	#15.商品没有分类的商品
	select pname from product where category_name is null;
    
	#16.查询有分类的商品
	select pname from product where category_name is not null;

-- 排序练习：
    #1.使用价格对商品信息排序(降序)
    -- 提示：使用order by语句 
    select * from product order by price DESC;

    #2.在价格排序(降序)的基础上，以主键排序(降序)
    -- 提示：若价格相同，相同价格的数据以pid降序排序
    alter table product add primary key(pid);
	select * from product order by price DESC, pid DESC;

    #3.显示商品的价格(去重复)，并排序(降序)
    -- 提示：DISTINCT 关键字去重 
    select distinct price from product order by price desc;

-- 聚合函数/分组函数练习：
    #1 查询商品的总条数(两种方式)
    -- 提示：使用count()
    select count(*) as "total amount of product" from product;
	select count(1) as "total amount of product" from product;

    #2 查看price商品的总价格
    -- 提示：使用sum();
	select sum(price) as "total sum of price" from product;

    #3 查看price的最大值和最小值
    -- 提示：使用max()  min()
    select max(price) as "maximun price", min(price) as "minimun price" from product;

    #4 查看price的平均值
    -- 提示：使用 AVG() 
    select avg(price) as "average price" from product;

    #5 查询价格大于200商品的总条数
    -- 提示：使用 COUNT(*)统计条数
    select count(*) from product where price > 200;
    
-- 分组练习：
    #1 统计各个分类商品的个数
    select category_name, count(*) from product group by category_name;

    #2 统计各个分类商品的个数,且只显示个数大于1的信息
    select category_name, count(*) from product group by category_name having count(*) > 1;
