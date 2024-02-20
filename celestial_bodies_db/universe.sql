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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    distance_from_earth numeric,
    age_in_millions_of_years integer
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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    planet_id integer NOT NULL
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    is_spherical boolean,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    is_alive boolean,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL
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
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy_1', 'galaxy_desc_1', true, 999.9, 999);
INSERT INTO public.galaxy VALUES (2, 'galaxy_2', 'galaxy_desc_2', true, 998.9, 998);
INSERT INTO public.galaxy VALUES (3, 'galaxy_3', 'galaxy_desc_3', false, 997.9, 997);
INSERT INTO public.galaxy VALUES (4, 'galaxy_4', 'galaxy_desc_4', true, 999.9, 999);
INSERT INTO public.galaxy VALUES (5, 'galaxy_5', 'galaxy_desc_5', true, 998.9, 998);
INSERT INTO public.galaxy VALUES (6, 'galaxy_6', 'galaxy_desc_6', false, 997.9, 997);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon_1', 'moon_desc_1', true, 999.8, 999, 1);
INSERT INTO public.moon VALUES (2, 'moon_2', 'moon_desc_2', true, 999.8, 999, 1);
INSERT INTO public.moon VALUES (3, 'moon_3', 'moon_desc_3', false, 999.8, 999, 2);
INSERT INTO public.moon VALUES (4, 'moon_4', 'moon_desc_4', false, 999.8, 999, 2);
INSERT INTO public.moon VALUES (5, 'moon_5', 'moon_desc_5', true, 999.8, 999, 3);
INSERT INTO public.moon VALUES (6, 'moon_6', 'moon_desc_6', true, 999.8, 999, 3);
INSERT INTO public.moon VALUES (7, 'moon_7', 'moon_desc_7', false, 999.8, 999, 4);
INSERT INTO public.moon VALUES (8, 'moon_8', 'moon_desc_8', false, 999.8, 999, 4);
INSERT INTO public.moon VALUES (9, 'moon_9', 'moon_desc_9', true, 999.8, 999, 5);
INSERT INTO public.moon VALUES (10, 'moon_10', 'moon_desc_10', true, 999.8, 999, 5);
INSERT INTO public.moon VALUES (11, 'moon_11', 'moon_desc_11', false, 999.8, 999, 6);
INSERT INTO public.moon VALUES (12, 'moon_12', 'moon_desc_12', false, 999.8, 999, 6);
INSERT INTO public.moon VALUES (13, 'moon_13', 'moon_desc_13', true, 999.8, 999, 7);
INSERT INTO public.moon VALUES (14, 'moon_14', 'moon_desc_14', true, 999.8, 999, 7);
INSERT INTO public.moon VALUES (15, 'moon_15', 'moon_desc_15', false, 999.8, 999, 8);
INSERT INTO public.moon VALUES (16, 'moon_16', 'moon_desc_16', false, 999.8, 999, 8);
INSERT INTO public.moon VALUES (17, 'moon_17', 'moon_desc_17', true, 999.8, 999, 9);
INSERT INTO public.moon VALUES (18, 'moon_18', 'moon_desc_18', true, 999.8, 999, 9);
INSERT INTO public.moon VALUES (19, 'moon_19', 'moon_desc_19', false, 999.8, 999, 10);
INSERT INTO public.moon VALUES (20, 'moon_20', 'moon_desc_20', false, 999.8, 999, 10);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 'star_1', 'more_info_1');
INSERT INTO public.more_info VALUES (2, 2, 'planet_1', 'more_info_2');
INSERT INTO public.more_info VALUES (3, 3, 'moon_1', 'more_info_3');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet_1', 'planet_desc_1', true, 999.9, 999, 1);
INSERT INTO public.planet VALUES (2, 'planet_2', 'planet_desc_2', true, 998.9, 998, 1);
INSERT INTO public.planet VALUES (3, 'planet_3', 'planet_desc_3', false, 997.9, 997, 2);
INSERT INTO public.planet VALUES (4, 'planet_4', 'planet_desc_4', false, 996.9, 996, 2);
INSERT INTO public.planet VALUES (5, 'planet_5', 'planet_desc_5', true, 995.9, 995, 3);
INSERT INTO public.planet VALUES (6, 'planet_6', 'planet_desc_6', true, 994.9, 994, 3);
INSERT INTO public.planet VALUES (7, 'planet_7', 'planet_desc_7', false, 993.9, 993, 4);
INSERT INTO public.planet VALUES (8, 'planet_8', 'planet_desc_8', false, 992.9, 992, 4);
INSERT INTO public.planet VALUES (9, 'planet_9', 'planet_desc_9', true, 991.9, 991, 5);
INSERT INTO public.planet VALUES (10, 'planet_10', 'planet_desc_10', true, 990.9, 990, 5);
INSERT INTO public.planet VALUES (11, 'planet_11', 'planet_desc_11', false, 990.9, 990, 6);
INSERT INTO public.planet VALUES (12, 'planet_12', 'planet_desc_12', false, 990.9, 990, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star_1', 'star_desc_1', true, 999.9, 999, 1);
INSERT INTO public.star VALUES (2, 'star_2', 'star_desc_2', true, 999.8, 999, 2);
INSERT INTO public.star VALUES (3, 'star_3', 'star_desc_3', false, 997.9, 997, 1);
INSERT INTO public.star VALUES (4, 'star_4', 'star_desc_4', false, 996.9, 996, 2);
INSERT INTO public.star VALUES (5, 'star_5', 'star_desc_5', true, 995.9, 995, 4);
INSERT INTO public.star VALUES (6, 'star_6', 'star_desc_6', false, 994.9, 994, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

