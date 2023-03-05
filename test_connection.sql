--create table employees (
--    id int primary key,
--    name varchar(20),
--    salary int,
--    department varchar(20),
--    hir_date date
--)

--insert into employees (name, salary, department, hir_date) values ('raghu', 3600, 'management', '11/10/2022'); 
select department, name, salary
from employees
where department in (
    select department
    from employees
    group by department
    order by max(salary) desc
    fetch first
      2 rows only
  )