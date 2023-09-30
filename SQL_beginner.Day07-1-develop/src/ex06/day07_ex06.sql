select distinct
p.name,
count(*) over (partition by p.name) count_of_orders,
round(avg(m.price) over (partition by p.name),2) average_price,
max(m.price) over (partition by p.name) max_price,
min(m.price) over (partition by p.name) min_price
from person_order o
join menu m on o.menu_id = m.id
join pizzeria p on m.pizzeria_id = p.id
order by p.name asc;