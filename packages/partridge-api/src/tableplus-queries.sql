select e.* from concrete_event ec
inner join event e on ec.processed_id=e.id
inner join concrete_market mc on ec.id=mc.concrete_event_id
inner join market m on mc.processed_id=m.id
inner join concrete_outcome mo on mc.id=mo.concrete_market_id
inner join outcome o on mo.processed_id=o.id;





