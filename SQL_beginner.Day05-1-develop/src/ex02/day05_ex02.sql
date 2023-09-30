create index idx_person_name on person(UPPER(name));
set enable_seqscan =off;

EXPLAIN ANALYZE
select
*
from person
where UPPER(name) = 'ANNA'



