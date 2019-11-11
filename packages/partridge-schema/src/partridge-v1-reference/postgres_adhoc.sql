/*   ------------------------ play about etc ---------------*/
select * from matview.eventsdto e
inner join matview.marketsdto m on m.event_id=e.id
inner join matview.outcomesdto o on o.market_id=m.id
where e.mergeable_id=634;

----------------------- set matchable names
update outcomesdto
set matchable_name = m2.matchablename
from
(
select m.id, c1.name || ' ' || m.name as matchablename
from outcomesdto m
join category1 c1 on m.category1_id=c1.id
) as m2
where outcomesdto.id=m2.id
;

update marketsdto
set matchable_name = m2.matchablename
from
(
select m.id, c1.name || ' ' || m.name as matchablename
from outcomesdto m
join category1 c1 on m.category1_id=c1.id
) as m2
where outcomesdto.id=m2.id
;