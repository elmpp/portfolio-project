/**
 * Coaslesces the processed/concrete table structure back into
 * event -> market -> outcome
 *  - Primary use case is to support PostGraphile server - https://tinyurl.com/y48zfuwu
 *  - views being nullable by default - https://tinyurl.com/y46925oj
 */

-- views - https://tinyurl.com/y2kvt9sz
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
  e.canonicalised_name_unique,
  e.event_date,
  e.type,
  e.category3_id,
  e.display_order
from
  event e
  left join concrete_event c on c.processed_id = e.id
  -- where e.date > current_timestamp - interval '1 day' // todo - add a function for this
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
  m.canonicalised_name,
  m.canonicalised_name_unique
from
  market m
  left join concrete_market c on c.processed_id = m.id
  -- where e.date > current_timestamp - interval '1 day' // todo - add a function for this
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
  o.canonicalised_name,
  o.canonicalised_name_unique
from
  outcome o
  left join concrete_outcome c on c.processed_id = o.id
  -- where e.date > current_timestamp - interval '1 day' // todo - add a function for this
;


-- adding "smart comments" for postgraphile - https://tinyurl.com/yyyhcjpu
-- removing from schema - https://tinyurl.com/y4gucdxe
comment on table event is
E''
;
comment on table market is
E''
;
comment on table outcome is
E''
;
-- our exposed queries are done via views..
comment on view event_view is
E'@primaryKey id'
;
comment on view market_view is
E'@primaryKey id\n
@foreignKey (event_id) references event_view(id)|@foreignFieldName markets'
;
comment on view outcome_view is
E'@primaryKey id\n
@foreignKey (market_id) references market_view(id)|@foreignFieldName outcomes'
;
-- comment on view event_view is
-- E'@name eventCUSTOM\n
-- @primaryKey id'
-- ;
-- comment on view market_view is
-- E'@name marketCUSTOM\n
-- @primaryKey id\n
-- @foreignKey (event_id) references event_view(id)|@foreignFieldName markets'
-- ;
-- comment on view outcome_view is
-- E'@name outcomeCUSTOM\n
-- @primaryKey id\n
-- @foreignKey (market_id) references market_view(id)|@foreignFieldName outcomes'
-- ;


WITH the_columns AS (
  SELECT
    *
  FROM
    information_schema.columns
  WHERE
    table_name = 'event'
  UNION
  SELECT
    *
  FROM
    information_schema.columns
  WHERE
    table_name = 'concrete_event'
),
nullable_columns AS (
  SELECT
    *
  FROM
    the_columns
  WHERE
    column_name != 'id'
    AND is_nullable = 'NO'
  ORDER BY
    column_name
),
updateable_columns AS (
  SELECT
    pg_attribute.attrelid,
    pg_attribute.attname,
    pg_attribute.attnotnull,
    pg_class.relname
  FROM
    pg_attribute
    INNER JOIN pg_class ON pg_attribute.attrelid = pg_class.oid
    INNER JOIN nullable_columns ON pg_attribute.attname = nullable_columns.column_name
  WHERE
    pg_class.relname = 'event_view'
    AND pg_attribute.attnotnull = FALSE)
  -- select * from nullable_columns
  -- select * from updateable_columns
  UPDATE
    pg_attribute
  SET
    attnotnull = TRUE
  WHERE
    attrelid IN (
      SELECT
        attrelid
      FROM
        updateable_columns);

WITH the_columns AS (
  SELECT
    *
  FROM
    information_schema.columns
  WHERE
    table_name = 'market'
  UNION
  SELECT
    *
  FROM
    information_schema.columns
  WHERE
    table_name = 'concrete_market'
),
nullable_columns AS (
  SELECT
    *
  FROM
    the_columns
  WHERE
    column_name != 'id'
    AND is_nullable = 'NO'
  ORDER BY
    column_name
),
updateable_columns AS (
  SELECT
    pg_attribute.attrelid,
    pg_attribute.attname,
    pg_attribute.attnotnull,
    pg_class.relname
  FROM
    pg_attribute
    INNER JOIN pg_class ON pg_attribute.attrelid = pg_class.oid
    INNER JOIN nullable_columns ON pg_attribute.attname = nullable_columns.column_name
  WHERE
    pg_class.relname = 'market_view'
    AND pg_attribute.attnotnull = FALSE)
  -- select * from nullable_columns
  -- select * from updateable_columns
  UPDATE
    pg_attribute
  SET
    attnotnull = TRUE
  WHERE
    attrelid IN (
      SELECT
        attrelid
      FROM
        updateable_columns);

WITH the_columns AS (
  SELECT
    *
  FROM
    information_schema.columns
  WHERE
    table_name = 'outcome'
  UNION
  SELECT
    *
  FROM
    information_schema.columns
  WHERE
    table_name = 'concrete_outcome'
),
nullable_columns AS (
  SELECT
    *
  FROM
    the_columns
  WHERE
    column_name != 'id'
    AND is_nullable = 'NO'
  ORDER BY
    column_name
),
updateable_columns AS (
  SELECT
    pg_attribute.attrelid,
    pg_attribute.attname,
    pg_attribute.attnotnull,
    pg_class.relname
  FROM
    pg_attribute
    INNER JOIN pg_class ON pg_attribute.attrelid = pg_class.oid
    INNER JOIN nullable_columns ON pg_attribute.attname = nullable_columns.column_name
  WHERE
    pg_class.relname = 'outcome_view'
    AND pg_attribute.attnotnull = FALSE)
  -- select * from nullable_columns
  -- select * from updateable_columns
  UPDATE
    pg_attribute
  SET
    attnotnull = TRUE
  WHERE
    attrelid IN (
      SELECT
        attrelid
      FROM
        updateable_columns);