--SQL PRACTICE 3 
--PRIMARY KEYS
--PATRON 
Alter table fact.PATRON
add constraint patron_pat_id_pk primary key(pat_id);

Alter table fact.patron
alter column pat_id decimal (4,0) not null;

--CHECKOUT

select * from fact.CHECKOUT;

alter table fact.checkout
add constraint checkout_book_num_pk primary key(check_num);

--BOOK
select * from fact.book;

alter table fact.book
alter column book_num int not null;

alter table fact.book
add constraint book_book_num_pk primary key(book_num);