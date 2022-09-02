

create table emp(
empno int primary key,
ename varchar(20),
job varchar(20),
mgr_id int,
hiredate date,
sal int,
comm int,
deptno int
)
select * from emp 

insert into emp(empno,ename,job,mgr_id,hiredate,sal,deptno) values(7369,'SMITH ','CLERK',7902,'17-DEC-80', 800, 20)
insert into emp values (7499 ,'ALLEN','SALESMAN ',7698,'20-FEB-81',1600,300,30), (7521,'WARD', 'SALESMAN',7698 ,'22-FEB-81 ',		 1250,     500 ,   30),
(7654   ,' MARTIN ',   ' SALESMAN',     7698 ,     '28-SEP-81',  	 1250,    1400 ,   30), (7844 ,'TURNER ',   'SALESMAN ',    7698 , '08-SEP-81',   	 1500 ,     0  ,   30)

insert into emp(empno,ename,job,mgr_id,hiredate,sal,deptno) values(7566 ,   'JONES ',     'MANAGER',       7839 ,     '02-APR-81',   	 2975 ,           20),
(7698,' BLAKE', 	 'MANAGER ',	 7839 	,'01-MAY-81',   2850     ,    30), (7782 	,  'CLARK',    ' MANAGER',       7839 ,    ' 09-JUN-81 ',  	 2450  ,          10),
(7788  ,'SCOTT',     'ANALYST',       7566 ,     '19-APR-87',       	 3000  ,          20), (7876  ,'  ADAMS',    ' CLERK' ,        7788  , 	' 23-MAY-87  '    , 	 1100  ,          20),
(7900    ,'JAMES ',    'CLERK' ,        7698,   	' 03-DEC-81',	  950 ,           30),
(7902 ,   'FORD ' ,    'ANALYST',       7566 ,  	' 03-DEC-81 ',  	 3000 ,           20)

insert into emp(empno,ename,job,hiredate,sal,deptno) values(7839  ,'  KING '    ,' PRESIDENT '    ,       	' 17-NOV-81 ',      	 5000 ,           10)

alter table emp
add foreign key (deptno) references dept(deptno)


create table dept(
deptno int primary key not null,
dname varchar(20),
loc varchar(20)
)

select * from dept

insert into dept values (10   ,  'ACCOUNTING',    'NEW YORK'), 
(20,    ' RESEARCH',      'DALLAS' ),
(30,    ' SALES',        ' CHICAGO '),
(40  ,  ' OPERATIONS ',   'BOSTON' )

select e1.ename as 'emp name', m1.ename as 'mgr name'
from emp e1 inner join emp m1 on e1.mgr_id=m1.empno