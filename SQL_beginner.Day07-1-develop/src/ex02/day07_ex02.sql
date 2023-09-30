with t_viz as (
select
p2.name,
count(*) as count,
'visit' action_type
from person_visits p
join pizzeria p2 on p.pizzeria_id = p2.id
group by p2.name
--order by count_of_visits desc, p2.name asc
),
t_ord as (
select
p2.name,
count(*) as count,
'order' as action_type
from person_order p
join menu m on p.menu_id = m.id
join pizzeria p2 on m.pizzeria_id = p2.id
group by p2.name
)
select
*
from t_ord
union
select
*
from t_viz
order by action_type asc, count desc;

