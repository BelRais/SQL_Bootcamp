select
p3.address,
p2.name,
count(*) count_of_orders
from person_order p
join menu m on p.menu_id = m.id
join pizzeria p2 on m.pizzeria_id = p2.id
join person p3 on p.person_id = p3.id
group by p3.address,
p2.name
order by p3.address, p2.name, count_of_orders