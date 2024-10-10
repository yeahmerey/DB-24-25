--1
create database lab4 ;
--2
create table Warehouses(
    code int ,
    location varchar(255) ,
    capacity int
);
create table Boxes(
    code char(4) ,
    contents varchar(255),
    value real ,
    warehouse int
);
--3 -- DONE
INSERT INTO Warehouses(code, location, capacity) VALUES(1, 'Chicago', 3);
INSERT INTO Warehouses(code, location, capacity) VALUES(2, 'Rocks', 4);
INSERT INTO Warehouses(code, location, capacity) VALUES(3, 'New York', 7);
INSERT INTO Warehouses(code, location, capacity) VALUES(4, 'Los Angeles', 2);
INSERT INTO Warehouses(code, location, capacity) VALUES(5, 'San Francisko', 8);

INSERT INTO Boxes(code, contents, value, warehouse) VALUES ('0MN7', 'Rocks', 180, 3);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES ('4H8P', 'Rocks', 250, 1);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES ('4RT3', 'Scissors', 190, 4);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES ('7G3H', 'Rocks', 200, 1);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES ('8JN6', 'Papers', 75, 1);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES ('8Y6U', 'Papers', 50, 3);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES ('9J6F', 'Papers', 175, 2);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES ('LL08', 'Rocks', 140, 4);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES ('P0H6', 'Scissors', 125, 1);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES ('P2T6', 'Scissors', 150, 2);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES ('TUSS', 'Papers', 90, 5);
--4
select * from warehouses ;
--5
select * from boxes where value > 150 ;
--6
select distinct on(contents) * from boxes ;
--7
select warehouse , count(*) from boxes group by warehouse;
--8
select warehouse , count(*) from boxes group by warehouse having count(*) > 2 ;
--9
insert into Warehouses Values (6, 'New York', 3) ;
--10
insert into Boxes values ('H5RT', 'Papers', 200 , 2);
--11
update boxes set value = value * 0.85 where value = (select value from boxes order by value desc offset 2 limit 1 );
--12
delete from Boxes where value < 150 ;
--13
delete from boxes using warehouses where warehouse = warehouses.code and warehouses.location = 'New York' returning * ;
