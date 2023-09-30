
-- для 1 сессия.

begin;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
select * from pizzeria where name  = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';
commit;

select * from pizzeria where name  = 'Pizza Hut';

-- для 2 сессия.

begin;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
update pizzeria set rating = 3.6 where name  = 'Pizza Hut';
commit;

select * from pizzeria where name  = 'Pizza Hut';

