--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
-- SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;


--
-- Data for Name: rename; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rename (id, entity_name, regex_search, regex_replace, display_order) VALUES (1, 'EVENT', '(.*\s)utd(\s|$.*)', '\1united\2', 0);
INSERT INTO public.rename (id, entity_name, regex_search, regex_replace, display_order) VALUES (2, 'CATEGORY1', 'football', 'new name for football', 0);

--
-- PostgreSQL database dump complete
--

