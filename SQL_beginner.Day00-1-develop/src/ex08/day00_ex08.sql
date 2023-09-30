select
*
from postgres.public.person_order
where mod(id, 2) = 0
order by id