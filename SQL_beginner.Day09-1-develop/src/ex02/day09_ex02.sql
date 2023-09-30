CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER
as $$
    begin
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit(row_id, name, age, gender, address, type_event)
        VALUES (OLD.id, OLD.name, old.age, old.gender, old.address, 'D');
    END IF;
    RETURN old;
    end
$$
language plpgsql;


CREATE TRIGGER trg_person_delete_audit
after DELETE ON person
	FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_delete_audit();



/*
CREATE TRIGGER trg_person_delete_audit
before DELETE ON deannven.public.person
	FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_delete_audit();

CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER
as $$
    begin
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO deannven.public.person_audit(row_id, name, age, gender, address, type_event)
        select
        old.id,
        name,
        age,
        gender,
        address,
        'D'
        from deannven.public.person
        where id = old.id;
    END IF;
    RETURN old;
    end
$$
language plpgsql;

*/


/*
DELETE FROM person WHERE id = 10;

select * from deannven.public.person;
select * from person_audit;

*/