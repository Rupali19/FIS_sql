use assg1

select * from emp 

--1) Retrieve a list of MANAGERS.
select ename
from emp
where(empno in (select mgr_id from emp))

--2)Find out the names and salaries of all employees earning more than 1000 per month.
select ename,sal from emp
where sal > 1000
order by sal 

--3) Display the names and salaries of all employees except JAMES. 
select ename,sal from emp
where ename!= 'JAMES'

--4)Find out the details of employees whose names begin with ‘S’. 
select * from emp
where ename like 'S%'

--5)Find out the names of all employees that have ‘A’ anywhere in their name. 
select ename from emp
where ename like '%A%'

--6)Find out the names of all employees that have ‘L’ as their third character in their name. 
select ename from emp
where ename like '__L%'

/*update emp set ename='MARTIN' where empno=7654
update emp set ename='BLAKE' where empno=7698
update emp set ename='KING' where empno=7839
update emp set ename='ADAMS' where empno=7876
update emp set job='SALESMAN' where empno=7654
update emp set job='MANAGER' where empno=7782
update emp set job='PRESIDENT' where empno=7839
update emp set job='CLERK' where empno=7876*/
update dept set dname = 'RESEARCH' where dname=' RESEARCH'
update dept set dname = 'SALES' where dname=' SALES'

--7)Compute daily salary of JONES.
select ename, (sal/30) as 'Daily' from emp
where ename='JONES'

--8)Calculate the total monthly salary of all employees.
select sum(sal) as 'TOTAL' from emp

--9)Print the average annual salary 
alter table emp
add annual as (sal*12) 
select avg(annual) as 'AVG annual' from emp

--10)Select the name, job, salary, department number of all employees except SALESMAN from department number 30. 
select ename,job,sal,deptno from emp
where deptno = 30 and job != 'SALESMAN'

--11)List unique departments of the EMP table
select * from dept where deptno in(select unique deptno from emp)
select e.deptno, d.dname from emp e inner join dept d on (e.deptno=d.deptno)

--12)List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select ename as 'Employee', sal as 'Monthly Salary' from emp 
where sal>1500 and deptno != 20

--13) Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000. 
select ename, job, sal from emp  where job in ('MANAGER','ANALYST') and sal != all (select sal from emp where sal in (1000,3000,5000))

--14) Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%

--15) Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782.
select ename from emp where ename like '%l%l%' and deptno=30 or mgr_id = 7782

--16)Display the names of employees with experience of over 10 years and under 20 yrs.Count the total number of employees. 

--17)Retrieve the names of departments in ascending order and their employees in descending order.
select d.dname, e.ename from emp e inner join dept d on (d.deptno=e.deptno)
order by d.dname asc, e.ename desc 

--18)Find out experience of MILLER. 
--select DATEDIFF(year,hiredate,'4-sep-2000') from emp where ename='MILLER'