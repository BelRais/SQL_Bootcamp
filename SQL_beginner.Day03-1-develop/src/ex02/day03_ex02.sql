select
a.pizza_name,
a.price,
p.name pizzeria_name
from menu a
join (select a.id menu_id from menu a
except
select b.menu_id from person_order b
order by 1) aa on aa.menu_id = a.id
join pizzeria p on a.pizzeria_id = p.id
order by a.pizza_name, a.price


