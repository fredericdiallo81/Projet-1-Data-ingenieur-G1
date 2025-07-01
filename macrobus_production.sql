--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-27 19:39:37

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 24946)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id_client integer NOT NULL,
    nom character varying(100),
    prenom character varying(100),
    email character varying(150),
    telephone character varying(20),
    ville character varying(100),
    pays character varying(100)
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24945)
-- Name: clients_id_client_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_client_seq OWNER TO postgres;

--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 221
-- Name: clients_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_client_seq OWNED BY public.clients.id_client;


--
-- TOC entry 226 (class 1259 OID 24962)
-- Name: commandes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commandes (
    id_commande integer NOT NULL,
    id_client integer,
    id_produit integer,
    id_commercial integer,
    date_commande date,
    quantite integer,
    montant_total numeric(12,2)
);


ALTER TABLE public.commandes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24961)
-- Name: commandes_id_commande_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commandes_id_commande_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commandes_id_commande_seq OWNER TO postgres;

--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 225
-- Name: commandes_id_commande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commandes_id_commande_seq OWNED BY public.commandes.id_commande;


--
-- TOC entry 220 (class 1259 OID 24934)
-- Name: commerciaux; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commerciaux (
    id_commercial integer NOT NULL,
    nom character varying(100),
    prenom character varying(100),
    email character varying(150),
    id_region integer
);


ALTER TABLE public.commerciaux OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24933)
-- Name: commerciaux_id_commercial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commerciaux_id_commercial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commerciaux_id_commercial_seq OWNER TO postgres;

--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 219
-- Name: commerciaux_id_commercial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commerciaux_id_commercial_seq OWNED BY public.commerciaux.id_commercial;


--
-- TOC entry 224 (class 1259 OID 24955)
-- Name: produits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produits (
    id_produit integer NOT NULL,
    nom_produit character varying(100),
    categorie character varying(50),
    prix numeric(10,2)
);


ALTER TABLE public.produits OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24954)
-- Name: produits_id_produit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produits_id_produit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produits_id_produit_seq OWNER TO postgres;

--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 223
-- Name: produits_id_produit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produits_id_produit_seq OWNED BY public.produits.id_produit;


--
-- TOC entry 218 (class 1259 OID 24927)
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id_region integer NOT NULL,
    nom_region character varying(100),
    pays character varying(100)
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24926)
-- Name: regions_id_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_id_region_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regions_id_region_seq OWNER TO postgres;

--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 217
-- Name: regions_id_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_id_region_seq OWNED BY public.regions.id_region;


--
-- TOC entry 4663 (class 2604 OID 24949)
-- Name: clients id_client; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id_client SET DEFAULT nextval('public.clients_id_client_seq'::regclass);


--
-- TOC entry 4665 (class 2604 OID 24965)
-- Name: commandes id_commande; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes ALTER COLUMN id_commande SET DEFAULT nextval('public.commandes_id_commande_seq'::regclass);


--
-- TOC entry 4662 (class 2604 OID 24937)
-- Name: commerciaux id_commercial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commerciaux ALTER COLUMN id_commercial SET DEFAULT nextval('public.commerciaux_id_commercial_seq'::regclass);


--
-- TOC entry 4664 (class 2604 OID 24958)
-- Name: produits id_produit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produits ALTER COLUMN id_produit SET DEFAULT nextval('public.produits_id_produit_seq'::regclass);


--
-- TOC entry 4661 (class 2604 OID 24930)
-- Name: regions id_region; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id_region SET DEFAULT nextval('public.regions_id_region_seq'::regclass);


--
-- TOC entry 4830 (class 0 OID 24946)
-- Dependencies: 222
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id_client, nom, prenom, email, telephone, ville, pays) FROM stdin;
1	Ndiaye	Awa	awa.ndiaye@gmail.com	771234567	Dakar	Sénégal
2	Ba	Moussa	moussa.ba@gmail.com	772345678	Saint-Louis	Sénégal
3	Diop	Fatou	fatou.diop@gmail.com	773456789	Kaolack	Sénégal
4	Fall	Abdou	abdou.fall@gmail.com	774567890	Thiès	Sénégal
5	Gueye	Mariama	mariama.gueye@gmail.com	775678901	Ziguinchor	Sénégal
6	Sow	Cheikh	cheikh.sow@gmail.com	776789012	Kolda	Sénégal
7	Faye	Khady	khady.faye@gmail.com	777890123	Fatick	Sénégal
8	Diallo	Ibrahima	ibrahima.diallo@gmail.com	778901234	Tambacounda	Sénégal
9	Ba	Mame	mame.ba@gmail.com	770001111	Saint-Louis	Sénégal
101	Sow	Mame	mame.sow@gmail.com	771112233	Thiès	Sénégal
102	Diop	Cheikh	cheikh.diop@gmail.com	772223344	Dakar	Sénégal
103	Sy	Ousmane	ousmane.sy@gmail.com	773334455	Saint-Louis	Sénégal
104	Ba	Fatou	fatou.ba@gmail.com	774445566	Ziguinchor	Sénégal
105	Fall	Adama	adama.fall@gmail.com	775556677	Louga	Sénégal
106	Camara	Aminata	aminata.camara@gmail.com	776667788	Kaolack	Sénégal
107	Faye	Ibrahima	ibrahima.faye@gmail.com	777778899	Kolda	Sénégal
108	Gueye	Mariama	mariama.gueye@gmail.com	778889900	Dakar	Sénégal
109	Seck	Khady	khady.seck@gmail.com	779990011	Matam	Sénégal
110	Ndiaye	Awa	awa.ndiaye@gmail.com	770001122	Tambacounda	Sénégal
111		Aminata	aminata.ndiaye@gmail.com	775556677	Kaolack	Sénégal
112	Gueye		gueye@	776667788	Dakar	Sénégal
113	Fall	Moussa		77	Louga	Sénégal
114	Seck	Awa	awa.seck@gmail.com	778889900		Sénégal
115	Camara	Ibrahima	ibrahima.camara@gmail.com	779990011	Dakar	Sénégal
116	Camara	Ibrahima	ibrahima.camara@gmail.com	779990011	Dakar	Sénégal
117	Sarr	Aliou	aliou.sarr@gmail.com	770112233	Dakar	Sénégal
118	Ba	Oumou	oumou.ba@gmail.com	770223344	Saint-Louis	Sénégal
119	Sy	Mamadou	mamadou.sy@gmail.com	770334455	Thiès	Sénégal
120	Ndiaye	Seynabou	seynabou.ndiaye@gmail.com	770445566	Fatick	Sénégal
121	Faye	Lamine	lamine.faye@gmail.com	770556677	Ziguinchor	Sénégal
122	\N	Ousmane	invalide.email	77AB1234	Dakar	Sénégal
123	Ba	\N	ba.gmail.com	770667788	Thiès	Sénégal
124	Diop	Fatou	fatou.diop@gmail.com	\N	Saint-Louis	Sénégal
125	Gueye	Alioune	alioune.gueye@gmail.com	77		Sénégal
126	Fall	Khadija			Kaolack	Sénégal
127	Sow	Cheikh	cheikh.sow@gmail.com	770667788	Dakar	Sénégal
128	Faye	Fatou	fatou.faye@gmail.com	770778899	Louga	Sénégal
129	Sy	Khady	khady.sy@gmail.com	770889900	Kolda	Sénégal
130	Ba	Abdou	abdou.ba@gmail.com	770990011	Fatick	Sénégal
131	Ndiaye	Youssou	youssou.ndiaye@gmail.com	771001122	Thiès	Sénégal
132	Camara	Moussa	moussa.camara@gmail.com	771112233	Matam	Sénégal
133	Gueye	Mame	mame.gueye@gmail.com	771223344	Ziguinchor	Sénégal
134	Diop	Alioune	alioune.diop@gmail.com	771334455	Dakar	Sénégal
135	Ba	Seynabou	seynabou.ba@gmail.com	771445566	Tambacounda	Sénégal
136	Fall	Moussa	moussa.fall@gmail.com	771556677	Saint-Louis	Sénégal
137	Sy	Lamine	lamine.sy@gmail.com	771667788	Louga	Sénégal
138	Seck	Astou	astou.seck@gmail.com	771778899	Kaolack	Sénégal
139	Ba	Ibrahima	ibrahima.ba@gmail.com	771889900	Thiès	Sénégal
140	Ndiaye	Khady	khady.ndiaye@gmail.com	771990011	Dakar	Sénégal
141	Sow	Fatou	fatou.sow@gmail.com	772001122	Kolda	Sénégal
\.


--
-- TOC entry 4834 (class 0 OID 24962)
-- Dependencies: 226
-- Data for Name: commandes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commandes (id_commande, id_client, id_produit, id_commercial, date_commande, quantite, montant_total) FROM stdin;
1	1	1	1	2023-01-15	1	5000000.00
2	2	3	2	2023-04-10	1	8000000.00
3	3	2	3	2023-06-05	1	12000000.00
4	4	4	4	2023-07-20	1	6500000.00
5	5	1	5	2023-08-01	2	10000000.00
6	6	2	6	2023-09-12	1	12000000.00
7	7	3	1	2023-10-22	1	8000000.00
8	8	4	2	2023-11-18	2	13000000.00
9	1	1	1	2023-06-01	1	18000000.00
\.


--
-- TOC entry 4828 (class 0 OID 24934)
-- Dependencies: 220
-- Data for Name: commerciaux; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commerciaux (id_commercial, nom, prenom, email, id_region) FROM stdin;
1	Ndiaye	Alioune	alioune.ndiaye@macrobus.sn	1
2	Sarr	Astou	astou.sarr@macrobus.sn	2
3	Fall	Modou	modou.fall@macrobus.sn	3
4	Diouf	Aminata	aminata.diouf@macrobus.sn	4
5	Seck	Pape	pape.seck@macrobus.sn	5
6	Sy	Yacine	yacine.sy@macrobus.sn	6
7	Diallo	Ibrahima	ibrahima.diallo@macrobus.sn	1
\.


--
-- TOC entry 4832 (class 0 OID 24955)
-- Dependencies: 224
-- Data for Name: produits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produits (id_produit, nom_produit, categorie, prix) FROM stdin;
1	Toyota Hilux	Utilitaire	18000000.00
2	Hyundai Accent	Voiture	9500000.00
3	Renault Kangoo	Utilitaire	10500000.00
4	Mitsubishi L200	Pick-up	17000000.00
5	Kia Rio	Voiture	8900000.00
6	Isuzu D-Max	Camion léger	16000000.00
7	Toyota Coaster	Minibus	25000000.00
8	Nissan Patrol	SUV	27000000.00
9	TOYOTA HILUX	UTILITAIRE	18000000.00
\.


--
-- TOC entry 4826 (class 0 OID 24927)
-- Dependencies: 218
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id_region, nom_region, pays) FROM stdin;
1	Dakar	Sénégal
2	Thiès	Sénégal
3	Diourbel	Sénégal
4	Fatick	Sénégal
5	Kaolack	Sénégal
6	Kaffrine	Sénégal
7	Louga	Sénégal
8	Saint-Louis	Sénégal
9	Matam	Sénégal
10	Tambacounda	Sénégal
11	Kédougou	Sénégal
12	Kolda	Sénégal
13	Sédhiou	Sénégal
14	Ziguinchor	Sénégal
\.


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 221
-- Name: clients_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_client_seq', 9, true);


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 225
-- Name: commandes_id_commande_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commandes_id_commande_seq', 9, true);


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 219
-- Name: commerciaux_id_commercial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commerciaux_id_commercial_seq', 7, true);


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 223
-- Name: produits_id_produit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produits_id_produit_seq', 9, true);


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 217
-- Name: regions_id_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_region_seq', 14, true);


--
-- TOC entry 4671 (class 2606 OID 24953)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4675 (class 2606 OID 24967)
-- Name: commandes commandes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_pkey PRIMARY KEY (id_commande);


--
-- TOC entry 4669 (class 2606 OID 24939)
-- Name: commerciaux commerciaux_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commerciaux
    ADD CONSTRAINT commerciaux_pkey PRIMARY KEY (id_commercial);


--
-- TOC entry 4673 (class 2606 OID 24960)
-- Name: produits produits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT produits_pkey PRIMARY KEY (id_produit);


--
-- TOC entry 4667 (class 2606 OID 24932)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id_region);


--
-- TOC entry 4677 (class 2606 OID 24968)
-- Name: commandes commandes_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.clients(id_client);


--
-- TOC entry 4678 (class 2606 OID 24978)
-- Name: commandes commandes_id_commercial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_id_commercial_fkey FOREIGN KEY (id_commercial) REFERENCES public.commerciaux(id_commercial);


--
-- TOC entry 4679 (class 2606 OID 24973)
-- Name: commandes commandes_id_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_id_produit_fkey FOREIGN KEY (id_produit) REFERENCES public.produits(id_produit);


--
-- TOC entry 4676 (class 2606 OID 24940)
-- Name: commerciaux commerciaux_id_region_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commerciaux
    ADD CONSTRAINT commerciaux_id_region_fkey FOREIGN KEY (id_region) REFERENCES public.regions(id_region);


-- Completed on 2025-06-27 19:39:38

--
-- PostgreSQL database dump complete
--

