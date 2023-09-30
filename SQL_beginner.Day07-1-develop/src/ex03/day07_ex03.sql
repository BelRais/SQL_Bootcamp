with t_viz as (
select
p2.name,
count(*) as count
from person_visits p
join pizzeria p2 on p.pizzeria_id = p2.id
group by p2.name
--order by count_of_visits desc, p2.name asc
),
t_ord as (
select
p2.name,
count(*) as count
from person_order p
join menu m on p.menu_id = m.id
join pizzeria p2 on m.pizzeria_id = p2.id
group by p2.name
),
t_sum as (
select
name,
sum(a.count) as total_count
from (
select
*
from t_ord
union all
select
*
from t_viz
) a
group by name

)

select
p.name,
case when t.total_count is NULL then 0
else t.total_count
end total_count
from pizzeria p
left join t_sum t on t.name = p.name
order by total_count desc, name asc;
