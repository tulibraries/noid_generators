--
-- PostgreSQL database dump
--

\restrict EPcrA7IuZ2Dec1ALEKv4WvFLCw6OYdfBSDmR011YarTFVqbaMsiZWdY9ioWDJWO

-- Dumped from database version 17.7 (Debian 17.7-3.pgdg13+1)
-- Dumped by pg_dump version 17.7 (Debian 17.7-3.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: noid
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO noid;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: noid
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO noid;

--
-- Name: generators; Type: TABLE; Schema: public; Owner: noid
--

CREATE TABLE public.generators (
    id bigint NOT NULL,
    name character varying,
    last_date character varying,
    prefix character varying,
    suffix character varying,
    class_code character varying,
    noid integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project character varying,
    picture_code character varying,
    date_taken character varying,
    lock_version integer
);


ALTER TABLE public.generators OWNER TO noid;

--
-- Name: generators_id_seq; Type: SEQUENCE; Schema: public; Owner: noid
--

CREATE SEQUENCE public.generators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.generators_id_seq OWNER TO noid;

--
-- Name: generators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: noid
--

ALTER SEQUENCE public.generators_id_seq OWNED BY public.generators.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: noid
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    label character varying,
    code character varying,
    prefix character varying,
    suffix character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    generator_id bigint,
    noid integer DEFAULT 0 NOT NULL,
    last_date character varying(2)
);


ALTER TABLE public.projects OWNER TO noid;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: noid
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO noid;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: noid
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: noid
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO noid;

--
-- Name: users; Type: TABLE; Schema: public; Owner: noid
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO noid;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: noid
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO noid;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: noid
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: generators id; Type: DEFAULT; Schema: public; Owner: noid
--

ALTER TABLE ONLY public.generators ALTER COLUMN id SET DEFAULT nextval('public.generators_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: noid
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: noid
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: noid
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2025-09-24 21:09:58.184448	2025-09-24 21:09:58.184453
\.


--
-- Data for Name: generators; Type: TABLE DATA; Schema: public; Owner: noid
--

COPY public.generators (id, name, last_date, prefix, suffix, class_code, noid, created_at, updated_at, project, picture_code, date_taken, lock_version) FROM stdin;
4	Oral Histories	09	\N	\N	\N	23	2020-02-26 18:43:50.876379	2023-09-18 20:58:51.490002	BOHAB	\N	\N	100
3	Templana (Complex)	09	\N	\N	1	1	2020-02-26 18:43:42.709632	2024-09-30 13:20:48.154859	TTUNN	\N	\N	522
5	Mosley Photographs	05	\N	\N	\N	48	2023-02-06 15:20:28.88582	2025-05-23 19:51:57.906166	\N	23	20250523	48
1	General	04	\N	\N	\N	5	2020-02-26 18:43:11.480791	2026-04-10 18:49:27.816411	AINRP	\N	\N	4827
2	Bulletin	04	P	B	\N	34	2020-02-26 18:43:25.382974	2026-04-13 15:25:13.631753	\N	\N	\N	4699
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: noid
--

COPY public.projects (id, label, code, prefix, suffix, name, created_at, updated_at, generator_id, noid, last_date) FROM stdin;
1	MANU	A	\N	\N	UA Manuscripts	2020-02-26 19:34:32.814338	2020-02-26 20:47:59.512018	1	0	\N
2	BULC	A	\N	\N	Bulletin Clippings	2020-02-26 20:50:54.723116	2020-02-26 20:50:54.723116	1	0	\N
4	PJAP	J	\N	\N	PJAC Photos	2020-02-26 21:03:47.792487	2020-02-26 21:03:47.792487	1	0	\N
5	LITF	T	\N	\N	Littell Collection Folders	2020-02-26 21:04:11.163688	2020-02-26 21:04:11.163688	1	0	\N
6	PFP	T	\N	\N	Templana Photos	2020-02-26 21:04:25.996831	2020-02-26 21:04:25.996831	1	0	\N
7	NCP	D	\N	\N	Dance Collection Photos	2020-02-26 21:04:44.95412	2020-02-26 21:04:44.95412	1	0	\N
8	NCE	D	\N	\N	Dance Collection Ephemera	2020-02-26 21:05:27.77418	2020-02-26 21:05:27.77418	1	0	\N
9	ETDPD	T	\N	\N	ETD Digitized Theses	2020-02-26 21:05:56.29789	2020-02-26 21:05:56.29789	1	0	\N
10	TUAP	H	\N	\N	Ambler Images TU Ambler	2020-02-26 21:06:20.316807	2020-02-26 21:06:20.316807	1	0	\N
11	PHWP	H	\N	\N	Ambler Images PHSW	2020-02-26 21:06:48.606302	2020-02-26 21:06:48.606302	1	0	\N
13	B	C	\N	\N	Zines	2020-02-26 21:07:18.74285	2020-02-26 21:07:18.74285	1	0	\N
14	PR	B	\N	\N	Paul Robeson	2020-02-26 21:07:33.365332	2020-02-26 21:07:33.365332	1	0	\N
15	PAMH	A	\N	\N	Urban Archives Pamphlet Collection	2020-02-26 21:07:51.260248	2020-02-26 21:07:51.260248	1	0	\N
16	INQC	A	\N	\N	Inquirer Clippings	2020-02-26 21:08:11.827465	2020-02-26 21:08:11.827465	1	0	\N
17	TTP	T	\N	\N	Temple Times	2020-02-26 21:08:26.986139	2020-02-26 21:08:26.986139	1	0	\N
18	FRRP	A	\N	\N	Frank Zahn Railroad Photograph Collection	2020-02-26 21:08:43.272551	2020-02-26 21:08:43.272551	1	0	\N
19	B	J	\N	\N	PJAC Books	2020-02-26 21:08:57.620375	2020-02-26 21:08:57.620375	1	0	\N
20	WHLVF	M	\N	\N	Levy Family	2020-02-26 21:09:14.97612	2020-02-26 21:09:14.97612	1	0	\N
21	COCM	R	\N	\N	CLIR Cochran	2020-02-26 21:09:45.308393	2020-02-26 21:09:45.308393	1	0	\N
22	FICB	K	\N	\N	Novels- DSC	2020-02-26 21:10:04.352957	2020-02-26 21:10:04.352957	1	0	\N
23	PH	B	\N	\N	Blockson Pamphlet Collection	2020-02-26 21:10:19.484743	2020-02-26 21:10:19.484743	1	0	\N
26	PVI	A	\N	\N	WPVI Log Books	2020-02-26 21:11:04.599143	2020-02-26 21:11:04.599143	1	0	\N
27	CBS	A	\N	\N	KYW Log Books	2020-02-26 21:11:21.243282	2020-02-26 21:11:21.243282	1	0	\N
28	HAP	A	\N	\N	Housing Association Prints and Negatives	2020-02-26 21:11:37.967158	2020-02-26 21:11:37.967158	1	0	\N
29	GOM	J	\N	\N	Gomborow Papers	2020-02-26 21:11:52.220032	2020-02-26 21:11:52.220032	1	0	\N
30	M	J	\N	\N	Jewish Archives Manuscripts	2020-02-26 21:12:05.331043	2020-02-26 21:12:05.331043	1	0	\N
31	BNP	A	\N	\N	Bulletin Negatives and Misc Prints	2020-02-26 21:12:21.906148	2020-02-26 21:12:21.906148	1	0	\N
32	CPP	T	\N	\N	Conwell Family Photographs	2020-02-26 21:12:35.98252	2020-02-26 21:12:35.98252	1	0	\N
33	ELLP	M	\N	\N	Ellis Photographs	2020-02-26 21:12:50.030924	2020-02-26 21:12:50.030924	1	0	\N
34	KNF	A	\N	\N	IHOR2:Kensington Y	2020-02-26 21:13:11.2958	2020-02-26 21:13:11.2958	1	0	\N
35	GRT	A	\N	\N	Germantown YWCA	2020-02-26 21:13:24.667539	2020-02-26 21:13:24.667539	1	0	\N
36	MJC	M	\N	\N	JCRC	2020-02-26 21:13:39.590839	2020-02-26 21:13:39.590839	1	0	\N
37	CLA	A	\N	\N	Pennsylvania Child Labor Association	2020-02-26 21:13:52.512103	2020-02-26 21:13:52.512103	1	0	\N
38	MJY	J	\N	\N	Jewish Ys Centers of Phila, Neighborhood Centre	2020-02-26 21:14:09.102534	2020-02-26 21:14:09.102534	1	0	\N
39	MJCC	J	\N	\N	Jewish Community Centers of Greater Phila	2020-02-26 21:14:27.154044	2020-02-26 21:14:27.154044	1	0	\N
40	OLDSP	T	\N	\N	Oak Lane Day School	2020-02-26 21:14:49.846807	2020-02-26 21:14:49.846807	1	0	\N
41	AV	V	\N	\N	SCRC A/V General	2020-02-26 21:15:03.328595	2020-02-26 21:15:03.328595	1	0	\N
42	TPFP		\N	\N	Templana Picture Files	2020-02-26 21:15:52.752871	2020-02-26 21:15:52.752871	3	0	\N
43	TCPP		\N	\N	Conwell Photographs	2020-02-26 21:16:11.135505	2020-02-26 21:16:11.135505	3	0	\N
44	TTUNN		\N	\N	Temple News	2020-02-26 21:16:24.540369	2020-02-26 21:16:24.540369	3	0	\N
45	AOHWMP		\N	\N	Walter M. Phillips Collection	2020-02-26 21:17:13.072878	2020-02-26 21:17:13.072878	4	0	\N
46	TOHFC		\N	\N	Feinstein	2020-02-26 21:17:26.708757	2020-02-26 21:17:26.708757	4	0	\N
47	BOHWPM		\N	\N	Blockson William Penn Grant Migration	2020-02-26 21:17:42.54699	2020-02-26 21:17:42.54699	4	0	\N
48	HSSM	J	\N	\N	Hebrew Sunday School	2020-03-10 17:53:20.302714	2020-03-10 17:53:20.302714	1	0	\N
24	M	R	\N	\N	General Medieval Manuscripts	2020-02-26 21:10:31.388445	2021-02-09 14:01:16.548787	1	0	\N
49	PSICT	A	\N	\N	Philadelphia Special Investigation Commission Records	2021-11-04 14:16:31.924822	2021-11-04 14:16:31.924822	1	0	\N
51	OHWN	B	\N	\N	Woodbury, NJ Oral Histories	2022-05-26 12:56:05.386796	2022-05-26 12:57:23.57684	4	0	\N
52	TUCC	T	\N	\N	Temple University Course Catalogs	2022-07-20 17:45:13.837859	2022-07-20 17:45:13.837859	1	0	\N
54	FPW001	B	\N	\N	Father Paul M. Washington Papers	2023-01-27 19:59:06.223382	2023-01-27 19:59:06.223382	1	0	\N
55	FRAP	T	\N	\N	Temple Rome Art Programming	2023-02-10 14:27:26.580703	2023-02-10 14:27:26.580703	1	0	\N
57	PTN	T	\N	\N	Pen and Trowel	2023-02-16 16:15:43.910477	2023-02-16 16:15:43.910477	1	0	\N
58	DDN	C	\N	\N	The Drummer	2023-02-17 16:40:08.401213	2023-02-17 17:07:09.261884	1	0	\N
59	OHAB	B	\N	\N	Alpha Boule	2023-03-31 13:53:41.074313	2023-03-31 13:53:41.074313	4	0	\N
60	BBMG	K	\N	\N	Banned Books	2023-05-08 14:19:36.849978	2023-05-08 14:19:36.849978	1	0	\N
61	OHAB	B	\N	\N	Allen Ballard Oral Histories	2023-08-25 19:31:15.817753	2023-08-25 19:31:15.817753	4	0	\N
62	TUBT	T	\N	\N	Temple University Board of Trustees	2024-02-08 21:06:31.170402	2024-02-08 21:06:31.170402	3	0	\N
63	CPPPN	C	\N	\N	Community: Philadelphia's Progressive Paper	2024-08-13 17:46:29.264961	2024-08-13 17:47:07.669638	1	0	\N
66	051DS	BC	\N	\N	David Barton Smith Collection	2025-01-29 17:57:27.207755	2025-01-29 17:57:27.207755	1	0	\N
67	RS	JC	\N	\N	Rodeph Shalom	2025-09-08 14:43:03.857013	2025-09-08 14:43:46.440955	1	0	\N
68	EECM	V	\N	\N	E. E. Cummings Correspondence	2025-10-03 20:11:52.735512	2025-10-03 20:11:52.735512	1	0	\N
69	060ER	BC	\N	\N	Dr. E. Parker Read	2025-10-10 14:29:49.335503	2025-11-13 21:25:24.583358	1	157	11
64	CCCP		\N	\N	Contemporary Culture Collection Posters	2025-01-02 17:49:33.512902	2025-12-02 17:09:07.148817	1	60	12
25	SFCB	S	\N	\N	Sci-Fi - DSC	2020-02-26 21:10:49.758784	2025-11-18 13:05:16.244092	1	254	11
12	GP	A	\N	\N	UA General Photographs	2020-02-26 21:07:04.504115	2026-02-26 22:43:38.526345	1	23	02
65	033SE	BC	\N	\N	American Foundation for Negro Affairs (AFNA) Records	2025-01-28 15:46:32.811	2026-03-25 18:27:51.349287	1	160	03
50	LNSN	C	\N	\N	Liberation News Service	2022-04-21 14:55:48.315821	2026-03-16 20:49:49.705508	1	104	03
3	INRP	A	\N	\N	Inquirer Photos	2020-02-26 21:02:57.548204	2026-04-10 18:49:27.815306	1	5	04
70	061CCX	BC	\N	\N	Philadelphia Clef Club of Jazz & Performing Arts Archives	2026-04-01 14:05:14.973594	2026-04-03 19:28:27.520609	1	198	04
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: noid
--

COPY public.schema_migrations (version) FROM stdin;
20200127165259
20200127165348
20200127180702
20200206151211
20200221175142
20200221210404
20230130134117
20230327123613
20250120213304
20250120213305
20250120213306
20250131120000
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: noid
--

COPY public.users (id, username, password_digest, created_at, updated_at) FROM stdin;
1	admin	$2a$12$1PCrALsJK8xZuQ30A3/IfuZisIyT7cR/CL7LC4AwAd.sbjxN74hm6	2020-02-26 18:38:43.206485	2020-02-26 18:38:43.206485
2	student	$2a$12$VdgQHgEaYl/sI.TJnYlpBO1zQSdPbib/k4pVsw4bmBrWkH0DPQrVO	2020-02-26 19:17:18.714925	2020-02-26 19:17:18.714925
3	bulletin	$2a$12$n3agl8G2uI/Lmuu0KQClQumHza3LRkFRCxb1Wn7gCtIQg4lANng6m	2020-02-26 19:17:37.09013	2020-02-26 19:17:37.09013
\.


--
-- Name: generators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: noid
--

SELECT pg_catalog.setval('public.generators_id_seq', 5, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: noid
--

SELECT pg_catalog.setval('public.projects_id_seq', 70, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: noid
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: noid
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: generators generators_pkey; Type: CONSTRAINT; Schema: public; Owner: noid
--

ALTER TABLE ONLY public.generators
    ADD CONSTRAINT generators_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: noid
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: noid
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: noid
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_projects_on_generator_id; Type: INDEX; Schema: public; Owner: noid
--

CREATE INDEX index_projects_on_generator_id ON public.projects USING btree (generator_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: noid
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict EPcrA7IuZ2Dec1ALEKv4WvFLCw6OYdfBSDmR011YarTFVqbaMsiZWdY9ioWDJWO

