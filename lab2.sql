--1
create database lab_2 ;
--2
create table employees(
    employee_id serial primary key ,
    first_name varchar(30) ,
    last_name varchar(30) ,
    department_id int ,
    salary int
);
--3
insert into employees (first_name, last_name, department_id, salary)
values('Merey' , 'Kaliyev' , 012 , 2000000) ;
--4
insert into employees (first_name, last_name) values ('Miras' , 'Kazbaganbetov') ;
--5
insert into employees(first_name, last_name, department_id, salary)
values ('Alisher' , 'Aldamzharov' , NULL , 200000) ;
--6
insert into employees(first_name, last_name, department_id, salary)
values ('Suliman' , 'Almaganbetov' , 014 , 2500000) ,
       ('Aslanbek' , 'Amankeldi' , 015 , 4568987) ,
       ('Dias' , 'Kaliyev' , 056 , 8658704) ,
       ('Amir' , 'Kaliyev' , 089 , 2784716) ,
       ('Jaksybek' , 'Kaliyev' , 01 , 4556376) ;
--7
alter table employees alter column first_name set default 'John' ;
--8
insert into employees(last_name, department_id, salary)
values ('Askarov' ,87 , 127462 ),
       ('Donji',  88 , 343434) ,
       ('Kelma' , 93 , 329480) ;
--9
insert  into employees default values ;
--10
create table employees_archive (LIKE employees INCLUDING ALL) ;
--11
insert into employees_archive select * from employees ;
--12
update employees set department_id  = 1 where department_id is NULL ;
--13
update employees set salary = salary * 1.15 returning
first_name , last_name , salary AS "Updated Salary" ;
--14
delete from employees where salary < 50000 ;
--15
delete from employees_archive where employee_id IN (SELECT employee_id from employees) returning * ;
--16
delete from employees returning * ;

