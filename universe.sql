--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(40) NOT NULL,
    description text,
    size integer,
    color character varying(30),
    magnitude numeric(5,2),
    is_elliptical boolean
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
    name character varying(40) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    mass_in_kg text,
    diameter_in_km double precision
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
    name character varying(40) NOT NULL,
    liveable boolean NOT NULL,
    description text,
    star_id integer NOT NULL,
    size_in_millionkm double precision,
    planet_type_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_in_celsius integer,
    size_in_millionkm numeric(4,1)
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', 'Closest spiral galaxy to us.', 220000, 'Bluish-white', 3.40, false);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 100000, 'Milky White', -20.90, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum (M33)', 'Small spiral galaxy in Local Group.', 50000, 'Bluer regions', 5.70, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero (M104)', 'Galaxy resembling a sombrero.', 50000, 'White, dark dust lane', 8.00, false);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A (NGC 5128)', 'Elliptical with active nucleus.', 60000, 'Reddish-brown', 6.80, true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud (LMC)', 'Satellite of Milky Way.', 14000, 'Bluish-white', 0.90, false);
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud (SMC)', 'Companion galaxy to LMC.', 7000, 'Bluish-white', 2.70, false);
INSERT INTO public.galaxy VALUES (8, 'Whirlpool (M51)', 'Known for spiral arms and interactions.', 60000, 'Bluish-white', 8.40, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s natural satellite.', 3, '7.35e22', 3474.8);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Small moon of Mars.', 4, '1.08e16', 22.4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Even smaller moon of Mars.', 4, '2.0e15', 12.4);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanically active moon of Jupiter.', 5, '8.93e22', 3642);
INSERT INTO public.moon VALUES (5, 'Europa', 'Possibly has a subsurface ocean.', 5, '4.8e22', 3121.6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System.', 5, '1.48e23', 5262.4);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Ancient and heavily cratered moon of Jupiter.', 5, '1.08e23', 4800);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn; has a dense atmosphere.', 6, '1.35e23', 5150);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Bright icy moon of Saturn.', 6, '2.31e21', 1527.6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Two-toned moon of Saturn with a dark leading side.', 6, '1.81e21', 1468);
INSERT INTO public.moon VALUES (11, 'Titania', 'Largest moon of Uranus; composed mainly of ice and rock.', 7, '3.4e21', 1578);
INSERT INTO public.moon VALUES (12, 'Oberon', 'Second largest moon of Uranus.', 7, '3.01e21', 1523.2);
INSERT INTO public.moon VALUES (13, 'Triton', 'Largest moon of Neptune; orbits in a retrograde direction.', 8, '2.14e22', 2706.8);
INSERT INTO public.moon VALUES (14, 'Nereid', 'Small and irregularly shaped moon of Neptune.', 8, '3.1e19', 340);
INSERT INTO public.moon VALUES (15, 'Charon', 'Largest moon of Pluto; nearly half the size of Pluto itself.', 16, '1.586e21', 1212);
INSERT INTO public.moon VALUES (16, 'Kepler-22b Moon', 'Moon of Kepler-22b.', 9, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Kepler-186f Moon', 'Moon of Kepler-186f.', 10, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'TRAPPIST-1 Moon 1', 'Moon of TRAPPIST-1 planet.', 11, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'TRAPPIST-1 Moon 2', 'Moon of TRAPPIST-1 planet.', 11, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'TRAPPIST-1 Moon 3', 'Moon of TRAPPIST-1 planet.', 11, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'TRAPPIST-1 Moon 4', 'Moon of TRAPPIST-1 planet.', 11, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'TRAPPIST-1 Moon 5', 'Moon of TRAPPIST-1 planet.', 11, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'TRAPPIST-1 Moon 6', 'Moon of TRAPPIST-1 planet.', 11, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'TRAPPIST-1 Moon 7', 'Moon of TRAPPIST-1 planet.', 11, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Gliese 581 Moon 1', 'Moon of Gliese 581 planet.', 12, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'Gliese 581 Moon 2', 'Moon of Gliese 581 planet.', 12, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'HD 40307 Moon 1', 'Moon of HD 40307 planet.', 13, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'HD 40307 Moon 2', 'Moon of HD 40307 planet.', 13, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'HD 40307 Moon 3', 'Moon of HD 40307 planet.', 13, NULL, NULL);
INSERT INTO public.moon VALUES (30, 'HD 40307 Moon 4', 'Moon of HD 40307 planet.', 13, NULL, NULL);
INSERT INTO public.moon VALUES (31, 'HD 40307 Moon 5', 'Moon of HD 40307 planet.', 13, NULL, NULL);
INSERT INTO public.moon VALUES (32, 'HD 40307 Moon 6', 'Moon of HD 40307 planet.', 13, NULL, NULL);
INSERT INTO public.moon VALUES (33, 'HD 40307 Moon 7', 'Moon of HD 40307 planet.', 13, NULL, NULL);
INSERT INTO public.moon VALUES (34, 'Proxima Centauri b Moon', 'Moon of Proxima Centauri b.', 14, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'Innermost planet.', 22, 4.88, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'Extreme temperatures.', 22, 12.104, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'Supports life.', 22, 12.742, 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, 'Red planet.', 22, 6.779, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'Largest planet.', 22, 139.82, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Distinctive rings.', 22, 116.46, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'Tilted planet.', 22, 50.724, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'Ice giant.', 22, 49.244, 3);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', false, 'Habitable zone.', 23, NULL, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', false, 'Rocky exoplanet.', 24, NULL, 5);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1 planets', false, 'Multiple exoplanets.', 25, NULL, 5);
INSERT INTO public.planet VALUES (12, 'Gliese 581 planets', false, 'Including habitable zone.', 26, NULL, 5);
INSERT INTO public.planet VALUES (13, 'HD 40307 planets', false, 'Including habitable zone.', 27, NULL, 5);
INSERT INTO public.planet VALUES (14, 'Proxima Centauri b', false, 'Habitable zone.', 2, NULL, 5);
INSERT INTO public.planet VALUES (16, 'Pluto', false, 'Small, icy world beyond Neptune; part of the Kuiper Belt.', 22, 2377, 4);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets with thick atmospheres.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets with icy compositions and unique atmospheres.');
INSERT INTO public.planet_type VALUES (4, 'Dwarf Planet', 'Celestial bodies not classified as full-fledged planets.');
INSERT INTO public.planet_type VALUES (5, 'Exoplanet', 'Planets orbiting stars outside our Solar System.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius (Alpha Canis Majoris)', 1, 9940, 2.3);
INSERT INTO public.star VALUES (2, 'Proxima Centauri (Alpha Centauri C)', 1, 2850, 0.2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A (Rigil Kentaurus)', 1, 5840, 3.7);
INSERT INTO public.star VALUES (4, 'Procyon (Alpha Canis Minoris)', 1, 6530, 4.4);
INSERT INTO public.star VALUES (5, 'Betelgeuse (Alpha Orionis)', 1, 3600, 955.0);
INSERT INTO public.star VALUES (6, 'Rigel (Beta Orionis)', 1, 12100, 431.0);
INSERT INTO public.star VALUES (7, 'Vega (Alpha Lyrae)', 1, 9580, 3.1);
INSERT INTO public.star VALUES (8, 'Aldebaran (Alpha Tauri)', 1, 3910, 61.8);
INSERT INTO public.star VALUES (9, 'Andromeda Galaxy Star 1', 2, 7250, 1.5);
INSERT INTO public.star VALUES (10, 'Andromeda Galaxy Star 2', 2, 6100, 2.8);
INSERT INTO public.star VALUES (11, 'Triangulum Galaxy Star 1', 3, 5600, 1.2);
INSERT INTO public.star VALUES (12, 'Triangulum Galaxy Star 2', 3, 6900, 1.9);
INSERT INTO public.star VALUES (13, 'Sombrero Galaxy Star 1', 4, 4500, 145.0);
INSERT INTO public.star VALUES (14, 'Centaurus A Galaxy Star 1', 5, 5700, 2.5);
INSERT INTO public.star VALUES (15, 'Centaurus A Galaxy Star 2', 5, 3900, 1.8);
INSERT INTO public.star VALUES (16, 'Large Magellanic Cloud Star 1', 6, 7200, 0.9);
INSERT INTO public.star VALUES (17, 'Large Magellanic Cloud Star 2', 6, 6800, 1.1);
INSERT INTO public.star VALUES (18, 'Small Magellanic Cloud Star 1', 7, 6200, 0.7);
INSERT INTO public.star VALUES (19, 'Small Magellanic Cloud Star 2', 7, 6700, 0.8);
INSERT INTO public.star VALUES (20, 'Whirlpool Galaxy Star 1', 8, 8700, 2.2);
INSERT INTO public.star VALUES (21, 'Whirlpool Galaxy Star 2', 8, 8300, 2.6);
INSERT INTO public.star VALUES (22, 'Sun', 1, 5500, 1.4);
INSERT INTO public.star VALUES (23, 'Kepler-22', 1, NULL, NULL);
INSERT INTO public.star VALUES (24, 'Kepler-186', 1, 3500, 0.5);
INSERT INTO public.star VALUES (25, 'TRAPPIST-1', 1, 2550, 0.1);
INSERT INTO public.star VALUES (26, 'Gliese 581', 1, 3500, 0.2);
INSERT INTO public.star VALUES (27, 'HD 40307', 1, 4900, 0.5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 34, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 27, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

