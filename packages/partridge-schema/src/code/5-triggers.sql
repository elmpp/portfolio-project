-- It will be a "statement-level" trigger
-- - https://goo.gl/qvs35 / https://goo.gl/LFWwyX

-- CREATE TRIGGER insert_queue_trigger
--   AFTER INSERT
--   ON queue
--   FOR EACH STATEMENT
--   EXECUTE PROCEDURE process_queue();