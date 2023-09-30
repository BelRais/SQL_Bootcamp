/*
select
pizza_name
from
(
select
row_number() over (partition by pizza_name order by pizza_name desc) as rows,
pizza_name
from postgres.public.menu
) a
where rows = 1
order by pizza_name desc
*/

select
pizza_name
from postgres.public.menu
union
select
pizza_name
from postgres.public.menu
order by pizza_name desc