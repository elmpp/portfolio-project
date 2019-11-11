-- each script should atomically clear themselves but few interdependencies remain...


-- Api Queries
drop function if exists event_by_canonicalised_name_unique(text);
drop function if exists event_by_canonicalised_name_unique_query(text);
