
select
b.order_date,
concat(a.name,' (age:',a.age,')') person_information
from (select id as person_id, name, age from person) a
natural join person_order b
order by order_date, person_information
