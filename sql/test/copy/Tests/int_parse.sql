create table t_int(i int);

-- If a numeric is enclosed as string we have to be careful
-- It seems that convention is to check for it, turning
-- the example below into one null value added to the table.
copy 1 records into t_int from stdin USING DELIMITERS ',','\n','\"' NULL AS '';
""

select * from t_int;

-- A decimal value entered at a place where we expect an int
-- should be recognized. It is the residu of dumping an int
-- as decimal.
copy 2 records into t_int from stdin USING DELIMITERS ',','\n','\"' NULL AS '';
3.00
-4.0000

select * from t_int;
select * from sys.rejects;
call sys.clearrejects();

copy 1 records into t_int from stdin USING DELIMITERS ',','\n','\"' NULL AS '';
5.1

select * from t_int;
select * from sys.rejects;
call sys.clearrejects();

copy 5 records into t_int from stdin delimiters ',','\n' NULL as '';
1
nil

null
abc

select * from t_int;
select * from sys.rejects;
call sys.clearrejects();

drop table t_int;
