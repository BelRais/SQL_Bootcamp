/*
SELECT
per.name
FROM postgres.public.person_order as ord
join postgres.public.person as per on ord.person_id = per.id
WHERE ord.order_date = '2022-01-07'
and (ord.menu_id = 13 or ord.menu_id = 14 or ord.menu_id = 18)
;


select
per.name
from person per, person_order ord
where ord.person_id = per.id and ord.menu_id IN (13, 14, 18) AND ord.order_date = '2022-01-07'
;
*/

select
    (select name from person where person.id = person_order.person_id) as name
from person_order
where (menu_id = 13 or menu_id = 14 or menu_id = 18) AND order_date = '2022-01-07'
