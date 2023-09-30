create view v_generated_dates as
select
generate_series('2022-01-01'::date, '2022-01-31'::date, '1 day')::date generate_date
order by generate_date