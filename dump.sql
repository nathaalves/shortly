--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" character varying(21) NOT NULL,
    "userId" integer NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" date DEFAULT now() NOT NULL
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" date DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, "userId", token, "createdAt") FROM stdin;
1	1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6ImFuZHJlIiwiaWF0IjoxNjU5ODE0NDM1LCJleHAiOjE2NjAwNzM2MzUsInN1YiI6IjEifQ.neLQmHmPAj_MCpru1VZipquzbSmq_2ZpCRDNMPka2fE	2022-08-06 16:33:55.723633
2	2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwibmFtZSI6IkrDumxpYSIsImlhdCI6MTY1OTgxNDYyNywiZXhwIjoxNjYwMDczODI3LCJzdWIiOiIyIn0.h3P7L4roxWzcHoP9b73GxE9XbUnFsoF8TA6c1fgCQ0Q	2022-08-06 16:37:07.320547
3	3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywibmFtZSI6ImFtYW5kYSIsImlhdCI6MTY1OTgxNDY0MSwiZXhwIjoxNjYwMDczODQxLCJzdWIiOiIzIn0.AKS62ebvoutHamnHZB6iidq4lxAhehZDP8ylSbe9oSw	2022-08-06 16:37:21.168627
4	4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwibmFtZSI6Ik1hdGhldXMiLCJpYXQiOjE2NTk4MTQ2NTYsImV4cCI6MTY2MDA3Mzg1Niwic3ViIjoiNCJ9.fRVb2S6F8ylkqgWLSI5YIQFr9RxWn7mLQH6ABwAKaRQ	2022-08-06 16:37:36.106843
5	5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6Ik1hbm9lbCIsImlhdCI6MTY1OTgxNDY2MywiZXhwIjoxNjYwMDczODYzLCJzdWIiOiI1In0.cTvx_TF7rZNjg-IlozU0q5g7oFYp0qa9Rf4ZZ_CSwLI	2022-08-06 16:37:43.899123
6	6	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwibmFtZSI6Ikl6YWJlbGEiLCJpYXQiOjE2NTk4MTQ2NzMsImV4cCI6MTY2MDA3Mzg3Mywic3ViIjoiNiJ9.h2WkqbxsebIzP4kqkwSKr9P_J-Huqmj3MTFXikohfXs	2022-08-06 16:37:53.83309
7	7	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywibmFtZSI6IkdhYnJpZWxhIiwiaWF0IjoxNjU5ODE0NjgzLCJleHAiOjE2NjAwNzM4ODMsInN1YiI6IjcifQ.pBIjptbmMeP0sTix-g_teHbuAnWjipP3QSfiP8XIlKc	2022-08-06 16:38:03.188288
8	8	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwibmFtZSI6IlJhZmFlbCIsImlhdCI6MTY1OTgxNDY5NCwiZXhwIjoxNjYwMDczODk0LCJzdWIiOiI4In0.9qOLnk7G44c5vwHaYB6DlMNdyw6se2KTK--HhCrpxZI	2022-08-06 16:38:14.628796
9	9	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwibmFtZSI6IkNhbWlsYSIsImlhdCI6MTY1OTgxNDcwMywiZXhwIjoxNjYwMDczOTAzLCJzdWIiOiI5In0.LzJAAAC9maqn2-KSWqupiD7te7KhsudCZe22dTutUco	2022-08-06 16:38:23.463918
10	10	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsIm5hbWUiOiJMZWFuZHJvIiwiaWF0IjoxNjU5ODE0NzEzLCJleHAiOjE2NjAwNzM5MTMsInN1YiI6IjEwIn0.-bILTYHWaZep2wXlmkMmeKcIQoEjYlIqev3FccjEoLE	2022-08-06 16:38:33.346892
11	11	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsIm5hbWUiOiJNaXJlbGEiLCJpYXQiOjE2NTk4MTQ3MjMsImV4cCI6MTY2MDA3MzkyMywic3ViIjoiMTEifQ.1U8qQjKv8uuGCmSMNFVOozIqDTD2UEBm9SZw75zZQRs	2022-08-06 16:38:43.448011
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, url, "shortUrl", "userId", "visitCount", "createdAt") FROM stdin;
2	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	e82--6G1iN5zDPDb7nLvf	1	0	2022-08-06
3	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	J0xyN3zEHrpWlHcboscN8	1	0	2022-08-06
5	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	__VAHhGw-lhfrSbqQY40q	1	0	2022-08-06
6	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	fL25kFy5U7ytXT8r2zO11	1	0	2022-08-06
7	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	UThGBMs8FEarmPXhIaFSD	1	0	2022-08-06
8	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	LgwG-uta4ZH1uzLFZhnuI	1	0	2022-08-06
9	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	1BiB02YfbGPF2zn_7nvIC	1	0	2022-08-06
10	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	n4XDlod3YOCYQkQ-NQhop	1	0	2022-08-06
11	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	lPBwCK_j6JqumjzZR8Z5G	1	0	2022-08-06
12	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	y74CIDjhDsRh2R-vCDoxl	1	0	2022-08-06
14	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	Iun2CCeCJel5bIoBQn-L8	1	0	2022-08-06
15	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	RmqZ8XNX4t7jfGkLhGRpL	1	0	2022-08-06
16	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	Oxjc7vXCMISdrQXL3Nhzr	1	0	2022-08-06
17	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	o6p356IETA0RNNboh8asA	1	0	2022-08-06
18	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	aG30PASMUZT5FpnY1ZhBj	1	0	2022-08-06
19	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	v070lPz9TZII_c4uqGSz3	1	0	2022-08-06
20	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	DfUNnrdDCrXONHABONMav	1	0	2022-08-06
21	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	sCCbk3lJVpGFMT4RvMqM8	2	0	2022-08-06
22	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	r3U7F10QN3zrbL5io87-V	2	0	2022-08-06
23	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	7VSx5NdTZwI2awDiKE8xu	2	0	2022-08-06
25	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	sqNhIr_DzUG8Jo5eYUiQq	2	0	2022-08-06
26	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	wO4m7aOiLBpBv-vzuiJGA	2	0	2022-08-06
27	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	y7pDOrCQF2qFBfpOQ8xM8	2	0	2022-08-06
28	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	J50QYrKrWoSAZcjsMUPFy	2	0	2022-08-06
29	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	tkUFRMsd-D5q2y_dsHM6V	2	0	2022-08-06
30	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	f511bqlcBiCADTOXWP1y0	2	0	2022-08-06
31	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	TSAhwg1PrE8GmXYee0K-s	2	0	2022-08-06
33	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	ki8AB2U4IftYdrWtDKBpn	2	0	2022-08-06
34	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	K30Gir8kIhnGz6SERgZ3u	2	0	2022-08-06
35	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	Y1j-E0AA3BPjjZK8IhwUf	2	0	2022-08-06
36	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	02u6AIUcPsdtfCNeSRZ3T	2	0	2022-08-06
37	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	lemd5rVKY_9XWFO9YlXif	2	0	2022-08-06
39	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	itXQ9izRH8Yg1XRbEOuBL	2	0	2022-08-06
41	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	0VzjXX47b5enEn8bhGqlK	3	0	2022-08-06
42	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	osI7U_Nvsq0ovLbSrteM-	3	0	2022-08-06
44	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	4Sb0Yvk_ld0vLsSawsomm	3	0	2022-08-06
45	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	v7LwMlKdfKEt0kSVJtuLH	3	0	2022-08-06
46	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	DJcRZrsOO0tqc9AFT6Nrj	3	0	2022-08-06
47	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	DefOwC9Ch7FNbnJLn2N9L	3	0	2022-08-06
49	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	39ssBNlLhCivSAxP-fSa9	3	0	2022-08-06
50	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	CJpf3lAECN-jeRdkLi1pU	4	0	2022-08-06
51	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	TTjaxquHEgtasEUPFmhlU	4	0	2022-08-06
52	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	4NteertmIuUajh4X-8S88	4	0	2022-08-06
53	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	Uqr4K-7_fpZ2QPnCUDKx-	4	0	2022-08-06
55	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	VyDtNAvvAzWN2CwofpHq-	4	0	2022-08-06
56	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	BwKZiWU6SI2Tx321p71g2	4	0	2022-08-06
57	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	hLy6JZtfnQX3M1WQilnDJ	4	0	2022-08-06
58	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	L7xyIPNrF_ieiPaNdE1od	4	0	2022-08-06
4	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	UrsBY99tReKKYwbrijlJf	1	7	2022-08-06
13	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	wGoPUblHl9eG1Lc__cKAC	1	9	2022-08-06
32	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	nIkYBV5wixnuasqyyr9k2	2	23	2022-08-06
24	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	8_4lGPL1OhTJigUbCAd0C	2	6	2022-08-06
38	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	MYph7Gln-wcakfMol81V1	2	7	2022-08-06
48	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	8MeBGon_t-DNK5y29Wzlq	3	8	2022-08-06
54	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	9bzCFan8X1vQ6r6Iqh5Eo	4	34	2022-08-06
59	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	0Cq9mJMNFIptAsTeYhWXM	4	0	2022-08-06
60	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	tA-CWEABfHq8sBvBY-CXo	4	0	2022-08-06
61	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	-sPz2D7BoX4MDtkKbOqQU	4	0	2022-08-06
63	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	c9pxxt0h_z2AmOOp0Cj1w	5	0	2022-08-06
64	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	QQ76CLgMV2v0_5rLTvFq6	5	0	2022-08-06
65	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	bqIptwrAuD6-q9M_e9Ecb	5	0	2022-08-06
66	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	VUPrPrGUMftt84klrLTML	5	0	2022-08-06
67	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	LXmOwSCiC05Bn_nMEB5MT	5	0	2022-08-06
69	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	hWZUKy4xMtKEWGzJ7HVI0	6	0	2022-08-06
70	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	1v7Z35yIhpS6Y72nAyhb7	6	0	2022-08-06
72	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	pHns8AvOaRKEkKyBJAXOo	7	0	2022-08-06
73	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	7donvT4XhcALstg4HCljK	7	0	2022-08-06
74	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	64sFt5_XJ4R30FeXq7q4h	7	0	2022-08-06
76	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	uv1GhMTUGSbVk3h66_-MX	7	0	2022-08-06
77	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	Dna-dpSduZY0ZX0zNgOpy	7	0	2022-08-06
78	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	EOxOGflzUrSAAOqnGgLro	7	0	2022-08-06
79	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	TdKkJwF0q87pgHSX7Kp_t	7	0	2022-08-06
80	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	OO994SGUPk4QTAXqvA_OK	7	0	2022-08-06
82	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	GIgQGdfqqJLyzRnsLQOOp	7	0	2022-08-06
83	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	ADUcwVc7Ab3JJtPBk4CeP	7	0	2022-08-06
85	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	QpCf0BTbkI4EI-J5BBJ4Q	7	0	2022-08-06
86	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	N_iUyf3Bi5lpKjVIu-Ex8	7	0	2022-08-06
87	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	wO5ZaykglGbUeMf7YG2fq	7	0	2022-08-06
90	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	4RjxQ0fZaS8XFJcZ7NjTG	7	0	2022-08-06
91	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	04B4CoX-qXbKnnWxa-rmj	7	0	2022-08-06
92	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	QH8vqFT2bAdzO2CFzi4ZW	7	0	2022-08-06
93	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	qJBbO5_zf9TnJ5Im46hKS	7	0	2022-08-06
95	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	biCSJYcy43WqNbM7rRV1i	7	0	2022-08-06
96	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	EwgmuDICj4YZd8RcIJB-f	7	0	2022-08-06
97	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	0ZuuLLEPCf0gDGq4kI9eO	7	0	2022-08-06
99	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	Z0uOeTmHj8iuXrqR-Tc89	7	0	2022-08-06
101	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	agCiVfaS6J6_KQvrVCa0s	7	0	2022-08-06
102	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	oYbM6sWi3tEnDt-TsDSGn	7	0	2022-08-06
103	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	6vfVndFcBuUtsHgTDcXwP	7	0	2022-08-06
105	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	t4nkBMxNT2mi6gunLmS9T	7	0	2022-08-06
106	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	6pfOGeel1qGWbBeKobHN9	7	0	2022-08-06
107	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	zyfGO6kfSw75kWL9m4CbP	7	0	2022-08-06
109	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	N3I_-nGXXurRfV2MNMsYj	7	0	2022-08-06
110	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	ssvOJI-C8xMDpWz7lS1gw	7	0	2022-08-06
111	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	shJWK5bJr_17tHk1Yu6De	7	0	2022-08-06
112	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	iynFmpZ7wv4eknfj25DyZ	7	0	2022-08-06
113	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	lnz7dc0bgLKVZTB9UuJBr	7	0	2022-08-06
114	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	_a95QrVvCrdL-f50BzHzC	7	0	2022-08-06
115	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	4EMJz6pdbZWiJUhGUFPnW	7	0	2022-08-06
116	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	lGEhka98assstKuYPACMV	7	0	2022-08-06
68	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	e1_gxVbsqp_V-N-qS9d8n	5	5	2022-08-06
71	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	ZjLO5U8rFKjoI8900KCb8	7	7	2022-08-06
75	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	jbMrCbfL55_-op4KUEcI8	7	9	2022-08-06
89	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	jmF3UpdhTcxANiw6OfElh	7	3	2022-08-06
81	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	Co1ViIXwCbUQOqFWpnwu_	7	8	2022-08-06
84	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	YMzFSU_kGbAuIknjISFA0	7	6	2022-08-06
88	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	zHWWmwhQ_xTBv2p4zWlh0	7	6	2022-08-06
94	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	ALuRSIZ12pXCfb-pnXqoc	7	11	2022-08-06
98	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	4e-44ZMvAAhtakTrJv2M-	7	7	2022-08-06
100	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	zmV3pv9lBz-ND-cJbN1jU	7	7	2022-08-06
108	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	yKEa2fdu27OBqIbnBS36b	7	5	2022-08-06
117	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	vcwmyzbJJU-k_BmazI2Py	7	0	2022-08-06
118	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	o4-nDu1sHlZw8D_kuHTMl	7	0	2022-08-06
119	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	AQ-6M1FvfdS4bPdyJlCFz	8	0	2022-08-06
121	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	BsHQmDyhEdoabPZrfLIz_	8	0	2022-08-06
122	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	xOO_YmSG9bZU4BEeRKnYy	8	0	2022-08-06
124	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	6GSVfgwU3KSYkjSfyx8G7	8	0	2022-08-06
125	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	znujV0Qw2rt8wEgGFsTz1	8	0	2022-08-06
126	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	fr6DST2lWP6MD-8ClCplp	8	0	2022-08-06
127	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	ARLwBuf-U9HbBUQAwUlUj	8	0	2022-08-06
128	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	ihnEO-Tc83Ypn7ooaB1M0	8	0	2022-08-06
129	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	Y75b0Ud9DtR5QD3juGIlX	8	0	2022-08-06
131	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	VFtYWDpHKqUCLQgj91uV_	8	0	2022-08-06
132	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	FrtySCf9FeZhgSgQpmomb	8	0	2022-08-06
133	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	QOwF-mJLE2fkM3MDch8gX	8	0	2022-08-06
134	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	ObvuQhuUgo-R1F-ixfRnu	8	0	2022-08-06
120	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	wVgm8H1eTJ8e6KazC2Uw6	8	6	2022-08-06
135	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	Y3V1ta2gaWP6W9m5gnglF	9	19	2022-08-06
123	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	hI5lpBTpEzvUkO9WQ9Q6q	8	6	2022-08-06
1	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	kq4gm-M_hBtcOp_aA37M6	1	11	2022-08-06
130	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	jgxRONXrow3ZLSlavZSTD	8	7	2022-08-06
62	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	Z3_I9-FeFechMoYo2NNcZ	4	13	2022-08-06
104	https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg	VMLmPKh3n0LLxz0EHx0xc	7	7	2022-08-06
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, "createdAt") FROM stdin;
1	andre	andre@driven.com.br	$2b$08$yR2Ezemo8tyDixGhP3X8peD6JyU4XdAa/X13i45gznmyjDPbk.5CC	2022-08-06
2	Júlia	julia@driven.com.br	$2b$08$Opw8UynYTiQXbijeUm9.POamJ6Fg.KPJv2Bg3AadWxediWORL3M/6	2022-08-06
3	amanda	amanda@driven.com.br	$2b$08$GgsL3wIzwp3Nko5wf/baIeQLtyF0Cg3oWjaObRlvOl2G7N98YvHR6	2022-08-06
4	Matheus	matheus@driven.com.br	$2b$08$AbdtsjaLVP2cMOmAXjH3y.cBii2mb52V7lhotNd5dw2QIdMENFWdy	2022-08-06
5	Manoel	manoel@driven.com.br	$2b$08$Ue6bx5Yr6CHyOHR4TdgbHOdUIYCjeLqb3Hr4q5pkSHt6vvuv/NFf2	2022-08-06
6	Izabela	izabela@driven.com.br	$2b$08$f4Hgo4eHXYFDLSnad2ereuDweCmsChHViOPyjAQGWyJMmuKXAhzDK	2022-08-06
7	Gabriela	gabriela@driven.com.br	$2b$08$PJ4LkCDslp6NJ4qm64bXruQBazvBiICzxXq/8qC5RWxOE2TPQVhfu	2022-08-06
8	Rafael	rafael@driven.com.br	$2b$08$pf/v7AD/bzBoQT6gCI3IPO9f452cfyKC6hkvK/X0Ruk1CpLydg0sG	2022-08-06
9	Camila	camila@driven.com.br	$2b$08$q5.pkLo65/aPjzhGW9bcGuH.XIQQobmNpCVhaamaMpnp6e8L8MoDe	2022-08-06
10	Leandro	leandro@driven.com.br	$2b$08$xuPc6ZnZ5iTr5BQhUgZSzuGD4gCJAUr.3KY08sG1n4mPJ4nF5TBEW	2022-08-06
11	Mirela	mirela@driven.com.br	$2b$08$cYUwUj7TsLLwdKyqdMwsOOFQrbG2tEyEV4gd8cTU5B/hhiRAuZB8S	2022-08-06
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 11, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 135, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

