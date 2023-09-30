/*
SELECT
per.name,
case
when per.name = 'Denis' then true
else false
end check_name
FROM postgres.public.person_order as ord
join postgres.public.person as per on ord.person_id = per.id
WHERE ord.menu_id IN (13, 14, 18) AND ord.order_date = '2022-01-07'
;
*/
/*
select
name,
    case
    when name = 'Denis' then true
    else false
    end check_name
from (
select
    (select name from person where person.id = person_order.person_id) as name
from person_order
where (menu_id = 13 or menu_id = 14 or menu_id = 18) AND order_date = '2022-01-07'
) a
*/
select
    (select name from person where person.id = person_order.person_id) as name,
    case
    when (select name from person where person.id = person_order.person_id) = 'Denis' then true
    else false
    end check_name
from person_order
where (menu_id = 13 or menu_id = 14 or menu_id = 18) AND order_date = '2022-01-07'
