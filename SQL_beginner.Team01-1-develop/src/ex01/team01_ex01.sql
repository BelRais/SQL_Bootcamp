--insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
--insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

with t_all as (
    select *
    from (
             select row_number() over (partition by user_id,b_updated,name order by updated desc) as row_row,
                    *
             from (
                select
                *,
                case
                    when flag_for_class = 'way_1' and b_updated between updated and b_updated then rate_to_usd
                    when flag_for_class = 'way_2' and b_updated between b_updated and updated then rate_to_usd
                    else '999'
                end   flag1
                 from (
                      select u.name as u_name,
                             u.lastname as u_lastname,
                             b.user_id,
                             b.updated b_updated,
                             c.*,
                             b.money,
                             case
                                 when min(c.updated) over (partition by user_id, c.id) > b.updated then 'way_2'
                                 else 'way_1'
                             end as flag_for_class
                      from Balance b
                               full join "user" u on u.id = b.user_id
                               left join Currency c on b.currency_id = c.id --and b.updated between c.updated and b.updated
                      --where u.name = 'Иван'
                     ) pre_a
                  ) a
             where flag1 != 999
         ) aa
    where row_row = 1
    order by b_updated, updated
)

select
case
when u_name is NULL then 'not defined'
else u_name
end name,
case
when u_lastname is NULL then 'not defined'
else u_lastname
end lastname,
name currency_name,
money * flag1 currency_in_usd
from t_all
order by name desc, lastname asc, currency_name asc;
