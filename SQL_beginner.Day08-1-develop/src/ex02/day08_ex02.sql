
-- для 1 сессия.

begin;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
select * from pizzeria where name  = 'Pizza Hut';
update pizzeria set rating = 4 where name  = 'Pizza Hut';
commit; -- тут на 2 сессии будет ошибка.
select * from pizzeria where name  = 'Pizza Hut';

-- для 2 сессия.

begin;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
select * from pizzeria where name  = 'Pizza Hut';
update pizzeria set rating = 3.6 where name  = 'Pizza Hut';
commit; -- после этого будет ролбэк
select * from pizzeria where name  = 'Pizza Hut';


-- тут возникает ошибка из-за уровнял изоляции REPEATABLE READ
-- Так как ранее мы видели, что применялся последний update, данная изоляция позволяет избежать неприятных ситуаций в бд
-- во время обновления данных.