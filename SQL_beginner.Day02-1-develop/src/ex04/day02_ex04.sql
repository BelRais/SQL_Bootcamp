select
m.pizza_name,
a.name pizzeria_name,
m.price
from pizzeria a
join menu m on a.id = m.pizzeria_id and m.pizza_name in ('mushroom pizza', 'pepperoni pizza')
order by m.pizza_name, pizzeria_name