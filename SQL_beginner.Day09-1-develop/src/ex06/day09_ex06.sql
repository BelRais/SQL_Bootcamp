CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar(60) default 'Dmitriy', pprice numeric default 500, pdate date default '2022-01-08')
RETURNS TABLE (pizzeria_name varchar(60))
as $$
    begin
        return query
    select
    p2.name
    from person p
    join person_visits o on p.id = o.person_id and p.name = pperson and o.visit_date = pdate
    join pizzeria p2 on o.pizzeria_id = p2.id
    join menu m on p2.id = m.pizzeria_id and m.price < pprice;
    end;
$$
language plpgsql;

/*
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

*/