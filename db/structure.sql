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
    'north',
    'east',
    'south',
    'west'
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
-- Name: games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.games (
    id bigint NOT NULL,
    deal_id bigint,
    user_id bigint NOT NULL,
    north_id bigint NOT NULL,
    south_id bigint NOT NULL,
    west_id bigint NOT NULL,
    east_id bigint NOT NULL,
    contract character varying,
    result integer DEFAULT 0,
    score integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: hands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hands (
    id bigint NOT NULL,
    deal_id bigint NOT NULL,
    seat public.player_position,
    cards jsonb DEFAULT '[]'::jsonb
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
-- Name: deals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deals ALTER COLUMN id SET DEFAULT nextval('public.deals_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


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
-- Name: deals deals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deals
    ADD CONSTRAINT deals_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


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
-- Name: index_games_on_deal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_games_on_deal_id ON public.games USING btree (deal_id);


--
-- Name: index_games_on_east_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_games_on_east_id ON public.games USING btree (east_id);


--
-- Name: index_games_on_north_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_games_on_north_id ON public.games USING btree (north_id);


--
-- Name: index_games_on_south_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_games_on_south_id ON public.games USING btree (south_id);


--
-- Name: index_games_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_games_on_user_id ON public.games USING btree (user_id);


--
-- Name: index_games_on_west_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_games_on_west_id ON public.games USING btree (west_id);


--
-- Name: index_hands_on_deal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hands_on_deal_id ON public.hands USING btree (deal_id);


--
-- Name: games fk_rails_4f03f11d5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_4f03f11d5f FOREIGN KEY (deal_id) REFERENCES public.deals(id);


--
-- Name: games fk_rails_920b8d67ae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_920b8d67ae FOREIGN KEY (east_id) REFERENCES public.users(id);


--
-- Name: games fk_rails_b6ba5cfed3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_b6ba5cfed3 FOREIGN KEY (south_id) REFERENCES public.users(id);


--
-- Name: games fk_rails_bd395b5e19; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_bd395b5e19 FOREIGN KEY (north_id) REFERENCES public.users(id);


--
-- Name: games fk_rails_de9e6ea7f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_de9e6ea7f7 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: games fk_rails_f922f19b80; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_f922f19b80 FOREIGN KEY (west_id) REFERENCES public.users(id);


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
('20200416022641');


