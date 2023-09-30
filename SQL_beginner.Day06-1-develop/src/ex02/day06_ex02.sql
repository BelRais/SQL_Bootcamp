select
p.name,
m.pizza_name,
m.price,
(m.price - (m.price * pd.discount / 100.0)) as discount_price,
p2.name pizzeria_name
from person p
join person_order o on p.id = o.person_id
join menu m on o.menu_id = m.id
join pizzeria p2 on m.pizzeria_id = p2.id
join person_discounts pd on p.id = pd.person_id and p2.id = pd.pizzeria_id
order by name asc, pizza_name asc
;
/*
select
*
from person_discounts
*/
