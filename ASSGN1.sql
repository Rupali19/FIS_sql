create database assg1                   --create database 
use assg1 

create table clients                    --TABLE CLIENT
( client_id decimal(4) primary key,
  cname varchar(40) not null,
  address varchar(30),
  email varchar(30) unique,
  phone decimal(10),
  business varchar(20) not null
)

select * from clients                    --SHOW CLIENTS

insert into clients values (1001, 'ACME Utilities', 'Noida', 'contact@acmeutil.com',9567880032,'Manufacturing'), 
(1002,'Trackon Consultants','Mumbai','consult@trackon.com',8734210090,'Consultant'),
(1003,'MoneySaver Distributors','Kolkata','save@moneysaver.com',7799886655,'Reseller'),
(1004,'Lawful Corp','Chennai','justice@lawful.com',9210342219,'Professional')


create table departments(                   --TABLE DEPT
deptno decimal(2) primary key,
dname varchar(15) not null,
loc varchar(20)
)
insert into departments values (10,'Design','Pune'),
(20,'Development','Pune'),
(30,'Testing','Mumbai'),
(40,'Document','Mumbai')

select  * from departments                   -- SHOW DEPT


create table employees(                        -- TABLE EMP
empno decimal(4) primary key,
ename varchar(20) not null,
job varchar(15),
salary decimal(7),
deptno decimal(2) references departments(deptno)
)

alter table employees
add constraint pos check(salary>0)

insert into employees values (7001,'Sandeep','Analyst',25000,10), (7002,'Rajesh','Designer',30000,10), (7003,'Madhav','Developer',40000,20),
(7004,'Manoj','Developer',40000,20), (7005,'Abhay','Designer',35000,10),(7006,'Uma','tester',30000,30),(7007,'Gita','Techwriter',30000,40),
(7008,'Priya','Tester',35000,30), (7009,'Nutan','Developer',45000,20), (7010,'Smita','Analyst',20000,10), (7011,'Anand','Project mgr',65000,10)

select * from employees                      --SHOW EMP


create table projects(                      --PROJECT TABLE
proj_id decimal(3) primary key,
descr varchar(20) not null,
start_date date,
end_date date,
budget decimal(10) check(budget>0),
client_id decimal(4) references clients(client_id)
)
alter table projects
add planned_end_date date

select * from projects                      --show projects

insert into projects values(401,'Inventory','2011-04-01','2011-10-31',150000,1001,'2011-10-01')
insert into projects(proj_id,descr,start_date,planned_end_date,budget,client_id) values(402,'Accounting','2011-08-01','2012-01-01',500000,1002)
insert into projects(proj_id,descr,start_date,planned_end_date,budget,client_id) values(403,'Payroll','2011-10-01','2011-12-31',75000,1003), (404,'Contact mgmt','2011-11-01','2011-12-31',50000,1004)


create table empProjTasks(                             --TASK TABLE
project_id decimal(3) references  projects(proj_id),
empno decimal(4) references employees(empno),
start_date date,
end_date date,
task varchar(25) not null,
status varchar(15) not null,
primary key(project_id,empno)
)

insert into empProjTasks values (401,7001,'2011-04-01','2011-04-20','System Analysis','Completed'), (401,7002,'2011-04-21','2011-05-30','System Design','Completed'),
(401,7003,'2011-06-11','2011-07-15','Coding','Completed'), (401,7004,'2011-07-18','2011-09-01','Coding','Completed'),
(401,7006,'2011-09-03','2011-09-15','Testing','Completed'), (401,7009,'2011-09-18','2011-10-05','Code Change','Completed'),
(401,7008,'2011-10-06','2011-10-16','Testing','Completed'), (401,7007,'2011-10-06','2011-10-22','Documentation','Completed'),
(401,7011,'2011-10-22','2011-10-31','Sign off','Completed'),(402,7010,'2011-08-01','2011-08-20','System Analysis','Completed'),
(402,7002,'2011-08-22','2011-09-30','System Design','Completed')
insert into empProjTasks (project_id,empno,start_date,task,status) values(402,7004,'2011-10-01','Coding','In Progress')

select * from empProjTasks