-- Q1 - Create a table student_master with columns student_id, name, address.
-- Ans 1 - 
create table student_master (
  student_id integer primary key,
  name varchar(255),
  address varchar(255)
);

-- Q2 - Insert records into student_master table.
-- Ans 2 -
insert into
  student_master (name, address)
values
  ('John', 'USA');

insert into
  student_master (name, address)
values
  ('Raj', 'India');

insert into
  student_master (name, address)
values
  ('Peter', 'UK');

-- Q3 - Create a table student_marks with columns marks_id, student_id, marks, subject.
-- Ans 3 - 
create table student_marks (
  marks_id integer primary key autoincrement,
  student_id integer,
  marks integer,
  subject varchar(255),
  foreign key (student_id) references student_master(student_id)
);

-- Q4 - Insert records into student_marks table. -- max marks is 100 each subject
-- Ans 4 -
insert into
  student_marks (student_id, marks, subject)
values
  (1, 90, 'Maths');

insert into
  student_marks (student_id, marks, subject)
values
  (1, 40, 'Science');

insert into
  student_marks (student_id, marks, subject)
values
  (2, 70, 'Maths');

insert into
  student_marks (student_id, marks, subject)
values
  (2, 60, 'Science');

insert into
  student_marks (student_id, marks, subject)
values
  (3, 30, 'Maths');

insert into
  student_marks (student_id, marks, subject)
values
  (3, 20, 'Science');

-- Q5 - Write a query to get the name and address of the student who has scored the highest marks.
-- Ans 5 -
select
  name,
  address
from
  student_master
where
  student_id in (
    select
      student_id
    from
      student_marks
    group by
      student_id
    order by
      sum(marks) desc
    fetch first
      1 rows only
  );

-- Q6 - Write a query to get the name and address of the student who has scored the lowest marks.
-- Ans 6 -
select
  name,
  address
from
  student_master
where
  student_id in (
    select
      student_id
    from
      student_marks
    group by
      student_id
    order by
      sum(marks) asc
    fetch first
      1 rows only
  );

-- Q7 - Write a query to get the name and address of the students who has scored less marks then 40% in total.
-- Ans 7 -
select
  s.name,
  s.address
from
  student_master s
  inner join (
    select
      student_id
    from
      student_marks
    group by
      student_id
    having
      sum(marks) < 80
    order by
      sum(marks)
  ) m on s.student_id = m.student_id;

-- Q8 - Write a query to get the name and total marks of the students.
-- Ans 8 -
select
  s.student_id,
  s.name,
  m.total
from
  student_master s
  left join (
    select
      student_id,
      sum(marks) as total
    from
      student_marks
    group by
      student_id
    order by
      sum(marks)
  ) m on s.student_id = m.student_id;