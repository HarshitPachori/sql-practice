-- DQL(Data Query Language) -> select , 
-- DML(Data Manipulation Language) -> insert, update, delete, 
-- DDL(Data Definition Language) -> create, alter, drop, truncate, rename  (for schema change)
-- DCL(Data Control Language) -> Grant, Revoke
-- TCL(Transaction Control Language) -> Commit, Rollbqck, 

-- show databases on system or server
show databases;

-- select db 
use sql_practice;

-- create table
create table if not exists employee (
  id int primary key,
  name varchar(50),
  age int,
  department varchar(50),
  city varchar(50),
  salary int
);

-- insert into table
insert into employee (id,name,age,department,city,salary) values 
(1,"Rahul",25,"IT","Mumbai",1500),
(2,"Ram",26,"HR","Pune",2000),
(3,"Abhimanyu",27,"IT","Mumbai",2500),
(4,"Aditya",25,"Marketing","Surat",2400),
(5,"Raj",24,"Finance","Indore",1500);

-- see all data in table
select * from employee;

-- update column 
update employee set salary=1600 where salary=1500;

-- delete records (rows) from table 
delete from employee where name="Raj";

-- where clause
select * from employee where age>25;
select id, name, age, city, department, salary from employee where age>25;

--  alter command
-- to add more column, to chenge column name, etc to modify schema

-- add column
alter table employee add dob varchar(20) default "np";

-- drop column
alter table employee drop column dob;

-- modify data type of column

-- modify clause
alter table employee modify age varchar(3);

-- change name of column and also the datatype 

-- change command
alter table employee change age emp_age varchar(3);
alter table employee change emp_age age varchar(3);

-- rename command  (to rename any table, column, index, constraint name) (DDL)
alter table employee rename column emp_age to age;

-- rename table
rename table employee to employees;
rename table employees to employee;

-- truncate (remove all rows but preserve structure)
create table emp (rollno int primary key);
desc emp;
insert into emp (rollno) values (1),(2);
select * from emp;
truncate table emp;
select * from emp;
desc emp;


--  diff between truncate delete drop
-- remove all rows from table    |   use to remove specific rows from table based on cond'n    |   used to completely remove the table along with schema
-- truncate table tablename;     |   delete from tablename where cond'n;                       |   drop table tablename;

-- foreign key
create table if not exists parent (rollno int primary key, name varchar(50) not null);
create table if not exists child (c_id int primary key , c_name varchar(20) not null, rollno int, foreign key (rollno) references parent(rollno));
desc child;

-- distinct (to query non duplicate data)
select city,age from employee;
select distinct city from employee;
select distinct city,age from employee;   -- to use it combinedly

-- operators in sql 
-- arithmetic opr -> +, -, *, /, %
-- comparision opr -> =, <> or !=, >, <, >=, <=
-- logical opr -> and, or, not
-- in -> checks if a value is in list of values
-- is null / is not null
-- bitwise opr -> and(&), or(|)

--  and opr
select * from employee where age>=20 and department="IT";

-- or opr
select * from employee where age>=20 or department="IT";

-- in opr
select * from employee where department in ("IT","HR");

-- not opr
select * from employee where department not in ("IT","HR");

-- like & wildcard opr
select * from employee where name like 'R%';
select * from employee where name like 'R___%';
select * from employee where name like '_A%';

-- between opr
select * from employee where salary between 1500 and 2000;


-- clauses in sql -> tools/conditions that help us to make queries more specific -> where, group by, having, order by, limit

-- where clause
select * from employee where age > 25;

-- limit clause -> used to restrict the number of rows returned by query
select * from employee limit 3;

-- order by  -> to make result sorted in a particular order as ASC or DESC by default asc
select * from employee;
select * from employee order by age;
select * from employee order by salary desc;

-- Q1 -> fetch emp with id 1
select * from employee where id = 1;

-- Q2 -> fetch emp with id 1 and city mumbai
select * from employee where id = 1 and city = "mumbai";

-- Q3 -> fetch emp with salary > 1200 and city mumbai
select * from employee where salary > 1200 and city = "mumbai";

-- Q4 -> fetch emp who are not from mumbai;
select * from employee where city != "mumbai";

-- Q5 -> fetch emp with salry in desc order
select * from employee order by salary desc;

-- Q6 -> fetch 2 emp with maximum salary
select * from employee order by salary desc limit 2;


-- Aggregate functions -> collated or collection -> perform opr on set of rows and return single value . used with select statements -> count(), sum(), avg(), min(), max(), group_concat()

-- count() -> count number of rows in table or no of non null values
select count(name) from employee; -- gives total no of emp in company

-- sum() -> sum of all the values in numeric column
select sum(salary) from employee; -- gives total amount company is paying

-- avg() -> avg of all the values in numeric column
select avg(salary) from employee; -- gives avg amount company is paying

-- min() -> to find minimum number in column
select min(salary) from employee; -- gives minimum salary company paying

-- max() -> to find maximum number in column
select max(salary) from employee; -- gives maximum salary company paying



-- Group by clause -> used to group rows having same values together. helps to organize data into groups for opr like total, avg , max, min, etc in the groups

-- group by
select department, avg(salary) as avg_salary from employee group by department; -- avg salary of department
select department, max(salary) as max_salary from employee group by department; -- max salary of department
select department, count(name) as total_emp from employee group by department; -- total employees in department

-- having clause -> used to apply some condition after making group. similar to where clause but only difference is that it works on aggregated data. helps to filter groups based on cond'n

-- having clause
select department, avg(salary) as avg_salary from employee group by department having avg_salary > 2000;


-- diff between where clause and having clause

-- where clause                                                 
-- used to filter rows based on condition before aggregation
-- used with select , update, delete

-- having clause
-- used to filter rows based on condition after aggregation
-- used with group by and aggregate functions

-- aggregation -> get a single value summarizing data by doing some manipulation on collection or collated data

-- Q1 -> fetch total emp based on city
select city, count(name) as total_emp from employee group by city;

-- Q2 -> fetch max salary of emp based on city in desc order
select city, max(salary) as max_salary from employee group by city order by max_salary desc;

-- Q3 -> display department name alongside total count of emp in each department , sorting the results by total no of emp in desc
select department, count(name) as total_emp from employee group by department order by total_emp desc;

-- Q4 -> fetch list of department where average salary > 1200 and display department name and avg sal
select department, avg(salary) as avg_salary from employee group by department having avg_salary > 1200;


-- general order/rank of sql commands 
-- select
-- from
-- where
-- group by
-- having
-- order by
-- limit

-- sub queries / nested queries
-- Q1 -> fetch second highest salary of employee
select salary from employee order by salary desc;
select max(salary) as max_salary from employee where salary != (select max(salary) from employee);

-- Q2 -> find nth highest salary (with subquery it is complex).
--      So, we will do it using offset n-1 and limit 1

-- for first highest 
select salary from employee order by salary desc limit 1;

-- for second highest
select salary from employee order by salary desc limit 1 offset 1;

-- for third highest
select salary from employee order by salary desc limit 1 offset 2;

-- Joins -> used to combine rows from two or more tables on a related, common, shared, column between them
-- types -> 4 types including -> inner join, Outer join (left join, right join, full join), self join, cross join

-- Q1 -> is foreign key necessary for performing joins
-- Ans -> Joins can be performed based on any columns that establish relationship between tables , not just FK. So, its not necessary.

-- Inner join -> Contains common rows from both tables

-- left join / left outer join -> contains all rows from left table along with common rows from right table and return null for the columns of right table if no matching record in right table 

-- right join / right outer join -> contains all rows from right table along with common rows from left table and return null for the columns of left table if no matching record in left table 

-- full join / full outer join -> contains all rows from both tables and fills null for left table values not present in right table and vice versa

-- self join -> join on same table

-- cross join -> to perform cartesian product of two tables


-- joins
create table if not exists customer (id int, customer_name varchar(20) not null);
create table if not exists orders (id int primary key, order_name varchar(20) not null);
insert into customer(id, customer_name) values (101, "Ram"),(102, "Rahul"),(103,"Riti");
insert into orders(id, order_name) values (102, "Fruit"),(103, "Ball"),(104,"Basket");

select * from customer;
select * from  orders;

-- inner join 
select * from customer inner join orders on customer.id = orders.id;

-- left join
select * from customer left join orders on customer.id = orders.id;

-- right join
select * from customer right join orders on customer.id = orders.id;

-- full join -> mysql does not dupport full join keyword directly but postgresql and sql server support so we can use here left join , riht join and union 

-- union -> without duplicates rows of first table and second table
select * from customer union select * from orders;

--  full join 
select * from customer left join orders on customer.id = orders.id
union
select * from customer right join orders on customer.id = orders.id;

-- cross join
select * from customer cross join orders;

-- self join
select * from customer self join customer;

-- stored procedure

create procedure getAllOrders()
begin
select * from orders;
end;

call getAllOrders();

-- parameterized procedure (in means its an input parameter) -> not working
create procedure getOrderById(in id int)
begin
select * from orders where id=id;
end;

call getOrderById(102);

-- views -> virtual table in sql 
-- helps in providing filtered view of data for security purposes
-- provides abstraction and security
create view employee_details_view as select * from employee;
select * from employee_details_view;


