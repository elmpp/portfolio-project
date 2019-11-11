-- noinspection SqlNoDataSourceInspectionForFile

alter table events drop constraint if exists unq_events;
alter table markets drop constraint if exists  unq_markets;
alter table outcomes drop constraint if exists  unq_outcomes;
alter table bookieevents drop constraint if exists  unq_bookieevents;
alter table bookiemarkets drop constraint if exists  unq_bookiemarkets;
alter table bookieoutcomes drop constraint if exists  unq_bookieoutcomes;

alter table category1 drop constraint if exists  unq_category1;
alter table category2 drop constraint if exists  unq_category2;
alter table category3 drop constraint if exists  unq_category3;

alter table metaevent drop constraint if exists  unq_metaevent;
alter table metamarket drop constraint if exists  unq_metamarket;
alter table metaoutcome drop constraint if exists  unq_metaoutcome;
alter table metabookieevent drop constraint if exists  unq_metabookieevent;
alter table metabookiemarket drop constraint if exists  unq_metabookiemarket;
alter table metabookieoutcome drop constraint if exists  unq_metabookieoutcome;
alter table metacategory1 drop constraint if exists  unq_metacategory1;
alter table metacategory2 drop constraint if exists  unq_metacategory2;
alter table metacategory3 drop constraint if exists  unq_metacategory3;


alter table events add constraint unq_events unique using index unq_events;
alter table markets add constraint unq_markets unique using index unq_markets;
alter table outcomes add constraint unq_outcomes unique using index unq_outcomes;
alter table bookieevents add constraint unq_bookieevents unique using index unq_bookieevents;
alter table bookiemarkets add constraint unq_bookiemarkets unique using index unq_bookiemarkets;
alter table bookieoutcomes add constraint unq_bookieoutcomes unique using index unq_bookieoutcomes;

alter table category1 add constraint unq_category1 unique using index unq_category1;
alter table category2 add constraint unq_category2 unique using index unq_category2;
alter table category3 add constraint unq_category3 unique using index unq_category3;

alter table metaevent add constraint unq_metaevent unique using index unq_metaevent;
alter table metamarket add constraint unq_metamarket unique using index unq_metamarket;
alter table metaoutcome add constraint unq_metaoutcome unique using index unq_metaoutcome;
alter table metabookieevent add constraint unq_metabookieevent unique using index unq_metabookieevent;
alter table metabookiemarket add constraint unq_metabookiemarket unique using index unq_metabookiemarket;
alter table metabookieoutcome add constraint unq_metabookieoutcome unique using index unq_metabookieoutcome;
alter table metacategory1 add constraint unq_metacategory1 unique using index unq_metacategory1;
alter table metacategory2 add constraint unq_metacategory2 unique using index unq_metacategory2;
alter table metacategory3 add constraint unq_metacategory3 unique using index unq_metacategory3;

-- required to enforce uniqueness when nullable fields are all null (postgres ignores them)
-- http://dba.stackexchange.com/questions/9759/postgresql-multi-column-unique-constraint-and-null-values
CREATE UNIQUE INDEX IF NOT EXISTS partial_unique_subents ON featuredevent (domain_id, type) WHERE outcome_id IS NULL;

CREATE EXTENSION if not exists citext;