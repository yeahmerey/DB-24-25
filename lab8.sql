--1-2 tables member , borrowings , librarians already exist in my datasource
--if u don't have this tables please create firstly ;
--3
create view librarians_in_nycity as select * from librarians where city = 'New York';
select * from librarians_in_nycity ;
--4
create view borrowing_record as select b.borrowing_id , b.borrow_date , b.return_date , m.member_name , l.name
from borrowings b join member m on b.member_id =  m.member_id
join librarians l on b.librarian_id = l.librarian_id ;

create role library_user ;
grant select on borrowing_record to library_user ;
select * from borrowing_record ;
--5
create view high_ms_level as select * from member where membership_level = (select max(membership_level) from member);
select * from high_ms_level level ;
grant select on high_ms_members to library_user ;

--6 :
create view cnt_of_each as select city , count(*) from member group by city  ;
--7 :
create view lbrs_with_multiple as select l.librarian_id , l.name , count(distinct m.member_id)
from librarians l
join member m on l.librarian_id = m.librarian_id
group by l.librarian_id, l.name having count(distinct member_id) > 1 ;
--8 :
create role intern ;
grant library_user to intern ;