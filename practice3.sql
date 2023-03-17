-- Table Creation
create table workers (
  id serial primary key,
  first_name varchar(30),
  last_name varchar(30),
  salary int,
  department varchar(30),
  join_date date,
  designation varchar(30)
) 

-- Insertion of Data
insert into
  workers (
    first_name,
    last_name,
    salary,
    department,
    join_date,
    designation
  )
values
  (
    'Vaibhav',
    'Agarwal',
    400000,
    'Dev',
    '2021-12-01',
    'Frontend'
  ),
  (
    'Rahul',
    'Singh',
    90000,
    'Management',
    '2022-02-15',
    'Manager'
  ),
  (
    'Vipul',
    'Yadav',
    800000,
    'Marketing',
    '2010-01-01',
    'Graphic Designer'
  ),
  (
    'Ganesh',
    'Satish',
    1200000,
    'Admin',
    '2022-02-15',
    'CEO'
  ),
  (
    'Manvik',
    'Mishra',
    50000,
    'Dev',
    '2022-02-15',
    'SEO Expert'
  )

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from workers order by first_name asc;

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from workers order by first_name asc, department desc;

-- Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from workers where first_name in ('Vipul', 'Satish');

-- Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from workers where first_name not in ('Vipul', 'Satish');

-- Write an SQL query to print details of the Workers whose first names ends with ‘a’.
select * from workers where first_name like '%a';

-- Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from workers where first_name like '%a%';

-- Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from workers where department = 'Admin';

-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from workers where salary between 100000 and 500000;

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from workers where first_name like '_____h';

-- Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) as admins_count from workers where department = 'Admin';

-- Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from workers where join_date between '2014-02-01' and '2014-02-28';

-- Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select first_name, last_name, salary from workers where salary between 50000 and 100000;

-- Write an SQL query to fetch the no. of workers for each department in the descending order.
select department, count(*) as employee_count from workers group by department order by count(*) desc;

-- Write an SQL query to print details of the Workers who are also Managers.
select * from workers where designation = 'Manager';

-- Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select first_name, last_name, salary, department, join_date, designation from workers where department in (select department from workers group by first_name having count(*) > 1);

-- Write an SQL query to show only odd rows from a table.
select * from workers where id % 2 = 1;

-- Write an SQL query to show records from one table that another table does not have.
select * from workers where first_name not in (select first_name from workers where department = 'Dev');

-- Write an SQL query to clone a new table from another table.
create table workers_clone as select * from workers;

-- Write an SQL query to show only even rows from a table.
select * from workers where employee_id % 2 = 0;

-- Write an SQL query to show the current date and time.
select now() as current_date_time;

-- Write an SQL query to show the top n (say 10) records of a table.
select * from workers limit 10;

-- Write an SQL query to determine the nth (say n=5) highest salary from a table.
select salary from workers order by salary desc limit 1 offset 4;

-- Write an SQL query to calculate the bonus of each employee. The bonus of an employee is 100% of their salary if the ID of the employee is an odd number and the employee name does not start with the character 'M'. The bonus of an employee is 0 otherwise.Return the result table ordered by employee_id.
select id, first_name, last_name, salary, case when id % 2 = 1 and first_name not like 'M%' then salary * 2 else 0 end as bonus from workers order by id;
