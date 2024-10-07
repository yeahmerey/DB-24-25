--1
create database lab1;
--2 (DONE)
--3
select last_name from students ;
--4
select distinct last_name from students ;
--5
select * from students where last_name = 'Johnson' ;
--6
select * from students where last_name = 'Johnson' or last_name = 'Smith' ;
--7
select * from students where student_id in (
    select student_id from registration where course_id = (select course_id from courses where course_code = 'CS101')
    );
--8
select * from students where student_id in (
    select student_id from registration where course_id in (select course_id from courses where course_code in ('MATH201' , 'PHYS301'))
    );
--9
select sum(credits) as total_sum from courses ;
--10
select course_id , count(*) as cnt_of_students from registration group by course_id  ;
--11
select course_id from registration group by course_id having count(*) > 2 ;
--12
select course_name from courses order by credits DESC offset 1 limit 1 ;
--13
select first_name , last_name from students where student_id in ( select student_id from registration where course_id = (select course_id from courses order by credits limit 1));
--14
select first_name , last_name from students where city = 'Almaty' ;
--15
select * from courses where credits > 3 order by credits ASC , course_id DESC;
--16
update courses set credits = credits - 1 where credits = (SELECT MIN(credits) from courses) ;
--17
update registration
set course_id = (select course_id from courses where course_code = 'CS101')
where course_id = (select course_id from courses where course_code = 'MATH201');
--18
delete from students where student_id in (select student_id from registration where course_id = (select course_id from courses where course_code = 'CS101'));
--19
delete from students ;