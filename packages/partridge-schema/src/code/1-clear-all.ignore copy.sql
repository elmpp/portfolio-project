-- makes all the code script idempotent

-- Triggers
-- https://goo.gl/eSt3tQ
-- drop trigger if exists insert_queue_trigger on queue;

-- Misc. Functions
drop function if exists canonicalise(text);

-- Procedures
-- https://goo.gl/6UdyGA
drop function if exists process_queue(text);
drop function if exists process_entity_category1(queue);
drop function if exists create_entity_category1(queue, meta);
drop function if exists process_entity_category2(queue);
drop function if exists create_entity_category2(queue, meta);
drop function if exists process_entity_category3(queue);
drop function if exists create_entity_category3(queue, meta);
drop function if exists process_entity_event(queue);
drop function if exists create_entity_event(queue, meta, text);
drop function if exists process_entity_market(queue);
drop function if exists create_entity_market(queue, meta, text);
drop function if exists process_entity_outcome(queue);
drop function if exists create_entity_outcome(queue, meta, text);
drop function if exists process_entity_market_collection(queue);
drop function if exists create_entity_market_collection(queue, meta);
drop function if exists retrieve_processed_entity_by_canonicalised(anyelement, meta);
drop function if exists retrieve_processed_entity_with_concrete(anyelement, meta);
drop function if exists retrieve_processed_entity_without_concrete(anyelement, meta);
drop function if exists retrieve_concrete_entity(anyelement, meta);
drop function if exists extract_meta(jsonb);
drop function if exists extract_crunch_tmp(jsonb);
drop function if exists extract_meta(anyelement, jsonb);
drop function if exists extract_fields(anyelement, jsonb);
drop function if exists apply_renaming(text, meta);
drop function if exists apply_canonicalise(meta, text);


-- Types
drop type if exists meta;
drop type if exists crunch_tmp;
drop type if exists fields_processed_category;
drop type if exists fields_processed_event;
drop type if exists fields_concrete_event;
drop type if exists fields_processed_market;
drop type if exists fields_concrete_market;
drop type if exists fields_processed_outcome;
drop type if exists fields_concrete_outcome;
drop type if exists fields_processed_market_collection;

-- Api Queries
drop function if exists event_by_canonicalised_name_unique(text);