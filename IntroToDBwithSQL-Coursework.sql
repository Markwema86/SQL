show databases;
create schema orders_StreamA;
create schema test1;
drop schema test1;
show tables;
use orders_StreamA;
create table customers
(
idno int primary key not null,
custname varchar(50) not null,
gender varchar(6) not null,
email varchar(30) not null unique,
mobile int unique
);
desc customers;

create table category
(
catname varchar(50) primary key not null,
descri text
);
desc category;

#connect to database
use orders_StreamA;
show tables;
desc customers;
#adding a column
alter table customers add address varchar(40) not null after gender;
desc customers;
alter table customers add city varchar(100) not null;
#dropping a column
alter table customers drop city;
#renaming a column
alter table customers change idno custidno int;
#change column data type
alter table customers modify custname varchar(100);
#dropping a primary key
alter table customers drop primary key;
#adding a primary key
alter table customers add primary key(custidno);

# create product table
create table products
(
pcode varchar(20) primary key not null,
quantity int not null,
price decimal not null,
pname varchar(100) not null unique,
expirydate date not null,
catname varchar(50),
foreign key(catname) references category(catname)
);

desc products;

#create orders table
create table orders
(
orderID int primary key auto_increment,
orderdate date not null,
quantity int not null,
custidno int not null,
pcode varchar(20) not null,
foreign key(custidno) references customers(custidno)
);
desc orders;

#add pcode as foreign key
alter table orders add foreign key(pcode) references products(pcode);

#setting a default for gender
alter table customers alter gender set default 'N/A';
desc customers;

#renaming tables
show tables;
alter table category rename to tblcategory;


# INSERTING INTO customers table
desc customers;
insert into customers(custidno,custname,gender,address,email,mobile)
values(1,'Phil','Male','karen','phil@gmail.com','0712345678');
insert into customers(custidno,custname,gender,address,email,mobile)
values(2,'Clara','Female','mombasa','clara@gmail.com','0798765432');
insert into customers(custidno,custname,gender,address,email,mobile)
values(3,'Jnae','Female','nakuru','jane@gmail.com','0746297462');
insert into customers(custidno,custname,gender,address,email,mobile)
values(4,'Joe','Male','kisumu','joe@gmail.com','0794620462');
insert into customers(custidno,custname,gender,address,email,mobile)
values(5,'James','Male','kiambu','james@gmail.com','0756793746');
select * from customers;

#delete records
delete from customers where custidno=1;

#UPDATE
update customers set address='rongai' where custidno=3;

#connect to the Database
use orders_StreamA;
desc customers;
select * from customers;
select custidno,custname from customers;
select custidno,mobile from customers;
select gender from customers;
#DISTINCT
select distinct gender from customers;

#adding Field dob in customers table
desc customers;
alter table customers add dob date;
#UPDATE
update customers set dob='1999-01-01' where custidno=1;
update customers set dob='2000-02-02' where custidno=2;
update customers set dob='2001-03-03' where custidno=3;
update customers set dob='2002-04-04' where custidno=4;
update customers set dob='2003-05-05' where custidno=5;

select * from customers;
select custidno, year(curdate())-year(dob) from customers; #determinig age
 
 # Returning first two rows
 select * from customers limit 2;
 # order customers by name
 select * from customers order by custname desc;
 #group customers by gender
 select gender, count(*) as "Totals" from customers
 group by gender;
 select gender, count(*) as "Totals" from customers
 group by gender having count(*)<2;

# Comparison condition
select * from customers
where gender = "Male" and email like '%gmail.com%';
select * from customers
where gender = "Male" or email like '%gmail.com%';
# Range
select * from customers
where dob between '2000-01-01' and curdate();
select * from customers
where dob not between '2000-01-01' and curdate();

select * from customers
where gender in ("Female");
select * from customers
where gender not in ("Female");

#Pattern match
select * from customers
where custname like 'c%a';
select * from customers
where custname like '__i%';

select * from customers
where email not like '%gmail.com%';

select * from customers
where dob is null;
select * from customers
where dob is not null;


# SQL aggregate function
select max(year(curdate())-year(dob)) as "Maximum Age",
min(year(curdate())-year(dob)) as "Minimum Age",
avg(year(curdate())-year(dob)) as "Average Age",
sum(year(curdate())-year(dob)) as "Total Age"
from customers;

#connect to the Database
use orders_StreamA;

describe tblcategory;
insert into tblcategory values('Food','Food'),('Kitchen ware','Kitchen ware'),('Électronics','Électronics'),
('Detergents','Detergents'),('Furniture','Furniture');

select * from tblcategory;

desc products;

insert into products(pcode,quantity,price,pname,expirydate,catname)
values(1,5,65000,'TV','2050-01-02','Electronics'),
(2,4,250,'Burger','2025-03-31','Food'),
(3,10,299,'Sunlight','2026-12-25','Detergents'),
(4,20,130000,'Sofa Set','2060-01-30','Furniture'),
(5,2,150000,'Frideg','2030-04-05','Kitchen ware');
select * from products;
describe orders;
insert into orders(orderdate,quantity,custidno,pcode) values('2025-04-01',5,2,1),('2014-12-25',3,2,2),
('2019-01-01',2,3,3),('2020-07-01',1,4,5),('2015-08-31',10,5,1);

# SQL Joins
select * from orders;
select c.custidno,c.custname,p.pcode,p.pname,p.price,
o.orderid,o.orderdate,o.quantity,p.price*o.quantity as "Totatl"
from customers c,orders o,products p
where c.custidno=o.custidno and p.pcode=o.pcode;

select * from orders;
select c.custidno,c.custname,p.pcode,p.pname,p.price,
o.orderid,o.orderdate,o.quantity,p.price*o.quantity as "Totatl"
from customers c,orders o,products p
where c.custidno=o.custidno and p.pcode=o.pcode and o.custidno=3;

select * from orders;
select c.custidno,c.custname,p.pcode,p.pname,p.price,
o.orderid,o.orderdate,o.quantity,p.price*o.quantity as "Totatl"
from customers c,orders o,products p
where c.custidno=o.custidno and p.pcode=o.pcode and o.orderdate between '2000-01-01' and curdate();

# SQL Views
#create view known as custreciept
create view CustReciept as
select c.custidno,c.custname,p.pcode,p.pname,p.price,
o.orderid,o.orderdate,o.quantity,p.price*o.quantity as "Totatl"
from customers c,orders o,products p
where c.custidno=o.custidno and p.pcode=o.pcode;

#create view known as cus3treciept
create view Cust3Reciept as
select c.custidno,c.custname,p.pcode,p.pname,p.price,
o.orderid,o.orderdate,o.quantity,p.price*o.quantity as "Totatl"
from customers c,orders o,products p
where c.custidno=o.custidno and p.pcode=o.pcode and o.custidno=3;

#create view known as custRecieptBtwnDates
create view CustRecieptBtwnDates as
select c.custidno,c.custname,p.pcode,p.pname,p.price,
o.orderid,o.orderdate,o.quantity,p.price*o.quantity as "Totatl"
from customers c,orders o,products p
where c.custidno=o.custidno and p.pcode=o.pcode and o.orderdate between '2000-01-01' and curdate();

