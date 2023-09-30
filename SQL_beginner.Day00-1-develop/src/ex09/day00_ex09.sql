/*
select
per.name as person_name,
pizz.name as pizzeria_name
from postgres.public.person_visits vis
join postgres.public.person per on vis.person_id = per.id
join postgres.public.pizzeria pizz on pizz.id = vis.pizzeria_id
where vis.visit_date between '2022-01-07' and '2022-01-09'
order by per.name, pizz.name desc
;
*/
/*
select
    (select name from postgres.public.person per where vis.person_id = per.id) as person_name,
    (select name from postgres.public.pizzeria pizz where pizz.id = vis.pizzeria_id) as pizzeria_name
from postgres.public.person_visits vis
where vis.visit_date between '2022-01-07' and '2022-01-09'
order by (select name from postgres.public.person per where vis.person_id = per.id),
         (select name from postgres.public.pizzeria pizz where pizz.id = vis.pizzeria_id) desc

*/

select
    (select name from postgres.public.person per where vis.person_id = per.id) as person_name,
    (select name from postgres.public.pizzeria pizz where pizz.id = vis.pizzeria_id) as pizzeria_name
from (select * from postgres.public.person_visits where visit_date between '2022-01-07' and '2022-01-09') vis
order by (select name from postgres.public.person per where vis.person_id = per.id),
         (select name from postgres.public.pizzeria pizz where pizz.id = vis.pizzeria_id) desc