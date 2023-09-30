select
a.order_date,
concat(b.name,' (age:',b.age,')') person_information
from person_order a
join person b on a.person_id = b.id
order by order_date, person_information