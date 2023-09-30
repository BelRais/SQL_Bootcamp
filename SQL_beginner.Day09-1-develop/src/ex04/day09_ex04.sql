CREATE OR REPLACE FUNCTION fnc_persons_male() RETURNS TABLE (id bigint, nam varchar(60), age integer, gender varchar(30), address varchar(60))
as $$
    select
    *
    from person
    where gender = 'male';
    $$
language sql;
;
CREATE OR REPLACE FUNCTION fnc_persons_female() RETURNS TABLE (id bigint, nam varchar(60), age integer, gender varchar(30), address varchar(60))
as $$
    select
    *
    from person
    where gender = 'female';
    $$
language sql;
;

/*
SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();
*/