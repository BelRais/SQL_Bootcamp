CREATE OR REPLACE FUNCTION func_minimum(arr numeric array)
RETURNS TABLE (min_array numeric)
as $$
    begin
        return query
        select min(a) from unnest(arr) as a;
    end;
$$
language plpgsql;


/*
SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
*/