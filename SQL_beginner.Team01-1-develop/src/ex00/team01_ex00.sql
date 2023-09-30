with t_all as (
select distinct
u.id as u_id,
u.name as u_name,
u.lastname as u_lastname,
b.user_id as b_user_id,
b.type as b_type,
b.money as b_money,
b.currency_id as b_currency_id,
b.updated as b_updated,
c.id as c_id,
c.name as c_name,
c.rate_to_usd as c_rate_to_usd,
c.updated as c_updated
from Balance b
full join "user" u on u.id = b.user_id
left join (select *, max(updated) over (partition by id) as maxx from Currency) c on b.currency_id = c.id and c.updated = maxx
--where u.name = 'Иван'
)
select distinct
name,
lastname,
type,
volume,
currency_name,
last_rate_to_usd,
sum(b_money) over (partition by b_user_id, type, b_currency_id) * last_rate_to_usd total_volume_in_usd
from (
         select distinct
         case
            when u_name is NULL then 'not defined'
            else u_name
        end name,
        case
            when u_lastname is NULL then 'not defined'
            else u_lastname
        end lastname,
        b_type type,
        sum(b_money) over (partition by b_user_id, b_type, b_currency_id) as volume,
        case
            when c_name is NULL then 'not defined'
            else c_name
        end currency_name,
        case
            when c_rate_to_usd is NULL then 1
            else c_rate_to_usd
        end last_rate_to_usd,
        b_money,
        b_user_id,
        b_currency_id
         from t_all
     ) a
--where u_name = 'Петр'
order by name desc, lastname asc, type asc
;
