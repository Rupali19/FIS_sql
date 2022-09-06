use sql1 


create table books(
id int primary key,
title varchar(50),
author varchar(20),
isbn decimal(20) unique,
published_date datetime)
insert into books values(1,'My First sql book','mary parker',981483029127,'2012-02-22 12:08:17')
insert into books values(2,'My second sql book','john mayer',857300923713,'1972-07-03 09:22:45')
insert into books values(3,'My third sql book','cory flint',523120967812,'2015-10-18 14:05:44')

select * from books

select * from books where author like '%er'

create table reviews(
id int,
book_id int references books(id),
reviewer_name varchar(20),
content varchar(20),
rating int,
published_date datetime)
insert into reviews values(1,1,'john smith','my first review',4,'2017-12-10 05:50:11'), (2,2,'john smith','my second review',5,'2017-10-13 15:05:12'),
(3,2,'alice walker','another review',1,'2017-10-22 23:47:10')

select * from reviews
select title,author,reviewer_name from books join reviews on books.id=reviews.book_id 


select reviewer_name from reviews
group by reviewer_name having count(id) >1 

create table customer(
id int primary key,
name varchar(20),
age int,
address varchar(20),
salary float)
insert into customer values (1,'ramesh',32,'ahmedabad',2000.00),(2,'khilan',25,'delhi',1500.00),(3,'kaushik',23,'kota',2000.00),(4,'chaitali',25,'mumbai',6500.00),
(5,'hardik',27,'bhopal',8500.00), (6,'komal',22,'MP',4500.00), (7,'muffy',24,'indore',10000.00)

select name from customer where address like '%o%'



create table orders(
oid int primary key,
date1 datetime,
cust_id int references customer(id),
amt int)
insert into orders values (102,'2009-10-08  00:00:00',3,3000), (100,'2009-10-08  00:00:00',3,1500), (101,'2009-11-20  00:00:00',2,1560), (103,'2008-05-20  00:00:00',4,2060)
 
select date1,count(date1) as total from order

