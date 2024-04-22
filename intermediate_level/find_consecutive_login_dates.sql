-- Find consecutive login dates ,when an employee came to office 
create table employee_login
(
	emp_id int,
	login_date date
);

insert into employee_login 
values (1,'2022-01-09'),
(1,'2022-01-10'),
(1,'2022-01-11'),
(1,'2022-01-18'),
(1,'2022-01-19'),
(1,'2022-01-20'),
(1,'2022-01-21'),
(2,'2022-02-09'),
(2,'2022-02-10'),
(2,'2022-03-11'),
(3,'2022-03-18'),
(3,'2022-03-19'),
(3,'2022-04-20'),
(3,'2022-04-21');

select * from employee_login;

with cte1 as (
	select emp_id,login_date,
		rank() over(partition by emp_id order by login_date) as rnk
	from employee_login el 
), cte2 as (
	select emp_id,login_date,rnk,
		login_date - interval '1 DAY'*rnk as date_groups
	from cte1
) 
select emp_id,min(login_date) as start_date,max(login_date) as end_date,
	max(login_date)-min(login_date)+1 as interval_days
from cte2
group by emp_id,date_groups
having max(login_date)<>min(login_date)
order by emp_id;

-- Answer 
/* 

"emp_id","start_date","end_date","interval_days"
1,2022-01-09,2022-01-11,3
1,2022-01-18,2022-01-21,4
2,2022-02-09,2022-02-10,2
3,2022-03-18,2022-03-19,2
3,2022-04-20,2022-04-21,2

*/
