-- noinspection SqlNoDataSourceInspectionForFile

alter table IF EXISTS ONLY events drop constraint if exists unq_events;
ALTER TABLE IF EXISTS ONLY markets drop constraint if exists unq_markets;
ALTER TABLE IF EXISTS ONLY outcomes drop constraint if exists unq_outcomes;
ALTER TABLE IF EXISTS ONLY bookieevents drop constraint if exists unq_bookieevents;
ALTER TABLE IF EXISTS ONLY bookiemarkets drop constraint if exists unq_bookiemarkets;
ALTER TABLE IF EXISTS ONLY bookieoutcomes drop constraint if exists unq_bookieoutcomes;

ALTER TABLE IF EXISTS ONLY category1 drop constraint if exists unq_category1;
ALTER TABLE IF EXISTS ONLY category2 drop constraint if exists unq_category2;
ALTER TABLE IF EXISTS ONLY category3 drop constraint if exists unq_category3;

ALTER TABLE IF EXISTS ONLY metaevent drop constraint if exists unq_metaevent;
ALTER TABLE IF EXISTS ONLY metamarket drop constraint if exists unq_metamarket;
ALTER TABLE IF EXISTS ONLY metaoutcome drop constraint if exists unq_metaoutcome;
ALTER TABLE IF EXISTS ONLY metabookieevent drop constraint if exists unq_metabookieevent;
ALTER TABLE IF EXISTS ONLY metabookiemarket drop constraint if exists unq_metabookiemarket;
ALTER TABLE IF EXISTS ONLY metabookieoutcome drop constraint if exists unq_metabookieoutcome;
ALTER TABLE IF EXISTS ONLY metacategory1 drop constraint if exists unq_metacategory1;
ALTER TABLE IF EXISTS ONLY metacategory2 drop constraint if exists unq_metacategory2;
ALTER TABLE IF EXISTS ONLY metacategory3 drop constraint if exists unq_metacategory3;

DROP EXTENSION IF EXISTS plpgsql CASCADE;  -- removes any triggers we may have so be careful

ALTER TABLE IF EXISTS ONLY public.reports DROP CONSTRAINT IF EXISTS fk_f11fa74551a5bc03;