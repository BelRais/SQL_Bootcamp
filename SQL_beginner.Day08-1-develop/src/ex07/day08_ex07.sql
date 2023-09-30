
-- для 1 сессия.

begin; -- 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- 3
update pizzeria set rating = 1.1 where id = 1; -- 5

select * from pizzeria where id = 1; --- 5.1

update pizzeria set rating = 1.1 where id = 2; -- 7
commit; -- 9
select * from pizzeria where id = 1; -- 11
select * from pizzeria where id = 2; -- 12

-- для 2 сессия.

begin; -- 2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- 4
update pizzeria set rating = 2.2 where id = 2; -- 6

select * from pizzeria where id = 2; --- 6.1

update pizzeria set rating = 2.2 where id = 1; -- 8
commit; -- 10
select * from pizzeria where id = 1; -- 13
select * from pizzeria where id = 2; -- 14




