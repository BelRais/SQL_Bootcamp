


-- для сессии 1:
/*
begin; -- открываем паралельную сессию
SHOW TRANSACTION ISOLATION LEVEL; -- смотрим
select * from pizzeria where name  = 'Pizza Hut'; -- смотрим
update pizzeria set rating = 4 where name  = 'Pizza Hut'; -- Запускаем обновление
commit; -- коммитим
select * from pizzeria where name  = 'Pizza Hut';
-- для сессии 2:
begin; -- открываем паралельную сессию
SHOW TRANSACTION ISOLATION LEVEL; -- смотрим
select * from pizzeria where name  = 'Pizza Hut'; -- смотрим
update pizzeria set rating = 3.6 where name  = 'Pizza Hut'; -- Запускаем обновление, тут он будет ждать, пока поле будет разблокировано
commit; -- коммитим
select * from pizzeria where name  = 'Pizza Hut';

*/