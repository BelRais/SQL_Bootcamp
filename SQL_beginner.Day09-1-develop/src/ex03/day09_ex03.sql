drop trigger trg_person_insert_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;

drop function fnc_trg_person_insert_audit;
drop function fnc_trg_person_update_audit;
drop function fnc_trg_person_delete_audit;

TRUNCATE table person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER
as $$
    begin
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit(row_id, name, age, gender, address)
        select
        *
        from person
        where id = new.id;
        RETURN OLD;
    END IF;
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
        RETURN NEW;
    END IF;
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit(row_id, name, age, gender, address, type_event)
        VALUES (OLD.id, OLD.name, old.age, old.gender, old.address, 'D');
        RETURN old;
    END IF;
    end
$$
language plpgsql;

CREATE TRIGGER trg_person_audit
after DELETE or insert or update ON person
	FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_audit();


/*
INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
*/
/*
select * from person;
select * from person_audit;
*/