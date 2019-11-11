--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.category2 DROP CONSTRAINT IF EXISTS fk_f6b00032987ae85a;
ALTER TABLE IF EXISTS ONLY public.aliasevent DROP CONSTRAINT IF EXISTS fk_f5a70b9c115f0ee5;
ALTER TABLE IF EXISTS ONLY public.metaevent DROP CONSTRAINT IF EXISTS fk_f52d09ff51a5bc03;
ALTER TABLE IF EXISTS ONLY public.metaevent DROP CONSTRAINT IF EXISTS fk_f52d09ff115f0ee5;
ALTER TABLE IF EXISTS ONLY public.metacategory1 DROP CONSTRAINT IF EXISTS fk_f34eca351a5bc03;
ALTER TABLE IF EXISTS ONLY public.metacategory1 DROP CONSTRAINT IF EXISTS fk_f34eca3115f0ee5;
ALTER TABLE IF EXISTS ONLY public.reports DROP CONSTRAINT IF EXISTS fk_f11fa74551a5bc03;
ALTER TABLE IF EXISTS ONLY public.footballstatsparticipants DROP CONSTRAINT IF EXISTS fk_f0a4e9eabf396750;
ALTER TABLE IF EXISTS ONLY public.statsparticipants DROP CONSTRAINT IF EXISTS fk_f0129f369d1c3019;
ALTER TABLE IF EXISTS ONLY public.metafixture DROP CONSTRAINT IF EXISTS fk_ee8e088b51a5bc03;
ALTER TABLE IF EXISTS ONLY public.metafixture DROP CONSTRAINT IF EXISTS fk_ee8e088b115f0ee5;
ALTER TABLE IF EXISTS ONLY public.metamarket DROP CONSTRAINT IF EXISTS fk_ed2df0e51a5bc03;
ALTER TABLE IF EXISTS ONLY public.metamarket DROP CONSTRAINT IF EXISTS fk_ed2df0e115f0ee5;
ALTER TABLE IF EXISTS ONLY public.aliascategory1 DROP CONSTRAINT IF EXISTS fk_e44f10e1115f0ee5;
ALTER TABLE IF EXISTS ONLY public.metacategory3 DROP CONSTRAINT IF EXISTS fk_e13a8d8f51a5bc03;
ALTER TABLE IF EXISTS ONLY public.metacategory3 DROP CONSTRAINT IF EXISTS fk_e13a8d8f115f0ee5;
ALTER TABLE IF EXISTS ONLY public.metaoutcome DROP CONSTRAINT IF EXISTS fk_dbd725a751a5bc03;
ALTER TABLE IF EXISTS ONLY public.metaoutcome DROP CONSTRAINT IF EXISTS fk_dbd725a7115f0ee5;
ALTER TABLE IF EXISTS ONLY public.aliasmarket DROP CONSTRAINT IF EXISTS fk_da6965ee115f0ee5;
ALTER TABLE IF EXISTS ONLY public.offers DROP CONSTRAINT IF EXISTS fk_da460427987ae85a;
ALTER TABLE IF EXISTS ONLY public.offers DROP CONSTRAINT IF EXISTS fk_da4604278340c221;
ALTER TABLE IF EXISTS ONLY public.offers DROP CONSTRAINT IF EXISTS fk_da460427115f0ee5;
ALTER TABLE IF EXISTS ONLY public.classification__tag DROP CONSTRAINT IF EXISTS fk_ca57a1c7e25d857e;
ALTER TABLE IF EXISTS ONLY public.sites DROP CONSTRAINT IF EXISTS fk_bc00aa63f92f3e70;
ALTER TABLE IF EXISTS ONLY public.sites DROP CONSTRAINT IF EXISTS fk_bc00aa638340c221;
ALTER TABLE IF EXISTS ONLY public.sites DROP CONSTRAINT IF EXISTS fk_bc00aa6351a5bc03;
ALTER TABLE IF EXISTS ONLY public.metabookiemarket DROP CONSTRAINT IF EXISTS fk_b8746c3151a5bc03;
ALTER TABLE IF EXISTS ONLY public.metabookiemarket DROP CONSTRAINT IF EXISTS fk_b8746c31115f0ee5;
ALTER TABLE IF EXISTS ONLY public.metaentrant DROP CONSTRAINT IF EXISTS fk_b510e67051a5bc03;
ALTER TABLE IF EXISTS ONLY public.metaentrant DROP CONSTRAINT IF EXISTS fk_b510e670115f0ee5;
ALTER TABLE IF EXISTS ONLY public.statsfixtures DROP CONSTRAINT IF EXISTS fk_b14b4514e524616d;
ALTER TABLE IF EXISTS ONLY public.marketmarketroles DROP CONSTRAINT IF EXISTS fk_a9a20308f946e23;
ALTER TABLE IF EXISTS ONLY public.marketmarketroles DROP CONSTRAINT IF EXISTS fk_a9a20308622f3f37;
ALTER TABLE IF EXISTS ONLY public.marketroles DROP CONSTRAINT IF EXISTS fk_a417a76c987ae85a;
ALTER TABLE IF EXISTS ONLY public.aliascategory3 DROP CONSTRAINT IF EXISTS fk_a4171cd115f0ee5;
ALTER TABLE IF EXISTS ONLY public.classification__collection DROP CONSTRAINT IF EXISTS fk_a406b56aea9fdd75;
ALTER TABLE IF EXISTS ONLY public.classification__collection DROP CONSTRAINT IF EXISTS fk_a406b56ae25d857e;
ALTER TABLE IF EXISTS ONLY public.featuredevent DROP CONSTRAINT IF EXISTS fk_9c4df7c0ea9fdd75;
ALTER TABLE IF EXISTS ONLY public.featuredevent DROP CONSTRAINT IF EXISTS fk_9c4df7c0e6ee6d63;
ALTER TABLE IF EXISTS ONLY public.featuredevent DROP CONSTRAINT IF EXISTS fk_9c4df7c0115f0ee5;
ALTER TABLE IF EXISTS ONLY public.metacategory2 DROP CONSTRAINT IF EXISTS fk_963dbd1951a5bc03;
ALTER TABLE IF EXISTS ONLY public.metacategory2 DROP CONSTRAINT IF EXISTS fk_963dbd19115f0ee5;
ALTER TABLE IF EXISTS ONLY public.featuredoffer DROP CONSTRAINT IF EXISTS fk_8e357a59ea9fdd75;
ALTER TABLE IF EXISTS ONLY public.featuredoffer DROP CONSTRAINT IF EXISTS fk_8e357a59115f0ee5;
ALTER TABLE IF EXISTS ONLY public.bookieoutcomes DROP CONSTRAINT IF EXISTS fk_8cc83beff104737;
ALTER TABLE IF EXISTS ONLY public.bookieoutcomes DROP CONSTRAINT IF EXISTS fk_8cc83befe6ee6d63;
ALTER TABLE IF EXISTS ONLY public.bookieoutcomes DROP CONSTRAINT IF EXISTS fk_8cc83bef8340c221;
ALTER TABLE IF EXISTS ONLY public.category3 DROP CONSTRAINT IF EXISTS fk_81b730a48acf47b4;
ALTER TABLE IF EXISTS ONLY public.media__gallery_media DROP CONSTRAINT IF EXISTS fk_80d4c541ea9fdd75;
ALTER TABLE IF EXISTS ONLY public.media__gallery_media DROP CONSTRAINT IF EXISTS fk_80d4c5414e7af8f;
ALTER TABLE IF EXISTS ONLY public.aliascategory2 DROP CONSTRAINT IF EXISTS fk_7d46415b115f0ee5;
ALTER TABLE IF EXISTS ONLY public.aliasoutcome DROP CONSTRAINT IF EXISTS fk_7b097c65115f0ee5;
ALTER TABLE IF EXISTS ONLY public.entrants DROP CONSTRAINT IF EXISTS fk_768d504ee6ee6d63;
ALTER TABLE IF EXISTS ONLY public.entrants DROP CONSTRAINT IF EXISTS fk_768d504eb71244ed;
ALTER TABLE IF EXISTS ONLY public.bookieevents DROP CONSTRAINT IF EXISTS fk_762538b98340c221;
ALTER TABLE IF EXISTS ONLY public.bookieevents DROP CONSTRAINT IF EXISTS fk_762538b971f7e88b;
ALTER TABLE IF EXISTS ONLY public.participants DROP CONSTRAINT IF EXISTS fk_71697092e524616d;
ALTER TABLE IF EXISTS ONLY public.participants DROP CONSTRAINT IF EXISTS fk_716970928bff9d26;
ALTER TABLE IF EXISTS ONLY public.outcomes DROP CONSTRAINT IF EXISTS fk_6e54d0fab71244ed;
ALTER TABLE IF EXISTS ONLY public.outcomes DROP CONSTRAINT IF EXISTS fk_6e54d0faa2696999;
ALTER TABLE IF EXISTS ONLY public.outcomes DROP CONSTRAINT IF EXISTS fk_6e54d0fa987ae85a;
ALTER TABLE IF EXISTS ONLY public.outcomes DROP CONSTRAINT IF EXISTS fk_6e54d0fa4e7af8f;
ALTER TABLE IF EXISTS ONLY public.outcomes DROP CONSTRAINT IF EXISTS fk_6e54d0fa1ad50efc;
ALTER TABLE IF EXISTS ONLY public.metabookieoutcome DROP CONSTRAINT IF EXISTS fk_6d07ae2951a5bc03;
ALTER TABLE IF EXISTS ONLY public.metabookieoutcome DROP CONSTRAINT IF EXISTS fk_6d07ae29115f0ee5;
ALTER TABLE IF EXISTS ONLY public.fixtures DROP CONSTRAINT IF EXISTS fk_5cb9e53471f7e88b;
ALTER TABLE IF EXISTS ONLY public.fixtures DROP CONSTRAINT IF EXISTS fk_5cb9e534327320d1;
ALTER TABLE IF EXISTS ONLY public.media__media DROP CONSTRAINT IF EXISTS fk_5c6dd74e12469de2;
ALTER TABLE IF EXISTS ONLY public.feeds DROP CONSTRAINT IF EXISTS fk_5a29f52f8340c221;
ALTER TABLE IF EXISTS ONLY public.events DROP CONSTRAINT IF EXISTS fk_5387574ab71244ed;
ALTER TABLE IF EXISTS ONLY public.events DROP CONSTRAINT IF EXISTS fk_5387574aa2696999;
ALTER TABLE IF EXISTS ONLY public.events DROP CONSTRAINT IF EXISTS fk_5387574a327320d1;
ALTER TABLE IF EXISTS ONLY public.events DROP CONSTRAINT IF EXISTS fk_5387574a1ad50efc;
ALTER TABLE IF EXISTS ONLY public.eventarticles DROP CONSTRAINT IF EXISTS fk_4ec279babf396750;
ALTER TABLE IF EXISTS ONLY public.eventarticles DROP CONSTRAINT IF EXISTS fk_4ec279ba115f0ee5;
ALTER TABLE IF EXISTS ONLY public.classification__category DROP CONSTRAINT IF EXISTS fk_43629b36ea9fdd75;
ALTER TABLE IF EXISTS ONLY public.classification__category DROP CONSTRAINT IF EXISTS fk_43629b36e25d857e;
ALTER TABLE IF EXISTS ONLY public.classification__category DROP CONSTRAINT IF EXISTS fk_43629b36727aca70;
ALTER TABLE IF EXISTS ONLY public.footballstatsfixtures DROP CONSTRAINT IF EXISTS fk_42744daebf396750;
ALTER TABLE IF EXISTS ONLY public.metabookieevent DROP CONSTRAINT IF EXISTS fk_35b30bc051a5bc03;
ALTER TABLE IF EXISTS ONLY public.metabookieevent DROP CONSTRAINT IF EXISTS fk_35b30bc0115f0ee5;
ALTER TABLE IF EXISTS ONLY public.bookiemarkets DROP CONSTRAINT IF EXISTS fk_3342797f936b039e;
ALTER TABLE IF EXISTS ONLY public.bookiemarkets DROP CONSTRAINT IF EXISTS fk_3342797f8340c221;
ALTER TABLE IF EXISTS ONLY public.bookiemarkets DROP CONSTRAINT IF EXISTS fk_3342797f622f3f37;
ALTER TABLE IF EXISTS ONLY public.banners DROP CONSTRAINT IF EXISTS fk_250f256853c674ee;
ALTER TABLE IF EXISTS ONLY public.markets DROP CONSTRAINT IF EXISTS fk_17d378b6b71244ed;
ALTER TABLE IF EXISTS ONLY public.markets DROP CONSTRAINT IF EXISTS fk_17d378b6a2696999;
ALTER TABLE IF EXISTS ONLY public.markets DROP CONSTRAINT IF EXISTS fk_17d378b6987ae85a;
ALTER TABLE IF EXISTS ONLY public.markets DROP CONSTRAINT IF EXISTS fk_17d378b61ad50efc;
DROP INDEX IF EXISTS public.unq_participants;
DROP INDEX IF EXISTS public.unq_metafixture;
DROP INDEX IF EXISTS public.unq_metaentrant;
DROP INDEX IF EXISTS public.unq_fixtures;
DROP INDEX IF EXISTS public.unq_category1_name;
DROP INDEX IF EXISTS public.uniq_f0129f369d1c3019;
DROP INDEX IF EXISTS public.uniq_bc00aa635e237e06;
DROP INDEX IF EXISTS public.uniq_bc00aa6351a5bc03;
DROP INDEX IF EXISTS public.uniq_b14b4514e524616d;
DROP INDEX IF EXISTS public.uniq_86fe630a2f98e47;
DROP INDEX IF EXISTS public.uniq_6e54d0fab71244ed;
DROP INDEX IF EXISTS public.uniq_6e54d0faa2696999;
DROP INDEX IF EXISTS public.uniq_6e54d0fa1ad50efc;
DROP INDEX IF EXISTS public.uniq_5d66ebad77153098;
DROP INDEX IF EXISTS public.uniq_5d66ebad6c68a7e2;
DROP INDEX IF EXISTS public.uniq_5d66ebad5e237e06;
DROP INDEX IF EXISTS public.uniq_5cb9e53471f7e88b;
DROP INDEX IF EXISTS public.uniq_5a29f52f5e237e06;
DROP INDEX IF EXISTS public.uniq_5387574ab71244ed;
DROP INDEX IF EXISTS public.uniq_5387574aa2696999;
DROP INDEX IF EXISTS public.uniq_5387574a1ad50efc;
DROP INDEX IF EXISTS public.uniq_1922e0685e237e06;
DROP INDEX IF EXISTS public.uniq_17d378b6b71244ed;
DROP INDEX IF EXISTS public.uniq_17d378b6a2696999;
DROP INDEX IF EXISTS public.uniq_17d378b61ad50efc;
DROP INDEX IF EXISTS public.tag_context;
DROP INDEX IF EXISTS public.tag_collection;
DROP INDEX IF EXISTS public.partial_unique_subents;
DROP INDEX IF EXISTS public.outcomes_expired_cat1_idx;
DROP INDEX IF EXISTS public.offer_element_unq;
DROP INDEX IF EXISTS public.name_index;
DROP INDEX IF EXISTS public.name_category1_unq;
DROP INDEX IF EXISTS public.matchable_name_fulltext_outcomes_idx;
DROP INDEX IF EXISTS public.matchable_name_fulltext_markets_idx;
DROP INDEX IF EXISTS public.matchable_name_fulltext_events_idx;
DROP INDEX IF EXISTS public.matchable_name_fulltext_category3_idx;
DROP INDEX IF EXISTS public.matchable_name_fulltext_category2_idx;
DROP INDEX IF EXISTS public.matchable_name_fulltext_category1_idx;
DROP INDEX IF EXISTS public.markets_expired_cat1_idx;
DROP INDEX IF EXISTS public.idx_f6b00032987ae85a;
DROP INDEX IF EXISTS public.idx_f5a70b9c115f0ee5;
DROP INDEX IF EXISTS public.idx_f52d09ff51a5bc03;
DROP INDEX IF EXISTS public.idx_f34eca351a5bc03;
DROP INDEX IF EXISTS public.idx_f11fa74551a5bc03;
DROP INDEX IF EXISTS public.idx_ee8e088b51a5bc03;
DROP INDEX IF EXISTS public.idx_ed2df0e51a5bc03;
DROP INDEX IF EXISTS public.idx_e44f10e1115f0ee5;
DROP INDEX IF EXISTS public.idx_e13a8d8f51a5bc03;
DROP INDEX IF EXISTS public.idx_dbd725a751a5bc03;
DROP INDEX IF EXISTS public.idx_da6965ee115f0ee5;
DROP INDEX IF EXISTS public.idx_da460427987ae85a;
DROP INDEX IF EXISTS public.idx_da4604278340c221;
DROP INDEX IF EXISTS public.idx_da460427115f0ee5;
DROP INDEX IF EXISTS public.idx_ca57a1c7e25d857e;
DROP INDEX IF EXISTS public.idx_bc00aa63f92f3e70;
DROP INDEX IF EXISTS public.idx_bc00aa638340c221;
DROP INDEX IF EXISTS public.idx_b8746c3151a5bc03;
DROP INDEX IF EXISTS public.idx_b510e67051a5bc03;
DROP INDEX IF EXISTS public.idx_a9a20308f946e23;
DROP INDEX IF EXISTS public.idx_a9a20308622f3f37;
DROP INDEX IF EXISTS public.idx_a4171cd115f0ee5;
DROP INDEX IF EXISTS public.idx_a406b56aea9fdd75;
DROP INDEX IF EXISTS public.idx_a406b56ae25d857e;
DROP INDEX IF EXISTS public.idx_9c4df7c0ea9fdd75;
DROP INDEX IF EXISTS public.idx_9c4df7c0e6ee6d63;
DROP INDEX IF EXISTS public.idx_9c4df7c0115f0ee5;
DROP INDEX IF EXISTS public.idx_9c3a0a6e683521b;
DROP INDEX IF EXISTS public.idx_963dbd1951a5bc03;
DROP INDEX IF EXISTS public.idx_8e357a59ea9fdd75;
DROP INDEX IF EXISTS public.idx_8e357a59115f0ee5;
DROP INDEX IF EXISTS public.idx_8cc83beff104737;
DROP INDEX IF EXISTS public.idx_8cc83befe6ee6d63;
DROP INDEX IF EXISTS public.idx_8cc83bef8340c221;
DROP INDEX IF EXISTS public.idx_81b730a48acf47b4;
DROP INDEX IF EXISTS public.idx_80d4c541ea9fdd75;
DROP INDEX IF EXISTS public.idx_80d4c5414e7af8f;
DROP INDEX IF EXISTS public.idx_7d46415b115f0ee5;
DROP INDEX IF EXISTS public.idx_7b097c65115f0ee5;
DROP INDEX IF EXISTS public.idx_768d504eb71244ed;
DROP INDEX IF EXISTS public.idx_762538b98340c221;
DROP INDEX IF EXISTS public.idx_762538b971f7e88b;
DROP INDEX IF EXISTS public.idx_71697092e524616d;
DROP INDEX IF EXISTS public.idx_716970928bff9d26;
DROP INDEX IF EXISTS public.idx_6e54d0fa987ae85a;
DROP INDEX IF EXISTS public.idx_6e54d0fa4e7af8f;
DROP INDEX IF EXISTS public.idx_6d07ae2951a5bc03;
DROP INDEX IF EXISTS public.idx_5cb9e534327320d1;
DROP INDEX IF EXISTS public.idx_5c6dd74e12469de2;
DROP INDEX IF EXISTS public.idx_5a29f52f8340c221;
DROP INDEX IF EXISTS public.idx_5387574a327320d1;
DROP INDEX IF EXISTS public.idx_4ec279ba115f0ee5;
DROP INDEX IF EXISTS public.idx_43629b36ea9fdd75;
DROP INDEX IF EXISTS public.idx_43629b36e25d857e;
DROP INDEX IF EXISTS public.idx_43629b36727aca70;
DROP INDEX IF EXISTS public.idx_35b30bc051a5bc03;
DROP INDEX IF EXISTS public.idx_3342797f936b039e;
DROP INDEX IF EXISTS public.idx_3342797f8340c221;
DROP INDEX IF EXISTS public.idx_3342797f622f3f37;
DROP INDEX IF EXISTS public.idx_250f256853c674ee;
DROP INDEX IF EXISTS public.idx_17d378b6987ae85a;
DROP INDEX IF EXISTS public.events_date_idx;
DROP INDEX IF EXISTS public.event_domainid_type;
DROP INDEX IF EXISTS public.event_domain_type_unique;
DROP INDEX IF EXISTS public.domainid_name_outcome_unique;
DROP INDEX IF EXISTS public.domainid_name_market_unique;
DROP INDEX IF EXISTS public.domainid_name_event_unique;
DROP INDEX IF EXISTS public.domainid_name_category3_unique;
DROP INDEX IF EXISTS public.domainid_name_category2_unique;
DROP INDEX IF EXISTS public.domainid_name_category1_unique;
DROP INDEX IF EXISTS public.domain_type_unique;
DROP INDEX IF EXISTS public.domain_feedelementid_metaoutcome_index;
DROP INDEX IF EXISTS public.domain_feedelementid_metamarket_index;
DROP INDEX IF EXISTS public.domain_feedelementid_metafixture_index;
DROP INDEX IF EXISTS public.domain_feedelementid_metaevent_index;
DROP INDEX IF EXISTS public.domain_feedelementid_metaentrant_index;
DROP INDEX IF EXISTS public.domain_feedelementid_metacategory3_index;
DROP INDEX IF EXISTS public.domain_feedelementid_metacategory2_index;
DROP INDEX IF EXISTS public.domain_feedelementid_metacategory1_index;
DROP INDEX IF EXISTS public.domain_feedelementid_metabookieoutcome_index;
DROP INDEX IF EXISTS public.domain_feedelementid_metabookiemarket_index;
DROP INDEX IF EXISTS public.domain_feedelementid_metabookieevent_index;
DROP INDEX IF EXISTS public.date_idx;
ALTER TABLE IF EXISTS ONLY public.outcomes DROP CONSTRAINT IF EXISTS unq_outcomes;
ALTER TABLE IF EXISTS ONLY public.metaoutcome DROP CONSTRAINT IF EXISTS unq_metaoutcome;
ALTER TABLE IF EXISTS ONLY public.metamarket DROP CONSTRAINT IF EXISTS unq_metamarket;
ALTER TABLE IF EXISTS ONLY public.metaevent DROP CONSTRAINT IF EXISTS unq_metaevent;
ALTER TABLE IF EXISTS ONLY public.metacategory3 DROP CONSTRAINT IF EXISTS unq_metacategory3;
ALTER TABLE IF EXISTS ONLY public.metacategory2 DROP CONSTRAINT IF EXISTS unq_metacategory2;
ALTER TABLE IF EXISTS ONLY public.metacategory1 DROP CONSTRAINT IF EXISTS unq_metacategory1;
ALTER TABLE IF EXISTS ONLY public.metabookieoutcome DROP CONSTRAINT IF EXISTS unq_metabookieoutcome;
ALTER TABLE IF EXISTS ONLY public.metabookiemarket DROP CONSTRAINT IF EXISTS unq_metabookiemarket;
ALTER TABLE IF EXISTS ONLY public.metabookieevent DROP CONSTRAINT IF EXISTS unq_metabookieevent;
ALTER TABLE IF EXISTS ONLY public.markets DROP CONSTRAINT IF EXISTS unq_markets;
ALTER TABLE IF EXISTS ONLY public.events DROP CONSTRAINT IF EXISTS unq_events;
ALTER TABLE IF EXISTS ONLY public.category3 DROP CONSTRAINT IF EXISTS unq_category3;
ALTER TABLE IF EXISTS ONLY public.category2 DROP CONSTRAINT IF EXISTS unq_category2;
ALTER TABLE IF EXISTS ONLY public.category1 DROP CONSTRAINT IF EXISTS unq_category1;
ALTER TABLE IF EXISTS ONLY public.bookieoutcomes DROP CONSTRAINT IF EXISTS unq_bookieoutcomes;
ALTER TABLE IF EXISTS ONLY public.bookiemarkets DROP CONSTRAINT IF EXISTS unq_bookiemarkets;
ALTER TABLE IF EXISTS ONLY public.bookieevents DROP CONSTRAINT IF EXISTS unq_bookieevents;
ALTER TABLE IF EXISTS ONLY public.statsparticipants DROP CONSTRAINT IF EXISTS statsparticipants_pkey;
ALTER TABLE IF EXISTS ONLY public.statsfixtures DROP CONSTRAINT IF EXISTS statsfixtures_pkey;
ALTER TABLE IF EXISTS ONLY public.sites DROP CONSTRAINT IF EXISTS sites_pkey;
ALTER TABLE IF EXISTS ONLY public.reports DROP CONSTRAINT IF EXISTS reports_pkey;
ALTER TABLE IF EXISTS ONLY public.participants DROP CONSTRAINT IF EXISTS participants_pkey;
ALTER TABLE IF EXISTS ONLY public.outcomes DROP CONSTRAINT IF EXISTS outcomes_pkey;
ALTER TABLE IF EXISTS ONLY public.offers DROP CONSTRAINT IF EXISTS offers_pkey;
ALTER TABLE IF EXISTS ONLY public.migration_versions DROP CONSTRAINT IF EXISTS migration_versions_pkey;
ALTER TABLE IF EXISTS ONLY public.metaoutcome DROP CONSTRAINT IF EXISTS metaoutcome_pkey;
ALTER TABLE IF EXISTS ONLY public.metamarket DROP CONSTRAINT IF EXISTS metamarket_pkey;
ALTER TABLE IF EXISTS ONLY public.metafixture DROP CONSTRAINT IF EXISTS metafixture_pkey;
ALTER TABLE IF EXISTS ONLY public.metaevent DROP CONSTRAINT IF EXISTS metaevent_pkey;
ALTER TABLE IF EXISTS ONLY public.metaentrant DROP CONSTRAINT IF EXISTS metaentrant_pkey;
ALTER TABLE IF EXISTS ONLY public.metacategory3 DROP CONSTRAINT IF EXISTS metacategory3_pkey;
ALTER TABLE IF EXISTS ONLY public.metacategory2 DROP CONSTRAINT IF EXISTS metacategory2_pkey;
ALTER TABLE IF EXISTS ONLY public.metacategory1 DROP CONSTRAINT IF EXISTS metacategory1_pkey;
ALTER TABLE IF EXISTS ONLY public.metabookieoutcome DROP CONSTRAINT IF EXISTS metabookieoutcome_pkey;
ALTER TABLE IF EXISTS ONLY public.metabookiemarket DROP CONSTRAINT IF EXISTS metabookiemarket_pkey;
ALTER TABLE IF EXISTS ONLY public.metabookieevent DROP CONSTRAINT IF EXISTS metabookieevent_pkey;
ALTER TABLE IF EXISTS ONLY public.mediaimport DROP CONSTRAINT IF EXISTS mediaimport_pkey;
ALTER TABLE IF EXISTS ONLY public.media__media DROP CONSTRAINT IF EXISTS media__media_pkey;
ALTER TABLE IF EXISTS ONLY public.media__gallery DROP CONSTRAINT IF EXISTS media__gallery_pkey;
ALTER TABLE IF EXISTS ONLY public.media__gallery_media DROP CONSTRAINT IF EXISTS media__gallery_media_pkey;
ALTER TABLE IF EXISTS ONLY public.markets DROP CONSTRAINT IF EXISTS markets_pkey;
ALTER TABLE IF EXISTS ONLY public.marketroles DROP CONSTRAINT IF EXISTS marketroles_pkey;
ALTER TABLE IF EXISTS ONLY public.marketmarketroles DROP CONSTRAINT IF EXISTS marketmarketroles_pkey;
ALTER TABLE IF EXISTS ONLY public.historybookieoutcomes DROP CONSTRAINT IF EXISTS historybookieoutcomes_pkey;
ALTER TABLE IF EXISTS ONLY public.footballstatsparticipants DROP CONSTRAINT IF EXISTS footballstatsparticipants_pkey;
ALTER TABLE IF EXISTS ONLY public.footballstatsfixtures DROP CONSTRAINT IF EXISTS footballstatsfixtures_pkey;
ALTER TABLE IF EXISTS ONLY public.fixtures DROP CONSTRAINT IF EXISTS fixtures_pkey;
ALTER TABLE IF EXISTS ONLY public.feeds DROP CONSTRAINT IF EXISTS feeds_pkey;
ALTER TABLE IF EXISTS ONLY public.featuredoffer DROP CONSTRAINT IF EXISTS featuredoffer_pkey;
ALTER TABLE IF EXISTS ONLY public.featuredevent DROP CONSTRAINT IF EXISTS featuredevent_pkey;
ALTER TABLE IF EXISTS ONLY public.events DROP CONSTRAINT IF EXISTS events_pkey;
ALTER TABLE IF EXISTS ONLY public.eventarticles DROP CONSTRAINT IF EXISTS eventarticles_pkey;
ALTER TABLE IF EXISTS ONLY public.entrants DROP CONSTRAINT IF EXISTS entrants_pkey;
ALTER TABLE IF EXISTS ONLY public.countries DROP CONSTRAINT IF EXISTS countries_pkey;
ALTER TABLE IF EXISTS ONLY public.classification__tag DROP CONSTRAINT IF EXISTS classification__tag_pkey;
ALTER TABLE IF EXISTS ONLY public.classification__context DROP CONSTRAINT IF EXISTS classification__context_pkey;
ALTER TABLE IF EXISTS ONLY public.classification__collection DROP CONSTRAINT IF EXISTS classification__collection_pkey;
ALTER TABLE IF EXISTS ONLY public.classification__category DROP CONSTRAINT IF EXISTS classification__category_pkey;
ALTER TABLE IF EXISTS ONLY public.category3 DROP CONSTRAINT IF EXISTS category3_pkey;
ALTER TABLE IF EXISTS ONLY public.category2 DROP CONSTRAINT IF EXISTS category2_pkey;
ALTER TABLE IF EXISTS ONLY public.category1 DROP CONSTRAINT IF EXISTS category1_pkey;
ALTER TABLE IF EXISTS ONLY public.bookies DROP CONSTRAINT IF EXISTS bookies_pkey;
ALTER TABLE IF EXISTS ONLY public.bookieoutcomes DROP CONSTRAINT IF EXISTS bookieoutcomes_pkey;
ALTER TABLE IF EXISTS ONLY public.bookiemarkets DROP CONSTRAINT IF EXISTS bookiemarkets_pkey;
ALTER TABLE IF EXISTS ONLY public.bookieevents DROP CONSTRAINT IF EXISTS bookieevents_pkey;
ALTER TABLE IF EXISTS ONLY public.basearticles DROP CONSTRAINT IF EXISTS basearticles_pkey;
ALTER TABLE IF EXISTS ONLY public.banners DROP CONSTRAINT IF EXISTS banners_pkey;
ALTER TABLE IF EXISTS ONLY public.aliasoutcome DROP CONSTRAINT IF EXISTS aliasoutcome_pkey;
ALTER TABLE IF EXISTS ONLY public.aliasmarket DROP CONSTRAINT IF EXISTS aliasmarket_pkey;
ALTER TABLE IF EXISTS ONLY public.aliasevent DROP CONSTRAINT IF EXISTS aliasevent_pkey;
ALTER TABLE IF EXISTS ONLY public.aliascategory3 DROP CONSTRAINT IF EXISTS aliascategory3_pkey;
ALTER TABLE IF EXISTS ONLY public.aliascategory2 DROP CONSTRAINT IF EXISTS aliascategory2_pkey;
ALTER TABLE IF EXISTS ONLY public.aliascategory1 DROP CONSTRAINT IF EXISTS aliascategory1_pkey;
ALTER TABLE IF EXISTS public.statsparticipants ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.statsfixtures ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.sites ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.reports ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.participants ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.outcomes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.offers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metaoutcome ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metamarket ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metafixture ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metaevent ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metaentrant ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metacategory3 ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metacategory2 ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metacategory1 ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metabookieoutcome ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metabookiemarket ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metabookieevent ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.mediaimport ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.markets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.marketroles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.fixtures ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.feeds ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.featuredoffer ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.featuredevent ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.events ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.entrants ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.countries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.category3 ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.category2 ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.category1 ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.bookies ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.bookieoutcomes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.bookiemarkets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.bookieevents ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.basearticles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.banners ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.aliasoutcome ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.aliasmarket ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.aliasevent ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.aliascategory3 ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.aliascategory2 ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.aliascategory1 ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.statsparticipants_id_seq;
DROP TABLE IF EXISTS public.statsparticipants;
DROP SEQUENCE IF EXISTS public.statsfixtures_id_seq;
DROP TABLE IF EXISTS public.statsfixtures;
DROP SEQUENCE IF EXISTS public.sites_id_seq;
DROP TABLE IF EXISTS public.sites;
DROP SEQUENCE IF EXISTS public.reports_id_seq;
DROP TABLE IF EXISTS public.reports;
DROP SEQUENCE IF EXISTS public.participants_id_seq;
DROP TABLE IF EXISTS public.participants;
DROP SEQUENCE IF EXISTS public.outcomes_id_seq;
DROP TABLE IF EXISTS public.outcomes;
DROP SEQUENCE IF EXISTS public.offers_id_seq;
DROP TABLE IF EXISTS public.offers;
DROP TABLE IF EXISTS public.migration_versions;
DROP SEQUENCE IF EXISTS public.metaoutcome_id_seq;
DROP TABLE IF EXISTS public.metaoutcome;
DROP SEQUENCE IF EXISTS public.metamarket_id_seq;
DROP TABLE IF EXISTS public.metamarket;
DROP SEQUENCE IF EXISTS public.metafixture_id_seq;
DROP TABLE IF EXISTS public.metafixture;
DROP SEQUENCE IF EXISTS public.metaevent_id_seq;
DROP TABLE IF EXISTS public.metaevent;
DROP SEQUENCE IF EXISTS public.metaentrant_id_seq;
DROP TABLE IF EXISTS public.metaentrant;
DROP SEQUENCE IF EXISTS public.metacategory3_id_seq;
DROP TABLE IF EXISTS public.metacategory3;
DROP SEQUENCE IF EXISTS public.metacategory2_id_seq;
DROP TABLE IF EXISTS public.metacategory2;
DROP SEQUENCE IF EXISTS public.metacategory1_id_seq;
DROP TABLE IF EXISTS public.metacategory1;
DROP SEQUENCE IF EXISTS public.metabookieoutcome_id_seq;
DROP TABLE IF EXISTS public.metabookieoutcome;
DROP SEQUENCE IF EXISTS public.metabookiemarket_id_seq;
DROP TABLE IF EXISTS public.metabookiemarket;
DROP SEQUENCE IF EXISTS public.metabookieevent_id_seq;
DROP TABLE IF EXISTS public.metabookieevent;
DROP SEQUENCE IF EXISTS public.mediaimport_id_seq;
DROP TABLE IF EXISTS public.mediaimport;
DROP SEQUENCE IF EXISTS public.media__media_id_seq;
DROP TABLE IF EXISTS public.media__media;
DROP SEQUENCE IF EXISTS public.media__gallery_media_id_seq;
DROP TABLE IF EXISTS public.media__gallery_media;
DROP SEQUENCE IF EXISTS public.media__gallery_id_seq;
DROP TABLE IF EXISTS public.media__gallery;
DROP SEQUENCE IF EXISTS public.markets_id_seq;
DROP TABLE IF EXISTS public.markets;
DROP SEQUENCE IF EXISTS public.marketroles_id_seq;
DROP TABLE IF EXISTS public.marketroles;
DROP TABLE IF EXISTS public.marketmarketroles;
DROP TABLE IF EXISTS public.historybookieoutcomes;
DROP SEQUENCE IF EXISTS public.historybookieoutcomes_id_seq;
DROP TABLE IF EXISTS public.footballstatsparticipants;
DROP TABLE IF EXISTS public.footballstatsfixtures;
DROP SEQUENCE IF EXISTS public.fixtures_id_seq;
DROP TABLE IF EXISTS public.fixtures;
DROP SEQUENCE IF EXISTS public.feeds_id_seq;
DROP TABLE IF EXISTS public.feeds;
DROP SEQUENCE IF EXISTS public.featuredoffer_id_seq;
DROP TABLE IF EXISTS public.featuredoffer;
DROP SEQUENCE IF EXISTS public.featuredevent_id_seq;
DROP TABLE IF EXISTS public.featuredevent;
DROP SEQUENCE IF EXISTS public.events_id_seq;
DROP TABLE IF EXISTS public.events;
DROP TABLE IF EXISTS public.eventarticles;
DROP SEQUENCE IF EXISTS public.entrants_id_seq;
DROP TABLE IF EXISTS public.entrants;
DROP SEQUENCE IF EXISTS public.countries_id_seq;
DROP TABLE IF EXISTS public.countries;
DROP SEQUENCE IF EXISTS public.classification__tag_id_seq;
DROP TABLE IF EXISTS public.classification__tag;
DROP TABLE IF EXISTS public.classification__context;
DROP SEQUENCE IF EXISTS public.classification__collection_id_seq;
DROP TABLE IF EXISTS public.classification__collection;
DROP SEQUENCE IF EXISTS public.classification__category_id_seq;
DROP TABLE IF EXISTS public.classification__category;
DROP SEQUENCE IF EXISTS public.category3_id_seq;
DROP TABLE IF EXISTS public.category3;
DROP SEQUENCE IF EXISTS public.category2_id_seq;
DROP TABLE IF EXISTS public.category2;
DROP SEQUENCE IF EXISTS public.category1_id_seq;
DROP TABLE IF EXISTS public.category1;
DROP SEQUENCE IF EXISTS public.bookies_id_seq;
DROP TABLE IF EXISTS public.bookies;
DROP SEQUENCE IF EXISTS public.bookieoutcomes_id_seq;
DROP TABLE IF EXISTS public.bookieoutcomes;
DROP SEQUENCE IF EXISTS public.bookiemarkets_id_seq;
DROP TABLE IF EXISTS public.bookiemarkets;
DROP SEQUENCE IF EXISTS public.bookieevents_id_seq;
DROP TABLE IF EXISTS public.bookieevents;
DROP SEQUENCE IF EXISTS public.basearticles_id_seq;
DROP TABLE IF EXISTS public.basearticles;
DROP SEQUENCE IF EXISTS public.banners_id_seq;
DROP TABLE IF EXISTS public.banners;
DROP SEQUENCE IF EXISTS public.aliasoutcome_id_seq;
DROP TABLE IF EXISTS public.aliasoutcome;
DROP SEQUENCE IF EXISTS public.aliasmarket_id_seq;
DROP TABLE IF EXISTS public.aliasmarket;
DROP SEQUENCE IF EXISTS public.aliasevent_id_seq;
DROP TABLE IF EXISTS public.aliasevent;
DROP SEQUENCE IF EXISTS public.aliascategory3_id_seq;
DROP TABLE IF EXISTS public.aliascategory3;
DROP SEQUENCE IF EXISTS public.aliascategory2_id_seq;
DROP TABLE IF EXISTS public.aliascategory2;
DROP SEQUENCE IF EXISTS public.aliascategory1_id_seq;
DROP TABLE IF EXISTS public.aliascategory1;
DROP EXTENSION IF EXISTS citext;
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aliascategory1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE aliascategory1 (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    name citext NOT NULL,
    type character varying(16) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE aliascategory1 OWNER TO postgres;

--
-- Name: COLUMN aliascategory1.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aliascategory1.name IS '(DC2Type:citext)';


--
-- Name: aliascategory1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aliascategory1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aliascategory1_id_seq OWNER TO postgres;

--
-- Name: aliascategory1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aliascategory1_id_seq OWNED BY aliascategory1.id;


--
-- Name: aliascategory2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE aliascategory2 (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    name citext NOT NULL,
    type character varying(16) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE aliascategory2 OWNER TO postgres;

--
-- Name: COLUMN aliascategory2.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aliascategory2.name IS '(DC2Type:citext)';


--
-- Name: aliascategory2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aliascategory2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aliascategory2_id_seq OWNER TO postgres;

--
-- Name: aliascategory2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aliascategory2_id_seq OWNED BY aliascategory2.id;


--
-- Name: aliascategory3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE aliascategory3 (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    name citext NOT NULL,
    type character varying(16) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE aliascategory3 OWNER TO postgres;

--
-- Name: COLUMN aliascategory3.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aliascategory3.name IS '(DC2Type:citext)';


--
-- Name: aliascategory3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aliascategory3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aliascategory3_id_seq OWNER TO postgres;

--
-- Name: aliascategory3_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aliascategory3_id_seq OWNED BY aliascategory3.id;


--
-- Name: aliasevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE aliasevent (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    name citext NOT NULL,
    type character varying(16) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE aliasevent OWNER TO postgres;

--
-- Name: COLUMN aliasevent.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aliasevent.name IS '(DC2Type:citext)';


--
-- Name: aliasevent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aliasevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aliasevent_id_seq OWNER TO postgres;

--
-- Name: aliasevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aliasevent_id_seq OWNED BY aliasevent.id;


--
-- Name: aliasmarket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE aliasmarket (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    name citext NOT NULL,
    type character varying(16) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE aliasmarket OWNER TO postgres;

--
-- Name: COLUMN aliasmarket.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aliasmarket.name IS '(DC2Type:citext)';


--
-- Name: aliasmarket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aliasmarket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aliasmarket_id_seq OWNER TO postgres;

--
-- Name: aliasmarket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aliasmarket_id_seq OWNED BY aliasmarket.id;


--
-- Name: aliasoutcome; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE aliasoutcome (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    name citext NOT NULL,
    type character varying(16) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE aliasoutcome OWNER TO postgres;

--
-- Name: COLUMN aliasoutcome.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aliasoutcome.name IS '(DC2Type:citext)';


--
-- Name: aliasoutcome_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aliasoutcome_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aliasoutcome_id_seq OWNER TO postgres;

--
-- Name: aliasoutcome_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aliasoutcome_id_seq OWNED BY aliasoutcome.id;


--
-- Name: banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE banners (
    id integer NOT NULL,
    offer_id integer NOT NULL,
    bookie_element_id integer NOT NULL,
    type character varying(64) NOT NULL,
    width smallint NOT NULL,
    height smallint NOT NULL,
    img_sprintf character varying(255) DEFAULT NULL::character varying,
    js_sprintf character varying(255) DEFAULT NULL::character varying,
    iframe_sprintf character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE banners OWNER TO postgres;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banners_id_seq OWNER TO postgres;

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE banners_id_seq OWNED BY banners.id;


--
-- Name: basearticles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE basearticles (
    id integer NOT NULL,
    body text NOT NULL,
    title text,
    excerpt text,
    author text,
    discriminator character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE basearticles OWNER TO postgres;

--
-- Name: basearticles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE basearticles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE basearticles_id_seq OWNER TO postgres;

--
-- Name: basearticles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE basearticles_id_seq OWNED BY basearticles.id;


--
-- Name: bookieevents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bookieevents (
    id integer NOT NULL,
    event_id integer NOT NULL,
    bookie_id integer NOT NULL,
    url character varying(512) DEFAULT NULL::character varying,
    bet_until timestamp(0) without time zone NOT NULL,
    status character varying(10) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    display_order smallint
);


ALTER TABLE bookieevents OWNER TO postgres;

--
-- Name: bookieevents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bookieevents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bookieevents_id_seq OWNER TO postgres;

--
-- Name: bookieevents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bookieevents_id_seq OWNED BY bookieevents.id;


--
-- Name: bookiemarkets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bookiemarkets (
    id integer NOT NULL,
    market_id integer NOT NULL,
    bookieevent_id integer NOT NULL,
    bookie_id integer NOT NULL,
    display_order smallint,
    url character varying(512) DEFAULT NULL::character varying,
    status character varying(10) NOT NULL,
    is_handicap boolean NOT NULL,
    bir_available boolean NOT NULL,
    place_available boolean NOT NULL,
    cashout_available boolean NOT NULL,
    eachway_available boolean NOT NULL,
    startingprice_available boolean NOT NULL,
    liveprice_available boolean NOT NULL,
    guaranteedprice_available boolean NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE bookiemarkets OWNER TO postgres;

--
-- Name: bookiemarkets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bookiemarkets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bookiemarkets_id_seq OWNER TO postgres;

--
-- Name: bookiemarkets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bookiemarkets_id_seq OWNED BY bookiemarkets.id;


--
-- Name: bookieoutcomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bookieoutcomes (
    id integer NOT NULL,
    outcome_id integer NOT NULL,
    bookiemarket_id integer NOT NULL,
    bookie_id integer NOT NULL,
    display_order smallint,
    status character varying(10) NOT NULL,
    odds character varying(8) NOT NULL,
    odds_decimal double precision NOT NULL,
    score_home smallint,
    score_away smallint,
    runner_number smallint,
    handicap character varying(10) DEFAULT NULL::character varying,
    price_direction boolean,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    type smallint
);


ALTER TABLE bookieoutcomes OWNER TO postgres;

--
-- Name: bookieoutcomes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bookieoutcomes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bookieoutcomes_id_seq OWNER TO postgres;

--
-- Name: bookieoutcomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bookieoutcomes_id_seq OWNED BY bookieoutcomes.id;


--
-- Name: bookies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bookies (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    commission smallint DEFAULT 0 NOT NULL,
    betting_type character varying(12) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE bookies OWNER TO postgres;

--
-- Name: bookies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bookies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bookies_id_seq OWNER TO postgres;

--
-- Name: bookies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bookies_id_seq OWNED BY bookies.id;


--
-- Name: category1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category1 (
    id integer NOT NULL,
    name citext NOT NULL,
    canonicalised_name citext NOT NULL,
    matchable_name citext NOT NULL,
    display_order smallint DEFAULT 0 NOT NULL,
    filtered boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    display_name character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE category1 OWNER TO postgres;

--
-- Name: COLUMN category1.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN category1.name IS '(DC2Type:citext)';


--
-- Name: COLUMN category1.canonicalised_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN category1.canonicalised_name IS '(DC2Type:citext)';


--
-- Name: COLUMN category1.matchable_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN category1.matchable_name IS '(DC2Type:citext)';


--
-- Name: category1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category1_id_seq OWNER TO postgres;

--
-- Name: category1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category1_id_seq OWNED BY category1.id;


--
-- Name: category2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category2 (
    id integer NOT NULL,
    category1_id integer NOT NULL,
    name citext NOT NULL,
    canonicalised_name citext NOT NULL,
    matchable_name citext NOT NULL,
    display_order smallint DEFAULT 0 NOT NULL,
    filtered boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    display_name character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE category2 OWNER TO postgres;

--
-- Name: COLUMN category2.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN category2.name IS '(DC2Type:citext)';


--
-- Name: COLUMN category2.canonicalised_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN category2.canonicalised_name IS '(DC2Type:citext)';


--
-- Name: COLUMN category2.matchable_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN category2.matchable_name IS '(DC2Type:citext)';


--
-- Name: category2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category2_id_seq OWNER TO postgres;

--
-- Name: category2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category2_id_seq OWNED BY category2.id;


--
-- Name: category3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category3 (
    id integer NOT NULL,
    category2_id integer NOT NULL,
    name citext NOT NULL,
    canonicalised_name citext NOT NULL,
    matchable_name citext NOT NULL,
    display_order smallint DEFAULT 0 NOT NULL,
    filtered boolean DEFAULT false NOT NULL,
    event_count smallint DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    display_name character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE category3 OWNER TO postgres;

--
-- Name: COLUMN category3.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN category3.name IS '(DC2Type:citext)';


--
-- Name: COLUMN category3.canonicalised_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN category3.canonicalised_name IS '(DC2Type:citext)';


--
-- Name: COLUMN category3.matchable_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN category3.matchable_name IS '(DC2Type:citext)';


--
-- Name: category3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category3_id_seq OWNER TO postgres;

--
-- Name: category3_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category3_id_seq OWNED BY category3.id;


--
-- Name: classification__category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE classification__category (
    id integer NOT NULL,
    parent_id integer,
    context character varying(255) DEFAULT NULL::character varying,
    media_id integer,
    name character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    slug character varying(255) NOT NULL,
    description character varying(255) DEFAULT NULL::character varying,
    "position" integer,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE classification__category OWNER TO postgres;

--
-- Name: classification__category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE classification__category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE classification__category_id_seq OWNER TO postgres;

--
-- Name: classification__collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE classification__collection (
    id integer NOT NULL,
    context character varying(255) DEFAULT NULL::character varying,
    media_id integer,
    name character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    slug character varying(255) NOT NULL,
    description character varying(255) DEFAULT NULL::character varying,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE classification__collection OWNER TO postgres;

--
-- Name: classification__collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE classification__collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE classification__collection_id_seq OWNER TO postgres;

--
-- Name: classification__context; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE classification__context (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE classification__context OWNER TO postgres;

--
-- Name: classification__tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE classification__tag (
    id integer NOT NULL,
    context character varying(255) DEFAULT NULL::character varying,
    name character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE classification__tag OWNER TO postgres;

--
-- Name: classification__tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE classification__tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE classification__tag_id_seq OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    id integer NOT NULL,
    code character varying(2) NOT NULL,
    name character varying(50) NOT NULL,
    iso3 character varying(3) NOT NULL,
    rank smallint DEFAULT 0 NOT NULL
);


ALTER TABLE countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: entrants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entrants (
    id integer NOT NULL,
    outcome_id integer,
    type character varying(16) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    name citext NOT NULL,
    canonicalised_name citext NOT NULL,
    _self_id integer
);


ALTER TABLE entrants OWNER TO postgres;

--
-- Name: COLUMN entrants.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN entrants.name IS '(DC2Type:citext)';


--
-- Name: COLUMN entrants.canonicalised_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN entrants.canonicalised_name IS '(DC2Type:citext)';


--
-- Name: entrants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entrants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entrants_id_seq OWNER TO postgres;

--
-- Name: entrants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entrants_id_seq OWNED BY entrants.id;


--
-- Name: eventarticles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE eventarticles (
    id integer NOT NULL,
    domain_id integer NOT NULL
);


ALTER TABLE eventarticles OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE events (
    id integer NOT NULL,
    _self_id integer,
    _self2_id integer,
    _self3_id integer,
    category3_id integer NOT NULL,
    name citext NOT NULL,
    type character varying(16) NOT NULL,
    matchable_name citext NOT NULL,
    canonicalised_name citext NOT NULL,
    display_name character varying(150) DEFAULT NULL::character varying,
    display_order smallint,
    date timestamp(0) without time zone NOT NULL,
    race_number character varying(8) DEFAULT NULL::character varying,
    filtered boolean DEFAULT false NOT NULL,
    concrete_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    expired boolean DEFAULT false NOT NULL,
    expired_lock boolean DEFAULT false NOT NULL
);


ALTER TABLE events OWNER TO postgres;

--
-- Name: COLUMN events.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN events.name IS '(DC2Type:citext)';


--
-- Name: COLUMN events.matchable_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN events.matchable_name IS '(DC2Type:citext)';


--
-- Name: COLUMN events.canonicalised_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN events.canonicalised_name IS '(DC2Type:citext)';


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: featuredevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE featuredevent (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    type character varying(64) NOT NULL,
    display_order smallint DEFAULT 0 NOT NULL,
    media_id integer,
    outcome_id integer,
    display_order_weight smallint DEFAULT 0 NOT NULL,
    force boolean DEFAULT false NOT NULL
);


ALTER TABLE featuredevent OWNER TO postgres;

--
-- Name: featuredevent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE featuredevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE featuredevent_id_seq OWNER TO postgres;

--
-- Name: featuredevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE featuredevent_id_seq OWNED BY featuredevent.id;


--
-- Name: featuredoffer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE featuredoffer (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    media_id integer,
    type character varying(64) NOT NULL,
    display_order smallint DEFAULT 0 NOT NULL,
    display_order_weight smallint DEFAULT 0 NOT NULL,
    force boolean DEFAULT false NOT NULL
);


ALTER TABLE featuredoffer OWNER TO postgres;

--
-- Name: featuredoffer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE featuredoffer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE featuredoffer_id_seq OWNER TO postgres;

--
-- Name: featuredoffer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE featuredoffer_id_seq OWNED BY featuredoffer.id;


--
-- Name: feeds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE feeds (
    id integer NOT NULL,
    bookie_id integer,
    name character varying(50) NOT NULL,
    last_completion date,
    last_run date,
    type character varying(16) DEFAULT 'BOOKIE'::character varying NOT NULL
);


ALTER TABLE feeds OWNER TO postgres;

--
-- Name: feeds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE feeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feeds_id_seq OWNER TO postgres;

--
-- Name: feeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE feeds_id_seq OWNED BY feeds.id;


--
-- Name: fixtures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fixtures (
    id integer NOT NULL,
    event_id integer,
    category3_id integer NOT NULL,
    name citext NOT NULL,
    canonicalised_name citext NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE fixtures OWNER TO postgres;

--
-- Name: COLUMN fixtures.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fixtures.name IS '(DC2Type:citext)';


--
-- Name: COLUMN fixtures.canonicalised_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fixtures.canonicalised_name IS '(DC2Type:citext)';


--
-- Name: fixtures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fixtures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fixtures_id_seq OWNER TO postgres;

--
-- Name: fixtures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fixtures_id_seq OWNED BY fixtures.id;


--
-- Name: footballstatsfixtures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE footballstatsfixtures (
    id bigint NOT NULL,
    season character varying(16) NOT NULL,
    league character varying(64) NOT NULL,
    spectators integer,
    round smallint,
    result character varying(32) DEFAULT NULL::character varying
);


ALTER TABLE footballstatsfixtures OWNER TO postgres;

--
-- Name: footballstatsparticipants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE footballstatsparticipants (
    id bigint NOT NULL,
    is_home boolean NOT NULL,
    is_away boolean NOT NULL,
    goals smallint,
    starter boolean,
    "position" character varying(16) DEFAULT NULL::character varying,
    manager character varying(128) DEFAULT NULL::character varying,
    minutes_played smallint,
    formation character varying(16) DEFAULT NULL::character varying,
    corners smallint,
    goals_half_time smallint,
    shots smallint,
    shots_on_target smallint,
    fouls smallint,
    yellow_card smallint,
    red_card smallint
);


ALTER TABLE footballstatsparticipants OWNER TO postgres;

--
-- Name: historybookieoutcomes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE historybookieoutcomes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE historybookieoutcomes_id_seq OWNER TO postgres;

--
-- Name: historybookieoutcomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE historybookieoutcomes (
    id integer DEFAULT nextval('historybookieoutcomes_id_seq'::regclass) NOT NULL,
    bookieoutcome_id integer NOT NULL,
    odds character varying(8) NOT NULL,
    odds_decimal double precision NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    direction character varying(1) DEFAULT NULL::character varying,
    deviation_opening double precision
);


ALTER TABLE historybookieoutcomes OWNER TO postgres;

--
-- Name: marketmarketroles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE marketmarketroles (
    market_id integer NOT NULL,
    marketrole_id integer NOT NULL
);


ALTER TABLE marketmarketroles OWNER TO postgres;

--
-- Name: marketroles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE marketroles (
    id integer NOT NULL,
    category1_id integer NOT NULL,
    name citext NOT NULL
);


ALTER TABLE marketroles OWNER TO postgres;

--
-- Name: COLUMN marketroles.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN marketroles.name IS '(DC2Type:citext)';


--
-- Name: marketroles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE marketroles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketroles_id_seq OWNER TO postgres;

--
-- Name: marketroles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE marketroles_id_seq OWNED BY marketroles.id;


--
-- Name: markets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE markets (
    id integer NOT NULL,
    _self_id integer,
    _self2_id integer,
    _self3_id integer,
    category1_id integer NOT NULL,
    name citext NOT NULL,
    canonicalised_name citext NOT NULL,
    display_name character varying(150) DEFAULT NULL::character varying,
    matchable_name citext NOT NULL,
    display_order smallint,
    type character varying(16) DEFAULT NULL::character varying,
    concrete_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    expired boolean DEFAULT false NOT NULL,
    expired_lock boolean DEFAULT false NOT NULL
);


ALTER TABLE markets OWNER TO postgres;

--
-- Name: COLUMN markets.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN markets.name IS '(DC2Type:citext)';


--
-- Name: COLUMN markets.canonicalised_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN markets.canonicalised_name IS '(DC2Type:citext)';


--
-- Name: COLUMN markets.matchable_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN markets.matchable_name IS '(DC2Type:citext)';


--
-- Name: markets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE markets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE markets_id_seq OWNER TO postgres;

--
-- Name: markets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE markets_id_seq OWNED BY markets.id;


--
-- Name: media__gallery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE media__gallery (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    context character varying(64) NOT NULL,
    default_format character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE media__gallery OWNER TO postgres;

--
-- Name: media__gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE media__gallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE media__gallery_id_seq OWNER TO postgres;

--
-- Name: media__gallery_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE media__gallery_media (
    id integer NOT NULL,
    gallery_id integer,
    media_id integer,
    "position" integer NOT NULL,
    enabled boolean NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE media__gallery_media OWNER TO postgres;

--
-- Name: media__gallery_media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE media__gallery_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE media__gallery_media_id_seq OWNER TO postgres;

--
-- Name: media__media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE media__media (
    id integer NOT NULL,
    category_id integer,
    name character varying(255) NOT NULL,
    description text,
    enabled boolean NOT NULL,
    provider_name character varying(255) NOT NULL,
    provider_status integer NOT NULL,
    provider_reference character varying(255) NOT NULL,
    provider_metadata text,
    width integer,
    height integer,
    length numeric(10,0) DEFAULT NULL::numeric,
    content_type character varying(255) DEFAULT NULL::character varying,
    content_size integer,
    copyright character varying(255) DEFAULT NULL::character varying,
    author_name character varying(255) DEFAULT NULL::character varying,
    context character varying(64) DEFAULT NULL::character varying,
    cdn_is_flushable boolean,
    cdn_flush_identifier character varying(64) DEFAULT NULL::character varying,
    cdn_flush_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    cdn_status integer,
    updated_at timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE media__media OWNER TO postgres;

--
-- Name: COLUMN media__media.provider_metadata; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN media__media.provider_metadata IS '(DC2Type:json)';


--
-- Name: media__media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE media__media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE media__media_id_seq OWNER TO postgres;

--
-- Name: mediaimport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mediaimport (
    id integer NOT NULL,
    channel character varying(128) NOT NULL,
    start_time timestamp(0) without time zone NOT NULL
);


ALTER TABLE mediaimport OWNER TO postgres;

--
-- Name: mediaimport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mediaimport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mediaimport_id_seq OWNER TO postgres;

--
-- Name: mediaimport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mediaimport_id_seq OWNED BY mediaimport.id;


--
-- Name: metabookieevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metabookieevent (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    feed_id smallint NOT NULL,
    feed_element_id character varying(16) NOT NULL,
    feed_request_url character varying(512) NOT NULL,
    feed_last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE metabookieevent OWNER TO postgres;

--
-- Name: metabookieevent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metabookieevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metabookieevent_id_seq OWNER TO postgres;

--
-- Name: metabookieevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metabookieevent_id_seq OWNED BY metabookieevent.id;


--
-- Name: metabookiemarket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metabookiemarket (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    feed_id smallint NOT NULL,
    feed_element_id character varying(16) NOT NULL,
    feed_request_url character varying(512) NOT NULL,
    feed_last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE metabookiemarket OWNER TO postgres;

--
-- Name: metabookiemarket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metabookiemarket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metabookiemarket_id_seq OWNER TO postgres;

--
-- Name: metabookiemarket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metabookiemarket_id_seq OWNED BY metabookiemarket.id;


--
-- Name: metabookieoutcome; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metabookieoutcome (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    feed_id smallint NOT NULL,
    feed_element_id character varying(16) NOT NULL,
    feed_request_url character varying(512) NOT NULL,
    feed_last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE metabookieoutcome OWNER TO postgres;

--
-- Name: metabookieoutcome_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metabookieoutcome_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metabookieoutcome_id_seq OWNER TO postgres;

--
-- Name: metabookieoutcome_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metabookieoutcome_id_seq OWNED BY metabookieoutcome.id;


--
-- Name: metacategory1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metacategory1 (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    feed_id smallint NOT NULL,
    feed_element_id character varying(16) NOT NULL,
    feed_request_url character varying(512) NOT NULL,
    feed_last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE metacategory1 OWNER TO postgres;

--
-- Name: metacategory1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metacategory1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metacategory1_id_seq OWNER TO postgres;

--
-- Name: metacategory1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metacategory1_id_seq OWNED BY metacategory1.id;


--
-- Name: metacategory2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metacategory2 (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    feed_id smallint NOT NULL,
    feed_element_id character varying(16) NOT NULL,
    feed_request_url character varying(512) NOT NULL,
    feed_last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE metacategory2 OWNER TO postgres;

--
-- Name: metacategory2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metacategory2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metacategory2_id_seq OWNER TO postgres;

--
-- Name: metacategory2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metacategory2_id_seq OWNED BY metacategory2.id;


--
-- Name: metacategory3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metacategory3 (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    feed_id smallint NOT NULL,
    feed_element_id character varying(16) NOT NULL,
    feed_request_url character varying(512) NOT NULL,
    feed_last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE metacategory3 OWNER TO postgres;

--
-- Name: metacategory3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metacategory3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metacategory3_id_seq OWNER TO postgres;

--
-- Name: metacategory3_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metacategory3_id_seq OWNED BY metacategory3.id;


--
-- Name: metaentrant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metaentrant (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    feed_id smallint NOT NULL,
    feed_element_id character varying(32) NOT NULL,
    feed_request_url character varying(512) NOT NULL,
    feed_last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE metaentrant OWNER TO postgres;

--
-- Name: metaentrant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metaentrant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metaentrant_id_seq OWNER TO postgres;

--
-- Name: metaentrant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metaentrant_id_seq OWNED BY metaentrant.id;


--
-- Name: metaevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metaevent (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    feed_id smallint NOT NULL,
    feed_element_id character varying(16) NOT NULL,
    feed_request_url character varying(512) NOT NULL,
    feed_last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE metaevent OWNER TO postgres;

--
-- Name: metaevent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metaevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metaevent_id_seq OWNER TO postgres;

--
-- Name: metaevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metaevent_id_seq OWNED BY metaevent.id;


--
-- Name: metafixture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metafixture (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    feed_id smallint NOT NULL,
    feed_element_id character varying(16) NOT NULL,
    feed_request_url character varying(512) NOT NULL,
    feed_last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE metafixture OWNER TO postgres;

--
-- Name: metafixture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metafixture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metafixture_id_seq OWNER TO postgres;

--
-- Name: metafixture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metafixture_id_seq OWNED BY metafixture.id;


--
-- Name: metamarket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metamarket (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    feed_id smallint NOT NULL,
    feed_element_id character varying(16) NOT NULL,
    feed_request_url character varying(512) NOT NULL,
    feed_last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE metamarket OWNER TO postgres;

--
-- Name: metamarket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metamarket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metamarket_id_seq OWNER TO postgres;

--
-- Name: metamarket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metamarket_id_seq OWNED BY metamarket.id;


--
-- Name: metaoutcome; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metaoutcome (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    feed_id smallint NOT NULL,
    feed_element_id character varying(16) NOT NULL,
    feed_request_url character varying(512) NOT NULL,
    feed_last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE metaoutcome OWNER TO postgres;

--
-- Name: metaoutcome_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metaoutcome_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metaoutcome_id_seq OWNER TO postgres;

--
-- Name: metaoutcome_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metaoutcome_id_seq OWNED BY metaoutcome.id;


--
-- Name: migration_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE migration_versions (
    version character varying(255) NOT NULL
);


ALTER TABLE migration_versions OWNER TO postgres;

--
-- Name: offers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE offers (
    id integer NOT NULL,
    domain_id integer,
    category1_id integer,
    bookie_id integer NOT NULL,
    type character varying(64) NOT NULL,
    deposit smallint,
    name citext NOT NULL,
    conditions text NOT NULL,
    deeplink_sprintf character varying(512) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    valid_from timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    valid_to timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    canonicalised_name citext NOT NULL,
    colour character varying(8) DEFAULT NULL::character varying,
    filtered boolean DEFAULT false NOT NULL
);


ALTER TABLE offers OWNER TO postgres;

--
-- Name: COLUMN offers.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN offers.name IS '(DC2Type:citext)';


--
-- Name: COLUMN offers.canonicalised_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN offers.canonicalised_name IS '(DC2Type:citext)';


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offers_id_seq OWNER TO postgres;

--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE offers_id_seq OWNED BY offers.id;


--
-- Name: outcomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE outcomes (
    id integer NOT NULL,
    _self_id integer,
    _self2_id integer,
    _self3_id integer,
    category1_id integer NOT NULL,
    name citext NOT NULL,
    canonicalised_name citext NOT NULL,
    display_name character varying(150) DEFAULT NULL::character varying,
    matchable_name citext NOT NULL,
    display_order smallint,
    concrete_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    gallery_id integer,
    expired boolean DEFAULT false NOT NULL,
    expired_lock boolean DEFAULT false NOT NULL
);


ALTER TABLE outcomes OWNER TO postgres;

--
-- Name: COLUMN outcomes.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN outcomes.name IS '(DC2Type:citext)';


--
-- Name: COLUMN outcomes.canonicalised_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN outcomes.canonicalised_name IS '(DC2Type:citext)';


--
-- Name: COLUMN outcomes.matchable_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN outcomes.matchable_name IS '(DC2Type:citext)';


--
-- Name: outcomes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE outcomes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE outcomes_id_seq OWNER TO postgres;

--
-- Name: outcomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE outcomes_id_seq OWNED BY outcomes.id;


--
-- Name: participants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE participants (
    id integer NOT NULL,
    fixture_id integer NOT NULL,
    entrant_id integer NOT NULL
);


ALTER TABLE participants OWNER TO postgres;

--
-- Name: participants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE participants_id_seq OWNER TO postgres;

--
-- Name: participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE participants_id_seq OWNED BY participants.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reports (
    id integer NOT NULL,
    feed_id integer,
    run_command character varying(512) NOT NULL,
    start_time timestamp(0) without time zone NOT NULL,
    duration integer NOT NULL,
    memory_peak double precision DEFAULT '0'::double precision NOT NULL,
    query_count integer DEFAULT 0 NOT NULL,
    completed boolean NOT NULL,
    fail_message text,
    hostname character varying(512) NOT NULL,
    output text NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    name citext
);


ALTER TABLE reports OWNER TO postgres;

--
-- Name: COLUMN reports.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reports.name IS '(DC2Type:citext)';


--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_id_seq OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reports_id_seq OWNED BY reports.id;


--
-- Name: sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sites (
    id integer NOT NULL,
    feed_id integer,
    bookie_id integer NOT NULL,
    country_id integer NOT NULL,
    name character varying(150) NOT NULL,
    type character varying(16) NOT NULL,
    url_homepage character varying(1024) NOT NULL,
    deeplink character varying(1024) DEFAULT NULL::character varying,
    deeplink_mobile character varying(1024) DEFAULT NULL::character varying,
    deeplink_remote character varying(1024) DEFAULT NULL::character varying,
    deeplink_event character varying(1024) DEFAULT NULL::character varying,
    affiliate_key character varying(32) DEFAULT NULL::character varying
);


ALTER TABLE sites OWNER TO postgres;

--
-- Name: sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sites_id_seq OWNER TO postgres;

--
-- Name: sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sites_id_seq OWNED BY sites.id;


--
-- Name: statsfixtures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE statsfixtures (
    id bigint NOT NULL,
    fixture_id integer NOT NULL,
    location character varying(64) DEFAULT NULL::character varying,
    discriminator character varying(255) NOT NULL
);


ALTER TABLE statsfixtures OWNER TO postgres;

--
-- Name: statsfixtures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE statsfixtures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE statsfixtures_id_seq OWNER TO postgres;

--
-- Name: statsfixtures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE statsfixtures_id_seq OWNED BY statsfixtures.id;


--
-- Name: statsparticipants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE statsparticipants (
    id bigint NOT NULL,
    participant_id integer NOT NULL,
    discriminator character varying(255) NOT NULL
);


ALTER TABLE statsparticipants OWNER TO postgres;

--
-- Name: statsparticipants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE statsparticipants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE statsparticipants_id_seq OWNER TO postgres;

--
-- Name: statsparticipants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE statsparticipants_id_seq OWNED BY statsparticipants.id;


--
-- Name: aliascategory1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliascategory1 ALTER COLUMN id SET DEFAULT nextval('aliascategory1_id_seq'::regclass);


--
-- Name: aliascategory2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliascategory2 ALTER COLUMN id SET DEFAULT nextval('aliascategory2_id_seq'::regclass);


--
-- Name: aliascategory3 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliascategory3 ALTER COLUMN id SET DEFAULT nextval('aliascategory3_id_seq'::regclass);


--
-- Name: aliasevent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliasevent ALTER COLUMN id SET DEFAULT nextval('aliasevent_id_seq'::regclass);


--
-- Name: aliasmarket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliasmarket ALTER COLUMN id SET DEFAULT nextval('aliasmarket_id_seq'::regclass);


--
-- Name: aliasoutcome id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliasoutcome ALTER COLUMN id SET DEFAULT nextval('aliasoutcome_id_seq'::regclass);


--
-- Name: banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY banners ALTER COLUMN id SET DEFAULT nextval('banners_id_seq'::regclass);


--
-- Name: basearticles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY basearticles ALTER COLUMN id SET DEFAULT nextval('basearticles_id_seq'::regclass);


--
-- Name: bookieevents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookieevents ALTER COLUMN id SET DEFAULT nextval('bookieevents_id_seq'::regclass);


--
-- Name: bookiemarkets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookiemarkets ALTER COLUMN id SET DEFAULT nextval('bookiemarkets_id_seq'::regclass);


--
-- Name: bookieoutcomes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookieoutcomes ALTER COLUMN id SET DEFAULT nextval('bookieoutcomes_id_seq'::regclass);


--
-- Name: bookies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookies ALTER COLUMN id SET DEFAULT nextval('bookies_id_seq'::regclass);


--
-- Name: category1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category1 ALTER COLUMN id SET DEFAULT nextval('category1_id_seq'::regclass);


--
-- Name: category2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category2 ALTER COLUMN id SET DEFAULT nextval('category2_id_seq'::regclass);


--
-- Name: category3 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category3 ALTER COLUMN id SET DEFAULT nextval('category3_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: entrants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrants ALTER COLUMN id SET DEFAULT nextval('entrants_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: featuredevent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY featuredevent ALTER COLUMN id SET DEFAULT nextval('featuredevent_id_seq'::regclass);


--
-- Name: featuredoffer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY featuredoffer ALTER COLUMN id SET DEFAULT nextval('featuredoffer_id_seq'::regclass);


--
-- Name: feeds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY feeds ALTER COLUMN id SET DEFAULT nextval('feeds_id_seq'::regclass);


--
-- Name: fixtures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fixtures ALTER COLUMN id SET DEFAULT nextval('fixtures_id_seq'::regclass);


--
-- Name: marketroles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marketroles ALTER COLUMN id SET DEFAULT nextval('marketroles_id_seq'::regclass);


--
-- Name: markets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY markets ALTER COLUMN id SET DEFAULT nextval('markets_id_seq'::regclass);


--
-- Name: mediaimport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mediaimport ALTER COLUMN id SET DEFAULT nextval('mediaimport_id_seq'::regclass);


--
-- Name: metabookieevent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookieevent ALTER COLUMN id SET DEFAULT nextval('metabookieevent_id_seq'::regclass);


--
-- Name: metabookiemarket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookiemarket ALTER COLUMN id SET DEFAULT nextval('metabookiemarket_id_seq'::regclass);


--
-- Name: metabookieoutcome id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookieoutcome ALTER COLUMN id SET DEFAULT nextval('metabookieoutcome_id_seq'::regclass);


--
-- Name: metacategory1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory1 ALTER COLUMN id SET DEFAULT nextval('metacategory1_id_seq'::regclass);


--
-- Name: metacategory2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory2 ALTER COLUMN id SET DEFAULT nextval('metacategory2_id_seq'::regclass);


--
-- Name: metacategory3 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory3 ALTER COLUMN id SET DEFAULT nextval('metacategory3_id_seq'::regclass);


--
-- Name: metaentrant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaentrant ALTER COLUMN id SET DEFAULT nextval('metaentrant_id_seq'::regclass);


--
-- Name: metaevent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaevent ALTER COLUMN id SET DEFAULT nextval('metaevent_id_seq'::regclass);


--
-- Name: metafixture id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metafixture ALTER COLUMN id SET DEFAULT nextval('metafixture_id_seq'::regclass);


--
-- Name: metamarket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metamarket ALTER COLUMN id SET DEFAULT nextval('metamarket_id_seq'::regclass);


--
-- Name: metaoutcome id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaoutcome ALTER COLUMN id SET DEFAULT nextval('metaoutcome_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY offers ALTER COLUMN id SET DEFAULT nextval('offers_id_seq'::regclass);


--
-- Name: outcomes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY outcomes ALTER COLUMN id SET DEFAULT nextval('outcomes_id_seq'::regclass);


--
-- Name: participants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participants ALTER COLUMN id SET DEFAULT nextval('participants_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports ALTER COLUMN id SET DEFAULT nextval('reports_id_seq'::regclass);


--
-- Name: sites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sites ALTER COLUMN id SET DEFAULT nextval('sites_id_seq'::regclass);


--
-- Name: statsfixtures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY statsfixtures ALTER COLUMN id SET DEFAULT nextval('statsfixtures_id_seq'::regclass);


--
-- Name: statsparticipants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY statsparticipants ALTER COLUMN id SET DEFAULT nextval('statsparticipants_id_seq'::regclass);


--
-- Data for Name: aliascategory1; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (1, 1, 'TV_SPECIALS', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (2, 2, 'HORSE_RACING', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (6, 6, 'RUGBY_UNION', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (10, 10, 'AMERICAN_FB', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (16, 16, 'MOTOR_CARS', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (17, 17, 'GREYHOUNDS', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (19, 19, 'ICE_HOCKEY', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (20, 20, 'LOTTO', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (21, 21, 'MOTOR_BIKES', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (25, 25, 'RUGBY_LEAGUE', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (27, 27, 'MOTOR_SPEEDWAY', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (28, 28, 'UFC', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (30, 30, 'VIRTUAL', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (31, 31, 'CHRISTMAS_SPECIA', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (33, 33, 'ROYAL_SPECIALS', 'SYSTEM', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (34, 16, 'Formula-1', 'ADMIN', NULL, NULL);
INSERT INTO aliascategory1 (id, domain_id, name, type, created_at, updated_at) VALUES (35, 16, 'Motor-Sports', 'ADMIN', '2017-08-31 21:23:36', '2017-08-31 21:23:36');


--
-- Name: aliascategory1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aliascategory1_id_seq', 35, true);


--
-- Data for Name: aliascategory2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO aliascategory2 (id, domain_id, name, type, created_at, updated_at) VALUES (1, 27, 'UKFOOTBALL', 'ADMIN', NULL, NULL);


--
-- Name: aliascategory2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aliascategory2_id_seq', 1, true);


--
-- Data for Name: aliascategory3; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: aliascategory3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aliascategory3_id_seq', 1, false);


--
-- Data for Name: aliasevent; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: aliasevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aliasevent_id_seq', 1, false);


--
-- Data for Name: aliasmarket; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: aliasmarket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aliasmarket_id_seq', 1, false);


--
-- Data for Name: aliasoutcome; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: aliasoutcome_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aliasoutcome_id_seq', 1, false);


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO banners (id, offer_id, bookie_element_id, type, width, height, img_sprintf, js_sprintf, iframe_sprintf) VALUES (1, 1, 5995, 'SKYSCRAPER', 160, 600, 'http://wlcoral.iaofr.com/wl/imp/?btag=%sb_5995&aid=', NULL, NULL);
INSERT INTO banners (id, offer_id, bookie_element_id, type, width, height, img_sprintf, js_sprintf, iframe_sprintf) VALUES (2, 1, 12680, 'BUTTON', 200, 200, 'http://wlcoral.iaofr.com/wl/imp/?btag=%sb_12680&aid=', NULL, NULL);
INSERT INTO banners (id, offer_id, bookie_element_id, type, width, height, img_sprintf, js_sprintf, iframe_sprintf) VALUES (3, 1, 12822, 'BANNER', 600, 90, 'http://wlcoral.iaofr.com/wl/imp/?btag=%sb_12822&aid=', NULL, NULL);


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('banners_id_seq', 3, true);


--
-- Data for Name: basearticles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: basearticles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('basearticles_id_seq', 1, false);


--
-- Data for Name: bookieevents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: bookieevents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bookieevents_id_seq', 1, false);


--
-- Data for Name: bookiemarkets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: bookiemarkets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bookiemarkets_id_seq', 1, false);


--
-- Data for Name: bookieoutcomes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: bookieoutcomes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bookieoutcomes_id_seq', 1, false);


--
-- Data for Name: bookies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bookies (id, name, commission, betting_type, created_at, updated_at) VALUES (1, 'CORAL', 30, 'fixed_odds', '2016-12-14 08:40:26', '2016-12-14 08:40:26');
INSERT INTO bookies (id, name, commission, betting_type, created_at, updated_at) VALUES (2, 'SKY', 30, 'fixed_odds', '2016-12-14 08:40:26', '2016-12-14 08:40:26');
INSERT INTO bookies (id, name, commission, betting_type, created_at, updated_at) VALUES (3, 'BOYLE', 30, 'fixed_odds', '2016-12-14 08:40:26', '2016-12-14 08:40:26');


--
-- Name: bookies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bookies_id_seq', 3, true);


--
-- Data for Name: category1; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (8, 'Cricket', 'Cricket', 'Cricket', -670, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (9, 'ESports', 'ESports', 'ESports', 0, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (11, 'Badminton', 'Badminton', 'Badminton', 35, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (12, 'Baseball', 'Baseball', 'Baseball', 50, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (13, 'Basketball', 'Basketball', 'Basketball', 60, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (15, 'Cycling', 'Cycling', 'Cycling', 120, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (18, 'Handball', 'Handball', 'Handball', 200, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (22, 'Olympics', 'Olympics', 'Olympics', 263, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (24, 'Pool', 'Pool', 'Pool', 280, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (27, 'Speedway', 'Speedway', 'Speedway', 319, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (29, 'Volleyball', 'Volleyball', 'Volleyball', 360, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (32, 'Movies', 'Movies', 'Movies', 420, true, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (3, 'Football', 'Football', 'Football', -9043, false, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (16, 'Motorsports', 'Motorsports', 'Formula 1', 160, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (1, 'TV Specials', 'TV-Specials', 'TV Specials', -9900, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (6, 'Rugby Union', 'Rugby-Union', 'Rugby Union', -770, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (10, 'American Football', 'American-Football', 'American Football', 4, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (17, 'Greyhound Racing', 'Greyhound-Racing', 'Greyhound Racing', 190, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (19, 'Ice Hockey', 'Ice-Hockey', 'Ice Hockey', 220, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (20, 'Lotto Specials', 'Lotto-Specials', 'Lotto Specials', 227, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (21, 'Motor Bikes', 'Motor-Bikes', 'Motor Bikes', 230, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (25, 'Rugby League', 'Rugby-League', 'Rugby League', 300, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (30, 'Virtual Sports', 'Virtual-Sports', 'Virtual Sports', 390, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (31, 'Christmas Specials', 'Christmas-Specials', 'Christmas Specials', 405, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (33, 'Royal Specials', 'Royal-Specials', 'Royal Specials', 465, true, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (4, 'Tennis', 'Tennis', 'Tennis', -9042, false, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (26, 'Snooker', 'Snooker', 'Snooker', 318, false, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (14, 'Boxing', 'Boxing', 'Boxing', 91, false, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (7, 'Darts', 'Darts', 'Darts', -760, false, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (5, 'Golf', 'Golf', 'Golf', -778, false, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (2, 'Horse Racing', 'Horse-Racing', 'Horse Racing', -9500, false, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (23, 'Politics', 'Politics', 'Politics', 275, false, '2016-12-14 08:40:29', '2016-12-14 08:40:29', NULL);
INSERT INTO category1 (id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (28, 'UFC MMA', 'UFC-MMA', 'UFC/MMA', 350, false, '2016-12-14 08:40:29', '2017-05-29 19:09:15', NULL);


--
-- Name: category1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category1_id_seq', 33, true);


--
-- Data for Name: category2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (3, 12, 'Baseball', 'Baseball', 'Baseball Baseball', 0, true, '2016-12-14 08:40:30', '2016-12-14 08:40:30', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (16, 8, 'Cricket', 'Cricket', 'Cricket Cricket', 0, true, '2016-12-14 08:40:30', '2016-12-14 08:40:30', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (17, 15, 'Cycling', 'Cycling', 'Cycling Cycling', 0, true, '2016-12-14 08:40:30', '2016-12-14 08:40:30', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (76, 24, 'Pool', 'Pool', 'Pool Pool', 0, true, '2016-12-14 08:40:31', '2016-12-14 08:40:31', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (80, 27, 'Speedway', 'Speedway', 'Speedway Speedway', 0, true, '2016-12-14 08:40:31', '2016-12-14 08:40:31', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (91, 11, 'Badminton', 'Badminton', 'Badminton Badminton', 0, true, '2016-12-14 08:40:31', '2016-12-14 08:40:31', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (1, 4, 'Tennis', 'Tennis', 'Tennis Tennis', -1, false, '2016-12-14 08:40:30', '2017-05-29 19:09:16', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (79, 26, 'Snooker', 'Snooker', 'Snooker Snooker', 0, false, '2016-12-14 08:40:31', '2017-05-29 19:09:16', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (15, 14, 'Boxing', 'Boxing', 'Boxing Boxing', 0, false, '2016-12-14 08:40:30', '2017-05-29 19:09:16', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (18, 7, 'Darts', 'Darts', 'Darts Darts', 0, false, '2016-12-14 08:40:30', '2017-05-29 19:09:16', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (49, 5, 'Golf', 'Golf', 'Golf Golf', 0, false, '2016-12-14 08:40:30', '2017-05-29 19:09:16', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (98, 18, 'Romania', 'Romania', 'Handball Romania', 0, true, '2016-12-14 08:40:31', '2016-12-14 08:40:31', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (100, 9, 'eSports', 'eSports', 'ESports eSports', 0, true, '2016-12-14 08:40:31', '2016-12-14 08:40:31', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (116, 20, '49s', '49s', 'Lotto Specials 49s', 9990, true, '2016-12-14 08:40:31', '2016-12-14 08:40:31', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (2, 10, 'American Football', 'American-Football', 'American Football American Football', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (4, 13, 'Basketball Australia', 'Basketball-Australia', 'Basketball Basketball Australia', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (5, 13, 'Basketball Specials', 'Basketball-Specials', 'Basketball Basketball Specials', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (6, 13, 'Basketball Brazil', 'Basketball-Brazil', 'Basketball Basketball Brazil', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (7, 13, 'Basketball China', 'Basketball-China', 'Basketball Basketball China', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (8, 13, 'Basketball European Competitions', 'Basketball-European-Competitions', 'Basketball Basketball European Competitions', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (9, 13, 'Basketball Finland', 'Basketball-Finland', 'Basketball Basketball Finland', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (10, 13, 'Basketball Israel', 'Basketball-Israel', 'Basketball Basketball Israel', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (11, 13, 'Basketball Philippines', 'Basketball-Philippines', 'Basketball Basketball Philippines', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (12, 13, 'Basketball Poland', 'Basketball-Poland', 'Basketball Basketball Poland', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (13, 13, 'Basketball South Korea', 'Basketball-South-Korea', 'Basketball Basketball South Korea', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (14, 13, 'Basketball USA', 'Basketball-USA', 'Basketball Basketball USA', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (50, 5, 'Golf New Year Specials', 'Golf-New-Year-Specials', 'Golf Golf New Year Specials', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (53, 18, 'Handball Austria', 'Handball-Austria', 'Handball Handball Austria', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (54, 18, 'Handball Denmark', 'Handball-Denmark', 'Handball Handball Denmark', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (55, 18, 'Handball Finland', 'Handball-Finland', 'Handball Handball Finland', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (56, 18, 'Handball France', 'Handball-France', 'Handball Handball France', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (57, 18, 'Handball Germany', 'Handball-Germany', 'Handball Handball Germany', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (58, 18, 'Handball Hungary', 'Handball-Hungary', 'Handball Handball Hungary', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (59, 18, 'Handball International', 'Handball-International', 'Handball Handball International', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (60, 18, 'Handball Norway', 'Handball-Norway', 'Handball Handball Norway', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (61, 18, 'Handball Spain', 'Handball-Spain', 'Handball Handball Spain', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (62, 18, 'Handball Sweden', 'Handball-Sweden', 'Handball Handball Sweden', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (65, 2, 'Daily Racing Specials', 'Daily-Racing-Specials', 'Horse Racing Daily Racing Specials', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (66, 19, 'Ice Hockey Czech Republic', 'Ice-Hockey-Czech-Republic', 'Ice Hockey Ice Hockey Czech Republic', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (67, 19, 'Ice Hockey Finland', 'Ice-Hockey-Finland', 'Ice Hockey Ice Hockey Finland', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (68, 19, 'Ice Hockey Germany', 'Ice-Hockey-Germany', 'Ice Hockey Ice Hockey Germany', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (69, 19, 'Ice Hockey Internationals', 'Ice-Hockey-Internationals', 'Ice Hockey Ice Hockey Internationals', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (70, 19, 'Ice Hockey Russia', 'Ice-Hockey-Russia', 'Ice Hockey Ice Hockey Russia', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (71, 19, 'Ice Hockey Sweden', 'Ice-Hockey-Sweden', 'Ice Hockey Ice Hockey Sweden', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (72, 19, 'Ice Hockey Switzerland', 'Ice-Hockey-Switzerland', 'Ice Hockey Ice Hockey Switzerland', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (75, 16, 'Formula 1', 'Formula-1', 'Formula 1 Formula 1', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (81, 4, 'Tennis New Year Specials', 'Tennis-New-Year-Specials', 'Tennis Tennis New Year Specials', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (83, 29, 'Volleyball Czech Republic', 'Volleyball-Czech-Republic', 'Volleyball Volleyball Czech Republic', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (84, 29, 'Volleyball Finland', 'Volleyball-Finland', 'Volleyball Volleyball Finland', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (73, 19, 'Ice Hockey USA', 'Ice-Hockey-USA', 'Ice Hockey Ice Hockey USA', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (74, 21, 'Motor Bikes All Motor Bikes', 'Motor-Bikes-All-Motor-Bikes', 'Motor Bikes Motor Bikes All Motor Bikes', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (77, 25, 'Rugby League', 'Rugby-League', 'Rugby League Rugby League', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (78, 6, 'Rugby Union', 'Rugby-Union', 'Rugby Union Rugby Union', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (19, 3, 'Football Argentina', 'Football-Argentina', 'Football Football Argentina', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (27, 3, 'Football England', 'Football-England', 'Football Football England', 0, false, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (85, 29, 'Volleyball Germany', 'Volleyball-Germany', 'Volleyball Volleyball Germany', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (86, 29, 'Volleyball Greece', 'Volleyball-Greece', 'Volleyball Volleyball Greece', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (87, 29, 'Volleyball International', 'Volleyball-International', 'Volleyball Volleyball International', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (88, 29, 'Volleyball Italy', 'Volleyball-Italy', 'Volleyball Volleyball Italy', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (89, 29, 'Volleyball Poland', 'Volleyball-Poland', 'Volleyball Volleyball Poland', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (90, 29, 'Volleyball Russia', 'Volleyball-Russia', 'Volleyball Volleyball Russia', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (93, 22, 'Specials All Specials', 'Specials-All-Specials', 'Olympics Specials All Specials', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (94, 13, 'Basketball Norway', 'Basketball-Norway', 'Basketball Basketball Norway', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (95, 31, 'Christmas Specials', 'Christmas-Specials', 'Christmas Specials Christmas Specials', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (96, 29, 'Volleyball Brazil', 'Volleyball-Brazil', 'Volleyball Volleyball Brazil', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (97, 29, 'Volleyball South Korea', 'Volleyball-South-Korea', 'Volleyball Volleyball South Korea', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (99, 18, 'Handball World Club Competitions', 'Handball-World-Club-Competitions', 'Handball Handball World Club Competitions', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (102, 19, 'Ice Hockey Specials', 'Ice-Hockey-Specials', 'Ice Hockey Ice Hockey Specials', 5, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (104, 33, 'Royal Specials', 'Royal-Specials', 'Royal Specials Royal Specials', 100, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (105, 32, 'Movies All Movies', 'Movies-All-Movies', 'Movies Movies All Movies', 100, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (106, 1, 'TV Specials UK', 'TV-Specials-UK', 'TV Specials TV Specials UK', 105, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (107, 1, 'TV Specials Awards', 'TV-Specials-Awards', 'TV Specials TV Specials Awards', 160, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (108, 30, 'Virtual Horse Racing', 'Virtual-Horse-Racing', 'Virtual Sports Virtual Horse Racing', 200, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (109, 30, 'Virtual Greyhounds', 'Virtual-Greyhounds', 'Virtual Sports Virtual Greyhounds', 201, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (110, 30, 'Virtual Football', 'Virtual-Football', 'Virtual Sports Virtual Football', 202, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (111, 30, 'Virtual Tennis', 'Virtual-Tennis', 'Virtual Sports Virtual Tennis', 203, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (112, 30, 'Virtual Motorsports', 'Virtual-Motorsports', 'Virtual Sports Virtual Motorsports', 204, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (113, 30, 'Virtual Speedway', 'Virtual-Speedway', 'Virtual Sports Virtual Speedway', 205, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (114, 30, 'Virtual Cycling', 'Virtual-Cycling', 'Virtual Sports Virtual Cycling', 206, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (117, 20, 'Irish Lotto', 'Irish-Lotto', 'Lotto Specials Irish Lotto', 9991, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (120, 7, 'My Darts Markets', 'My-Darts-Markets', 'Darts My Darts Markets', 9999, true, '2016-12-14 08:40:31', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (20, 3, 'Football Australia', 'Football-Australia', 'Football Football Australia', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (21, 3, 'Football Austria', 'Football-Austria', 'Football Football Austria', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (22, 3, 'Football Belgium', 'Football-Belgium', 'Football Football Belgium', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (23, 3, 'Football Brazil', 'Football-Brazil', 'Football Football Brazil', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (24, 3, 'Football Bulgaria', 'Football-Bulgaria', 'Football Football Bulgaria', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (25, 3, 'Football Colombia', 'Football-Colombia', 'Football Football Colombia', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (26, 3, 'Football Croatia', 'Football-Croatia', 'Football Football Croatia', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (28, 3, 'Football France', 'Football-France', 'Football Football France', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (29, 3, 'Football Germany', 'Football-Germany', 'Football Football Germany', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (30, 3, 'Football Greece', 'Football-Greece', 'Football Football Greece', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (31, 3, 'Football Hong Kong', 'Football-Hong-Kong', 'Football Football Hong Kong', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (32, 3, 'Football India', 'Football-India', 'Football Football India', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (33, 3, 'Football Indonesia', 'Football-Indonesia', 'Football Football Indonesia', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (34, 3, 'Football International', 'Football-International', 'Football Football International', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (35, 3, 'Football Italy', 'Football-Italy', 'Football Football Italy', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (36, 3, 'Football Morocco', 'Football-Morocco', 'Football Football Morocco', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (37, 3, 'Football Netherlands', 'Football-Netherlands', 'Football Football Netherlands', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (38, 3, 'Football Northern Ireland', 'Football-Northern-Ireland', 'Football Football Northern Ireland', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (40, 3, 'Football Poland', 'Football-Poland', 'Football Football Poland', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (39, 3, 'Football World Club Competitions', 'Football-World-Club-Competitions', 'Football Football World Club Competitions', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (41, 3, 'Football Portugal', 'Football-Portugal', 'Football Football Portugal', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (42, 3, 'Football Romania', 'Football-Romania', 'Football Football Romania', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:15', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (44, 3, 'Football Serbia', 'Football-Serbia', 'Football Football Serbia', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:16', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (47, 3, 'Football Tunisia', 'Football-Tunisia', 'Football Football Tunisia', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:16', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (48, 3, 'Football Turkey', 'Football-Turkey', 'Football Football Turkey', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:09:16', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (115, 3, 'Football Pools', 'Football-Pools', 'Football Football Pools', 1000, true, '2016-12-14 08:40:31', '2017-05-29 19:09:16', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (119, 3, 'My Football Markets', 'My-Football-Markets', 'Football My Football Markets', 9999, true, '2016-12-14 08:40:31', '2017-05-29 19:09:16', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (51, 17, 'Greyhounds Live', 'Greyhounds-Live', 'Greyhound Racing Greyhounds - Live', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:14:05', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (52, 17, 'Greyhounds Specials', 'Greyhounds-Specials', 'Greyhound Racing Greyhounds - Specials', 0, true, '2016-12-14 08:40:30', '2017-05-29 19:14:05', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (63, 2, 'Horse Racing Live', 'Horse-Racing-Live', 'Horse Racing Horse Racing - Live', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:14:05', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (92, 2, 'Horse Racing Tote Pools', 'Horse-Racing-Tote-Pools', 'Horse Racing Horse Racing - Tote Pools', 0, true, '2016-12-14 08:40:31', '2017-05-29 19:14:05', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (43, 3, 'Football Scotland', 'Football-Scotland', 'Football Football Scotland', 0, false, '2016-12-14 08:40:30', '2017-05-30 17:33:43', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (46, 3, 'Football Spain', 'Football-Spain', 'Football Football Spain', 0, false, '2016-12-14 08:40:30', '2017-05-30 17:33:43', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (118, 3, 'Football Specials', 'Football-Specials', 'Football Football Specials', 9999, false, '2016-12-14 08:40:31', '2017-05-30 17:33:43', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (45, 3, 'Football UEFA Club Competitions', 'Football-UEFA-Club-Competitions', 'Football Football UEFA Club Competitions', 0, false, '2016-12-14 08:40:30', '2017-05-30 17:33:43', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (64, 2, 'Horse Racing Specials', 'Horse-Racing-Specials', 'Horse Racing Horse Racing - Specials', 0, false, '2016-12-14 08:40:31', '2017-05-30 17:33:43', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (103, 23, 'Politics UK', 'Politics-UK', 'Politics Politics UK', 98, false, '2016-12-14 08:40:31', '2017-05-30 17:33:43', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (101, 3, 'England (TEST)', 'England-TEST', 'Football England (TEST)', 0, true, '2016-12-14 08:40:31', '2017-06-24 07:33:30', NULL);
INSERT INTO category2 (id, category1_id, name, canonicalised_name, matchable_name, display_order, filtered, created_at, updated_at, display_name) VALUES (82, 28, 'UFC MMA', 'UFC-MMA', 'UFC/MMA UFC/MMA', 0, false, '2016-12-14 08:40:31', '2017-08-19 16:23:25', NULL);


--
-- Name: category2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category2_id_seq', 120, true);


--
-- Data for Name: category3; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (11, 2, 'NFL', 'NFL', 'American Football American Football NFL', -100, true, 0, '2016-12-14 08:40:34', '2016-12-14 08:40:34', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (12, 3, 'MLB', 'MLB', 'Baseball Baseball MLB', 0, true, 0, '2016-12-14 08:40:34', '2016-12-14 08:40:34', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (16, 14, 'NBA', 'NBA', 'Basketball Basketball USA NBA', -3980, true, 0, '2016-12-14 08:40:36', '2016-12-14 08:40:36', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (93, 51, 'Henlow', 'Henlow', 'Greyhound Racing Greyhounds - Live Henlow', -440, true, 0, '2016-12-14 08:42:09', '2016-12-14 08:42:09', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (100, 63, 'Chantilly', 'Chantilly', 'Horse Racing Horse Racing - Live Chantilly', -9999, true, 0, '2016-12-14 08:42:11', '2016-12-14 08:42:11', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (101, 63, 'Aintree', 'Aintree', 'Horse Racing Horse Racing - Live Aintree', -9980, true, 0, '2016-12-14 08:42:11', '2016-12-14 08:42:11', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (102, 63, 'Ascot', 'Ascot', 'Horse Racing Horse Racing - Live Ascot', -9975, true, 0, '2016-12-14 08:42:11', '2016-12-14 08:42:11', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (103, 63, 'Cheltenham', 'Cheltenham', 'Horse Racing Horse Racing - Live Cheltenham', -9910, true, 0, '2016-12-14 08:42:11', '2016-12-14 08:42:11', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (104, 63, 'Chepstow', 'Chepstow', 'Horse Racing Horse Racing - Live Chepstow', -9890, true, 0, '2016-12-14 08:42:11', '2016-12-14 08:42:11', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (10, 1, 'Davis Cup', 'Davis-Cup', 'Tennis Tennis Davis Cup', -2000, false, 0, '2016-12-14 08:40:32', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (106, 63, 'Kempton', 'Kempton', 'Horse Racing Horse Racing - Live Kempton', -9730, true, 0, '2016-12-14 08:42:11', '2016-12-14 08:42:11', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (107, 63, 'Lingfield', 'Lingfield', 'Horse Racing Horse Racing - Live Lingfield', -9710, true, 0, '2016-12-14 08:42:11', '2016-12-14 08:42:11', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (108, 63, 'Newmarket', 'Newmarket', 'Horse Racing Horse Racing - Live Newmarket', -9650, true, 0, '2016-12-14 08:42:11', '2016-12-14 08:42:11', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (109, 63, 'Leopardstown', 'Leopardstown', 'Horse Racing Horse Racing - Live Leopardstown', -9260, true, 0, '2016-12-14 08:42:11', '2016-12-14 08:42:11', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (121, 73, 'NHL', 'NHL', 'Ice Hockey Ice Hockey USA NHL', -1980, true, 0, '2016-12-14 08:42:13', '2016-12-14 08:42:13', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (122, 73, 'AHL', 'AHL', 'Ice Hockey Ice Hockey USA AHL', -1960, true, 0, '2016-12-14 08:42:13', '2016-12-14 08:42:13', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (136, 78, 'Specials', 'Specials', 'Rugby Union Rugby Union Specials', 1000, true, 0, '2016-12-14 08:42:13', '2016-12-14 08:42:13', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (154, 115, 'V15', 'V15', 'Football Football Pools V15', 0, true, 0, '2016-12-14 08:42:16', '2016-12-14 08:42:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (1, 1, '2017 Specials', '2017-Specials', 'Tennis Tennis 2017  Specials', -6500, false, 0, '2016-12-14 08:40:32', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (13, 4, 'Australian NBL', 'Australian-NBL', 'Basketball Basketball Australia Australian NBL', -870, true, 0, '2016-12-14 08:40:34', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (14, 5, 'Enhanced Multiples', 'Enhanced-Multiples', 'Basketball Basketball Specials Enhanced Multiples', 0, true, 0, '2016-12-14 08:40:34', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (15, 8, 'Euroleague 2016 17', 'Euroleague-2016-17', 'Basketball Basketball European Competitions Euroleague 2016/17', -1975, true, 0, '2016-12-14 08:40:35', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (19, 16, 'Ashes 2017 18', 'Ashes-2017-18', 'Cricket Cricket Ashes 2017-18', -100, true, 0, '2016-12-14 08:40:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (20, 16, 'Test Matches', 'Test-Matches', 'Cricket Cricket Test Matches', 15, true, 0, '2016-12-14 08:40:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (21, 16, 'County Championship Division One 2017', 'County-Championship-Division-One-2017', 'Cricket Cricket County Championship Division One 2017', 50, true, 0, '2016-12-14 08:40:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (22, 16, 'County Championship Division Two 2017', 'County-Championship-Division-Two-2017', 'Cricket Cricket County Championship Division Two 2017', 55, true, 0, '2016-12-14 08:40:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (23, 16, 'ICC Champions Trophy', 'ICC-Champions-Trophy', 'Cricket Cricket ICC Champions Trophy', 80, true, 0, '2016-12-14 08:40:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (24, 16, 'T20 Big Bash', 'T20-Big-Bash', 'Cricket Cricket T20 Big Bash', 135, true, 0, '2016-12-14 08:40:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (25, 16, 'Ram Slam T20', 'Ram-Slam-T20', 'Cricket Cricket Ram Slam T20', 135, true, 0, '2016-12-14 08:40:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (26, 16, 'Womens T20 Big Bash', 'Womens-T20-Big-Bash', 'Cricket Cricket Womens T20 Big Bash', 136, true, 0, '2016-12-14 08:40:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (27, 16, 'Sheffield Shield', 'Sheffield-Shield', 'Cricket Cricket Sheffield Shield', 145, true, 0, '2016-12-14 08:40:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (28, 16, 'ICC World Cup 2019', 'ICC-World-Cup-2019', 'Cricket Cricket ICC World Cup 2019', 200, true, 0, '2016-12-14 08:40:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (29, 17, 'Tour de France', 'Tour-de-France', 'Cycling Cycling Tour de France', 200, true, 0, '2016-12-14 08:40:37', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (32, 19, 'Argentinian Primera B Nacional', 'Argentinian-Primera-B-Nacional', 'Football Football Argentina Argentinian Primera B Nacional', -1540, true, 0, '2016-12-14 08:40:40', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (33, 20, 'Australian A League', 'Australian-A-League', 'Football Football Australia Australian A-League', -1500, true, 0, '2016-12-14 08:40:42', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (34, 21, 'Austrian Bundesliga', 'Austrian-Bundesliga', 'Football Football Austria Austrian Bundesliga', -2100, true, 0, '2016-12-14 08:40:43', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (35, 22, 'Belgian First Division A', 'Belgian-First-Division-A', 'Football Football Belgium Belgian First Division A', -2000, true, 0, '2016-12-14 08:40:45', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (36, 22, 'Belgium First Division B', 'Belgium-First-Division-B', 'Football Football Belgium Belgium First Division B', -100, true, 0, '2016-12-14 08:40:45', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (37, 25, 'Colombian Primera Division', 'Colombian-Primera-Division', 'Football Football Colombia Colombian Primera Division', -1335, true, 0, '2016-12-14 08:40:45', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (39, 27, 'Premier League', 'Premier-League', 'Football Football England Premier League', -9999, false, 0, '2016-12-14 08:41:07', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (47, 28, 'French Ligue 1', 'French-Ligue-1', 'Football Football France French Ligue 1', -3197, true, 0, '2016-12-14 08:41:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (48, 28, 'French Ligue 2', 'French-Ligue-2', 'Football Football France French Ligue 2', -3196, true, 0, '2016-12-14 08:41:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (49, 28, 'French National', 'French-National', 'Football Football France French National', -2975, true, 0, '2016-12-14 08:41:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (50, 29, 'German Bundesliga', 'German-Bundesliga', 'Football Football Germany German Bundesliga', -3200, true, 0, '2016-12-14 08:41:23', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (53, 34, 'World Cup 2018', 'World-Cup-2018', 'Football Football International World Cup 2018', 50, true, 0, '2016-12-14 08:41:24', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (55, 35, 'Italian Serie A', 'Italian-Serie-A', 'Football Football Italy Italian Serie A', -3603, true, 0, '2016-12-14 08:41:30', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (56, 35, 'Italian Serie B', 'Italian-Serie-B', 'Football Football Italy Italian Serie B', -3602, true, 0, '2016-12-14 08:41:30', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (57, 35, 'Italian Super Cup', 'Italian-Super-Cup', 'Football Football Italy Italian Super Cup', -3390, true, 0, '2016-12-14 08:41:30', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (58, 37, 'Dutch Eredivisie', 'Dutch-Eredivisie', 'Football Football Netherlands Dutch Eredivisie', -2800, true, 0, '2016-12-14 08:41:34', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (59, 37, 'Dutch Eerste Divisie', 'Dutch-Eerste-Divisie', 'Football Football Netherlands Dutch Eerste Divisie', -2795, true, 0, '2016-12-14 08:41:34', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (17, 14, 'NCAA Men''s', 'NCAA-Men-s', 'Basketball Basketball USA NCAA Men''s', -1970, true, 0, '2016-12-14 08:40:36', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (38, 26, 'Croatian 1. HNL', 'Croatian-1-HNL', 'Football Football Croatia Croatian 1. HNL', -1310, true, 0, '2016-12-14 08:40:46', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (51, 29, 'German 2. Bundesliga', 'German-2-Bundesliga', 'Football Football Germany German 2. Bundesliga', -3199, true, 0, '2016-12-14 08:41:23', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (52, 29, 'German 3. Liga', 'German-3-Liga', 'Football Football Germany German 3. Liga', -3198, true, 0, '2016-12-14 08:41:23', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (54, 34, 'World Cup 2018 Qualification, UEFA', 'World-Cup-2018-Qualification-UEFA', 'Football Football International World Cup 2018 Qualification, UEFA', 55, true, 0, '2016-12-14 08:41:24', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (60, 37, 'Dutch KNVB Cup', 'Dutch-KNVB-Cup', 'Football Football Netherlands Dutch KNVB Cup', -2790, true, 0, '2016-12-14 08:41:34', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (141, 82, 'MMA UFC', 'MMA-UFC', 'UFC/MMA UFC/MMA MMA-UFC', 0, false, 0, '2016-12-14 08:42:14', '2017-08-19 16:23:25', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (61, 38, 'Northern Irish Premiership', 'Northern-Irish-Premiership', 'Football Football Northern Ireland Northern Irish Premiership', -1825, true, 0, '2016-12-14 08:41:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (62, 39, 'FIFA Club World Cup', 'FIFA-Club-World-Cup', 'Football Football World Club Competitions FIFA Club World Cup', -3700, true, 0, '2016-12-14 08:41:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (63, 40, 'Polish Ekstraklasa', 'Polish-Ekstraklasa', 'Football Football Poland Polish Ekstraklasa', -100, true, 0, '2016-12-14 08:41:38', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (64, 41, 'Portuguese Primeira Liga', 'Portuguese-Primeira-Liga', 'Football Football Portugal Portuguese Primeira Liga', -2750, true, 0, '2016-12-14 08:41:43', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (65, 41, 'Portuguese Liga de Honra', 'Portuguese-Liga-de-Honra', 'Football Football Portugal Portuguese Liga de Honra', -2745, true, 0, '2016-12-14 08:41:43', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (40, 27, 'EFL Cup', 'EFL-Cup', 'Football Football England EFL Cup', -9997, false, 0, '2016-12-14 08:41:07', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (66, 41, 'Portuguese Cup', 'Portuguese-Cup', 'Football Football Portugal Portuguese Cup', -2735, true, 0, '2016-12-14 08:41:43', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (67, 42, 'Romanian Liga I', 'Romanian-Liga-I', 'Football Football Romania Romanian Liga I', -100, true, 0, '2016-12-14 08:41:43', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (68, 42, 'Romanian Cup', 'Romanian-Cup', 'Football Football Romania Romanian Cup', -70, true, 0, '2016-12-14 08:41:43', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (18, 15, 'Upcoming Fights', 'Upcoming-Fights', 'Boxing Boxing Upcoming Fights', 5, false, 0, '2016-12-14 08:40:36', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (74, 44, 'Serbian SuperLiga', 'Serbian-SuperLiga', 'Football Football Serbia Serbian SuperLiga', 0, true, 0, '2016-12-14 08:41:51', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (80, 48, 'Turkish Super Lig', 'Turkish-Super-Lig', 'Football Football Turkey Turkish Super Lig', -1900, true, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (81, 48, 'Turkish Cup', 'Turkish-Cup', 'Football Football Turkey Turkish Cup', -1894, true, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (92, 50, 'Golf New Year Specials', 'Golf-New-Year-Specials', 'Golf Golf New Year Specials Golf New Year Specials', 0, true, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (95, 51, 'Ante Post Races', 'Ante-Post-Races', 'Greyhound Racing Greyhounds - Live Ante-Post Races', 9999, true, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (96, 52, 'BAGS Track Championship Specials', 'BAGS-Track-Championship-Specials', 'Greyhound Racing Greyhounds - Specials BAGS Track Championship Specials', 0, true, 0, '2016-12-14 08:42:10', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (99, 63, 'Royal Ascot', 'Royal-Ascot', 'Horse Racing Horse Racing - Live Royal Ascot', -10099, true, 0, '2016-12-14 08:42:11', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (105, 63, 'Epsom Downs', 'Epsom-Downs', 'Horse Racing Horse Racing - Live Epsom Downs', -9860, true, 0, '2016-12-14 08:42:11', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (110, 63, 'Churchill Downs', 'Churchill-Downs', 'Horse Racing Horse Racing - Live Churchill Downs', -4450, true, 0, '2016-12-14 08:42:11', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (113, 66, 'Czech Extraliga', 'Czech-Extraliga', 'Ice Hockey Ice Hockey Czech Republic Czech Extraliga', -1620, true, 0, '2016-12-14 08:42:11', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (114, 67, 'Finnish Liiga', 'Finnish-Liiga', 'Ice Hockey Ice Hockey Finland Finnish Liiga', -1660, true, 0, '2016-12-14 08:42:11', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (115, 68, 'German DEL', 'German-DEL', 'Ice Hockey Ice Hockey Germany German DEL', -1600, true, 0, '2016-12-14 08:42:11', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (116, 69, 'Euro Hockey Tour', 'Euro-Hockey-Tour', 'Ice Hockey Ice Hockey Internationals Euro Hockey Tour', -1895, true, 0, '2016-12-14 08:42:12', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (117, 70, 'Russian KHL', 'Russian-KHL', 'Ice Hockey Ice Hockey Russia Russian KHL', -1950, true, 0, '2016-12-14 08:42:12', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (118, 70, 'Russian MHL', 'Russian-MHL', 'Ice Hockey Ice Hockey Russia Russian MHL', -1940, true, 0, '2016-12-14 08:42:12', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (119, 71, 'Swedish SHL', 'Swedish-SHL', 'Ice Hockey Ice Hockey Sweden Swedish SHL', -1800, true, 0, '2016-12-14 08:42:12', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (120, 72, 'Swiss NLA', 'Swiss-NLA', 'Ice Hockey Ice Hockey Switzerland Swiss NLA', -1570, true, 0, '2016-12-14 08:42:12', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (123, 74, 'MotoGP World Championship', 'MotoGP-World-Championship', 'Motor Bikes Motor Bikes All Motor Bikes MotoGP World Championship', -30, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (124, 75, 'World Championship', 'World-Championship', 'Formula 1 Formula 1 World Championship', 150, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (125, 76, 'IPA Pool World Championships', 'IPA-Pool-World-Championships', 'Pool Pool IPA Pool World Championships', 0, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (126, 77, 'Super League', 'Super-League', 'Rugby League Rugby League Super League', 2, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (127, 77, 'Challenge Cup', 'Challenge-Cup', 'Rugby League Rugby League Challenge Cup', 4, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (128, 78, 'RBS 6 Nations 2017', 'RBS-6-Nations-2017', 'Rugby Union Rugby Union RBS 6 Nations 2017', -160, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (129, 78, 'ER Champions Cup', 'ER-Champions-Cup', 'Rugby Union Rugby Union ER Champions Cup', -150, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (130, 78, 'ER Challenge Cup', 'ER-Challenge-Cup', 'Rugby Union Rugby Union ER Challenge Cup', -145, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (131, 78, 'Aviva Premiership', 'Aviva-Premiership', 'Rugby Union Rugby Union Aviva Premiership', 1, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (132, 78, 'Guinness PRO12', 'Guinness-PRO12', 'Rugby Union Rugby Union Guinness PRO12', 2, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (133, 78, 'Top 14', 'Top-14', 'Rugby Union Rugby Union Top 14', 24, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (134, 78, 'Super 18', 'Super-18', 'Rugby Union Rugby Union Super 18', 25, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (135, 78, 'British and Irish Lions Tour', 'British-and-Irish-Lions-Tour', 'Rugby Union Rugby Union British and Irish Lions Tour', 100, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (137, 78, 'World Cup 2019', 'World-Cup-2019', 'Rugby Union Rugby Union World Cup 2019', 1001, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (139, 80, 'FIM Speedway Grand Prix', 'FIM-Speedway-Grand-Prix', 'Speedway Speedway FIM Speedway Grand Prix', -10, true, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (140, 81, 'Tennis New Year Specials', 'Tennis-New-Year-Specials', 'Tennis Tennis New Year Specials Tennis New Year Specials', -999, true, 0, '2016-12-14 08:42:14', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (145, 93, 'Host 2024', 'Host-2024', 'Olympics Specials All Specials Host 2024', 0, true, 0, '2016-12-14 08:42:14', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (146, 95, 'Various Christmas Specials', 'Various-Christmas-Specials', 'Christmas Specials Christmas Specials Various Christmas Specials', 0, true, 0, '2016-12-14 08:42:15', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (149, 104, 'Royal Specials', 'Royal-Specials', 'Royal Specials Royal Specials Royal Specials', -9999, true, 0, '2016-12-14 08:42:15', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (97, 56, 'French D1 Men''s', 'French-D1-Men-s', 'Handball Handball France French D1 Men''s', -1780, true, 0, '2016-12-14 08:42:10', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (98, 62, 'Swedish Elitserien Men''s', 'Swedish-Elitserien-Men-s', 'Handball Handball Sweden Swedish Elitserien Men''s', -1720, true, 0, '2016-12-14 08:42:10', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (111, 63, 'Vaal (RSA)', 'Vaal-RSA', 'Horse Racing Horse Racing - Live Vaal (RSA)', -700, true, 0, '2016-12-14 08:42:11', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (142, 83, 'Czech Extraliga Men''s', 'Czech-Extraliga-Men-s', 'Volleyball Volleyball Czech Republic Czech Extraliga Men''s', -1330, true, 0, '2016-12-14 08:42:14', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (144, 88, 'Italy Cup A1 Women''s', 'Italy-Cup-A1-Women-s', 'Volleyball Volleyball Italy Italy Cup A1 Women''s', -1540, true, 0, '2016-12-14 08:42:14', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (150, 105, 'Next James Bond', 'Next-James-Bond', 'Movies Movies All Movies Next James Bond', 0, true, 0, '2016-12-14 08:42:15', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (151, 106, 'The Voice UK', 'The-Voice-UK', 'TV Specials TV Specials UK The Voice UK', -90, true, 0, '2016-12-14 08:42:15', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (152, 106, 'Strictly Come Dancing', 'Strictly-Come-Dancing', 'TV Specials TV Specials UK Strictly Come Dancing', -80, true, 0, '2016-12-14 08:42:15', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (153, 107, 'Sports Personality of the Year', 'Sports-Personality-of-the-Year', 'TV Specials TV Specials Awards Sports Personality of the Year', 20, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (155, 116, '49s Lunchtime 6 Ball Draw', '49s-Lunchtime-6-Ball-Draw', 'Lotto Specials 49s 49s Lunchtime 6 Ball Draw', 10, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (156, 116, '49s Lunchtime Bonus Ball', '49s-Lunchtime-Bonus-Ball', 'Lotto Specials 49s 49s Lunchtime Bonus Ball', 20, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (157, 116, '49s Teatime 6 Ball Draw', '49s-Teatime-6-Ball-Draw', 'Lotto Specials 49s 49s Teatime 6 Ball Draw', 30, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (158, 116, '49s Teatime Bonus Ball', '49s-Teatime-Bonus-Ball', 'Lotto Specials 49s 49s Teatime Bonus Ball', 40, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (159, 117, 'Irish Lotto Main 6 Ball Draw', 'Irish-Lotto-Main-6-Ball-Draw', 'Lotto Specials Irish Lotto Irish Lotto Main 6 Ball Draw', 50, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (160, 117, 'Irish Lotto Main Draw Bonus Ball', 'Irish-Lotto-Main-Draw-Bonus-Ball', 'Lotto Specials Irish Lotto Irish Lotto Main Draw Bonus Ball', 100, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (161, 118, 'Premier League Specials', 'Premier-League-Specials', 'Football Football Specials Premier League Specials', -9777, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (163, 118, 'Transfer Specials', 'Transfer-Specials', 'Football Football Specials Transfer Specials', -9719, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (164, 118, 'Manager Specials', 'Manager-Specials', 'Football Football Specials Manager Specials', 5, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (165, 118, 'World Cup Specials', 'World-Cup-Specials', 'Football Football Specials World Cup Specials', 40, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (166, 118, 'Team Specials', 'Team-Specials', 'Football Football Specials Team Specials', 50, true, 0, '2016-12-14 08:42:16', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (138, 79, 'The Masters', 'The-Masters', 'Snooker Snooker The Masters', -25, false, 0, '2016-12-14 08:42:13', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (30, 18, 'PDC World Championship', 'PDC-World-Championship', 'Darts Darts PDC World Championship', 8500, false, 0, '2016-12-14 08:40:39', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (31, 18, 'BDO World Championship', 'BDO-World-Championship', 'Darts Darts BDO World Championship', 9000, false, 0, '2016-12-14 08:40:39', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (82, 49, 'Tata Open', 'Tata-Open', 'Golf Golf Tata Open', -5, false, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (83, 49, 'USPGA Championship', 'USPGA-Championship', 'Golf Golf USPGA Championship', 0, false, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (84, 49, 'US Masters', 'US-Masters', 'Golf Golf US Masters', 10, false, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (85, 49, 'US Open', 'US-Open', 'Golf Golf US Open', 15, false, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (86, 49, 'The Open Championship', 'The-Open-Championship', 'Golf Golf The Open Championship', 20, false, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (87, 49, 'Ryder Cup', 'Ryder-Cup', 'Golf Golf Ryder Cup', 50, false, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (88, 49, 'Golf Major Specials', 'Golf-Major-Specials', 'Golf Golf Golf Major Specials', 86, false, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (89, 49, 'PGA Money List', 'PGA-Money-List', 'Golf Golf PGA Money List', 998, false, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (90, 49, 'Race To Dubai', 'Race-To-Dubai', 'Golf Golf Race To Dubai', 999, false, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (91, 49, 'Player Specials', 'Player-Specials', 'Golf Golf Player Specials', 1001, false, 0, '2016-12-14 08:42:09', '2017-05-29 19:09:16', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (41, 27, 'Championship', 'Championship', 'Football Football England Championship', -9900, false, 0, '2016-12-14 08:41:07', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (42, 27, 'League One', 'League-One', 'Football Football England League One', -9760, false, 0, '2016-12-14 08:41:07', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (43, 27, 'League Two', 'League-Two', 'Football Football England League Two', -9759, false, 0, '2016-12-14 08:41:07', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (44, 27, 'FA Cup', 'FA-Cup', 'Football Football England FA Cup', -9758, false, 0, '2016-12-14 08:41:07', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (45, 27, 'Checkatrade Trophy', 'Checkatrade-Trophy', 'Football Football England Checkatrade Trophy', -9720, false, 0, '2016-12-14 08:41:07', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (46, 27, 'National League', 'National-League', 'Football Football England National League', -9710, false, 0, '2016-12-14 08:41:07', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (69, 43, 'Scottish Premiership', 'Scottish-Premiership', 'Football Football Scotland Scottish Premiership', -7770, false, 0, '2016-12-14 08:41:51', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (70, 43, 'Scottish Championship', 'Scottish-Championship', 'Football Football Scotland Scottish Championship', -7760, false, 0, '2016-12-14 08:41:51', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (71, 43, 'Scottish League One', 'Scottish-League-One', 'Football Football Scotland Scottish League One', -7750, false, 0, '2016-12-14 08:41:51', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (72, 43, 'Scottish League Two', 'Scottish-League-Two', 'Football Football Scotland Scottish League Two', -7730, false, 0, '2016-12-14 08:41:51', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (73, 43, 'Scottish FA Cup', 'Scottish-FA-Cup', 'Football Football Scotland Scottish FA Cup', -7720, false, 0, '2016-12-14 08:41:51', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (77, 46, 'Spanish La Liga', 'Spanish-La-Liga', 'Football Football Spain Spanish La Liga', -3599, false, 0, '2016-12-14 08:42:06', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (78, 46, 'Spanish Copa del Rey', 'Spanish-Copa-del-Rey', 'Football Football Spain Spanish Copa del Rey', -3598, false, 0, '2016-12-14 08:42:06', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (79, 46, 'Spanish Segunda Division', 'Spanish-Segunda-Division', 'Football Football Spain Spanish Segunda Division', -3595, false, 0, '2016-12-14 08:42:06', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (162, 118, 'Champions League Specials', 'Champions-League-Specials', 'Football Football Specials Champions League Specials', -9769, false, 0, '2016-12-14 08:42:16', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (75, 45, 'UEFA Champions League', 'UEFA-Champions-League', 'Football Football UEFA Club Competitions UEFA Champions League', -9995, false, 0, '2016-12-14 08:41:57', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (76, 45, 'UEFA Europa League', 'UEFA-Europa-League', 'Football Football UEFA Club Competitions UEFA Europa League', -9994, false, 0, '2016-12-14 08:41:57', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (112, 64, 'Racing Specials', 'Racing-Specials', 'Horse Racing Horse Racing - Specials Racing Specials', -9990, false, 0, '2016-12-14 08:42:11', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (147, 103, 'UK Politics', 'UK-Politics', 'Politics Politics UK UK Politics', -9999, false, 0, '2016-12-14 08:42:15', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (2, 1, 'French Open Men''s Singles', 'French-Open-Men-s-Singles', 'Tennis Tennis French Open - Men''s Singles', -6001, false, 0, '2016-12-14 08:40:32', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (3, 1, 'French Open Women''s Singles', 'French-Open-Women-s-Singles', 'Tennis Tennis French Open - Women''s Singles', -6000, false, 0, '2016-12-14 08:40:32', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (4, 1, 'US Open Men''s Singles', 'US-Open-Men-s-Singles', 'Tennis Tennis US Open - Men''s Singles', -5000, false, 0, '2016-12-14 08:40:32', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (5, 1, 'US Open Women''s Singles', 'US-Open-Women-s-Singles', 'Tennis Tennis US Open - Women''s Singles', -4999, false, 0, '2016-12-14 08:40:32', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (6, 1, 'Wimbledon Men''s Singles', 'Wimbledon-Men-s-Singles', 'Tennis Tennis Wimbledon - Men''s Singles', -4999, false, 0, '2016-12-14 08:40:32', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (7, 1, 'Wimbledon Ladies'' Singles', 'Wimbledon-Ladies-Singles', 'Tennis Tennis Wimbledon - Ladies'' Singles', -4998, false, 0, '2016-12-14 08:40:32', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (148, 103, 'General Election', 'General-Election', 'Politics Politics UK General Election', -9999, false, 0, '2016-12-14 08:42:15', '2017-05-30 17:33:43', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (8, 1, 'Australian Open Men''s Singles', 'Australian-Open-Men-s-Singles', 'Tennis Tennis Australian Open Men''s Singles', -4500, false, 0, '2016-12-14 08:40:32', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (94, 51, 'Notts (Dogs)', 'Notts-Dogs', 'Greyhound Racing Greyhounds - Live Notts (Dogs)', -379, true, 0, '2016-12-14 08:42:09', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (143, 87, 'Champions League Women''s', 'Champions-League-Women-s', 'Volleyball Volleyball International Champions League Women''s', -1970, true, 0, '2016-12-14 08:42:14', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (9, 1, 'Australian Open Women''s Singles', 'Australian-Open-Women-s-Singles', 'Tennis Tennis Australian Open Women''s Singles', -4400, false, 0, '2016-12-14 08:40:32', '2017-06-24 07:33:30', NULL);
INSERT INTO category3 (id, category2_id, name, canonicalised_name, matchable_name, display_order, filtered, event_count, created_at, updated_at, display_name) VALUES (167, 79, 'World Championship', 'World-Championship', 'Snooker Snooker World Championship', 0, false, 0, '2017-08-31 21:23:34', '2017-08-31 21:23:34', NULL);


--
-- Name: category3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category3_id_seq', 167, true);


--
-- Data for Name: classification__category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO classification__category (id, parent_id, context, media_id, name, enabled, slug, description, "position", created_at, updated_at) VALUES (1, NULL, 'landscape_large', NULL, 'landscape_large', true, 'landscape_large', 'landscape_large', NULL, '2016-12-22 15:06:12', '2016-12-22 15:06:12');


--
-- Name: classification__category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('classification__category_id_seq', 1, true);


--
-- Data for Name: classification__collection; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: classification__collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('classification__collection_id_seq', 1, false);


--
-- Data for Name: classification__context; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO classification__context (id, name, enabled, created_at, updated_at) VALUES ('landscape_large', 'landscape_large', true, '2016-12-22 15:06:12', '2016-12-22 15:06:12');


--
-- Data for Name: classification__tag; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: classification__tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('classification__tag_id_seq', 1, false);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO countries (id, code, name, iso3, rank) VALUES (1, 'GB', 'United Kingdom', 'GBR', 1);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_id_seq', 1, true);


--
-- Data for Name: entrants; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: entrants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entrants_id_seq', 1, false);


--
-- Data for Name: eventarticles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_id_seq', 1, false);


--
-- Data for Name: featuredevent; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: featuredevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('featuredevent_id_seq', 1, false);


--
-- Data for Name: featuredoffer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: featuredoffer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('featuredoffer_id_seq', 1, false);


--
-- Data for Name: feeds; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO feeds (id, bookie_id, name, last_completion, last_run, type) VALUES (1, 1, 'CORAL', NULL, NULL, 'BOOKIE');
INSERT INTO feeds (id, bookie_id, name, last_completion, last_run, type) VALUES (2, 2, 'SKY', NULL, NULL, 'BOOKIE');
INSERT INTO feeds (id, bookie_id, name, last_completion, last_run, type) VALUES (3, 3, 'BOYLESPORTS', NULL, NULL, 'BOOKIE');
INSERT INTO feeds (id, bookie_id, name, last_completion, last_run, type) VALUES (4, NULL, 'XMLSOCCER', NULL, NULL, 'STATS');


--
-- Name: feeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('feeds_id_seq', 4, true);


--
-- Data for Name: fixtures; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: fixtures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fixtures_id_seq', 1, false);


--
-- Data for Name: footballstatsfixtures; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: footballstatsparticipants; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: historybookieoutcomes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: historybookieoutcomes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('historybookieoutcomes_id_seq', 1, false);


--
-- Data for Name: marketmarketroles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: marketroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO marketroles (id, category1_id, name) VALUES (1, 3, 'MAIN');
INSERT INTO marketroles (id, category1_id, name) VALUES (2, 3, 'UPDATE_OFTEN');
INSERT INTO marketroles (id, category1_id, name) VALUES (3, 4, 'MAIN');
INSERT INTO marketroles (id, category1_id, name) VALUES (4, 4, 'UPDATE_OFTEN');
INSERT INTO marketroles (id, category1_id, name) VALUES (5, 5, 'MAIN');
INSERT INTO marketroles (id, category1_id, name) VALUES (6, 5, 'UPDATE_OFTEN');
INSERT INTO marketroles (id, category1_id, name) VALUES (7, 7, 'MAIN');
INSERT INTO marketroles (id, category1_id, name) VALUES (8, 7, 'UPDATE_OFTEN');
INSERT INTO marketroles (id, category1_id, name) VALUES (9, 14, 'MAIN');
INSERT INTO marketroles (id, category1_id, name) VALUES (10, 14, 'UPDATE_OFTEN');
INSERT INTO marketroles (id, category1_id, name) VALUES (11, 26, 'MAIN');
INSERT INTO marketroles (id, category1_id, name) VALUES (12, 26, 'UPDATE_OFTEN');
INSERT INTO marketroles (id, category1_id, name) VALUES (13, 2, 'MAIN');
INSERT INTO marketroles (id, category1_id, name) VALUES (14, 2, 'UPDATE_OFTEN');
INSERT INTO marketroles (id, category1_id, name) VALUES (15, 23, 'UPDATE_OFTEN');
INSERT INTO marketroles (id, category1_id, name) VALUES (16, 3, 'DERIVATIVE');
INSERT INTO marketroles (id, category1_id, name) VALUES (17, 3, 'HAS_PLAYER');
INSERT INTO marketroles (id, category1_id, name) VALUES (18, 3, 'HAS_TEAM');
INSERT INTO marketroles (id, category1_id, name) VALUES (22, 3, 'HOMEDRAWAWAY');
INSERT INTO marketroles (id, category1_id, name) VALUES (29, 28, 'MAIN');
INSERT INTO marketroles (id, category1_id, name) VALUES (30, 28, 'UPDATE_OFTEN');


--
-- Name: marketroles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('marketroles_id_seq', 48, true);


--
-- Data for Name: markets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: markets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('markets_id_seq', 1, false);


--
-- Data for Name: media__gallery; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: media__gallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('media__gallery_id_seq', 1, false);


--
-- Data for Name: media__gallery_media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: media__gallery_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('media__gallery_media_id_seq', 1, false);


--
-- Data for Name: media__media; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (1, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-22 15:06:12', '2016-12-22 15:06:12');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (2, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-03 12:25:52', '2017-01-03 12:25:52');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (3, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-14 13:27:55', '2017-01-14 13:27:55');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (4, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-21 14:31:35', '2017-01-21 14:31:35');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (5, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-22 10:57:49', '2017-01-22 10:57:49');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (6, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-22 11:38:47', '2017-01-22 11:38:47');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (7, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-22 19:10:58', '2017-01-22 19:10:58');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (8, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-23 12:44:49', '2017-01-23 12:44:49');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (9, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-27 23:02:02', '2017-01-27 23:02:02');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (10, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-28 11:25:17', '2017-01-28 11:25:17');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (11, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-28 11:30:20', '2017-01-28 11:30:20');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (12, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-28 12:13:25', '2017-01-28 12:13:25');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (13, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-28 12:24:49', '2017-01-28 12:24:49');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (14, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-28 12:35:51', '2017-01-28 12:35:51');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (15, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-28 14:03:48', '2017-01-28 14:03:48');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (16, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-28 14:09:07', '2017-01-28 14:09:07');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (17, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-28 14:23:50', '2017-01-28 14:23:50');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (18, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-28 14:26:57', '2017-01-28 14:26:57');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (19, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-28 20:35:19', '2017-01-28 20:35:19');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (20, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-29 09:53:22', '2017-01-29 09:53:22');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (21, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-29 21:19:35', '2017-01-29 21:19:35');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (22, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-29 21:30:43', '2017-01-29 21:30:43');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (23, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-30 12:39:55', '2017-01-30 12:39:55');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (24, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-30 15:58:14', '2017-01-30 15:58:14');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (25, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-30 22:58:35', '2017-01-30 22:58:35');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (26, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-01-31 09:00:13', '2017-01-31 09:00:13');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (27, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-02-01 17:03:08', '2017-02-01 17:03:08');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (28, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-02-01 17:23:11', '2017-02-01 17:23:11');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (29, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-02-01 17:32:09', '2017-02-01 17:32:09');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (30, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-02-01 17:40:52', '2017-02-01 17:40:52');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (31, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-02-02 09:29:37', '2017-02-02 09:29:37');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (32, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-02-02 10:32:34', '2017-02-02 10:32:34');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (33, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-02-07 21:59:35', '2017-02-07 21:59:35');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (34, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-03-20 15:15:38', '2017-03-20 15:15:38');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (35, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-03-23 09:59:13', '2017-03-23 09:59:13');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (36, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-03-25 13:08:26', '2017-03-25 13:08:26');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (37, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-04-13 09:35:59', '2017-04-13 09:35:59');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (38, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-04-13 09:46:39', '2017-04-13 09:46:39');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (39, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-04-17 10:34:26', '2017-04-17 10:34:26');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (40, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-05-08 09:45:40', '2017-05-08 09:45:40');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (41, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-05-08 17:11:12', '2017-05-08 17:11:12');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (42, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-05-15 17:49:55', '2017-05-15 17:49:55');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (43, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-05-18 22:06:48', '2017-05-18 22:06:48');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (44, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-05-19 10:31:25', '2017-05-19 10:31:25');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (45, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-05-19 22:20:38', '2017-05-19 22:20:38');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (46, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-05-20 15:31:06', '2017-05-20 15:31:06');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (47, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-05-20 17:27:33', '2017-05-20 17:27:33');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (48, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-05-29 19:09:14', '2017-05-29 19:09:14');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (49, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-05-29 19:14:05', '2017-05-29 19:14:05');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (50, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-05-30 17:33:40', '2017-05-30 17:33:40');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (51, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-06-24 07:33:29', '2017-06-24 07:33:29');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (52, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-06-27 18:12:39', '2017-06-27 18:12:39');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (53, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-07-25 11:50:37', '2017-07-25 11:50:37');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (54, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-08-11 19:47:51', '2017-08-11 19:47:51');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (55, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-08-14 17:18:34', '2017-08-14 17:18:34');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (56, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-08-19 16:23:23', '2017-08-19 16:23:23');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (57, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-08-21 20:37:04', '2017-08-21 20:37:04');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (58, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-08-24 11:53:40', '2017-08-24 11:53:40');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (59, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-08-25 08:48:59', '2017-08-25 08:48:59');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (60, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-08-25 09:18:14', '2017-08-25 09:18:14');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (61, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-08-31 21:23:33', '2017-08-31 21:23:33');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (62, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-09-07 10:04:22', '2017-09-07 10:04:22');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (63, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-09-07 10:31:21', '2017-09-07 10:31:21');
INSERT INTO media__media (id, category_id, name, description, enabled, provider_name, provider_status, provider_reference, provider_metadata, width, height, length, content_type, content_size, copyright, author_name, context, cdn_is_flushable, cdn_flush_identifier, cdn_flush_at, cdn_status, updated_at, created_at) VALUES (64, 1, 'PICTURE_1', 'PICTURE_1', true, 'sonata.media.provider.image', 1, 'dd2cefb85c77c02e89a504d3e3b0523093c6925b.jpeg', '{"filename":"liverpoolManCity.jpeg"}', 1920, 1080, NULL, 'image/jpeg', 1993870, NULL, NULL, 'landscape_large', NULL, NULL, NULL, NULL, '2017-11-08 19:58:25', '2017-11-08 19:58:25');


--
-- Name: media__media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('media__media_id_seq', 64, true);


--
-- Data for Name: mediaimport; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: mediaimport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mediaimport_id_seq', 1, false);


--
-- Data for Name: metabookieevent; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: metabookieevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metabookieevent_id_seq', 1, false);


--
-- Data for Name: metabookiemarket; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: metabookiemarket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metabookiemarket_id_seq', 1, false);


--
-- Data for Name: metabookieoutcome; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: metabookieoutcome_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metabookieoutcome_id_seq', 1, false);


--
-- Data for Name: metacategory1; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (1, 1, 1, '48', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (2, 2, 1, '21', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (3, 3, 1, '16', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (4, 4, 1, '34', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (5, 5, 1, '18', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (6, 6, 1, '31', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (7, 7, 1, '13', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (8, 8, 1, '10', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (9, 9, 1, '148', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (10, 10, 1, '1', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (11, 11, 1, '51', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (12, 12, 1, '5', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (13, 13, 1, '6', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (14, 14, 1, '9', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (15, 15, 1, '12', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (16, 16, 1, '24', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (17, 17, 1, '19', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (18, 18, 1, '20', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (19, 19, 1, '22', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (20, 20, 1, '141', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (21, 21, 1, '23', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (22, 22, 1, '79', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (23, 23, 1, '46', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (24, 24, 1, '28', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (25, 25, 1, '30', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (26, 26, 1, '32', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (27, 27, 1, '25', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (28, 28, 1, '35', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (29, 29, 1, '36', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (30, 30, 1, '39', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (31, 31, 1, '68', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (32, 32, 1, '42', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);
INSERT INTO metacategory1 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (33, 33, 1, '95', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories', NULL);


--
-- Name: metacategory1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metacategory1_id_seq', 33, true);


--
-- Data for Name: metacategory2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (1, 1, 1, '266', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (2, 2, 1, '2', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (3, 3, 1, '12', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (4, 4, 1, '13', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (5, 5, 1, '15', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (6, 6, 1, '17', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (7, 7, 1, '19', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (8, 8, 1, '25', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (9, 9, 1, '26', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (10, 10, 1, '32', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (11, 11, 1, '40', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (12, 12, 1, '41', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (13, 13, 1, '46', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (14, 14, 1, '51', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (15, 15, 1, '56', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (16, 16, 1, '58', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (17, 17, 1, '61', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (18, 18, 1, '63', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (19, 19, 1, '71', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (20, 20, 1, '73', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (21, 21, 1, '74', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (22, 22, 1, '78', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (23, 23, 1, '81', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (24, 24, 1, '82', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (25, 25, 1, '87', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (26, 26, 1, '89', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (27, 27, 1, '97', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (28, 28, 1, '102', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (29, 29, 1, '105', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (30, 30, 1, '106', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (31, 31, 1, '109', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (32, 32, 1, '112', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (33, 33, 1, '113', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (34, 34, 1, '115', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (35, 35, 1, '120', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (36, 36, 1, '139', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (37, 37, 1, '140', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (38, 38, 1, '142', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (39, 39, 1, '143', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (40, 40, 1, '151', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (41, 41, 1, '152', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (42, 42, 1, '154', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (43, 43, 1, '158', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (44, 44, 1, '159', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (45, 45, 1, '165', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (46, 46, 1, '166', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (47, 47, 1, '173', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (48, 48, 1, '175', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (49, 49, 1, '195', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (50, 50, 1, '196', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (51, 51, 1, '198', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (52, 52, 1, '201', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (53, 53, 1, '202', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (54, 54, 1, '205', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (55, 55, 1, '206', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (56, 56, 1, '207', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (57, 57, 1, '208', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (58, 58, 1, '210', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (59, 59, 1, '211', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (60, 60, 1, '212', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (61, 61, 1, '218', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (62, 62, 1, '219', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (63, 63, 1, '223', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (64, 64, 1, '226', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (65, 65, 1, '227', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (66, 66, 1, '230', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (67, 67, 1, '233', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (68, 68, 1, '235', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (69, 69, 1, '236', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (70, 70, 1, '241', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (71, 71, 1, '243', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (72, 72, 1, '244', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (73, 73, 1, '245', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (74, 74, 1, '246', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (75, 75, 1, '247', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (76, 76, 1, '254', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (77, 77, 1, '256', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (78, 78, 1, '259', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (79, 79, 1, '261', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (80, 80, 1, '265', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (81, 81, 1, '267', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (82, 82, 1, '268', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (83, 83, 1, '270', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (84, 84, 1, '272', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (85, 85, 1, '274', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (86, 86, 1, '275', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (87, 87, 1, '276', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (88, 88, 1, '277', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (89, 89, 1, '279', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (90, 90, 1, '280', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (91, 91, 1, '311', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (92, 92, 1, '321', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (93, 93, 1, '475', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (94, 94, 1, '489', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (95, 95, 1, '520', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (96, 96, 1, '556', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (97, 97, 1, '557', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (98, 98, 1, '581', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (99, 99, 1, '659', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (100, 100, 1, '661', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (101, 101, 1, '738', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (102, 102, 1, '504', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (103, 103, 1, '301', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (104, 104, 1, '263', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (105, 105, 1, '294', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (106, 106, 1, '305', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (107, 107, 1, '307', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (108, 108, 1, '285', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (109, 109, 1, '286', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (110, 110, 1, '287', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (111, 111, 1, '291', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (112, 112, 1, '288', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (113, 113, 1, '289', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (114, 114, 1, '290', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (115, 115, 1, '517', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (116, 116, 1, '594', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (117, 117, 1, '593', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (118, 118, 1, '67', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (119, 119, 1, '602', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);
INSERT INTO metacategory2 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (120, 120, 1, '605', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses', NULL);


--
-- Name: metacategory2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metacategory2_id_seq', 120, true);


--
-- Data for Name: metacategory3; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (1, 1, 1, '1682', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00', '2016-11-20 20:35:07');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (2, 2, 1, '1624', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00', '2016-06-02 13:36:12');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (3, 3, 1, '1622', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00', '2016-06-02 13:36:32');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (4, 4, 1, '1691', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00', '2016-08-31 22:37:11');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (5, 5, 1, '1689', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00', '2016-08-31 22:37:47');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (6, 6, 1, '1704', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00', '2016-08-29 10:38:09');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (7, 7, 1, '1702', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00', '2016-08-29 10:38:25');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (8, 8, 1, '24853', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00', '2016-08-04 21:49:16');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (9, 9, 1, '24854', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00', '2016-08-04 21:50:24');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (10, 10, 1, '1611', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (11, 11, 1, '4', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=2&dateFrom=2016-12-15 00:00:00', '2016-09-06 16:31:37');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (12, 12, 1, '33', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=12&dateFrom=2016-12-15 00:00:00', '2016-06-01 14:41:26');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (13, 13, 1, '35', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=13&dateFrom=2016-12-15 00:00:00', '2016-03-04 16:16:56');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (14, 14, 1, '4644', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=15&dateFrom=2016-12-15 00:00:00', '2016-04-15 13:06:06');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (15, 15, 1, '63', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=25&dateFrom=2016-12-15 00:00:00', '2016-08-16 15:25:40');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (16, 16, 1, '136', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=51&dateFrom=2016-12-15 00:00:00', '2016-05-17 08:46:39');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (17, 17, 1, '137', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=51&dateFrom=2016-12-15 00:00:00', '2016-03-14 08:44:24');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (18, 18, 1, '147', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=56&dateFrom=2016-12-15 00:00:00', '2016-09-20 17:42:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (19, 19, 1, '28428', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00', '2015-10-19 14:52:17');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (20, 20, 1, '2346', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00', '2016-10-24 08:49:09');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (21, 21, 1, '159', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00', '2016-09-25 11:22:12');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (22, 22, 1, '5542', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00', '2016-09-25 11:22:18');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (23, 23, 1, '3208', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00', '2014-07-24 07:09:19');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (24, 24, 1, '2526', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00', '2016-01-13 13:04:04');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (25, 25, 1, '26431', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00', '2015-10-19 16:43:25');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (26, 26, 1, '29134', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00', '2016-01-21 10:28:38');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (27, 27, 1, '2522', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00', '2014-07-24 07:09:19');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (28, 28, 1, '156', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00', '2014-07-24 07:09:19');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (29, 29, 1, '179', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=61&dateFrom=2016-12-15 00:00:00', '2014-07-24 07:09:19');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (30, 30, 1, '188', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=63&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (31, 31, 1, '183', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=63&dateFrom=2016-12-15 00:00:00', '2016-09-07 11:38:20');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (32, 32, 1, '219', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=71&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:43:50');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (33, 33, 1, '230', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=73&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (34, 34, 1, '275', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=74&dateFrom=2016-12-15 00:00:00', '2015-07-28 12:02:39');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (35, 35, 1, '299', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=78&dateFrom=2016-12-15 00:00:00', '2016-09-13 09:44:17');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (36, 36, 1, '31288', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=78&dateFrom=2016-12-15 00:00:00', '2016-07-30 21:09:13');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (37, 37, 1, '2295', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=87&dateFrom=2016-12-15 00:00:00', '2014-10-29 05:58:18');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (38, 38, 1, '382', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=89&dateFrom=2016-12-15 00:00:00', '2014-10-29 05:58:12');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (39, 39, 1, '442', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00', '2016-11-09 10:14:48');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (40, 40, 1, '434', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00', '2016-10-17 16:31:30');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (41, 41, 1, '435', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:32:50');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (42, 42, 1, '440', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:37:32');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (43, 43, 1, '441', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:37:38');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (44, 44, 1, '438', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00', '2016-11-21 10:05:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (45, 45, 1, '439', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:28:58');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (46, 46, 1, '437', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:37:44');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (47, 47, 1, '472', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:41:15');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (48, 48, 1, '471', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:41:21');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (49, 49, 1, '473', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (50, 50, 1, '500', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:38:20');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (51, 51, 1, '498', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:38:24');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (52, 52, 1, '499', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (53, 53, 1, '25848', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=115&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:04');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (54, 54, 1, '2342', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=115&dateFrom=2016-12-15 00:00:00', '2016-10-06 20:20:38');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (55, 55, 1, '734', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:38:47');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (56, 56, 1, '733', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:38:51');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (57, 57, 1, '735', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (58, 58, 1, '823', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:42:03');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (59, 59, 1, '821', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:42:11');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (60, 60, 1, '825', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (61, 61, 1, '839', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=142&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (62, 62, 1, '25218', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=143&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:03');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (63, 63, 1, '868', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=151&dateFrom=2016-12-15 00:00:00', '2014-10-29 05:58:16');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (64, 64, 1, '880', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15 00:00:00', '2016-09-22 11:37:34');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (65, 65, 1, '882', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (66, 66, 1, '884', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (67, 67, 1, '896', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=154&dateFrom=2016-12-15 00:00:00', '2014-10-29 05:58:16');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (68, 68, 1, '893', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=154&dateFrom=2016-12-15 00:00:00', '2014-10-29 05:58:16');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (69, 69, 1, '929', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:40:34');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (70, 70, 1, '927', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:40:47');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (71, 71, 1, '931', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:40:39');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (72, 72, 1, '932', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:40:43');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (73, 73, 1, '930', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (74, 74, 1, '936', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=159&dateFrom=2016-12-15 00:00:00', '2014-10-29 05:58:17');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (75, 75, 1, '25230', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=165&dateFrom=2016-12-15 00:00:00', '2016-11-02 13:07:59');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (76, 76, 1, '25231', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=165&dateFrom=2016-12-15 00:00:00', '2016-11-02 13:18:21');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (77, 77, 1, '971', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:39:17');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (78, 78, 1, '967', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15 00:00:00', '2016-10-04 15:39:29');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (79, 79, 1, '974', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (80, 80, 1, '1018', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=175&dateFrom=2016-12-15 00:00:00', '2014-10-29 05:58:18');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (81, 81, 1, '1021', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=175&dateFrom=2016-12-15 00:00:00', '2014-10-29 05:58:18');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (82, 82, 1, '32722', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00', '2016-12-12 14:38:29');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (83, 83, 1, '25983', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00', '2016-10-18 13:04:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (84, 84, 1, '1245', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00', '2016-11-22 14:40:30');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (85, 85, 1, '1247', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00', '2016-11-22 14:40:45');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (86, 86, 1, '13303', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00', '2016-11-22 14:41:10');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (87, 87, 1, '1200', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00', '2016-10-13 11:46:48');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (88, 88, 1, '29356', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00', '2016-04-12 14:28:31');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (89, 89, 1, '1185', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00', '2015-01-14 20:49:19');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (90, 90, 1, '29005', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00', '2016-12-06 17:09:04');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (91, 91, 1, '1187', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (92, 92, 1, '1267', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=196&dateFrom=2016-12-15 00:00:00', '2016-03-30 12:46:03');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (93, 93, 1, '1864', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15 00:00:00', '2016-12-03 12:19:52');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (94, 94, 1, '26746', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15 00:00:00', '2016-09-02 17:55:35');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (95, 95, 1, '4236', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:02');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (96, 96, 1, '31482', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=201&dateFrom=2016-12-15 00:00:00', '2016-09-07 16:54:27');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (97, 97, 1, '1284', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=207&dateFrom=2016-12-15 00:00:00', '2015-11-23 17:38:04');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (98, 98, 1, '1325', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=219&dateFrom=2016-12-15 00:00:00', '2016-03-14 08:48:58');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (99, 99, 1, '1966', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2016-06-07 22:02:01');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (100, 100, 1, '4227', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2016-10-11 15:30:51');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (101, 101, 1, '1892', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2016-04-15 09:48:25');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (102, 102, 1, '1894', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:01');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (103, 103, 1, '1908', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2016-07-19 07:34:50');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (104, 104, 1, '1909', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:01');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (105, 105, 1, '6753', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:02');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (106, 106, 1, '1941', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:01');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (107, 107, 1, '1945', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2016-11-28 18:20:07');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (108, 108, 1, '1955', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2016-07-19 07:34:50');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (109, 109, 1, '2035', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:01');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (110, 110, 1, '2480', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2016-11-24 17:51:13');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (111, 111, 1, '5361', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00', '2016-11-23 19:59:55');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (112, 112, 1, '2509', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=226&dateFrom=2016-12-15 00:00:00', '2016-11-11 14:04:18');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (113, 113, 1, '1333', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=230&dateFrom=2016-12-15 00:00:00', '2016-03-14 08:53:45');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (114, 114, 1, '1351', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=233&dateFrom=2016-12-15 00:00:00', '2016-03-28 15:59:05');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (115, 115, 1, '1355', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=235&dateFrom=2016-12-15 00:00:00', '2016-03-14 10:27:37');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (116, 116, 1, '26668', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=236&dateFrom=2016-12-15 00:00:00', '2016-03-28 15:59:47');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (117, 117, 1, '1372', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=241&dateFrom=2016-12-15 00:00:00', '2016-03-14 10:27:48');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (118, 118, 1, '26575', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=241&dateFrom=2016-12-15 00:00:00', '2016-03-28 15:54:32');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (119, 119, 1, '1385', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=243&dateFrom=2016-12-15 00:00:00', '2016-03-14 10:28:19');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (120, 120, 1, '1388', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=244&dateFrom=2016-12-15 00:00:00', '2016-03-30 11:08:13');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (121, 121, 1, '1392', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=245&dateFrom=2016-12-15 00:00:00', '2015-05-21 09:36:35');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (122, 122, 1, '1390', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=245&dateFrom=2016-12-15 00:00:00', '2016-03-30 11:08:33');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (123, 123, 1, '1430', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=246&dateFrom=2016-12-15 00:00:00', '2014-07-24 07:09:21');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (124, 124, 1, '1464', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=247&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (125, 125, 1, '29196', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=254&dateFrom=2016-12-15 00:00:00', '2016-03-30 12:26:13');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (126, 126, 1, '1485', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=256&dateFrom=2016-12-15 00:00:00', '2016-10-04 10:28:28');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (127, 127, 1, '1478', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=256&dateFrom=2016-12-15 00:00:00', '2016-03-30 12:15:01');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (128, 128, 1, '27225', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00', '2016-03-31 14:27:53');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (129, 129, 1, '25439', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00', '2015-12-17 09:34:51');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (130, 130, 1, '26362', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00', '2016-05-12 16:21:06');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (131, 131, 1, '1493', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00', '2016-04-19 15:59:46');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (132, 132, 1, '1510', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00', '2014-07-24 07:09:21');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (133, 133, 1, '1514', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00', '2014-08-19 15:49:59');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (134, 134, 1, '1513', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00', '2015-12-03 11:34:33');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (135, 135, 1, '2703', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00', '2016-03-30 14:11:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (136, 136, 1, '21006', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00', '2016-03-30 14:11:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (137, 137, 1, '28866', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00', '2016-03-30 14:11:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (138, 138, 1, '25488', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=261&dateFrom=2016-12-15 00:00:00', '2016-07-08 13:47:44');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (139, 139, 1, '1558', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=265&dateFrom=2016-12-15 00:00:00', '2016-03-30 12:09:05');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (140, 140, 1, '1713', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=267&dateFrom=2016-12-15 00:00:00', '2016-09-05 08:46:03');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (141, 141, 1, '2636', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=268&dateFrom=2016-12-15 00:00:00', '2016-11-13 08:41:09');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (142, 142, 1, '1717', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=270&dateFrom=2016-12-15 00:00:00', '2015-11-24 17:16:03');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (143, 143, 1, '1743', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=276&dateFrom=2016-12-15 00:00:00', '2016-02-09 12:14:50');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (144, 144, 1, '2240', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=277&dateFrom=2016-12-15 00:00:00', '2016-03-14 08:54:39');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (145, 145, 1, '2251', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=475&dateFrom=2016-12-15 00:00:00', '2016-03-30 12:28:57');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (146, 146, 1, '17598', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=520&dateFrom=2016-12-15 00:00:00', '2016-03-30 11:42:28');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (147, 147, 1, '1828', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=301&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (148, 148, 1, '28624', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=301&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:06');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (149, 149, 1, '2730', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=263&dateFrom=2016-12-15 00:00:00', '2016-03-30 11:39:33');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (150, 150, 1, '29225', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=294&dateFrom=2016-12-15 00:00:00', '2016-03-30 11:42:04');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (151, 151, 1, '2935', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=305&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:02');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (152, 152, 1, '1844', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=305&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (153, 153, 1, '1851', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=307&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:00');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (154, 154, 1, '14471', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=517&dateFrom=2016-12-15 00:00:00', '2016-12-03 15:00:15');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (155, 155, 1, '26353', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00', '2016-09-11 11:26:55');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (156, 156, 1, '26354', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00', '2016-09-11 11:28:15');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (157, 157, 1, '26355', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00', '2016-09-11 11:29:32');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (158, 158, 1, '26356', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00', '2016-09-11 11:30:54');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (159, 159, 1, '26312', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=593&dateFrom=2016-12-15 00:00:00', '2016-10-20 10:24:52');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (160, 160, 1, '26313', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=593&dateFrom=2016-12-15 00:00:00', '2016-10-20 10:25:24');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (161, 161, 1, '26698', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:04');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (162, 162, 1, '18395', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:02');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (163, 163, 1, '8132', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00', '2016-02-01 11:34:57');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (164, 164, 1, '6963', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:02');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (165, 165, 1, '19822', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:02');
INSERT INTO metacategory3 (id, domain_id, feed_id, feed_element_id, feed_request_url, feed_last_updated) VALUES (166, 166, 1, '6961', 'http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00', '2015-12-01 11:34:02');


--
-- Name: metacategory3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metacategory3_id_seq', 166, true);


--
-- Data for Name: metaentrant; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: metaentrant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metaentrant_id_seq', 1, false);


--
-- Data for Name: metaevent; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: metaevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metaevent_id_seq', 1, false);


--
-- Data for Name: metafixture; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: metafixture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metafixture_id_seq', 1, false);


--
-- Data for Name: metamarket; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: metamarket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metamarket_id_seq', 1, false);


--
-- Data for Name: metaoutcome; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: metaoutcome_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metaoutcome_id_seq', 1, false);


--
-- Data for Name: migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO migration_versions (version) VALUES ('20161217111909');
INSERT INTO migration_versions (version) VALUES ('20161217191317');
INSERT INTO migration_versions (version) VALUES ('20161217235008');
INSERT INTO migration_versions (version) VALUES ('20161218133314');
INSERT INTO migration_versions (version) VALUES ('20161218202043');
INSERT INTO migration_versions (version) VALUES ('20161218202556');
INSERT INTO migration_versions (version) VALUES ('20161218223018');
INSERT INTO migration_versions (version) VALUES ('20161218223234');
INSERT INTO migration_versions (version) VALUES ('20161218235903');
INSERT INTO migration_versions (version) VALUES ('20161219014515');
INSERT INTO migration_versions (version) VALUES ('20161221174931');
INSERT INTO migration_versions (version) VALUES ('20161222104721');
INSERT INTO migration_versions (version) VALUES ('20161222104722');
INSERT INTO migration_versions (version) VALUES ('20170103121735');
INSERT INTO migration_versions (version) VALUES ('20170114132404');
INSERT INTO migration_versions (version) VALUES ('20170121142251');
INSERT INTO migration_versions (version) VALUES ('20170122104549');
INSERT INTO migration_versions (version) VALUES ('20170122112945');
INSERT INTO migration_versions (version) VALUES ('20170122190845');
INSERT INTO migration_versions (version) VALUES ('20170123124249');
INSERT INTO migration_versions (version) VALUES ('20170123161013');
INSERT INTO migration_versions (version) VALUES ('20170126001300');
INSERT INTO migration_versions (version) VALUES ('20170126144918');
INSERT INTO migration_versions (version) VALUES ('20170127112704');
INSERT INTO migration_versions (version) VALUES ('20170127114411');
INSERT INTO migration_versions (version) VALUES ('20170127124756');
INSERT INTO migration_versions (version) VALUES ('20170128112334');
INSERT INTO migration_versions (version) VALUES ('20170128112857');
INSERT INTO migration_versions (version) VALUES ('20170128121151');
INSERT INTO migration_versions (version) VALUES ('20170128122308');
INSERT INTO migration_versions (version) VALUES ('20170128123411');
INSERT INTO migration_versions (version) VALUES ('20170128140157');
INSERT INTO migration_versions (version) VALUES ('20170128140714');
INSERT INTO migration_versions (version) VALUES ('20170128142521');
INSERT INTO migration_versions (version) VALUES ('20170128202756');
INSERT INTO migration_versions (version) VALUES ('20170129094944');
INSERT INTO migration_versions (version) VALUES ('20170129211823');
INSERT INTO migration_versions (version) VALUES ('20170130123742');
INSERT INTO migration_versions (version) VALUES ('20170130155603');
INSERT INTO migration_versions (version) VALUES ('20170130225448');
INSERT INTO migration_versions (version) VALUES ('20170131085832');
INSERT INTO migration_versions (version) VALUES ('20170201170047');
INSERT INTO migration_versions (version) VALUES ('20170201171423');
INSERT INTO migration_versions (version) VALUES ('20170201173052');
INSERT INTO migration_versions (version) VALUES ('20170201173931');
INSERT INTO migration_versions (version) VALUES ('20170202091044');
INSERT INTO migration_versions (version) VALUES ('20170202103115');
INSERT INTO migration_versions (version) VALUES ('20170207215642');
INSERT INTO migration_versions (version) VALUES ('20170312192202');
INSERT INTO migration_versions (version) VALUES ('20170320150850');
INSERT INTO migration_versions (version) VALUES ('20170320152753');
INSERT INTO migration_versions (version) VALUES ('20170320154937');
INSERT INTO migration_versions (version) VALUES ('20170322142403');
INSERT INTO migration_versions (version) VALUES ('20170323181249');
INSERT INTO migration_versions (version) VALUES ('20170324163039');
INSERT INTO migration_versions (version) VALUES ('20170324174548');
INSERT INTO migration_versions (version) VALUES ('20170324202234');
INSERT INTO migration_versions (version) VALUES ('20170413093320');
INSERT INTO migration_versions (version) VALUES ('20170417103121');
INSERT INTO migration_versions (version) VALUES ('20170506223010');
INSERT INTO migration_versions (version) VALUES ('20170515141413');
INSERT INTO migration_versions (version) VALUES ('20170516163905');
INSERT INTO migration_versions (version) VALUES ('20170519101921');
INSERT INTO migration_versions (version) VALUES ('20170519220736');
INSERT INTO migration_versions (version) VALUES ('20170520172431');
INSERT INTO migration_versions (version) VALUES ('20170526120729');
INSERT INTO migration_versions (version) VALUES ('20170526121313');
INSERT INTO migration_versions (version) VALUES ('20170526125444');
INSERT INTO migration_versions (version) VALUES ('20170527145438');
INSERT INTO migration_versions (version) VALUES ('20170527151445');
INSERT INTO migration_versions (version) VALUES ('20170527154436');
INSERT INTO migration_versions (version) VALUES ('20170527190355');
INSERT INTO migration_versions (version) VALUES ('20170530172903');
INSERT INTO migration_versions (version) VALUES ('20170610180101');
INSERT INTO migration_versions (version) VALUES ('20170615173629');
INSERT INTO migration_versions (version) VALUES ('20170616182355');
INSERT INTO migration_versions (version) VALUES ('20170620083007');
INSERT INTO migration_versions (version) VALUES ('20170627175420');
INSERT INTO migration_versions (version) VALUES ('20170629150831');
INSERT INTO migration_versions (version) VALUES ('20170722101524');
INSERT INTO migration_versions (version) VALUES ('20170723112249');
INSERT INTO migration_versions (version) VALUES ('20170723144028');
INSERT INTO migration_versions (version) VALUES ('20170724095325');
INSERT INTO migration_versions (version) VALUES ('20170726160321');
INSERT INTO migration_versions (version) VALUES ('20170801172551');
INSERT INTO migration_versions (version) VALUES ('20170811115912');
INSERT INTO migration_versions (version) VALUES ('20170811154519');
INSERT INTO migration_versions (version) VALUES ('20170814160947');
INSERT INTO migration_versions (version) VALUES ('20170816184404');
INSERT INTO migration_versions (version) VALUES ('20170819161316');
INSERT INTO migration_versions (version) VALUES ('20170824114533');
INSERT INTO migration_versions (version) VALUES ('20170831123946');
INSERT INTO migration_versions (version) VALUES ('20170831124942');
INSERT INTO migration_versions (version) VALUES ('20170831152049');
INSERT INTO migration_versions (version) VALUES ('20170907091949');
INSERT INTO migration_versions (version) VALUES ('20170907102857');
INSERT INTO migration_versions (version) VALUES ('20171108193459');


--
-- Data for Name: offers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO offers (id, domain_id, category1_id, bookie_id, type, deposit, name, conditions, deeplink_sprintf, created_at, updated_at, valid_from, valid_to, canonicalised_name, colour, filtered) VALUES (1, NULL, NULL, 1, 'FREE', NULL, 'Bet £5 Get £20', 'Minimum Deposit and Stake £5. Free Bets Credited as 4x£5', 'http://wlcoral.iaofr.com/wl/clk/?btag=%sb_5995&aid=', '2017-06-24 07:33:33', '2017-11-08 19:58:32', '2017-01-01 01:00:00', '2022-01-01 01:00:00', 'Bet-5-Get-20', '', false);


--
-- Name: offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('offers_id_seq', 1, true);


--
-- Data for Name: outcomes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: outcomes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('outcomes_id_seq', 1, false);


--
-- Data for Name: participants; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('participants_id_seq', 1, false);


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (1, 1, '''import:static'' -v --env=dev', '2016-12-14 08:40:28', 108, 83.16796875, 1260, true, NULL, 'Matthews-iMac', '[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=2&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=2&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=2&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=12&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=12&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=12&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=13&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=13&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=13&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=15&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=15&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=15&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=25&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=25&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=25&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=51&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=51&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=51&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=56&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=56&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=56&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=61&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=61&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=61&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=63&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=63&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=63&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=71&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=71&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=71&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=73&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=73&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=73&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=74&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=74&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=74&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=78&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=78&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=78&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=87&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=87&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=87&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=89&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=89&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=89&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=115&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=115&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=115&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=142&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=142&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=142&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=143&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=143&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=143&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=151&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=151&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=151&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=154&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=154&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=154&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=159&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=159&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=159&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=165&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=165&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=165&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=175&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=175&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=175&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=196&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=196&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=196&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=201&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=201&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=201&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=207&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=207&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=207&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=219&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=219&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=219&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=226&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=226&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=226&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=230&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=230&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=230&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=233&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=233&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=233&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=235&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=235&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=235&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=236&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=236&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=236&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=241&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=241&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=241&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=243&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=243&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=243&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=244&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=244&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=244&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=245&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=245&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=245&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=246&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=246&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=246&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=247&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=247&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=247&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=254&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=254&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=254&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=256&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=256&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=256&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=261&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=261&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=261&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=265&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=265&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=265&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=267&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=267&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=267&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=268&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=268&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=268&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=270&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=270&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=270&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=276&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=276&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=276&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=277&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=277&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=277&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=475&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=475&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=475&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=520&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=520&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=520&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=504&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=504&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=504&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=301&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=301&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=301&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=263&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=263&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=263&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=294&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=294&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=294&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=305&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=305&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=305&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=307&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=307&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=307&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=517&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=517&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=517&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=593&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=593&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=593&dateFrom=2016-12-15 00:00:00] :OK
[fetched] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00] | [] | Fetcher success [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00] :OK

[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=17&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=17&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=17&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=19&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=19&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=19&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=26&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=26&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=26&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=32&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=32&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=32&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=40&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=40&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=40&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=41&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=41&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=41&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=46&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=46&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=46&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=81&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=81&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=81&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=82&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=82&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=82&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=106&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=106&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=106&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=109&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=109&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=109&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=112&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=112&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=112&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=113&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=113&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=113&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=139&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=139&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=139&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=173&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=173&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=173&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=202&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=202&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=202&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=205&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=205&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=205&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=206&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=206&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=206&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=208&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=208&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=208&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=210&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=210&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=210&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=211&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=211&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=211&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=212&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=212&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=212&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=218&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=218&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=218&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=227&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=227&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=227&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=272&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=272&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=272&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=274&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=274&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=274&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=275&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=275&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=275&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=279&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=279&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=279&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=280&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=280&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=280&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=311&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=311&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=311&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=321&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=321&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=321&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=489&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=489&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=489&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=556&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=556&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=556&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=557&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=557&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=557&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=581&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=581&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=581&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=659&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=659&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=659&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=661&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=661&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=661&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=738&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=738&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=738&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=285&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=285&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=285&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=286&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=286&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=286&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=287&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=287&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=287&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=291&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=291&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=291&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=288&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=288&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=288&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=289&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=289&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=289&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=290&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=290&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=290&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=602&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=602&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=602&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []
[fetchedFail] http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=605&dateFrom=2016-12-15+00%3A00%3A00: 1
FETCHERMETA [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=605&dateFrom=2016-12-15 00:00:00] | Fetcher failure [http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=605&dateFrom=2016-12-15 00:00:00] :[FETCH]   Response not verified as proper. Appears to be a debug response page: Request found no matching data " provider="GENERIC | []

[managed] CATEGORY3: 3
WRITABLEMETA [CATEGORY3] | [] | id:25196, name:World Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: skip
WRITABLEMETA [CATEGORY3] | [] | id:6959, name:Enhanced Multiples, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: skip
WRITABLEMETA [CATEGORY3] | [] | id:6962, name:Player Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: skip

[managedFail] CATEGORY1: 33
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''TV-Specials'',
) | id:48, name:TV Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Horse-Racing'',
) | id:21, name:Horse Racing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football'',
) | id:16, name:Football, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tennis'',
) | id:34, name:Tennis, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Golf'',
) | id:18, name:Golf, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Rugby-Union'',
) | id:31, name:Rugby Union, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Darts'',
) | id:13, name:Darts, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Cricket'',
) | id:10, name:Cricket, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''ESports'',
) | id:148, name:ESports, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''American-Football'',
) | id:1, name:American Football, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Badminton'',
) | id:51, name:Badminton, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Baseball'',
) | id:5, name:Baseball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball'',
) | id:6, name:Basketball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Boxing'',
) | id:9, name:Boxing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Cycling'',
) | id:12, name:Cycling, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Formula-1'',
) | id:24, name:Formula 1, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Greyhound-Racing'',
) | id:19, name:Greyhound Racing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball'',
) | id:20, name:Handball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey'',
) | id:22, name:Ice Hockey, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Lotto-Specials'',
) | id:141, name:Lotto Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Motor-Bikes'',
) | id:23, name:Motor Bikes, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Olympics'',
) | id:79, name:Olympics, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Politics'',
) | id:46, name:Politics, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Pool'',
) | id:28, name:Pool, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Rugby-League'',
) | id:30, name:Rugby League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Snooker'',
) | id:32, name:Snooker, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Speedway'',
) | id:25, name:Speedway, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''UFC/MMA'',
) | id:35, name:UFC/MMA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball'',
) | id:36, name:Volleyball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Sports'',
) | id:39, name:Virtual Sports, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Christmas-Specials'',
) | id:68, name:Christmas Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Movies'',
) | id:42, name:Movies, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Royal-Specials'',
) | id:95, name:Royal Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
[managedFail] CATEGORY2: 120
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tennis'',
) | id:266, name:Tennis, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''American-Football'',
) | id:2, name:American Football, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Baseball'',
) | id:12, name:Baseball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Australia'',
) | id:13, name:Basketball Australia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Specials'',
) | id:15, name:Basketball Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Brazil'',
) | id:17, name:Basketball Brazil, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-China'',
) | id:19, name:Basketball China, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-European-Competitions'',
) | id:25, name:Basketball European Competitions, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Finland'',
) | id:26, name:Basketball Finland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Israel'',
) | id:32, name:Basketball Israel, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Philippines'',
) | id:40, name:Basketball Philippines, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Poland'',
) | id:41, name:Basketball Poland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-South-Korea'',
) | id:46, name:Basketball South Korea, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-USA'',
) | id:51, name:Basketball USA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Boxing'',
) | id:56, name:Boxing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Cricket'',
) | id:58, name:Cricket, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Cycling'',
) | id:61, name:Cycling, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Darts'',
) | id:63, name:Darts, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Argentina'',
) | id:71, name:Football Argentina, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Australia'',
) | id:73, name:Football Australia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Austria'',
) | id:74, name:Football Austria, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Belgium'',
) | id:78, name:Football Belgium, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Brazil'',
) | id:81, name:Football Brazil, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Bulgaria'',
) | id:82, name:Football Bulgaria, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Colombia'',
) | id:87, name:Football Colombia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Croatia'',
) | id:89, name:Football Croatia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-England'',
) | id:97, name:Football England, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-France'',
) | id:102, name:Football France, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Germany'',
) | id:105, name:Football Germany, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Greece'',
) | id:106, name:Football Greece, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Hong-Kong'',
) | id:109, name:Football Hong Kong, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-India'',
) | id:112, name:Football India, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Indonesia'',
) | id:113, name:Football Indonesia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-International'',
) | id:115, name:Football International, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Italy'',
) | id:120, name:Football Italy, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Morocco'',
) | id:139, name:Football Morocco, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Netherlands'',
) | id:140, name:Football Netherlands, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Northern-Ireland'',
) | id:142, name:Football Northern Ireland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-World-Club-Competitions'',
) | id:143, name:Football World Club Competitions, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Poland'',
) | id:151, name:Football Poland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Portugal'',
) | id:152, name:Football Portugal, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Romania'',
) | id:154, name:Football Romania, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Scotland'',
) | id:158, name:Football Scotland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Serbia'',
) | id:159, name:Football Serbia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-UEFA-Club-Competitions'',
) | id:165, name:Football UEFA Club Competitions, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Spain'',
) | id:166, name:Football Spain, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Tunisia'',
) | id:173, name:Football Tunisia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Turkey'',
) | id:175, name:Football Turkey, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Golf'',
) | id:195, name:Golf, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Golf-New-Year-Specials'',
) | id:196, name:Golf New Year Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Greyhounds---Live'',
) | id:198, name:Greyhounds - Live, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Greyhounds---Specials'',
) | id:201, name:Greyhounds - Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Austria'',
) | id:202, name:Handball Austria, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Denmark'',
) | id:205, name:Handball Denmark, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Finland'',
) | id:206, name:Handball Finland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-France'',
) | id:207, name:Handball France, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Germany'',
) | id:208, name:Handball Germany, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Hungary'',
) | id:210, name:Handball Hungary, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-International'',
) | id:211, name:Handball International, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Norway'',
) | id:212, name:Handball Norway, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Spain'',
) | id:218, name:Handball Spain, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Sweden'',
) | id:219, name:Handball Sweden, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Horse-Racing---Live'',
) | id:223, name:Horse Racing - Live, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Horse-Racing---Specials'',
) | id:226, name:Horse Racing - Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Daily-Racing-Specials'',
) | id:227, name:Daily Racing Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Czech-Republic'',
) | id:230, name:Ice Hockey Czech Republic, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Finland'',
) | id:233, name:Ice Hockey Finland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Germany'',
) | id:235, name:Ice Hockey Germany, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Internationals'',
) | id:236, name:Ice Hockey Internationals, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Russia'',
) | id:241, name:Ice Hockey Russia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Sweden'',
) | id:243, name:Ice Hockey Sweden, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Switzerland'',
) | id:244, name:Ice Hockey Switzerland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-USA'',
) | id:245, name:Ice Hockey USA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Motor-Bikes-All-Motor-Bikes'',
) | id:246, name:Motor Bikes All Motor Bikes, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Formula-1'',
) | id:247, name:Formula 1, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Pool'',
) | id:254, name:Pool, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Rugby-League'',
) | id:256, name:Rugby League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Rugby-Union'',
) | id:259, name:Rugby Union, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Snooker'',
) | id:261, name:Snooker, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Speedway'',
) | id:265, name:Speedway, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tennis-New-Year-Specials'',
) | id:267, name:Tennis New Year Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''UFC/MMA'',
) | id:268, name:UFC/MMA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Czech-Republic'',
) | id:270, name:Volleyball Czech Republic, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Finland'',
) | id:272, name:Volleyball Finland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Germany'',
) | id:274, name:Volleyball Germany, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Greece'',
) | id:275, name:Volleyball Greece, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-International'',
) | id:276, name:Volleyball International, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Italy'',
) | id:277, name:Volleyball Italy, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Poland'',
) | id:279, name:Volleyball Poland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Russia'',
) | id:280, name:Volleyball Russia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Badminton'',
) | id:311, name:Badminton, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Horse-Racing---Tote-Pools'',
) | id:321, name:Horse Racing - Tote Pools, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Specials-All-Specials'',
) | id:475, name:Specials All Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Norway'',
) | id:489, name:Basketball Norway, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Christmas-Specials'',
) | id:520, name:Christmas Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Brazil'',
) | id:556, name:Volleyball Brazil, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-South-Korea'',
) | id:557, name:Volleyball South Korea, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Romania'',
) | id:581, name:Romania, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-World-Club-Competitions'',
) | id:659, name:Handball World Club Competitions, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''eSports'',
) | id:661, name:eSports, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''England-(TEST)'',
) | id:738, name:England (TEST), Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Specials'',
) | id:504, name:Ice Hockey Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Politics-UK'',
) | id:301, name:Politics UK, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Royal-Specials'',
) | id:263, name:Royal Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Movies-All-Movies'',
) | id:294, name:Movies All Movies, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''TV-Specials-UK'',
) | id:305, name:TV Specials UK, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''TV-Specials-Awards'',
) | id:307, name:TV Specials Awards, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Horse-Racing'',
) | id:285, name:Virtual Horse Racing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Greyhounds'',
) | id:286, name:Virtual Greyhounds, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Football'',
) | id:287, name:Virtual Football, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Tennis'',
) | id:291, name:Virtual Tennis, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Motorsports'',
) | id:288, name:Virtual Motorsports, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Speedway'',
) | id:289, name:Virtual Speedway, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Cycling'',
) | id:290, name:Virtual Cycling, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Pools'',
) | id:517, name:Football Pools, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''49s'',
) | id:594, name:49s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Irish-Lotto'',
) | id:593, name:Irish Lotto, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Specials'',
) | id:67, name:Football Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''My-Football-Markets'',
) | id:602, name:My Football Markets, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''My-Darts-Markets'',
) | id:605, name:My Darts Markets, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
[managedFail] CATEGORY3: 166
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''2017-Specials'',
) | id:1682, name:2017  Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-Open---Men\''s-Singles'',
) | id:1624, name:French Open - Men''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-Open---Women\''s-Singles'',
) | id:1622, name:French Open - Women''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''US-Open---Men\''s-Singles'',
) | id:1691, name:US Open - Men''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''US-Open---Women\''s-Singles'',
) | id:1689, name:US Open - Women''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Wimbledon---Men\''s-Singles'',
) | id:1704, name:Wimbledon - Men''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Wimbledon---Ladies\''-Singles'',
) | id:1702, name:Wimbledon - Ladies'' Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Australian-Open-Men\''s-Singles'',
) | id:24853, name:Australian Open Men''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Australian-Open-Women\''s-Singles'',
) | id:24854, name:Australian Open Women''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Davis-Cup'',
) | id:1611, name:Davis Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=2&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''NFL'',
) | id:4, name:NFL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=12&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''MLB'',
) | id:33, name:MLB, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=13&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Australian-NBL'',
) | id:35, name:Australian NBL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=15&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Enhanced-Multiples'',
) | id:4644, name:Enhanced Multiples, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=25&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Euroleague-2016/17'',
) | id:63, name:Euroleague 2016/17, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=51&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''NBA'',
) | id:136, name:NBA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=51&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''NCAA-Men\''s'',
) | id:137, name:NCAA Men''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=56&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Upcoming-Fights'',
) | id:147, name:Upcoming Fights, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ashes-2017-18'',
) | id:28428, name:Ashes 2017-18, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Test-Matches'',
) | id:2346, name:Test Matches, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''County-Championship-Division-One-2017'',
) | id:159, name:County Championship Division One 2017, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''County-Championship-Division-Two-2017'',
) | id:5542, name:County Championship Division Two 2017, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''ICC-Champions-Trophy'',
) | id:3208, name:ICC Champions Trophy, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''T20-Big-Bash'',
) | id:2526, name:T20 Big Bash, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ram-Slam-T20'',
) | id:26431, name:Ram Slam T20, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Womens-T20-Big-Bash'',
) | id:29134, name:Womens T20 Big Bash, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Sheffield-Shield'',
) | id:2522, name:Sheffield Shield, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''ICC-World-Cup-2019'',
) | id:156, name:ICC World Cup 2019, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=61&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tour-de-France'',
) | id:179, name:Tour de France, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=63&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''PDC-World-Championship'',
) | id:188, name:PDC World Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=63&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''BDO-World-Championship'',
) | id:183, name:BDO World Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=71&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Argentinian-Primera-B-Nacional'',
) | id:219, name:Argentinian Primera B Nacional, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=73&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Australian-A-League'',
) | id:230, name:Australian A-League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=74&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Austrian-Bundesliga'',
) | id:275, name:Austrian Bundesliga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=78&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Belgian-First-Division-A'',
) | id:299, name:Belgian First Division A, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=78&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Belgium-First-Division-B'',
) | id:31288, name:Belgium First Division B, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=87&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Colombian-Primera-Division'',
) | id:2295, name:Colombian Primera Division, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=89&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Croatian-1.-HNL'',
) | id:382, name:Croatian 1. HNL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Premier-League'',
) | id:442, name:Premier League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''EFL-Cup'',
) | id:434, name:EFL Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Championship'',
) | id:435, name:Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''League-One'',
) | id:440, name:League One, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''League-Two'',
) | id:441, name:League Two, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''FA-Cup'',
) | id:438, name:FA Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Checkatrade-Trophy'',
) | id:439, name:Checkatrade Trophy, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''National-League'',
) | id:437, name:National League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-Ligue-1'',
) | id:472, name:French Ligue 1, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-Ligue-2'',
) | id:471, name:French Ligue 2, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-National'',
) | id:473, name:French National, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''German-Bundesliga'',
) | id:500, name:German Bundesliga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''German-2.-Bundesliga'',
) | id:498, name:German 2. Bundesliga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''German-3.-Liga'',
) | id:499, name:German 3. Liga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=115&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''World-Cup-2018'',
) | id:25848, name:World Cup 2018, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=115&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''World-Cup-2018-Qualification,-UEFA'',
) | id:2342, name:World Cup 2018 Qualification, UEFA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Italian-Serie-A'',
) | id:734, name:Italian Serie A, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Italian-Serie-B'',
) | id:733, name:Italian Serie B, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Italian-Super-Cup'',
) | id:735, name:Italian Super Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Dutch-Eredivisie'',
) | id:823, name:Dutch Eredivisie, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Dutch-Eerste-Divisie'',
) | id:821, name:Dutch Eerste Divisie, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Dutch-KNVB-Cup'',
) | id:825, name:Dutch KNVB Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=142&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Northern-Irish-Premiership'',
) | id:839, name:Northern Irish Premiership, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=143&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''FIFA-Club-World-Cup'',
) | id:25218, name:FIFA Club World Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=151&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Polish-Ekstraklasa'',
) | id:868, name:Polish Ekstraklasa, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Portuguese-Primeira-Liga'',
) | id:880, name:Portuguese Primeira Liga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Portuguese-Liga-de-Honra'',
) | id:882, name:Portuguese Liga de Honra, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Portuguese-Cup'',
) | id:884, name:Portuguese Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=154&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Romanian-Liga-I'',
) | id:896, name:Romanian Liga I, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=154&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Romanian-Cup'',
) | id:893, name:Romanian Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Scottish-Premiership'',
) | id:929, name:Scottish Premiership, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Scottish-Championship'',
) | id:927, name:Scottish Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Scottish-League-One'',
) | id:931, name:Scottish League One, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Scottish-League-Two'',
) | id:932, name:Scottish League Two, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Scottish-FA-Cup'',
) | id:930, name:Scottish FA Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=159&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Serbian-SuperLiga'',
) | id:936, name:Serbian SuperLiga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=165&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''UEFA-Champions-League'',
) | id:25230, name:UEFA Champions League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=165&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''UEFA-Europa-League'',
) | id:25231, name:UEFA Europa League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Spanish-La-Liga'',
) | id:971, name:Spanish La Liga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Spanish-Copa-del-Rey'',
) | id:967, name:Spanish Copa del Rey, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Spanish-Segunda-Division'',
) | id:974, name:Spanish Segunda Division, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=175&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Turkish-Super-Lig'',
) | id:1018, name:Turkish Super Lig, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=175&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Turkish-Cup'',
) | id:1021, name:Turkish Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tata-Open'',
) | id:32722, name:Tata Open, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''USPGA-Championship'',
) | id:25983, name:USPGA Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''US-Masters'',
) | id:1245, name:US Masters, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''US-Open'',
) | id:1247, name:US Open, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''The-Open-Championship'',
) | id:13303, name:The Open Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ryder-Cup'',
) | id:1200, name:Ryder Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Golf-Major-Specials'',
) | id:29356, name:Golf Major Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''PGA-Money-List'',
) | id:1185, name:PGA Money List, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Race-To-Dubai'',
) | id:29005, name:Race To Dubai, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Player-Specials'',
) | id:1187, name:Player Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=196&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Golf-New-Year-Specials'',
) | id:1267, name:Golf New Year Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Henlow'',
) | id:1864, name:Henlow, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Notts-(Dogs)'',
) | id:26746, name:Notts (Dogs), Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ante-Post-Races'',
) | id:4236, name:Ante-Post Races, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=201&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''BAGS-Track-Championship-Specials'',
) | id:31482, name:BAGS Track Championship Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=207&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-D1-Men\''s'',
) | id:1284, name:French D1 Men''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=219&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Swedish-Elitserien-Men\''s'',
) | id:1325, name:Swedish Elitserien Men''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Royal-Ascot'',
) | id:1966, name:Royal Ascot, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Chantilly'',
) | id:4227, name:Chantilly, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Aintree'',
) | id:1892, name:Aintree, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ascot'',
) | id:1894, name:Ascot, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Cheltenham'',
) | id:1908, name:Cheltenham, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Chepstow'',
) | id:1909, name:Chepstow, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Epsom-Downs'',
) | id:6753, name:Epsom Downs, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Kempton'',
) | id:1941, name:Kempton, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Lingfield'',
) | id:1945, name:Lingfield, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Newmarket'',
) | id:1955, name:Newmarket, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Leopardstown'',
) | id:2035, name:Leopardstown, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Churchill-Downs'',
) | id:2480, name:Churchill Downs, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Vaal-(RSA)'',
) | id:5361, name:Vaal (RSA), Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=226&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Racing-Specials'',
) | id:2509, name:Racing Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=230&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Czech-Extraliga'',
) | id:1333, name:Czech Extraliga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=233&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Finnish-Liiga'',
) | id:1351, name:Finnish Liiga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=235&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''German-DEL'',
) | id:1355, name:German DEL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=236&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Euro-Hockey-Tour'',
) | id:26668, name:Euro Hockey Tour, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=241&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Russian-KHL'',
) | id:1372, name:Russian KHL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=241&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Russian-MHL'',
) | id:26575, name:Russian MHL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=243&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Swedish-SHL'',
) | id:1385, name:Swedish SHL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=244&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Swiss-NLA'',
) | id:1388, name:Swiss NLA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=245&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''NHL'',
) | id:1392, name:NHL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=245&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''AHL'',
) | id:1390, name:AHL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=246&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''MotoGP-World-Championship'',
) | id:1430, name:MotoGP World Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=247&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''World-Championship'',
) | id:1464, name:World Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=254&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''IPA-Pool-World-Championships'',
) | id:29196, name:IPA Pool World Championships, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=256&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Super-League'',
) | id:1485, name:Super League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=256&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Challenge-Cup'',
) | id:1478, name:Challenge Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''RBS-6-Nations-2017'',
) | id:27225, name:RBS 6 Nations 2017, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''ER-Champions-Cup'',
) | id:25439, name:ER Champions Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''ER-Challenge-Cup'',
) | id:26362, name:ER Challenge Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Aviva-Premiership'',
) | id:1493, name:Aviva Premiership, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Guinness-PRO12'',
) | id:1510, name:Guinness PRO12, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Top-14'',
) | id:1514, name:Top 14, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Super-18'',
) | id:1513, name:Super 18, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''British-and-Irish-Lions-Tour'',
) | id:2703, name:British and Irish Lions Tour, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Specials'',
) | id:21006, name:Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''World-Cup-2019'',
) | id:28866, name:World Cup 2019, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=261&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''The-Masters'',
) | id:25488, name:The Masters, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=265&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''FIM-Speedway-Grand-Prix'',
) | id:1558, name:FIM Speedway Grand Prix, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=267&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tennis-New-Year-Specials'',
) | id:1713, name:Tennis New Year Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=268&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''MMA-UFC'',
) | id:2636, name:MMA-UFC, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=270&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Czech-Extraliga-Men\''s'',
) | id:1717, name:Czech Extraliga Men''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=276&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Champions-League-Women\''s'',
) | id:1743, name:Champions League Women''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=277&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Italy-Cup-A1-Women\''s'',
) | id:2240, name:Italy Cup A1 Women''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=475&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Host-2024'',
) | id:2251, name:Host 2024, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=520&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Various-Christmas-Specials'',
) | id:17598, name:Various Christmas Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=301&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''UK-Politics'',
) | id:1828, name:UK Politics, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=301&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''General-Election'',
) | id:28624, name:General Election, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=263&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Royal-Specials'',
) | id:2730, name:Royal Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=294&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Next-James-Bond'',
) | id:29225, name:Next James Bond, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=305&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''The-Voice-UK'',
) | id:2935, name:The Voice UK, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=305&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Strictly-Come-Dancing'',
) | id:1844, name:Strictly Come Dancing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=307&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Sports-Personality-of-the-Year'',
) | id:1851, name:Sports Personality of the Year, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=517&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''V15'',
) | id:14471, name:V15, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''49s-Lunchtime-6-Ball-Draw'',
) | id:26353, name:49s Lunchtime 6 Ball Draw, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''49s-Lunchtime-Bonus-Ball'',
) | id:26354, name:49s Lunchtime Bonus Ball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''49s-Teatime-6-Ball-Draw'',
) | id:26355, name:49s Teatime 6 Ball Draw, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''49s-Teatime-Bonus-Ball'',
) | id:26356, name:49s Teatime Bonus Ball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=593&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Irish-Lotto-Main-6-Ball-Draw'',
) | id:26312, name:Irish Lotto Main 6 Ball Draw, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=593&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Irish-Lotto-Main-Draw-Bonus-Ball'',
) | id:26313, name:Irish Lotto Main Draw Bonus Ball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Premier-League-Specials'',
) | id:26698, name:Premier League Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Champions-League-Specials'',
) | id:18395, name:Champions League Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Transfer-Specials'',
) | id:8132, name:Transfer Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Manager-Specials'',
) | id:6963, name:Manager Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''World-Cup-Specials'',
) | id:19822, name:World Cup Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Team-Specials'',
) | id:6961, name:Team Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
[managedFail] CATEGORY1: 33
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''TV-Specials'',
) | id:48, name:TV Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Horse-Racing'',
) | id:21, name:Horse Racing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football'',
) | id:16, name:Football, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tennis'',
) | id:34, name:Tennis, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Golf'',
) | id:18, name:Golf, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Rugby-Union'',
) | id:31, name:Rugby Union, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Darts'',
) | id:13, name:Darts, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Cricket'',
) | id:10, name:Cricket, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''ESports'',
) | id:148, name:ESports, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''American-Football'',
) | id:1, name:American Football, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Badminton'',
) | id:51, name:Badminton, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Baseball'',
) | id:5, name:Baseball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball'',
) | id:6, name:Basketball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Boxing'',
) | id:9, name:Boxing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Cycling'',
) | id:12, name:Cycling, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Formula-1'',
) | id:24, name:Formula 1, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Greyhound-Racing'',
) | id:19, name:Greyhound Racing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball'',
) | id:20, name:Handball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey'',
) | id:22, name:Ice Hockey, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Lotto-Specials'',
) | id:141, name:Lotto Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Motor-Bikes'',
) | id:23, name:Motor Bikes, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Olympics'',
) | id:79, name:Olympics, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Politics'',
) | id:46, name:Politics, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Pool'',
) | id:28, name:Pool, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Rugby-League'',
) | id:30, name:Rugby League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Snooker'',
) | id:32, name:Snooker, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Speedway'',
) | id:25, name:Speedway, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''UFC/MMA'',
) | id:35, name:UFC/MMA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball'',
) | id:36, name:Volleyball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Sports'',
) | id:39, name:Virtual Sports, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Christmas-Specials'',
) | id:68, name:Christmas Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Movies'',
) | id:42, name:Movies, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY1] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category1, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getCategories, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Royal-Specials'',
) | id:95, name:Royal Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
[managedFail] CATEGORY2: 120
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tennis'',
) | id:266, name:Tennis, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''American-Football'',
) | id:2, name:American Football, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Baseball'',
) | id:12, name:Baseball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Australia'',
) | id:13, name:Basketball Australia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Specials'',
) | id:15, name:Basketball Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Brazil'',
) | id:17, name:Basketball Brazil, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-China'',
) | id:19, name:Basketball China, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-European-Competitions'',
) | id:25, name:Basketball European Competitions, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Finland'',
) | id:26, name:Basketball Finland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Israel'',
) | id:32, name:Basketball Israel, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Philippines'',
) | id:40, name:Basketball Philippines, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Poland'',
) | id:41, name:Basketball Poland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-South-Korea'',
) | id:46, name:Basketball South Korea, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-USA'',
) | id:51, name:Basketball USA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Boxing'',
) | id:56, name:Boxing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Cricket'',
) | id:58, name:Cricket, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Cycling'',
) | id:61, name:Cycling, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Darts'',
) | id:63, name:Darts, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Argentina'',
) | id:71, name:Football Argentina, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Australia'',
) | id:73, name:Football Australia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Austria'',
) | id:74, name:Football Austria, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Belgium'',
) | id:78, name:Football Belgium, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Brazil'',
) | id:81, name:Football Brazil, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Bulgaria'',
) | id:82, name:Football Bulgaria, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Colombia'',
) | id:87, name:Football Colombia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Croatia'',
) | id:89, name:Football Croatia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-England'',
) | id:97, name:Football England, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-France'',
) | id:102, name:Football France, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Germany'',
) | id:105, name:Football Germany, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Greece'',
) | id:106, name:Football Greece, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Hong-Kong'',
) | id:109, name:Football Hong Kong, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-India'',
) | id:112, name:Football India, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Indonesia'',
) | id:113, name:Football Indonesia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-International'',
) | id:115, name:Football International, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Italy'',
) | id:120, name:Football Italy, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Morocco'',
) | id:139, name:Football Morocco, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Netherlands'',
) | id:140, name:Football Netherlands, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Northern-Ireland'',
) | id:142, name:Football Northern Ireland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-World-Club-Competitions'',
) | id:143, name:Football World Club Competitions, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Poland'',
) | id:151, name:Football Poland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Portugal'',
) | id:152, name:Football Portugal, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Romania'',
) | id:154, name:Football Romania, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Scotland'',
) | id:158, name:Football Scotland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Serbia'',
) | id:159, name:Football Serbia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-UEFA-Club-Competitions'',
) | id:165, name:Football UEFA Club Competitions, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Spain'',
) | id:166, name:Football Spain, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Tunisia'',
) | id:173, name:Football Tunisia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Turkey'',
) | id:175, name:Football Turkey, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Golf'',
) | id:195, name:Golf, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Golf-New-Year-Specials'',
) | id:196, name:Golf New Year Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Greyhounds---Live'',
) | id:198, name:Greyhounds - Live, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Greyhounds---Specials'',
) | id:201, name:Greyhounds - Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Austria'',
) | id:202, name:Handball Austria, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Denmark'',
) | id:205, name:Handball Denmark, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Finland'',
) | id:206, name:Handball Finland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-France'',
) | id:207, name:Handball France, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Germany'',
) | id:208, name:Handball Germany, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Hungary'',
) | id:210, name:Handball Hungary, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-International'',
) | id:211, name:Handball International, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Norway'',
) | id:212, name:Handball Norway, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Spain'',
) | id:218, name:Handball Spain, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-Sweden'',
) | id:219, name:Handball Sweden, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Horse-Racing---Live'',
) | id:223, name:Horse Racing - Live, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Horse-Racing---Specials'',
) | id:226, name:Horse Racing - Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Daily-Racing-Specials'',
) | id:227, name:Daily Racing Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Czech-Republic'',
) | id:230, name:Ice Hockey Czech Republic, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Finland'',
) | id:233, name:Ice Hockey Finland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Germany'',
) | id:235, name:Ice Hockey Germany, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Internationals'',
) | id:236, name:Ice Hockey Internationals, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Russia'',
) | id:241, name:Ice Hockey Russia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Sweden'',
) | id:243, name:Ice Hockey Sweden, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Switzerland'',
) | id:244, name:Ice Hockey Switzerland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-USA'',
) | id:245, name:Ice Hockey USA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Motor-Bikes-All-Motor-Bikes'',
) | id:246, name:Motor Bikes All Motor Bikes, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Formula-1'',
) | id:247, name:Formula 1, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Pool'',
) | id:254, name:Pool, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Rugby-League'',
) | id:256, name:Rugby League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Rugby-Union'',
) | id:259, name:Rugby Union, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Snooker'',
) | id:261, name:Snooker, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Speedway'',
) | id:265, name:Speedway, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tennis-New-Year-Specials'',
) | id:267, name:Tennis New Year Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''UFC/MMA'',
) | id:268, name:UFC/MMA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Czech-Republic'',
) | id:270, name:Volleyball Czech Republic, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Finland'',
) | id:272, name:Volleyball Finland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Germany'',
) | id:274, name:Volleyball Germany, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Greece'',
) | id:275, name:Volleyball Greece, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-International'',
) | id:276, name:Volleyball International, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Italy'',
) | id:277, name:Volleyball Italy, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Poland'',
) | id:279, name:Volleyball Poland, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Russia'',
) | id:280, name:Volleyball Russia, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Badminton'',
) | id:311, name:Badminton, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Horse-Racing---Tote-Pools'',
) | id:321, name:Horse Racing - Tote Pools, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Specials-All-Specials'',
) | id:475, name:Specials All Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Basketball-Norway'',
) | id:489, name:Basketball Norway, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Christmas-Specials'',
) | id:520, name:Christmas Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-Brazil'',
) | id:556, name:Volleyball Brazil, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Volleyball-South-Korea'',
) | id:557, name:Volleyball South Korea, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Romania'',
) | id:581, name:Romania, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Handball-World-Club-Competitions'',
) | id:659, name:Handball World Club Competitions, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''eSports'',
) | id:661, name:eSports, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''England-(TEST)'',
) | id:738, name:England (TEST), Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ice-Hockey-Specials'',
) | id:504, name:Ice Hockey Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Politics-UK'',
) | id:301, name:Politics UK, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Royal-Specials'',
) | id:263, name:Royal Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Movies-All-Movies'',
) | id:294, name:Movies All Movies, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''TV-Specials-UK'',
) | id:305, name:TV Specials UK, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''TV-Specials-Awards'',
) | id:307, name:TV Specials Awards, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Horse-Racing'',
) | id:285, name:Virtual Horse Racing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Greyhounds'',
) | id:286, name:Virtual Greyhounds, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Football'',
) | id:287, name:Virtual Football, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Tennis'',
) | id:291, name:Virtual Tennis, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Motorsports'',
) | id:288, name:Virtual Motorsports, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Speedway'',
) | id:289, name:Virtual Speedway, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Virtual-Cycling'',
) | id:290, name:Virtual Cycling, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Pools'',
) | id:517, name:Football Pools, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''49s'',
) | id:594, name:49s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Irish-Lotto'',
) | id:593, name:Irish Lotto, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Football-Specials'',
) | id:67, name:Football Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''My-Football-Markets'',
) | id:602, name:My Football Markets, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY2] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category2, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getClasses, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''My-Darts-Markets'',
) | id:605, name:My Darts Markets, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
[managedFail] CATEGORY3: 166
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''2017-Specials'',
) | id:1682, name:2017  Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-Open---Men\''s-Singles'',
) | id:1624, name:French Open - Men''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-Open---Women\''s-Singles'',
) | id:1622, name:French Open - Women''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''US-Open---Men\''s-Singles'',
) | id:1691, name:US Open - Men''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''US-Open---Women\''s-Singles'',
) | id:1689, name:US Open - Women''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Wimbledon---Men\''s-Singles'',
) | id:1704, name:Wimbledon - Men''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Wimbledon---Ladies\''-Singles'',
) | id:1702, name:Wimbledon - Ladies'' Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Australian-Open-Men\''s-Singles'',
) | id:24853, name:Australian Open Men''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Australian-Open-Women\''s-Singles'',
) | id:24854, name:Australian Open Women''s Singles, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=266&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Davis-Cup'',
) | id:1611, name:Davis Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=2&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''NFL'',
) | id:4, name:NFL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=12&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''MLB'',
) | id:33, name:MLB, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=13&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Australian-NBL'',
) | id:35, name:Australian NBL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=15&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Enhanced-Multiples'',
) | id:4644, name:Enhanced Multiples, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=25&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Euroleague-2016/17'',
) | id:63, name:Euroleague 2016/17, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=51&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''NBA'',
) | id:136, name:NBA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=51&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''NCAA-Men\''s'',
) | id:137, name:NCAA Men''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=56&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Upcoming-Fights'',
) | id:147, name:Upcoming Fights, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ashes-2017-18'',
) | id:28428, name:Ashes 2017-18, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Test-Matches'',
) | id:2346, name:Test Matches, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''County-Championship-Division-One-2017'',
) | id:159, name:County Championship Division One 2017, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''County-Championship-Division-Two-2017'',
) | id:5542, name:County Championship Division Two 2017, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''ICC-Champions-Trophy'',
) | id:3208, name:ICC Champions Trophy, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''T20-Big-Bash'',
) | id:2526, name:T20 Big Bash, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ram-Slam-T20'',
) | id:26431, name:Ram Slam T20, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Womens-T20-Big-Bash'',
) | id:29134, name:Womens T20 Big Bash, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Sheffield-Shield'',
) | id:2522, name:Sheffield Shield, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=58&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''ICC-World-Cup-2019'',
) | id:156, name:ICC World Cup 2019, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=61&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tour-de-France'',
) | id:179, name:Tour de France, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=63&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''PDC-World-Championship'',
) | id:188, name:PDC World Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=63&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''BDO-World-Championship'',
) | id:183, name:BDO World Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=71&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Argentinian-Primera-B-Nacional'',
) | id:219, name:Argentinian Primera B Nacional, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=73&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Australian-A-League'',
) | id:230, name:Australian A-League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=74&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Austrian-Bundesliga'',
) | id:275, name:Austrian Bundesliga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=78&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Belgian-First-Division-A'',
) | id:299, name:Belgian First Division A, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=78&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Belgium-First-Division-B'',
) | id:31288, name:Belgium First Division B, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=87&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Colombian-Primera-Division'',
) | id:2295, name:Colombian Primera Division, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=89&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Croatian-1.-HNL'',
) | id:382, name:Croatian 1. HNL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Premier-League'',
) | id:442, name:Premier League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''EFL-Cup'',
) | id:434, name:EFL Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Championship'',
) | id:435, name:Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''League-One'',
) | id:440, name:League One, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''League-Two'',
) | id:441, name:League Two, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''FA-Cup'',
) | id:438, name:FA Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Checkatrade-Trophy'',
) | id:439, name:Checkatrade Trophy, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=97&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''National-League'',
) | id:437, name:National League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-Ligue-1'',
) | id:472, name:French Ligue 1, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-Ligue-2'',
) | id:471, name:French Ligue 2, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=102&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-National'',
) | id:473, name:French National, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''German-Bundesliga'',
) | id:500, name:German Bundesliga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''German-2.-Bundesliga'',
) | id:498, name:German 2. Bundesliga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=105&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''German-3.-Liga'',
) | id:499, name:German 3. Liga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=115&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''World-Cup-2018'',
) | id:25848, name:World Cup 2018, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=115&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''World-Cup-2018-Qualification,-UEFA'',
) | id:2342, name:World Cup 2018 Qualification, UEFA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Italian-Serie-A'',
) | id:734, name:Italian Serie A, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Italian-Serie-B'',
) | id:733, name:Italian Serie B, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=120&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Italian-Super-Cup'',
) | id:735, name:Italian Super Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Dutch-Eredivisie'',
) | id:823, name:Dutch Eredivisie, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Dutch-Eerste-Divisie'',
) | id:821, name:Dutch Eerste Divisie, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=140&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Dutch-KNVB-Cup'',
) | id:825, name:Dutch KNVB Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=142&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Northern-Irish-Premiership'',
) | id:839, name:Northern Irish Premiership, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=143&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''FIFA-Club-World-Cup'',
) | id:25218, name:FIFA Club World Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=151&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Polish-Ekstraklasa'',
) | id:868, name:Polish Ekstraklasa, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Portuguese-Primeira-Liga'',
) | id:880, name:Portuguese Primeira Liga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Portuguese-Liga-de-Honra'',
) | id:882, name:Portuguese Liga de Honra, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=152&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Portuguese-Cup'',
) | id:884, name:Portuguese Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=154&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Romanian-Liga-I'',
) | id:896, name:Romanian Liga I, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=154&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Romanian-Cup'',
) | id:893, name:Romanian Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Scottish-Premiership'',
) | id:929, name:Scottish Premiership, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Scottish-Championship'',
) | id:927, name:Scottish Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Scottish-League-One'',
) | id:931, name:Scottish League One, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Scottish-League-Two'',
) | id:932, name:Scottish League Two, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=158&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Scottish-FA-Cup'',
) | id:930, name:Scottish FA Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=159&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Serbian-SuperLiga'',
) | id:936, name:Serbian SuperLiga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=165&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''UEFA-Champions-League'',
) | id:25230, name:UEFA Champions League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=165&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''UEFA-Europa-League'',
) | id:25231, name:UEFA Europa League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Spanish-La-Liga'',
) | id:971, name:Spanish La Liga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Spanish-Copa-del-Rey'',
) | id:967, name:Spanish Copa del Rey, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=166&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Spanish-Segunda-Division'',
) | id:974, name:Spanish Segunda Division, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=175&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Turkish-Super-Lig'',
) | id:1018, name:Turkish Super Lig, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=175&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Turkish-Cup'',
) | id:1021, name:Turkish Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tata-Open'',
) | id:32722, name:Tata Open, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''USPGA-Championship'',
) | id:25983, name:USPGA Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''US-Masters'',
) | id:1245, name:US Masters, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''US-Open'',
) | id:1247, name:US Open, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''The-Open-Championship'',
) | id:13303, name:The Open Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ryder-Cup'',
) | id:1200, name:Ryder Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Golf-Major-Specials'',
) | id:29356, name:Golf Major Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''PGA-Money-List'',
) | id:1185, name:PGA Money List, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Race-To-Dubai'',
) | id:29005, name:Race To Dubai, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=195&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Player-Specials'',
) | id:1187, name:Player Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=196&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Golf-New-Year-Specials'',
) | id:1267, name:Golf New Year Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Henlow'',
) | id:1864, name:Henlow, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Notts-(Dogs)'',
) | id:26746, name:Notts (Dogs), Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=198&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ante-Post-Races'',
) | id:4236, name:Ante-Post Races, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=201&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''BAGS-Track-Championship-Specials'',
) | id:31482, name:BAGS Track Championship Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=207&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''French-D1-Men\''s'',
) | id:1284, name:French D1 Men''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=219&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Swedish-Elitserien-Men\''s'',
) | id:1325, name:Swedish Elitserien Men''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Royal-Ascot'',
) | id:1966, name:Royal Ascot, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Chantilly'',
) | id:4227, name:Chantilly, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Aintree'',
) | id:1892, name:Aintree, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Ascot'',
) | id:1894, name:Ascot, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Cheltenham'',
) | id:1908, name:Cheltenham, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Chepstow'',
) | id:1909, name:Chepstow, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Epsom-Downs'',
) | id:6753, name:Epsom Downs, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Kempton'',
) | id:1941, name:Kempton, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Lingfield'',
) | id:1945, name:Lingfield, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Newmarket'',
) | id:1955, name:Newmarket, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Leopardstown'',
) | id:2035, name:Leopardstown, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Churchill-Downs'',
) | id:2480, name:Churchill Downs, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=223&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Vaal-(RSA)'',
) | id:5361, name:Vaal (RSA), Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=226&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Racing-Specials'',
) | id:2509, name:Racing Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=230&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Czech-Extraliga'',
) | id:1333, name:Czech Extraliga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=233&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Finnish-Liiga'',
) | id:1351, name:Finnish Liiga, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=235&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''German-DEL'',
) | id:1355, name:German DEL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=236&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Euro-Hockey-Tour'',
) | id:26668, name:Euro Hockey Tour, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=241&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Russian-KHL'',
) | id:1372, name:Russian KHL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=241&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Russian-MHL'',
) | id:26575, name:Russian MHL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=243&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Swedish-SHL'',
) | id:1385, name:Swedish SHL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=244&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Swiss-NLA'',
) | id:1388, name:Swiss NLA, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=245&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''NHL'',
) | id:1392, name:NHL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=245&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''AHL'',
) | id:1390, name:AHL, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=246&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''MotoGP-World-Championship'',
) | id:1430, name:MotoGP World Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=247&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''World-Championship'',
) | id:1464, name:World Championship, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=254&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''IPA-Pool-World-Championships'',
) | id:29196, name:IPA Pool World Championships, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=256&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Super-League'',
) | id:1485, name:Super League, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=256&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Challenge-Cup'',
) | id:1478, name:Challenge Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''RBS-6-Nations-2017'',
) | id:27225, name:RBS 6 Nations 2017, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''ER-Champions-Cup'',
) | id:25439, name:ER Champions Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''ER-Challenge-Cup'',
) | id:26362, name:ER Challenge Cup, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Aviva-Premiership'',
) | id:1493, name:Aviva Premiership, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Guinness-PRO12'',
) | id:1510, name:Guinness PRO12, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Top-14'',
) | id:1514, name:Top 14, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Super-18'',
) | id:1513, name:Super 18, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''British-and-Irish-Lions-Tour'',
) | id:2703, name:British and Irish Lions Tour, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Specials'',
) | id:21006, name:Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=259&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''World-Cup-2019'',
) | id:28866, name:World Cup 2019, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=261&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''The-Masters'',
) | id:25488, name:The Masters, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=265&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''FIM-Speedway-Grand-Prix'',
) | id:1558, name:FIM Speedway Grand Prix, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=267&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Tennis-New-Year-Specials'',
) | id:1713, name:Tennis New Year Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=268&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''MMA-UFC'',
) | id:2636, name:MMA-UFC, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=270&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Czech-Extraliga-Men\''s'',
) | id:1717, name:Czech Extraliga Men''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=276&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Champions-League-Women\''s'',
) | id:1743, name:Champions League Women''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=277&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Italy-Cup-A1-Women\''s'',
) | id:2240, name:Italy Cup A1 Women''s, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=475&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Host-2024'',
) | id:2251, name:Host 2024, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=520&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Various-Christmas-Specials'',
) | id:17598, name:Various Christmas Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=301&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''UK-Politics'',
) | id:1828, name:UK Politics, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=301&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''General-Election'',
) | id:28624, name:General Election, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=263&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Royal-Specials'',
) | id:2730, name:Royal Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=294&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Next-James-Bond'',
) | id:29225, name:Next James Bond, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=305&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''The-Voice-UK'',
) | id:2935, name:The Voice UK, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=305&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Strictly-Come-Dancing'',
) | id:1844, name:Strictly Come Dancing, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=307&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Sports-Personality-of-the-Year'',
) | id:1851, name:Sports Personality of the Year, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=517&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''V15'',
) | id:14471, name:V15, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''49s-Lunchtime-6-Ball-Draw'',
) | id:26353, name:49s Lunchtime 6 Ball Draw, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''49s-Lunchtime-Bonus-Ball'',
) | id:26354, name:49s Lunchtime Bonus Ball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''49s-Teatime-6-Ball-Draw'',
) | id:26355, name:49s Teatime 6 Ball Draw, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=594&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''49s-Teatime-Bonus-Ball'',
) | id:26356, name:49s Teatime Bonus Ball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=593&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Irish-Lotto-Main-6-Ball-Draw'',
) | id:26312, name:Irish Lotto Main 6 Ball Draw, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=593&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Irish-Lotto-Main-Draw-Bonus-Ball'',
) | id:26313, name:Irish Lotto Main Draw Bonus Ball, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Premier-League-Specials'',
) | id:26698, name:Premier League Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Champions-League-Specials'',
) | id:18395, name:Champions League Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Transfer-Specials'',
) | id:8132, name:Transfer Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Manager-Specials'',
) | id:6963, name:Manager Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''World-Cup-Specials'',
) | id:19822, name:World Cup Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert
WRITABLEMETA [CATEGORY3] | [MANAGED] Unable to find an existing, persisted record: | Exception encountered whilst looking up entity: ONC\Partridge\Entity\Category3, feed request url: http://xmlfeeds.coral.co.uk/oxi/pub?template=getHierarchyByClass&class=67&dateFrom=2016-12-15 00:00:00, lookup map: array (
  ''type'' => ''NAME'',
), query params: array (
  ''canonicalised_name'' => ''Team-Specials'',
) | id:6961, name:Team Specials, Write mode [CREATE_CONCRETE_ONLY_AND_CREATE_MERGEABLE_IF_NON_EXISTENT]:Result: insert


[written] CATEGORY1: 33, CATEGORY2: 120, CATEGORY3: 169, 
[fetched] 75
[fetchedFail] 47
[transformed] CATEGORY1: 33, CATEGORY2: 120, CATEGORY3: 169, 
[managed] CATEGORY3: 3, 
[managedFail] CATEGORY1: 66, CATEGORY2: 240, CATEGORY3: 332, 

', '2016-12-14 08:42:16', '2016-12-14 08:42:16', NULL);
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (2, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-05-08 17:11:12', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-05-08 17:11:13', '2017-05-08 17:11:13', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (3, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-05-15 17:49:55', 0, 16, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-05-15 17:49:55', '2017-05-15 17:49:55', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (4, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-05-18 22:06:48', 0, 18, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-05-18 22:06:48', '2017-05-18 22:06:48', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (5, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-05-19 10:31:25', 0, 18, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-05-19 10:31:25', '2017-05-19 10:31:25', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (6, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-05-19 22:20:39', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-05-19 22:20:39', '2017-05-19 22:20:39', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (7, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-05-20 15:31:06', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-05-20 15:31:06', '2017-05-20 15:31:06', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (8, NULL, '''jobs:bulkResolverMarkets'' --env prod', '2017-05-20 15:31:07', 0, 20, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-05-20 15:31:07', '2017-05-20 15:31:07', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (9, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-05-20 17:27:33', 0, 18, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-05-20 17:27:33', '2017-05-20 17:27:33', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (10, NULL, '''jobs:bulkResolverMarkets'' --env prod', '2017-05-20 17:27:33', 0, 18, 4, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-05-20 17:27:34', '2017-05-20 17:27:34', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (11, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-05-29 19:09:14', 0, 18, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-05-29 19:09:14', '2017-05-29 19:09:14', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (12, NULL, '''jobs:rename'' --env prod -vv', '2017-05-29 19:09:15', 0, 18, 20, true, NULL, 'Matthews-iMac.local', '[ok] : 14
JOBMETA [rename] | [] | Applying for category1: UFC/MMA:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | Renamed 2017  Specials to 2017 Specials and added alias to 2017  Specials. Domain: ONC\Partridge\Entity\Category3, Cat1: Tennis:
JOBMETA [rename] | [] | Applying for category1: Formula 1:
JOBMETA [rename] | [] | Renamed Formula 1 to Motorsports and added alias to Formula 1. Domain: ONC\Partridge\Entity\Category1, Cat1: Motorsports:
JOBMETA [rename] | [] | ---- UFC/MMA ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | ---- Formula 1 ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [rename] | [] | ---- Motorsports ----:
JOBMETA [rename] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category1:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 1
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Betting for cat1: UFC/MMA: | []


[ok] RENAME: 14, 
[fail] RENAME: 1, 

', '2017-05-29 19:09:15', '2017-05-29 19:09:15', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (13, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-05-29 19:09:15', 0, 20, 275, true, NULL, 'Matthews-iMac.local', '[ok] : 18
JOBMETA [canonicalise] | [] | Running canonicalise over 33 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: UFC-MMA, domain: ONC\Partridge\Entity\Category1:
JOBMETA [canonicalise] | [] | Running canonicalise over 120 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Greyhounds---Live, domain: ONC\Partridge\Entity\Category2:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Greyhounds---Specials, domain: ONC\Partridge\Entity\Category2:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Horse-Racing---Live, domain: ONC\Partridge\Entity\Category2:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Horse-Racing---Specials, domain: ONC\Partridge\Entity\Category2:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: UFC-MMA, domain: ONC\Partridge\Entity\Category2:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Horse-Racing---Tote-Pools, domain: ONC\Partridge\Entity\Category2:
JOBMETA [canonicalise] | [] | Running canonicalise over 166 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: French-Open---Men''s-Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: French-Open---Women''s-Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: US-Open---Men''s-Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: US-Open---Women''s-Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Wimbledon---Men''s-Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Wimbledon---Ladies''-Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Euroleague-2016-17, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 18, 

', '2017-05-29 19:09:16', '2017-05-29 19:09:16', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (14, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-05-29 19:09:16', 0, 18, 69, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC/MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 13
JOBMETA [filteredCategories] | Could not find Category2 using name: Football England and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Football Scotland and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Football Spain and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: Champions League Specials and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: UEFA Champions League and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: UEFA Europa League and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: Racing Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: 2017 Specials and cat1 name: Tennis: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: MMA-UFC and cat1 name: UFC/MMA: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics UK and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 13, 

', '2017-05-29 19:09:16', '2017-05-29 19:09:16', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (25, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-05-30 17:33:41', 0, 22, 3, true, NULL, 'Matthews-iMac.local', '[ok] : 4
JOBMETA [canonicalise] | [] | Running canonicalise over 33 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 120 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 166 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 4, 

', '2017-05-30 17:33:42', '2017-05-30 17:33:42', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (77, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-08-21 20:37:06', 0, 22, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-08-21 20:37:06', '2017-08-21 20:37:06', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (15, NULL, '''jobs:alias'' --env prod -vv', '2017-05-29 19:09:17', 0, 18, 7, true, NULL, 'Matthews-iMac.local', '[ok] : 8
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | DB affected: partridge:

[fail] : 6
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Category2, name: Football England for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Match Result for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Match Result for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: First Goal Scorer for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: First Goal Scorer for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Outcome, name: Matt Phillips for cat1: Football: | []


[ok] ALIASING: 8, 
[fail] ALIASING: 6, 

', '2017-05-29 19:09:17', '2017-05-29 19:09:17', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (16, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-05-29 19:09:17', 0, 18, 26, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-05-29 19:09:17', '2017-05-29 19:09:17', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (17, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-05-29 19:14:05', 0, 18, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-05-29 19:14:05', '2017-05-29 19:14:05', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (18, NULL, '''jobs:rename'' --env prod -vv', '2017-05-29 19:14:05', 0, 18, 4, true, NULL, 'Matthews-iMac.local', '[ok] : 4
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Cat1 not found: UFC/MMA . This is a problem with the mapping and should be altered: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Category3, name: 2017  Specials for cat1: Tennis: | []
JOBMETA [rename] | Cat1 not found: Formula 1 . This is a problem with the mapping and should be altered: | []


[ok] RENAME: 4, 
[fail] RENAME: 3, 

', '2017-05-29 19:14:05', '2017-05-29 19:14:05', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (19, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-05-29 19:14:05', 0, 20, 18, true, NULL, 'Matthews-iMac.local', '[ok] : 4
JOBMETA [canonicalise] | [] | Running canonicalise over 33 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 120 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 166 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 4, 

', '2017-05-29 19:14:05', '2017-05-29 19:14:05', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (20, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-05-29 19:14:06', 0, 18, 33, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC/MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 13
JOBMETA [filteredCategories] | Could not find Category2 using name: Football England and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Football Scotland and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Football Spain and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: Champions League Specials and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: UEFA Champions League and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: UEFA Europa League and cat1 name: Football: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: Racing Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: 2017 Specials and cat1 name: Tennis: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: MMA-UFC and cat1 name: UFC/MMA: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics UK and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 13, 

', '2017-05-29 19:14:06', '2017-05-29 19:14:06', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (21, NULL, '''jobs:alias'' --env prod -vv', '2017-05-29 19:14:06', 0, 18, 7, true, NULL, 'Matthews-iMac.local', '[ok] : 8
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | DB affected: partridge:

[fail] : 6
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Category2, name: Football England for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Match Result for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Match Result for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: First Goal Scorer for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: First Goal Scorer for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Outcome, name: Matt Phillips for cat1: Football: | []


[ok] ALIASING: 8, 
[fail] ALIASING: 6, 

', '2017-05-29 19:14:06', '2017-05-29 19:14:06', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (22, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-05-29 19:14:06', 0, 18, 14, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-05-29 19:14:07', '2017-05-29 19:14:07', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (23, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-05-30 17:33:40', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-05-30 17:33:41', '2017-05-30 17:33:41', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (24, NULL, '''jobs:rename'' --env prod -vv', '2017-05-30 17:33:41', 0, 22, 4, true, NULL, 'Matthews-iMac.local', '[ok] : 4
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Cat1 not found: UFC/MMA . This is a problem with the mapping and should be altered: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Category3, name: 2017  Specials for cat1: Tennis: | []
JOBMETA [rename] | Cat1 not found: Formula 1 . This is a problem with the mapping and should be altered: | []


[ok] RENAME: 4, 
[fail] RENAME: 3, 

', '2017-05-30 17:33:41', '2017-05-30 17:33:41', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (120, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-09-07 10:04:22', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-09-07 10:04:23', '2017-09-07 10:04:23', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (26, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-05-30 17:33:42', 0, 22, 82, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC/MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 4
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: MMA-UFC and cat1 name: UFC/MMA: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 4, 

', '2017-05-30 17:33:43', '2017-05-30 17:33:43', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (27, NULL, '''jobs:alias'' --env prod -vv', '2017-05-30 17:33:43', 0, 22, 11, true, NULL, 'Matthews-iMac.local', '[ok] : 8
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | DB affected: partridge:

[fail] : 5
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Match Result for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Match Result for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: First Goal Scorer for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: First Goal Scorer for cat1: Football: | []
JOBMETA [aliasing] | Could not find managed record with domain: ONC\Partridge\Entity\Outcome, name: Matt Phillips for cat1: Football: | []


[ok] ALIASING: 8, 
[fail] ALIASING: 5, 

', '2017-05-30 17:33:43', '2017-05-30 17:33:43', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (28, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-05-30 17:33:44', 0, 20, 22, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-05-30 17:33:44', '2017-05-30 17:33:44', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (29, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-06-24 07:33:29', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-06-24 07:33:29', '2017-06-24 07:33:29', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (30, NULL, '''jobs:rename'' --env prod -vv', '2017-06-24 07:33:29', 0, 22, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 2
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Category3, name: 2017  Specials for cat1: Tennis: | []


[ok] RENAME: 7, 
[fail] RENAME: 2, 

', '2017-06-24 07:33:30', '2017-06-24 07:33:30', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (31, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-06-24 07:33:30', 0, 22, 90, true, NULL, 'Matthews-iMac.local', '[ok] : 28
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 1 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: England (TEST), domain: ONC\Partridge\Entity\Category2:
JOBMETA [canonicalise] | [] | Running canonicalise over 20 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Australian Open Men''s Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: NCAA Men''s, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Croatian 1. HNL, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: German 2. Bundesliga, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: German 3. Liga, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: World Cup 2018 Qualification, UEFA, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Notts (Dogs), domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: French D1 Men''s, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Swedish Elitserien Men''s, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Vaal (RSA), domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Czech Extraliga Men''s, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Champions League Women''s, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Italy Cup A1 Women''s, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Australian Open Women''s Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: French Open Men''s Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: French Open Women''s Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: US Open Men''s Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: US Open Women''s Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Wimbledon Men''s Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Entity found to have been affected. Name: Wimbledon Ladies'' Singles, domain: ONC\Partridge\Entity\Category3:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 28, 

', '2017-06-24 07:33:30', '2017-06-24 07:33:30', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (32, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-06-24 07:33:30', 0, 22, 51, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC/MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 4
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: MMA-UFC and cat1 name: UFC/MMA: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 4, 

', '2017-06-24 07:33:31', '2017-06-24 07:33:31', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (33, NULL, '''jobs:alias'' --env prod -vv', '2017-06-24 07:33:31', 0, 22, 29, true, NULL, 'Matthews-iMac.local', '[ok] : 17
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 17, 

', '2017-06-24 07:33:32', '2017-06-24 07:33:32', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (34, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-06-24 07:33:32', 0, 22, 26, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-06-24 07:33:32', '2017-06-24 07:33:32', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (35, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-06-24 07:33:33', 0, 22, 13, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Created offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-06-24 07:33:33', '2017-06-24 07:33:33', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (36, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-06-27 18:12:39', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-06-27 18:12:39', '2017-06-27 18:12:39', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (37, NULL, '''jobs:rename'' --env prod -vv', '2017-06-27 18:12:40', 0, 22, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 2
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Category3, name: 2017  Specials for cat1: Tennis: | []


[ok] RENAME: 7, 
[fail] RENAME: 2, 

', '2017-06-27 18:12:40', '2017-06-27 18:12:40', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (38, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-06-27 18:12:40', 0, 20, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-06-27 18:12:40', '2017-06-27 18:12:40', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (39, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-06-27 18:12:40', 0, 22, 51, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC/MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 4
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: MMA-UFC and cat1 name: UFC/MMA: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 4, 

', '2017-06-27 18:12:41', '2017-06-27 18:12:41', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (86, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-08-24 11:53:41', 0, 18, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-08-24 11:53:41', '2017-08-24 11:53:41', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (40, NULL, '''jobs:alias'' --env prod -vv', '2017-06-27 18:12:41', 0, 22, 29, true, NULL, 'Matthews-iMac.local', '[ok] : 17
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 17, 

', '2017-06-27 18:12:42', '2017-06-27 18:12:42', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (41, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-06-27 18:12:42', 0, 22, 22, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-06-27 18:12:42', '2017-06-27 18:12:42', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (42, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-06-27 18:12:42', 0, 22, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-06-27 18:12:43', '2017-06-27 18:12:43', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (43, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-07-25 11:50:38', 0, 22, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-07-25 11:50:38', '2017-07-25 11:50:38', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (44, NULL, '''jobs:rename'' --env prod -vv', '2017-07-25 11:50:38', 0, 24, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 2
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Category3, name: 2017  Specials for cat1: Tennis: | []


[ok] RENAME: 7, 
[fail] RENAME: 2, 

', '2017-07-25 11:50:38', '2017-07-25 11:50:38', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (45, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-07-25 11:50:38', 0, 22, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-07-25 11:50:39', '2017-07-25 11:50:39', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (46, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-07-25 11:50:39', 0, 24, 51, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC/MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 4
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: MMA-UFC and cat1 name: UFC/MMA: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 4, 

', '2017-07-25 11:50:39', '2017-07-25 11:50:39', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (94, NULL, '''jobs:dataIntegrityIdempotent'' --env prod -vv', '2017-08-25 08:49:00', 0, 22, 7, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredOutcomes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/aliasCategory1WithSameName.sql:


[ok] DATAINTEGRITYIDEMPOTENT: 7, 

', '2017-08-25 08:49:00', '2017-08-25 08:49:00', 'dataIntegrityIdempotent');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (47, NULL, '''jobs:alias'' --env prod -vv', '2017-07-25 11:50:40', 0, 24, 29, true, NULL, 'Matthews-iMac.local', '[ok] : 17
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 17, 

', '2017-07-25 11:50:40', '2017-07-25 11:50:40', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (48, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-07-25 11:50:40', 0, 22, 26, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-07-25 11:50:41', '2017-07-25 11:50:41', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (49, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-07-25 11:50:41', 0, 24, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-07-25 11:50:41', '2017-07-25 11:50:41', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (50, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-08-11 19:47:51', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-08-11 19:47:51', '2017-08-11 19:47:51', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (51, NULL, '''jobs:rename'' --env prod -vv', '2017-08-11 19:47:51', 0, 20, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 10
JOBMETA [rename] | [] | Applying for category1: Football:
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | ---- Football ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Premier League Outright for cat1: Football: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Category3, name: 2017  Specials for cat1: Tennis: | []


[ok] RENAME: 10, 
[fail] RENAME: 3, 

', '2017-08-11 19:47:51', '2017-08-11 19:47:51', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (52, NULL, '''jobs:dataIntegrityIdempotent'' --env prod -vv', '2017-08-11 19:47:51', 0, 18, 4, true, NULL, 'Matthews-iMac.local', '[ok] : 4
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredOutcomes.sql:


[ok] DATAINTEGRITYIDEMPOTENT: 4, 

', '2017-08-11 19:47:52', '2017-08-11 19:47:52', 'dataIntegrityIdempotent');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (53, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-08-11 19:47:52', 0, 18, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-08-11 19:47:52', '2017-08-11 19:47:52', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (54, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-08-11 19:47:52', 0, 20, 48, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC/MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 4
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: MMA-UFC and cat1 name: UFC/MMA: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 4, 

', '2017-08-11 19:47:52', '2017-08-11 19:47:52', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (55, NULL, '''jobs:alias'' --env prod -vv', '2017-08-11 19:47:52', 0, 20, 29, true, NULL, 'Matthews-iMac.local', '[ok] : 17
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 17, 

', '2017-08-11 19:47:53', '2017-08-11 19:47:53', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (56, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-08-11 19:47:53', 0, 20, 23, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-08-11 19:47:53', '2017-08-11 19:47:53', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (57, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-08-11 19:47:53', 0, 20, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-08-11 19:47:53', '2017-08-11 19:47:53', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (58, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-08-14 17:18:34', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-08-14 17:18:34', '2017-08-14 17:18:34', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (59, NULL, '''jobs:rename'' --env prod -vv', '2017-08-14 17:18:34', 0, 20, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 10
JOBMETA [rename] | [] | Applying for category1: Football:
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | ---- Football ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Premier League Outright for cat1: Football: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Category3, name: 2017  Specials for cat1: Tennis: | []


[ok] RENAME: 10, 
[fail] RENAME: 3, 

', '2017-08-14 17:18:34', '2017-08-14 17:18:34', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (60, NULL, '''jobs:dataIntegrityIdempotent'' --env prod -vv', '2017-08-14 17:18:34', 0, 18, 5, true, NULL, 'Matthews-iMac.local', '[ok] : 5
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredOutcomes.sql:


[ok] DATAINTEGRITYIDEMPOTENT: 5, 

', '2017-08-14 17:18:34', '2017-08-14 17:18:34', 'dataIntegrityIdempotent');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (61, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-08-14 17:18:35', 0, 18, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-08-14 17:18:35', '2017-08-14 17:18:35', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (62, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-08-14 17:18:35', 0, 20, 48, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC/MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 4
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category3 using name: MMA-UFC and cat1 name: UFC/MMA: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 4, 

', '2017-08-14 17:18:35', '2017-08-14 17:18:35', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (63, NULL, '''jobs:alias'' --env prod -vv', '2017-08-14 17:18:35', 0, 20, 30, true, NULL, 'Matthews-iMac.local', '[ok] : 17
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | DB affected: partridge:

[fail] : 1
JOBMETA [aliasing] | Cat1 not found: UFC/MMA . This is a problem with the mapping and should be altered: | []


[ok] ALIASING: 17, 
[fail] ALIASING: 1, 

', '2017-08-14 17:18:36', '2017-08-14 17:18:36', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (64, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-08-14 17:18:36', 0, 20, 23, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-08-14 17:18:36', '2017-08-14 17:18:36', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (65, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-08-14 17:18:36', 0, 20, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-08-14 17:18:36', '2017-08-14 17:18:36', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (66, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-08-19 16:23:23', 0, 22, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-08-19 16:23:23', '2017-08-19 16:23:23', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (67, NULL, '''jobs:rename'' --env prod -vv', '2017-08-19 16:23:23', 0, 24, 12, true, NULL, 'Matthews-iMac.local', '[ok] : 14
JOBMETA [rename] | [] | Applying for category1: Football:
JOBMETA [rename] | [] | Applying for category1: UFC MMA:
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | Renamed 2017 Specials to 2017 Specials and added alias to 2017 Specials. Domain: ONC\Partridge\Entity\Category3, Cat1: Tennis:
JOBMETA [rename] | [] | ---- Football ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- UFC MMA ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Premier League Outright for cat1: Football: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Betting for cat1: UFC MMA: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []


[ok] RENAME: 14, 
[fail] RENAME: 3, 

', '2017-08-19 16:23:23', '2017-08-19 16:23:23', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (68, NULL, '''jobs:dataIntegrityIdempotent'' --env prod -vv', '2017-08-19 16:23:24', 0, 22, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 6
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredOutcomes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/aliasCategory1WithSameName.sql:


[ok] DATAINTEGRITYIDEMPOTENT: 6, 

', '2017-08-19 16:23:24', '2017-08-19 16:23:24', 'dataIntegrityIdempotent');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (69, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-08-19 16:23:24', 0, 22, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-08-19 16:23:24', '2017-08-19 16:23:24', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (95, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-08-25 08:49:01', 0, 22, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-08-25 08:49:01', '2017-08-25 08:49:01', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (128, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-09-07 10:04:28', 0, 20, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-09-07 10:04:28', '2017-09-07 10:04:28', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (70, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-08-19 16:23:24', 0, 24, 56, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 3
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 3, 

', '2017-08-19 16:23:25', '2017-08-19 16:23:25', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (71, NULL, '''jobs:alias'' --env prod -vv', '2017-08-19 16:23:25', 0, 24, 39, true, NULL, 'Matthews-iMac.local', '[ok] : 23
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | Applying for category1: UFC MMA:
JOBMETA [aliasing] | [] | Applying for category1: Politics:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- UFC MMA ----:
JOBMETA [aliasing] | [] | ---- Politics ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 23, 

', '2017-08-19 16:23:26', '2017-08-19 16:23:26', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (72, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-08-19 16:23:26', 0, 22, 29, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-08-19 16:23:26', '2017-08-19 16:23:26', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (73, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-08-19 16:23:26', 0, 24, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-08-19 16:23:26', '2017-08-19 16:23:26', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (74, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-08-21 20:37:04', 0, 22, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-08-21 20:37:04', '2017-08-21 20:37:04', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (75, NULL, '''jobs:rename'' --env prod -vv', '2017-08-21 20:37:05', 0, 24, 12, true, NULL, 'Matthews-iMac.local', '[ok] : 14
JOBMETA [rename] | [] | Applying for category1: Football:
JOBMETA [rename] | [] | Applying for category1: UFC MMA:
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | Renamed 2017 Specials to 2017 Specials and added alias to 2017 Specials. Domain: ONC\Partridge\Entity\Category3, Cat1: Tennis:
JOBMETA [rename] | [] | ---- Football ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- UFC MMA ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Premier League Outright for cat1: Football: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Betting for cat1: UFC MMA: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []


[ok] RENAME: 14, 
[fail] RENAME: 3, 

', '2017-08-21 20:37:05', '2017-08-21 20:37:05', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (76, NULL, '''jobs:dataIntegrityIdempotent'' --env prod -vv', '2017-08-21 20:37:05', 0, 22, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredEvents.sql:


[ok] DATAINTEGRITYIDEMPOTENT: 1, 

', '2017-08-21 20:37:05', '2017-08-21 20:37:05', 'dataIntegrityIdempotent');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (129, NULL, '''jobs:dataExpired'' --cmd-criteria=''clear:1'' --env prod', '2017-09-07 10:04:29', 0, 18, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [dataExpired] | [] | Clearing all expired status''s:
JOBMETA [dataExpired] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:


[ok] DATAEXPIRED: 2, 

', '2017-09-07 10:04:29', '2017-09-07 10:04:29', 'dataExpired');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (78, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-08-21 20:37:06', 0, 24, 51, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 3
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 3, 

', '2017-08-21 20:37:06', '2017-08-21 20:37:06', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (79, NULL, '''jobs:alias'' --env prod -vv', '2017-08-21 20:37:07', 0, 24, 39, true, NULL, 'Matthews-iMac.local', '[ok] : 23
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | Applying for category1: UFC MMA:
JOBMETA [aliasing] | [] | Applying for category1: Politics:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- UFC MMA ----:
JOBMETA [aliasing] | [] | ---- Politics ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 23, 

', '2017-08-21 20:37:07', '2017-08-21 20:37:07', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (80, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-08-21 20:37:07', 0, 22, 25, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-08-21 20:37:08', '2017-08-21 20:37:08', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (81, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-08-21 20:37:08', 0, 24, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-08-21 20:37:08', '2017-08-21 20:37:08', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (82, NULL, '''jobs:dataExpired'' --cmd-criteria=''clear:1'' --env prod', '2017-08-21 20:37:08', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [dataExpired] | [] | Clearing all expired status''s:
JOBMETA [dataExpired] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:


[ok] DATAEXPIRED: 2, 

', '2017-08-21 20:37:09', '2017-08-21 20:37:09', 'dataExpired');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (83, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-08-24 11:53:40', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-08-24 11:53:40', '2017-08-24 11:53:40', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (84, NULL, '''jobs:rename'' --env prod -vv', '2017-08-24 11:53:41', 0, 20, 12, true, NULL, 'Matthews-iMac.local', '[ok] : 14
JOBMETA [rename] | [] | Applying for category1: Football:
JOBMETA [rename] | [] | Applying for category1: UFC MMA:
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | Renamed 2017 Specials to 2017 Specials and added alias to 2017 Specials. Domain: ONC\Partridge\Entity\Category3, Cat1: Tennis:
JOBMETA [rename] | [] | ---- Football ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- UFC MMA ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Premier League Outright for cat1: Football: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Betting for cat1: UFC MMA: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []


[ok] RENAME: 14, 
[fail] RENAME: 3, 

', '2017-08-24 11:53:41', '2017-08-24 11:53:41', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (85, NULL, '''jobs:dataIntegrityIdempotent'' --env prod -vv', '2017-08-24 11:53:41', 0, 18, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredEvents.sql:


[ok] DATAINTEGRITYIDEMPOTENT: 1, 

', '2017-08-24 11:53:41', '2017-08-24 11:53:41', 'dataIntegrityIdempotent');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (87, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-08-24 11:53:42', 0, 20, 51, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 3
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 3, 

', '2017-08-24 11:53:42', '2017-08-24 11:53:42', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (88, NULL, '''jobs:alias'' --env prod -vv', '2017-08-24 11:53:42', 0, 20, 39, true, NULL, 'Matthews-iMac.local', '[ok] : 23
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | Applying for category1: UFC MMA:
JOBMETA [aliasing] | [] | Applying for category1: Politics:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- UFC MMA ----:
JOBMETA [aliasing] | [] | ---- Politics ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 23, 

', '2017-08-24 11:53:43', '2017-08-24 11:53:43', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (89, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-08-24 11:53:43', 0, 20, 25, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-08-24 11:53:43', '2017-08-24 11:53:43', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (90, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-08-24 11:53:43', 0, 20, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-08-24 11:53:43', '2017-08-24 11:53:43', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (91, NULL, '''jobs:dataExpired'' --cmd-criteria=''clear:1'' --env prod', '2017-08-24 11:53:44', 0, 18, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [dataExpired] | [] | Clearing all expired status''s:
JOBMETA [dataExpired] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:


[ok] DATAEXPIRED: 2, 

', '2017-08-24 11:53:44', '2017-08-24 11:53:44', 'dataExpired');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (92, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-08-25 08:49:00', 0, 22, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-08-25 08:49:00', '2017-08-25 08:49:00', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (93, NULL, '''jobs:rename'' --env prod -vv', '2017-08-25 08:49:00', 0, 24, 12, true, NULL, 'Matthews-iMac.local', '[ok] : 14
JOBMETA [rename] | [] | Applying for category1: Football:
JOBMETA [rename] | [] | Applying for category1: UFC MMA:
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | Renamed 2017 Specials to 2017 Specials and added alias to 2017 Specials. Domain: ONC\Partridge\Entity\Category3, Cat1: Tennis:
JOBMETA [rename] | [] | ---- Football ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- UFC MMA ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Premier League Outright for cat1: Football: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Betting for cat1: UFC MMA: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []


[ok] RENAME: 14, 
[fail] RENAME: 3, 

', '2017-08-25 08:49:00', '2017-08-25 08:49:00', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (130, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-09-07 10:31:22', 0, 22, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-09-07 10:31:22', '2017-09-07 10:31:22', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (96, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-08-25 08:49:01', 0, 24, 51, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 3
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 3, 

', '2017-08-25 08:49:01', '2017-08-25 08:49:01', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (97, NULL, '''jobs:alias'' --env prod -vv', '2017-08-25 08:49:02', 0, 24, 39, true, NULL, 'Matthews-iMac.local', '[ok] : 23
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | Applying for category1: UFC MMA:
JOBMETA [aliasing] | [] | Applying for category1: Politics:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- UFC MMA ----:
JOBMETA [aliasing] | [] | ---- Politics ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 23, 

', '2017-08-25 08:49:02', '2017-08-25 08:49:02', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (98, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-08-25 08:49:02', 0, 22, 25, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-08-25 08:49:02', '2017-08-25 08:49:02', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (99, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-08-25 08:49:03', 0, 24, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-08-25 08:49:03', '2017-08-25 08:49:03', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (100, NULL, '''jobs:dataExpired'' --cmd-criteria=''clear:1'' --env prod', '2017-08-25 08:49:03', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [dataExpired] | [] | Clearing all expired status''s:
JOBMETA [dataExpired] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:


[ok] DATAEXPIRED: 2, 

', '2017-08-25 08:49:03', '2017-08-25 08:49:03', 'dataExpired');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (101, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-08-25 09:18:14', 0, 22, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-08-25 09:18:14', '2017-08-25 09:18:14', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (102, NULL, '''jobs:rename'' --env prod -vv', '2017-08-25 09:18:14', 0, 24, 12, true, NULL, 'Matthews-iMac.local', '[ok] : 14
JOBMETA [rename] | [] | Applying for category1: Football:
JOBMETA [rename] | [] | Applying for category1: UFC MMA:
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | Renamed 2017 Specials to 2017 Specials and added alias to 2017 Specials. Domain: ONC\Partridge\Entity\Category3, Cat1: Tennis:
JOBMETA [rename] | [] | ---- Football ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- UFC MMA ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Premier League Outright for cat1: Football: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Betting for cat1: UFC MMA: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []


[ok] RENAME: 14, 
[fail] RENAME: 3, 

', '2017-08-25 09:18:15', '2017-08-25 09:18:15', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (138, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-09-07 10:31:28', 0, 24, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-09-07 10:31:28', '2017-09-07 10:31:28', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (103, NULL, '''jobs:dataIntegrityIdempotent'' --env prod -vv', '2017-08-25 09:18:15', 0, 22, 7, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredOutcomes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/aliasCategory1WithSameName.sql:


[ok] DATAINTEGRITYIDEMPOTENT: 7, 

', '2017-08-25 09:18:15', '2017-08-25 09:18:15', 'dataIntegrityIdempotent');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (104, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-08-25 09:18:15', 0, 22, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-08-25 09:18:15', '2017-08-25 09:18:15', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (105, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-08-25 09:18:16', 0, 24, 51, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 3
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 3, 

', '2017-08-25 09:18:16', '2017-08-25 09:18:16', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (106, NULL, '''jobs:alias'' --env prod -vv', '2017-08-25 09:18:16', 0, 24, 39, true, NULL, 'Matthews-iMac.local', '[ok] : 23
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | Applying for category1: UFC MMA:
JOBMETA [aliasing] | [] | Applying for category1: Politics:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- UFC MMA ----:
JOBMETA [aliasing] | [] | ---- Politics ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 23, 

', '2017-08-25 09:18:17', '2017-08-25 09:18:17', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (107, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-08-25 09:18:17', 0, 22, 25, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-08-25 09:18:17', '2017-08-25 09:18:17', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (108, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-08-25 09:18:17', 0, 24, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-08-25 09:18:18', '2017-08-25 09:18:18', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (109, NULL, '''jobs:dataExpired'' --cmd-criteria=''clear:1'' --env prod', '2017-08-25 09:18:18', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [dataExpired] | [] | Clearing all expired status''s:
JOBMETA [dataExpired] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:


[ok] DATAEXPIRED: 2, 

', '2017-08-25 09:18:18', '2017-08-25 09:18:18', 'dataExpired');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (110, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-08-31 21:23:33', 0, 22, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-08-31 21:23:33', '2017-08-31 21:23:33', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (139, NULL, '''jobs:dataExpired'' --cmd-criteria=''clear:1'' --env prod', '2017-09-07 10:31:28', 0, 22, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [dataExpired] | [] | Clearing all expired status''s:
JOBMETA [dataExpired] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:


[ok] DATAEXPIRED: 2, 

', '2017-09-07 10:31:28', '2017-09-07 10:31:28', 'dataExpired');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (111, NULL, '''jobs:rename'' --env prod -vv', '2017-08-31 21:23:34', 0, 24, 12, true, NULL, 'Matthews-iMac.local', '[ok] : 14
JOBMETA [rename] | [] | Applying for category1: Football:
JOBMETA [rename] | [] | Applying for category1: UFC MMA:
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | Renamed 2017 Specials to 2017 Specials and added alias to 2017 Specials. Domain: ONC\Partridge\Entity\Category3, Cat1: Tennis:
JOBMETA [rename] | [] | ---- Football ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- UFC MMA ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Premier League Outright for cat1: Football: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Betting for cat1: UFC MMA: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []


[ok] RENAME: 14, 
[fail] RENAME: 3, 

', '2017-08-31 21:23:34', '2017-08-31 21:23:34', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (112, NULL, '''jobs:createCategories'' --env prod -vv', '2017-08-31 21:23:34', 0, 24, 7, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [createCategories] | [] | Added a new ent for domain: ONC\Partridge\Entity\Category3, name: World Championship:


[ok] CREATECATEGORIES: 1, 

', '2017-08-31 21:23:34', '2017-08-31 21:23:34', 'createCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (113, NULL, '''jobs:dataIntegrityIdempotent'' --env prod -vv', '2017-08-31 21:23:35', 0, 22, 7, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredOutcomes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/aliasCategory1WithSameName.sql:


[ok] DATAINTEGRITYIDEMPOTENT: 7, 

', '2017-08-31 21:23:35', '2017-08-31 21:23:35', 'dataIntegrityIdempotent');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (114, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-08-31 21:23:35', 0, 22, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-08-31 21:23:35', '2017-08-31 21:23:35', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (115, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-08-31 21:23:35', 0, 24, 51, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 3
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 3, 

', '2017-08-31 21:23:36', '2017-08-31 21:23:36', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (116, NULL, '''jobs:alias'' --env prod -vv', '2017-08-31 21:23:36', 0, 24, 45, true, NULL, 'Matthews-iMac.local', '[ok] : 26
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | Applying for category1: UFC MMA:
JOBMETA [aliasing] | [] | Applying for category1: Politics:
JOBMETA [aliasing] | [] | Applying for category1: Motorsports:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- UFC MMA ----:
JOBMETA [aliasing] | [] | ---- Politics ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Motorsports ----:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 26, 

', '2017-08-31 21:23:36', '2017-08-31 21:23:36', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (117, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-08-31 21:23:37', 0, 22, 25, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-08-31 21:23:37', '2017-08-31 21:23:37', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (118, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-08-31 21:23:37', 0, 24, 8, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-08-31 21:23:37', '2017-08-31 21:23:37', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (119, NULL, '''jobs:dataExpired'' --cmd-criteria=''clear:1'' --env prod', '2017-08-31 21:23:37', 0, 20, 1, true, NULL, 'Matthews-iMac.local', '[ok] : 2
JOBMETA [dataExpired] | [] | Clearing all expired status''s:
JOBMETA [dataExpired] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:


[ok] DATAEXPIRED: 2, 

', '2017-08-31 21:23:37', '2017-08-31 21:23:37', 'dataExpired');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (121, NULL, '''jobs:rename'' --env prod -vv', '2017-09-07 10:04:23', 0, 20, 12, true, NULL, 'Matthews-iMac.local', '[ok] : 14
JOBMETA [rename] | [] | Applying for category1: Football:
JOBMETA [rename] | [] | Applying for category1: UFC MMA:
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | Renamed 2017 Specials to 2017 Specials and added alias to 2017 Specials. Domain: ONC\Partridge\Entity\Category3, Cat1: Tennis:
JOBMETA [rename] | [] | ---- Football ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- UFC MMA ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Premier League Outright for cat1: Football: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Betting for cat1: UFC MMA: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []


[ok] RENAME: 14, 
[fail] RENAME: 3, 

', '2017-09-07 10:04:23', '2017-09-07 10:04:23', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (122, NULL, '''jobs:createCategories'' --env prod -vv', '2017-09-07 10:04:23', 0, 20, 5, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [createCategories] | [] | Not adding new cat as already exists for domain: ONC\Partridge\Entity\Category3, name: World Championship:


[ok] CREATECATEGORIES: 1, 

', '2017-09-07 10:04:23', '2017-09-07 10:04:23', 'createCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (123, NULL, '''jobs:dataIntegrityIdempotent'' --env prod -vv', '2017-09-07 10:04:24', 2, 18, 3, true, NULL, 'Matthews-iMac.local', '[ok] : 15
JOBMETA [dataIntegrityIdempotent] | [] | Dropping ''alias_query'' matview:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/bookieOutcomesWithoutMeta.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/bookieMarketsWithoutMeta.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/bookieEventsWithoutMeta.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/outcomesWithoutConcretes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/marketsWithoutConcretes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/eventsWithoutConcretes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredOutcomes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/aliasCategory1WithSameName.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Recreating ''alias_query'' matview:


[ok] DATAINTEGRITYIDEMPOTENT: 15, 

', '2017-09-07 10:04:26', '2017-09-07 10:04:26', 'dataIntegrityIdempotent');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (124, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-09-07 10:04:26', 0, 18, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-09-07 10:04:26', '2017-09-07 10:04:26', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (125, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-09-07 10:04:27', 0, 22, 51, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 3
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 3, 

', '2017-09-07 10:04:27', '2017-09-07 10:04:27', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (126, NULL, '''jobs:alias'' --env prod -vv', '2017-09-07 10:04:27', 0, 20, 43, true, NULL, 'Matthews-iMac.local', '[ok] : 27
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | Applying for category1: UFC MMA:
JOBMETA [aliasing] | [] | Applying for category1: Politics:
JOBMETA [aliasing] | [] | Applying for category1: Motorsports:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- UFC MMA ----:
JOBMETA [aliasing] | [] | ---- Politics ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Motorsports ----:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 27, 

', '2017-09-07 10:04:28', '2017-09-07 10:04:28', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (127, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-09-07 10:04:28', 0, 20, 25, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-09-07 10:04:28', '2017-09-07 10:04:28', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (131, NULL, '''jobs:rename'' --env prod -vv', '2017-09-07 10:31:22', 0, 24, 12, true, NULL, 'Matthews-iMac.local', '[ok] : 14
JOBMETA [rename] | [] | Applying for category1: Football:
JOBMETA [rename] | [] | Applying for category1: UFC MMA:
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | Renamed 2017 Specials to 2017 Specials and added alias to 2017 Specials. Domain: ONC\Partridge\Entity\Category3, Cat1: Tennis:
JOBMETA [rename] | [] | ---- Football ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- UFC MMA ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Premier League Outright for cat1: Football: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Betting for cat1: UFC MMA: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []


[ok] RENAME: 14, 
[fail] RENAME: 3, 

', '2017-09-07 10:31:22', '2017-09-07 10:31:22', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (132, NULL, '''jobs:createCategories'' --env prod -vv', '2017-09-07 10:31:22', 0, 24, 5, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [createCategories] | [] | Not adding new cat as already exists for domain: ONC\Partridge\Entity\Category3, name: World Championship:


[ok] CREATECATEGORIES: 1, 

', '2017-09-07 10:31:23', '2017-09-07 10:31:23', 'createCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (133, NULL, '''jobs:dataIntegrityIdempotent'' --env prod -vv', '2017-09-07 10:31:23', 2, 22, 3, true, NULL, 'Matthews-iMac.local', '[ok] : 15
JOBMETA [dataIntegrityIdempotent] | [] | Dropping ''alias_query'' matview:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/bookieOutcomesWithoutMeta.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/bookieMarketsWithoutMeta.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/bookieEventsWithoutMeta.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/outcomesWithoutConcretes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/marketsWithoutConcretes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/eventsWithoutConcretes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredOutcomes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/aliasCategory1WithSameName.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Recreating ''alias_query'' matview:


[ok] DATAINTEGRITYIDEMPOTENT: 15, 

', '2017-09-07 10:31:25', '2017-09-07 10:31:25', 'dataIntegrityIdempotent');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (134, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-09-07 10:31:25', 0, 22, 6, true, NULL, 'Matthews-iMac.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-09-07 10:31:26', '2017-09-07 10:31:26', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (135, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-09-07 10:31:26', 0, 24, 51, true, NULL, 'Matthews-iMac.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 3
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 3, 

', '2017-09-07 10:31:26', '2017-09-07 10:31:26', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (136, NULL, '''jobs:alias'' --env prod -vv', '2017-09-07 10:31:26', 0, 24, 43, true, NULL, 'Matthews-iMac.local', '[ok] : 27
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | Applying for category1: UFC MMA:
JOBMETA [aliasing] | [] | Applying for category1: Politics:
JOBMETA [aliasing] | [] | Applying for category1: Motorsports:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- UFC MMA ----:
JOBMETA [aliasing] | [] | ---- Politics ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Motorsports ----:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 27, 

', '2017-09-07 10:31:27', '2017-09-07 10:31:27', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (137, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-09-07 10:31:27', 0, 22, 25, true, NULL, 'Matthews-iMac.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/matt/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-09-07 10:31:27', '2017-09-07 10:31:27', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (140, NULL, '''jobs:outcomeToMediaRelations'' --env prod', '2017-11-08 19:58:25', 0, 22, 1, true, NULL, 'matts-MacBook-Pro.local', '[ok] : 2
JOBMETA [outcomesToMediaRelations] | [] | Media with context logo that has no gallery: :0
JOBMETA [outcomesToMediaRelations] | [] | All done:0/0


[ok] OUTCOMESTOMEDIARELATIONS: 2, 

', '2017-11-08 19:58:25', '2017-11-08 19:58:25', 'outcomesToMediaRelations');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (141, NULL, '''jobs:rename'' --env prod -vv', '2017-11-08 19:58:25', 0, 24, 12, true, NULL, 'matts-MacBook-Pro.local', '[ok] : 14
JOBMETA [rename] | [] | Applying for category1: Football:
JOBMETA [rename] | [] | Applying for category1: UFC MMA:
JOBMETA [rename] | [] | Applying for category1: Boxing:
JOBMETA [rename] | [] | Applying for category1: Tennis:
JOBMETA [rename] | [] | Renamed 2017 Specials to 2017 Specials and added alias to 2017 Specials. Domain: ONC\Partridge\Entity\Category3, Cat1: Tennis:
JOBMETA [rename] | [] | ---- Football ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- UFC MMA ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Boxing ----:
JOBMETA [rename] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [rename] | [] | ---- Tennis ----:
JOBMETA [rename] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category3:
JOBMETA [rename] | [] | DB affected: partridge:

[fail] : 3
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Premier League Outright for cat1: Football: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Betting for cat1: UFC MMA: | []
JOBMETA [rename] | Could not find managed record with domain: ONC\Partridge\Entity\Market, name: Fight Outright for cat1: Boxing: | []


[ok] RENAME: 14, 
[fail] RENAME: 3, 

', '2017-11-08 19:58:26', '2017-11-08 19:58:26', 'rename');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (142, NULL, '''jobs:createCategories'' --env prod -vv', '2017-11-08 19:58:26', 0, 24, 5, true, NULL, 'matts-MacBook-Pro.local', '[ok] : 1
JOBMETA [createCategories] | [] | Not adding new cat as already exists for domain: ONC\Partridge\Entity\Category3, name: World Championship:


[ok] CREATECATEGORIES: 1, 

', '2017-11-08 19:58:26', '2017-11-08 19:58:26', 'createCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (143, NULL, '''jobs:dataIntegrityIdempotent'' --env prod -vv', '2017-11-08 19:58:27', 2, 22, 3, true, NULL, 'matts-MacBook-Pro.local', '[ok] : 15
JOBMETA [dataIntegrityIdempotent] | [] | Dropping ''alias_query'' matview:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/bookieOutcomesWithoutMeta.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/bookieMarketsWithoutMeta.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/bookieEventsWithoutMeta.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/orphanedBookieEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/outcomesWithoutConcretes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/marketsWithoutConcretes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/eventsWithoutConcretes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredMarkets.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredOutcomes.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/filterExpiredEvents.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Running /etc/queries/dataIntegrity/aliasCategory1WithSameName.sql:
JOBMETA [dataIntegrityIdempotent] | [] | Recreating ''alias_query'' matview:


[ok] DATAINTEGRITYIDEMPOTENT: 15, 

', '2017-11-08 19:58:29', '2017-11-08 19:58:29', 'dataIntegrityIdempotent');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (144, NULL, '''jobs:canonicalise'' --env prod -vv', '2017-11-08 19:58:29', 0, 22, 6, true, NULL, 'matts-MacBook-Pro.local', '[ok] : 7
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category1 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category2 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Category3 ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Outcome ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Market ents:
JOBMETA [canonicalise] | [] | Running canonicalise over 0 ONC\Partridge\Entity\Event ents:
JOBMETA [canonicalise] | [] | DB affected: partridge:


[ok] CANONICALISE: 7, 

', '2017-11-08 19:58:29', '2017-11-08 19:58:29', 'canonicalise');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (145, NULL, '''jobs:filteredCategories'' --env prod -vv', '2017-11-08 19:58:30', 0, 24, 51, true, NULL, 'matts-MacBook-Pro.local', '[ok] : 13
JOBMETA [filteredCategories] | [] | Whitelisting 3 Category2 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category3 entries for category1: Football:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Horse Racing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: Tennis:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category3 entries for category1: UFC MMA:
JOBMETA [filteredCategories] | [] | Whitelisting 2 Category2 entries for category1: Politics:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Snooker:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Boxing:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Darts:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Formula 1:
JOBMETA [filteredCategories] | [] | Whitelisting 1 Category2 entries for category1: Golf:

[fail] : 3
JOBMETA [filteredCategories] | Could not find Category2 using name: Horse Racing - Specials and cat1 name: Horse Racing: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Politics International and cat1 name: Politics: | []
JOBMETA [filteredCategories] | Could not find Category2 using name: Formula 1 and cat1 name: Formula 1: | []


[ok] FILTEREDCATEGORIES: 13, 
[fail] FILTEREDCATEGORIES: 3, 

', '2017-11-08 19:58:30', '2017-11-08 19:58:30', 'filteredCategories');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (146, NULL, '''jobs:alias'' --env prod -vv', '2017-11-08 19:58:31', 0, 24, 43, true, NULL, 'matts-MacBook-Pro.local', '[ok] : 27
JOBMETA [aliasing] | [] | Applying for category1: Football:
JOBMETA [aliasing] | [] | Applying for category1: Tennis:
JOBMETA [aliasing] | [] | Applying for category1: Boxing:
JOBMETA [aliasing] | [] | Applying for category1: UFC MMA:
JOBMETA [aliasing] | [] | Applying for category1: Politics:
JOBMETA [aliasing] | [] | Applying for category1: Motorsports:
JOBMETA [aliasing] | [] | ---- Football ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category2:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Category3:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Tennis ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Boxing ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Event:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | ---- UFC MMA ----:
JOBMETA [aliasing] | [] | ---- Politics ----:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Market:
JOBMETA [aliasing] | [] | Added/updated records for 0 records of ONC\Partridge\Entity\Outcome:
JOBMETA [aliasing] | [] | ---- Motorsports ----:
JOBMETA [aliasing] | [] | Added/updated records for 1 records of ONC\Partridge\Entity\Category1:
JOBMETA [aliasing] | [] | DB affected: partridge:


[ok] ALIASING: 27, 

', '2017-11-08 19:58:31', '2017-11-08 19:58:31', 'aliasing');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (147, NULL, '''jobs:resolverMarkets'' --env prod -vv', '2017-11-08 19:58:32', 0, 22, 25, true, NULL, 'matts-MacBook-Pro.local', '[ok] : 1
JOBMETA [MarketResolver] | [] | Running resolver against 0 existing instances of ONC\Partridge\Entity\Market
Running resolvers/marketsHavingTeamReferencingName.sql with cat1name: Football
Loading file /Users/mpenrice/dev/compareglobal/api/etc/queries/resolvers/marketsHavingTeamReferencingName.sql into partridge
Running resolvers/marketsHavingPlayerReferencingName.sql with cat1name: Football
Loading file /Users/mpenrice/dev/compareglobal/api/etc/queries/resolvers/marketsHavingPlayerReferencingName.sql into partridge
Running resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql with cat1name: Football
Loading file /Users/mpenrice/dev/compareglobal/api/etc/queries/resolvers/marketsHavingOutrightEventsReferencesGivenOutrightType.sql into partridge
All Done!
DB affected: partridge
:


[ok] MARKETRESOLVER: 1, 

', '2017-11-08 19:58:32', '2017-11-08 19:58:32', 'MarketResolver');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (148, NULL, '''jobs:offersAndBanners'' --env prod -vv', '2017-11-08 19:58:32', 0, 24, 8, true, NULL, 'matts-MacBook-Pro.local', '[ok] : 2
JOBMETA [offersAndBanners] | [] | Applying for bookie: CORAL:
JOBMETA [offersAndBanners] | [] | Updated offer with name: Bet £5 Get £20, having 3 accompanying banners:


[ok] OFFERSANDBANNERS: 2, 

', '2017-11-08 19:58:32', '2017-11-08 19:58:32', 'offersAndBanners');
INSERT INTO reports (id, feed_id, run_command, start_time, duration, memory_peak, query_count, completed, fail_message, hostname, output, created_at, updated_at, name) VALUES (149, NULL, '''jobs:dataExpired'' --cmd-criteria=''clear:1'' --env prod', '2017-11-08 19:58:33', 0, 20, 1, true, NULL, 'matts-MacBook-Pro.local', '[ok] : 2
JOBMETA [dataExpired] | [] | Clearing all expired status''s:
JOBMETA [dataExpired] | [] | Running /etc/queries/dataIntegrity/filterExpiredClearAll.sql:


[ok] DATAEXPIRED: 2, 

', '2017-11-08 19:58:33', '2017-11-08 19:58:33', 'dataExpired');


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_id_seq', 149, true);


--
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sites (id, feed_id, bookie_id, country_id, name, type, url_homepage, deeplink, deeplink_mobile, deeplink_remote, deeplink_event, affiliate_key) VALUES (1, 1, 1, 1, 'Coral UK Web', 'WEB', 'http://sports.coral.co.uk', 'http://affiliate.coral.co.uk/processing/clickthrgh.asp?btag=%1$sb_3776&ev_oc_id=%2$s', 'http://affiliate.coral.co.uk/processing/clickthrgh.asp?btag=%1$sb_3777&ev_oc_id=%2$s', 'http://affiliate.coral.co.uk/processing/clickthrgh.asp?btag=%1$sb_3777&ev_oc_id=%2$s', 'http://affiliate.coral.co.uk/processing/clickthrgh.asp?btag=%1$sb_4508&ev_id=%3$s', 'a_23129');
INSERT INTO sites (id, feed_id, bookie_id, country_id, name, type, url_homepage, deeplink, deeplink_mobile, deeplink_remote, deeplink_event, affiliate_key) VALUES (2, 2, 2, 1, 'Sky SportsApi UK Web', 'WEB', 'http://skybet.com', 'http://skybet.com?action=AddSelection&ev_oc_id=%2$s', 'http://skybet.com?action=AddSelection&ev_oc_id=%2$s', 'http://skybet.com?action=AddSelection&ev_oc_id=%2$s', 'http://skybet.com?action=AddSelection&ev_oc_id=%2$s', 'REPLACEME');
INSERT INTO sites (id, feed_id, bookie_id, country_id, name, type, url_homepage, deeplink, deeplink_mobile, deeplink_remote, deeplink_event, affiliate_key) VALUES (3, 3, 2, 1, 'BoyleSports UK Web', 'WEB', 'http://www.boylesports.com/', 'http://www.boylesports.com/addbet?idfiacampaign=%1$s&id=%2$s', 'http://www.boylesports.com/addbet?idfiacampaign=%1$s&id=%2$s&mobile', 'http://www.boylesports.com/addbet?idfiacampaign=%1$s&id=%2$s&remote', 'http://www.boylesports.com/addbet?idfiacampaign=%1$s&id=%2$s&event', 'REPLACEME');


--
-- Name: sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sites_id_seq', 3, true);


--
-- Data for Name: statsfixtures; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: statsfixtures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('statsfixtures_id_seq', 1, false);


--
-- Data for Name: statsparticipants; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: statsparticipants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('statsparticipants_id_seq', 1, false);


--
-- Name: aliascategory1 aliascategory1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliascategory1
    ADD CONSTRAINT aliascategory1_pkey PRIMARY KEY (id);


--
-- Name: aliascategory2 aliascategory2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliascategory2
    ADD CONSTRAINT aliascategory2_pkey PRIMARY KEY (id);


--
-- Name: aliascategory3 aliascategory3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliascategory3
    ADD CONSTRAINT aliascategory3_pkey PRIMARY KEY (id);


--
-- Name: aliasevent aliasevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliasevent
    ADD CONSTRAINT aliasevent_pkey PRIMARY KEY (id);


--
-- Name: aliasmarket aliasmarket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliasmarket
    ADD CONSTRAINT aliasmarket_pkey PRIMARY KEY (id);


--
-- Name: aliasoutcome aliasoutcome_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliasoutcome
    ADD CONSTRAINT aliasoutcome_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: basearticles basearticles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY basearticles
    ADD CONSTRAINT basearticles_pkey PRIMARY KEY (id);


--
-- Name: bookieevents bookieevents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookieevents
    ADD CONSTRAINT bookieevents_pkey PRIMARY KEY (id);


--
-- Name: bookiemarkets bookiemarkets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookiemarkets
    ADD CONSTRAINT bookiemarkets_pkey PRIMARY KEY (id);


--
-- Name: bookieoutcomes bookieoutcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookieoutcomes
    ADD CONSTRAINT bookieoutcomes_pkey PRIMARY KEY (id);


--
-- Name: bookies bookies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookies
    ADD CONSTRAINT bookies_pkey PRIMARY KEY (id);


--
-- Name: category1 category1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category1
    ADD CONSTRAINT category1_pkey PRIMARY KEY (id);


--
-- Name: category2 category2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category2
    ADD CONSTRAINT category2_pkey PRIMARY KEY (id);


--
-- Name: category3 category3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category3
    ADD CONSTRAINT category3_pkey PRIMARY KEY (id);


--
-- Name: classification__category classification__category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classification__category
    ADD CONSTRAINT classification__category_pkey PRIMARY KEY (id);


--
-- Name: classification__collection classification__collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classification__collection
    ADD CONSTRAINT classification__collection_pkey PRIMARY KEY (id);


--
-- Name: classification__context classification__context_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classification__context
    ADD CONSTRAINT classification__context_pkey PRIMARY KEY (id);


--
-- Name: classification__tag classification__tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classification__tag
    ADD CONSTRAINT classification__tag_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: entrants entrants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrants
    ADD CONSTRAINT entrants_pkey PRIMARY KEY (id);


--
-- Name: eventarticles eventarticles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventarticles
    ADD CONSTRAINT eventarticles_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: featuredevent featuredevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY featuredevent
    ADD CONSTRAINT featuredevent_pkey PRIMARY KEY (id);


--
-- Name: featuredoffer featuredoffer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY featuredoffer
    ADD CONSTRAINT featuredoffer_pkey PRIMARY KEY (id);


--
-- Name: feeds feeds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY feeds
    ADD CONSTRAINT feeds_pkey PRIMARY KEY (id);


--
-- Name: fixtures fixtures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fixtures
    ADD CONSTRAINT fixtures_pkey PRIMARY KEY (id);


--
-- Name: footballstatsfixtures footballstatsfixtures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY footballstatsfixtures
    ADD CONSTRAINT footballstatsfixtures_pkey PRIMARY KEY (id);


--
-- Name: footballstatsparticipants footballstatsparticipants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY footballstatsparticipants
    ADD CONSTRAINT footballstatsparticipants_pkey PRIMARY KEY (id);


--
-- Name: historybookieoutcomes historybookieoutcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historybookieoutcomes
    ADD CONSTRAINT historybookieoutcomes_pkey PRIMARY KEY (id);


--
-- Name: marketmarketroles marketmarketroles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marketmarketroles
    ADD CONSTRAINT marketmarketroles_pkey PRIMARY KEY (market_id, marketrole_id);


--
-- Name: marketroles marketroles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marketroles
    ADD CONSTRAINT marketroles_pkey PRIMARY KEY (id);


--
-- Name: markets markets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY markets
    ADD CONSTRAINT markets_pkey PRIMARY KEY (id);


--
-- Name: media__gallery_media media__gallery_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media__gallery_media
    ADD CONSTRAINT media__gallery_media_pkey PRIMARY KEY (id);


--
-- Name: media__gallery media__gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media__gallery
    ADD CONSTRAINT media__gallery_pkey PRIMARY KEY (id);


--
-- Name: media__media media__media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media__media
    ADD CONSTRAINT media__media_pkey PRIMARY KEY (id);


--
-- Name: mediaimport mediaimport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mediaimport
    ADD CONSTRAINT mediaimport_pkey PRIMARY KEY (id);


--
-- Name: metabookieevent metabookieevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookieevent
    ADD CONSTRAINT metabookieevent_pkey PRIMARY KEY (id);


--
-- Name: metabookiemarket metabookiemarket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookiemarket
    ADD CONSTRAINT metabookiemarket_pkey PRIMARY KEY (id);


--
-- Name: metabookieoutcome metabookieoutcome_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookieoutcome
    ADD CONSTRAINT metabookieoutcome_pkey PRIMARY KEY (id);


--
-- Name: metacategory1 metacategory1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory1
    ADD CONSTRAINT metacategory1_pkey PRIMARY KEY (id);


--
-- Name: metacategory2 metacategory2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory2
    ADD CONSTRAINT metacategory2_pkey PRIMARY KEY (id);


--
-- Name: metacategory3 metacategory3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory3
    ADD CONSTRAINT metacategory3_pkey PRIMARY KEY (id);


--
-- Name: metaentrant metaentrant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaentrant
    ADD CONSTRAINT metaentrant_pkey PRIMARY KEY (id);


--
-- Name: metaevent metaevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaevent
    ADD CONSTRAINT metaevent_pkey PRIMARY KEY (id);


--
-- Name: metafixture metafixture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metafixture
    ADD CONSTRAINT metafixture_pkey PRIMARY KEY (id);


--
-- Name: metamarket metamarket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metamarket
    ADD CONSTRAINT metamarket_pkey PRIMARY KEY (id);


--
-- Name: metaoutcome metaoutcome_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaoutcome
    ADD CONSTRAINT metaoutcome_pkey PRIMARY KEY (id);


--
-- Name: migration_versions migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (version);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: outcomes outcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY outcomes
    ADD CONSTRAINT outcomes_pkey PRIMARY KEY (id);


--
-- Name: participants participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: sites sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);


--
-- Name: statsfixtures statsfixtures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY statsfixtures
    ADD CONSTRAINT statsfixtures_pkey PRIMARY KEY (id);


--
-- Name: statsparticipants statsparticipants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY statsparticipants
    ADD CONSTRAINT statsparticipants_pkey PRIMARY KEY (id);


--
-- Name: bookieevents unq_bookieevents; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookieevents
    ADD CONSTRAINT unq_bookieevents UNIQUE (bookie_id, event_id);


--
-- Name: bookiemarkets unq_bookiemarkets; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookiemarkets
    ADD CONSTRAINT unq_bookiemarkets UNIQUE (bookieevent_id, market_id);


--
-- Name: bookieoutcomes unq_bookieoutcomes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookieoutcomes
    ADD CONSTRAINT unq_bookieoutcomes UNIQUE (outcome_id, bookiemarket_id);


--
-- Name: category1 unq_category1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category1
    ADD CONSTRAINT unq_category1 UNIQUE (name);


--
-- Name: category2 unq_category2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category2
    ADD CONSTRAINT unq_category2 UNIQUE (name, category1_id);


--
-- Name: category3 unq_category3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category3
    ADD CONSTRAINT unq_category3 UNIQUE (name, category2_id);


--
-- Name: events unq_events; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT unq_events UNIQUE (canonicalised_name, category3_id, date);


--
-- Name: markets unq_markets; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY markets
    ADD CONSTRAINT unq_markets UNIQUE (canonicalised_name, category1_id);


--
-- Name: metabookieevent unq_metabookieevent; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookieevent
    ADD CONSTRAINT unq_metabookieevent UNIQUE (domain_id);


--
-- Name: metabookiemarket unq_metabookiemarket; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookiemarket
    ADD CONSTRAINT unq_metabookiemarket UNIQUE (domain_id);


--
-- Name: metabookieoutcome unq_metabookieoutcome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookieoutcome
    ADD CONSTRAINT unq_metabookieoutcome UNIQUE (domain_id);


--
-- Name: metacategory1 unq_metacategory1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory1
    ADD CONSTRAINT unq_metacategory1 UNIQUE (domain_id);


--
-- Name: metacategory2 unq_metacategory2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory2
    ADD CONSTRAINT unq_metacategory2 UNIQUE (domain_id);


--
-- Name: metacategory3 unq_metacategory3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory3
    ADD CONSTRAINT unq_metacategory3 UNIQUE (domain_id);


--
-- Name: metaevent unq_metaevent; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaevent
    ADD CONSTRAINT unq_metaevent UNIQUE (domain_id);


--
-- Name: metamarket unq_metamarket; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metamarket
    ADD CONSTRAINT unq_metamarket UNIQUE (domain_id);


--
-- Name: metaoutcome unq_metaoutcome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaoutcome
    ADD CONSTRAINT unq_metaoutcome UNIQUE (domain_id);


--
-- Name: outcomes unq_outcomes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY outcomes
    ADD CONSTRAINT unq_outcomes UNIQUE (canonicalised_name, category1_id);


--
-- Name: date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX date_idx ON fixtures USING btree (date);


--
-- Name: domain_feedelementid_metabookieevent_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX domain_feedelementid_metabookieevent_index ON metabookieevent USING btree (feed_element_id, domain_id);


--
-- Name: domain_feedelementid_metabookiemarket_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX domain_feedelementid_metabookiemarket_index ON metabookiemarket USING btree (feed_element_id, domain_id);


--
-- Name: domain_feedelementid_metabookieoutcome_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX domain_feedelementid_metabookieoutcome_index ON metabookieoutcome USING btree (feed_element_id, domain_id);


--
-- Name: domain_feedelementid_metacategory1_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX domain_feedelementid_metacategory1_index ON metacategory1 USING btree (feed_element_id, domain_id);


--
-- Name: domain_feedelementid_metacategory2_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX domain_feedelementid_metacategory2_index ON metacategory2 USING btree (feed_element_id, domain_id);


--
-- Name: domain_feedelementid_metacategory3_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX domain_feedelementid_metacategory3_index ON metacategory3 USING btree (feed_element_id, domain_id);


--
-- Name: domain_feedelementid_metaentrant_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX domain_feedelementid_metaentrant_index ON metaentrant USING btree (feed_element_id, domain_id);


--
-- Name: domain_feedelementid_metaevent_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX domain_feedelementid_metaevent_index ON metaevent USING btree (feed_element_id, domain_id);


--
-- Name: domain_feedelementid_metafixture_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX domain_feedelementid_metafixture_index ON metafixture USING btree (feed_element_id, domain_id);


--
-- Name: domain_feedelementid_metamarket_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX domain_feedelementid_metamarket_index ON metamarket USING btree (feed_element_id, domain_id);


--
-- Name: domain_feedelementid_metaoutcome_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX domain_feedelementid_metaoutcome_index ON metaoutcome USING btree (feed_element_id, domain_id);


--
-- Name: domain_type_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX domain_type_unique ON featuredoffer USING btree (domain_id, type);


--
-- Name: domainid_name_category1_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX domainid_name_category1_unique ON aliascategory1 USING btree (domain_id, name);


--
-- Name: domainid_name_category2_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX domainid_name_category2_unique ON aliascategory2 USING btree (domain_id, name);


--
-- Name: domainid_name_category3_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX domainid_name_category3_unique ON aliascategory3 USING btree (domain_id, name);


--
-- Name: domainid_name_event_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX domainid_name_event_unique ON aliasevent USING btree (domain_id, name);


--
-- Name: domainid_name_market_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX domainid_name_market_unique ON aliasmarket USING btree (domain_id, name);


--
-- Name: domainid_name_outcome_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX domainid_name_outcome_unique ON aliasoutcome USING btree (domain_id, name);


--
-- Name: event_domain_type_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX event_domain_type_unique ON featuredevent USING btree (domain_id, type, outcome_id);


--
-- Name: event_domainid_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX event_domainid_type ON featuredevent USING btree (domain_id, type);


--
-- Name: events_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX events_date_idx ON events USING btree (date);


--
-- Name: idx_17d378b6987ae85a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17d378b6987ae85a ON markets USING btree (category1_id);


--
-- Name: idx_250f256853c674ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_250f256853c674ee ON banners USING btree (offer_id);


--
-- Name: idx_3342797f622f3f37; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_3342797f622f3f37 ON bookiemarkets USING btree (market_id);


--
-- Name: idx_3342797f8340c221; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_3342797f8340c221 ON bookiemarkets USING btree (bookie_id);


--
-- Name: idx_3342797f936b039e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_3342797f936b039e ON bookiemarkets USING btree (bookieevent_id);


--
-- Name: idx_35b30bc051a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_35b30bc051a5bc03 ON metabookieevent USING btree (feed_id);


--
-- Name: idx_43629b36727aca70; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_43629b36727aca70 ON classification__category USING btree (parent_id);


--
-- Name: idx_43629b36e25d857e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_43629b36e25d857e ON classification__category USING btree (context);


--
-- Name: idx_43629b36ea9fdd75; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_43629b36ea9fdd75 ON classification__category USING btree (media_id);


--
-- Name: idx_4ec279ba115f0ee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_4ec279ba115f0ee5 ON eventarticles USING btree (domain_id);


--
-- Name: idx_5387574a327320d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_5387574a327320d1 ON events USING btree (category3_id);


--
-- Name: idx_5a29f52f8340c221; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_5a29f52f8340c221 ON feeds USING btree (bookie_id);


--
-- Name: idx_5c6dd74e12469de2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_5c6dd74e12469de2 ON media__media USING btree (category_id);


--
-- Name: idx_5cb9e534327320d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_5cb9e534327320d1 ON fixtures USING btree (category3_id);


--
-- Name: idx_6d07ae2951a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_6d07ae2951a5bc03 ON metabookieoutcome USING btree (feed_id);


--
-- Name: idx_6e54d0fa4e7af8f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_6e54d0fa4e7af8f ON outcomes USING btree (gallery_id);


--
-- Name: idx_6e54d0fa987ae85a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_6e54d0fa987ae85a ON outcomes USING btree (category1_id);


--
-- Name: idx_716970928bff9d26; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_716970928bff9d26 ON participants USING btree (entrant_id);


--
-- Name: idx_71697092e524616d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_71697092e524616d ON participants USING btree (fixture_id);


--
-- Name: idx_762538b971f7e88b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_762538b971f7e88b ON bookieevents USING btree (event_id);


--
-- Name: idx_762538b98340c221; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_762538b98340c221 ON bookieevents USING btree (bookie_id);


--
-- Name: idx_768d504eb71244ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_768d504eb71244ed ON entrants USING btree (_self_id);


--
-- Name: idx_7b097c65115f0ee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_7b097c65115f0ee5 ON aliasoutcome USING btree (domain_id);


--
-- Name: idx_7d46415b115f0ee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_7d46415b115f0ee5 ON aliascategory2 USING btree (domain_id);


--
-- Name: idx_80d4c5414e7af8f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_80d4c5414e7af8f ON media__gallery_media USING btree (gallery_id);


--
-- Name: idx_80d4c541ea9fdd75; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_80d4c541ea9fdd75 ON media__gallery_media USING btree (media_id);


--
-- Name: idx_81b730a48acf47b4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_81b730a48acf47b4 ON category3 USING btree (category2_id);


--
-- Name: idx_8cc83bef8340c221; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8cc83bef8340c221 ON bookieoutcomes USING btree (bookie_id);


--
-- Name: idx_8cc83befe6ee6d63; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8cc83befe6ee6d63 ON bookieoutcomes USING btree (outcome_id);


--
-- Name: idx_8cc83beff104737; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8cc83beff104737 ON bookieoutcomes USING btree (bookiemarket_id);


--
-- Name: idx_8e357a59115f0ee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8e357a59115f0ee5 ON featuredoffer USING btree (domain_id);


--
-- Name: idx_8e357a59ea9fdd75; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8e357a59ea9fdd75 ON featuredoffer USING btree (media_id);


--
-- Name: idx_963dbd1951a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_963dbd1951a5bc03 ON metacategory2 USING btree (feed_id);


--
-- Name: idx_9c3a0a6e683521b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9c3a0a6e683521b ON historybookieoutcomes USING btree (bookieoutcome_id);


--
-- Name: idx_9c4df7c0115f0ee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9c4df7c0115f0ee5 ON featuredevent USING btree (domain_id);


--
-- Name: idx_9c4df7c0e6ee6d63; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9c4df7c0e6ee6d63 ON featuredevent USING btree (outcome_id);


--
-- Name: idx_9c4df7c0ea9fdd75; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9c4df7c0ea9fdd75 ON featuredevent USING btree (media_id);


--
-- Name: idx_a406b56ae25d857e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_a406b56ae25d857e ON classification__collection USING btree (context);


--
-- Name: idx_a406b56aea9fdd75; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_a406b56aea9fdd75 ON classification__collection USING btree (media_id);


--
-- Name: idx_a4171cd115f0ee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_a4171cd115f0ee5 ON aliascategory3 USING btree (domain_id);


--
-- Name: idx_a9a20308622f3f37; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_a9a20308622f3f37 ON marketmarketroles USING btree (market_id);


--
-- Name: idx_a9a20308f946e23; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_a9a20308f946e23 ON marketmarketroles USING btree (marketrole_id);


--
-- Name: idx_b510e67051a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_b510e67051a5bc03 ON metaentrant USING btree (feed_id);


--
-- Name: idx_b8746c3151a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_b8746c3151a5bc03 ON metabookiemarket USING btree (feed_id);


--
-- Name: idx_bc00aa638340c221; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_bc00aa638340c221 ON sites USING btree (bookie_id);


--
-- Name: idx_bc00aa63f92f3e70; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_bc00aa63f92f3e70 ON sites USING btree (country_id);


--
-- Name: idx_ca57a1c7e25d857e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ca57a1c7e25d857e ON classification__tag USING btree (context);


--
-- Name: idx_da460427115f0ee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_da460427115f0ee5 ON offers USING btree (domain_id);


--
-- Name: idx_da4604278340c221; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_da4604278340c221 ON offers USING btree (bookie_id);


--
-- Name: idx_da460427987ae85a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_da460427987ae85a ON offers USING btree (category1_id);


--
-- Name: idx_da6965ee115f0ee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_da6965ee115f0ee5 ON aliasmarket USING btree (domain_id);


--
-- Name: idx_dbd725a751a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dbd725a751a5bc03 ON metaoutcome USING btree (feed_id);


--
-- Name: idx_e13a8d8f51a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_e13a8d8f51a5bc03 ON metacategory3 USING btree (feed_id);


--
-- Name: idx_e44f10e1115f0ee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_e44f10e1115f0ee5 ON aliascategory1 USING btree (domain_id);


--
-- Name: idx_ed2df0e51a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ed2df0e51a5bc03 ON metamarket USING btree (feed_id);


--
-- Name: idx_ee8e088b51a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ee8e088b51a5bc03 ON metafixture USING btree (feed_id);


--
-- Name: idx_f11fa74551a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_f11fa74551a5bc03 ON reports USING btree (feed_id);


--
-- Name: idx_f34eca351a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_f34eca351a5bc03 ON metacategory1 USING btree (feed_id);


--
-- Name: idx_f52d09ff51a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_f52d09ff51a5bc03 ON metaevent USING btree (feed_id);


--
-- Name: idx_f5a70b9c115f0ee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_f5a70b9c115f0ee5 ON aliasevent USING btree (domain_id);


--
-- Name: idx_f6b00032987ae85a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_f6b00032987ae85a ON category2 USING btree (category1_id);


--
-- Name: markets_expired_cat1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX markets_expired_cat1_idx ON markets USING btree (expired, category1_id);


--
-- Name: matchable_name_fulltext_category1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX matchable_name_fulltext_category1_idx ON category1 USING btree (matchable_name);


--
-- Name: matchable_name_fulltext_category2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX matchable_name_fulltext_category2_idx ON category2 USING btree (matchable_name);


--
-- Name: matchable_name_fulltext_category3_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX matchable_name_fulltext_category3_idx ON category3 USING btree (matchable_name);


--
-- Name: matchable_name_fulltext_events_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX matchable_name_fulltext_events_idx ON events USING btree (matchable_name);


--
-- Name: matchable_name_fulltext_markets_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX matchable_name_fulltext_markets_idx ON markets USING btree (matchable_name);


--
-- Name: matchable_name_fulltext_outcomes_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX matchable_name_fulltext_outcomes_idx ON outcomes USING btree (matchable_name);


--
-- Name: name_category1_unq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX name_category1_unq ON offers USING btree (name, bookie_id);


--
-- Name: name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX name_index ON entrants USING btree (canonicalised_name);


--
-- Name: offer_element_unq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX offer_element_unq ON banners USING btree (offer_id, bookie_element_id);


--
-- Name: outcomes_expired_cat1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX outcomes_expired_cat1_idx ON outcomes USING btree (expired, category1_id);


--
-- Name: partial_unique_subents; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX partial_unique_subents ON featuredevent USING btree (domain_id, type) WHERE (outcome_id IS NULL);


--
-- Name: tag_collection; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tag_collection ON classification__collection USING btree (slug, context);


--
-- Name: tag_context; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tag_context ON classification__tag USING btree (slug, context);


--
-- Name: uniq_17d378b61ad50efc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_17d378b61ad50efc ON markets USING btree (_self2_id);


--
-- Name: uniq_17d378b6a2696999; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_17d378b6a2696999 ON markets USING btree (_self3_id);


--
-- Name: uniq_17d378b6b71244ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_17d378b6b71244ed ON markets USING btree (_self_id);


--
-- Name: uniq_1922e0685e237e06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_1922e0685e237e06 ON bookies USING btree (name);


--
-- Name: uniq_5387574a1ad50efc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_5387574a1ad50efc ON events USING btree (_self2_id);


--
-- Name: uniq_5387574aa2696999; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_5387574aa2696999 ON events USING btree (_self3_id);


--
-- Name: uniq_5387574ab71244ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_5387574ab71244ed ON events USING btree (_self_id);


--
-- Name: uniq_5a29f52f5e237e06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_5a29f52f5e237e06 ON feeds USING btree (name);


--
-- Name: uniq_5cb9e53471f7e88b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_5cb9e53471f7e88b ON fixtures USING btree (event_id);


--
-- Name: uniq_5d66ebad5e237e06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_5d66ebad5e237e06 ON countries USING btree (name);


--
-- Name: uniq_5d66ebad6c68a7e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_5d66ebad6c68a7e2 ON countries USING btree (iso3);


--
-- Name: uniq_5d66ebad77153098; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_5d66ebad77153098 ON countries USING btree (code);


--
-- Name: uniq_6e54d0fa1ad50efc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_6e54d0fa1ad50efc ON outcomes USING btree (_self2_id);


--
-- Name: uniq_6e54d0faa2696999; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_6e54d0faa2696999 ON outcomes USING btree (_self3_id);


--
-- Name: uniq_6e54d0fab71244ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_6e54d0fab71244ed ON outcomes USING btree (_self_id);


--
-- Name: uniq_86fe630a2f98e47; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_86fe630a2f98e47 ON mediaimport USING btree (channel);


--
-- Name: uniq_b14b4514e524616d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_b14b4514e524616d ON statsfixtures USING btree (fixture_id);


--
-- Name: uniq_bc00aa6351a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_bc00aa6351a5bc03 ON sites USING btree (feed_id);


--
-- Name: uniq_bc00aa635e237e06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_bc00aa635e237e06 ON sites USING btree (name);


--
-- Name: uniq_f0129f369d1c3019; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_f0129f369d1c3019 ON statsparticipants USING btree (participant_id);


--
-- Name: unq_category1_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_category1_name ON marketroles USING btree (name, category1_id);


--
-- Name: unq_fixtures; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_fixtures ON fixtures USING btree (canonicalised_name, category3_id, date);


--
-- Name: unq_metaentrant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_metaentrant ON metaentrant USING btree (domain_id);


--
-- Name: unq_metafixture; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_metafixture ON metafixture USING btree (domain_id);


--
-- Name: unq_participants; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_participants ON participants USING btree (fixture_id, entrant_id);


--
-- Name: markets fk_17d378b61ad50efc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY markets
    ADD CONSTRAINT fk_17d378b61ad50efc FOREIGN KEY (_self2_id) REFERENCES markets(id);


--
-- Name: markets fk_17d378b6987ae85a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY markets
    ADD CONSTRAINT fk_17d378b6987ae85a FOREIGN KEY (category1_id) REFERENCES category1(id) ON DELETE CASCADE;


--
-- Name: markets fk_17d378b6a2696999; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY markets
    ADD CONSTRAINT fk_17d378b6a2696999 FOREIGN KEY (_self3_id) REFERENCES markets(id);


--
-- Name: markets fk_17d378b6b71244ed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY markets
    ADD CONSTRAINT fk_17d378b6b71244ed FOREIGN KEY (_self_id) REFERENCES markets(id);


--
-- Name: banners fk_250f256853c674ee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY banners
    ADD CONSTRAINT fk_250f256853c674ee FOREIGN KEY (offer_id) REFERENCES offers(id) ON DELETE CASCADE;


--
-- Name: bookiemarkets fk_3342797f622f3f37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookiemarkets
    ADD CONSTRAINT fk_3342797f622f3f37 FOREIGN KEY (market_id) REFERENCES markets(id) ON DELETE CASCADE;


--
-- Name: bookiemarkets fk_3342797f8340c221; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookiemarkets
    ADD CONSTRAINT fk_3342797f8340c221 FOREIGN KEY (bookie_id) REFERENCES bookies(id);


--
-- Name: bookiemarkets fk_3342797f936b039e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookiemarkets
    ADD CONSTRAINT fk_3342797f936b039e FOREIGN KEY (bookieevent_id) REFERENCES bookieevents(id) ON DELETE CASCADE;


--
-- Name: metabookieevent fk_35b30bc0115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookieevent
    ADD CONSTRAINT fk_35b30bc0115f0ee5 FOREIGN KEY (domain_id) REFERENCES bookieevents(id) ON DELETE CASCADE;


--
-- Name: metabookieevent fk_35b30bc051a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookieevent
    ADD CONSTRAINT fk_35b30bc051a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: footballstatsfixtures fk_42744daebf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY footballstatsfixtures
    ADD CONSTRAINT fk_42744daebf396750 FOREIGN KEY (id) REFERENCES statsfixtures(id) ON DELETE CASCADE;


--
-- Name: classification__category fk_43629b36727aca70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classification__category
    ADD CONSTRAINT fk_43629b36727aca70 FOREIGN KEY (parent_id) REFERENCES classification__category(id) ON DELETE CASCADE;


--
-- Name: classification__category fk_43629b36e25d857e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classification__category
    ADD CONSTRAINT fk_43629b36e25d857e FOREIGN KEY (context) REFERENCES classification__context(id);


--
-- Name: classification__category fk_43629b36ea9fdd75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classification__category
    ADD CONSTRAINT fk_43629b36ea9fdd75 FOREIGN KEY (media_id) REFERENCES media__media(id) ON DELETE SET NULL;


--
-- Name: eventarticles fk_4ec279ba115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventarticles
    ADD CONSTRAINT fk_4ec279ba115f0ee5 FOREIGN KEY (domain_id) REFERENCES events(id) ON DELETE CASCADE;


--
-- Name: eventarticles fk_4ec279babf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventarticles
    ADD CONSTRAINT fk_4ec279babf396750 FOREIGN KEY (id) REFERENCES basearticles(id) ON DELETE CASCADE;


--
-- Name: events fk_5387574a1ad50efc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_5387574a1ad50efc FOREIGN KEY (_self2_id) REFERENCES events(id);


--
-- Name: events fk_5387574a327320d1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_5387574a327320d1 FOREIGN KEY (category3_id) REFERENCES category3(id) ON DELETE CASCADE;


--
-- Name: events fk_5387574aa2696999; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_5387574aa2696999 FOREIGN KEY (_self3_id) REFERENCES events(id);


--
-- Name: events fk_5387574ab71244ed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_5387574ab71244ed FOREIGN KEY (_self_id) REFERENCES events(id);


--
-- Name: feeds fk_5a29f52f8340c221; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY feeds
    ADD CONSTRAINT fk_5a29f52f8340c221 FOREIGN KEY (bookie_id) REFERENCES bookies(id);


--
-- Name: media__media fk_5c6dd74e12469de2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media__media
    ADD CONSTRAINT fk_5c6dd74e12469de2 FOREIGN KEY (category_id) REFERENCES classification__category(id) ON DELETE SET NULL;


--
-- Name: fixtures fk_5cb9e534327320d1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fixtures
    ADD CONSTRAINT fk_5cb9e534327320d1 FOREIGN KEY (category3_id) REFERENCES category3(id);


--
-- Name: fixtures fk_5cb9e53471f7e88b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fixtures
    ADD CONSTRAINT fk_5cb9e53471f7e88b FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE SET NULL;


--
-- Name: metabookieoutcome fk_6d07ae29115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookieoutcome
    ADD CONSTRAINT fk_6d07ae29115f0ee5 FOREIGN KEY (domain_id) REFERENCES bookieoutcomes(id) ON DELETE CASCADE;


--
-- Name: metabookieoutcome fk_6d07ae2951a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookieoutcome
    ADD CONSTRAINT fk_6d07ae2951a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: outcomes fk_6e54d0fa1ad50efc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY outcomes
    ADD CONSTRAINT fk_6e54d0fa1ad50efc FOREIGN KEY (_self2_id) REFERENCES outcomes(id);


--
-- Name: outcomes fk_6e54d0fa4e7af8f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY outcomes
    ADD CONSTRAINT fk_6e54d0fa4e7af8f FOREIGN KEY (gallery_id) REFERENCES media__gallery(id) ON DELETE SET NULL;


--
-- Name: outcomes fk_6e54d0fa987ae85a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY outcomes
    ADD CONSTRAINT fk_6e54d0fa987ae85a FOREIGN KEY (category1_id) REFERENCES category1(id) ON DELETE CASCADE;


--
-- Name: outcomes fk_6e54d0faa2696999; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY outcomes
    ADD CONSTRAINT fk_6e54d0faa2696999 FOREIGN KEY (_self3_id) REFERENCES outcomes(id);


--
-- Name: outcomes fk_6e54d0fab71244ed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY outcomes
    ADD CONSTRAINT fk_6e54d0fab71244ed FOREIGN KEY (_self_id) REFERENCES outcomes(id);


--
-- Name: participants fk_716970928bff9d26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT fk_716970928bff9d26 FOREIGN KEY (entrant_id) REFERENCES entrants(id) ON DELETE CASCADE;


--
-- Name: participants fk_71697092e524616d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT fk_71697092e524616d FOREIGN KEY (fixture_id) REFERENCES fixtures(id) ON DELETE CASCADE;


--
-- Name: bookieevents fk_762538b971f7e88b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookieevents
    ADD CONSTRAINT fk_762538b971f7e88b FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE;


--
-- Name: bookieevents fk_762538b98340c221; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookieevents
    ADD CONSTRAINT fk_762538b98340c221 FOREIGN KEY (bookie_id) REFERENCES bookies(id);


--
-- Name: entrants fk_768d504eb71244ed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrants
    ADD CONSTRAINT fk_768d504eb71244ed FOREIGN KEY (_self_id) REFERENCES entrants(id);


--
-- Name: entrants fk_768d504ee6ee6d63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrants
    ADD CONSTRAINT fk_768d504ee6ee6d63 FOREIGN KEY (outcome_id) REFERENCES outcomes(id) ON DELETE SET NULL;


--
-- Name: aliasoutcome fk_7b097c65115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliasoutcome
    ADD CONSTRAINT fk_7b097c65115f0ee5 FOREIGN KEY (domain_id) REFERENCES outcomes(id) ON DELETE CASCADE;


--
-- Name: aliascategory2 fk_7d46415b115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliascategory2
    ADD CONSTRAINT fk_7d46415b115f0ee5 FOREIGN KEY (domain_id) REFERENCES category2(id) ON DELETE CASCADE;


--
-- Name: media__gallery_media fk_80d4c5414e7af8f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media__gallery_media
    ADD CONSTRAINT fk_80d4c5414e7af8f FOREIGN KEY (gallery_id) REFERENCES media__gallery(id);


--
-- Name: media__gallery_media fk_80d4c541ea9fdd75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media__gallery_media
    ADD CONSTRAINT fk_80d4c541ea9fdd75 FOREIGN KEY (media_id) REFERENCES media__media(id);


--
-- Name: category3 fk_81b730a48acf47b4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category3
    ADD CONSTRAINT fk_81b730a48acf47b4 FOREIGN KEY (category2_id) REFERENCES category2(id) ON DELETE CASCADE;


--
-- Name: bookieoutcomes fk_8cc83bef8340c221; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookieoutcomes
    ADD CONSTRAINT fk_8cc83bef8340c221 FOREIGN KEY (bookie_id) REFERENCES bookies(id);


--
-- Name: bookieoutcomes fk_8cc83befe6ee6d63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookieoutcomes
    ADD CONSTRAINT fk_8cc83befe6ee6d63 FOREIGN KEY (outcome_id) REFERENCES outcomes(id) ON DELETE CASCADE;


--
-- Name: bookieoutcomes fk_8cc83beff104737; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bookieoutcomes
    ADD CONSTRAINT fk_8cc83beff104737 FOREIGN KEY (bookiemarket_id) REFERENCES bookiemarkets(id) ON DELETE CASCADE;


--
-- Name: featuredoffer fk_8e357a59115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY featuredoffer
    ADD CONSTRAINT fk_8e357a59115f0ee5 FOREIGN KEY (domain_id) REFERENCES offers(id) ON DELETE CASCADE;


--
-- Name: featuredoffer fk_8e357a59ea9fdd75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY featuredoffer
    ADD CONSTRAINT fk_8e357a59ea9fdd75 FOREIGN KEY (media_id) REFERENCES media__media(id) ON DELETE CASCADE;


--
-- Name: metacategory2 fk_963dbd19115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory2
    ADD CONSTRAINT fk_963dbd19115f0ee5 FOREIGN KEY (domain_id) REFERENCES category2(id) ON DELETE CASCADE;


--
-- Name: metacategory2 fk_963dbd1951a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory2
    ADD CONSTRAINT fk_963dbd1951a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: featuredevent fk_9c4df7c0115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY featuredevent
    ADD CONSTRAINT fk_9c4df7c0115f0ee5 FOREIGN KEY (domain_id) REFERENCES events(id) ON DELETE CASCADE;


--
-- Name: featuredevent fk_9c4df7c0e6ee6d63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY featuredevent
    ADD CONSTRAINT fk_9c4df7c0e6ee6d63 FOREIGN KEY (outcome_id) REFERENCES outcomes(id) ON DELETE CASCADE;


--
-- Name: featuredevent fk_9c4df7c0ea9fdd75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY featuredevent
    ADD CONSTRAINT fk_9c4df7c0ea9fdd75 FOREIGN KEY (media_id) REFERENCES media__media(id) ON DELETE CASCADE;


--
-- Name: classification__collection fk_a406b56ae25d857e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classification__collection
    ADD CONSTRAINT fk_a406b56ae25d857e FOREIGN KEY (context) REFERENCES classification__context(id);


--
-- Name: classification__collection fk_a406b56aea9fdd75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classification__collection
    ADD CONSTRAINT fk_a406b56aea9fdd75 FOREIGN KEY (media_id) REFERENCES media__media(id) ON DELETE SET NULL;


--
-- Name: aliascategory3 fk_a4171cd115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliascategory3
    ADD CONSTRAINT fk_a4171cd115f0ee5 FOREIGN KEY (domain_id) REFERENCES category3(id) ON DELETE CASCADE;


--
-- Name: marketroles fk_a417a76c987ae85a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marketroles
    ADD CONSTRAINT fk_a417a76c987ae85a FOREIGN KEY (category1_id) REFERENCES category1(id) ON DELETE CASCADE;


--
-- Name: marketmarketroles fk_a9a20308622f3f37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marketmarketroles
    ADD CONSTRAINT fk_a9a20308622f3f37 FOREIGN KEY (market_id) REFERENCES markets(id) ON DELETE CASCADE;


--
-- Name: marketmarketroles fk_a9a20308f946e23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marketmarketroles
    ADD CONSTRAINT fk_a9a20308f946e23 FOREIGN KEY (marketrole_id) REFERENCES marketroles(id) ON DELETE CASCADE;


--
-- Name: statsfixtures fk_b14b4514e524616d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY statsfixtures
    ADD CONSTRAINT fk_b14b4514e524616d FOREIGN KEY (fixture_id) REFERENCES fixtures(id) ON DELETE CASCADE;


--
-- Name: metaentrant fk_b510e670115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaentrant
    ADD CONSTRAINT fk_b510e670115f0ee5 FOREIGN KEY (domain_id) REFERENCES entrants(id) ON DELETE CASCADE;


--
-- Name: metaentrant fk_b510e67051a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaentrant
    ADD CONSTRAINT fk_b510e67051a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: metabookiemarket fk_b8746c31115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookiemarket
    ADD CONSTRAINT fk_b8746c31115f0ee5 FOREIGN KEY (domain_id) REFERENCES bookiemarkets(id) ON DELETE CASCADE;


--
-- Name: metabookiemarket fk_b8746c3151a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metabookiemarket
    ADD CONSTRAINT fk_b8746c3151a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: sites fk_bc00aa6351a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT fk_bc00aa6351a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: sites fk_bc00aa638340c221; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT fk_bc00aa638340c221 FOREIGN KEY (bookie_id) REFERENCES bookies(id);


--
-- Name: sites fk_bc00aa63f92f3e70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT fk_bc00aa63f92f3e70 FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: classification__tag fk_ca57a1c7e25d857e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classification__tag
    ADD CONSTRAINT fk_ca57a1c7e25d857e FOREIGN KEY (context) REFERENCES classification__context(id);


--
-- Name: offers fk_da460427115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY offers
    ADD CONSTRAINT fk_da460427115f0ee5 FOREIGN KEY (domain_id) REFERENCES events(id) ON DELETE CASCADE;


--
-- Name: offers fk_da4604278340c221; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY offers
    ADD CONSTRAINT fk_da4604278340c221 FOREIGN KEY (bookie_id) REFERENCES bookies(id) ON DELETE CASCADE;


--
-- Name: offers fk_da460427987ae85a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY offers
    ADD CONSTRAINT fk_da460427987ae85a FOREIGN KEY (category1_id) REFERENCES category1(id) ON DELETE CASCADE;


--
-- Name: aliasmarket fk_da6965ee115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliasmarket
    ADD CONSTRAINT fk_da6965ee115f0ee5 FOREIGN KEY (domain_id) REFERENCES markets(id) ON DELETE CASCADE;


--
-- Name: metaoutcome fk_dbd725a7115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaoutcome
    ADD CONSTRAINT fk_dbd725a7115f0ee5 FOREIGN KEY (domain_id) REFERENCES outcomes(id) ON DELETE CASCADE;


--
-- Name: metaoutcome fk_dbd725a751a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaoutcome
    ADD CONSTRAINT fk_dbd725a751a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: metacategory3 fk_e13a8d8f115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory3
    ADD CONSTRAINT fk_e13a8d8f115f0ee5 FOREIGN KEY (domain_id) REFERENCES category3(id) ON DELETE CASCADE;


--
-- Name: metacategory3 fk_e13a8d8f51a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory3
    ADD CONSTRAINT fk_e13a8d8f51a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: aliascategory1 fk_e44f10e1115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliascategory1
    ADD CONSTRAINT fk_e44f10e1115f0ee5 FOREIGN KEY (domain_id) REFERENCES category1(id) ON DELETE CASCADE;


--
-- Name: metamarket fk_ed2df0e115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metamarket
    ADD CONSTRAINT fk_ed2df0e115f0ee5 FOREIGN KEY (domain_id) REFERENCES markets(id) ON DELETE CASCADE;


--
-- Name: metamarket fk_ed2df0e51a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metamarket
    ADD CONSTRAINT fk_ed2df0e51a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: metafixture fk_ee8e088b115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metafixture
    ADD CONSTRAINT fk_ee8e088b115f0ee5 FOREIGN KEY (domain_id) REFERENCES fixtures(id) ON DELETE CASCADE;


--
-- Name: metafixture fk_ee8e088b51a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metafixture
    ADD CONSTRAINT fk_ee8e088b51a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: statsparticipants fk_f0129f369d1c3019; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY statsparticipants
    ADD CONSTRAINT fk_f0129f369d1c3019 FOREIGN KEY (participant_id) REFERENCES participants(id) ON DELETE CASCADE;


--
-- Name: footballstatsparticipants fk_f0a4e9eabf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY footballstatsparticipants
    ADD CONSTRAINT fk_f0a4e9eabf396750 FOREIGN KEY (id) REFERENCES statsparticipants(id) ON DELETE CASCADE;


--
-- Name: reports fk_f11fa74551a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT fk_f11fa74551a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: metacategory1 fk_f34eca3115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory1
    ADD CONSTRAINT fk_f34eca3115f0ee5 FOREIGN KEY (domain_id) REFERENCES category1(id) ON DELETE CASCADE;


--
-- Name: metacategory1 fk_f34eca351a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metacategory1
    ADD CONSTRAINT fk_f34eca351a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: metaevent fk_f52d09ff115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaevent
    ADD CONSTRAINT fk_f52d09ff115f0ee5 FOREIGN KEY (domain_id) REFERENCES events(id) ON DELETE CASCADE;


--
-- Name: metaevent fk_f52d09ff51a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metaevent
    ADD CONSTRAINT fk_f52d09ff51a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- Name: aliasevent fk_f5a70b9c115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliasevent
    ADD CONSTRAINT fk_f5a70b9c115f0ee5 FOREIGN KEY (domain_id) REFERENCES events(id) ON DELETE CASCADE;


--
-- Name: category2 fk_f6b00032987ae85a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category2
    ADD CONSTRAINT fk_f6b00032987ae85a FOREIGN KEY (category1_id) REFERENCES category1(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

