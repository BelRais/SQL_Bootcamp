select
p.name
from pizzeria p
join menu m on p.id = m.pizzeria_id and m.price < 800
join person_visits v on p.id = v.pizzeria_id and v.visit_date = '2022-01-08'
join person p2 on v.person_id = p2.id and p2.name = 'Dmitriy'