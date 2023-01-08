--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    distanza numeric,
    affidabile boolean,
    codice integer,
    conosco text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    distanza numeric,
    affidabile boolean,
    codice integer,
    conosco text NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    distanza numeric,
    affidabile boolean,
    codice integer,
    conosco text NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: prova; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.prova (
    prova_id integer NOT NULL,
    name character varying(20),
    distanza numeric,
    affidabile boolean,
    codice integer,
    conosco text NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.prova OWNER TO freecodecamp;

--
-- Name: prova_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.prova_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prova_moon_id_seq OWNER TO freecodecamp;

--
-- Name: prova_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.prova_moon_id_seq OWNED BY public.prova.moon_id;


--
-- Name: prova_prova_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.prova_prova_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prova_prova_id_seq OWNER TO freecodecamp;

--
-- Name: prova_prova_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.prova_prova_id_seq OWNED BY public.prova.prova_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    distanza numeric,
    affidabile boolean,
    codice integer,
    conosco text NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: prova prova_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.prova ALTER COLUMN prova_id SET DEFAULT nextval('public.prova_prova_id_seq'::regclass);


--
-- Name: prova moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.prova ALTER COLUMN moon_id SET DEFAULT nextval('public.prova_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'uno', 1.23, true, 12, 'no');
INSERT INTO public.galaxy VALUES (2, 'due', 2.23, true, 13, 'no');
INSERT INTO public.galaxy VALUES (3, 'tre', 3.23, true, 33, 'no');
INSERT INTO public.galaxy VALUES (4, 'quattro', 3.33, true, 32, 'no');
INSERT INTO public.galaxy VALUES (5, '5', 3.43, true, 32, 'si');
INSERT INTO public.galaxy VALUES (6, 'boh', 3.13, false, 322, 'si');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'dthb', 0.31, false, 23, 'no', 3);
INSERT INTO public.moon VALUES (2, 'ass3de', 23.1, false, 342, 'si', 2);
INSERT INTO public.moon VALUES (3, 'sweswe', 2.4, false, 4, 'si', 1);
INSERT INTO public.moon VALUES (4, 'asat', 3.1, true, 7, 'no', 1);
INSERT INTO public.moon VALUES (5, 'drgder', 4.2, true, 455, 'no', 14);
INSERT INTO public.moon VALUES (6, 'sw43ddf', 4.1, false, 100, 'no', 2);
INSERT INTO public.moon VALUES (7, 'd3thb', 0.31, false, 23, 'no', 3);
INSERT INTO public.moon VALUES (8, 'a4ss3de', 23.1, false, 342, 'si', 2);
INSERT INTO public.moon VALUES (9, 'swesdwe', 2.4, false, 4, 'si', 1);
INSERT INTO public.moon VALUES (10, 'asddat', 3.1, true, 7, 'no', 1);
INSERT INTO public.moon VALUES (11, 'drswgder', 4.2, true, 455, 'no', 14);
INSERT INTO public.moon VALUES (12, 'dsw43ddf', 4.1, false, 100, 'no', 2);
INSERT INTO public.moon VALUES (13, 'd3dethb', 0.31, false, 23, 'no', 3);
INSERT INTO public.moon VALUES (14, 'aed4ss3de', 23.1, false, 342, 'si', 2);
INSERT INTO public.moon VALUES (15, 'swffesdwe', 2.4, false, 4, 'si', 1);
INSERT INTO public.moon VALUES (16, 'asedsddat', 3.1, true, 7, 'no', 1);
INSERT INTO public.moon VALUES (17, 'drswdegder', 4.2, true, 455, 'no', 14);
INSERT INTO public.moon VALUES (18, 'dsddw43ddf', 4.1, false, 100, 'no', 2);
INSERT INTO public.moon VALUES (19, 'drsswwdegder', 4.2, true, 455, 'no', 14);
INSERT INTO public.moon VALUES (20, 'dsdesddw43ddf', 4.1, false, 100, 'no', 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'terra', 0.1, false, 23, 'no', 1);
INSERT INTO public.planet VALUES (2, 'asdf', 2.1, false, 32, 'si', 2);
INSERT INTO public.planet VALUES (3, 'xswe', 2.4, false, 4, 'si', 3);
INSERT INTO public.planet VALUES (4, 'wsaq', 3.1, true, 7, 'no', 4);
INSERT INTO public.planet VALUES (5, 'sder', 4.2, true, 45, 'no', 5);
INSERT INTO public.planet VALUES (6, 'swdf', 4.1, false, 21, 'no', 6);
INSERT INTO public.planet VALUES (13, 'dgthb', 0.1, false, 23, 'no', 3);
INSERT INTO public.planet VALUES (14, 'assde', 2.1, false, 32, 'si', 3);
INSERT INTO public.planet VALUES (15, 'swewe', 2.4, false, 4, 'si', 4);
INSERT INTO public.planet VALUES (16, 'wsat', 3.1, true, 7, 'no', 1);
INSERT INTO public.planet VALUES (17, 'drgder', 4.2, true, 45, 'no', 1);
INSERT INTO public.planet VALUES (18, 'sw43df', 4.1, false, 100, 'no', 2);


--
-- Data for Name: prova; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.prova VALUES (1, 'asd3dat', 3.1, true, 7, 'no', 1);
INSERT INTO public.prova VALUES (2, 'drwwswgder', 4.2, true, 455, 'no', 14);
INSERT INTO public.prova VALUES (3, 'dsw43swddf', 4.1, false, 100, 'no', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'asde', 32.13, true, 312, 'no', 2);
INSERT INTO public.star VALUES (4, 'aswse', 32.15, true, 311, 'no', 3);
INSERT INTO public.star VALUES (2, '234', 34.13, false, 322, 'no', 4);
INSERT INTO public.star VALUES (1, 'sole', 3.13, false, 322, 'si', 5);
INSERT INTO public.star VALUES (5, 'aserde', 32.15, false, 311, 'si', 1);
INSERT INTO public.star VALUES (6, 'boh', 32.15, true, 311, 'si', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: prova_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.prova_moon_id_seq', 1, false);


--
-- Name: prova_prova_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.prova_prova_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: prova prova_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.prova
    ADD CONSTRAINT prova_name_key UNIQUE (name);


--
-- Name: prova prova_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.prova
    ADD CONSTRAINT prova_pkey PRIMARY KEY (prova_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_f_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_f_key FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_f_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_f_key FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: prova prova_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.prova
    ADD CONSTRAINT prova_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_f_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_f_key FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


