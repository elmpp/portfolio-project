select distinct data#>>'{meta, run_id}', data#>>'{meta, feed_supplier}', created_at from queue order by created_at;

select process_queue('d48a51d4-4e0c-41ab-8662-95d07cd7133b'); -- coral
select process_queue('59fd9a6f-9b5a-4435-a473-0542e179f1fc'); -- sky


-- test the slugify function...
select canonicalise('UFC / MMA') = 'ufc-mma'
 AND canonicalise('UFC&MMA') = 'ufc-mma'
 AND canonicalise(' UFC---MMA') = 'ufc-mma'
 AND canonicalise(' UFC--MMA-') = 'ufc-mma'
 AND canonicalise('up 50% this year)') = 'up-50-this-year'
 AND canonicalise('trailing-)') = 'trailing'
 AND canonicalise(')(^&£$@!') = ''
 AND canonicalise('   A   ') = 'a'
 AND canonicalise('West Brom to score 1+ goals, 4+ corners each team and 30+ West Brom booking pts') = 'west-brom-to-score-1+-goals-4+-corners-each-team-and-30+-west-brom-booking-pts'
;
-- AND slugify('uniCode ♥ is ☢') = 'unicode-love-is-radioactive'
;



set client_min_messages to DEBUG;
set client_min_messages to info;
set client_min_messages to NOTICE;



