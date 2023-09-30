with t_2 as (
select
p.name,
po.order_date,
m.pizza_name
from person p
join person_order po on p.id = po.person_id
join menu m on po.menu_id = m.id
where p.gender = 'female'
)
select distinct
a.name
from t_2 a
join t_2 b on a.name = b.name and b.pizza_name = 'cheese pizza'
join t_2 c on a.name = c.name and c.pizza_name = 'pepperoni pizza'
order by a.name
