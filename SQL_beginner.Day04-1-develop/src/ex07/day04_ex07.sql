insert into person_visits
select
max(id) + 1 as a1,
(select id from person where name = 'Dmitriy') as a2,
(select p.id from pizzeria p join menu m on p.id = m.pizzeria_id and m.price < 800 and p.name != 'Papa Johns' where p.name = 'DoDo Pizza') as a3,
'2022-01-08' as a4
from person_visits
;

refresh materialized view mv_dmitriy_visits_and_eats
/*
select
*
from mv_dmitriy_visits_and_eats
*/
