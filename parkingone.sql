--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.3

-- Started on 2020-06-05 18:03:08

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

DROP DATABASE parking_one;
--
-- TOC entry 2965 (class 1262 OID 16384)
-- Name: parking_one; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE parking_one WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE parking_one OWNER TO postgres;

\connect parking_one

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
-- TOC entry 205 (class 1259 OID 16403)
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id integer NOT NULL,
    parking_slot_id integer,
    user_id integer,
    start_time timestamp without time zone,
    end_time timestamp without time zone
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16423)
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.bookings ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 207 (class 1259 OID 16413)
-- Name: feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedback (
    id integer NOT NULL,
    user_id integer,
    feedback character varying(500)
);


ALTER TABLE public.feedback OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16425)
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.feedback ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 206 (class 1259 OID 16408)
-- Name: parking_slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parking_slots (
    id integer NOT NULL,
    name character varying(50),
    zone character varying(50)
);


ALTER TABLE public.parking_slots OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16421)
-- Name: parking_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.parking_slots ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.parking_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 203 (class 1259 OID 16393)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16431)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 204 (class 1259 OID 16398)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16429)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 202 (class 1259 OID 16385)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    email_confirmed_at timestamp without time zone,
    username character varying(50),
    password character varying(255),
    active boolean DEFAULT true NOT NULL,
    first_name character varying(50),
    last_name character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16427)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2951 (class 0 OID 16403)
-- Dependencies: 205
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bookings (id, parking_slot_id, user_id, start_time, end_time) OVERRIDING SYSTEM VALUE VALUES (11, 1, 13, '2020-12-20 18:00:00', '2020-12-20 19:00:00');
INSERT INTO public.bookings (id, parking_slot_id, user_id, start_time, end_time) OVERRIDING SYSTEM VALUE VALUES (12, 1, 13, '2020-12-20 18:00:00', '2020-12-20 19:00:00');
INSERT INTO public.bookings (id, parking_slot_id, user_id, start_time, end_time) OVERRIDING SYSTEM VALUE VALUES (13, 1, 13, '2020-12-20 18:00:00', '2020-12-20 19:00:00');
INSERT INTO public.bookings (id, parking_slot_id, user_id, start_time, end_time) OVERRIDING SYSTEM VALUE VALUES (14, 1, 13, '2020-12-20 18:00:00', '2020-12-20 19:00:00');
INSERT INTO public.bookings (id, parking_slot_id, user_id, start_time, end_time) OVERRIDING SYSTEM VALUE VALUES (15, 1, 13, '2020-12-20 18:00:00', '2020-12-20 19:00:00');


--
-- TOC entry 2953 (class 0 OID 16413)
-- Dependencies: 207
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.feedback (id, user_id, feedback) OVERRIDING SYSTEM VALUE VALUES (1, 3, 'Very good');
INSERT INTO public.feedback (id, user_id, feedback) OVERRIDING SYSTEM VALUE VALUES (2, 3, 'Very Good');
INSERT INTO public.feedback (id, user_id, feedback) OVERRIDING SYSTEM VALUE VALUES (3, 13, 'New feedback');
INSERT INTO public.feedback (id, user_id, feedback) OVERRIDING SYSTEM VALUE VALUES (4, 13, 'Another one');


--
-- TOC entry 2952 (class 0 OID 16408)
-- Dependencies: 206
-- Data for Name: parking_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.parking_slots (id, name, zone) OVERRIDING SYSTEM VALUE VALUES (1, 'Parking Spot 1', 'P1');
INSERT INTO public.parking_slots (id, name, zone) OVERRIDING SYSTEM VALUE VALUES (2, 'Parking Spot 2', 'P1');
INSERT INTO public.parking_slots (id, name, zone) OVERRIDING SYSTEM VALUE VALUES (3, 'Parking Spot 3', 'P1');
INSERT INTO public.parking_slots (id, name, zone) OVERRIDING SYSTEM VALUE VALUES (4, 'Parking Spot 5', 'P1');


--
-- TOC entry 2949 (class 0 OID 16393)
-- Dependencies: 203
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (id, name) OVERRIDING SYSTEM VALUE VALUES (5, 'Admin');
INSERT INTO public.roles (id, name) OVERRIDING SYSTEM VALUE VALUES (6, 'Agent');


--
-- TOC entry 2950 (class 0 OID 16398)
-- Dependencies: 204
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_roles (id, user_id, role_id) OVERRIDING SYSTEM VALUE VALUES (1, 3, 5);
INSERT INTO public.user_roles (id, user_id, role_id) OVERRIDING SYSTEM VALUE VALUES (2, 3, 6);


--
-- TOC entry 2948 (class 0 OID 16385)
-- Dependencies: 202
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, email, email_confirmed_at, username, password, active, first_name, last_name) OVERRIDING SYSTEM VALUE VALUES (3, 'admin@test.com', '2020-06-04 14:52:06.809958', 'admin', '$2b$12$RwUbdrr8upovg7lS9TrG6.Q93Q6Df/741WtqzB6OYZdwXqV3BQQWe', true, 'Admin', 'Admin');
INSERT INTO public.users (id, email, email_confirmed_at, username, password, active, first_name, last_name) OVERRIDING SYSTEM VALUE VALUES (13, 'test@test.com', '2020-06-04 20:08:57.633786', 'user1', '$2b$12$IogxSDgT6NPt/TW.Fm/aC.Hy2ypE.0mdJ/.6rRKmPDjUOxSoYOulW', true, NULL, NULL);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 209
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 15, true);


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 210
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_id_seq', 4, true);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 208
-- Name: parking_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parking_slots_id_seq', 4, true);


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 213
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 8, true);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 4, true);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- TOC entry 2817 (class 2606 OID 16407)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 16420)
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 16412)
-- Name: parking_slots parking_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking_slots
    ADD CONSTRAINT parking_slots_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 16397)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 16402)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 16392)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2020-06-05 18:03:09

--
-- PostgreSQL database dump complete
--

