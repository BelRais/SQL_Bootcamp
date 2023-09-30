with t as (
select
p.gender,
p2.name pizzeria_name,
count(*) co
from person_visits a
join person p on a.person_id = p.id
join pizzeria p2 on a.pizzeria_id = p2.id
group by p.gender, p2.name
order by pizzeria_name
)

select distinct
pizzeria_name
from (
select
*,
case
when gender = 'female' and (select co from t as t2 where t.pizzeria_name = t2.pizzeria_name and t2.gender = 'male') = co then 'error'
when gender = 'male' and (select co from t as t2 where t.pizzeria_name = t2.pizzeria_name and t2.gender = 'female') = co then 'error'
else 'that!'
end as qq
from t
) a where qq = 'that!'
order by pizzeria_name

