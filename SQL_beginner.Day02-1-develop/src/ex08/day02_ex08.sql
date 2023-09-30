select
p.name
from person p
join person_order po on p.id = po.person_id
join menu m on po.menu_id = m.id and m.pizza_name in ('pepperoni pizza', 'mushroom pizza')
where p.gender = 'male' and p.address in ('Moscow', 'Samara')
order by p.name desc
