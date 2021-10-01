
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

 #--------------------------------UC8------------------------
 
alter table employee_payroll add phone varchar(20);
alter table employee_payroll add address varchar(80) default 'Nagpur';
alter table employee_payroll add department varchar(20) not null;
desc employee_payroll;

#--------------------------------UC9------------------------

alter table employee_payroll rename COLUMN salary to basic_pay;
alter table employee_payroll add deduction int,add taxable_pay int ,add income_tax int,add net_pay int;

#--------------------------------UC10------------------------

select *from employee_payroll;
insert into employee_payroll(name,basic_pay,startdate,gender,department,deduction,taxable_pay,income_tax,net_pay)values('Terissa',45000,'2020-12-09','F','Marketing','3000','2000','5000','30000');
insert into employee_payroll(name,basic_pay,startdate,gender,department,deduction,taxable_pay,income_tax,net_pay)values('Terissa',90000,'2020-10-09','F','Sales','8000','6000','5000','70000');

#--------------------------------UC11------------------------

create table employee
(id int auto_increment not null primary key,
name varchar(30) not null,
gender varchar(1),
startdate date not null,
phone varchar(15),
address varchar(30));
insert into employee (id,name,gender,startdate,phone,address) values(1,'sneha','F','2021-10-20',9898659865,'Bagalkot');
insert into employee (id,name,gender,startdate,phone,address) values(2,'Sahaja','F','2021-10-30',687458745,'Hubbali');
select * from employee;

create table payroll
(
id int auto_increment not null primary key,
basicpay int,
deduction int,
taxablepay int,
incometax int,
netpay int,
empid int,
foreign key(empid) references employee(id)
);
insert into payroll (basicpay,deduction,taxablepay,incometax,netpay,id) values(10000,400,500,900,800,2);
insert into payroll (basicpay,deduction,taxablepay,incometax,netpay,id) values(20000,500,800,100,900,3);
select * from payroll;

create table department
(
id int auto_increment not null primary key,
deptname varchar(20) not null
);
insert into department (id,deptname) values(1,'Sales');
insert into department values (2,'Marketing');
select * from department;

create table employee_department
(
employeeid int not null,
departmentid int not null,
foreign key(employeeid) references employee(id),
foreign key(departmentid) references department(id),
primary key(employeeid,departmentid)
);
insert into employee_department(employeeid,departmentid) values(1,2);

#--------------------------------UC12------------------------

select * from employee;
select * from department;
select * from employee_department;
 