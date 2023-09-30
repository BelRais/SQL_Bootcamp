/*
select
*
from postgres.public.person, postgres.public.pizzeria
order by person.id, pizzeria.id
*/
select
*
from postgres.public.person
cross join postgres.public.pizzeria
order by person.id, pizzeria.id
