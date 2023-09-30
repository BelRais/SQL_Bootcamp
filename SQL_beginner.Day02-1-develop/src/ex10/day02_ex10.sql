
with t_1 as (
    select distinct
        p.name,
        p2.name name2,
        p.address,
        concat(p.id, p2.id) as ww
    from person p, person p2
    where p.address = p2.address and p.name != p2.name
)

select distinct
person_name1,
person_name2,
common_address
from (
    select distinct
    a1.name person_name1,
    a2.name person_name2,
    a1.address common_address,
    a1.ww as ww1,
    a2.ww as ww2
    from t_1 a1
    join t_1 a2 on a1.address = a2.address
    ) a
where a.ww1 > a.ww2 and person_name1 != person_name2
order by person_name1, person_name2, common_address
