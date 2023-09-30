select
id object_id,
pizza_name object_name
from postgres.public.menu
union all
select
id,
name
from postgres.public.person
order by object_id, object_name


