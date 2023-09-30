/*
select
a.*
from (
         select distinct a.visit_date as action_date,
                         a.person_id     person_id
         from person_visits a,
              person_order b
         where a.person_id = b.person_id
           and a.visit_date = b.order_date
     ) a
order by action_date, person_id desc
*/
select order_date action_date, person_id
from person_order
intersect
select visit_date action_date, person_id
from person_visits
order by action_date, person_id desc
