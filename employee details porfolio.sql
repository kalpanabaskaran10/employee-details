create database portfolio;
use portfolio;

create table emp_info(emp_id int,emp_name varchar(20), job varchar(20), mgr int ,hire_date date, salary int, commission int, dept_no int, primary key(emp_id));

Insert into emp_info (Emp_id, Emp_name, Job, mgr, Hire_date, Salary, Commission, Dept_no)
values (7369,	'SMITH',	'CLERK',	7902,	'1980-12-17',	800,	Null,	20),
(7499,	'ALLEN',	'SALESMAN',	7698,	'1981-02-20',	1600,	300,	30),
(7521,	'WARD',	'SALESMAN',	7698,	'1981-02-22',	1250,	500,	30),
(7566,	'JONES',	'MANAGER',	7839,	'1981-04-02',	2975,	Null,	20),
(7654,	'MARTIN',	'SALESMAN',	7698,	'1981-09-28',	1250,	Null,	30),
(7698,	'BLAKE',	'MANAGER',	7839,	'1981-05-01',	2850,	1400,	30),
(7782,	'CLARK',	'MANAGER',	7839,	'1981-06-09',	2450,	Null,	10),
(7788,	'SCOTT',	'ANALYST',	7566,	'1982-12-09',	3000,	Null,	20),
(7839,	'KING',	'PRESIDENT',	Null,	'1981-11-17',	5000,	Null,	10),
(7844,	'TURNER',	'SALESMAN',	7698,	'1981-09-08',	1500,	0,	30),
(7876,	'ADAMS',	'CLERK',	7788,	'1983-01-12',	1100,	Null,	20),
(7900,	'JAMES',	'CLERK',	7698,	'1981-12-03',	950,	Null,	30),
(7902,	'FORD',	'ANALYST',	7566,	'1981-12-03',	3000,	Null,	20),
(7934,	'MILLER',	'CLERK',	7782,	'1982-01-23',	1300,	Null,	10);

create table dept_info( dept_no int, dept_name varchar(20), location varchar(20), primary key(dept_no));

insert into dept_info(dept_no,dept_name,location) values
(10,	'ACCOUNTING',	'NEWYORK'),
(20,	'RESEARCH',	'DALLAS'),
(30,	'SALES',	'CHICAGO'),
(40,	'OPERATORS',	'BOSTON');
select * from dep_info;

select * from emp_info;
-- 1
select * from emp_info where emp_name like 's____%';
-- 2
select * from emp_info where emp_name like '__r_%';
-- 3
select * from emp_info where emp_name like '%s___h%';
-- 4
select * from emp_info where month(hire_date) ='01' ;
-- 5 
select * from emp_info where date_format(hire_date, '%b') like '_a%';
-- 6
select * from emp_info where salary like '%___0';
-- 7
select * from emp_info where emp_name like '%LL%';
-- 8
select * from emp_info where year(hire_date) = '__80-%';
-- 9
select emp_name,dept_no from emp_info where dept_no!=20;
select * from Emp_info where dept_no not in (20);
-- 10
select * from emp_info where job not in ('president', 'manager') order by salary;
-- 11
select * from emp_info where year(hire_date) not in (1981);
-- 12
select emp_id,emp_name from emp_info where emp_id not like '78%';
-- 13
select emp_id ,emp_name, mgr from emp_info where emp_id in (select mgr from emp_info);
-- 14 
select emp_name,hire_date from emp_info where month(hire_date) not like '%03%';
-- 15
select * from emp_info where job ='clerk' and dept_no =20;
-- 16
select emp_name,dept_no,hire_date from emp_info where dept_no in (30,20) and hire_date like '%1981%';
-- 17
select emp_id,emp_name,job,mgr,hire_date,salary,commission from emp_info where emp_name='smith';
-- 18 
select location,emp_id ,emp_name from dept_info inner join emp_info on emp_info.dept_no = dept_info.dept_no where emp_name = 'smith';
-- 19
select emp_info.emp_id,emp_info.emp_name,emp_info.job,emp_info.mgr,emp_info.commission,emp_info.dept_no,dept_info.location,dept_info.dept_name from emp_info inner join 
dept_info on emp_info.dept_no = dept_info.dept_no where dept_name in( 'ACCOUNTING','RESEARCH') order by dept_no;
-- 20 list the empid,ename,sal,dname of the all the 'MGRS' and 'ANALYST' working in new york,dallas with an emp more than 40 years without receving the comm asc order of loc.
select emp_info.emp_id,emp_info.emp_name,emp_info.salary,dept_info.dept_name, emp_info.job,dept_info.location,emp_info.commission, timestampdiff(year,   hire_date, curdate()) as emp_exp
from emp_info inner join dept_info on emp_info.dept_no = dept_info.dept_no 
where emp_id in (select mgr from emp_info) and emp_info.job = 'ANALYST' and 
dept_info.location in('NEWYORK','DALLAS') having emp_exp >40 and commission is null order by dept_info.location asc;
-- 21 display the total information of the employee along with grades in the asc order
create table empgrade1 as select emp_id,emp_name,job, mgr,hire_date,salary, commission,dept_no, 
case
 when(salary>=800 and salary<=1300) then 5
 when(salary>=1301 and salary<=1500) then 4
 when(salary>=1501 and salary<=2100) then 3
 when(salary>=2101 and salary<=3100) then 2
 else 1
 end as grades from emp_info order by grades;
  select * from empgrade1;
  -- 22 list the emps who annual salary ranging from 22000 and 45000
  select * from emp_info where 12*salary between 22000 and 45000;
  -- 23 list the emp_id ,emp_name ,salary ,experience working for mgr 7369
  select emp_id,emp_name,mgr,salary,datediff(curdate(),hire_date)as exp from emp_info where mgr = 7698;
 
 
 






