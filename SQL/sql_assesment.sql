-- da --sql assessment01

create database sample_worker_db;

use sample_worker_db;

create table worker(
worker_id int primary key not null,
First_name varchar(250) not null,
Last_name varchar(150) not null,
salary float not null,
joining_date datetime not null,
department enum('HR', 'Admin', 'Account') not null);

insert into worker( worker_id, First_name, Last_name , salary , joining_date, department) value
("1","Monika","Arora","100000",'2014/2/20 9:00',"HR"),
("2","Niharika","Verma","80000",'2014/6/11 9:00',"Admin"),
("3","Vishal","Singhal","300000",'2014/2/20 9:00',"HR"),
("4","Amitabh","Singh","500000",'2014/2/20 9:00',"Admin"),
("5","Vivek","Bhati","500000",'2014/6/11 9:00',"Admin"),
("6","Vipul","Diwan","200000",'2014/6/11 9:00',"Account"),
("7","Satish","Kumar","75000",'2014/1/20 9:00',"Account"),
("8","Geetika","Chauhan","90000",'2014/4/11 9:00',"Admin"); 

select * from worker;

-- Q.1 Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker
order by First_name ASC, department DESC;

-- Q.2 Write an SQL query to print details for Workers with the first names “Vipul” and “Satish”from the Worker table.
select * from worker
where first_name = "Vipul" or first_name = "Satish";
select * from worker
where first_name in ("Vipul", "Satish");

-- q.3 Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
select * from worker
where first_name LIKE '_____h'
and length(first_name) = 6;

-- Q.4. Write an SQL query to print details of the Workers whose SALARY lies between 1.
select * from worker
where salary between 70000 and 150000;

-- Q.5 Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select First_name, Last_name, count(*)
from worker
group by First_name , Last_name
having count(*) >1;

-- Q.6 Write an SQL query to show the top 6 records of a table. 
select * from worker
limit 6;

-- Q.7  Write an SQL query to fetch the departments that have less than five people in them.
select department, count(*) as worker_count
from worker
group by department
having count(*) <5;

-- Q.8 Write an SQL query to show all departments along with the number of people in there. 
select department , count(*) as worker_count
from worker
group by department;

-- Q.9 Write an SQL query to print the name of employees having the highest salary in each department.
	select  department, max(salary)
	from worker
	group by department;

select First_name, department, salary
from worker
where (department, salary) in (select  department, max(salary)
	from worker
	group by department)
order by salary desc;

 















