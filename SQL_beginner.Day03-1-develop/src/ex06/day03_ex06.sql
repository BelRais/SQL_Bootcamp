with t_main as (
select
m.pizza_name Pizza_name,
p.name pizzeria_name_1,
m.price
from menu m
join pizzeria p on m.pizzeria_id = p.id
)
select
a1.Pizza_name,
a1.pizzeria_name_1,
a2.pizzeria_name_1 pizzeria_name_2,
a1.price
from t_main a1
join t_main a2 on a1.Pizza_name = a2.Pizza_name and a1.pizzeria_name_1 < a2.pizzeria_name_1 and a1.price = a2.price
order by a1.Pizza_name