/*1*/
create database lab1; 
/*2*/
create table clients( 
    client_id serial , 
    first_name varchar(60) ,
    last_name varchar(60) ,
    email varchar(100) ,
    date_joined date 
    );
/*3*/
alter table clients add "status" integer ;
 /*4*/
alter table clients alter column status type boolean using status::boolean ;
 /*5*/
alter table clients alter column status set default true ; 
/*6*/ 
alter table clients add primary key(client_id) ; 
/*7*/ 
create table orders( 
    order_id serial , 
    order_name varchar(100) , 
    clients_id int references clients(client_id) 
    ); 
/*8*/
drop table orders ; 
/*9*/ 
drop database lab1 ;