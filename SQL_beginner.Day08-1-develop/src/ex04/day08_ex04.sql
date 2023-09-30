
-- для 1 сессия.

begin; -- 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- 3
select * from pizzeria where name  = 'Pizza Hut'; -- 5
select * from pizzeria where name  = 'Pizza Hut'; -- 8
commit; -- 9
select * from pizzeria where name  = 'Pizza Hut'; -- 10

-- для 2 сессия.

begin; -- 2
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- 4
update pizzeria set rating = 3.0 where name  = 'Pizza Hut'; -- 6
commit; -- 7
select * from pizzeria where name  = 'Pizza Hut'; -- 11

-- Тут на 1 сессии не будут видны изменения сделанные на 2 сессии, пока не сделаем commit. Самый высокий уровень изоляции.

