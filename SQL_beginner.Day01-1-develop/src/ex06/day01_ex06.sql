
select
a.*
from (
         select distinct a.visit_date as action_date,
                         p.name     person_name
         from person_visits a,
              person_order b,
              person p
         where a.person_id = b.person_id
           and a.visit_date = b.order_date
           and a.person_id = p.id
     ) a
order by action_date, person_name desc

