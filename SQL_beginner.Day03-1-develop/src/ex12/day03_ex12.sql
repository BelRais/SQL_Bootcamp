insert into person_order
select
generate_series(max(id) + 1, max(id) + (select count(*) from (select generate_series(1, max(id)) from person) as a)) a1,
generate_series(1, (select max(id) from person)) as a2,
(select id from menu where pizza_name = 'greek pizza') as a3,
'2022-02-25' as a4
from person_order