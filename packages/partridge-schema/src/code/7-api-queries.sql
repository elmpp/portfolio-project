/**
 * Define custom queries that will be exposed by postgraphile as endpoints
 *
 *  - postgraphile custom queries - https://tinyurl.com/y376ls7t
 *  - postgraphile full example app - https://tinyurl.com/yyezo2bv
 */

-- takes a queue item off queue and into an ApiEntity
-- - should remove it off the queue
-- -
create or replace function event_by_canonicalised_name_unique_query(canonicalised_name_unique text)
returns event_view
as $$
  select * from event_view ev where ev.canonicalised_name_unique=canonicalised_name_unique
$$
LANGUAGE sql stable;
