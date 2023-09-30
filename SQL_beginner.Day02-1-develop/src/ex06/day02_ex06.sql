select
m.pizza_name,
p.name pizzeria_name
from menu m
join pizzeria p on m.pizzeria_id = p.id
join person_order po on m.id = po.menu_id
join person p2 on po.person_id = p2.id and p2.name in ('Denis', 'Anna')
order by 1, 2
