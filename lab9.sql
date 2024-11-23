---exercise 1 :
CREATE TABLE Reviewer (
    reviewerID INT PRIMARY KEY,
    name VARCHAR(50)
);
INSERT INTO Reviewer (reviewerID, name) VALUES
(301, 'Alex Johnson'),
(302, 'Maria Gomez'),
(303, 'John Doe'),
(304, 'Linda Brown'),
(305, 'Michael Thompson'),
(306, 'Emily Davis'),
(307, 'Daniel White'),
(308, 'Sophia Lee');
--------------------------------
CREATE TABLE Review (
    reviewerID INT,
    movieID INT,
    rating INT,
    reviewDate DATE,
    PRIMARY KEY (reviewerID, movieID),
    FOREIGN KEY (reviewerID) REFERENCES Reviewer(reviewerID)
);
INSERT INTO Review (reviewerID, movieID, rating, reviewDate) VALUES
(301, 401, 5, '2024-02-15'),
(301, 402, 4, '2024-02-20'),
(302, 403, 5, '2024-01-11'),
(303, 404, 3, '2024-01-23'),
(304, 405, 4, '2024-01-15'),
(305, 406, 2, '2024-03-01'),
(306, 407, 5, '2024-02-05'),
(307, 408, 4, '2024-03-12');
------------------------------
CREATE TABLE Movie (
    movieID INT PRIMARY KEY,
    title VARCHAR(100),
    releaseYear INT,
    director VARCHAR(100)
);
INSERT INTO Movie (movieID, title, releaseYear, director) VALUES
(401, 'Future World', 2024, 'Alice Smith'),
(402, 'The Last Adventure', 2024, 'John Black'),
(403, 'New Horizons', 2024, 'Maria Johnson'),
(404, 'Time Capsule', 2024, 'Chris Martin'),
(405, 'Beyond the Stars', 2024, NULL),
(406, 'The Silent Valley', 2024, 'Laura Green'),
(407, 'Lost in the Echo', 2024, 'Daniel White'),
(408, 'Shadow of Destiny', 2024, 'James Clarke');

select * from reviewer ;
select * from review ;
select * from movie ;

--exercise 2 :
create view higherUniqueYear as select distinct m.releaseYear from movie m
join review r on r.movieID = m.movieID where r.rating >= 4 order by m.releaseYear ;
--exercise 3 :
--we can use for join , where , order by
create index index_review_movieID on review(movieID) ;
create index index_movie_releaseYear on movie(releaseYear) ;
create index index_review_rating on review(rating) ;
--exercise 4 :
create role admin_company with login createrole password '1234' ;
--exercise 5 :
grant connect on database postgres to admin_company ; --права на подключение к базе данных.
grant usage on schema public to admin_company ; --разрешает использование схемы public
grant select, insert , update , delete on all tables in schema public to admin_company ;
grant all privileges on all sequences in schema public to admin_company ;
grant execute on all functions in schema public to admin_company ;
grant create on schema public to admin_company;
--exercise 6 :
alter table review owner to admin_company ;
alter table reviewer owner to admin_company ;
alter table movie owner to admin_company ;
--exercise 7 :
create view topMovies2024 as select m.title , rr.name from movie m
join review r on r.movieID = m.movieID
join reviewer rr on r.reviewerID = rr.reviewerID
where r.rating = 5 and extract(year from r.reviewdate) = 2024
order by m.title ;




