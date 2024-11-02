create database lab_courses ;

CREATE TABLE courses (
 course_id SERIAL PRIMARY KEY,
 course_name VARCHAR(50),
 course_code VARCHAR(10),
 credits INTEGER
);

CREATE TABLE professors (
 professor_id SERIAL PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 department VARCHAR(50)
);

CREATE TABLE students (
 student_id SERIAL PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 major VARCHAR(50),
 year_enrolled INTEGER
);

CREATE TABLE enrollments (
 enrollment_id SERIAL PRIMARY KEY,
 student_id INTEGER REFERENCES students,
 course_id INTEGER REFERENCES courses,
 professor_id INTEGER REFERENCES professors,
 enrollment_date DATE
);

INSERT INTO courses (course_name, course_code, credits)
VALUES
    ('Introduction to Computer Science', 'CS101', 3),
    ('Data Structures', 'CS102', 4),
    ('Algorithms', 'CS103', 4),
    ('Calculus', 'MATH101', 3),
    ('Linear Algebra', 'MATH102', 3),
    ('Physics', 'PHY101', 2),
    ('Philosophy', 'PHIL101', 3);

INSERT INTO professors (first_name, last_name, department)
VALUES
    ('John', 'Smith', 'Computer Science'),
    ('Alice', 'Johnson', 'Mathematics'),
    ('Robert', 'Brown', 'Physics'),
    ('Sarah', 'Davis', 'Philosophy'),
    ('David', 'Scott', 'Computer Science');

INSERT INTO students (first_name, last_name, major, year_enrolled)
VALUES
    ('Emily', 'Clark', 'Computer Science', 2020),
    ('Daniel', 'Evans', 'Mathematics', 2021),
    ('Michael', 'Wilson', 'Physics', 2019),
    ('Sophia', 'Thomas', 'Computer Science', 2022),
    ('Olivia', 'Moore', 'Philosophy', 2025),
    ('James', 'Taylor', 'Mathematics', 2025);

INSERT INTO enrollments (student_id, course_id, professor_id, enrollment_date)
VALUES
    (1, 1, 1, '2021-09-01'),
    (1, 2, 1, '2021-09-01'),
    (2, 4, 2, '2021-09-01'),
    (3, 6, 3, '2020-09-01'),
    (4, 2, 5, '2023-09-01'),
    (5, 7, 4, '2021-09-01');

select * from courses ;
select * from professors ;
select * from enrollments ;
select * from students ;

--3
select s.first_name , s.last_name , c.course_name , p.last_name from students s
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id
join professors p on p.professor_id = e.professor_id;

--4
select distinct s.first_name , s.last_name  from students s
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id
where c.credits > 3 ;
--5
    select c.course_name , count(e.student_id) from courses c
    left join enrollments e on e.course_id = c.course_id
    group by c.course_name ;
--6
select distinct p.first_name , p.last_name from professors p
join enrollments e on p.professor_id = e.professor_id ;
--7
    select distinct s.first_name , s.last_name from students s
    join enrollments e on s.student_id = e.student_id
    join professors p on e.professor_id = p.professor_id
    where p.department = 'Computer Science';
--8
select c.course_name , p.last_name , c.credits from courses c
join enrollments e on c.course_id = e.course_id
join professors p on e.professor_id = p.professor_id
where p.last_name like 'S%' ;
--9
select s.first_name , s.last_name from students s
join enrollments e on s.student_id = e.student_id
where extract(year from e.enrollment_date) > 2022 ;

--10
select c.course_name from courses c
left join enrollments e on c.course_id = e.course_id
where e.student_id is null ;