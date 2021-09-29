
 #--------------------------------UC1------------------------
show databases;
create database payroll_service;
use payroll_service;
 
 #--------------------------------UC2------------------------
create table employee_payroll
(
id int not null auto_increment,
name varchar(50) not null,
salary Double not null,
startdate Date not null,
primary key(id)
);
desc employee_payroll;

  #--------------------------------UC3------------------------
  select *from employee_payroll;
insert into employee_payroll(name,salary,startdate)
values('Megha',40000,'2022-09-29');

insert into employee_payroll(name,salary,startdate)
values('Kittu',90000,'2021-04-16');

insert into employee_payroll(name,salary,startdate)
values('Gouri',65000,'2021-10-15');

insert into employee_payroll(name,salary,startdate)
values('Sneha',85000,'2021-11-18');

insert into employee_payroll(name,salary,startdate,gender)
values('pradeep',12000,'2021-05-18','M');

  #--------------------------------UC4------------------------
  select *from employee_payroll;
  select name,salary from employee_payroll;
  select name,salary, startdate from employee_payroll;
 
 #--------------------------------UC5------------------------
   
SELECT salary FROM employee_payroll
WHERE name = 'Megha';

select *from employee_payroll;
select * from employee_payroll
WHERE startdate BETWEEN CAST('2021-04-16'AS DATE)
AND CAST('2021-11-18'AS DATE);

select * from employee_payroll
WHERE startdate BETWEEN CAST('2021-04-16'AS DATE)
AND Now();

 #--------------------------------UC6------------------------
alter table employee_payroll add gender char(1) not null;

UPDATE employee_payroll
set gender = 'F'
WHERE id =1;
    
UPDATE employee_payroll
set gender = 'F'
WHERE id =5;

 #--------------------------------UC7------------------------
select *from employee_payroll;
select sum(salary) from employee_payroll where gender='M';
select sum(salary) from employee_payroll where gender='F';

select avg(salary) from employee_payroll where gender='M';
select avg(salary) from employee_payroll where gender='F';

select max(salary) from employee_payroll where gender='M';
select max(salary) from employee_payroll where gender='F';
 
select min(salary) from employee_payroll where gender='M';
select min(salary) from employee_payroll where gender='F';
 
select count(*) as 'Total_Male_Employee' from employee_payroll  where gender='M';
select count(*) as 'Total_Female_Employee' from employee_payroll  where gender='F';
 
select sum(salary) as 'Salary Sum',gender from employee_payroll group by gender;