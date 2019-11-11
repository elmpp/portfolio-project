--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports ALTER COLUMN id SET DEFAULT nextval('reports_id_seq'::regclass);


--
-- Name: historybookieoutcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historybookieoutcomes
    ADD CONSTRAINT historybookieoutcomes_pkey PRIMARY KEY (id);


--
-- Name: reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: idx_9c3a0a6e683521b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9c3a0a6e683521b ON historybookieoutcomes USING btree (bookieoutcome_id);


--
-- Name: idx_f11fa74551a5bc03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_f11fa74551a5bc03 ON reports USING btree (feed_id);


--
-- Name: fk_f11fa74551a5bc03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT fk_f11fa74551a5bc03 FOREIGN KEY (feed_id) REFERENCES feeds(id);


--
-- PostgreSQL database dump complete
--

