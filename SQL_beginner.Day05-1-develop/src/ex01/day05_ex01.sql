set enable_seqscan =off;

EXPLAIN ANALYZE
select
m.pizza_name,
p.name
from pizzeria p
join menu m on p.id = m.pizzeria_id
