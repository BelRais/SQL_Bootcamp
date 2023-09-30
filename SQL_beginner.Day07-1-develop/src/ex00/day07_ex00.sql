select
person_id,
count(*) as count_of_visits
from person_visits
group by person_id
order by count_of_visits desc, person_id asc;

/*
select distinct
person_id,
count(*) over (partition by person_id) as count_of_visits
from person_visits
order by count_of_visits desc, person_id
*/
