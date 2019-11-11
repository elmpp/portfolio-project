



-- test the slugify function...
select slugify('UFC / MMA') = 'ufc-mma'
 AND slugify('UFC&MMA') = 'ufc-mma'
 AND slugify(' UFC---MMA') = 'ufc-mma'
 AND slugify(' UFC--MMA-') = 'ufc-mma'
 AND slugify('up 50% this year)') = 'up-50-this-year'
 AND slugify('trailing-)') = 'trailing'
 AND slugify(')(^&£$@!') = ''
 AND slugify('   A   ') = 'a'
 AND slugify('West Brom to score 1+ goals, 4+ corners each team and 30+ West Brom booking pts') = 'west-brom-to-score-1+-goals-4+-corners-each-team-and-30+-west-brom-booking-pts'
-- AND slugify('uniCode ♥ is ☢') = 'unicode-love-is-radioactive'
;


drop view if exists event_view;
drop view if exists market_view;
drop view if exists outcome_view;

create
or replace view event_view as
select
  c.id,
  c.displayed,
  c.url,
  c.feed_supplier,
  c.status,
  e.name,
  e.canonicalised_name,
  e.event_date,
  e.type,
  e.category3_id,
  e.display_order
from
  event e
  left join concrete_event c on ec.processed_id = e.id -- where e.date > current_timestamp - interval '1 day' // todo - add a function for this
;
create
or replace view market_view as
select
  c.id,
  c.cashout_available,
  c.eachway_available,
  c.first_four_available,
  c.forecast_available,
  c.guaranteed_price_available,
  c.place_available,
  c.quinella_available,
  c.tricast_available,
  c.concrete_event_id as event_id,
  c.display_order,
  c.is_default,
  c.feed_supplier,
  c.bet_in_play,
  c.bet_till,
  c.betting_status,
  c.status,
  m.name,
  m.canonicalised_name
from
  market m
  left join concrete_market c on c.processed_id = m.id -- where e.date > current_timestamp - interval '1 day' // todo - add a function for this
;

create
or replace view outcome_view as
select
  c.id,
  c.odds,
  c.odds_decimal,
  c.handicap,
  c.display_order,
  c.is_home,
  c.concrete_market_id as market_id,
  c.feed_supplier,
  c.live_price_available,
  c.starting_price_available,
  c.status,
  o.name,
  o.canonicalised_name
from
  outcome o
  left join concrete_outcome c on c.processed_id = o.id -- where e.date > current_timestamp - interval '1 day' // todo - add a function for this
;


-- adding "smart comments" for postgraphile - https://tinyurl.com/yyyhcjpu
comment on view market_view is E'@foreignKey (event_id) references event_view (id)';
comment on view outcome_view is E'@foreignKey (market_id) references market_view (id)';


select * from event_view e
inner join market_view m on m.event_id=e.id
inner join outcome_view o on o.market_id=m.id
;