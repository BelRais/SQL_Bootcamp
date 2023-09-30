select
cast(t_1.days as date) missing_date
from postgres.public.person_visits a
join (select
generate_series(1,2) as id) t_2 on a.person_id = t_2.id
right join (select
generate_series(cast('2022-01-01' as date), cast('2022-01-10' as date),'1 day') days) t_1 on a.visit_date = t_1.days
where a.visit_date is NULL
