SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: deal_zone; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.deal_zone AS ENUM (
    'all',
    'ns',
    'ew',
    'none'
);


--
-- Name: player_position; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.player_position AS ENUM (
    'n',
    'e',
    's',
    'w'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: deal_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deal_sessions (
    id bigint NOT NULL,
    deal_id bigint,
    north_id bigint,
    south_id bigint,
    east_id bigint,
    west_id bigint,
    contract character varying,
    result integer,
    score integer,
    player public.player_position,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: deal_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.deal_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: deal_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.deal_sessions_id_seq OWNED BY public.deal_sessions.id;


--
-- Name: deals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deals (
    id bigint NOT NULL,
    dealer public.player_position,
    zone public.deal_zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: deals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.deals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: deals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.deals_id_seq OWNED BY public.deals.id;


--
-- Name: hands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hands (
    id bigint NOT NULL,
    seat public.player_position,
    spades character varying[] DEFAULT '{}'::character varying[],
    hearts character varying[] DEFAULT '{}'::character varying[],
    diamonds character varying[] DEFAULT '{}'::character varying[],
    clubs character varying[] DEFAULT '{}'::character varying[],
    player_id bigint NOT NULL
);


--
-- Name: hands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hands_id_seq OWNED BY public.hands.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: deal_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deal_sessions ALTER COLUMN id SET DEFAULT nextval('public.deal_sessions_id_seq'::regclass);


--
-- Name: deals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deals ALTER COLUMN id SET DEFAULT nextval('public.deals_id_seq'::regclass);


--
-- Name: hands id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hands ALTER COLUMN id SET DEFAULT nextval('public.hands_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: deal_sessions deal_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deal_sessions
    ADD CONSTRAINT deal_sessions_pkey PRIMARY KEY (id);


--
-- Name: deals deals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deals
    ADD CONSTRAINT deals_pkey PRIMARY KEY (id);


--
-- Name: hands hands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hands
    ADD CONSTRAINT hands_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_deal_sessions_on_deal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deal_sessions_on_deal_id ON public.deal_sessions USING btree (deal_id);


--
-- Name: index_deal_sessions_on_east_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deal_sessions_on_east_id ON public.deal_sessions USING btree (east_id);


--
-- Name: index_deal_sessions_on_north_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deal_sessions_on_north_id ON public.deal_sessions USING btree (north_id);


--
-- Name: index_deal_sessions_on_south_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deal_sessions_on_south_id ON public.deal_sessions USING btree (south_id);


--
-- Name: index_deal_sessions_on_west_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deal_sessions_on_west_id ON public.deal_sessions USING btree (west_id);


--
-- Name: index_hands_on_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hands_on_player_id ON public.hands USING btree (player_id);


--
-- Name: deal_sessions fk_rails_0f0b51bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deal_sessions
    ADD CONSTRAINT fk_rails_0f0b51bdbd FOREIGN KEY (south_id) REFERENCES public.users(id);


--
-- Name: deal_sessions fk_rails_10eb578802; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deal_sessions
    ADD CONSTRAINT fk_rails_10eb578802 FOREIGN KEY (west_id) REFERENCES public.users(id);


--
-- Name: deal_sessions fk_rails_274be5b53d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deal_sessions
    ADD CONSTRAINT fk_rails_274be5b53d FOREIGN KEY (east_id) REFERENCES public.users(id);


--
-- Name: hands fk_rails_3ec9fa93ff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hands
    ADD CONSTRAINT fk_rails_3ec9fa93ff FOREIGN KEY (player_id) REFERENCES public.users(id);


--
-- Name: deal_sessions fk_rails_90c229ced0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deal_sessions
    ADD CONSTRAINT fk_rails_90c229ced0 FOREIGN KEY (north_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20200329133540'),
('20200330074448'),
('20200330075033'),
('20200330075256'),
('20200331054554'),
('20200406150803');


