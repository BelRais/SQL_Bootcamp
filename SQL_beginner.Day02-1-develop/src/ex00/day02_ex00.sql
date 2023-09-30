select
a.name
from postgres.public.pizzeria a
left join postgres.public.person_visits b on a.id = b.pizzeria_id
where b.pizzeria_id is NULL