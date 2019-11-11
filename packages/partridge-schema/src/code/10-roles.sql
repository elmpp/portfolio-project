/**
 * RBAC postgraphile - https://tinyurl.com/y692k6zc
 */
DO $do$
BEGIN
   IF NOT EXISTS (
         SELECT
            -- SELECT list can stay empty for this
         FROM
            pg_catalog.pg_roles
         WHERE
            rolname = 'api_read_role') THEN
         CREATE ROLE api_read_role NOLOGIN;
   END IF;
END
$do$;

GRANT connect ON DATABASE partridge TO api_read_role;
GRANT USAGE ON SCHEMA public TO api_read_role;
GRANT SELECT ON event_view TO api_read_role;
GRANT SELECT ON market_view TO api_read_role;
GRANT SELECT ON outcome_view TO api_read_role;
GRANT SELECT ON category1 TO api_read_role;
GRANT SELECT ON category2 TO api_read_role;
GRANT SELECT ON category3 TO api_read_role;
GRANT SELECT ON market_collection TO api_read_role;
