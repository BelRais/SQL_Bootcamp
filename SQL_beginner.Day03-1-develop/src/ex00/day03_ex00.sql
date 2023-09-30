select
a.pizza_name,
a.price,
p.name pizzeria_name,
pv.visit_date
from menu a
join pizzeria p on a.pizzeria_id = p.id
join person_visits pv on p.id = pv.pizzeria_id
join person p2 on pv.person_id = p2.id and p2.name = 'Kate'
where a.price between 800 and 1000
order by a.pizza_name, a.price, pizzeria_name