CREATE EXTENSION IF NOT EXISTS "unaccent"; -- is available on Cloud SQL - https://goo.gl/XH7U16

-- inspired from https://goo.gl/5DLv5T
CREATE OR REPLACE FUNCTION canonicalise(value TEXT)
RETURNS TEXT AS $$
  -- removes accents (diacritic signs) from a given string --
  WITH unaccented AS (
    SELECT unaccent(value) AS value
  ),
  -- lowercases the string
  lowercase AS (
    SELECT lower(value) AS value
    FROM unaccented
  ),
  -- replaces anything that's not a letter, number, hyphen('-'), or underscore('_') with a hyphen('-')
  hyphenated AS (
    SELECT regexp_replace(value, '[^a-z0-9\-_+]+', '-', 'g') AS value
    FROM lowercase
  ),
  -- trims hyphens('-') if they exist on the head or tail of the string
  multihyphenated AS (
    SELECT regexp_replace(value, '--+', '-', 'g') AS value
    FROM hyphenated
  ),
  -- seems to ignore the anchor chars in the `hyphenated` stage above
  arbitrary AS (
    -- https://goo.gl/qChVMJ
    SELECT translate(value, '^', '-') AS value
    FROM multihyphenated
  ),
  -- trims hyphens('-') if they exist on the head or tail of the string
  trimmed AS (
    SELECT regexp_replace(value, '^-+|-+$', '', 'g') AS value
--     SELECT regexp_replace(regexp_replace(value, '\\-+$', ''), '^\\-', '') AS value
    FROM arbitrary
  )
  SELECT value FROM trimmed;
$$ LANGUAGE SQL STRICT IMMUTABLE;



-- test. @see canonicalise.spec.ts also...
--
-- select canonicalise('UFC / MMA') = 'ufc-mma'
--  AND canonicalise('UFC&MMA') = 'ufc-mma'
--  AND canonicalise(' UFC---MMA') = 'ufc-mma'
--  AND canonicalise(' UFC--MMA-') = 'ufc-mma'
--  AND canonicalise('up 50% this year)') = 'up-50-this-year'
--  AND canonicalise('trailing-)') = 'trailing'
--  AND canonicalise(')(^&£$@!') = ''
--  AND canonicalise('   A   ') = 'a'
--  AND canonicalise('West Brom to score 1+ goals, 4+ corners each team and 30+ West Brom booking pts') = 'west-brom-to-score-1+-goals-4+-corners-each-team-and-30+-west-brom-booking-pts'
-- ;