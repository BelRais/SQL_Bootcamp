select
p2.name,
count(*) as count_of_visits
from person_visits p
join person p2 on p.person_id = p2.id
group by p2.name
order by count_of_visits desc, p2.name asc
limit 4;