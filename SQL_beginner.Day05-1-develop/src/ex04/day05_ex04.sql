create unique index idx_menu_unique on menu(pizzeria_id, pizza_name);
set enable_seqscan = off;

EXPLAIN ANALYZE
SELECT *
FROM menu
WHERE pizzeria_id = 3