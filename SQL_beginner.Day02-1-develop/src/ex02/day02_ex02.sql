with t_1 as (
select
generate_series(cast('2022-01-01' as date), cast('2022-01-03' as date),'1 day') days
)
select
case
when b.name is NULL then '-'
else b.name
end as person_name,
a.visit_date visit_date,
case
when c.name is NULL then '-'
else c.name
end pizzeria_name
from postgres.public.person_visits a
join t_1 on t_1.days = a.visit_date
full join postgres.public.person b on a.person_id = b.id
full join postgres.public.pizzeria c on a.pizzeria_id = c.id
order by person_name,
a.visit_date,
pizzeria_name


