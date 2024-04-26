
create table employees
(
	emp_id int,
	emp_name varchar(30),
	emp_dept_id int
);

create table department
(
	dept_id int,
	dept_name varchar(30)
);

insert into employees 
values (100,'raju',11),
(200,'ramesh',12),
(300,'andy',13),
(400,'pawan',13),
(500,'nitin',11),
(600,'rahul',12),
(700,'amit',19);

insert into department 
values (11,'Sales'),
(12,'Manufacturing'),
(13,'HR'),
(17,'R&D');


CREATE TABLE emp_records(employee_id 
INT , employee_name VARCHAR(50), manager_id INT);

INSERT INTO emp_records (employee_id, employee_name, manager_id)
VALUES  (1, 'Zaid', 3),  (2, 'Rahul', 3),  (3, 'Raman', 4),  
(4, 'Kamran', NULL),  (5, 'Farhan', 4);



select a.emp_name , b.dept_name
from employees a left join department b 
on a.emp_dept_id = b.dept_id 

select a.emp_name , b.dept_name
from employees a right join department b 
on a.emp_dept_id = b.dept_id 

-- full join 

select a.emp_name , b.dept_name
from employees a full join department b 
on a.emp_dept_id = b.dept_id 

-- full join using left / right join 

select a.emp_name , b.dept_name
from employees a left join department b 
on a.emp_dept_id = b.dept_id 
union 
select a.emp_name , b.dept_name
from employees a right join department b 
on a.emp_dept_id = b.dept_id 

-- inner join 

select a.emp_name , b.dept_name
from employees a inner join department b 
on a.emp_dept_id = b.dept_id 

-- inner join using left join 

select a.emp_name , b.dept_name
from employees a left join department b 
on a.emp_dept_id = b.dept_id 
where b.dept_name is not null

-- self join 

select b.employee_name employee , a.employee_name manager
from emp_records a
join emp_records b 
on a.employee_id = b.manager_id


