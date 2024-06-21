# SQL -> Structured Query Language

It is a language that is used to intercat with database just like any other programming language like C, C++, Java which we use in order to convert high level code into binary code in order to make it understandable by the computer.
Similarly SQL is used as a Database Language to interact with database.

- Database : Collection of data either structured or unstructured

## 1. Tools and Softwares for RDBMS (Relational Database Management System)

- In order to connect with database we use different tools which uses SQL as its query language.
  Some of those RDBMS tools are :

  - MySQL
  - MySQL Server
  - DB2
  - PostgreSQL, etc

- In SQL the data is stored in the form of tables having rows and columns.
- The data is structured in SQL database.
- SQL is not case sensitive so we can write our query in any case i.e either uppercase or lowercase
- We can manage relationships between different tables.

## 2. SQL has different types of commands

These commands are given below:

- DQL (Data Query Language) -> select ,
- DML (Data Manipulation Language) -> insert, update, delete,
- DDL (Data Definition Language) -> create, alter, drop, truncate, rename (for schema change)
- DCL (Data Control Language) -> Grant, Revoke
- TCL (Transaction Control Language) -> Commit, Rollbqck,

## 3. SQL Commands

- ### Show Databases on the system or server
  ```sql
  show databases;
  ```
- ### Select Database
  
  syntax :
  ```sql
  use database_name;
  ```
  for example :
  ```sql
  use sql_practice;
  ```

- ### Constraints 
  - primary key : 
     - used in a table to uniquely identify its records or rows.
     - it makes column data unique
     - it makes column data non null
     - every table has one primary key 
     - syntax
     ```sql
     rollno int primary key
     ```
  - foreign key : 
- ### Create new Table

  syntax : 
  ```sql
  create table if not exists table_name(
    attribute_name data_type constraint
  );
  ```

  ```sql
  create table if not exists employee (
    id int primary key,
    name varchar(50),
    age int,
    department varchar(50),
    salary int
  );
  ```

- ### Insert data into Table

```sql
insert into employee (id,name,age,department,city,salary) values
(1,"Rahul",25,"IT","Mumbai",1500),
(2,"Ram",26,"HR","Pune",2000),
(3,"Abhimanyu",27,"IT","Mumbai",2500),
(4,"Aditya",25,"Marketing","Surat",2400),
(5,"Raj",24,"Finance","Indore",1500);
```

-- see all data in table

```sql
select * from employee;
```

-- update column

```sql
update employee set salary=1600 where salary=1500;
```

-- delete records (rows) from table

```sql
delete from employee where name="Raj";
```

-- where clause

```sql
select * from employee where age>25;
select id, name, age, city, department, salary from employee where age>25;
```

-- alter command
-- to add more column, to chenge column name, etc to modify schema

-- add column

```sql
alter table employee add dob varchar(20) default "np";
```

-- drop column

```sql
alter table employee drop column dob;
```

-- modify data type of column

-- modify clause

```sql
alter table employee modify age varchar(3);
```

-- change name of column and also the datatype

-- change command

```sql
alter table employee change age emp_age varchar(3);
alter table employee change emp_age age varchar(3);
```

-- rename command (to rename any table, column, index, constraint name) (DDL)

```sql
alter table employee rename column emp_age to age;
```

-- rename table

```sql
rename table employee to employees;
rename table employees to employee;
```

-- truncate (remove all rows but preserve structure)

```sql
create table emp (rollno int primary key);
desc emp;
insert into emp (rollno) values (1),(2);
select * from emp;
truncate table emp;
select * from emp;
desc emp;
```

-- diff between truncate delete drop
-- remove all rows from table | use to remove specific rows from table based on cond'n | used to completely remove the table along with schema
-- truncate table tablename; | delete from tablename where cond'n; | drop table tablename;

-- foreign key

```sql
create table if not exists parent (rollno int primary key, name varchar(50) not null);
create table if not exists child (c_id int primary key , c_name varchar(20) not null, rollno int, foreign key (rollno) references parent(rollno));
desc child;
```

-- distinct (to query non duplicate data)

```sql
select city,age from employee;
select distinct city from employee;
select distinct city,age from employee;   -- to use it combinedly
```

-- operators in sql
-- arithmetic opr -> +, -, \*, /, %
-- comparision opr -> =, <> or !=, >, <, >=, <=
-- logical opr -> and, or, not
-- in -> checks if a value is in list of values
-- is null / is not null
-- bitwise opr -> and(&), or(|)

-- and opr
select \* from employee where age>=20 and department="IT";

-- or opr

```sql
select * from employee where age>=20 or department="IT";
```

-- in opr

```sql
select * from employee where department in ("IT","HR");
```

-- not opr

```sql
select * from employee where department not in ("IT","HR");
```

-- like & wildcard opr

```sql
select * from employee where name like 'R%';
select * from employee where name like 'R___%';
select * from employee where name like '_A%';
```

-- between opr

```sql
select * from employee where salary between 1500 and 2000;
```

-- clauses in sql -> tools/conditions that help us to make queries more specific -> where, group by, having, order by, limit

-- where clause

```sql
select * from employee where age > 25;
```

-- limit clause -> used to restrict the number of rows returned by query

```sql
select * from employee limit 3;
```

-- order by -> to make result sorted in a particular order as ASC or DESC by default asc

```sql
select * from employee;
select * from employee order by age;
select * from employee order by salary desc;
```

-- Q1 -> fetch emp with id 1

```sql
select * from employee where id = 1;
```

-- Q2 -> fetch emp with id 1 and city mumbai

```sql
select * from employee where id = 1 and city = "mumbai";
```

-- Q3 -> fetch emp with salary > 1200 and city mumbai

```sql
select * from employee where salary > 1200 and city = "mumbai";
```

-- Q4 -> fetch emp who are not from mumbai;

```sql
select * from employee where city != "mumbai";
```

-- Q5 -> fetch emp with salry in desc order

```sql
select * from employee order by salary desc;
```

-- Q6 -> fetch 2 emp with maximum salary

```sql
select * from employee order by salary desc limit 2;
```

-- Aggregate functions -> collated or collection -> perform opr on set of rows and return single value . used with select statements -> count(), sum(), avg(), min(), max(), group_concat()

-- count() -> count number of rows in table or no of non null values

```sql
select count(name) from employee; -- gives total no of emp in company
```

-- sum() -> sum of all the values in numeric column

```sql
select sum(salary) from employee; -- gives total amount company is paying
```

-- avg() -> avg of all the values in numeric column

```sql
select avg(salary) from employee; -- gives avg amount company is paying
```

-- min() -> to find minimum number in column

```sql
select min(salary) from employee; -- gives minimum salary company paying
```

-- max() -> to find maximum number in column

```sql
select max(salary) from employee; -- gives maximum salary company paying
```

-- Group by clause -> used to group rows having same values together. helps to organize data into groups for opr like total, avg , max, min, etc in the groups

-- group by

```sql
select department, avg(salary) as avg_salary from employee group by department; -- avg salary of department
select department, max(salary) as max_salary from employee group by department; -- max salary of department
select department, count(name) as total_emp from employee group by department; -- total employees in department
```

-- having clause -> used to apply some condition after making group. similar to where clause but only difference is that it works on aggregated data. helps to filter groups based on cond'n

-- having clause

```sql
select department, avg(salary) as avg_salary from employee group by department having avg_salary > 2000;
```

-- diff between where clause and having clause

-- where clause  
-- used to filter rows based on condition before aggregation
-- used with select , update, delete

-- having clause
-- used to filter rows based on condition after aggregation
-- used with group by and aggregate functions

-- aggregation -> get a single value summarizing data by doing some manipulation on collection or collated data

-- Q1 -> fetch total emp based on city

```sql
select city, count(name) as total_emp from employee group by city;
```

-- Q2 -> fetch max salary of emp based on city in desc order

```sql
select city, max(salary) as max_salary from employee group by city order by max_salary desc;
```

-- Q3 -> display department name alongside total count of emp in each department , sorting the results by total no of emp in desc

```sql
select department, count(name) as total_emp from employee group by department order by total_emp desc;
```

-- Q4 -> fetch list of department where average salary > 1200 and display department name and avg sal

```sql
select department, avg(salary) as avg_salary from employee group by department having avg_salary > 1200;
```

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

```sql
select salary from employee order by salary desc;
select max(salary) as max_salary from employee where salary != (select max(salary) from employee);
```

-- Q2 -> find nth highest salary (with subquery it is complex).
-- So, we will do it using offset n-1 and limit 1

-- for first highest

```sql
select salary from employee order by salary desc limit 1;
```

-- for second highest

```sql
select salary from employee order by salary desc limit 1 offset 1;
```

-- for third highest

```sql
select salary from employee order by salary desc limit 1 offset 2;
```

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

```sql
create table if not exists customer (id int, customer_name varchar(20) not null);
create table if not exists orders (id int primary key, order_name varchar(20) not null);
insert into customer(id, customer_name) values (101, "Ram"),(102, "Rahul"),(103,"Riti");
insert into orders(id, order_name) values (102, "Fruit"),(103, "Ball"),(104,"Basket");
```

```sql
select * from customer;
select * from  orders;
```

-- inner join

```sql
select * from customer inner join orders on customer.id = orders.id;
```

-- left join

```sql
select * from customer left join orders on customer.id = orders.id;
```

-- right join

```sql
select * from customer right join orders on customer.id = orders.id;
```

-- full join -> mysql does not dupport full join keyword directly but postgresql and sql server support so we can use here left join , riht join and union

-- union -> without duplicates rows of first table and second table

```sql
select * from customer union select * from orders;
```

-- full join

```sql
select * from customer left join orders on customer.id = orders.id
union
select * from customer right join orders on customer.id = orders.id;
```

-- cross join

```sql
select * from customer cross join orders;
```

-- self join

```sql
select * from customer self join customer;
```

-- stored procedure

```sql
create procedure getAllOrders()
begin
select * from orders;
end;
```

```sql
call getAllOrders();
```

-- parameterized procedure (in means its an input parameter) -> not working

```sql
create procedure getOrderById(in id int)
begin
select * from orders where id=id;
end;
```

```sql
call getOrderById(102);
```

-- views -> virtual table in sql
-- helps in providing filtered view of data for security purposes
-- provides abstraction and security

```sql
create view employee_details_view as select * from employee;
```

```sql
select * from employee_details_view;
```
# sql-practice
