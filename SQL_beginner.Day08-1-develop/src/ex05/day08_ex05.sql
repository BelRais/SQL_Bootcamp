
-- для 1 сессия.

begin; -- 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- 3
select sum(rating) from pizzeria; -- 5
select sum(rating) from pizzeria; -- 8
commit; -- 9
select sum(rating) from pizzeria; -- 10

-- для 2 сессия.

begin; -- 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- 4
update pizzeria set rating = 1 where name  = 'Pizza Hut'; -- 6
commit; -- 7
select sum(rating) from pizzeria; -- 11
