CREATE SEQUENCE seq_person_discounts START 1;
ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', (SELECT COUNT(*) FROM person_discounts) + 1);

--insert into person_discounts(person_id, pizzeria_id, discount) values (2, 6, 10.1);
