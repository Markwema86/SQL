SELECT * FROM mysqlcourse.employee;

select * from mysqlcourse.employee where City = 'Bangalore';
select Education,JoiningYear from mysqlcourse.employee where ExperienceInCurrentDomain = 5 ;

select Education,JoiningYear from mysqlcourse.employee where ExperienceInCurrentDomain =5 and City = 'Pune';
select Education,JoiningYear,Gender from mysqlcourse.employee where ExperienceInCurrentDomain =4 or Gender="Male";
select Education,JoiningYear,Gender from mysqlcourse.employee where not Gender='Male';

select * from mysqlcourse.employee where City like'%lore';

select * from mysqlcourse.employee order by Age asc;

select * from mysqlcourse.employee order by City desc,Age asc;

select * from mysqlcourse.employee order by Education asc limit 5;

select * from mysqlcourse.employee where Age between 19 and 23;

select * from mysqlcourse.employee where Education in ('Bachelors','PHD');
select * from mysqlcourse.employee where Education not in ('Bachelors','PHD') and City in ("Pune");

select concat(Education,' - ',Age) as EduAge from mysqlcourse.employee;
select concat_ws(" - ",Education,Gender,Age) as EduAge from mysqlcourse.employee;
select length(Age) as Agecount from mysqlcourse.employee;
select upper(Education) as edu from mysqlcourse.employee;
select lower(Education) as edu from mysqlcourse.employee;
select left(Education,4) as edu from mysqlcourse.employee;
select right(Education,4) as edu from mysqlcourse.employee;
select mid(Education,4,5) as edu from mysqlcourse.employee;

SELECT * FROM mysqlcourse.employee;
select sum(Age) as total_age from mysqlcourse.employee;
select count(Gender) as gender from mysqlcourse.employee;
select avg(PaymentTier) as avg_paymenttier from mysqlcourse.employee;
select max(Age) as max_age from mysqlcourse.employee;
select min(Age) as max_age from mysqlcourse.employee;
select truncate(age,1) as age_truc from mysqlcourse.employee;
select ceil(age) as higher_age from mysqlcourse.employee;
select floor(age) as higher_age from mysqlcourse.employee;

#Date Functions
SELECT * FROM mysqlcourse.employee;
select date(joiningyear) as dates from mysqlcourse.employee;
select time(joiningyear) as dates from mysqlcourse.employee;
select datediff(joiningyear, joindate) as dates from mysqlcourse.employee;
select dayname(joiningyear) as dates from mysqlcourse.employee;
select monthname(joiningyear) as dates from mysqlcourse.employee;
select year(joiningyear) as dates from mysqlcourse.employee;
select hour(joiningyear) as dates from mysqlcourse.employee;

#case operator
SELECT * FROM mysqlcourse.employee;
select education,city,age,
case
	when age >= 25 and education = 'bachelors' then 'Perfect candidate'
	else "You need a Masters"
end as Requirements
from mysqlcourse.employee;

select city,age,
case
	when age>= 30 then "Start your star-up"
    when city = 'pune' and age <= 30 then "I will fund your start-up"
	else 'Seek mentorship'
end as Startup_details
from mysqlcourse.employee;


#groupby & orderby
SELECT * FROM mysqlcourse.employee;
select Education,count(age) from mysqlcourse.employee group by Education;
select gender,count(age) from mysqlcourse.employee group by Gender order by count(age)asc;

#having clause
select education,count(age) from mysqlcourse.employee group by Education having count(Age) > 250;
select education,sum(age) from mysqlcourse.employee group by Education having sum(Age) > 3000;

#JOINS(inner,left,right,cross)

-- Create table: employee
CREATE TABLE employee1 (
    employeeID INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    department VARCHAR(50)
);

-- Create table: products
CREATE TABLE products (
    productCode VARCHAR(10) PRIMARY KEY,
    productName VARCHAR(100),
    quantityInStock INT
);

-- Create table: orderdetails
CREATE TABLE orderdetails (
    orderDetailID INT PRIMARY KEY,
    orderID INT,
    productCode VARCHAR(10),
    quantityOrdered INT,
    FOREIGN KEY (productCode) REFERENCES products(productCode)
);

-- Create table: orders (optional, if needed for a real scenario)
CREATE TABLE orders (
    orderID INT PRIMARY KEY,
    orderDate DATE,
    customerID INT
);
-- Insert employees
INSERT INTO employee1 (employeeID, firstName, lastName, department) VALUES
(1, 'John', 'Doe', 'Sales'),
(2, 'Jane', 'Smith', 'HR'),
(3, 'Mike', 'Brown', 'IT');

-- Insert products
INSERT INTO products (productCode, productName, quantityInStock) VALUES
('P001', 'Laptop', 50),
('P002', 'Mouse', 150),
('P003', 'Keyboard', 100);

-- Insert orders
INSERT INTO orders (orderID, orderDate, customerID) VALUES
(101, '2025-04-01', 1),
(102, '2025-04-02', 2);

-- Insert orderdetails
INSERT INTO orderdetails (orderDetailID, orderID, productCode, quantityOrdered) VALUES
(1, 101, 'P001', 2),
(2, 101, 'P002', 5),
(3, 102, 'P003', 3);


select products.productName,sum(orderdetails.quantityOrdered) from products
inner join orderdetails
on products.productCode = orderdetails.productCode
group by products.productName;


select products.productName,orderdetails.quantityOrdered
from products left join orderdetails
on products.productCode = orderdetails.productCode;

select products.productName,orderdetails.quantityOrdered
from products right join orderdetails
on products.productCode = orderdetails.productCode;

select products.productName, products.quantityInstock, orderdetails.quantityOrdered 
from products cross join orderdetails
on products.productCode = orderdetails.productCode;

#set operators
SELECT * FROM mysqlcourse.employee;
SELECT * FROM mysqlcourse.employee1;

select firstName,department from employee1
union all
select education,city from employee;

select firstName,department from employee1
except
select education,city from employee;

select education,city from employee
where firstName in(select firstName from employee1);

select education,city from employee
where firstName not in(select firstName from employee1);

#Subqueries
select avg(age) from mysqlcourse.employee;
select * from mysqlcourse.employee where age > 40;
select * from mysqlcourse.employee where age > 
(select avg(age) from mysqlcourse.employee);

#VIEWS
create view count_of_cities as
select city,count(city) from mysqlcourse.employee
group by City;

create  view pune_data as
select * from mysqlcourse.employee where city = 'pune';

# STORED PROCEDURE
Delimiter &&
create procedure get_data()
begin
	select * from mysqlcourse.employee;
end &&
Delimiter ;

call mysqlcourse.get_data()


Delimiter &&
create procedure get_limit(in var int)
begin
	select * from mysqlcourse.employee limit var;
end &&
Delimiter ;

Delimiter &&
create procedure get_credit(out var int)
begin
	select max(creditLimit) into var from mysqlcourse.employee;
end &&
Delimiter ;

Delimiter &&
create procedure get_name(inout var int)
begin
	select city from mysqlcourse.employee where City = var;
end &&
Delimiter ;

set @m = 125;
call mysqlcourse.get_name(@m);
select @m;

call mysqlcourse.get_data();
call mysqlcourse.get_limit(3); 
call mysqlcourse.get_credit(@abc);
select @abc;


#WINDOW Fuctions
select * ,rank()
over(partition by education) from mysqlcourse.employee;







