--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-01 04:04:38

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
-- TOC entry 6 (class 2615 OID 65794)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 2 (class 3079 OID 65833)
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 65795)
-- Name: dim_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_clients (
    id_client integer NOT NULL,
    nom text,
    prenom text,
    email text,
    telephone text,
    region text,
    pays text
);


ALTER TABLE public.dim_clients OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 65816)
-- Name: dim_commerciaux; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_commerciaux (
    id_commercial integer NOT NULL,
    nom text,
    prenom text,
    email text,
    id_region integer
);


ALTER TABLE public.dim_commerciaux OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 65802)
-- Name: dim_produits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_produits (
    id_produit integer NOT NULL,
    nom_produit text,
    categorie text,
    prix numeric(10,2)
);


ALTER TABLE public.dim_produits OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 65809)
-- Name: dim_regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_regions (
    id_region integer NOT NULL,
    nom_region text,
    pays text
);


ALTER TABLE public.dim_regions OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 65823)
-- Name: dim_temps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_temps (
    id_date date NOT NULL,
    jour integer,
    mois integer,
    trimestre integer,
    annee integer
);


ALTER TABLE public.dim_temps OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 65828)
-- Name: faits_commandes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faits_commandes (
    id_commande integer NOT NULL,
    id_client integer,
    id_produit integer,
    id_commercial integer,
    id_region integer,
    id_date date,
    quantite integer,
    montant_total numeric(18,2)
);


ALTER TABLE public.faits_commandes OWNER TO postgres;

--
-- TOC entry 4863 (class 0 OID 65795)
-- Dependencies: 218
-- Data for Name: dim_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_clients (id_client, nom, prenom, email, telephone, region, pays) FROM stdin;
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
114	Seck	Awa	awa.seck@gmail.com	778889900		Sénégal
115	Camara	Ibrahima	ibrahima.camara@gmail.com	779990011	Dakar	Sénégal
116	Camara	Ibrahima	ibrahima.camara@gmail.com	779990011	Dakar	Sénégal
117	Sarr	Aliou	aliou.sarr@gmail.com	770112233	Dakar	Sénégal
118	Ba	Oumou	oumou.ba@gmail.com	770223344	Saint-Louis	Sénégal
119	Sy	Mamadou	mamadou.sy@gmail.com	770334455	Thiès	Sénégal
120	Ndiaye	Seynabou	seynabou.ndiaye@gmail.com	770445566	Fatick	Sénégal
121	Faye	Lamine	lamine.faye@gmail.com	770556677	Ziguinchor	Sénégal
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
-- TOC entry 4866 (class 0 OID 65816)
-- Dependencies: 221
-- Data for Name: dim_commerciaux; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_commerciaux (id_commercial, nom, prenom, email, id_region) FROM stdin;
5	Seck	Pape	pape.seck@macrobus.sn	5
3	Fall	Modou	modou.fall@macrobus.sn	3
4	Diouf	Aminata	aminata.diouf@macrobus.sn	4
7	Diallo	Ibrahima	ibrahima.diallo@macrobus.sn	1
2	Sarr	Astou	astou.sarr@macrobus.sn	2
6	Sy	Yacine	yacine.sy@macrobus.sn	6
1	Ndiaye	Alioune	alioune.ndiaye@macrobus.sn	1
\.


--
-- TOC entry 4864 (class 0 OID 65802)
-- Dependencies: 219
-- Data for Name: dim_produits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_produits (id_produit, nom_produit, categorie, prix) FROM stdin;
2	Hyundai Accent	Voiture	9500000.00
5	Kia Rio	Voiture	8900000.00
4	Mitsubishi L200	Pick-up	17000000.00
1	Toyota Hilux	Utilitaire	18000000.00
9	TOYOTA HILUX	UTILITAIRE	18000000.00
7	Toyota Coaster	Minibus	25000000.00
3	Renault Kangoo	Utilitaire	10500000.00
6	Isuzu D-Max	Camion léger	16000000.00
8	Nissan Patrol	SUV	27000000.00
\.


--
-- TOC entry 4865 (class 0 OID 65809)
-- Dependencies: 220
-- Data for Name: dim_regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_regions (id_region, nom_region, pays) FROM stdin;
4	Fatick	Sénégal
12	Kolda	Sénégal
5	Kaolack	Sénégal
13	Sédhiou	Sénégal
11	Kédougou	Sénégal
14	Ziguinchor	Sénégal
8	Saint-Louis	Sénégal
10	Tambacounda	Sénégal
1	Dakar	Sénégal
9	Matam	Sénégal
3	Diourbel	Sénégal
2	Thiès	Sénégal
6	Kaffrine	Sénégal
7	Louga	Sénégal
\.


--
-- TOC entry 4867 (class 0 OID 65823)
-- Dependencies: 222
-- Data for Name: dim_temps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_temps (id_date, jour, mois, trimestre, annee) FROM stdin;
1999-08-07	7	8	3	1999
2004-06-14	14	6	2	2004
1997-03-17	17	3	1	1997
2004-04-04	4	4	2	2004
2003-05-16	16	5	2	2003
2000-11-18	18	11	4	2000
2000-04-06	6	4	2	2000
2011-08-24	24	8	3	2011
2003-01-13	13	1	1	2003
2003-11-23	23	11	4	2003
1997-01-12	12	1	1	1997
2023-07-20	20	7	3	2023
2003-06-13	13	6	2	2003
1995-10-31	31	10	4	1995
2019-05-12	12	5	2	2019
2021-05-08	8	5	2	2021
2022-04-07	7	4	2	2022
2003-12-19	19	12	4	2003
1996-01-10	10	1	1	1996
2023-11-18	18	11	4	2023
2023-11-28	28	11	4	2023
2003-06-27	27	6	2	2003
2003-12-07	7	12	4	2003
2023-06-05	5	6	2	2023
2024-09-01	1	9	3	2024
2023-09-12	12	9	3	2023
2011-05-06	6	5	2	2011
2003-06-29	29	6	2	2003
2006-06-25	25	6	2	2006
2023-05-19	19	5	2	2023
2025-02-08	8	2	1	2025
2016-07-25	25	7	3	2016
2003-04-26	26	4	2	2003
2016-12-16	16	12	4	2016
2023-10-22	22	10	4	2023
2003-05-24	24	5	2	2003
1998-07-09	9	7	3	1998
2012-04-01	1	4	2	2012
1999-11-21	21	11	4	1999
2003-10-05	5	10	4	2003
2012-02-03	3	2	1	2012
2025-03-15	15	3	1	2025
2013-09-25	25	9	3	2013
2016-08-30	30	8	3	2016
1998-08-24	24	8	3	1998
2023-06-01	1	6	2	2023
2025-02-26	26	2	1	2025
2022-11-16	16	11	4	2022
2023-04-10	10	4	2	2023
2003-06-12	12	6	2	2003
2003-12-25	25	12	4	2003
2003-11-13	13	11	4	2003
2023-01-15	15	1	1	2023
2003-01-16	16	1	1	2003
2020-03-28	28	3	1	2020
2007-01-01	1	1	1	2007
2019-03-10	10	3	1	2019
2025-09-19	19	9	3	2025
2010-06-30	30	6	2	2010
2017-05-03	3	5	2	2017
2023-01-11	11	1	1	2023
2024-07-21	21	7	3	2024
2015-06-16	16	6	2	2015
2003-05-06	6	5	2	2003
1996-06-18	18	6	2	1996
2013-07-11	11	7	3	2013
2003-04-18	18	4	2	2003
2011-07-10	10	7	3	2011
2001-07-14	14	7	3	2001
2016-12-29	29	12	4	2016
1996-10-16	16	10	4	1996
2003-06-30	30	6	2	2003
1997-12-14	14	12	4	1997
2023-08-01	1	8	3	2023
2003-05-25	25	5	2	2003
2001-08-20	20	8	3	2001
2006-06-01	1	6	2	2006
2005-06-29	29	6	2	2005
\.


--
-- TOC entry 4868 (class 0 OID 65828)
-- Dependencies: 223
-- Data for Name: faits_commandes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faits_commandes (id_commande, id_client, id_produit, id_commercial, id_region, id_date, quantite, montant_total) FROM stdin;
30010	1	4	3	1	2003-04-18	7	6164637.55
10049	1	4	4	1	2001-07-14	7	426774.42
10046	1	2	3	1	2001-08-20	6	4917923.38
10043	1	5	4	1	2011-08-24	10	4354503.85
10036	1	5	3	1	2015-06-16	5	5615036.75
10035	1	3	1	1	2010-06-30	1	2693575.09
10015	1	2	3	1	2011-07-10	7	4669806.41
9	1	1	1	1	2023-06-01	1	18000000.00
1	1	1	1	1	2023-01-15	1	5000000.00
30009	4	3	3	2	2003-06-13	3	1389542.34
30008	4	3	3	2	2003-05-25	9	2613013.82
30007	4	5	2	2	2003-05-06	10	7533870.62
30006	4	4	2	2	2003-06-29	2	5691480.14
30005	4	5	2	2	2003-05-16	9	2252858.82
30004	4	3	4	2	2003-06-27	5	360795.66
20010	4	4	3	2	2003-11-23	4	2044742.38
20008	4	3	1	2	2003-12-07	6	1663899.65
20003	4	2	1	2	2003-11-13	8	3219669.35
20002	4	3	3	2	2003-10-05	5	7534057.65
10044	4	3	2	2	2021-05-08	2	5608557.78
10042	4	3	3	2	2005-06-29	10	479691.61
10039	4	1	2	2	2000-04-06	3	6061535.57
10037	4	4	2	2	2025-03-15	8	5914027.05
10030	4	2	2	2	1998-07-09	4	6944527.01
10028	4	4	2	2	2016-07-25	7	1122966.75
10025	4	5	4	2	2022-11-16	5	4152978.45
10023	4	3	3	2	2004-04-04	10	1718731.01
10021	4	1	2	2	1996-10-16	4	2387140.55
10016	4	2	2	2	2016-08-30	3	6913623.32
10012	4	5	3	2	2020-03-28	4	6627824.26
4	4	4	4	2	2023-07-20	1	6500000.00
7	7	3	1	4	2023-10-22	1	8000000.00
30002	3	6	4	5	2003-04-26	9	4534020.70
20007	3	5	4	5	2003-01-13	6	6827945.47
20004	3	4	3	5	2003-01-16	1	7619636.01
20001	3	6	4	5	2003-06-30	2	4547812.64
10047	3	4	2	5	2012-02-03	2	2363064.61
10041	3	3	4	5	2025-02-08	4	5346120.50
10040	3	5	4	5	2019-05-12	9	6685362.38
10018	3	1	4	5	2011-05-06	3	5248925.26
10013	3	4	3	5	2006-06-01	8	2712286.14
10011	3	2	3	5	2016-12-16	2	5242227.72
10008	3	6	3	5	2023-05-19	1	5438453.85
10004	3	5	4	5	1999-11-21	3	652761.46
3	3	2	3	5	2023-06-05	1	12000000.00
30001	2	6	3	8	2003-05-24	5	2539690.67
20009	2	1	3	8	2003-06-30	6	1440504.60
20006	2	4	4	8	2003-12-19	10	7428034.06
20005	2	4	2	8	2003-12-25	8	8076618.17
10045	2	5	3	8	2019-03-10	8	577968.13
10031	2	3	1	8	2017-05-03	6	5919443.45
10029	2	2	4	8	1999-08-07	8	3687195.06
10026	2	3	1	8	2004-06-14	7	6772941.34
2	2	3	2	8	2023-04-10	1	8000000.00
8	8	4	2	10	2023-11-18	2	13000000.00
30003	6	5	3	12	2003-06-12	3	3086144.19
10034	6	1	2	12	2006-06-25	8	2444238.38
10032	6	3	2	12	2013-09-25	6	827618.04
10027	6	1	2	12	1996-06-18	4	5988666.22
10019	6	3	3	12	2024-09-01	5	4338072.23
10009	6	2	2	12	2013-07-11	9	2009249.53
10003	6	1	2	12	1995-10-31	2	2150057.12
6	6	2	6	12	2023-09-12	1	12000000.00
10050	5	4	1	14	2007-01-01	7	5419952.41
10048	5	5	2	14	2000-11-18	9	286154.39
10038	5	4	3	14	2022-04-07	10	3520699.63
10033	5	5	3	14	2023-01-11	9	6027367.72
10024	5	3	3	14	1997-03-17	9	2076258.14
10022	5	2	4	14	2025-09-19	8	3314001.60
10020	5	6	4	14	2023-11-28	9	3888555.24
10017	5	5	3	14	2016-12-29	5	1648915.30
10014	5	4	2	14	1996-01-10	1	5465191.04
10010	5	3	3	14	1997-01-12	9	1804363.98
10007	5	1	4	14	2024-07-21	3	668791.10
10006	5	1	2	14	2012-04-01	8	3645360.25
10005	5	6	1	14	2025-02-26	4	6368610.90
10002	5	2	2	14	1997-12-14	4	4704000.39
10001	5	3	2	14	1998-08-24	10	3286190.74
5	5	1	5	14	2023-08-01	2	10000000.00
\.


--
-- TOC entry 4707 (class 2606 OID 65801)
-- Name: dim_clients dim_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_clients
    ADD CONSTRAINT dim_clients_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4713 (class 2606 OID 65822)
-- Name: dim_commerciaux dim_commerciaux_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_commerciaux
    ADD CONSTRAINT dim_commerciaux_pkey PRIMARY KEY (id_commercial);


--
-- TOC entry 4709 (class 2606 OID 65808)
-- Name: dim_produits dim_produits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_produits
    ADD CONSTRAINT dim_produits_pkey PRIMARY KEY (id_produit);


--
-- TOC entry 4711 (class 2606 OID 65815)
-- Name: dim_regions dim_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_regions
    ADD CONSTRAINT dim_regions_pkey PRIMARY KEY (id_region);


--
-- TOC entry 4715 (class 2606 OID 65827)
-- Name: dim_temps dim_temps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_temps
    ADD CONSTRAINT dim_temps_pkey PRIMARY KEY (id_date);


--
-- TOC entry 4717 (class 2606 OID 65832)
-- Name: faits_commandes faits_commandes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faits_commandes
    ADD CONSTRAINT faits_commandes_pkey PRIMARY KEY (id_commande);


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-07-01 04:04:39

--
-- PostgreSQL database dump complete
--

