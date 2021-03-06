create table sub1 (i int);
create table sub2 (i int);
create merge table mt as select * from sub1 with no data;
alter table mt add table sub1;
alter table mt add table sub2;
insert into sub1 values (1),(2);
insert into sub2 values (11),(12);
alter table sub1 set read only;
alter table sub2 set read only;
analyze sys.sub1;
analyze sys.sub2;
select count(*) from mt where i >= 5 and i < 100;
plan select count(*) from mt where i >= 5 and i < 100;
alter table sub1 set read write;
insert into sub1 values (7),(8);
alter table sub1 set read only;
analyze sys.sub1;
select count(*) from mt where i >= 5 and i < 100;
plan select count(*) from mt where i >= 5 and i < 100;

drop table mt;
drop table sub1;
drop table sub2;
