create database mini_project;
use mini_project;
create table T_TAB1( 
ID INT primary key,
GOODS_TYPE varchar(50),
QANTITY INT,
AMOUNT INT,
SELLER_NAME varchar(50)
);
INSERT INTO `T_TAB1` VALUES
(1, 'MOBILE PHONE', 2, 400000, 'MIKE'),
(2, 'KEYBOARD', 1, 10000, 'MIKE'),
(3, 'MOBILE PHONE', 1, 50000, 'JANE'),
(4, 'MONITOR', 1,110000, 'JOE'),
(5, 'MONITOR', 2, 80000, 'JANE'),
(6, 'MOBILE PHONE', 1, 130000, 'JOE'),
(7, 'MOBILE PHONE', 1, 60000, 'ANNA'),
(8, 'PRINTER', 1, 90000, 'ANNA'),
(9, 'KEYBOARD', 2, 10000, 'ANNA'),
(10, 'PRINTER', 1, 80000, 'MIKE');
create table T_TAB2( 
ID INT unique key,
First_name varchar(50),
Salary INT,
Age INT
);
Insert into `T_TAB2` values(1,'ANNA',110000,27),
(2,'JANE',80000,25),
(3,'MIKE',120000,25),
(4,'JOE',70000,24),
(5,'RITA',120000,29);
select distinct GOODS_TYPE from t_tab1; #писок уникальных категорий товаров (GOODS_TYPE).
select 
sum(QANTITY) as total_qantity,
sum(QANTITY * AMOUNT) as total_sales
from T_TAB1
where GOODS_TYPE = 'Mobile phone';#Напишите запрос, который вернет суммарное количество и суммарную стоимость проданных мобильных телефонов
select salary 
from t_tab2
where salary >100000;#Напишите запрос, который вернёт список сотрудников с заработной платой > 100000.
select min(salary) as salary_min,
max(salary) as salary_max,
min(age) as age_min,
max(age) as age_max
from t_tab2;#Напишите запрос, который вернёт минимальный и максимальный возраст сотрудников, а также минимальную и максимальную заработную плату.
select GOODS_TYPE, avg(qantity ) as avg_sales
from t_tab1
where GOODS_TYPE IN ('PRINTER', 'KEYBOARD')
group by GOODS_TYPE;
select t2.first_name, sum(t1.amount) as total_amount
from t_tab1 t1
join t_tab2 t2 on t1.seller_name = t2.first_name
group by t2.first_name;
select t2.first_name, t1.goods_type, t1.qantity, t1.amount, t2.salary, t2.age
from t_tab1 t1
join t_tab2 t2 on t1.seller_name = t2.first_name
where first_name = 'Mike';
select t2.age, t2.first_name 
from t_tab2 t2 
left join t_tab1 t1 on t1.seller_name = t2.first_name
where t1.seller_name is null;
select age, first_name, salary
from t_tab2
where age <26;
SELECT * FROM T_TAB1 t
right JOIN T_TAB2 t2 ON t2.first_name = t.seller_name
WHERE t2.first_name = 'RITA';
