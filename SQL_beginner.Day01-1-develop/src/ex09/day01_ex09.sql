select
a.name
from postgres.public.pizzeria a
where a.id not in (select pizzeria_id from postgres.public.person_visits)
;

select
a.name
from postgres.public.pizzeria a
where NOT EXISTS (select pizzeria_id from postgres.public.person_visits b where a.id = b.pizzeria_id)
;
