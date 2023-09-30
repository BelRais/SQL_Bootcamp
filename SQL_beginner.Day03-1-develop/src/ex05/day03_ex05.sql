/*
select distinct
p2.name
from person p
join person_visits pv on p.id = pv.person_id
join person_order po on p.id = po.person_id and pv.visit_date != po.order_date
join pizzeria p2 on pv.pizzeria_id = p2.id
where p.name = 'Andrey'
*/
select a.name pizzeria_name
from pizzeria a
inner join person_visits b on a.id = b.pizzeria_id
inner join person c on c.id = b.person_id
where c.name = 'Andrey'
except all
select a.name pizzeria_name
from pizzeria a
inner join menu b on b.pizzeria_id = a.id
inner join person_order c on c.menu_id = b.id
inner join person p on p.id = c.person_id
where p.name = 'Andrey'