create unique index idx_person_discounts_unique on person_discounts(person_id,pizzeria_id);
set enable_seqscan = off;

EXPLAIN ANALYZE
select distinct
p2.name pizzeria_name,
pd.discount
from person p
join person_order o on p.id = o.person_id
join menu m on o.menu_id = m.id
join pizzeria p2 on m.pizzeria_id = p2.id
join person_discounts pd on p.id = pd.person_id and p2.id = pd.pizzeria_id

