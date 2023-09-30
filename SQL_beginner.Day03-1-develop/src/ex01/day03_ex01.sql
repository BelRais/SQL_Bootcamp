select a.id menu_id from menu a
except
select b.menu_id from person_order b
order by 1