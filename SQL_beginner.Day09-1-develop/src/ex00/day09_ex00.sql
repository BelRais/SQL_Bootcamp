create table person_audit
(
  created timestamp with time zone default now() not null,
  type_event char(1) default 'I' not null,
  row_id bigint,
  name varchar,
  age integer,
  gender varchar,
  address varchar,
  constraint ch_type_event check (type_event in ('I', 'U', 'D'))
  );

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER
as $$
    begin
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit(row_id, name, age, gender, address)
        select
        *
        from person
        where id = new.id;
    END IF;
    RETURN old;
    end
$$
language plpgsql;

CREATE TRIGGER trg_person_insert_audit
after INSERT ON person
	FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();

--INSERT INTO deannven.public.person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
/*
select * from deannven.public.person;
select * from person_audit;

*/

