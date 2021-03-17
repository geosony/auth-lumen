--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: pguser
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO pguser;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO pguser;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: pguser
--

CREATE TABLE public.oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id bigint,
    client_id bigint NOT NULL,
    name character varying(255),
    scopes text,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_access_tokens OWNER TO pguser;

--
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: pguser
--

CREATE TABLE public.oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id bigint NOT NULL,
    client_id bigint NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_auth_codes OWNER TO pguser;

--
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: pguser
--

CREATE TABLE public.oauth_clients (
    id bigint NOT NULL,
    user_id bigint,
    name character varying(255) NOT NULL,
    secret character varying(100),
    provider character varying(255),
    redirect text NOT NULL,
    personal_access_client boolean NOT NULL,
    password_client boolean NOT NULL,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_clients OWNER TO pguser;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE public.oauth_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_clients_id_seq OWNER TO pguser;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE public.oauth_clients_id_seq OWNED BY public.oauth_clients.id;


--
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: pguser
--

CREATE TABLE public.oauth_personal_access_clients (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_personal_access_clients OWNER TO pguser;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE public.oauth_personal_access_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_personal_access_clients_id_seq OWNER TO pguser;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE public.oauth_personal_access_clients_id_seq OWNED BY public.oauth_personal_access_clients.id;


--
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: pguser
--

CREATE TABLE public.oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_refresh_tokens OWNER TO pguser;

--
-- Name: users; Type: TABLE; Schema: public; Owner: pguser
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO pguser;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO pguser;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: oauth_clients id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.oauth_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_clients_id_seq'::regclass);


--
-- Name: oauth_personal_access_clients id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_personal_access_clients_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2016_06_01_000001_create_oauth_auth_codes_table	1
2	2016_06_01_000002_create_oauth_access_tokens_table	1
3	2016_06_01_000003_create_oauth_refresh_tokens_table	1
4	2016_06_01_000004_create_oauth_clients_table	1
5	2016_06_01_000005_create_oauth_personal_access_clients_table	1
6	2021_03_12_050401_create_users_table	1
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
2564f9e6f85500af443ec0498c81eb4f80fdbb64c10c5670746571cbc57e595c299dc285a8214d52	20	2	\N	["*"]	f	2021-03-16 10:49:08	2021-03-16 10:49:08	2022-03-16 10:49:08
3348fa673aa568ee7a547c2b8f5ba38f432515b5e80aa4bdd38a4dded16edc9e366fb8cee4c961ab	20	2	\N	["*"]	t	2021-03-12 11:11:14	2021-03-12 11:11:14	2022-03-12 11:11:14
\.


--
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.oauth_clients (id, user_id, name, secret, provider, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
1	\N	Lumen Personal Access Client	3gwaq7pCwjj7jzKEKA5Z4xngzjWTcqgppZqhafLw	\N	http://localhost	t	f	f	2021-03-12 11:07:49	2021-03-12 11:07:49
2	\N	Lumen Password Grant Client	7upQG4k60XEnwma4kWEaRc5uWU4w4LUQH1q6Fm7d	users	http://localhost	f	t	f	2021-03-12 11:07:49	2021-03-12 11:07:49
\.


--
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	1	2021-03-12 11:07:49	2021-03-12 11:07:49
\.


--
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
1ddf0d8f98696bea332d332dfd7a1079a7dd3b3f71ae60dc39f0f460c462d46f229295b6a4df2b88	3348fa673aa568ee7a547c2b8f5ba38f432515b5e80aa4bdd38a4dded16edc9e366fb8cee4c961ab	f	2022-03-12 11:11:14
0a934bc5de936203c0e988e98ec45453763ae4602cd511b219a8a1f5487b3d041ff7f046cb218d8d	2564f9e6f85500af443ec0498c81eb4f80fdbb64c10c5670746571cbc57e595c299dc285a8214d52	f	2022-03-16 10:49:09
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.users (id, name, email, password, created_at, updated_at) FROM stdin;
1	Daron Hill	vbayer@example.com	$2y$10$NSKveG/.ivndecUBZmgS.eZObJ/i3ls/XRmhZKuvsaT8xLfso6Vhy	2021-03-12 11:07:35	2021-03-12 11:07:35
2	Prof. Katelyn Goyette	hwitting@example.com	$2y$10$DWwmilsiDIY4xPpiK/Tt9Ov6T1mNshTVCZSIBKAm1Na.6Wb4ToDiC	2021-03-12 11:07:35	2021-03-12 11:07:35
3	Ms. Jennie Dach	jprosacco@example.com	$2y$10$kt6smbzenyc5/JYub5kbgu7ucsqlXX1mZKuqjaxaQl5lSU7tn4X5O	2021-03-12 11:07:35	2021-03-12 11:07:35
4	Lexus Renner	tvonrueden@example.com	$2y$10$D.BDbUnKyexf9FL9qB1sJ.8kn1TXiqk2TaQegzpC5kThPXqUgMI4W	2021-03-12 11:07:35	2021-03-12 11:07:35
5	Jolie Hills	eric.kohler@example.org	$2y$10$c6C1BfEtwR8UORypvfALIu1tWTotIUXWg52kK2bupNhW8NBewRfhe	2021-03-12 11:07:35	2021-03-12 11:07:35
6	Carole Conroy MD	icormier@example.net	$2y$10$MorJ0RkYUWNhAukS7KcTdO3/LmTDSn0aOsoK8JElMze3jfEMjaqGC	2021-03-12 11:07:35	2021-03-12 11:07:35
7	Mr. Guiseppe Watsica	iwilderman@example.org	$2y$10$u3eZU2BwLS6fUv4ZCjhozeoc0yiIfspkfpnQ.5KbgUw4ieWw2GCBy	2021-03-12 11:07:35	2021-03-12 11:07:35
8	Prof. Hortense Bergnaum	cassin.erick@example.com	$2y$10$p2bB4rmE.FhXoWFaYUampeCCvWg6fAgGnIOi3dJUBoKcHXX3zQW22	2021-03-12 11:07:35	2021-03-12 11:07:35
9	Dejuan Rodriguez	lrodriguez@example.org	$2y$10$XGbWN7C2hmM5NCY385R0lOAVVRZ/MB7vYjy6TxA2I5wiFYCxtfKa6	2021-03-12 11:07:35	2021-03-12 11:07:35
10	Prof. Ebony Schowalter Jr.	rath.augustine@example.org	$2y$10$erW3q1oevJFrfwcsnrvGDOIL8ATJRGajSExNG51.8H4F8Ceyw0MFG	2021-03-12 11:07:35	2021-03-12 11:07:35
11	Miss Hellen Jacobi III	schultz.hipolito@example.com	$2y$10$OqvZgO4YsIaKiqX3wxNlse5o1UJdH0/sxKhrY.9u2gg6CA/a9w6DW	2021-03-12 11:07:43	2021-03-12 11:07:43
12	Izabella Buckridge	rherzog@example.com	$2y$10$9yGUzzUi7N5ZJ4AzTfwAu.j5s/sT/D1/DeLbHSUL7Qy9btTFIbrfu	2021-03-12 11:07:43	2021-03-12 11:07:43
13	Hobart West	nkihn@example.com	$2y$10$U3FEaFK2IPPzvoh0fDKDZuo9fSS6EmvCBJjc.9Gyq42fus20N0qHi	2021-03-12 11:07:43	2021-03-12 11:07:43
14	Orval Gleichner III	hturner@example.com	$2y$10$yTkQq3hK6mOisN93NFz6IuL6lA79EGMLdU032TchBKaZm.EHsp0bG	2021-03-12 11:07:43	2021-03-12 11:07:43
15	Ashlynn Welch Sr.	swift.sabryna@example.org	$2y$10$4acy0tthDOvU1dwcE1gVsuOm/haUAcbN3FxnrVHIfADJfDmvINocK	2021-03-12 11:07:43	2021-03-12 11:07:43
16	Prof. Kendra Spinka Jr.	osborne.cartwright@example.com	$2y$10$1Aheht.kTrC32xLjwlRuDe3maJ7sdtZ5LUHDfShZkaC.QOD0Hl9Nm	2021-03-12 11:07:43	2021-03-12 11:07:43
17	Dr. Ned Lind	edwina.okeefe@example.org	$2y$10$ju2MYGwr/cLFt.dD4pjEaOV.uD0b.i.62s7RcBnT35tS0HxK0Me4C	2021-03-12 11:07:43	2021-03-12 11:07:43
18	Malvina Roberts	caitlyn.rath@example.org	$2y$10$SxVnpn9d4DjXTcq8bMZrfOrJZFMQi44VHQdBImxNoGZ4GOXiBzJcS	2021-03-12 11:07:43	2021-03-12 11:07:43
19	Ms. Yolanda Runte	rlittle@example.net	$2y$10$bdo2M9kZcfIwg9pocQ/WC.RyP9/qUwpEqENjdJCuqYIgx4bMlU1jK	2021-03-12 11:07:43	2021-03-12 11:07:43
20	Muhammad Dach	uullrich@example.net	$2y$10$7oGHJdKnNJ7QBv1LOcLkFum5VkboyX5B4l1pFmVqrVHiLzuKU6wOu	2021-03-12 11:07:43	2021-03-12 11:07:43
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.migrations_id_seq', 6, true);


--
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.oauth_clients_id_seq', 2, true);


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.oauth_personal_access_clients_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.users_id_seq', 20, true);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_auth_codes oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_personal_access_clients oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_refresh_tokens oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_user_id_index; Type: INDEX; Schema: public; Owner: pguser
--

CREATE INDEX oauth_access_tokens_user_id_index ON public.oauth_access_tokens USING btree (user_id);


--
-- Name: oauth_auth_codes_user_id_index; Type: INDEX; Schema: public; Owner: pguser
--

CREATE INDEX oauth_auth_codes_user_id_index ON public.oauth_auth_codes USING btree (user_id);


--
-- Name: oauth_clients_user_id_index; Type: INDEX; Schema: public; Owner: pguser
--

CREATE INDEX oauth_clients_user_id_index ON public.oauth_clients USING btree (user_id);


--
-- Name: oauth_refresh_tokens_access_token_id_index; Type: INDEX; Schema: public; Owner: pguser
--

CREATE INDEX oauth_refresh_tokens_access_token_id_index ON public.oauth_refresh_tokens USING btree (access_token_id);


--
-- PostgreSQL database dump complete
--

