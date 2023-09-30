/*
CREATE TRIGGER trg_person_update_audit
BEFORE UPDATE ON deannven.public.person
	FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_update_audit();

CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER
as $$
    begin
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO deannven.public.person_audit(row_id, name, age, gender, address, type_event)
        select
        new.id,
        name,
        age,
        gender,
        address,
        'U'
        from deannven.public.person
        where id = new.id;
    END IF;
    RETURN NEW;
    end
$$
language plpgsql;
*/

CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER
as $$
    begin
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO person_audit(row_id, name, age, gender, address, type_event)
        select
        old.id,
        old.name,
        old.age,
        old.gender,
        old.address,
        'U'
        from person
        where id = new.id;
    END IF;
    RETURN new;
    end
$$
language plpgsql;


CREATE TRIGGER trg_person_update_audit
after UPDATE ON person
	FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_update_audit();
/*
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

select * from deannven.public.person;
select * from person_audit;

*/