-- declaring plpgsql types - https://goo.gl/pwBK4y
-- all types - https://goo.gl/co6uW6

-- feed_supplier_enum = feed_supplier_enum

DO $$ BEGIN
	create type meta as (
		-- mandatory meta fields
		id bigint,
		name text,
		canonicalised_name text,
		canonicalised_name_unique text,
		feed_supplier text, -- keep as text here because the enums have differing names
		-- fetch meta fields
		run_id uuid,
		url text
	);
EXCEPTION
	WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
	create type crunch_tmp as (
		unique_append text,
		action text,
		suggest_rename_rules boolean
	);
EXCEPTION
	WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
	create type fields_processed_category as (
		display_order int
	);
EXCEPTION
	WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
	create type fields_processed_event as (
		event_date timestamptz,
		type event_type_enum,
		display_order int
	);
EXCEPTION
	WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
	create type fields_concrete_event as (
		displayed boolean,
		status status_enum,
		url text
	);
EXCEPTION
	WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
	create type fields_processed_market as (
	);
EXCEPTION
	WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
	create type fields_concrete_market as (
		bet_in_play boolean,
		bet_till timestamptz,
		betting_status betting_status_enum,
		cashout_available boolean,
		eachway_available boolean,
		first_four_available boolean,
		forecast_available boolean,
		guaranteed_price_available boolean,
		place_available boolean,
		quinella_available boolean,
		status status_enum,
		tricast_available boolean,
		url text,
		display_order int,
		is_default boolean
	);
EXCEPTION
	WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
	create type fields_processed_outcome as (
	);

EXCEPTION
	WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
	create type fields_concrete_outcome as (
		odds text,
		odds_decimal real, -- https://goo.gl/bGv8BB
		runner_number smallint,
		handicap text,
		live_price_available boolean,
		starting_price_available boolean,
		status status_enum,
		display_order int,
		is_home boolean
	);
EXCEPTION
	WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
	create type fields_processed_market_collection as (
		display_order int
	);
EXCEPTION
	WHEN duplicate_object THEN null;
END $$;




