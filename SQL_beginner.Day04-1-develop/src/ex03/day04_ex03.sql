select
b.generate_date as missing_date
from person_visits a
right join v_generated_dates b on a.visit_date = b.generate_date
where a.visit_date is NULL
order by missing_date