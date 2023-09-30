
-- для 1 сессия.

begin; -- 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- 3
select sum(rating) from pizzeria; -- 5
select sum(rating) from pizzeria; -- 8
commit; -- 9
select sum(rating) from pizzeria; -- 10

-- для 2 сессия.

begin; -- 2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- 4
update pizzeria set rating = 5 where name  = 'Pizza Hut'; -- 6
commit; -- 7
select sum(rating) from pizzeria; -- 11


-- тут мы видим, что в отличии от 05 задания с изоляцией READ COMMITTED, при REPEATABLE READ, новые значения будут видны после
-- применения коммита.
