--
-- PostgreSQL database dump
--
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'course_management' AND pid <> pg_backend_pid();
-- (re)create the database
DROP DATABASE IF EXISTS course_management;
CREATE DATABASE course_management;
-- connect via psql
\c course_management

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: advisors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advisors (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    department text NOT NULL,
    username text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.advisors OWNER TO postgres;

--
-- Name: advisors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.advisors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.advisors_id_seq OWNER TO postgres;

--
-- Name: advisors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.advisors_id_seq OWNED BY public.advisors.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    course_name text NOT NULL,
    schedule text NOT NULL,
    max_capacity integer,
    term text NOT NULL,
    instructor_id integer NOT NULL,
    textbook_id integer NOT NULL,
    course_code text NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: instructors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructors (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    department text NOT NULL,
    office_loc text
);


ALTER TABLE public.instructors OWNER TO postgres;

--
-- Name: instructors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructors_id_seq OWNER TO postgres;

--
-- Name: instructors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructors_id_seq OWNED BY public.instructors.id;


--
-- Name: parking_spaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parking_spaces (
    id text NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.parking_spaces OWNER TO postgres;

--
-- Name: random; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.random (
    id integer NOT NULL,
    random_name text NOT NULL,
    test_field text,
    command_name text
);


ALTER TABLE public.random OWNER TO postgres;

--
-- Name: random_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.random_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.random_id_seq OWNER TO postgres;

--
-- Name: random_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.random_id_seq OWNED BY public.random.id;


--
-- Name: residence_halls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.residence_halls (
    id integer NOT NULL,
    name text NOT NULL,
    max_students integer
);


ALTER TABLE public.residence_halls OWNER TO postgres;

--
-- Name: residence_halls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.residence_halls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.residence_halls_id_seq OWNER TO postgres;

--
-- Name: residence_halls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.residence_halls_id_seq OWNED BY public.residence_halls.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    major text NOT NULL,
    class_year text NOT NULL,
    credits_earned integer,
    gpa numeric,
    advisor_id integer NOT NULL,
    residence_hall_id integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_courses (
    student_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.students_courses OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: students_residence_halls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_residence_halls (
    residence_hall_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.students_residence_halls OWNER TO postgres;

--
-- Name: students_textbooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_textbooks (
    student_id integer NOT NULL,
    textbook_id integer NOT NULL
);


ALTER TABLE public.students_textbooks OWNER TO postgres;

--
-- Name: textbooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.textbooks (
    id integer NOT NULL,
    author text,
    publisher text,
    title text NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.textbooks OWNER TO postgres;

--
-- Name: textbooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.textbooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.textbooks_id_seq OWNER TO postgres;

--
-- Name: textbooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.textbooks_id_seq OWNED BY public.textbooks.id;


--
-- Name: advisors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advisors ALTER COLUMN id SET DEFAULT nextval('public.advisors_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: instructors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors ALTER COLUMN id SET DEFAULT nextval('public.instructors_id_seq'::regclass);


--
-- Name: random id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random ALTER COLUMN id SET DEFAULT nextval('public.random_id_seq'::regclass);


--
-- Name: residence_halls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.residence_halls ALTER COLUMN id SET DEFAULT nextval('public.residence_halls_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: textbooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.textbooks ALTER COLUMN id SET DEFAULT nextval('public.textbooks_id_seq'::regclass);


--
-- Data for Name: advisors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advisors (id, first_name, last_name, department, username, email) FROM stdin;
1	Joseph	Kaminski	Music	kaminskij	kaminskij@walters.edu
2	Ralph	Alessi	Science	alessir	alessir@walters.edu
3	Philip	Smith	Music	smithp	smithp@walters.edu
4	Greg	Bobulinski	Liberal Arts	bobulinskig	grog@walters.edu
5	Bix	Beiderbecke	Humanities	beiderbackeb	beiderbeckeb@walters.edu
6	James	Zollar	Mathematics	zollarj	zollarj@walters.edu
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
1ee0dc4f23fe
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, course_name, schedule, max_capacity, term, instructor_id, textbook_id, course_code) FROM stdin;
4	College Algebra	M/W/F	22	FA2223	1	1	MAT102
20	Forensic Accounting	Tu/Th	22	FA2223	2	4	ACC201
21	Human Biology	Tu/Th	12	FA2223	3	2	BIO122
22	Medical Terminology	M/W/F	10	SP2223	4	3	MDT111
23	Business Management	M/W/F	15	FA2223	5	5	BUS223
24	College Algebra	Tu/Th	10	FA2223	6	1	MAT102
\.


--
-- Data for Name: instructors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructors (id, first_name, last_name, department, office_loc) FROM stdin;
1	Kelly	Speicher	Social Sciences	Main Campus
2	William	Schneider	Natural Science	Main Campus
3	Angela	Maskayev	Humanities	North Campus
4	Melaina	Baldino	Accounting	South Campus
5	Julianne	Mohyla	Business	Main Campus
6	Kelly	Speicher	Social Sciences	Main Campus
7	Timor	McDonough	English	\N
8	Jacalyn	Tarutis	Mathematics	North Campus
9	Michael	Craven	Liberal Arts	East Campus
10	Jeremy	Collins	Social Sciences	Main Campus
\.


--
-- Data for Name: parking_spaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parking_spaces (id, student_id) FROM stdin;
\.


--
-- Data for Name: random; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.random (id, random_name, test_field, command_name) FROM stdin;
\.


--
-- Data for Name: residence_halls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.residence_halls (id, name, max_students) FROM stdin;
1	Riggs Hall	150
2	Johnson Hall	250
3	Hart Hall	75
4	Onondaga Hall	250
5	Oneonta Hall	100
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, first_name, last_name, major, class_year, credits_earned, gpa, advisor_id, residence_hall_id) FROM stdin;
2	Walter	Hertman	Computer Science	Senior	105	3.95	2	\N
3	Jennifer	Hertman	Nursing	Junior	68	3.75	2	\N
4	Ryan	Hertman	Art	Freshman	6	0	4	\N
5	Madison	Hertman	Art	Freshman	3	0	4	\N
6	Ashley	Mills	Nursing	Sophomore	35	3.25	5	\N
8	Amanda	Hallock	Mathematics	Freshman	\N	\N	3	\N
9	Rasheem	Delgado	Psychology	Sophomore	\N	\N	3	\N
10	Aaron	Flay	Nursing	Post-Graduate	\N	\N	3	\N
11	Irwin	Romano	Mathematics	Senior	\N	\N	3	\N
12	Antwaun	Capriotti	Philosophy	Freshman	\N	\N	3	\N
13	Leo	Behrens	History	Junior	\N	\N	2	\N
14	Rachel	Howey	Humanities	Junior	\N	\N	2	\N
15	Alexis	Reed	Nursing	Senior	\N	\N	2	\N
16	Mason	Bobulinski	Computer Science	Senior	\N	\N	2	\N
17	Rachel	Smith	Philosophy	Junior	\N	\N	2	\N
18	Mac	Bobulinski	Computer Science	Junior	\N	\N	6	\N
19	Ashley	Behrens	Accounting	Sophomore	\N	\N	6	\N
20	Patrick	Powers	Music	Freshman	\N	\N	6	\N
21	Aaron	Bobulinski	Music	Freshman	\N	\N	6	\N
22	Irwin	Meyers	Nursing	Senior	\N	\N	6	\N
23	Antwaun	Abdullah	Music	Junior	\N	\N	5	\N
24	Michael	Powers	Nursing	Senior	\N	\N	5	\N
25	Elgin	Abdullah	Philosophy	Post-Graduate	\N	\N	5	\N
26	Emily	Powell	Art	Freshman	\N	\N	5	\N
27	Taylor	Capriotti	Humanities	Sophomore	\N	\N	5	\N
28	Xavier	Powers	Liberal Studies	Sophomore	\N	\N	5	\N
29	Michael	Bobulinski	Business	Post-Graduate	\N	\N	5	\N
30	Jessica	Behrens	History	Senior	\N	\N	5	\N
31	Ashley	Abdullah	Mathematics	Sophomore	\N	\N	5	\N
32	Matthew	Hain	Philosophy	Senior	\N	\N	5	\N
33	Michael	King	Liberal Studies	Junior	\N	\N	1	\N
34	Hannah	Hain	Music	Junior	\N	\N	1	\N
35	Patrick	Herrmann	Philosophy	Post-Graduate	\N	\N	1	\N
36	Matthew	Howey	Music	Post-Graduate	\N	\N	1	\N
37	Rachel	Hallock	Mathematics	Freshman	\N	\N	1	\N
38	Irwin	Hallock	Nursing	Senior	\N	\N	1	\N
39	Brittany	Freitas	Computer Science	Senior	\N	\N	1	\N
40	Xavier	King	Liberal Studies	Senior	\N	\N	1	\N
41	Hannah	Powell	Hospitality Management	Freshman	\N	\N	1	\N
42	Leo	Zang	Philosophy	Junior	\N	\N	1	\N
43	Brittany	Zang	Humanities	Sophomore	\N	\N	2	\N
44	Samantha	Jones	Mathematics	Freshman	\N	\N	6	\N
45	Mason	Hart	Computer Science	Junior	\N	\N	1	\N
46	Taylor	Capriotti	Computer Science	Post-Graduate	\N	\N	1	\N
47	Megan	Howey	Mathematics	Junior	\N	\N	4	\N
48	Jessica	Romano	Humanities	Freshman	\N	\N	2	\N
49	Sarah	Howey	Philosophy	Sophomore	\N	\N	5	\N
50	Ashley	Romano	Music	Post-Graduate	\N	\N	6	\N
51	Irwin	Williams	Philosophy	Junior	\N	\N	1	\N
52	Elgin	Freitas	Music	Post-Graduate	\N	\N	3	\N
\.


--
-- Data for Name: students_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_courses (student_id, course_id) FROM stdin;
\.


--
-- Data for Name: students_residence_halls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_residence_halls (residence_hall_id, student_id) FROM stdin;
\.


--
-- Data for Name: students_textbooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_textbooks (student_id, textbook_id) FROM stdin;
\.


--
-- Data for Name: textbooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.textbooks (id, author, publisher, title, price) FROM stdin;
1	Murphy	Random House	College Algebra	89.50
2	Malone	Princeton Review	Intro to Biology	110.500
3	Jones	Jenzabar	Medical Terminology	199.99
4	Smith	Collegiate Press	Principles of Accounting	79.95
5	Breakstone	Brookings Institution Press	Management Systems	149.99
\.


--
-- Name: advisors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.advisors_id_seq', 6, true);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 24, true);


--
-- Name: instructors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructors_id_seq', 10, true);


--
-- Name: random_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.random_id_seq', 1, false);


--
-- Name: residence_halls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.residence_halls_id_seq', 1, false);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 52, true);


--
-- Name: textbooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.textbooks_id_seq', 5, true);


--
-- Name: advisors advisors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advisors
    ADD CONSTRAINT advisors_pkey PRIMARY KEY (id);


--
-- Name: advisors advisors_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advisors
    ADD CONSTRAINT advisors_username_key UNIQUE (username);


--
-- Name: advisors advisors_username_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advisors
    ADD CONSTRAINT advisors_username_key1 UNIQUE (username);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: instructors instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);


--
-- Name: parking_spaces parking_spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking_spaces
    ADD CONSTRAINT parking_spaces_pkey PRIMARY KEY (id);


--
-- Name: parking_spaces parking_spaces_student_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking_spaces
    ADD CONSTRAINT parking_spaces_student_id_key UNIQUE (student_id);


--
-- Name: random random_command_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random
    ADD CONSTRAINT random_command_name_key UNIQUE (command_name);


--
-- Name: random random_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random
    ADD CONSTRAINT random_pkey PRIMARY KEY (id);


--
-- Name: residence_halls residence_halls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.residence_halls
    ADD CONSTRAINT residence_halls_pkey PRIMARY KEY (id);


--
-- Name: students_courses students_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT students_courses_pkey PRIMARY KEY (student_id, course_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: students_residence_halls students_residence_halls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_residence_halls
    ADD CONSTRAINT students_residence_halls_pkey PRIMARY KEY (residence_hall_id, student_id);


--
-- Name: students_textbooks students_textbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_textbooks
    ADD CONSTRAINT students_textbooks_pkey PRIMARY KEY (student_id, textbook_id);


--
-- Name: textbooks textbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.textbooks
    ADD CONSTRAINT textbooks_pkey PRIMARY KEY (id);


--
-- Name: courses fk_courses_instructors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_instructors FOREIGN KEY (instructor_id) REFERENCES public.instructors(id);


--
-- Name: courses fk_courses_textbooks; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_textbooks FOREIGN KEY (textbook_id) REFERENCES public.textbooks(id);


--
-- Name: students fk_students_advisors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT fk_students_advisors FOREIGN KEY (advisor_id) REFERENCES public.advisors(id);


--
-- Name: students_courses fk_students_courses_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT fk_students_courses_courses FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: students_courses fk_students_courses_students; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT fk_students_courses_students FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: parking_spaces fk_students_parking_spaces; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking_spaces
    ADD CONSTRAINT fk_students_parking_spaces FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: students_residence_halls fk_students_residence_halls_residence_halls; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_residence_halls
    ADD CONSTRAINT fk_students_residence_halls_residence_halls FOREIGN KEY (residence_hall_id) REFERENCES public.residence_halls(id);


--
-- Name: students_residence_halls fk_students_residence_halls_students; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_residence_halls
    ADD CONSTRAINT fk_students_residence_halls_students FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: students_textbooks fk_students_textbooks_students; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_textbooks
    ADD CONSTRAINT fk_students_textbooks_students FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: students_textbooks fk_students_textbooks_textbooks; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_textbooks
    ADD CONSTRAINT fk_students_textbooks_textbooks FOREIGN KEY (textbook_id) REFERENCES public.textbooks(id);


--
-- PostgreSQL database dump complete
--

