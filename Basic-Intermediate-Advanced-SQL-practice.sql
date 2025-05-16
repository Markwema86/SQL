-- BASIC SQL
#SELECT
select * 
from employee_demographics;

select first_name,last_name,birth_date
from parks_and_recreation.employee_demographics;

select first_name,
last_name,
birth_date,
age,
age + 10
from parks_and_recreation.employee_demographics;
#PEMDAS - calculation

select first_name,
last_name,
birth_date,
age,
(age + 10)*10 + 10
from parks_and_recreation.employee_demographics;

select distinct gender
from parks_and_recreation.employee_demographics;





#WHERE CLAUSE
select*
from employee_salary
where first_name = 'Leslie';

select*
from employee_salary
where salary > 50000;

select *
from employee_demographics
where gender != "female";

select *
from employee_demographics
where birth_date > '1985-01-01';

select *
from employee_demographics
where birth_date > '1985-01-01'
and gender = 'male';

select *
from employee_demographics
where (first_name = 'Leslie' and age = 44) or age > 55;

-- LIKE STATEMENT ie % and _
select *
from employee_demographics
where first_name like 'jer%';

select *
from employee_demographics
where first_name like '%er%';

select *
from employee_demographics
where first_name like 'a%';

select *
from employee_demographics
where first_name like 'a__';

select *
from employee_demographics
where first_name like 'a___%';

select *
from employee_demographics
where birth_date like '198%';

-- Group By
select gender
from employee_demographics
group by gender;

select gender, avg(age)
from employee_demographics
group by gender;

select occupation,salary
from employee_salary
group by occupation,salary;

select gender, avg(age),max(age),min(age),count(age)
from employee_demographics
group by gender;

-- order by
select *
from employee_demographics
order by first_name asc;

select *
from employee_demographics
order by gender desc, age asc;

select *
from employee_demographics
order by 5 , 4;

-- having vs where
select gender,avg(age)
from employee_demographics
group by gender
having avg(age) >40;

select occupation,avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 80000;

-- LIMIT
select * from employee_demographics
limit 3;

select * from employee_demographics
order by age desc
limit 3;

select * from employee_demographics
order by age desc
limit 3,1;

-- Aliasing
select gender,avg(age) as avg_age
from employee_demographics
group by gender
having avg_age > 40;




-- INTERMEDIATE SQL
-- Joins
select *
from employee_salary;
select *
from employee_demographics;

select *
from employee_demographics
inner join employee_salary
	on employee_demographics.employee_id = employee_salary.employee_id;

select *
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id;

select dem.employee_id,age,occupation
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id;

-- outter join , left % right
select *
from employee_demographics as dem
right join employee_salary as sal
	on dem.employee_id = sal.employee_id;

select *
from employee_demographics as dem
left join employee_salary as sal
	on dem.employee_id = sal.employee_id;

-- self join
# * assigning patners as santa
select *
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id;

select emp1.employee_id as emp_santa,
emp1.firt_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_santa,
emp2.firt_name as first_name_santa,
emp2.last_name as last_name_santa
from employee_salary emp1
join employee_salary emp1
	on emp1.employee_id + 1 = emp2.employee_id;
    
 -- joining multiple tables   
select *
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id;
    
    
-- Unions
select age, gender
from employee_demographics    
union
select first_name,last_name
from employee_salary;
    
select first_name, last_name
from employee_demographics    
union
select first_name,last_name
from employee_salary;
    
select first_name, last_name
from employee_demographics    
union distinct
select first_name,last_name
from employee_salary;

select first_name, last_name
from employee_demographics    
union all
select first_name,last_name
from employee_salary;
    
select first_name, last_name, 'OLd' as Label
from employee_demographics    
where age > 50;

select first_name, last_name, 'OLd' as Label
from employee_demographics    
where age > 50
union
select first_name, last_name, 'Highly Paid Employee' as Label
from employee_salary    
where salary > 70000;   
    
select first_name, last_name, 'OLd Man' as Label
from employee_demographics    
where age > 40 and gender = 'male'
union
select first_name, last_name, 'OLd Lady' as Label
from employee_demographics    
where age > 40 and gender = 'female'
union
select first_name, last_name, 'Highly Paid Employee' as Label
from employee_salary    
where salary > 70000;   

select first_name, last_name, 'OLd Man' as Label
from employee_demographics    
where age > 40 and gender = 'male'
union
select first_name, last_name, 'OLd Lady' as Label
from employee_demographics    
where age > 40 and gender = 'female'
union
select first_name, last_name, 'Highly Paid Employee' as Label
from employee_salary    
where salary > 70000
order by first_name, last_name;   
    
-- String Fuctions
select length('skyfall');

select first_name,length(first_name)
from employee_demographics
order by 2;
    
select upper('sky');
select lower('sky');
    
select first_name,upper(first_name)
from employee_demographics;
 
 select ('             sky         ');
select trim('             sky         ');
select rtrim('             sky         ');
select ltrim('             sky         ');
  
select first_name, 
left(first_name, 4),
right(first_name, 4),
substring(first_name, 3,2),
birth_date, 
substring(birth_date,3,2),
substring(birth_date,6,2) as birth_month
from employee_demographics;
    
select first_name, replace(first_name, 'a','z')
from employee_demographics;

select locate('x','Alexander');

select first_name,locate('An',first_name)
from employee_demographics;

select first_name,last_name,
concat(first_name,' ',last_name) as full_name
from employee_demographics;


-- Case statement
select first_name,
last_name,
age,
case
	when age <=30 then "young"
    when age between 31 and 50 then "old"
    when age >=50 then "very old"
end as Age_Bracket
from employee_demographics;

#pay increase < 50k = 5%, > 50k = 7%, finance = 10% bonus 

select first_name,last_name,salary,
case
	when salary < 50000 then salary * 1.05
    when salary > 50000 then salary * 1.07
end as New_Salary,
case
	when dept_id = 6 then salary * .10
end as Bonus
from employee_salary;

-- subqueries
select *
from employee_demographics
where employee_id in
				(select employee_id from employee_salary where dept_id = 1);

select  first_name,salary,
(select avg(salary)
from employee_salary)
from employee_salary;

select gender,avg(age), max(age),min(age),count(age)
from employee_demographics
group by gender;

select gender, avg(`max(age)`)
from
(select gender,avg(age), max(age),min(age),count(age)
from employee_demographics
group by gender) as Agg_table
group by gender;

select avg(max_age)
from
(select gender,
avg(age) as avg_age,
max(age) as max_age,
min(age) as min_age,count(age)
from employee_demographics
group by gender) as Agg_table;

-- Windows Fuctions
select gender, avg(salary) as avg_salary
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender;

select dem.first_name,dem.last_name,dem.gender, avg(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;

select dem.first_name,dem.last_name,dem.gender,salary,
sum(salary) over(partition by gender order by dem.employee_id) as Rolling_Total
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;
    
select dem.first_name,dem.last_name,dem.gender,salary,
row_number() over()
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;

select dem.first_name,dem.last_name,dem.gender,salary,
row_number() over( partition by gender)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;

select dem.first_name,dem.last_name,dem.gender,salary,
row_number() over(partition by gender order by salary desc)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;

select dem.first_name,dem.last_name,dem.gender,salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_num
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;


-- ADVANCED SQL
-- CTEs
with CTE_Example as
(
select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
group by gender
)
select avg(avg_sal)
from CTE_Example;

with CTE_Example as
(
select employee_id,gender,birth_date
from employee_demographics 
where birth_date >'1985-01-01'
),
CTE_Example2 as
(
select employee_id, salary
from employee_salary
where salary > 50000
)
select*
from CTE_Example
join CTE_Example2
	on CTE_Example.employee_id=CTE_Example2.employee_id;

with CTE_Example (Gender, AVG_sal, Max_sal, Count_sal) as
(
select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
group by gender
)
select *
from CTE_Example;


-- Temporary Table
create temporary table temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);
select *
from temp_table;

insert into temp_table
values('Mark','Wema','Prison Break');
select *
from temp_table;

select *
from employee_salary;

create temporary table salary_over_50k
select *
from employee_salary
where salary >= 50000;

select *
from salary_over_50k;

-- Stored Procedures

select *
from employee_salary
where salary >= 50000;

create procedure large_salaries()
select *
from employee_salary
where salary >= 50000;

call large_salaries();

DELIMITER $$
create procedure large_salaries2()
begin
	select *
	from employee_salary
	where salary >= 50000;
    select *
	from employee_salary
	where salary >= 10000;
end $$
DELIMITER ;
call large_salaries2();

DELIMITER $$
create procedure large_salaries3(employee_id int)
begin
	select salary
	from employee_salary
    where employee_id = employee_id;
end $$
DELIMITER ;
call large_salaries3(1);



-- Triggers and Events

select * from employee_demographics;

select * from employee_salary;

DELIMITER $$
create trigger employee_insert
	after insert on employee_salary
    for each row
begin
	insert into employee_demographics(employee_id, first_name,last_name)
    values(new.employee_id,new.first_name,new.last_name);
end $$
DELIMITER ;

insert into employee_salary(employee_id, first_name,last_name,occupation,
salary,dept_id)
values(13,'Jean-Ralphio','Saperstein','Exntertainent 720 CEO',1000000, null);

-- Events
select * from employee_demographic;
DELIMITER $$
create event delete_retirees
on schedule every 30 second
do
begin
	delete
    from employee_demographics
    where age >=60;
end $$
DELIMITER ;

select * from employee_demographics;

show variables like 'event%';




















































