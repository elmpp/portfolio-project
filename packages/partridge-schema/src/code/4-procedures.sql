-- cursors - https://goo.gl/dfG1eD
create or replace function process_queue(runid text)
returns integer
as $$
declare
	entity_names text[] default ARRAY['CATEGORY1', 'CATEGORY2', 'CATEGORY3', 'EVENT', 'MARKET', 'OUTCOME', 'MARKETCOLLECTION'];
	count_total integer default 0;
	count_entity integer default 0;
	entity_name text;
	row_current queue;
	row_cursor cursor(runid text, entity_name text) for select * from queue where data#>>'{meta, run_id}' = runid and data->>'type' = entity_name;
BEGIN
	-- foreach loops: https://goo.gl/W6va5D
	foreach entity_name IN array entity_names
	loop
		count_entity := 0;
		open row_cursor(runid, entity_name);

		loop
			-- fetch row into the film
	      	FETCH row_cursor INTO row_current;
	   		-- exit when no more row to fetch
	      	EXIT WHEN NOT FOUND;

			-- defer to entity-specify function
			case row_current.data->>'type'
			when 'CATEGORY1' then
				perform process_entity_category1(row_current);
			when 'CATEGORY2' then
				perform process_entity_category2(row_current);
			when 'CATEGORY3' then
				perform process_entity_category3(row_current);
			when 'EVENT' then
				perform process_entity_event(row_current);
			when 'MARKET' then
				perform process_entity_market(row_current);
			when 'OUTCOME' then
				perform process_entity_outcome(row_current);
			when 'MARKETCOLLECTION' then
				perform process_entity_market_collection(row_current);
			else
			end case;

			count_entity := count_entity+1;

		end loop;

		close row_cursor;

		count_total := count_total + count_entity;

		raise notice 'Processed % % queue items', entity_name, count_entity;
	end loop;

	raise notice 'Finished. Processed total % queue items', count_total;
	return count_total;
end;
$$
LANGUAGE plpgsql;




-- takes a queue item off queue and into an ApiEntity
-- - should remove it off the queue
-- -
create or replace function process_entity_category1(queue_param queue)
returns void
as $$
declare
	processed_existing record;
	meta meta;
	crunch_tmp crunch_tmp;
begin
	select * from extract_meta(null::meta, queue_param.data->'meta') into strict meta;
	select * from extract_crunch_tmp(queue_param.data->'crunch_tmp') into strict crunch_tmp;

	processed_existing := retrieve_processed_entity_without_concrete(null::category1, meta);

	if processed_existing is not null then
		if crunch_tmp.action != 'UPDATE_AND_CREATE_PROCESSED' then
			raise info 'processed exists. Returning. Entity: category1. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			return; -- record exists and doesn't specify update
		end if;

		raise info 'processed exists. Creating/updating. Entity: category1. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
		perform create_entity_category1(queue_param, meta);
		return;
	end if;

	if processed_existing is null then
		meta := apply_renaming('CATEGORY1', meta); -- enables renaming through alias rules (expensive operation)
		meta := apply_canonicalise(meta, crunch_tmp.unique_append); -- reapply as name has likely changed

		processed_existing := retrieve_processed_entity_by_canonicalised(null::category1, meta); -- second attempt at finding processed, this time after renaming etc

		if processed_existing is null then
			if crunch_tmp.action != 'UPDATE_AND_CREATE_PROCESSED' then
				raise info 'processed does not exist. Returning. Entity: category1. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
				return; -- no perms to create processed
			end if;

			raise info 'processed does not exist. Creating. Entity: category1. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			perform create_entity_category1(queue_param, meta);
		end if;
	end if;

	-- delete from queue where id=queue_param.id;
end;
$$
LANGUAGE plpgsql;


create or replace function process_entity_category2(queue_param queue)
returns void
as $$
declare
	processed_existing record;
	meta meta;
	crunch_tmp crunch_tmp;
begin
	select * from extract_meta(null::meta, queue_param.data->'meta') into strict meta;
	select * from extract_crunch_tmp(queue_param.data->'crunch_tmp') into strict crunch_tmp;

	processed_existing := retrieve_processed_entity_without_concrete(null::category2, meta);

	if processed_existing is not null then
		if crunch_tmp.action != 'UPDATE_AND_CREATE_PROCESSED' then
			raise info 'processed exists. Returning. Entity: category2. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			return;
		end if;

		raise info 'processed exists. Creating/updating. Entity: category2. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
		perform create_entity_category2(queue_param, meta);
		return;
	end if;

	if processed_existing is null then
		meta := apply_renaming('CATEGORY2', meta);
		meta := apply_canonicalise(meta, crunch_tmp.unique_append);

		processed_existing := retrieve_processed_entity_by_canonicalised(null::category2, meta);

		if processed_existing is null then
			if crunch_tmp.action != 'UPDATE_AND_CREATE_PROCESSED' then
				raise info 'processed does not exist. Returning. Entity: category2. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
				return;
			end if;

			raise info 'processed does not exist. Creating. Entity: category2. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			perform create_entity_category2(queue_param, meta);
		end if;
	end if;

	-- delete from queue where id=queue_param.id;
end;
$$
LANGUAGE plpgsql;



create or replace function process_entity_category3(queue_param queue)
returns void
as $$
declare
	processed_existing record;
	meta meta;
	crunch_tmp crunch_tmp;
begin
	select * from extract_meta(null::meta, queue_param.data->'meta') into strict meta;
	select * from extract_crunch_tmp(queue_param.data->'crunch_tmp') into strict crunch_tmp;

	processed_existing := retrieve_processed_entity_without_concrete(null::category3, meta);

	if processed_existing is not null then
		if crunch_tmp.action != 'UPDATE_AND_CREATE_PROCESSED' then
			raise info 'processed exists. Returning. Entity: category3. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			return;
		end if;

		raise info 'processed exists. Creating/updating. Entity: category3. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
		perform create_entity_category3(queue_param, meta);
		return;
	end if;

	if processed_existing is null then
		meta := apply_renaming('CATEGORY3', meta);
		meta := apply_canonicalise(meta, crunch_tmp.unique_append);

		processed_existing := retrieve_processed_entity_by_canonicalised(null::category3, meta);

		if processed_existing is null then
			if crunch_tmp.action != 'UPDATE_AND_CREATE_PROCESSED' then
				raise info 'processed does not exist. Returning. Entity: category3. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
				return;
			end if;

			raise info 'processed does not exist. Creating. Entity: category3. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			perform create_entity_category3(queue_param, meta);
		end if;
	end if;

	-- delete from queue where id=queue_param.id;
end;
$$
LANGUAGE plpgsql;



create or replace function process_entity_event(queue_param queue)
returns void
as $$
declare
	processed_and_concrete_existing record;
	meta meta;
	crunch_tmp crunch_tmp;
begin
	raise debug 'extract_meta event queue: %', queue_param;
	raise debug 'extract_meta event all data: %', queue_param.data;
	raise debug 'extract_meta event: %', queue_param.data->'meta';
	select * from extract_meta(null::meta, queue_param.data->'meta') into strict meta;
	select * from extract_crunch_tmp(queue_param.data->'crunch_tmp') into strict crunch_tmp;

	processed_and_concrete_existing := retrieve_processed_entity_with_concrete(null::event, meta);
	meta := apply_canonicalise(meta, crunch_tmp.unique_append);

	if processed_and_concrete_existing is not null then
		if crunch_tmp.action = 'CREATE_CONCRETE' then
			raise info 'concrete exists. Returning. Entity: event. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			return; -- concrete exists and doesn't specify update
		end if;

		raise info 'concrete exists. Creating/updating. Entity: event. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
		perform create_entity_event(queue_param, meta, crunch_tmp.action); -- will only result in update to concrete as matchable by [feed_id, feed_supplier]
		return;
	end if;

	if processed_and_concrete_existing is null then
		meta := apply_renaming('EVENT', meta); -- enables renaming through alias rules (expensive operation)
		meta := apply_canonicalise(meta, crunch_tmp.unique_append); -- reapply as name has likely changed

		processed_and_concrete_existing := retrieve_processed_entity_by_canonicalised(null::event, meta); -- second attempt at finding processed, this time after renaming etc

		if processed_and_concrete_existing is null then
			if crunch_tmp.action != 'UPDATE_AND_CREATE_PROCESSED' then
				raise info 'processed/concrete does not exist. Returning. Entity: event. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
				return; -- no perms to create processed
			end if;

			raise info 'processed/concrete does not exist. Creating. Entity: event. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			perform create_entity_event(queue_param, meta, crunch_tmp.action);
		end if;
	end if;

	-- delete from queue where id=queue_param.id;
end;
$$
LANGUAGE plpgsql;



create or replace function process_entity_market(queue_param queue)
returns void
as $$
declare
	processed_and_concrete_existing record;
	meta meta;
	crunch_tmp crunch_tmp;
begin
	select * from extract_meta(null::meta, queue_param.data->'meta') into strict meta;
	select * from extract_crunch_tmp(queue_param.data->'crunch_tmp') into strict crunch_tmp;

	processed_and_concrete_existing := retrieve_processed_entity_with_concrete(null::market, meta);
	meta := apply_canonicalise(meta, crunch_tmp.unique_append);

	if processed_and_concrete_existing is not null then
		if crunch_tmp.action = 'CREATE_CONCRETE' then
			raise info 'concrete exists. Returning. Entity: market. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			return;
		end if;

		raise info 'concrete exists. Creating/updating. Entity: market. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
		perform create_entity_market(queue_param, meta, crunch_tmp.action);
		return;
	end if;

	if processed_and_concrete_existing is null then
		meta := apply_renaming('MARKET', meta);
		meta := apply_canonicalise(meta, crunch_tmp.unique_append);

		processed_and_concrete_existing := retrieve_processed_entity_by_canonicalised(null::market, meta);

		if processed_and_concrete_existing is null then
			if crunch_tmp.action != 'UPDATE_AND_CREATE_PROCESSED' then
				raise info 'processed/concrete does not exist. Returning. Entity: market. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
				return;
			end if;

			raise info 'processed/concrete does not exist. Creating. Entity: market. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			perform create_entity_market(queue_param, meta, crunch_tmp.action);
		end if;
	end if;

	-- delete from queue where id=queue_param.id;
end;
$$
LANGUAGE plpgsql;



create or replace function process_entity_outcome(queue_param queue)
returns void
as $$
declare
	processed_and_concrete_existing record;
	meta meta;
	crunch_tmp crunch_tmp;
begin
	select * from extract_meta(null::meta, queue_param.data->'meta') into strict meta;
	select * from extract_crunch_tmp(queue_param.data->'crunch_tmp') into strict crunch_tmp;

	processed_and_concrete_existing := retrieve_processed_entity_with_concrete(null::outcome, meta);
	meta := apply_canonicalise(meta, crunch_tmp.unique_append);

	if processed_and_concrete_existing is not null then
		if crunch_tmp.action = 'CREATE_CONCRETE' then
			raise info 'concrete exists. Returning. Entity: outcome. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			return;
		end if;

		raise info 'concrete exists. Creating/updating. Entity: outcome. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
		perform create_entity_outcome(queue_param, meta, crunch_tmp.action);
		return;
	end if;

	if processed_and_concrete_existing is null then
		meta := apply_renaming('OUTCOME', meta);
		meta := apply_canonicalise(meta, crunch_tmp.unique_append);

		processed_and_concrete_existing := retrieve_processed_entity_by_canonicalised(null::outcome, meta);

		if processed_and_concrete_existing is null then
			if crunch_tmp.action != 'UPDATE_AND_CREATE_PROCESSED' then
				raise info 'processed/concrete does not exist. Returning. Entity: outcome. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
				return;
			end if;

			raise info 'processed/concrete does not exist. Creating. Entity: outcome. Action: %. Canonicalised_name_unique: %.', crunch_tmp.action, meta.canonicalised_name_unique;
			perform create_entity_outcome(queue_param, meta, crunch_tmp.action);
		end if;
	end if;

	-- delete from queue where id=queue_param.id;
end;
$$
LANGUAGE plpgsql;


create or replace function process_entity_market_collection(queue_param queue)
returns void
as $$
declare
	processed_existing record;
	meta meta;
	crunch_tmp crunch_tmp;
begin
	select * from extract_meta(null::meta, queue_param.data->'meta') into strict meta;
	select * from extract_crunch_tmp(queue_param.data->'crunch_tmp') into strict crunch_tmp;

	meta := apply_renaming('MARKETCOLLECTION', meta);
	meta := apply_canonicalise(meta, crunch_tmp.unique_append);

	processed_existing := retrieve_processed_entity_by_canonicalised(null::market_collection, meta);
	raise debug 'processed market_collection: %', processed_existing;

	if processed_existing is not null then
		raise notice 'Skipping market_collection with name: %. id: %', meta.name, meta.id;
	else
		perform create_entity_market_collection(queue_param, meta);
	end if;

	-- delete from queue where id=queue_param.id;
end;
$$
LANGUAGE plpgsql;


-- this function should encapsulate the renaming based on any aliasing
-- - when other entity types, will also do the instance and concrete tables
create or replace function create_entity_category1(queue_param queue, meta_param meta)
returns category1
as $$
declare
	processed category1;
	fields_processed fields_processed_category;
begin

	-- -- fields
	select * from extract_fields(null::fields_processed_category, queue_param.data#>'{fields, processed}') into strict fields_processed;

	-- data inserting CTEs - https://goo.gl/wycQyZ / https://goo.gl/4xognk
	with ins1 as (
		insert into category1
			(name, canonicalised_name, canonicalised_name_unique, display_order)
			values
			(meta_param.name, meta_param.canonicalised_name, meta_param.canonicalised_name_unique, fields_processed.display_order)
			on conflict do nothing
			returning *
	),
	ins2 as (
	insert into meta_category1
		(id, feed_id, run_id, feed_supplier, url)
		values
		((select id from ins1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
		on conflict do nothing
		returning *
	)
	select * into processed from ins1
	;

	raise notice 'created category1: %', processed.name;

	return processed;
end;
$$
LANGUAGE plpgsql;


create or replace function create_entity_category2(queue_param queue, meta_param meta)
returns category2
as $$
declare
	processed category2;
	current_relation meta;
	entity_relation category1;
	fields_processed fields_processed_category;
begin

	-- -- the associations (multiple)
	-- for current_relation in select * from extract_meta(queue_param.data#>'{associations, category1}')
	-- loop
	-- 	raise notice 'current relation: %', current_relation;

	-- end loop;


	-- -- the association
	select * from extract_meta(queue_param.data#>'{associations, CATEGORY1}') into strict current_relation; -- [strict] must have relation defined
	select * from retrieve_processed_entity_without_concrete(null::category1, current_relation) into strict entity_relation; -- [strict] the relation should be already present as processed

	-- -- fields
	select * from extract_fields(null::fields_processed_category, queue_param.data#>'{fields, processed}') into strict fields_processed;

	with ins1 as (
		insert into category2
			(name, canonicalised_name, canonicalised_name_unique, display_order, category1_id)
			values
			(meta_param.name, meta_param.canonicalised_name, meta_param.canonicalised_name_unique, fields_processed.display_order, entity_relation.id)
			on conflict do nothing
			returning *
	),
	ins2 as (
	insert into meta_category2
		(id, feed_id, run_id, feed_supplier, url)
		values
		((select id from ins1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
		on conflict do nothing
		returning *
	)
	select * into processed from ins1
	;

	raise notice 'created category2: %', processed.name;

	return processed;
end;
$$
LANGUAGE plpgsql;


create or replace function create_entity_category3(queue_param queue, meta_param meta)
returns category3
as $$
declare
	processed category3;
	current_relation meta;
	entity_relation category2;
	fields_processed fields_processed_category;
begin

	-- -- the association
	select * from extract_meta(queue_param.data#>'{associations, CATEGORY2}') into strict current_relation;
	select * from retrieve_processed_entity_without_concrete(null::category2, current_relation) into strict entity_relation;

	-- -- fields
	select * from extract_fields(null::fields_processed_category, queue_param.data#>'{fields, processed}') into strict fields_processed;

	with ins1 as (
		insert into category3
			(name, canonicalised_name, canonicalised_name_unique, display_order, category2_id)
			values
			(meta_param.name, meta_param.canonicalised_name, meta_param.canonicalised_name_unique, fields_processed.display_order, entity_relation.id)
			on conflict do nothing
			returning *
	),
	ins2 as (
	insert into meta_category3
		(id, feed_id, run_id, feed_supplier, url)
		values
		((select id from ins1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
		on conflict do nothing
		returning *
	)
	select * into processed from ins1
	;

	raise notice 'created category3: %', processed.name;

	return processed;
end;
$$
LANGUAGE plpgsql;


create or replace function create_entity_event(queue_param queue, meta_param meta, action text)
returns event
as $$
declare
	processed event;
	current_relation meta;
	entity_relation category3;
	fields_processed fields_processed_event;
	fields_concrete fields_concrete_event;
begin

	-- -- the association
	select * from extract_meta(queue_param.data#>'{associations, CATEGORY3}') into strict current_relation;
	select * from retrieve_processed_entity_without_concrete(null::category3, current_relation) into strict entity_relation;

	-- -- fields
	select * from extract_fields(null::fields_processed_event, queue_param.data#>'{fields, processed}') into strict fields_processed;
	select * from extract_fields(null::fields_concrete_event, queue_param.data#>'{fields, concrete}') into strict fields_concrete;

	raise debug 'meta_param for event call: %', meta_param;

	case action
		when 'UPDATE_AND_CREATE_PROCESSED' then

			-- field list should match processed table
			with val1(name, canonicalised_name, canonicalised_name_unique, event_date, type, category3_id, display_order) as (
				VALUES (meta_param.name, meta_param.canonicalised_name, meta_param.canonicalised_name_unique, fields_processed.event_date, fields_processed.type, entity_relation.id, fields_processed.display_order)
			),
			ins1 as (
				insert into event
					(name, canonicalised_name, canonicalised_name_unique, event_date, type, category3_id, display_order)
					select * from val1
					on conflict (canonicalised_name_unique) do update set display_order=excluded.display_order
					returning *
			),
			agg1 as (
				select id, name, canonicalised_name, canonicalised_name_unique, event_date, type, category3_id, display_order from ins1
				union
				select event.id, val1.* from val1
				inner join event using (canonicalised_name_unique)
			),
			ins2 as (
				insert into meta_event
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict (feed_id, feed_supplier) do nothing
					returning *
			),
			val2(displayed, status, url, feed_supplier, processed_id) as (
				values(fields_concrete.displayed, fields_concrete.status, fields_concrete.url, meta_param.feed_supplier::feed_supplier_enum, (select id from agg1))
			),
			ins3 as (
				insert into concrete_event
					(displayed, status, url, feed_supplier, processed_id)
					select displayed, status, url, feed_supplier, processed_id from val2
					on conflict (feed_supplier, processed_id) do update set displayed=excluded.displayed, status=excluded.status, url=excluded.url
					returning *
			),
			agg3 as (
				select id, displayed, status, url, feed_supplier, processed_id from ins3
				union
				select ce.id, val2.* from val2
				inner join concrete_event ce using (feed_supplier, processed_id)
			),
			ins4 as (
				insert into meta_concrete_event
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg3), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict (feed_id, feed_supplier) do nothing
					returning *
			)
			select * into processed from agg1
			;

		when 'UPDATE_AND_CREATE_CONCRETE' then

			with sel1 as (
				select * from retrieve_processed_entity_by_canonicalised(null::event, meta_param)
			),
			val1(displayed, status, url, feed_supplier, processed_id) as (
				values(fields_concrete.displayed, fields_concrete.status, fields_concrete.url, meta_param.feed_supplier::feed_supplier_enum, (select id from sel1))
			),
			ins1 as (
				insert into concrete_event
					(displayed, status, url, feed_supplier, processed_id)
					select displayed, status, url, feed_supplier, processed_id from val1
					on conflict (feed_supplier, processed_id) do update set displayed=excluded.displayed, status=excluded.status, url=excluded.url
					returning *
			),
			agg1 as (
				select id, displayed, status, url, feed_supplier, processed_id from ins1
				union
				select ce.id, val1.* from val1
				inner join concrete_event ce using (feed_supplier, processed_id)
			),
			ins4 as (
				insert into meta_concrete_event
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict do nothing
					returning *
			)
			select * into processed from sel1
			;

		when 'CREATE_CONCRETE' then

			with sel1 as (
				select * from retrieve_processed_entity_by_canonicalised(null::event, meta_param)
			),
			val1(displayed, status, url, feed_supplier, processed_id) as (
				values(fields_concrete.displayed, fields_concrete.status, fields_concrete.url, meta_param.feed_supplier::feed_supplier_enum, (select id from sel1))
			),
			ins1 as (
				insert into concrete_event
					(displayed, status, url, feed_supplier, processed_id)
					select displayed, status, url, feed_supplier, processed_id from val1
					on conflict (feed_supplier, processed_id) do nothing
					returning *
			),
			agg1 as (
				select id, displayed, status, url, feed_supplier, processed_id from ins1
				union
				select ce.id, val1.* from val1
				inner join concrete_event ce using (feed_supplier, processed_id)
			),
			ins4 as (
				insert into meta_concrete_event
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict do nothing
					returning *
			)
			select * into processed from sel1
			;
	else
	end case;

	raise notice 'created event: %', processed.name;

	return processed;
end;
$$
LANGUAGE plpgsql;


create or replace function create_entity_market(queue_param queue, meta_param meta, action text)
returns market
as $$
declare
	processed market;
	current_relation meta;
	entity_relation concrete_event;
	fields_processed fields_processed_market;
	fields_concrete fields_concrete_market;
begin

	-- -- the association
	select * from extract_meta(queue_param.data#>'{associations, EVENT}') into strict current_relation;
	select * from retrieve_processed_entity_without_concrete(null::concrete_event, current_relation) into strict entity_relation; -- joining to the concrete entity

	-- -- fields
	select * from extract_fields(null::fields_processed_market, queue_param.data#>'{fields, processed}') into strict fields_processed;
	select * from extract_fields(null::fields_concrete_market, queue_param.data#>'{fields, concrete}') into strict fields_concrete;

	case action
		when 'UPDATE_AND_CREATE_PROCESSED' then

			with val1(name, canonicalised_name, canonicalised_name_unique) as (
				VALUES (
					meta_param.name,
					meta_param.canonicalised_name,
					meta_param.canonicalised_name_unique
				)
			),
			ins1 as (
				insert into market
					(name, canonicalised_name, canonicalised_name_unique)
					select * from val1
					on conflict (canonicalised_name_unique) do nothing
					returning *
			),
			agg1 as (
				select id, name, canonicalised_name, canonicalised_name_unique from ins1
				union
				select market.id, val1.* from val1
				inner join market using (canonicalised_name_unique)
			),
			ins2 as (
				insert into meta_market
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict (feed_id, feed_supplier) do nothing
					returning *
			),
			val2(
				bet_in_play,
				bet_till,
				betting_status,
				cashout_available,
				eachway_available,
				first_four_available,
				forecast_available,
				guaranteed_price_available,
				place_available,
				quinella_available,
				status,
				tricast_available,
				url,
				display_order,
				is_default,
				feed_supplier,
				processed_id,
				concrete_event_id
			) as (
				values (
					coalesce(fields_concrete.bet_in_play, false),
					fields_concrete.bet_till,
					coalesce(fields_concrete.betting_status, 'PRICED'::betting_status_enum),
					coalesce(fields_concrete.cashout_available, false),
					coalesce(fields_concrete.eachway_available),
					coalesce(fields_concrete.first_four_available),
					coalesce(fields_concrete.forecast_available),
					coalesce(fields_concrete.guaranteed_price_available),
					coalesce(fields_concrete.place_available),
					coalesce(fields_concrete.quinella_available),
					fields_concrete.status,
					coalesce(fields_concrete.tricast_available),
					fields_concrete.url,
					fields_concrete.display_order,
					coalesce(fields_concrete.is_default, false),
					meta_param.feed_supplier::feed_supplier_enum,
					(select id from agg1),
					entity_relation.id
				)
			),
			ins3 as (
				insert into concrete_market
					(
						bet_in_play,
						bet_till,
						betting_status,
						cashout_available,
						eachway_available,
						first_four_available,
						forecast_available,
						guaranteed_price_available,
						place_available,
						quinella_available,
						status,
						tricast_available,
						url,
						display_order,
						is_default,
						feed_supplier,
						processed_id,
						concrete_event_id
					)
					select * from val2
					on conflict (feed_supplier, processed_id) do update
						set
						bet_in_play = excluded.bet_in_play,
						bet_till = excluded.bet_till,
						betting_status = excluded.betting_status,
						cashout_available = excluded.cashout_available,
						eachway_available = excluded.eachway_available,
						first_four_available = excluded.first_four_available,
						forecast_available = excluded.forecast_available,
						guaranteed_price_available = excluded.guaranteed_price_available,
						place_available = excluded.place_available,
						quinella_available = excluded.quinella_available,
						status = excluded.status,
						tricast_available = excluded.tricast_available,
						url = excluded.url,
						display_order = excluded.display_order,
						is_default = excluded.is_default
						-- feed_supplier,
						-- processed_id,
						-- concrete_event_id
					returning *
			),
			agg3 as (
				select
						id,
						bet_in_play,
						bet_till,
						betting_status,
						cashout_available,
						eachway_available,
						first_four_available,
						forecast_available,
						guaranteed_price_available,
						place_available,
						quinella_available,
						status,
						tricast_available,
						url,
						display_order,
						is_default,
						feed_supplier,
						processed_id,
						concrete_event_id from ins3
				union
				select ce.id, val2.* from val2
				inner join concrete_market ce using (feed_supplier, processed_id)
			),
			ins4 as (
				insert into meta_concrete_market
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg3), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict (feed_id, feed_supplier) do nothing
					returning *
			)
			select * into processed from agg1
			;

		when 'UPDATE_AND_CREATE_CONCRETE' then

			with sel1 as (
				select * from retrieve_processed_entity_by_canonicalised(null::market, meta_param)
			),
			val1(
				bet_in_play,
				bet_till,
				betting_status,
				cashout_available,
				eachway_available,
				first_four_available,
				forecast_available,
				guaranteed_price_available,
				place_available,
				quinella_available,
				status,
				tricast_available,
				url,
				display_order,
				is_default,
				feed_supplier,
				processed_id,
				concrete_event_id
			) as (
				values (
					coalesce(fields_concrete.bet_in_play, false),
					fields_concrete.bet_till,
					coalesce(fields_concrete.betting_status, 'PRICED'::betting_status_enum),
					coalesce(fields_concrete.cashout_available, false),
					coalesce(fields_concrete.eachway_available),
					coalesce(fields_concrete.first_four_available),
					coalesce(fields_concrete.forecast_available),
					coalesce(fields_concrete.guaranteed_price_available),
					coalesce(fields_concrete.place_available),
					coalesce(fields_concrete.quinella_available),
					fields_concrete.status,
					coalesce(fields_concrete.tricast_available),
					fields_concrete.url,
					fields_concrete.display_order,
					coalesce(fields_concrete.is_default, false),
					meta_param.feed_supplier::feed_supplier_enum,
					(select id from sel1),
					entity_relation.id
				)
			),
			ins1 as (
				insert into concrete_market
					(
						bet_in_play,
						bet_till,
						betting_status,
						cashout_available,
						eachway_available,
						first_four_available,
						forecast_available,
						guaranteed_price_available,
						place_available,
						quinella_available,
						status,
						tricast_available,
						url,
						display_order,
						is_default,
						feed_supplier,
						processed_id,
						concrete_event_id
					)
					select * from val1
					on conflict (feed_supplier, processed_id) do update
						set
						bet_in_play = excluded.bet_in_play,
						bet_till = excluded.bet_till,
						betting_status = excluded.betting_status,
						cashout_available = excluded.cashout_available,
						eachway_available = excluded.eachway_available,
						first_four_available = excluded.first_four_available,
						forecast_available = excluded.forecast_available,
						guaranteed_price_available = excluded.guaranteed_price_available,
						place_available = excluded.place_available,
						quinella_available = excluded.quinella_available,
						status = excluded.status,
						tricast_available = excluded.tricast_available,
						url = excluded.url,
						display_order = excluded.display_order,
						is_default = excluded.is_default
					returning *
			),
			agg1 as (
				select
					id,
					bet_in_play,
					bet_till,
					betting_status,
					cashout_available,
					eachway_available,
					first_four_available,
					forecast_available,
					guaranteed_price_available,
					place_available,
					quinella_available,
					status,
					tricast_available,
					url,
					display_order,
					is_default,
					feed_supplier,
					processed_id,
					concrete_event_id from ins1
				union
				select ce.id, val1.* from val1
				inner join concrete_market ce using (feed_supplier, processed_id)
			),
			ins4 as (
				insert into meta_concrete_market
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict do nothing
					returning *
			)
			select * into processed from sel1
			;

		when 'CREATE_CONCRETE' then

			with sel1 as (
				select * from retrieve_processed_entity_by_canonicalised(null::market, meta_param)
			),
			val1(
				bet_in_play,
				bet_till,
				betting_status,
				cashout_available,
				eachway_available,
				first_four_available,
				forecast_available,
				guaranteed_price_available,
				place_available,
				quinella_available,
				status,
				tricast_available,
				url,
				display_order,
				is_default,
				feed_supplier,
				processed_id,
				concrete_event_id
			) as (
				values (
					coalesce(fields_concrete.bet_in_play, false),
					fields_concrete.bet_till,
					coalesce(fields_concrete.betting_status, 'PRICED'::betting_status_enum),
					coalesce(fields_concrete.cashout_available, false),
					coalesce(fields_concrete.eachway_available),
					coalesce(fields_concrete.first_four_available),
					coalesce(fields_concrete.forecast_available),
					coalesce(fields_concrete.guaranteed_price_available),
					coalesce(fields_concrete.place_available),
					coalesce(fields_concrete.quinella_available),
					fields_concrete.status,
					coalesce(fields_concrete.tricast_available),
					fields_concrete.url,
					fields_concrete.display_order,
					coalesce(fields_concrete.is_default, false),
					meta_param.feed_supplier::feed_supplier_enum,
					(select id from sel1),
					entity_relation.id
				)
			),
			ins1 as (
				insert into concrete_market
					(
						bet_in_play,
						bet_till,
						betting_status,
						cashout_available,
						eachway_available,
						first_four_available,
						forecast_available,
						guaranteed_price_available,
						place_available,
						quinella_available,
						status,
						tricast_available,
						url,
						display_order,
						is_default,
						feed_supplier,
						processed_id,
						concrete_event_id
					)
					select * from val1
					on conflict (feed_supplier, processed_id) do nothing
					returning *
			),
			agg1 as (
				select
					id,
					bet_in_play,
					bet_till,
					betting_status,
					cashout_available,
					eachway_available,
					first_four_available,
					forecast_available,
					guaranteed_price_available,
					place_available,
					quinella_available,
					status,
					tricast_available,
					url,
					display_order,
					is_default,
					feed_supplier,
					processed_id,
					concrete_event_id from ins1
				union
				select ce.id, val1.* from val1
				inner join concrete_market ce using (feed_supplier, processed_id)
			),
			ins4 as (
				insert into meta_concrete_market
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict do nothing
					returning *
			)
			select * into processed from sel1
			;
	else
	end case;

	raise notice 'created market: %', processed.name;

	return processed;
end;
$$
LANGUAGE plpgsql;



create or replace function create_entity_outcome(queue_param queue, meta_param meta, action text)
returns outcome
as $$
declare
	processed outcome;
	current_relation meta;
	entity_relation concrete_market;
	fields_processed fields_processed_outcome;
	fields_concrete fields_concrete_outcome;
begin

	-- -- the association
	select * from extract_meta(queue_param.data#>'{associations, MARKET}') into strict current_relation;
	select * from retrieve_processed_entity_without_concrete(null::concrete_market, current_relation) into strict entity_relation;

	-- -- fields
	select * from extract_fields(null::fields_processed_outcome, queue_param.data#>'{fields, processed}') into strict fields_processed;
	select * from extract_fields(null::fields_concrete_outcome, queue_param.data#>'{fields, concrete}') into strict fields_concrete;

	case action
		when 'UPDATE_AND_CREATE_PROCESSED' then

			with val1(name, canonicalised_name, canonicalised_name_unique) as (
				VALUES (
					meta_param.name,
					meta_param.canonicalised_name,
					meta_param.canonicalised_name_unique
				)
			),
			ins1 as (
				insert into outcome
					(name, canonicalised_name, canonicalised_name_unique)
					select * from val1
					on conflict (canonicalised_name_unique) do nothing
					returning *
			),
			agg1 as (
				select id, name, canonicalised_name, canonicalised_name_unique from ins1
				union
				select outcome.id, val1.* from val1
				inner join outcome using (canonicalised_name_unique)
			),
			ins2 as (
				insert into meta_outcome
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict (feed_id, feed_supplier) do nothing
					returning *
			),
			val2(
				odds,
				odds_decimal,
				runner_number,
				handicap,
				live_price_available,
				starting_price_available,
				status,
				display_order,
				is_home,
				feed_supplier,
				processed_id,
				concrete_market_id
			) as (
				values (
					fields_concrete.odds,
					fields_concrete.odds_decimal,
					fields_concrete.runner_number,
					fields_concrete.handicap,
					fields_concrete.live_price_available,
					fields_concrete.starting_price_available,
					fields_concrete.status,
					fields_concrete.display_order,
					coalesce(fields_concrete.is_home, false),
					meta_param.feed_supplier::feed_supplier_enum,
					(select id from ins1),
					entity_relation.id
				)
			),
			ins3 as (
				insert into concrete_outcome
					(
						odds,
						odds_decimal,
						runner_number,
						handicap,
						live_price_available,
						starting_price_available,
						status,
						display_order,
						is_home,
						feed_supplier,
						processed_id,
						concrete_market_id
					)
					select * from val2
					on conflict (feed_supplier, processed_id) do update
						set
						odds = excluded.odds,
						odds_decimal = excluded.odds_decimal,
						runner_number = excluded.runner_number,
						handicap = excluded.handicap,
						live_price_available = excluded.live_price_available,
						starting_price_available = excluded.starting_price_available,
						status = excluded.status,
						display_order = excluded.display_order,
						is_home = excluded.is_home
						-- processed_id,
						-- concrete_market_id
					returning *
			),
			agg3 as (
				select
						id,
						odds,
						odds_decimal,
						runner_number,
						handicap,
						live_price_available,
						starting_price_available,
						status,
						display_order,
						is_home,
						feed_supplier,
						processed_id,
						concrete_market_id
					from ins3
				union
				select ce.id, val2.* from val2
				inner join concrete_outcome ce using (feed_supplier, processed_id)
			),
			ins4 as (
				insert into meta_concrete_outcome
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg3), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict (feed_id, feed_supplier) do nothing
					returning *
			)
			select * into processed from agg1
			;

		when 'UPDATE_AND_CREATE_CONCRETE' then

			with sel1 as (
				select * from retrieve_processed_entity_by_canonicalised(null::outcome, meta_param)
			),
			val1(
				odds,
				odds_decimal,
				runner_number,
				handicap,
				live_price_available,
				starting_price_available,
				status,
				display_order,
				is_home,
				feed_supplier,
				processed_id,
				concrete_market_id
			) as (
				values (
					fields_concrete.odds,
					fields_concrete.odds_decimal,
					fields_concrete.runner_number,
					fields_concrete.handicap,
					fields_concrete.live_price_available,
					fields_concrete.starting_price_available,
					fields_concrete.status,
					fields_concrete.display_order,
					coalesce(fields_concrete.is_home, false),
					meta_param.feed_supplier::feed_supplier_enum,
					(select id from sel1),
					entity_relation.id
				)
			),
			ins1 as (
				insert into concrete_outcome (
					odds,
					odds_decimal,
					runner_number,
					handicap,
					live_price_available,
					starting_price_available,
					status,
					display_order,
					is_home,
					feed_supplier,
					processed_id,
					concrete_market_id
				)
				select * from val1
				on conflict (feed_supplier, processed_id) do update
					set
					odds = excluded.odds,
					odds_decimal = excluded.odds_decimal,
					runner_number = excluded.runner_number,
					handicap = excluded.handicap,
					live_price_available = excluded.live_price_available,
					starting_price_available = excluded.starting_price_available,
					status = excluded.status,
					display_order = excluded.display_order,
					is_home = excluded.is_home
					-- processed_id,
					-- concrete_market_id
				returning *
			),
			agg1 as (
				select
					id,
					odds,
					odds_decimal,
					runner_number,
					handicap,
					live_price_available,
					starting_price_available,
					status,
					display_order,
					is_home,
					feed_supplier,
					processed_id,
					concrete_market_id
				from ins1
				union
				select ce.id, val1.* from val1
				inner join concrete_outcome ce using (feed_supplier, processed_id)
			),
			ins4 as (
				insert into meta_concrete_outcome
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict do nothing
					returning *
			)
			select * into processed from sel1
			;

		when 'CREATE_CONCRETE' then

			with sel1 as (
				select * from retrieve_processed_entity_by_canonicalised(null::outcome, meta_param)
			),
			val1(
				odds,
				odds_decimal,
				runner_number,
				handicap,
				live_price_available,
				starting_price_available,
				status,
				display_order,
				is_home,
				feed_supplier,
				processed_id,
				concrete_market_id
			) as (
				values (
					fields_concrete.odds,
					fields_concrete.odds_decimal,
					fields_concrete.runner_number,
					fields_concrete.handicap,
					fields_concrete.live_price_available,
					fields_concrete.starting_price_available,
					fields_concrete.status,
					fields_concrete.display_order,
					coalesce(fields_concrete.is_home, false),
					meta_param.feed_supplier::feed_supplier_enum,
					(select id from sel1),
					entity_relation.id
				)
			),
			ins1 as (
				insert into concrete_outcome (
					odds,
					odds_decimal,
					runner_number,
					handicap,
					live_price_available,
					starting_price_available,
					status,
					display_order,
					is_home,
					feed_supplier,
					processed_id,
					concrete_market_id
				)
				select * from val1
				on conflict (feed_supplier, processed_id) do nothing
				returning *
			),
			agg1 as (
				select
					id,
					odds,
					odds_decimal,
					runner_number,
					handicap,
					live_price_available,
					starting_price_available,
					status,
					display_order,
					is_home,
					feed_supplier,
					processed_id,
					concrete_market_id
				from ins1
				union
				select ce.id, val1.* from val1
				inner join concrete_outcome ce using (feed_supplier, processed_id)
			),
			ins4 as (
				insert into meta_concrete_outcome
					(id, feed_id, run_id, feed_supplier, url)
					values
					((select id from agg1), meta_param.id, meta_param.run_id, meta_param.feed_supplier::feed_supplier_enum, meta_param.url)
					on conflict do nothing
					returning *
			)
			select * into processed from sel1
			;
	else
	end case;

	raise notice 'created outcome: %', processed.name;

	return processed;
end;
$$
LANGUAGE plpgsql;



create or replace function create_entity_market_collection(queue_param queue, meta_param meta)
returns market_collection
as $$
declare
	processed market_collection;
	current_relation meta;
	entity_relation market;
	fields_processed fields_processed_market_collection;
	join_add_query text := 'insert into market_collection_join_market (market_collection_id, market_id) values ($1, $2) on conflict do nothing';
begin

	-- -- fields
	select * from extract_fields(null::fields_processed_market_collection, queue_param.data#>'{fields, processed}') into strict fields_processed;

	-- insert selects returning - https://goo.gl/cRvqZb
	with input_rows(name, canonicalised_name, canonicalised_name_unique, display_order) as (
		values (meta_param.name::text, meta_param.canonicalised_name::text, meta_param.canonicalised_name_unique::text, fields_processed.display_order::int)
	),
	ins1 as (
		insert into market_collection (name, canonicalised_name, canonicalised_name_unique, display_order)
			select * from input_rows
			on conflict (canonicalised_name_unique) do nothing
			returning id, name, canonicalised_name, canonicalised_name_unique, display_order
	),
	agg as (
		select ins1.id, ins1.name, ins1.canonicalised_name, ins1.canonicalised_name_unique, ins1.display_order from ins1
		UNION ALL
		select mc.id, input_rows.name, input_rows.canonicalised_name, input_rows.canonicalised_name_unique, input_rows.display_order from input_rows
		join market_collection mc using (canonicalised_name_unique)
	)
	select agg.*
	from agg
	into strict processed
	;

	raise notice 'market_collection processed: %', processed;

	-- -- the associations (multiple)
	for current_relation in select * from extract_meta(queue_param.data#>'{associations, MARKET}')
	loop
		select * from retrieve_processed_entity_with_concrete(null::market, current_relation) into strict entity_relation;

		raise debug 'market_collection join query: %. processed id: %. market id: %.', join_add_query, processed.id, entity_relation.id;
		execute join_add_query using processed.id, entity_relation.id;
	end loop;

	return processed;
end;
$$
LANGUAGE plpgsql;



-- -- finds existing processed entities
-- -- - will have runtime exception if multiple found somehow (because of the 'record' return type - https://goo.gl/UN1nBL
-- -- - should return null/void if not found
-- -- - perhaps this function can be shared with multiple entity types
-- create or replace function retrieve_processed_entity_by_canonicalised(table_name anyelement, meta_param meta)
-- returns anyelement -- polymorphic functions - https://goo.gl/DjDg3U / pseudo types - https://goo.gl/co6uW6
-- as $$
-- declare
-- 	ent_record record;
-- 	row_count integer;
-- 	-- dynamic queries - us format when including tablename etc, using `using` when literal values - https://goo.gl/WACjsV
-- 	query text := format('select p.*
-- 		from %I p
-- 		inner join meta_%I mp on p.id = mp.id
-- 		where
-- 			(mp.feed_id = $1 and mp.feed_supplier::text = $2)
-- 		or p.canonicalised_name_unique = $3
-- 		'
-- 		, pg_typeof(table_name), pg_typeof(table_name));
-- begin

-- 	raise debug 'retrieve_processed_entity query: %. id: %. feed_supplier: %. canonicalised_name_unique: %', query, meta_param.id, meta_param.feed_supplier, meta_param.canonicalised_name_unique;

-- 	-- returning query does only add rows to the block`s return - https://goo.gl/JaLgZx
-- 	-- examples here - https://goo.gl/JT2DF9
-- 	-- EXECUTE query INTO ent_record; -- execute ... using - https://goo.gl/G6E32H
-- 	EXECUTE query INTO ent_record using meta_param.id, meta_param.feed_supplier, meta_param.canonicalised_name_unique; -- execute ... using - https://goo.gl/G6E32H


-- 	GET DIAGNOSTICS row_count = ROW_COUNT;
-- 	IF row_count > 1 THEN
-- 		RAISE EXCEPTION '% % not unique', table_name, meta_param.canonicalised_name_unique;
-- 		RAISE EXCEPTION 'Not unique processed!  table_name: %. id: %. feed supplier: %. canonicalised_name_unique: %.', table_name, meta_param.id, meta_param.feed_supplier, meta_param.canonicalised_name_unique;
--    	END IF;

-- 	return ent_record;
-- end;
-- $$
-- LANGUAGE plpgsql;


/**
 * This is the application of our "renaming" strategy. By this point, the meta_param will have had
 * `apply_renaming` and `apply_canonicalised` so that its canonicalised_name_unique will match an existing
 * if we have the right rules in place.
 * Only invoked after we've drawn a blank through the [feed_id, feed_supplier] functions below
 */
create or replace function retrieve_processed_entity_by_canonicalised(table_name anyelement, meta_param meta)
returns anyelement
as $$
declare
	ent_record record;
	row_count integer;
	query text := format('select p.*
		from %I p
		where
			(p.canonicalised_name_unique = $1)
		'
		, pg_typeof(table_name));
begin

	raise debug 'retrieve_processed_entity_by_canonicalised query: %. canonicalised_name_unique: %', query, meta_param.canonicalised_name_unique;

	EXECUTE query INTO ent_record using meta_param.canonicalised_name_unique;

	GET DIAGNOSTICS row_count = ROW_COUNT;
	IF row_count > 1 THEN
		RAISE EXCEPTION 'Not unique retrieve_processed_entity_by_canonicalised result!  table_name: %. canonicalised_name_unique: %.', table_name, meta_param.canonicalised_name_unique;
   	END IF;

	return ent_record;
end;
$$
LANGUAGE plpgsql;


/**
 * Checks whether we've successfully saved a category entry before - i.e. just checks the feed_id and feed_supplier
 * Remember, categories do not have concrete
 */
create or replace function retrieve_processed_entity_without_concrete(table_name anyelement, meta_param meta)
returns anyelement
as $$
declare
	ent_record record;
	row_count integer;
	query text := format('select p.*
		from %I p
		inner join meta_%I mp on p.id = mp.id
		where
			(mp.feed_id = $1 and mp.feed_supplier::text = $2)
		'
		, pg_typeof(table_name), pg_typeof(table_name));
begin

	raise debug 'retrieve_processed_entity_without_concrete query: %. feed_id: %. feed_supplier: %', query, meta_param.id, meta_param.feed_supplier;

	EXECUTE query INTO ent_record using meta_param.id, meta_param.feed_supplier, meta_param.canonicalised_name_unique;

	GET DIAGNOSTICS row_count = ROW_COUNT;
	IF row_count > 1 THEN
		RAISE EXCEPTION 'Not unique retrieve_processed_entity_without_concrete result!  table_name: %. feed_id: %. feed supplier: %', table_name, meta_param.id, meta_param.feed_supplier;
   	END IF;

	return ent_record;
end;
$$
LANGUAGE plpgsql;

/**
 * Checks whether we've successfully saved a feed entry before - i.e. just checks the feed_id and feed_supplier
 */
create or replace function retrieve_processed_entity_with_concrete(table_name anyelement, meta_param meta)
returns anyelement
as $$
declare
	ent_record record;
	row_count integer;
	query text := format('select p.*
		from %I p
		inner join concrete_%I c on c.processed_id = p.id
		inner join meta_concrete_%I mc on c.id = mc.id
		where
			(mc.feed_id = $1 and mc.feed_supplier::text = $2)
		'
		, pg_typeof(table_name), pg_typeof(table_name), pg_typeof(table_name));
begin

	raise debug 'retrieve_processed_entity_with_concrete query: %. feed_id: %. feed_supplier: %', query, meta_param.id, meta_param.feed_supplier;

	EXECUTE query INTO ent_record using meta_param.id, meta_param.feed_supplier, meta_param.canonicalised_name_unique;

	GET DIAGNOSTICS row_count = ROW_COUNT;
	IF row_count > 1 THEN
		RAISE EXCEPTION 'Not unique retrieve_processed_entity_with_concrete result!  table_name: %. feed_id: %. feed supplier: %', table_name, meta_param.id, meta_param.feed_supplier;
   	END IF;

	return ent_record;
end;
$$
LANGUAGE plpgsql;



create or replace function retrieve_concrete_entity(table_name anyelement, meta_param meta)
returns anyelement
as $$
declare
	ent_record record;
	row_count integer;
	query text := format('select c.*
		from %I c
		inner join meta_%I mc on c.id = mc.id
		where
			(mc.feed_id = $1 and mc.feed_supplier::text = $2)
		'
		, pg_typeof(table_name), pg_typeof(table_name));
begin

	raise debug 'retrieve concrete query: %. id: %. feed_supplier: %.', query, meta_param.id, meta_param.feed_supplier;

	EXECUTE query INTO ent_record using meta_param.id, meta_param.feed_supplier;

	GET DIAGNOSTICS row_count = ROW_COUNT;
	IF row_count > 1 THEN
		RAISE EXCEPTION 'Not unique concrete!  table_name: %. id: %. feed supplier: %.', table_name, meta_param.id, meta_param.feed_supplier;
   	END IF;

	return ent_record;
end;
$$
LANGUAGE plpgsql;


create or replace function extract_meta(meta_type anyelement, json_param jsonb)
returns anyelement
as $$
begin
	return jsonb_populate_record(meta_type, json_param); -- https://goo.gl/LUzsm2
end;
$$
LANGUAGE plpgsql;

-- function overloading
create or replace function extract_meta(json_param jsonb)
returns setof meta
as $$
declare
	count int;
begin

	return query select * from jsonb_populate_recordset(null::meta, json_param);
end;
$$
LANGUAGE plpgsql;


create or replace function extract_crunch_tmp(json_param jsonb)
returns crunch_tmp
as $$
begin

	return jsonb_populate_record(null::crunch_tmp, json_param);
end;
$$
LANGUAGE plpgsql;


create or replace function extract_fields(fields_type anyelement, json_param jsonb)
returns anyelement
as $$
begin
	raise debug 'extract_fields: fields_type: %. json_param: %.', fields_type, json_param;
	return jsonb_populate_record(fields_type, json_param);
end;
$$
LANGUAGE plpgsql;


create or replace function apply_renaming(entity_name text, meta_param meta)
returns meta
as $$
declare
	rule rename;
	replace_result text;
	query text := 'select r.*
		from rename r
		where
			r.entity_name = $1::entity_name_enum
		order by display_order, id
		';
begin

	for rule in EXECUTE query using entity_name
	loop
		replace_result := regexp_replace(meta_param.name, rule.regex_search, rule.regex_replace, 'ig');
		raise notice 'applying rename rule for entity %: % -> %. Before: %. After: %.', entity_name, rule.regex_search, rule.regex_replace, meta_param.name, replace_result;
		meta_param.name := replace_result;
	end loop;

	return meta_param;
end;
$$
LANGUAGE plpgsql;

create or replace function apply_canonicalise(meta_param meta, append text)
returns meta
as $$
begin

	meta_param.canonicalised_name = canonicalise(meta_param.name);
	meta_param.canonicalised_name_unique = canonicalise(meta_param.name || append);

	return meta_param;
end;
$$
LANGUAGE plpgsql;
