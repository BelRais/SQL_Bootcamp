create view v_price_with_discount as
select
p.name,
m.pizza_name,
m.price,
round(m.price - m.price * 0.1) discount_price
from person p
join person_order pv on p.id = pv.person_id
join menu m on pv.menu_id = m.id
order by p.name, pizza_name