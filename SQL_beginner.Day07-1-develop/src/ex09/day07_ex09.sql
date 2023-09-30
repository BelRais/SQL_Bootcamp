select
address,
round((max(age) - (min(age) / (max(age) * 1.0))),2) formula,
round(avg(age),2) average,
case
when round((max(age) - (min(age) / (max(age) * 1.0))),2) > round(avg(age),2) then true
when round((max(age) - (min(age) / (max(age) * 1.0))),2) < round(avg(age),2) then false
end comparison
from person
group by address
order by address