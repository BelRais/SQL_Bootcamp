drop function fnc_persons_male();
drop function fnc_persons_female();

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar(30) default 'female') RETURNS TABLE (id bigint, nam varchar(60), age integer, gender varchar(30), address varchar(60))
as $$
    select
    *
    from person
    where gender = pgender;
    $$
language sql;
;

/*
select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
*/