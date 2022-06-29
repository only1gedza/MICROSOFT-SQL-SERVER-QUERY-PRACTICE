/*SQL PRACTICE 2*/

--PROBLEM 1
CREATE SCHEMA REWARDS;

create table rewards.Committee(
Com_Num decimal(3,0) primary key,
Com_Name varchar(45) not null,
Com_Points decimal(2,0),
);


create table rewards.Roster(
Com_Num decimal(3,0) not null ,
Mem_Num int not null,
Roster_Role varchar(7),
Roster_Date date,
Roster_Multiplier decimal(10,1) default 1 ,
constraint Roster_Com_Num_pk primary key (Com_Num, Mem_Num),
constraint Roster_Com_Num_fk foreign key (Com_Num) references rewards.Committee,
constraint Roster_Mem_Num_fk foreign key (Mem_Num) references  rewards.member,
constraint Roster_Roster_Role_chk check (Roster_Role = 'CHAIR' OR Roster_Role = 'MEMBER' or Roster_Role = 'VICE'));

create table rewards.member(
Mem_Num int primary key,
Mem_FName varchar(15) not null,
Mem_LName varchar(15) not null,
Mem_Phone char(7),
);

--Problem 2
-- member table
Insert into rewards.member(Mem_Num, Mem_FName, Mem_LName, Mem_Phone) values ('1111', 'Sam', 'Waters', '1234567');
Insert into rewards.member(Mem_Num, Mem_FName, Mem_LName, Mem_Phone) values ('2222', 'Nicholas', 'Dearing', '2345678');
Insert into rewards.member(Mem_Num, Mem_FName, Mem_LName) values ('3333', 'Telly', 'Makems');
Insert into rewards.member(Mem_Num, Mem_FName, Mem_LName, Mem_Phone) values ('4444', 'Carlos', 'Arias', '4567890');

select * from REWARDS.Roster
order by com_num asc;
--Committee table
Insert into rewards.Committee(Com_Num, Com_Name, Com_Points) values ('101', 'FunRun', '2');
Insert into rewards.Committee(Com_Num, Com_Name, Com_Points) values ('102', 'DonorWall', '3');
Insert into rewards.Committee(Com_Num, Com_Name, Com_Points) values ('109', 'MealsOnWheels', '10');

--Roster Table
Insert into rewards.Roster(Com_Num, Mem_Num, Roster_Role, Roster_Date) values ('101', '3333', 'CHAIR', 'May 23,2020');
Insert into rewards.Roster(Com_Num, Mem_Num, Roster_Role, Roster_Date, Roster_Multiplier ) values ('101', '2222', 'MEMBER', 'May 28,2020', '0.8');
Insert into rewards.Roster(Com_Num, Mem_Num, Roster_Role, Roster_Date, Roster_Multiplier ) values ('102', '2222', 'CHAIR', 'June 3,2020', '2.5');
Insert into rewards.Roster(Com_Num, Mem_Num, Roster_Role, Roster_Date ) values ('102', '4444', 'MEMBER', 'May 11,2020');
Insert into rewards.Roster(Com_Num, Mem_Num, Roster_Role, Roster_Date, Roster_Multiplier ) values ('109', '4444', 'MEMBER', 'May 23,2020', '1.5');
Insert into rewards.Roster(Com_Num, Mem_Num, Roster_Role, Roster_Date, Roster_Multiplier ) values ('109', '1111','VICE', 'June 1,2020', '1.5');
--Drop Table 
Drop Table rewards.Roster;


--problem 3 to 10
begin tran mytransaction;
update rewards.member
set mem_phone = '5678901'
where mem_num = 4444;

Delete from rewards.roster
where mem_num = 2222 and com_num = 102;

update rewards.roster
set roster_date = 'April 10, 2020'
where mem_num = 3333 and com_num = 101;

alter table rewards.roster
add constraint roster_multplier_chk check (roster_multiplier > 0 or roster_multiplier >3);

update rewards.roster
set roster_multiplier = '1.8'
where mem_num = 2222 and com_num = 101;

update rewards.Committee
set Com_Points = '5'
where Com_Num = 109;

commit tran mytransaction;

--problem 11 - 15
select * from rewards.Committee;
delete REWARDS.roster
where roster_role = 'member' and com_num = 109;

delete rewards.Committee
where com_num = 109;

rollback tran mytrans;

begin tran mytran2;

update rewards.Committee
set Com_Points += '2';

rollback tran mytran2;








