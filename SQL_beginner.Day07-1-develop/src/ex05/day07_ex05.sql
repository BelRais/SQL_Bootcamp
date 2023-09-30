select distinct
p2.name
from person_order p
join person p2 on p.person_id = p2.id
order by p2.name