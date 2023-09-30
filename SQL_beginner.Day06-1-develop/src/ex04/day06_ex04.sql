alter table person_discounts
    add constraint ch_nn_person_id CHECK (person_id is not NULL),
    add constraint ch_nn_pizzeria_id CHECK (pizzeria_id is not NULL),
    add constraint ch_nn_discount CHECK (discount is not NULL),
    add constraint ch_range_discount CHECK (discount >= 0 and discount <= 100);
alter table person_discounts alter column discount set default 0;

