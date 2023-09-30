select
a.name person_name,
b.pizza_name pizza_name,
c.name pizzeria_name
from postgres.public.person a
join postgres.public.person_order aa on a.id = aa.person_id
join postgres.public.menu b on b.id = aa.menu_id
join postgres.public.pizzeria c on b.pizzeria_id = c.id
order by person_name, pizza_name, pizzeria_name


