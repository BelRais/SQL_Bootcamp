with t as (
select
p.gender,
p2.name pizzeria_name,
count(*) co
from person_order a
join person p on a.person_id = p.id
join menu m on a.menu_id = m.id
join pizzeria p2 on m.pizzeria_id = p2.id
group by p.gender, p2.name
order by pizzeria_name
), t_main as (
select
*,
case
when gender = 'female' and (select co from t as t2 where t.pizzeria_name = t2.pizzeria_name and t2.gender = 'male') > 0 then 'error_for_female'
when gender = 'male' and (select co from t as t2 where t.pizzeria_name = t2.pizzeria_name and t2.gender = 'female') > 0 then 'error_for_male'
else 'that!'
end as qq
from t
),
t_female as (
    select
    pizzeria_name
    from t_main
    where gender = 'female' and qq = 'that!'
),
t_male as (
    select
    pizzeria_name
    from t_main
    where gender = 'male' and qq = 'that!'
)
select
*
from t_female
union
select
*
from t_male
order by 1