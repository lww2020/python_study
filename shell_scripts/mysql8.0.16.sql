mysql 8.0.16 操作记录
-- 创建数据库
[root@db143 local]# mysql -h 127.0.0.1 -P 3306 -uroot -p'AnvcTMagdLarwNV3CKaC' 
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 8.0.16 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database company;
Query OK, 1 row affected (0.00 sec)

mysql> show create database company;
+----------+-----------------------------------------------------------------------------------------------------------------------------------+
| Database | Create Database                                                                                                                   |
+----------+-----------------------------------------------------------------------------------------------------------------------------------+
| company  | CREATE DATABASE `company` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */ |
+----------+-----------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

-- 含有特殊字符的，需要用反引号转义
mysql> create database `my.contacts`;
Query OK, 1 row affected (0.01 sec)

mysql> show create database `my.contacts`;
+-------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Database    | Create Database                                                                                                                       |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------+
| my.contacts | CREATE DATABASE `my.contacts` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */ |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> 

[root@db143 local]# mysql -h 127.0.0.1 -P 3306 -uroot -p'AnvcTMagdLarwNV3CKaC' company
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
Server version: 8.0.16 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> select database();
+------------+
| database() |
+------------+
| company    |
+------------+
1 row in set (0.00 sec)

mysql> 
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| company            |
| information_schema |
| my.contacts        |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> show variables like 'datadir';
+---------------+------------------------------+
| Variable_name | Value                        |
+---------------+------------------------------+
| datadir       | /data/mysql/mysql_3306/data/ |
+---------------+------------------------------+
1 row in set (0.00 sec)

mysql> # 
-- 检查对应的物理文件
[root@db143 ~]# ll /data/mysql/mysql_3306/data/
total 7375972
-rw-r-----. 1 mysql mysql         56 Apr 18 00:52 auto.cnf
-rw-------. 1 mysql mysql       1676 Apr 18 00:52 ca-key.pem
-rw-r--r--. 1 mysql mysql       1112 Apr 18 00:52 ca.pem
-rw-r--r--. 1 mysql mysql       1112 Apr 18 00:52 client-cert.pem
-rw-------. 1 mysql mysql       1680 Apr 18 00:52 client-key.pem
drwxr-x---. 2 mysql mysql       4096 Apr 18 01:01 company
-rw-r-----. 1 mysql mysql       5452 Apr 18 00:52 ib_buffer_pool
-rw-r-----. 1 mysql mysql 1073741824 Apr 18 01:03 ibdata1
-rw-r-----. 1 mysql mysql 2147483648 Apr 18 01:03 ib_logfile0
-rw-r-----. 1 mysql mysql 2147483648 Apr 18 00:52 ib_logfile1
-rw-r-----. 1 mysql mysql 2147483648 Apr 18 00:52 ib_logfile2
-rw-r-----. 1 mysql mysql   12582912 Apr 18 00:53 ibtmp1
-rw-r-----. 1 mysql mysql       6960 Apr 18 01:05 innodb_status.3236
drwxr-x---. 2 mysql mysql       4096 Apr 18 00:53 #innodb_temp
drwxr-x---. 2 mysql mysql       4096 Apr 18 01:02 my@002econtacts
drwxr-x---. 2 mysql mysql       4096 Apr 18 00:52 mysql
-rw-r-----. 1 mysql mysql          5 Apr 18 00:53 mysql_3306.pid
-rw-r-----. 1 mysql mysql   24117248 Apr 18 01:03 mysql.ibd
drwxr-x---. 2 mysql mysql       4096 Apr 18 00:52 performance_schema
-rw-------. 1 mysql mysql       1676 Apr 18 00:52 private_key.pem
-rw-r--r--. 1 mysql mysql        452 Apr 18 00:52 public_key.pem
-rw-r--r--. 1 mysql mysql       1112 Apr 18 00:52 server-cert.pem
-rw-------. 1 mysql mysql       1680 Apr 18 00:52 server-key.pem
drwxr-x---. 2 mysql mysql       4096 Apr 18 00:52 sys
[root@db143 ~]# 

-- 2.4.1、创建表
CREATE TABLE IF NOT EXISTS `company`.`customers`(
id int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name varchar(20) NOT NULL COMMENT 'first_name',
last_name varchar(20) NOT NULL COMMENT 'last_name',
country varchar(20) NOT NULL COMMENT '国家'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
mysql> show create table customers\G;
*************************** 1. row ***************************
       Table: customers
Create Table: CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL COMMENT 'first_name',
  `last_name` varchar(20) NOT NULL COMMENT 'last_name',
  `country` varchar(20) NOT NULL COMMENT '国家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
1 row in set (0.00 sec)

ERROR: 
No query specified
-- 列出所有的存储引擎
mysql> show engines;
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| Engine             | Support | Comment                                                        | Transactions | XA   | Savepoints |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| FEDERATED          | NO      | Federated MySQL storage engine                                 | NULL         | NULL | NULL       |
| MEMORY             | YES     | Hash based, stored in memory, useful for temporary tables      | NO           | NO   | NO         |
| InnoDB             | DEFAULT | Supports transactions, row-level locking, and foreign keys     | YES          | YES  | YES        |
| PERFORMANCE_SCHEMA | YES     | Performance Schema                                             | NO           | NO   | NO         |
| MyISAM             | YES     | MyISAM storage engine                                          | NO           | NO   | NO         |
| MRG_MYISAM         | YES     | Collection of identical MyISAM tables                          | NO           | NO   | NO         |
| BLACKHOLE          | YES     | /dev/null storage engine (anything you write to it disappears) | NO           | NO   | NO         |
| CSV                | YES     | CSV storage engine                                             | NO           | NO   | NO         |
| ARCHIVE            | YES     | Archive storage engine                                         | NO           | NO   | NO         |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
9 rows in set (0.00 sec)

mysql> CREATE TABLE payment(
id int(10) unsigned NOT NULL AUTO_INCREMENT,
customer_name varchar(20) NOT NULL COMMENT '客户名称',
payment_num decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
mysql> show create table payment\G;
*************************** 1. row ***************************
       Table: payment
Create Table: CREATE TABLE `payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(20) NOT NULL COMMENT '客户名称',
  `payment_num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
1 row in set (0.00 sec)

ERROR: 
No query specified
mysql> show tables;
+-------------------+
| Tables_in_company |
+-------------------+
| customers         |
| payment           |
+-------------------+
2 rows in set (0.01 sec)

mysql> 
[root@db143 ~]# ll /data/mysql/mysql_3306/data/company/
total 164
-rw-r-----. 1 mysql mysql 114688 Apr 18 01:21 customers.ibd
-rw-r-----. 1 mysql mysql 114688 Apr 18 01:32 payment.ibd
[root@db143 ~]# 
-- 克隆表
mysql> CREATE TABLE new_customers LIKE customers;
Query OK, 0 rows affected (0.10 sec)

mysql> show create table new_customers\G
*************************** 1. row ***************************
       Table: new_customers
Create Table: CREATE TABLE `new_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL COMMENT 'first_name',
  `last_name` varchar(20) NOT NULL COMMENT 'last_name',
  `country` varchar(20) NOT NULL COMMENT '国家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
1 row in set (0.01 sec)

/*
2.5、插入、更新和删除行
INSERT、UPDATE、DELETE和SELECT操作成为数据操作语言(DML)语句。
2.5.1、插入操作
*/
INSERT IGNORE INTO customers (first_name,last_name,country)
VALUES 
('Mike','Christensen','USA'),
('Andy','Hollands','Astralia'),
('Ravi','Vendantam','India'),
('Rajiv','Perera','Sri Lanka');
-- 或者
INSERT IGNORE INTO customers (id,first_name,last_name,country)
VALUES 
(1,'Mike','Christensen','USA'),
(2,'Andy','Hollands','Astralia'),
(3,'Ravi','Vendantam','India'),
(4,'Rajiv','Perera','Sri Lanka');

/*
IGNORE：如果该行已经存在，并给出了IGNORE子句，则新数据将被忽略，
INSERT语句仍然会执行成功，同时生成一个告警信息和重复数据的数目。
反之，如果未给出IGNORE子句，则INSERT语句会生成一条错误信息。
*/
mysql> show warnings;
+---------+------+---------------------------------------+
| Level   | Code | Message                               |
+---------+------+---------------------------------------+
| Warning | 1062 | Duplicate entry '1' for key 'PRIMARY' |
| Warning | 1062 | Duplicate entry '2' for key 'PRIMARY' |
| Warning | 1062 | Duplicate entry '3' for key 'PRIMARY' |
| Warning | 1062 | Duplicate entry '4' for key 'PRIMARY' |
+---------+------+---------------------------------------+
4 rows in set (0.00 sec)

mysql> 
-- 更新，UPDATE语句用来修改表中的现有记录。
mysql> select * from customers;
+----+------------+-------------+-----------+
| id | first_name | last_name   | country   |
+----+------------+-------------+-----------+
|  1 | Mike       | Christensen | USA       |
|  2 | Andy       | Hollands    | Astralia  |
|  3 | Ravi       | Vendantam   | India     |
|  4 | Rajiv      | Perera      | Sri Lanka |
+----+------------+-------------+-----------+
4 rows in set (0.00 sec)

mysql> UPDATE customers SET first_name='Rajiver',country='UK' WHERE id=4;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customers;
+----+------------+-------------+----------+
| id | first_name | last_name   | country  |
+----+------------+-------------+----------+
|  1 | Mike       | Christensen | USA      |
|  2 | Andy       | Hollands    | Astralia |
|  3 | Ravi       | Vendantam   | India    |
|  4 | Rajiver    | Perera      | UK       |
+----+------------+-------------+----------+
4 rows in set (0.00 sec)

mysql> 
-- 删除，DELETE用来删除数据
mysql> DELETE FROM customers WHERE id=4 AND first_name='Rajiver';
Query OK, 1 row affected (0.36 sec)

mysql> select * from customers;
+----+------------+-------------+----------+
| id | first_name | last_name   | country  |
+----+------------+-------------+----------+
|  1 | Mike       | Christensen | USA      |
|  2 | Andy       | Hollands    | Astralia |
|  3 | Ravi       | Vendantam   | India    |
+----+------------+-------------+----------+
3 rows in set (0.00 sec)

mysql> 

/*
REPLACE、INSERT 、ON DUPLICATE KEY UPDATE
	在很多情况下，我们需要处理重复的数据。行的唯一性由主键标识。如果行已经存在，
则REPLACE会简单的删除行并插入新行；如果行不存在，则REPLACE等同于INSERT。
*/
REPLACE INTO customers VALUES (1,'Mike','Christensen','Amercia');
mysql> SELECT * FROM customers;
+----+------------+-------------+-----------+
| id | first_name | last_name   | country   |
+----+------------+-------------+-----------+
|  1 | Mike       | Christensen | USA       |
|  2 | Andy       | Hollands    | Astralia  |
|  3 | Ravi       | Vendantam   | India     |
|  4 | Rajiv      | Perera      | Sri Lanka |
+----+------------+-------------+-----------+
4 rows in set (0.00 sec)

mysql> REPLACE INTO customers VALUES (1,'Mike','Christensen','Amercia');
Query OK, 2 rows affected (0.00 sec)

-- 可以看到有两行受到影响，一个重复行被删除，一个新行被插入

mysql>  SELECT * FROM customers;
+----+------------+-------------+-----------+
| id | first_name | last_name   | country   |
+----+------------+-------------+-----------+
|  1 | Mike       | Christensen | Amercia   |
|  2 | Andy       | Hollands    | Astralia  |
|  3 | Ravi       | Vendantam   | India     |
|  4 | Rajiv      | Perera      | Sri Lanka |
+----+------------+-------------+-----------+
4 rows in set (0.00 sec)

mysql> 
mysql> INSERT INTO payment(customer_name,payment_num) VALUES('Mike Christensen',200) ON DUPLICATE KEY UPDATE payment_num=payment_num+VALUES(payment_num);
Query OK, 1 row affected (0.01 sec)
mysql> INSERT INTO payment(customer_name,payment_num) VALUES('Rajiv Perera',500) ON DUPLICATE KEY UPDATE payment_num=payment_num+VALUES(payment_num);
Query OK, 1 row affected (0.01 sec)
mysql> select * from payment;
+----+------------------+-------------+
| id | customer_name    | payment_num |
+----+------------------+-------------+
|  1 | Mike Christensen |      200.00 |
|  2 | Rajiv Perera     |      500.00 |
+----+------------------+-------------+
2 rows in set (0.00 sec)
-- 当Mike Christensen下次支付300美元时，将更新该行并将此付款金额添加到以前的金额中
mysql>  INSERT INTO payment(id,customer_name,payment_num) VALUES(1,'Mike Christensen',500) ON DUPLICATE KEY UPDATE payment_num=payment_num+VALUES(payment_num);
Query OK, 2 rows affected (0.00 sec)

mysql> select * from payment;
+----+------------------+-------------+
| id | customer_name    | payment_num |
+----+------------------+-------------+
|  1 | Mike Christensen |      700.00 |
|  2 | Rajiv Perera     |      500.00 |
+----+------------------+-------------+
2 rows in set (0.00 sec)

-- 2.6、截断表
mysql> 
-- TRUNCATE TABLE 
mysql> truncate table customers;
Query OK, 0 rows affected (0.09 sec)
/*
下载示例数据
https://codeload.github.com/datacharmer/test_db/zip/master

cd /opt/
wget 'https://codeload.github.com/datacharmer/test_db/zip/master' -O master.zip 
unzip master.zip 
cd /opt/test_db-master
[root@db143 test_db-master]# mysql.3306.login < /opt/test_db-master/employees.sql 
mysql: [Warning] Using a password on the command line interface can be insecure.
INFO
CREATING DATABASE STRUCTURE
INFO
storage engine: InnoDB
INFO
LOADING departments
INFO
LOADING employees
INFO
LOADING dept_emp
INFO
LOADING dept_manager
INFO
LOADING titles
INFO
LOADING salaries
data_load_time_diff
00:01:05
[root@db143 test_db-master]# 
*/
[root@db143 test_db-master]# mysql.3306.login employees -A
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 24
Server version: 8.0.16 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show tables;
+----------------------+
| Tables_in_employees  |
+----------------------+
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| salaries             |
| titles               |
+----------------------+
8 rows in set (0.10 sec)

mysql> 
mysql> show create table employees\G;
*************************** 1. row ***************************
       Table: employees
Create Table: CREATE TABLE `employees` (
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
1 row in set (0.35 sec)

ERROR: 
No query specified

mysql> 

2.7.1、如何操作
mysql> select * from departments;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d009    | Customer Service   |
| d005    | Development        |
| d002    | Finance            |
| d003    | Human Resources    |
| d001    | Marketing          |
| d004    | Production         |
| d006    | Quality Management |
| d008    | Research           |
| d007    | Sales              |
+---------+--------------------+
9 rows in set (0.10 sec)

mysql> 

-- 选择列
mysql> select dept_no,emp_no from dept_manager;
+---------+--------+
| dept_no | emp_no |
+---------+--------+
| d001    | 110022 |
| d001    | 110039 |
| d002    | 110085 |
| d002    | 110114 |
| d003    | 110183 |
| d003    | 110228 |
| d004    | 110303 |
| d004    | 110344 |
| d004    | 110386 |
| d004    | 110420 |
| d005    | 110511 |
| d005    | 110567 |
| d006    | 110725 |
| d006    | 110765 |
| d006    | 110800 |
| d006    | 110854 |
| d007    | 111035 |
| d007    | 111133 |
| d008    | 111400 |
| d008    | 111534 |
| d009    | 111692 |
| d009    | 111784 |
| d009    | 111877 |
| d009    | 111939 |
+---------+--------+
24 rows in set (0.05 sec)

mysql> 
-- 计数
mysql> select count(*) from employees;
+----------+
| count(*) |
+----------+
|   300024 |
+----------+
1 row in set (1.53 sec)

mysql> select emp_no from employees where first_name='Georgi' and last_name='Facello' ;
+--------+
| emp_no |
+--------+
|  10001 |
|  55649 |
+--------+
2 rows in set (0.10 sec)

-- 找出姓氏为Christ、Lamba或者Baba的所有员工的人数
mysql> select count(*) from employees where first_name in ('Christ','Lamba','Baba') ;
+----------+
| count(*) |
+----------+
|      238 |
+----------+
1 row in set (0.09 sec)

-- 找出1986年12月入职的员工人数
mysql> select count(*) from employees where hire_date between '1986-12-01' and '1986-12-31';
+----------+
| count(*) |
+----------+
|     3081 |
+----------+
1 row in set (0.08 sec)

mysql> select count(*) from employees where hire_date not between '1986-12-01' and '1986-12-31';
+----------+
| count(*) |
+----------+
|   296943 |
+----------+
1 row in set (0.08 sec)

-- 找出名字以Christ开头的所有员工的人数
mysql> select count(*) from employees where first_name like 'Christ%';
+----------+
| count(*) |
+----------+
|     1157 |
+----------+
1 row in set (0.07 sec)

mysql> 
-- 找出名字以Christ开头并以ed结尾的所有员工的人数
mysql> select count(*) from employees where first_name like 'Christ%ed';
+----------+
| count(*) |
+----------+
|      228 |
+----------+
1 row in set (0.07 sec)

mysql> 
-- 找出名字中包含sri所有员工的人数
mysql> select count(*) from employees where first_name like '%sri%';
+----------+
| count(*) |
+----------+
|      253 |
+----------+
1 row in set (0.11 sec)
-- 找到名字以er结尾的所有员工的人数
mysql> select count(*) from employees where first_name like '%ed';
+----------+
| count(*) |
+----------+
|     1181 |
+----------+
1 row in set (0.09 sec)

-- 找出名字以任意两个字符开头、后面跟随ka、再后面跟随任意数量字符的所有员工的人数
mysql> select count(*) from employees where first_name like '__ka%';
+----------+
| count(*) |
+----------+
|     1918 |
+----------+
1 row in set (0.08 sec)

正则表达式
表达式         描述
*           零次或多次重复
+           一个或多个重复
？          可选字符
.           任何字符
\.          区间
^           以......开始
$           以......结尾
[abc]       只有a、b或者c
[^abc]      非a、非b,亦非c
[a-z]       字符a到z
[0-9]       数字0-9
^...$       开始和结束
\d          任何数字
\D          任何非数字字符
\s          任何空格
\S          任何非空格
\w          任何字母数字字符
\W          任何非字母数字字符
{m}         m次重复
{m,n}       m到n次重复

-- 找出名字以Christ开头的所有员工的人数
mysql> select count(*) from employees where last_name regexp '^Christ';
+----------+
| count(*) |
+----------+
|      373 |
+----------+
1 row in set (0.22 sec)

mysql> select count(*) from employees where last_name rlike '^Christ';
+----------+
| count(*) |
+----------+
|      373 |
+----------+
1 row in set (0.23 sec)

-- 找出姓氏以ba结尾的所有员工人数
mysql> select count(*) from employees where last_name regexp 'ba$';
+----------+
| count(*) |
+----------+
|     1008 |
+----------+
1 row in set (0.20 sec)

mysql> 
-- 查找姓氏不包含元音字母(a,e,i,o,u)的所有员工的人数
mysql> select count(*) from employees where last_name not regexp '[aeiou]';
+----------+
| count(*) |
+----------+
|      148 |
+----------+
1 row in set (0.23 sec)

mysql> 
-- 查询hire_date在1986年之前的任何10名员工的姓名
mysql> select first_name,last_name from employees where hire_date < '1986-01-01' limit 10;
+------------+------------+
| first_name | last_name  |
+------------+------------+
| Bezalel    | Simmel     |
| Sumant     | Peac       |
| Eberhardt  | Terkki     |
| Otmar      | Herbst     |
| Florian    | Syrotiuk   |
| Tse        | Herber     |
| Udi        | Jansch     |
| Reuven     | Garigliano |
| Erez       | Ritzmann   |
| Premal     | Baek       |
+------------+------------+
10 rows in set (0.05 sec)

mysql> 
-- 使用表别名
mysql> select count(*) AS count from employees where hire_date between '1986-12-01' and '1986-12-31';
+-------+
| count |
+-------+
|  3081 |
+-------+
1 row in set (0.08 sec)

mysql> 
2.8、对结果进行排序
-- 查找薪水最高的前5名员工的员工编号
mysql> select emp_no,salary from salaries order by salary desc limit 5;
+--------+--------+
| emp_no | salary |
+--------+--------+
|  43624 | 158220 |
|  43624 | 157821 |
| 254466 | 156286 |
|  47978 | 155709 |
| 253939 | 155513 |
+--------+--------+
5 rows in set (0.96 sec)
2.9、对结果分组
-- count 1 分别找出男性和女性员工的人数
mysql> select count(*),gender from employees group by gender;
+----------+--------+
| count(*) | gender |
+----------+--------+
|   179973 | M      |
|   120051 | F      |
+----------+--------+
2 rows in set (0.17 sec)
-- 2 如果希望查找员工名字中最常见的10个名字，可以使用group by(first_name),对名字进行
-- 分组，然后使用count(first_name)在各组内计数，最后使用order by 计数对结果进行排序
mysql> select count(first_name) AS COUNT, first_name from employees group by first_name  order by count desc limit 10;
+-------+-------------+
| COUNT | first_name  |
+-------+-------------+
|   295 | Shahab      |
|   291 | Tetsushi    |
|   279 | Elgin       |
|   278 | Anyuan      |
|   276 | Huican      |
|   275 | Make        |
|   272 | Sreekrishna |
|   272 | Panayotis   |
|   271 | Hatem       |
|   270 | Shen        |
+-------+-------------+
10 rows in set (0.29 sec)
-- sum 查找每年给与员工的薪水总额，并按照薪水的高低对结果进行排序。year()函数将返回给定日期所在的年份
mysql> select '2017-06-12', year('2017-06-12');
+------------+--------------------+
| 2017-06-12 | year('2017-06-12') |
+------------+--------------------+
| 2017-06-12 |               2017 |
+------------+--------------------+
1 row in set (0.00 sec)

mysql> select '2017-06-12', month('2017-06-12');
+------------+---------------------+
| 2017-06-12 | month('2017-06-12') |
+------------+---------------------+
| 2017-06-12 |                   6 |
+------------+---------------------+
1 row in set (0.00 sec)

mysql> select '2017-06-12', day('2017-06-12');
+------------+-------------------+
| 2017-06-12 | day('2017-06-12') |
+------------+-------------------+
| 2017-06-12 |                12 |
+------------+-------------------+
1 row in set (0.00 sec)

mysql> select year(from_date) AS year_s,sum(salary) AS SUM from salaries group by year_s order by sum desc ;
+--------+-------------+
| year_s | SUM         |
+--------+-------------+
|   2000 | 17535667603 |
|   2001 | 17507737308 |
|   1999 | 17360258862 |
|   1998 | 16220495471 |
|   1997 | 15056011781 |
|   1996 | 13888587737 |
|   1995 | 12638817464 |
|   1994 | 11429450113 |
|   2002 | 10243347616 |
|   1993 | 10215059054 |
|   1992 |  9027872610 |
|   1991 |  7798804412 |
|   1990 |  6626146391 |
|   1989 |  5454260439 |
|   1988 |  4295598688 |
|   1987 |  3156881054 |
|   1986 |  2052895941 |
|   1985 |   972864875 |
+--------+-------------+
18 rows in set (1.81 sec)

mysql> 
-- 查找平均工资最高的前10名员工
select emp_no,avg(salary) AS avg FROM salaries group by emp_no order by avg desc limit 10;
mysql> select emp_no,avg(salary) AS avg FROM salaries group by emp_no order by avg desc limit 10;
+--------+-------------+
| emp_no | avg         |
+--------+-------------+
| 109334 | 141835.3333 |
| 205000 | 141064.6364 |
|  43624 | 138492.9444 |
| 493158 | 138312.8750 |
|  37558 | 138215.8571 |
| 276633 | 136711.7333 |
| 238117 | 136026.2000 |
|  46439 | 135747.7333 |
| 254466 | 135541.0625 |
| 253939 | 135042.2500 |
+--------+-------------+
10 rows in set (0.95 sec)

-- distinct 使用distinct字句过滤出来表中的不同条目
mysql> select distinct title from titles;
+--------------------+
| title              |
+--------------------+
| Senior Engineer    |
| Staff              |
| Engineer           |
| Senior Staff       |
| Assistant Engineer |
| Technique Leader   |
| Manager            |
+--------------------+
7 rows in set (1.79 sec)

-- 使用having过滤，找到平均工资超过140,000美元的员工
mysql> select emp_no,avg(salary) AS avg  from salaries group by emp_no having avg > 140000 order by avg desc;
+--------+-------------+
| emp_no | avg         |
+--------+-------------+
| 109334 | 141835.3333 |
| 205000 | 141064.6364 |
+--------+-------------+
2 rows in set (1.00 sec)

2.10、创建用户
2.10.1、如何操作
mysql> create user if not exists 'company_read_only'@'localhost' identified with mysql_native_password by 'company_pass' with max_queries_per_hour 500 max_updates_per_hour 100;
Query OK, 0 rows affected (0.11 sec)

mysql> 
-- 如果密码的安全性不够强，则可能会出现错误
ERROR 1819 (HY000): Your password does not satisfy the current policy requirements

/*
上述声明将为用户创建一下内容。
用户名：company
仅从localhost访问。
可以限制对IP范围的访问，例如：10.148.%，通过给出%，用户可以从任何主机访问。 
密码：company_pass
使用my_native_password(默认)身份验证。
还可以指定可选的身份验证，例如sha256_password、LDAP或kerberos。
用户可以在一小时内执行的最大查询数为500。
用户可以在一小时内执行的最大更新次数为100。
当客户端连接到MySQL服务器时，它会经历两个访问控制阶段：
1、连接验证
2、请求验证
  在连接验证过程中，服务器通过用户名和连接的主机名来识别连接。服务器会调用用户认证插件并验证密码。
服务器还会检查用户是否被锁定。
  在请求验证阶段，服务器会检查用户是否有足够的权限执行每项操作。
  在前面的语句中，必须以明文形式输入密码，这些密码可以记录在命令历史记录文件$HOME/.mysql_history中。
为了避免这种情况(以明文形式输入密码),你可以在本地服务器上计算hash值并直接指定hash字符串。语法与之前
几乎相同，除了需要把mysql_native_password by 'company_pass' 更改为 mysql_native_password as 'hash_string';
*/
mysql> select password('company_pass'); -- 本操作是在5.6环境下，8.0.16环境，已经不支持这个
+-------------------------------------------+
| password('company_pass')                  |
+-------------------------------------------+
| *EBD9E3BFD1489CA1EB0D2B4F29F6665F321E8C18 |
+-------------------------------------------+
1 row in set (0.00 sec)

-- 切换到8.0.16环境中
mysql>  create user if not exists 'company_read_only'@'localhost' identified with mysql_native_password as '*EBD9E3BFD1489CA1EB0D2B4F29F6665F321E8C18' with max_queries_per_hour 500 max_updates_per_hour 100;
Query OK, 0 rows affected (0.11 sec)

mysql> 
-- 你可以通过授权方式直接创建用户，不过在下一版本，将弃用这种功能。
2.11 授予和撤销用户访问权限
-- 授予权限 
-- 将read only权限(SELECT) 权限授予company_read_only用户;
mysql> grant select on company.* to 'company_read_only'@'localhost' ;
Query OK, 0 rows affected, 1 warning (0.04 sec)

-- 将INSERT权限授予新的company_insert_only用户;
mysql> create user 'company_insert_only'@'localhost' identified with mysql_native_password by 'xxxx' ;
Query OK, 0 rows affected (0.07 sec)

mysql> grant insert on company.* to 'company_insert_only'@'localhost'  ;
Query OK, 0 rows affected, 1 warning (0.04 sec)

-- 将WRITE权限授予新的company_write用户
mysql> create user 'company_write'@'localhost' identified with mysql_native_password by 'xxxx' ;
Query OK, 0 rows affected (0.01 sec)

mysql> grant insert on company.* to 'company_write'@'localhost'  ;
Query OK, 0 rows affected, 1 warning (0.01 sec)

-- 限制查询指定的表。将employees_read_only用户仅能查询employees表
mysql> create user 'employees_read_only'@'%' identified with mysql_native_password by 'xxxx' ;
Query OK, 0 rows affected (0.01 sec)

mysql> grant select on employees.employees to 'employees_read_only'@'%' ;
Query OK, 0 rows affected (0.01 sec)

-- 可以进一步将访问权限为进查询指定列。限制employees_ro用户仅能访问employees表的first_name列
mysql> create user 'employees_ro'@'%' identified with mysql_native_password by 'xxxx' ;
Query OK, 0 rows affected (0.01 sec)

mysql> grant select(first_name,last_name) on employees.employees  to 'employees_ro'@'%'
Query OK, 0 rows affected (0.28 sec)

-- 扩展授权
mysql> grant select(salary) on employees.salaries to 'employees_ro'@'%';
Query OK, 0 rows affected (0.01 sec)

-- 创建用户super。ALL表示除了GRANT权限之外的所有权限。
mysql> create user 'dbadmin'@'%' identified with mysql_native_password by 'DB@admin';
Query OK, 0 rows affected (0.00 sec)

mysql> grant all privileges on *.* to 'dbadmin'@'%';
Query OK, 0 rows affected (0.01 sec)

-- 授予grant权限
/*
将 grant option 权限授予用户，才能拥有 grant option权限给别人授权
*/
mysql> grant grant option on *.* to 'dbadmin'@'%';
Query OK, 0 rows affected (0.01 sec)

-- 检查授权
mysql> show grants for 'employees_ro'@'%'\G;
*************************** 1. row ***************************
Grants for employees_ro@%: GRANT USAGE ON *.* TO `employees_ro`@`%`
*************************** 2. row ***************************
Grants for employees_ro@%: GRANT SELECT (`salary`) ON `employees`.`salaries` TO `employees_ro`@`%`
2 rows in set (0.00 sec)

ERROR: 
No query specified

mysql> 
-- 检查 dbadmin用户的权限
mysql> show grants for 'dbadmin'@'%'\G;
*************************** 1. row ***************************
Grants for dbadmin@%: GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `dbadmin`@`%` WITH GRANT OPTION
*************************** 2. row ***************************
Grants for dbadmin@%: GRANT APPLICATION_PASSWORD_ADMIN,BACKUP_ADMIN,BINLOG_ADMIN,BINLOG_ENCRYPTION_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,GROUP_REPLICATION_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SERVICE_CONNECTION_ADMIN,SESSION_VARIABLES_ADMIN,SET_USER_ID,SYSTEM_USER,SYSTEM_VARIABLES_ADMIN,TABLE_ENCRYPTION_ADMIN,XA_RECOVER_ADMIN ON *.* TO `dbadmin`@`%` WITH GRANT OPTION
2 rows in set (0.00 sec)

ERROR: 
No query specified

mysql> 

-- 撤销权限
-- 撤销 'company_write'@'localhost';用户的权限
mysql> revoke INSERT ON `company`.* from  `company_write`@`localhost` ;
Query OK, 0 rows affected, 1 warning (0.00 sec)

-- 撤销employee_ro用户对薪水列的访问权限
mysql> show grants for 'employees_ro'@'%';
+-------------------------------------------------------------------------+
| Grants for employees_ro@%                                               |
+-------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `employees_ro`@`%`                                |
| GRANT SELECT (`salary`) ON `employees`.`salaries` TO `employees_ro`@`%` |
+-------------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> revoke SELECT (`salary`) ON `employees`.`salaries` from `employees_ro`@`%`;
Query OK, 0 rows affected (0.00 sec)

mysql> show grants for 'employees_ro'@'%';
+------------------------------------------+
| Grants for employees_ro@%                |
+------------------------------------------+
| GRANT USAGE ON *.* TO `employees_ro`@`%` |
+------------------------------------------+
1 row in set (0.00 sec)

修改 mysql.user 表
/*
	所有用户信息及权限都存储在mysql.user表中。如果你有权访问mysql.user表，则可以直接修改这个表表来创建用户并授权。
如果你使用grant、revoke、set password或rename user等账号管理语句简介修改授权表，则服务器会通知更改，并立即再次将授权
表加载到内存中。
	如果使用insert、update或delete等语句直接修改授权表，则更改不会影响权限检查，除非你重新启动服务器或指示其重新加载表。
如果直接更改授权表、但忘记了重新加载表，那么在重新启动服务器之前，这些更改无效。
	可以通过flush privilege语句来完成grant表的重新加载。
*/
mysql> select * from mysql.user where user='dbadmin'\G;
*************************** 1. row ***************************
                    Host: %
                    User: dbadmin
             Select_priv: Y
             Insert_priv: Y
             Update_priv: Y
             Delete_priv: Y
             Create_priv: Y
               Drop_priv: Y
             Reload_priv: Y
           Shutdown_priv: Y
            Process_priv: Y
               File_priv: Y
              Grant_priv: Y
         References_priv: Y
              Index_priv: Y
              Alter_priv: Y
            Show_db_priv: Y
              Super_priv: Y
   Create_tmp_table_priv: Y
        Lock_tables_priv: Y
            Execute_priv: Y
         Repl_slave_priv: Y
        Repl_client_priv: Y
        Create_view_priv: Y
          Show_view_priv: Y
     Create_routine_priv: Y
      Alter_routine_priv: Y
        Create_user_priv: Y
              Event_priv: Y
            Trigger_priv: Y
  Create_tablespace_priv: Y
                ssl_type: 
              ssl_cipher: 
             x509_issuer: 
            x509_subject: 
           max_questions: 0
             max_updates: 0
         max_connections: 0
    max_user_connections: 0
                  plugin: mysql_native_password
   authentication_string: *7D9EE74EE474B9002D40B606087FA0526FD34A7E
        password_expired: N
   password_last_changed: 2019-04-23 22:08:32
       password_lifetime: NULL
          account_locked: N
        Create_role_priv: Y
          Drop_role_priv: Y
  Password_reuse_history: NULL
     Password_reuse_time: NULL
Password_require_current: NULL
         User_attributes: NULL
1 row in set (0.01 sec)

ERROR: 
No query specified

mysql> 
mysql> update mysql.user set host='localhost' where user='dbadmin';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> flush privileges;
Query OK, 0 rows affected (0.01 sec)

