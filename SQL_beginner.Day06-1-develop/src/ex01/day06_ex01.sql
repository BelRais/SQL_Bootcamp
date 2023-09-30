with t_dis as (
select
*,
case
when cow = 1 then 10.5
when cow = 2 then 22
else 30
end as zaliv
from (
select distinct
m.pizzeria_id,
p.person_id,
count(*) over (partition by p.person_id, m.pizzeria_id) as cow
from person_order p
join menu m on m.id = p.menu_id
) a
)
insert into person_discounts
select
row_number() over (order by person_id, pizzeria_id) as id,
person_id,
pizzeria_id,
zaliv
from t_dis
;
