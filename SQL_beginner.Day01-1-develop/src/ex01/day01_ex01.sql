select
object_name
from (
    select
    name object_name
    from postgres.public.person
    order by object_name
) a
union all
(
select
pizza_name
from postgres.public.menu
order by pizza_name
)
