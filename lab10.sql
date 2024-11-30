
--first--
create table movies (
    movie_id int primary key ,
    title varchar(255) ,
    genre varchar(50) ,
    price_per_day decimal(5 , 2) ,
    available_copies int
);

insert into movies(movie_id, title, genre, price_per_day, available_copies)
values (1, 'The Matrix', 'Sci-Fi', 5.00, 8),
(2, 'Titanic', 'Romance', 3.50, 12),
(3, 'Avengers: Endgame', 'Action', 6.00, 5);
----
CREATE TABLE rentals (
    rental_id INT PRIMARY KEY,
    movie_id INT,
    customer_id INT,
    rental_date DATE,
    quantity INT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

INSERT INTO rentals (rental_id, movie_id, customer_id, rental_date, quantity) VALUES
(1, 1, 201, '2024-11-01', 2),
(2, 2, 202, '2024-11-03', 1),
(3, 3, 201, '2024-11-05', 3);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO customers (customer_id, name, email) VALUES
(201, 'Alice Johnson', 'alice.j@example.com'),
(202, 'Bob Smith', 'bob.smith@example.com');

select * from movies ;
select * from rentals ;
select * from customers ;
drop table rentals ;
drop table customers ;
drop table movies ;

--------------------
--1
start transaction ; --н-- ачало транзакции .
insert into rentals(rental_id, movie_id, customer_id, rental_date, quantity) VALUES
(4 , 1 , 201 , '2024-03-03' , 2) ;
update movies set available_copies = available_copies - 2 where movie_id = 1;
commit; --подтверждать изменение
select * from rentals ;
select * from movies ;

--2
begin ;
do $$
declare
    avaiable integer ;
begin
    select available_copies into avaiable from movies where movie_id = 3 ;
    if avaiable >= 10 then
        insert into rentals (movie_id, customer_id, rental_date, quantity) values
        (3 , 202 , current_date , 10) ;
        update movies set available_copies = available_copies - 10 where movie_id = 3;
        commit ;
    else
        rollback  ;
        raise notice 'does not work' ;
    end if;
end$$;
commit ;

--3 :

begin ;
set transaction isolation level read committed  ;
update movies set price_per_day = 2.00 where movie_id = 3 ;
select pg_sleep(10) ;
begin;

set transaction isolation level read committed  ;
select price_per_day from movies where movie_id = 3 ;
commit  ;
select price_per_day from movies where movie_id = 3 ;

--4 ;
begin ;
update customers
set email = 'merey.kaliyev@example.com' where customer_id = 201 ;
commit ;

select email from customers where customer_id = 201 ;