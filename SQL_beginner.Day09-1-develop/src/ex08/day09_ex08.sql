CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
RETURNS TABLE (fib integer)
AS
$$
    BEGIN
        RETURN QUERY
        WITH RECURSIVE rec(elem1, elem2) AS (
            SELECT 0, 1
            UNION ALL
            SELECT elem2, elem1 + elem2
            from rec
            WHERE elem1 + elem2 < pstop
        )
        select 0
        union all
        select elem2
        from rec;
    END;

$$
LANGUAGE  plpgsql;

/*
select * from fnc_fibonacci();
*/