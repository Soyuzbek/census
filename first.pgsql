--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO soyuz;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuz
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO soyuz;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuz
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO soyuz;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuz
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO soyuz;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuz
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO soyuz;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuz
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO soyuz;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuz
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO soyuz;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuz
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO soyuz;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuz
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO soyuz;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuz
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO soyuz;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuz
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO soyuz;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuz
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO soyuz;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuz
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO soyuz;

--
-- Name: users_district; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.users_district (
    id integer NOT NULL,
    name character varying(55) NOT NULL,
    region character varying(9) NOT NULL,
    gov_admin character varying(255) NOT NULL,
    stat_admin character varying(255) NOT NULL
);


ALTER TABLE public.users_district OWNER TO soyuz;

--
-- Name: users_district_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuz
--

CREATE SEQUENCE public.users_district_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_district_id_seq OWNER TO soyuz;

--
-- Name: users_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuz
--

ALTER SEQUENCE public.users_district_id_seq OWNED BY public.users_district.id;


--
-- Name: users_employee; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.users_employee (
    id integer NOT NULL,
    number character varying(255),
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    patronymic character varying(45),
    address character varying(255) NOT NULL,
    agreement character varying(6),
    image character varying(100),
    role character varying(50) NOT NULL,
    qrcode character varying(100),
    date_joined timestamp with time zone NOT NULL,
    district_id integer,
    "PIN" character varying(14),
    birth_day date,
    organ character varying(10),
    passport_num character varying(7),
    serial character varying(2)
);


ALTER TABLE public.users_employee OWNER TO soyuz;

--
-- Name: users_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuz
--

CREATE SEQUENCE public.users_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_employee_id_seq OWNER TO soyuz;

--
-- Name: users_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuz
--

ALTER SEQUENCE public.users_employee_id_seq OWNED BY public.users_employee.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone,
    number character varying(255) NOT NULL,
    district_id integer,
    is_staff boolean NOT NULL
);


ALTER TABLE public.users_user OWNER TO soyuz;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO soyuz;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuz
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO soyuz;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuz
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuz
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO soyuz;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuz
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: soyuz
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO soyuz;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: soyuz
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO soyuz;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: soyuz
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: users_district id; Type: DEFAULT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_district ALTER COLUMN id SET DEFAULT nextval('public.users_district_id_seq'::regclass);


--
-- Name: users_employee id; Type: DEFAULT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_employee ALTER COLUMN id SET DEFAULT nextval('public.users_employee_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add User	6	add_user
22	Can change User	6	change_user
23	Can delete User	6	delete_user
24	Can view User	6	view_user
25	Can add District	7	add_district
26	Can change District	7	change_district
27	Can delete District	7	delete_district
28	Can view District	7	view_district
29	Can add employee	8	add_employee
30	Can change employee	8	change_employee
31	Can delete employee	8	delete_employee
32	Can view employee	8	view_employee
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-11-11 03:00:53.176209+00	1	Ош / Шаар	1	[{"added": {}}]	7	1
2	2019-11-11 03:01:07.358323+00	1	+996 (559) 00 00 00	2	[{"changed": {"fields": ["district"]}}]	6	1
3	2019-11-11 15:09:46.173957+00	1	Ош / г	2	[{"changed": {"fields": ["name"]}}]	7	1
4	2019-11-11 15:09:57.588037+00	1	Ош / шаары	2	[{"changed": {"fields": ["name"]}}]	7	1
5	2019-11-12 04:33:13.057686+00	2	Employee object (2)	2	[{"changed": {"fields": ["image"]}}]	8	1
6	2019-11-12 04:37:47.157744+00	5	Employee object (5)	2	[{"changed": {"fields": ["image"]}}]	8	1
7	2019-11-14 03:38:05.4993+00	11	Абарали	3		8	1
8	2019-11-14 03:38:05.504428+00	8	Алия	3		8	1
9	2019-11-14 03:38:05.506574+00	2	Данияр	3		8	1
10	2019-11-14 03:38:05.509087+00	9	Дастан	3		8	1
11	2019-11-14 03:38:05.511035+00	6	Мирланбек	3		8	1
12	2019-11-14 03:38:05.513426+00	5	Мирланбек	3		8	1
13	2019-11-14 03:38:05.515292+00	4	Мирланбек	3		8	1
14	2019-11-14 03:38:05.518504+00	3	Мирланбек	3		8	1
15	2019-11-14 03:38:05.52072+00	1	Мустафа	3		8	1
16	2019-11-14 03:38:05.522445+00	10	Нурлан	3		8	1
17	2019-11-14 03:38:05.524623+00	7	Нурсултан	3		8	1
18	2019-11-14 04:16:22.346599+00	12	Данияр	2	[{"changed": {"fields": ["agreement"]}}]	8	1
19	2019-11-14 05:12:05.183155+00	12	Данияр	2	[{"changed": {"fields": ["image"]}}]	8	1
20	2019-11-14 07:14:13.733648+00	12	Данияр	3		8	1
21	2019-11-14 07:14:13.737694+00	13	Нурсултан	3		8	1
22	2019-11-14 07:36:00.966131+00	2	+996 (550) 15 41 20	1	[{"added": {}}]	6	1
23	2019-11-14 07:36:07.017411+00	2	+996 (550) 15 41 20	2	[{"changed": {"fields": ["district", "is_superuser"]}}]	6	1
24	2019-11-14 07:39:13.064341+00	15	Абарали	2	[{"changed": {"fields": ["image"]}}]	8	1
25	2019-11-14 07:48:34.632551+00	3	+996 (550) 15 40 76	1	[{"added": {}}]	6	1
26	2019-11-14 07:48:40.096357+00	3	+996 (550) 15 40 76	2	[{"changed": {"fields": ["district", "is_superuser"]}}]	6	1
27	2019-11-14 07:54:38.293573+00	16	Кабысидин	3		8	1
28	2019-11-14 08:15:09.692983+00	1	Ош / шаары	2	[{"changed": {"fields": ["gov_admin", "stat_admin"]}}]	7	1
29	2019-11-14 08:15:49.256715+00	21	Айбек	2	[{"changed": {"fields": ["address"]}}]	8	1
30	2019-11-14 08:20:14.594991+00	1	Ош / шаары	2	[{"changed": {"fields": ["gov_admin"]}}]	7	1
31	2019-11-14 08:30:00.221418+00	17	Атыргүл	2	[{"changed": {"fields": ["first_name"]}}]	8	1
32	2019-11-14 08:32:48.239202+00	23	Эльмира	2	[{"changed": {"fields": ["number"]}}]	8	1
33	2019-11-14 08:54:25.579427+00	25	Батма	2	[{"changed": {"fields": ["patronymic"]}}]	8	1
34	2019-11-14 09:20:01.227006+00	29	Айдана	2	[{"changed": {"fields": ["last_name"]}}]	8	1
35	2019-11-14 09:25:21.130574+00	28	Айназик	2	[{"changed": {"fields": ["agreement"]}}]	8	1
36	2019-11-14 09:46:52.826506+00	34	Карлыгач	2	[{"changed": {"fields": ["address"]}}]	8	1
37	2019-11-14 09:47:35.037855+00	34	Карлыгач	2	[{"changed": {"fields": ["address"]}}]	8	1
38	2019-11-14 10:04:14.889716+00	36	Өмүргүл	2	[{"changed": {"fields": ["first_name"]}}]	8	1
39	2019-11-14 10:35:20.358093+00	40	Уулча	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	8	1
40	2019-11-14 10:44:00.138223+00	41	Алмагул	2	[{"changed": {"fields": ["address"]}}]	8	1
41	2019-11-15 04:23:38.496131+00	31	Динар	2	[{"changed": {"fields": ["agreement"]}}]	8	1
42	2019-11-15 05:13:47.564001+00	46	Диёрбек	2	[{"changed": {"fields": ["first_name"]}}]	8	1
43	2019-11-15 05:19:02.56214+00	44	Данияр	3		8	1
44	2019-11-15 05:20:27.714536+00	48	Марлен	2	[{"changed": {"fields": ["agreement", "address"]}}]	8	1
45	2019-11-15 05:27:33.485297+00	50	Каныгүл	2	[{"changed": {"fields": ["first_name"]}}]	8	1
46	2019-11-15 05:44:14.276728+00	52	Ырысбек	2	[{"changed": {"fields": ["patronymic"]}}]	8	1
47	2019-11-15 05:46:33.053687+00	53	Күмүшай	2	[{"changed": {"fields": ["first_name"]}}]	8	1
48	2019-11-15 08:24:57.32671+00	59	Бусалма	2	[{"changed": {"fields": ["patronymic", "address"]}}]	8	1
49	2019-11-15 09:22:41.870589+00	90	Шаиргүл	2	[{"changed": {"fields": ["first_name"]}}]	8	1
50	2019-11-16 05:08:02.892898+00	55	Дастан	2	[{"changed": {"fields": ["number"]}}]	8	1
51	2019-11-16 05:10:39.193887+00	55	Дастан	2	[{"changed": {"fields": ["image"]}}]	8	1
52	2019-11-16 10:37:14.241092+00	144	Нурайым	2	[{"changed": {"fields": ["address"]}}]	8	1
53	2019-11-16 10:38:43.325923+00	124	Азизбек	2	[]	8	1
54	2019-11-16 10:40:12.240343+00	155	Сүйүтбек	2	[]	8	1
55	2019-11-16 10:41:53.398519+00	166	Айгерим	2	[]	8	1
56	2019-11-16 10:57:34.172825+00	165	Айчүрөк	2	[{"changed": {"fields": ["first_name"]}}]	8	1
57	2019-11-16 10:57:51.483841+00	161	Альбина	2	[{"changed": {"fields": ["patronymic"]}}]	8	1
58	2019-11-16 10:58:09.971943+00	163	Жанаргүл	2	[{"changed": {"fields": ["first_name"]}}]	8	1
59	2019-11-17 04:49:24.316968+00	158	уулу Эльдар	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	8	1
60	2019-11-17 07:14:45.794886+00	38	Махпуза	3		8	1
61	2019-11-17 07:16:57.04459+00	160	Мээрим	2	[{"changed": {"fields": ["number"]}}]	8	1
62	2019-11-17 07:47:56.649742+00	34	Карлыгач	3		8	1
63	2019-11-17 07:49:21.097682+00	205	Зульфия	2	[{"changed": {"fields": ["number"]}}]	8	1
64	2019-11-17 07:58:46.666353+00	205	Зульфия	2	[]	8	1
65	2019-11-17 08:47:23.226884+00	14	Нурайым	2	[{"changed": {"fields": ["agreement"]}}]	8	1
66	2019-11-17 08:47:49.852667+00	14	Нурайым	2	[{"changed": {"fields": ["agreement"]}}]	8	1
67	2019-11-17 08:51:13.000183+00	15	Абарали	2	[{"changed": {"fields": ["agreement"]}}]	8	1
68	2019-11-17 08:54:05.477794+00	18	Феруза	2	[{"changed": {"fields": ["agreement"]}}]	8	1
69	2019-11-17 08:55:15.466967+00	20	Гулжамал	2	[{"changed": {"fields": ["agreement"]}}]	8	1
70	2019-11-17 08:57:30.71477+00	33	Мархабахан	2	[{"changed": {"fields": ["agreement"]}}]	8	1
71	2019-11-17 08:58:53.102689+00	43	Мадина	2	[{"changed": {"fields": ["agreement"]}}]	8	1
72	2019-11-17 09:00:48.156045+00	31	Динар	2	[{"changed": {"fields": ["agreement"]}}]	8	1
73	2019-11-17 09:04:07.44728+00	41	Алмагул	2	[{"changed": {"fields": ["agreement"]}}]	8	1
74	2019-11-17 09:05:53.55522+00	39	Периште	2	[{"changed": {"fields": ["agreement"]}}]	8	1
75	2019-11-17 09:06:39.7086+00	37	Рахима	2	[{"changed": {"fields": ["agreement"]}}]	8	1
76	2019-11-17 09:08:05.314931+00	36	Өмүргүл	2	[{"changed": {"fields": ["agreement"]}}]	8	1
77	2019-11-17 09:09:16.594798+00	29	Айдана	2	[{"changed": {"fields": ["agreement"]}}]	8	1
78	2019-11-17 09:09:57.089408+00	26	Зухра	2	[{"changed": {"fields": ["agreement"]}}]	8	1
79	2019-11-17 09:10:34.962489+00	24	Данияр	2	[{"changed": {"fields": ["agreement"]}}]	8	1
80	2019-11-17 09:11:30.158537+00	23	Эльмира	2	[{"changed": {"fields": ["agreement"]}}]	8	1
81	2019-11-17 09:12:40.649205+00	19	Зубагуль	2	[{"changed": {"fields": ["agreement"]}}]	8	1
82	2019-11-17 09:13:31.919286+00	17	Атыргүл	2	[{"changed": {"fields": ["agreement"]}}]	8	1
83	2019-11-17 09:14:38.164458+00	42	Нуржамал	2	[{"changed": {"fields": ["agreement"]}}]	8	1
84	2019-11-17 09:15:38.019923+00	40	Уулча	2	[{"changed": {"fields": ["agreement"]}}]	8	1
85	2019-11-17 09:16:24.187641+00	35	Эрнст	2	[{"changed": {"fields": ["agreement"]}}]	8	1
86	2019-11-17 09:17:15.010633+00	32	Сейитбек	2	[{"changed": {"fields": ["agreement"]}}]	8	1
87	2019-11-17 09:18:05.514407+00	28	Айназик	2	[{"changed": {"fields": ["agreement"]}}]	8	1
88	2019-11-17 09:20:20.803296+00	30	Эрнис	2	[{"changed": {"fields": ["agreement"]}}]	8	1
89	2019-11-17 09:21:59.528256+00	27	Айбарчын	2	[{"changed": {"fields": ["agreement"]}}]	8	1
90	2019-11-17 09:22:48.478318+00	25	Батма	2	[{"changed": {"fields": ["agreement"]}}]	8	1
91	2019-11-17 09:23:56.991646+00	22	Мунаргул	2	[{"changed": {"fields": ["agreement"]}}]	8	1
92	2019-11-17 09:25:00.350283+00	21	Айбек	2	[{"changed": {"fields": ["agreement"]}}]	8	1
93	2019-11-17 09:25:55.983908+00	21	Айбек	2	[{"changed": {"fields": ["agreement"]}}]	8	1
94	2019-11-17 11:00:08.806585+00	206	Зуура	2	[{"changed": {"fields": ["agreement"]}}]	8	1
95	2019-11-17 11:00:35.811102+00	205	Зульфия	2	[{"changed": {"fields": ["agreement"]}}]	8	1
96	2019-11-18 05:17:20.831014+00	21	Чынарбек	2	[{"changed": {"fields": ["first_name", "patronymic", "passport_num", "PIN", "serial", "birth_day", "organ"]}}]	8	1
97	2019-11-18 05:52:41.88821+00	223	Кыязов	2	[{"changed": {"fields": ["first_name", "last_name", "patronymic", "address", "passport_num", "PIN", "serial", "birth_day", "organ"]}}]	8	1
98	2019-11-18 06:35:05.605323+00	15	Давлатёр	2	[{"changed": {"fields": ["first_name", "address", "passport_num", "PIN", "serial", "birth_day", "organ"]}}]	8	1
99	2019-11-18 07:50:51.48813+00	4	+996 (701) 20 07 16	1	[{"added": {}}]	6	1
100	2019-11-18 07:51:58.783305+00	2	Ош / Карасуу	1	[{"added": {}}]	7	1
101	2019-11-18 07:52:04.901246+00	4	+996 (701) 20 07 16	2	[{"changed": {"fields": ["district", "is_superuser"]}}]	6	1
102	2019-11-18 09:04:32.174512+00	134	Сайкал	2	[{"changed": {"fields": ["first_name", "last_name", "patronymic", "address", "passport_num", "PIN", "birth_day"]}}]	8	1
103	2019-11-18 09:07:16.126781+00	134	ёё	2	[{"changed": {"fields": ["first_name"]}}]	8	1
104	2019-11-18 09:10:50.346058+00	134	Нурсулуу	2	[{"changed": {"fields": ["first_name", "last_name", "patronymic", "address", "passport_num", "PIN", "birth_day"]}}]	8	1
105	2019-11-18 10:07:38.697054+00	15	Давлатёр	2	[{"changed": {"fields": ["image"]}}]	8	1
106	2019-11-18 10:20:19.565193+00	2	+996 (550) 15 41 20	2	[{"changed": {"fields": ["password"]}}]	6	1
107	2019-11-18 10:23:14.564588+00	2	+996 (550) 15 41 20	2	[{"changed": {"fields": ["password"]}}]	6	1
108	2019-11-19 04:17:56.348058+00	2	+996 (550) 15 41 20	2	[{"changed": {"fields": ["password"]}}]	6	1
109	2019-11-21 06:21:48.508359+00	229	Жанаркүл	3		8	1
110	2019-11-21 06:21:48.517218+00	231	Камила	3		8	1
111	2019-11-21 06:21:48.520006+00	232	Адилет	3		8	1
112	2019-11-21 06:21:48.52277+00	233	Айчурок	3		8	1
113	2019-11-27 09:20:20.630181+00	191	Алийма	2	[{"changed": {"fields": ["first_name"]}}]	8	2
114	2019-12-02 04:44:34.603754+00	164	Тамара	2	[{"changed": {"fields": ["patronymic"]}}]	8	2
115	2019-12-02 05:07:16.663964+00	37	Рахима	2	[{"changed": {"fields": ["birth_day"]}}]	8	2
116	2019-12-02 05:12:16.678089+00	37	Рахима	2	[{"changed": {"fields": ["passport_num"]}}]	8	2
117	2019-12-02 07:40:14.468423+00	192	Бекарстан	2	[{"changed": {"fields": ["organ"]}}]	8	2
118	2019-12-06 04:32:23.780041+00	210	Сүйдүмкан	2	[{"changed": {"fields": ["first_name"]}}]	8	2
119	2019-12-06 04:33:19.998363+00	210	Сүйдүмкан	2	[]	8	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	users	user
7	users	district
8	users	employee
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-11-10 06:34:37.993034+00
2	contenttypes	0002_remove_content_type_name	2019-11-10 06:34:38.005893+00
3	auth	0001_initial	2019-11-10 06:34:38.034225+00
4	auth	0002_alter_permission_name_max_length	2019-11-10 06:34:38.058481+00
5	auth	0003_alter_user_email_max_length	2019-11-10 06:34:38.067358+00
6	auth	0004_alter_user_username_opts	2019-11-10 06:34:38.076781+00
7	auth	0005_alter_user_last_login_null	2019-11-10 06:34:38.087299+00
8	auth	0006_require_contenttypes_0002	2019-11-10 06:34:38.08972+00
9	auth	0007_alter_validators_add_error_messages	2019-11-10 06:34:38.099147+00
10	auth	0008_alter_user_username_max_length	2019-11-10 06:34:38.109257+00
11	auth	0009_alter_user_last_name_max_length	2019-11-10 06:34:38.11828+00
12	auth	0010_alter_group_name_max_length	2019-11-10 06:34:38.128418+00
13	auth	0011_update_proxy_permissions	2019-11-10 06:34:38.138536+00
14	users	0001_initial	2019-11-10 06:34:38.165331+00
15	admin	0001_initial	2019-11-10 06:34:38.207552+00
16	admin	0002_logentry_remove_auto_add	2019-11-10 06:34:38.227134+00
17	admin	0003_logentry_add_action_flag_choices	2019-11-10 06:34:38.240109+00
18	sessions	0001_initial	2019-11-10 06:34:38.252222+00
19	users	0002_auto_20190910_1101	2019-11-10 06:34:38.290478+00
20	users	0003_auto_20190910_1103	2019-11-10 06:34:38.304303+00
21	users	0004_auto_20190910_1106	2019-11-10 06:34:38.396045+00
22	users	0005_auto_20190912_1141	2019-11-10 06:34:38.417741+00
23	users	0006_auto_20190913_1443	2019-11-10 06:34:38.459802+00
24	users	0007_auto_20190916_0512	2019-11-10 06:34:38.54796+00
25	users	0008_user_qrcode	2019-11-10 06:34:38.575283+00
26	users	0009_auto_20190920_1459	2019-11-10 06:34:38.618582+00
27	users	0010_user_image	2019-11-10 06:34:38.63783+00
28	users	0011_auto_20190927_0936	2019-11-10 06:34:38.798001+00
29	users	0012_auto_20190930_0949	2019-11-10 06:34:38.871659+00
30	users	0013_auto_20191004_0849	2019-11-10 06:34:38.916153+00
31	users	0014_auto_20191015_1410	2019-11-10 06:34:38.947865+00
32	users	0015_auto_20191015_1705	2019-11-10 06:34:38.95997+00
33	users	0016_auto_20191105_1500	2019-11-10 06:34:38.971539+00
34	users	0017_auto_20191107_1029	2019-11-10 06:34:39.139995+00
35	users	0018_auto_20191107_1231	2019-11-10 06:34:39.178556+00
36	users	0019_auto_20191107_1238	2019-11-10 06:34:39.192464+00
37	users	0020_auto_20191111_2249	2019-11-11 18:41:15.142435+00
38	users	0021_auto_20191113_0921	2019-11-13 04:52:53.913282+00
39	users	0022_auto_20191115_0110	2019-11-14 20:47:58.512991+00
40	users	0023_auto_20191115_0136	2019-11-14 20:47:58.534102+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
h1i9rgzhc85hek9ar0wg5pttspns9rf6	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-24 06:39:25.0595+00
eg2swkz720pededct0pm7l7ucrpmdr1j	MjE3OTMxNTdmM2MyNmJkZGUyOWI4OWZiMGQ5MjM3YmJlOTNiYzY5Yjp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-11-24 07:57:23.883446+00
5xiglphxaizy9sravgwkktv5rw46t1n4	ZjcxNTIwZGZhZGVmZmFjMDNjYzZmYzY1MzhkOGZmNWUxYTcyZmYzNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGVlMWNmNTBjMDY2MzA1MDk0MDIyNjg2NjQ2NmY3ZGJiMmQzYmRmIn0=	2019-12-01 17:09:23.681177+00
icvopj5khsmn4exapac9zhprs0hxzzb6	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-24 15:20:11.247564+00
hqs47jqk2b8w3uvx7nxg30m6pb14f19n	YTVjMjVhM2RlNDQ4ODYxYTIyMWYwZTBmODdjMTQ2ZDRmYzE4NmZiMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGE1Mjc3MGIyYjhiYTMyYWI3MjE5YTgyNjE3YWQ1OGQ5MzUwMDU2IiwiX2xhbmd1YWdlIjoia3kifQ==	2019-11-27 08:01:33.005166+00
0q721y83cpnredrbcnsg71bqc44p8gqs	ZTBmYTkxNTMzM2U0NzA5YzcxMmQ3NWU5MDQ3MWQwN2FiMDliMWYzYjp7Il9sYW5ndWFnZSI6InJ1In0=	2019-11-24 17:42:03.953973+00
p7t0s00cgi2qdoffd1sy0jkw05fnhdy4	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-27 08:08:54.221709+00
pi02s501z120vqmgccj9y2xovdtxt1xg	YmU1ZGVhN2I2NzE3Mzg5OTRlYmJjNDJhMTNjYzZmNWQ1NTE1Mzc2Mzp7Il9sYW5ndWFnZSI6Imt5IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0YTUyNzcwYjJiOGJhMzJhYjcyMTlhODI2MTdhZDU4ZDkzNTAwNTYifQ==	2019-11-27 08:33:36.715666+00
51mcpfizqum496hcjwssls5oy7w9qamb	MjE3OTMxNTdmM2MyNmJkZGUyOWI4OWZiMGQ5MjM3YmJlOTNiYzY5Yjp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-23 04:29:41.545521+00
eog0o72sqv0w740uj6piztx8i2o1krbe	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-12-02 06:03:16.257649+00
0wjq5b7yw69wohgkhmac5bsm0gevv7kz	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-25 04:46:33.62958+00
z4osfl8j6r696gg9b2sq52juy19opeup	NzE2ZDVmNGI1ZWNiYmVkZGQ2NzRjZjFiYjBlMzU3Yzk0Y2ZmOGRiYzp7Il9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0YTUyNzcwYjJiOGJhMzJhYjcyMTlhODI2MTdhZDU4ZDkzNTAwNTYifQ==	2019-11-27 09:18:00.673622+00
ar2ayk548weeurbqgz612d9pjs8w77ul	YmNjMTkyOGI3MGE2OTljYTk0OWE3NWI0MmJhZDliZWQyYjgyMzk1NTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZTllOWRlMzJkY2UwZTc4YmRjM2U1MzU2NGJmZDI2Y2NjOWExYTgxIiwiX2xhbmd1YWdlIjoicnUifQ==	2019-12-11 06:30:48.290586+00
4b7fmp7vftulo4ka7s469uvd26i3aqdg	YmU1ZGVhN2I2NzE3Mzg5OTRlYmJjNDJhMTNjYzZmNWQ1NTE1Mzc2Mzp7Il9sYW5ndWFnZSI6Imt5IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0YTUyNzcwYjJiOGJhMzJhYjcyMTlhODI2MTdhZDU4ZDkzNTAwNTYifQ==	2019-11-27 10:45:22.627676+00
ethdzgfz40wbl4gecmv55sflmtfipr5s	Y2MzNWMwYWY0N2U0ZmYzYzc5ZTEwOWEzMzE4ZTRiZjQ4ZDdkOTBhZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGE1Mjc3MGIyYjhiYTMyYWI3MjE5YTgyNjE3YWQ1OGQ5MzUwMDU2IiwiX2xhbmd1YWdlIjoicnUifQ==	2019-11-25 19:12:48.646072+00
936lmes1ed6d81tk96a71k0aj6itst3z	ZjcxNTIwZGZhZGVmZmFjMDNjYzZmYzY1MzhkOGZmNWUxYTcyZmYzNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGVlMWNmNTBjMDY2MzA1MDk0MDIyNjg2NjQ2NmY3ZGJiMmQzYmRmIn0=	2019-12-11 07:45:01.304861+00
ntt3vc6izdwo5knuanu9fz0tmi8gq7fh	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-27 17:01:54.415684+00
o12xktjyvssee83gqdava3tib6vsa7lr	YmU1ZGVhN2I2NzE3Mzg5OTRlYmJjNDJhMTNjYzZmNWQ1NTE1Mzc2Mzp7Il9sYW5ndWFnZSI6Imt5IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0YTUyNzcwYjJiOGJhMzJhYjcyMTlhODI2MTdhZDU4ZDkzNTAwNTYifQ==	2019-11-25 19:17:50.809118+00
rr5ubpaox5wijaxtqlwxwsnd7sptmgyp	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-27 17:35:38.524886+00
dqgb3wflgbr5635gw2joy3n2spxvwqfi	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-27 17:50:27.072545+00
uuqhg7oh0ma107rtlym428m6960kp6wm	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-27 17:58:39.778579+00
op4j10m4zhswf1v8momghunjy4kv1nau	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-27 17:59:47.872714+00
l79sp97c1zc5laj3ky3wbvppcq52si9l	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-12-02 10:16:46.420495+00
5nn0g16kzj9ojjszjz5srlmqkx47dizt	YmU1ZGVhN2I2NzE3Mzg5OTRlYmJjNDJhMTNjYzZmNWQ1NTE1Mzc2Mzp7Il9sYW5ndWFnZSI6Imt5IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0YTUyNzcwYjJiOGJhMzJhYjcyMTlhODI2MTdhZDU4ZDkzNTAwNTYifQ==	2019-11-27 18:06:33.4852+00
lz8lnkqrl2afe9xv7mny0vezl7p48a2y	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-27 18:58:41.710517+00
e08y843ls9wjeyawl9g0j8jaz5voco8o	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-27 18:58:42.677371+00
qcnwdsk898g2a7ifsnh6tv3t0crqtvwd	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-28 03:55:31.405665+00
59wj41ol32cma8ek81gighddnoxxoy1q	NzE2ZDVmNGI1ZWNiYmVkZGQ2NzRjZjFiYjBlMzU3Yzk0Y2ZmOGRiYzp7Il9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0YTUyNzcwYjJiOGJhMzJhYjcyMTlhODI2MTdhZDU4ZDkzNTAwNTYifQ==	2019-11-26 06:20:23.493556+00
p4bvsq2wfvfo29yy5by77oi0it47oqd4	YTVjMjVhM2RlNDQ4ODYxYTIyMWYwZTBmODdjMTQ2ZDRmYzE4NmZiMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGE1Mjc3MGIyYjhiYTMyYWI3MjE5YTgyNjE3YWQ1OGQ5MzUwMDU2IiwiX2xhbmd1YWdlIjoia3kifQ==	2019-11-26 11:21:28.126569+00
2tdwp1tb3qq1u32x36sa81j0uvh0pf6z	YmU1ZGVhN2I2NzE3Mzg5OTRlYmJjNDJhMTNjYzZmNWQ1NTE1Mzc2Mzp7Il9sYW5ndWFnZSI6Imt5IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0YTUyNzcwYjJiOGJhMzJhYjcyMTlhODI2MTdhZDU4ZDkzNTAwNTYifQ==	2019-11-26 19:13:04.416679+00
x1z5pfjcllwcs9mhpwu7egaoof2nfbx7	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-25 18:57:52.132915+00
twdyaj2jq81tz5gnynjbe34us6qd1q5o	YTVjMjVhM2RlNDQ4ODYxYTIyMWYwZTBmODdjMTQ2ZDRmYzE4NmZiMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGE1Mjc3MGIyYjhiYTMyYWI3MjE5YTgyNjE3YWQ1OGQ5MzUwMDU2IiwiX2xhbmd1YWdlIjoia3kifQ==	2019-11-27 05:07:32.318103+00
4hqw90zjt6cm80lc31etmmkxi79grx7v	NWI2ODMyMmZlMzMyYzkyMjQxNGI1MmQ1NDU3YzY2ZmM3ZDRhZjkyOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGVlMWNmNTBjMDY2MzA1MDk0MDIyNjg2NjQ2NmY3ZGJiMmQzYmRmIiwiX2xhbmd1YWdlIjoia3kifQ==	2019-12-01 07:42:24.570159+00
763j3xmbs0p61td1bfdkm053iobtchup	ZjcxNTIwZGZhZGVmZmFjMDNjYzZmYzY1MzhkOGZmNWUxYTcyZmYzNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGVlMWNmNTBjMDY2MzA1MDk0MDIyNjg2NjQ2NmY3ZGJiMmQzYmRmIn0=	2019-12-02 02:56:40.908576+00
z936ho1khjzsu8otxehc2bknbzv7o2tp	ZjcxNTIwZGZhZGVmZmFjMDNjYzZmYzY1MzhkOGZmNWUxYTcyZmYzNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGVlMWNmNTBjMDY2MzA1MDk0MDIyNjg2NjQ2NmY3ZGJiMmQzYmRmIn0=	2019-12-02 02:56:56.967953+00
it3vxeowv0moscn2dv3uxmygk2g3sok6	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-28 07:13:42.942864+00
v2ts8zeeh54exyn04y274hu4s22fc8wa	ZTBmYTkxNTMzM2U0NzA5YzcxMmQ3NWU5MDQ3MWQwN2FiMDliMWYzYjp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-21 03:49:40.148275+00
pwkzii1jvqvqr8v0az46uvoaa6xdy9zn	ZGIyZjYxYTgwOTY1ZTc2MWRiZmIyNDc4M2Q3NTBmMmI5YTg4YjVjMTp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjU5N2I3Mjk4N2Q0M2UyNGJhNGFmMzM4NjkyMGU5ODdmYjgwM2RjYjUifQ==	2019-12-23 15:38:40.215489+00
hpxrqtlrfzy4gbqn3z2ntwdturs9n6fr	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-28 09:30:40.888975+00
dpzjvzhgql7s1qv4jvj5thynbdtn4pzh	ODRmMTIzN2UzNGE4MmYxOTJjODZlZGNkNWY0MjA5OGQ3NWIxZmMyNTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZmI1ODFhMzRlMjJmYTY1NmQzZjEwZWMwN2ExYzA5MmNkN2RjNmE2IiwiX2xhbmd1YWdlIjoia3kifQ==	2019-12-02 07:53:36.516985+00
empzvfds1da8nbkkmupu65dv11keiilz	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-11-28 17:18:29.104067+00
6tfqtuxbgehmcge9tf6ugtgqe2onp4sy	YTVjMjVhM2RlNDQ4ODYxYTIyMWYwZTBmODdjMTQ2ZDRmYzE4NmZiMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGE1Mjc3MGIyYjhiYTMyYWI3MjE5YTgyNjE3YWQ1OGQ5MzUwMDU2IiwiX2xhbmd1YWdlIjoia3kifQ==	2019-11-29 02:47:12.238486+00
36ed6tacfqd7z854g1kercpf9cyklk1v	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-12-02 08:30:11.595264+00
0dnt4eux1ej3vao71fg2a1hjcolipfaf	ZmNhZGEyYmIyN2M0ZjBjNzkzMTI1NWRlYmUzNzM5NWZlYTc4NzU2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGE1Mjc3MGIyYjhiYTMyYWI3MjE5YTgyNjE3YWQ1OGQ5MzUwMDU2In0=	2019-11-29 03:53:42.454699+00
804xvyigsvihxphk1utomfmgem649t7q	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-12-11 10:39:58.793174+00
x86sjvk4g7oh9tx4hmv06kckayz11cb7	ZmNhZGEyYmIyN2M0ZjBjNzkzMTI1NWRlYmUzNzM5NWZlYTc4NzU2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGE1Mjc3MGIyYjhiYTMyYWI3MjE5YTgyNjE3YWQ1OGQ5MzUwMDU2In0=	2019-11-30 05:09:01.888428+00
k57qra1ci8haumz3lzgtkzi2vl4jrw4w	MWM4OWE3Nzc1M2E2NWQzN2MzN2ZlM2NmMzZlMGE0MDBkMzk5ZTEzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OTdiNzI5ODdkNDNlMjRiYTRhZjMzODY5MjBlOTg3ZmI4MDNkY2I1In0=	2019-12-11 10:42:06.64051+00
78cb9ja0pw1jt6ks82bmql6c75sgzczs	ZmNhZGEyYmIyN2M0ZjBjNzkzMTI1NWRlYmUzNzM5NWZlYTc4NzU2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGE1Mjc3MGIyYjhiYTMyYWI3MjE5YTgyNjE3YWQ1OGQ5MzUwMDU2In0=	2019-11-30 09:23:23.1394+00
uui9jj06gng1pb5vc0e4m5cyzro7w4gi	MWM4OWE3Nzc1M2E2NWQzN2MzN2ZlM2NmMzZlMGE0MDBkMzk5ZTEzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OTdiNzI5ODdkNDNlMjRiYTRhZjMzODY5MjBlOTg3ZmI4MDNkY2I1In0=	2019-12-11 11:24:05.431632+00
0henhg9kaw0dtwfcbg9429i5xcmk9fs1	MWM4OWE3Nzc1M2E2NWQzN2MzN2ZlM2NmMzZlMGE0MDBkMzk5ZTEzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OTdiNzI5ODdkNDNlMjRiYTRhZjMzODY5MjBlOTg3ZmI4MDNkY2I1In0=	2019-12-15 09:34:01.237104+00
pl1odhfjg4dpobskujgwr8zrfizai8ex	ZGZhNGY2ZDA5ZTg2MzYwN2RiYWUwZWIzMGQ2YjkwZWI4ODczNTc5NDp7Il9sYW5ndWFnZSI6Imt5IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc0ZWUxY2Y1MGMwNjYzMDUwOTQwMjI2ODY2NDY2ZjdkYmIyZDNiZGYifQ==	2019-11-30 10:19:01.142936+00
dj76bah97xazz5b67qa5jn69jlpt1iwv	ZmEzMzcwMDE5OTcwMmY1YmRlMjM5Zjk1YjRhYzhlNWQyMzljZjhmNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGVlMWNmNTBjMDY2MzA1MDk0MDIyNjg2NjQ2NmY3ZGJiMmQzYmRmIiwiX2xhbmd1YWdlIjoicnUifQ==	2019-12-02 10:51:20.319399+00
qwwi36p7cr7hpzriojt4phrzub6yhqx2	ZjcxNTIwZGZhZGVmZmFjMDNjYzZmYzY1MzhkOGZmNWUxYTcyZmYzNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGVlMWNmNTBjMDY2MzA1MDk0MDIyNjg2NjQ2NmY3ZGJiMmQzYmRmIn0=	2019-11-30 10:20:06.921459+00
kwkpcorppi5nq155zxzdznuijokzpdo4	ZDkxNjMyMTFmYzNhNTkxNjgyOTI0ZTA3ZDlmYzg3MzY2MzgzZjZjNzp7Il9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjU5N2I3Mjk4N2Q0M2UyNGJhNGFmMzM4NjkyMGU5ODdmYjgwM2RjYjUifQ==	2019-12-15 09:42:32.624394+00
nhvkf5o386ewfwkmjh11lmyyouc4kpur	ODk5NzlmZmMzZDU1MmRkZmNmMDY5ZGQwZmRiYzQ0M2JkMjQyZDAyMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OTdiNzI5ODdkNDNlMjRiYTRhZjMzODY5MjBlOTg3ZmI4MDNkY2I1IiwiX2xhbmd1YWdlIjoia3kifQ==	2019-12-16 05:19:20.482728+00
jj5dvnidt9nmz9odm2u7izwyipxpuoi5	MTRkZWM4NWM5ODlmNTE0ODE0YTQyNzgxYmFlOTJjM2EzZmRhZmRjMDp7Il9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVlOWU5ZGUzMmRjZTBlNzhiZGMzZTUzNTY0YmZkMjZjY2M5YTFhODEifQ==	2019-12-03 04:50:45.665192+00
azom9h2bis9uzi5018ba8aixw10xe7el	YmNjMTkyOGI3MGE2OTljYTk0OWE3NWI0MmJhZDliZWQyYjgyMzk1NTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZTllOWRlMzJkY2UwZTc4YmRjM2U1MzU2NGJmZDI2Y2NjOWExYTgxIiwiX2xhbmd1YWdlIjoicnUifQ==	2019-12-20 04:32:31.014501+00
ajouoyxf3qeuxypybfonpp31mbliajuk	ODk5NzlmZmMzZDU1MmRkZmNmMDY5ZGQwZmRiYzQ0M2JkMjQyZDAyMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OTdiNzI5ODdkNDNlMjRiYTRhZjMzODY5MjBlOTg3ZmI4MDNkY2I1IiwiX2xhbmd1YWdlIjoia3kifQ==	2019-12-23 03:24:47.829709+00
4z5pzxcwb7a0czxvbmjzqp1tegnt8hc9	MWM4OWE3Nzc1M2E2NWQzN2MzN2ZlM2NmMzZlMGE0MDBkMzk5ZTEzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OTdiNzI5ODdkNDNlMjRiYTRhZjMzODY5MjBlOTg3ZmI4MDNkY2I1In0=	2019-12-18 08:35:49.171306+00
icx2ui06hoqd3wxqc988x6zdcuebe18k	ZTQzOWY5NGJjZjY1Yjk5ODBiZDAzNDZhMzMxZGYwZDczYjg3NGE2OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZTllOWRlMzJkY2UwZTc4YmRjM2U1MzU2NGJmZDI2Y2NjOWExYTgxIn0=	2019-12-19 05:12:04.776912+00
24c2zrtvewui7hl6v36tw5p73ewt2pfa	MWM4OWE3Nzc1M2E2NWQzN2MzN2ZlM2NmMzZlMGE0MDBkMzk5ZTEzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OTdiNzI5ODdkNDNlMjRiYTRhZjMzODY5MjBlOTg3ZmI4MDNkY2I1In0=	2019-12-20 06:38:57.886323+00
w1ym5y7i9y7s8wfzy07jsxiierfxgykq	ZjRiMWQwOWEzMDRhMzI1NjUxNGMwYmM3ZWM1NjI3MzBhMDFjZjZmZTp7Il9sYW5ndWFnZSI6Imt5In0=	2019-12-20 21:02:14.05843+00
\.


--
-- Data for Name: users_district; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.users_district (id, name, region, gov_admin, stat_admin) FROM stdin;
1	шаары	osh	Сарыбашов Т.Н.	Рысбаев А.Ы.
2	Карасуу	osh	Тилек И.	Ширин Т. Р.
\.


--
-- Data for Name: users_employee; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.users_employee (id, number, first_name, last_name, patronymic, address, agreement, image, role, qrcode, date_joined, district_id, "PIN", birth_day, organ, passport_num, serial) FROM stdin;
15	+996 (550) 15 40 76	Давлатёр	Алиев	Кабылович	г.Ош, массив Калинина 121 к / 38	000002	users/img/WhatsApp_Image_2019-11-18_at_10.43.38.jpeg	enum	users/qr-codes/996_550_15_40_76-Абарали-Алиев.png	2019-11-14 07:24:19.147044+00	1	20906197000906	1970-06-09	МКК 212011	0817650	ID
14	+996 (550) 15 43 82	Нурайым	Калилова	\N	г. Ош, ул. Нурматова, 48/2	000001	users/img/Photo_1573715583601.jpg	enum	users/qr-codes/996_550_15_43_82-Нурайым-Калилова.png	2019-11-14 07:13:26.812045+00	1	11312198700593	1987-12-13	МКК 212011	0590244	ID
18	+996 (550) 15 43 47	Феруза	Камалова	Мыктыбековна	Ош обл., Кара-Сууйский район, с. Правды, ул. Кош-Чынар	000003	users/img/WhatsApp_Image_2019-11-14_at_14.00.15.jpeg	enum	users/qr-codes/996_550_15_43_47-Феруза-Камалова.png	2019-11-14 08:00:46.891671+00	1	10609199800305	1998-09-06	МКК 50-34	4115939	AN
20	+996 (550) 15 43 81	Гулжамал	Жолболду кызы	\N	Ош обл., Ноокатский рай., с. Алашан, ул. Орозбекова, 111	000004	users/img/WhatsApp_Image_2019-11-14_at_14.08.49.jpeg	enum	users/qr-codes/996_550_15_43_81-Гулжамал-Жолболду_кызы.png	2019-11-14 08:12:27.066453+00	1	12811200000435	2000-11-28	МКК 216053	0741028	ID
33	+996 (550) 15 40 83	Мархабахан	Каримова	Махамадалиевна	г. Ош, ул. Намуна, 13	000005	users/img/Photo_1573724388753.jpg	enum	users/qr-codes/996_550_15_40_83-Мархабахан-Каримова.png	2019-11-14 09:40:31.801425+00	1	12211196400223	1964-11-22	МКК 212011	1027533	ID
37	+996 (550) 15 40 85	Рахима	Усманова	Турсунбаевна	г.Ош ,ул.Волгоградская 46	000010	users/img/Photo_1573726234427.jpg	enum	users/qr-codes/996_550_15_40_85-Рахима-Усманова.png	2019-11-14 10:16:22.928358+00	1	10903196400540	1964-03-09	Мкк 212011	0174586	ID
36	+996 (550) 15 40 84	Өмүргүл	Кожомкулова	Рахмановна	г.Ош  ул. Р.Абдыкадырова д.25 кв 4	000011	users/img/Photo_1573725490489.jpg	enum	users/qr-codes/996_550_15_40_84-Омургул-Кожомкулова.png	2019-11-14 10:02:57.144566+00	1	12502196600913	1966-02-25	Мкк 50-41	4513421	AN
29	+996 (550) 15 43 74	Айдана	Дөөлөтбек кызы	\N	Обл.Джалал-Абад,р-н .Базар-Коргон, с.Ооган-Талаа ,ул. У.Нармамат 85	000012	users/img/Photo_1573722525581.jpg	enum	users/qr-codes/996_550_15_43_74-Айдана-Доолотбек_кызы.png	2019-11-14 09:18:27.311444+00	1	10602200101031	2001-02-06	Мкк 214032	0618588	ID
26	+996 (550) 15 43 78	Зухра	Мухитдинова	Абдухаликовна	Ошская обл,р-н Кара-суу, с.Кашгар-Кыштак, ул.Ош д 41, кв 48	000013	users/img/Photo_1573721572737.jpg	enum	users/qr-codes/996_550_15_43_78-Зухра-Мухитдинова.png	2019-11-14 09:00:01.90735+00	1	12703196200870	1962-03-27	МКК 50-34	4510594	AN
24	+996 (550) 15 43 79	Данияр	Матираимов	Мамадиярович	г.Ош  ул.Краснофлотская 5 Н	000014	users/img/Photo_1573721041123.jpg	enum	users/qr-codes/996_550_15_43_79-Данияр-Матираимов.png	2019-11-14 08:48:40.209026+00	1	20703200200480	2002-03-07	Мкк 212011	0685905	ID
23	+996 (550) 15 41 07	Эльмира	Каримова	Абдрахманова	г.Ош ул.Атабаев 148 кв.31	000015	users/img/Photo_1573719937278.jpg	enum	users/qr-codes/996_550_15_41_06-Эльмира-Каримова.png	2019-11-14 08:31:56.797705+00	1	11501196900215	1969-01-01	Мкк 50-41	4130385	AN
19	+996 (550) 15 41 09	Зубагуль	Калилова	\N	г.Ош  ул.Нурматова 48, кв .2	000016	users/img/Photo_1573718340598.jpg	enum	users/qr-codes/996_550_15_41_09-Зубагуль-Калилова.png	2019-11-14 08:04:36.709208+00	1	12712195600500	1956-12-27	Mkk 50-41	2774580	AN
17	+996 (550) 15 41 23	Атыргүл	Ибраимова	Жусубалиевна	г.Ош, ул.Шота Руставели 126 ж	000017	users/img/Photo_1573717875811.jpg	enum	users/qr-codes/996_550_15_41_23-Атыргул-Ибраимова.png	2019-11-14 07:56:50.022956+00	1	12310198400453	1984-10-23	Мкк 50-47	2933661	AN
35	+996 (550) 15 43 48	Эрнст	Бекиев	Миркамилович	Ошская обл. р-н Ноокат, с. Караоке 3	000020	users/img/Photo_1573724434852.jpg	enum	users/qr-codes/996_550_15_43_48-Эрнст-Бекиев.png	2019-11-14 09:49:49.116385+00	1	21405199500347	1995-05-14	МКК 212011	0841280	ID
32	+996 (550) 15 41 05	Сейитбек	Келдибеков	Маматысламович	Ошская обл. р-н Чон-Алай, с. Кашка-Суу, ул. Ж. Бакирова 25	000021	users/img/Photo_1573723621952.jpg	enum	users/qr-codes/996_550_15_41_05-Сейитбек-Келдибеков.png	2019-11-14 09:32:46.908504+00	1	21509199301086	1993-09-15	ИИМ 50-76	1863171	AN
28	+996 (550) 15 43 72	Айназик	Камалидин кызы	\N	Ошская обл. р-н Чон-Алай, с. Дароот-Коргон, ул. Чукур 9	000022	users/img/Photo_1573722573071.jpg	enum	users/qr-codes/996_550_15_43_72-Айназик-Камалидин_кызы.png	2019-11-14 09:15:20.920054+00	1	12208200000474	2000-08-22	МКК 216071	0318644	ID
30	+996 (550) 15 43 71	Эрнис	Абдилла уулу	\N	Ошская олб., р-н Ноокат, с. Кок-Бел, ул. А. Абдышов 43	000024	users/img/Photo_1573723053433.jpg	enum	users/qr-codes/996_550_15_43_71-Эрнис-Абдилла_уулу.png	2019-11-14 09:23:09.83241+00	1	21202199601662	1996-02-12	МКК 50-41	4818046	AN
27	+996 (550) 15 43 75	Айбарчын	Азиз кызы	\N	Ошская обл. р-н Ноокат, с. Алашан	000025	users/img/Photo_1573721840214.jpg	enum	users/qr-codes/996_550_15_43_75-Айбарчын-Азиз_кызы.png	2019-11-14 09:03:11.525052+00	1	10603199801467	1998-03-06	МКК 50-00	3996674	AN
25	+996 (550) 15 43 76	Батма	Жээнбекова	Камчыбековна	Камчыбековна	000026	users/img/Photo_1573721306867.jpg	enum	users/qr-codes/996_550_15_43_76-Батма-Жээнбекова.png	2019-11-14 08:52:03.113682+00	1	12404198500799	1985-04-24	МКК 50-41	2725465	AN
22	+996 (550) 15 41 08	Мунаргул	Жумагулова	Аскербековна	г. Ош, ул. Чкалова 27/1	000027	users/img/Photo_1573719762096.jpg	enum	users/qr-codes/996_550_15_41_08-Мунаргул-Жумагулова.png	2019-11-14 08:29:28.822328+00	1	12101197201042	1972-01-21	МКК 50-41	2582388	AN
21	+996 (550) 15 40 79	Чынарбек	Айтбаев	Жумалыевич	Ош обл Узгенский р, с. Ничке - Сай, ул. Ак-Терек д. 49	000028	users/img/Photo_1573718852113.jpg	enum	users/qr-codes/996_550_15_40_79-Айбек-Айтбаев.png	2019-11-14 08:13:03.047125+00	1	21406198501611	1985-06-14	МКК 216061	0195408	ID
48	+996 (550) 15 43 67	Марлен	Жылдызбек уулу	\N	Ошская обл., р-н Кара-Суу, с.Отуз - Адыр, ул. Токтогул 4	000023	users/img/Photo_1573794876406.jpg	enum	users/qr-codes/996_550_15_43_67-Марлен-Жылдызбек_уулу.png	2019-11-15 05:19:04.527994+00	1	22508199801728	1998-08-25	МКК 50-34	4001274	AN
45	+996 (550) 15 43 69	Адылбек	Кожошев	Абдрасулович	г. Ош, ул. Абдыкадырова 1/6	000031	users/img/Photo_1573793904251.jpg	enum	users/qr-codes/996_550_15_43_69-Адылбек-Кожошев.png	2019-11-15 05:05:04.300859+00	1	21706200200955	2002-06-17	МКК 212011	0828564	ID
49	+996 (550) 15 41 02	Айдай	Койчубай кызы	\N	Баткенская обл,Кадамжайский р-н,с.Ноогардан	000034	users/img/Photo_1573795060472.jpg	enum	users/qr-codes/996_550_15_41_02-Айдай-Койчубай_кызы.png	2019-11-15 05:21:53.032612+00	1	12807200100284	2001-07-28	МКк 213021	0648979	ID
53	+996 (550) 15 43 89	Күмүшай	Сулайманова	Абибилаевна	Баткен обл, Баткенской рай, с. Жаны-Бак, ул. Достук, 9	000038	users/img/Photo_1573796525576.jpg	enum	users/qr-codes/996_550_15_43_89-Кумушай-Сулайманова.png	2019-11-15 05:45:05.949323+00	1	10103200000778	2000-03-01	МКК 213011	0307065	ID
47	+996 (550) 15 43 68	Марлен	Бейшеев	Нурланович	г. Ош., ул. Ш. Руставели 126г/22	000033	users/img/Photo_1573793982407.jpg	enum	users/qr-codes/996_550_15_43_68-Марлен-Бейшеев.png	2019-11-15 05:09:44.113196+00	1	21306200200497	2002-06-13	МКК 212011	0854702	ID
46	+996 (550) 15 40 91	Диёрбек	Камилов	Махамажанович	Ошская обл,Кара-Сууйский р-н,с.Мады ,ул.Достук	000032	users/img/Photo_1573794224366.jpg	enum	users/qr-codes/996_550_15_40_91-Диербек-Камилов.png	2019-11-15 05:08:56.398927+00	1	20106200200298	2002-06-01	МКК 216032	0839725	ID
52	+996 (550) 15 40 98	Ырысбек	Бурханов	Үсөнович	г.Ош , ул.М.Абжалов 50	000037	users/img/Photo_1573796294774.jpg	enum	users/qr-codes/996_550_15_40_98-Ырысбек-Бурханов.png	2019-11-15 05:42:21.856808+00	1	21503199800863	1998-03-15	Мкк 50-41	3849301	AN
50	+996 (550) 15 41 06	Каныгүл	Сулуева	Арпидиновна	г. Ош, ул. Ленина, 351, кв. 11А	000035	users/img/Photo_1573795378150.jpg	enum	users/qr-codes/996_550_15_41_06-Каныгул-Сулуева.png	2019-11-15 05:26:11.680228+00	1	10712196600879	1966-12-07	МКК 50-41	3086930	AN
51	+996 (550) 15 43 59	Жоодарбек	Бекмамат уулу	\N	г. Ош, ул. Ленина 349/5	000036	users/img/Photo_1573796306712.jpg	enum	users/qr-codes/996_550_15_43_59-Жоодарбек-Бекмамат_уулу.png	2019-11-15 05:41:57.685718+00	1	21404200100710	2001-04-14	МКК 212011	0190294	ID
55	+996 (550) 15 43 32	Дастан	Алиев	Абаралиевич	Ош шаары, Массив Калинина 121 / 36	000040	users/img/WhatsApp_Image_2019-11-16_at_11.10.10.jpeg	enum	users/qr-codes/996_557_78_70_41-Дастан-Алиев_Lge4HCQ.png	2019-11-15 06:57:19.711428+00	1	22608199200695	1992-08-26	МКК 212011	0057979	ID
54	+996 (550) 15 43 60	Динара	Исраилова	Кубанычовна	г. Ош, ул. К. Датка 246	000039	users/img/Photo_1573797278706.jpg	enum	users/qr-codes/996_550_15_43_60-Динара-Исраилова.png	2019-11-15 05:58:35.08442+00	1	12401197901166	1979-01-24	ИИМ 50-41	1936757	AN
56	+996 (550) 15 42 80	Мадина	Таджибаева	\N	г. Ош, с. Керме-Тоо, ул. Каримова, 37	000041	users/img/Photo_1573805611713.jpg	enum	users/qr-codes/996_550_15_42_80-Мадина-Таджибаева.png	2019-11-15 08:16:13.520411+00	1	11201200050011	1966-01-12	МКК 50-41	4856742	AN
57	+996 (550) 15 40 92	Махмуд	Боронбаев	Мамажанович	г. Ош, с. Керме-Тоо, ул. Каримова 11	000042	users/img/Photo_1573805598261.jpg	enum	users/qr-codes/996_550_15_40_92-Махмуд-Боронбаев.png	2019-11-15 08:17:13.034727+00	1	20112196600772	1966-12-01	МКК 50-41	2406929	AN
58	+996 (550) 15 43 61	Гулзар	Орозалиева	Маматовна	г.Ош,с.Татар,ул.Назаралиев 4	000043	users/img/Photo_1573805598422.jpg	enum	users/qr-codes/996_550_15_43_61-Гулзар-Орозалиева.png	2019-11-15 08:17:53.614826+00	1	12802199200655	1964-07-10	Мкк 212011	434657	ID
43	+996 (550) 15 43 58	Мадина	Калдарбекова	Калдарбековна	Ош обл, Кара-Кулжинский р, с. Сары-Булак	000006	users/img/Photo_1573728547556.jpg	enum	users/qr-codes/996_550_15_43_58-Мадина-Калдарбекова.png	2019-11-14 10:49:22.158544+00	1	10501200001744	2000-01-05	МКК 50-42	4511532	AN
31	+996 (550) 15 40 82	Динар	Маматысламова	Маматысламовна	Ошская обл,Чон-Алайский р-н,с.Кашка-Суу  ,ул. Ж.Бакиров 25	000007	users/img/Photo_1573723620632.jpg	enum	users/qr-codes/996_550_15_40_82-Динар-Маматысламова.png	2019-11-14 09:32:44.601386+00	1	10101200101640	2001-01-01	Мкк 216071	0553512	ID
41	+996 (550) 15 40 89	Алмагул	Бегимкулова	Насыровна	Баткенская обл, Кадамжайский р-н,ул.З.Бегимкулова д 14	000008	users/img/Photo_1573727727668.jpg	enum	users/qr-codes/996_550_15_40_89-Алмагул-Бегимкулова.png	2019-11-14 10:43:04.92811+00	1	11104200100254	2001-04-11	МКК213021	0200092	ID
39	+996 (550) 15 40 87	Периште	Кочкорали кызы	\N	Ошская обл,Ноокатский р-н, с.Салиева ,ул.Молдо -Тойчу 1	000009	users/img/Photo_1573726928462.jpg	enum	users/qr-codes/996_550_15_40_87-Периште-Кочкорали_кызы.png	2019-11-14 10:27:36.212618+00	1	10912200000286	2000-12-09	МКк 216053	0066968	ID
42	+996 (550) 15 43 57	Нуржамал	Кудайбердиева	Абдилазизовна	Ошская обл., р-н Ноокат, с. Борбаш, ул. Таштемирова 39	000018	users/img/Photo_1573727983002.jpg	enum	users/qr-codes/996_550_15_43_57-Нуржамал-Кудайбердиева.png	2019-11-14 10:43:55.453495+00	1	12802200100029	2001-02-28	МКК 216051	0641800	ID
40	+996 (550) 15 43 56	Уулча	Пирназарова	Пирматовна	Ошская обл. р-н Ноокат, с. Кыргыз-Ата	000019	users/img/Photo_1573727303599.jpg	enum	users/qr-codes/996_550_15_43_56-Пирназарова-Уулча.png	2019-11-14 10:33:47.069118+00	1	10509199001307	1990-09-05	МКК 212011	0798864	ID
60	+996 (550) 15 40 93	Бермет	Уларова	Медербековна	г. Ош, с. Жапалак, ул. А. Жумабаева 4	000045	users/img/Photo_1573805901949.jpg	enum	users/qr-codes/996_550_15_40_93-Бермет-Уларова.png	2019-11-15 08:23:06.852599+00	1	10905199501070	1995-05-09	МКК 212011	0222597	ID
61	+996 (550) 15 43 62	Зирек	Авазбек кызы	\N	г.Ош,с.Татар, ул.Школьная 14	000046	users/img/Photo_1573806005983.jpg	enum	users/qr-codes/996_550_15_43_62-Зирек-Авазбек_кызы.png	2019-11-15 08:23:11.994415+00	1	11007196400509	1992-02-28	МКк 212011	1163064	ID
59	+996 (550) 15 43 09	Бусалма	Ташполотова	Төрөбаевна	г. Ош, с. Гулбаар-Төлөйкан, ул. А. Малабекова, 40	000044	users/img/Photo_1573806013238.jpg	enum	users/qr-codes/996_550_15_43_09-Бусалма-Ташполотова.png	2019-11-15 08:22:44.986208+00	1	10401198600663	1986-01-04	МКК 50-03	4821870	AN
67	+996 (550) 15 43 07	Бектур	Максадбек уулу	\N	г. Ош, с. Кенеш, ул. Малабекова, 152	000052	users/img/Photo_1573806743857.jpg	enum	users/qr-codes/996_550_15_43_07-Бектур-Максадбек_уулу.png	2019-11-15 08:36:20.214572+00	1	22210199401512	1994-10-22	МКК 50-41	2616569	AN
62	+996 (550) 15 40 97	Гулзат	Ташиева	Азимжановна	Ошская обл., р-н Кара-Суу,с. Учар, ул. Калмат б/н	000047	users/img/Photo_1573806297121.jpg	enum	users/qr-codes/996_550_15_40_97-Гулзат-Ташиева.png	2019-11-15 08:28:25.252037+00	1	11010199201430	1992-10-10	ИИМ 50-34	1738623	AN
63	+996 (550) 15 43 64	Бекболот	Уларов	Кадырбекович	г.Ош,с.Кеңеш,ул.Б.Назаралиев 60	000048	users/img/Photo_1573806299604.jpg	enum	users/qr-codes/996_550_15_43_64-Бекболот-Уларов.png	2019-11-15 08:28:46.922013+00	1	21301199700985	1997-01-13	МКК 50-41	3391280	AN
64	+996 (550) 15 43 08	Бубусара	Курбаналиева	Насирдиновна	г. Ош, с. Гулбаар-Толойкан, ул. Токтобаев, 7	000049	users/img/Photo_1573806365016.jpg	enum	users/qr-codes/996_550_15_43_08-Бубусара-Курбаналиева.png	2019-11-15 08:28:49.092724+00	1	12809198400632	1984-09-28	МКК 50-41	2719842	AN
68	+996 (550) 15 40 94	Жумабек	Таштемир уулу	\N	г. Ош, с. Жапалак, ул. Малабекова 55	000053	users/img/Photo_1573806822834.jpg	enum	users/qr-codes/996_550_15_40_94-Жумабек-Таштемир_уулу.png	2019-11-15 08:36:26.139219+00	1	21101199000274	1990-01-11	МКК 212011	0764049	ID
65	+996 (550) 15 40 95	Асель	Базарбекова	Базарбековна	г. Ош, с. Жапалак, ул. Алиева 84	000050	users/img/Photo_1573806586162.jpg	enum	users/qr-codes/996_550_15_40_95-Асель-Базарбекова.png	2019-11-15 08:32:40.763312+00	1	10603199401026	1994-03-06	ИИМ 50-41	1979781	AN
66	+996 (550) 15 43 65	Чолпон	Карабаева	Бакиевна	г.Ош,с. Жапалак,ул.М.Алаев 16	000051	users/img/Photo_1573806595055.jpg	enum	users/qr-codes/996_550_15_43_65-Чолпон-Карабаева.png	2019-11-15 08:34:08.202335+00	1	12804196900091	1969-04-28	МКК 212011	0266367	ID
72	+996 (550) 15 42 82	Амирахан	Жороева	Маматкуловна	г. Ош, с. Жапалак, ул. З. Чекирова 80А	000057	users/img/Photo_1573807384353.jpg	enum	users/qr-codes/996_550_15_42_82-Амирахан-Жороева.png	2019-11-15 08:45:42.16172+00	1	12910197400476	1974-10-29	МКК 50-41	3379813	AN
69	+996 (550) 15 43 66	Гульнира	Тажибаева	Калмаматовна	г.Ош , с.Кеңеш,ул.Ташкулова 19	000054	users/img/Photo_1573807035015.jpg	enum	users/qr-codes/996_550_15_43_66-Гульнира-Тажибаева.png	2019-11-15 08:40:40.509393+00	1	10706197200587	1972-06-07	Мкк 212011	1044094	ID
70	+996 (550) 15 42 81	Жаркинай	Толошова	Ахматовна	г. Ош, ул. Алиева, 47	000055	users/img/Photo_1573807075891.jpg	enum	users/qr-codes/996_550_15_42_81-Жаркинай-Толошова.png	2019-11-15 08:41:36.835733+00	1	10504197800188	1978-04-05	МКК 212011	0827728	ID
75	+996 (550) 15 42 83	Мээрикан	Абылова	Ормоновна	г. Ош, с. Орке, ул. К. Датка 10	000060	users/img/Photo_1573807600700.jpg	enum	users/qr-codes/996_550_15_42_83-Мээрикан-Абылова.png	2019-11-15 08:49:35.948399+00	1	11003197200234	1972-03-10	МКК 50-41	3647529	AN
71	+996 (550) 15 40 96	Жамила	Мурзабекова	Жолчуевна	г. Ош, с. Жапалак, ул. Малабеков 39	000056	users/img/Photo_1573807073481.jpg	enum	users/qr-codes/996_550_15_40_96-Жамила-Мурзабекова.png	2019-11-15 08:42:08.762458+00	1	11509197300208	1973-09-15	МКК 50-41	3486673	AN
73	+996 (550) 15 42 93	Джовар	Осмонова	Сайпидиновна	г.Ош ,с.Кеңеш,ул.А.Алиева 44	000058	users/img/Photo_1573807415283.jpg	enum	users/qr-codes/996_550_15_42_93-Джовар-Осмонова.png	2019-11-15 08:47:14.255214+00	1	12108196800156	1968-08-21	МКК 50-41	4438422	AN
74	+996 (550) 15 43 10	Жыргал	Арапова	Женбаевна	г. Ош,с. Жапалак, ул. Тагиева, 120	000059	users/img/Photo_1573807510531.jpg	enum	users/qr-codes/996_550_15_43_10-Жыргал-Арапова.png	2019-11-15 08:49:18.774446+00	1	11107196500207	1965-07-11	МКК 50-41	1763573	AN
76	+996 (550) 15 42 92	Айнура	Казакова	Кушбаковна	г. Ош, с. Жапалак, ул. Матай 12	000061	users/img/Photo_1573807834283.jpg	enum	users/qr-codes/996_550_15_42_92-Айнура-Казакова.png	2019-11-15 08:52:44.818846+00	1	12012196800718	1968-12-20	МКК 50-41	3030080	AN
77	+996 (550) 15 43 06	Назира	Паязова	Ирапбаевна	г.Ош, ул.Кокумбий д.45,кв .15	000062	users/img/Photo_1573807765201.jpg	enum	users/qr-codes/996_550_15_43_06-Назира-Паязова.png	2019-11-15 08:53:44.244797+00	1	1090419800032	1980-04-09	МКК 212011	0970334	ID
78	+996 (550) 15 43 11	Кымбат	Мангиева	Максатбековна	г. Ош, с. Орке, ул. Орке, 71	000063	users/img/Photo_1573807929219.jpg	enum	users/qr-codes/996_550_15_43_11-Кымбат-Мангиева.png	2019-11-15 08:55:00.125061+00	1	12611119880089	1986-11-26	МКК 212011	1176198	ID
79	+996 (550) 15 42 91	Гулжамал	Батырбекова	Батырбековна	г. Ош, с. Жапалак, ул. А. Малабекова 1/8	000064	users/img/Photo_1573808024815.jpg	enum	users/qr-codes/996_550_15_42_91-Гулжамал-Батырбекова.png	2019-11-15 08:57:30.840692+00	1	10308199200732	1992-08-03	МКК 212011	1183680	ID
80	+996 (550) 15 43 04	Таттыбүбү	Ираева	Камалидиновна	г.Ош,с.Орке ,ул.Курманжан-Датка 28	000065	users/img/Photo_1573808104196.jpg	enum	users/qr-codes/996_550_15_43_04-Таттыбүбү-Ираева.png	2019-11-15 08:58:08.374163+00	1	12401199600203	1996-01-24	МКК 212011	1255940	ID
81	+996 (550) 15 42 84	Едгарбек	Юсупов	Давранбаевич	г. Ош, с. Жапалак, ул. Каримова 61	000066	users/img/Photo_1573808321580.jpg	enum	users/qr-codes/996_550_15_42_84-Едгарбек-Юсупов.png	2019-11-15 09:01:36.562113+00	1	22404199901081	1999-04-24	МКК 50-41	4296000	AN
82	+996 (550) 15 42 90	Бузейнеп	Шамытова	Нурматовна	г. Ош, с. Жапалак, ул. Жоробекова 8	000067	users/img/Photo_1573808619290.jpg	enum	users/qr-codes/996_550_15_42_90-Бузейнеп-Шамытова.png	2019-11-15 09:06:37.278052+00	1	12505198701035	1987-05-25	МКК 50-41	4641418	AN
96	+996 (550) 15 43 46	Арген	Чойуш уулу	\N	г. Ош, с. Жапалак, ул. Ташиева 6	000081	users/img/Photo_1573810131590.jpg	enum	users/qr-codes/996_550_15_43_46-Арген-Чойуш_уулу.png	2019-11-15 09:31:56.695086+00	1	21411199700111	1997-11-14	МКК 50-41	4165144	AN
83	+996 (550) 15 42 85	Аида	Нурматова	Айтмараковна	г. Ош, ул. Касымбекова 5/8	000068	users/img/Photo_1573808853722.jpg	enum	users/qr-codes/996_550_15_42_85-Аида-Нурматова.png	2019-11-15 09:10:19.527191+00	1	11011198501735	1985-11-10	МКК 50-41	3523036	AN
89	+996 (550) 15 42 86	Айсара	Алимкулова	Мамыразаковна	г. Ош, с. Жапалак, ул. Алыбаева 18	000074	users/img/Photo_1573809382936.jpg	enum	users/qr-codes/996_550_15_42_86-Айсара-Алимкулова.png	2019-11-15 09:19:09.444445+00	1	11601197900126	1979-01-16	МКК 50-41	2515892	AN
84	+996 (550) 15 43 02	Клара	Рашова	Жарматовна	г.Ош,с.Кеңеш,ул.А.Токтобаев 1	000069	users/img/Photo_1573808806422.jpg	enum	users/qr-codes/996_550_15_43_02-Клара-Рашова.png	2019-11-15 09:11:04.558792+00	1	10105198001599	1980-05-01	ИИМ 50-41	2033448	AN
85	+996 (550) 15 43 13	Танзила	Алдракова	Жаныбековна	г. Ош, с. Жапалак, ул. Сасыкбаева, 23	000070	users/img/Photo_1573809017903.jpg	enum	users/qr-codes/996_550_15_43_13-Танзила-Алдракова.png	2019-11-15 09:12:52.443661+00	1	12603198801491	1988-03-26	МКК 212011	0643604	ID
93	+996 (550) 15 42 88	Султангазы	Ажиев	Туратбекович	г. Ош, с. Жапалак, ул. Сасыкбаева 77	000078	users/img/Photo_1573809872130.jpg	enum	users/qr-codes/996_550_15_42_88-Султангазы-Ажиев.png	2019-11-15 09:27:34.696008+00	1	22809197900156	1979-09-28	МКК 216036	0392521	ID
86	+996 (550) 15 42 89	Абдурашут	Назаралиев	Баитович	г. Ош, с.Гулбар-Толойкон, ул. Малабекова 44	000071	users/img/Photo_1573809077798.jpg	enum	users/qr-codes/996_550_15_42_89-Абдурашут-Назаралиев.png	2019-11-15 09:15:29.86787+00	1	20506196800535	1968-06-05	МКК 50-41	3369015	AN
87	+996 (550) 15 42 94	Назгуль	Сайпиева	Сапарбаевна	г.Ош ,с.Жапалак ,ул.Жаркынбаев 3	000072	users/img/Photo_1573809162438.jpg	enum	users/qr-codes/996_550_15_42_94-Назгуль-Сайпиева.png	2019-11-15 09:16:48.960087+00	1	13005197701174	1977-05-30	МКК 50-41	2615670	AN
88	+996 (550) 15 43 14	Айгул	Мамасадыкова	Зулумбековна	г. Ош, Кара-Суйский рай., с. Папан, ул. Бору	000073	users/img/Photo_1573809299252.jpg	enum	users/qr-codes/996_550_15_43_14-Айгул-Мамасадыкова.png	2019-11-15 09:17:49.40444+00	1	11902197900142	1979-02-19	МКК 50-34	3002713	AN
91	+996 (550) 15 42 87	Элиза	Бурканова	Нематиллаевна	г. Ош, с. Жапалак, ул. Сасыкбаева 8	000076	users/img/Photo_1573809618473.jpg	enum	users/qr-codes/996_550_15_42_87-Элиза-Бурканова.png	2019-11-15 09:22:36.270656+00	1	10507198500730	1985-07-05	МКК 50-41	3979830	AN
90	+996 (550) 15 43 16	Шаиргүл	Кудайбердиева	Мусажановна	Ош обл, Кара-Суйский рай, с. Учар, ул. Калмат	000075	users/img/Photo_1573809557433.jpg	enum	users/qr-codes/996_550_15_43_16-Шаиргул-Кудайбердиева.png	2019-11-15 09:22:06.9508+00	1	12104197800192	1978-04-21	МКК 50-34	4785761	AN
94	+996 (550) 15 43 19	Жамила	Тайтокурова	Абазбековна	г. Ош, ул. Жантошова, 4	000079	users/img/Photo_1573809968167.jpg	enum	users/qr-codes/996_550_15_43_19-Жамила-Тайтокурова.png	2019-11-15 09:28:50.64844+00	1	11907196600029	1966-07-19	МКК 212011	0378815	ID
92	+996 (550) 15 43 01	Клара	Абдуллаева	Насировна	Ошская обл,Кара-Сууйский р-н,с.Жапалак ,ул.Т.Умарбаев 50	000077	users/img/Photo_1573809504786.jpg	enum	users/qr-codes/996_550_15_43_01-Клара-Абдуллаева.png	2019-11-15 09:23:19.845317+00	1	10410197200524	1972-10-04	МКК 50-34	3241620	AN
98	+996 (550) 15 42 95	Токтобү	Орозматова	Урустамовна	Г.Ош,с.Орке,ул.Султанбай 4	000083	users/img/Photo_1573810313144.jpg	enum	users/qr-codes/996_550_15_42_95-Токтобү-Орозматова.png	2019-11-15 09:35:01.708132+00	1	13001198900512	1989-01-30	МКК 50-41	4810481	AN
95	+996 (550) 15 42 96	Дилбар	Суранова	Арзановна	Г.Ош,с.Арек ,ул.Арекская 15	000080	users/img/Photo_1573809950181.jpg	enum	users/qr-codes/996_550_15_42_96-Дилбар-Суранова.png	2019-11-15 09:30:27.633586+00	1	12012195900263	1959-12-20	МКК 50-41	3280365	AN
97	+996 (550) 15 43 20	Сайрагул	Исмаилова	Туратовна	г. Ош, с. Орке, ул. Тагиева, 6	000082	users/img/Photo_1573810199891.jpg	enum	users/qr-codes/996_550_15_43_20-Сайрагул-Исмаилова.png	2019-11-15 09:32:46.41443+00	1	11801196700230	1967-01-18	МКК 50-41	4825807	AN
99	+996 (550) 15 43 22	Гульбарчын	Авазова	Умурзаковна	г. Ош, с. Орке, ул. Муратова, 37	000084	users/img/Photo_1573810434059.jpg	enum	users/qr-codes/996_550_15_43_22-Гульбарчын-Авазова.png	2019-11-15 09:36:27.428775+00	1	12402198100379	1984-02-24	МКК 50-41	1618517	AN
100	+996 (550) 15 43 37	Минура	Жумаева	Болотбаевна	г. Ош, с. Жапалак, ул.Жусубалиева 33	000085	users/img/Photo_1573810451069.jpg	enum	users/qr-codes/996_550_15_43_37-Минура-Жумаева.png	2019-11-15 09:37:34.424335+00	1	12506198500694	1985-06-25	МКК 212011	0331881	ID
101	+996 (550) 15 43 23	Бурул	Чотурова	Абдивалиевна	Г.Ош,с.Арек,ул.Оморалиев 6	000086	users/img/Photo_1573810637051.jpg	enum	users/qr-codes/996_550_15_43_23-Бурул-Чотурова.png	2019-11-15 09:40:46.277058+00	1	11605197300202	1973-05-16	МКК 212011	0235017	ID
102	+996 (550) 15 42 48	Гульмира	Мадисмаилова	Сулеймановна	г. Ош, с. Керме-Тоо, ул. Каримова, 67	000087	users/img/Photo_1573810695557.jpg	enum	users/qr-codes/996_550_15_42_48-Гульмира-Мадисмаилова.png	2019-11-15 09:41:03.786117+00	1	12505196900175	1969-05-25	МКК 212011	0512997	ID
103	+996 (550) 15 43 45	Гулипа	Канашаева	Адиевна	г. Ош, с. Арек, ул. Аттокурова 71	000088	users/img/Photo_1573810732368.jpg	enum	users/qr-codes/996_550_15_43_45-Гулипа-Канашаева.png	2019-11-15 09:41:50.398188+00	1	11907196900415	1969-07-19	МКК 212011	0264716	ID
104	+996 (550) 15 42 49	Дильбар	Таджибаева	Джураевна	г. Ош, с. Керме-Тоо, ул. Каримова, 37	000089	users/img/Photo_1573810928279.jpg	enum	users/qr-codes/996_550_15_42_49-Дильбар-Таджибаева.png	2019-11-15 09:44:25.147931+00	1	10503196401296	1964-03-05	МКК 50-41	4874299	AN
111	+996 (550) 15 43 25	Чынара	Маматеминова	Эгембердиевна	Ошская обл,Кара-Сууйский р-н,с.Мамажан,ул.Жаштар 3	000096	users/img/Photo_1573812231884.jpg	con	users/qr-codes/996_550_15_43_25-Чынара-Маматеминова.png	2019-11-15 10:07:39.280252+00	1	11403198500201	1985-03-14	МКК 50-00	3664604	AN
105	+996 (550) 15 43 36	Калмамат	Алашбеков	Дооронбекович	г.Ош, 218-квартал,ул.3 ,д.11	000090	users/img/Photo_1573810919480.jpg	enum	users/qr-codes/996_550_15_43_36-Калмамат-Алашбеков.png	2019-11-15 09:45:43.784887+00	1	22802196000468	1960-02-28	МКК 212011	0894721	ID
106	+996 (550) 15 43 42	Эрлан	Рыскулов	Искандарович	Ошская обл., р-н Араван,с.Мангыт,ул.Толойкон	000091	users/img/Photo_1573810988283.jpg	enum	users/qr-codes/996_550_15_43_42-Эрлан-Рыскулов.png	2019-11-15 09:47:22.30117+00	1	21004199400076	1994-04-10	МКК 50-30	2516420	AN
107	+996 (550) 15 42 79	Дилбар	Жусупбек кызы	\N	г. Ош, с. Кенеш, ул. А. Алиева, 64	000092	users/img/Photo_1573811135868.jpg	enum	users/qr-codes/996_550_15_42_79-Дилбар-Жусупбек_кызы.png	2019-11-15 09:47:59.036351+00	1	10607198000578	1980-07-06	МКК 212011	0292484	ID
112	+996 (550) 15 42 50	Зарипа	Ташматова	Мусаевна	г. Ош, с. Кенеш, ул. Малабекова, 91	000097	users/img/Photo_1573812346554.jpg	con	users/qr-codes/996_550_15_42_50-Зарипа-Ташматова.png	2019-11-15 10:08:48.890993+00	1	11701197600779	1976-01-17	МКК 50-41	3924045	AN
108	+996 (550) 15 43 26	Лайлихан	Мангиева	Паязовна	г.Ош,с.Орке,ул.Иматали 23	000093	users/img/Photo_1573811966800.jpg	con	users/qr-codes/996_550_15_43_26-Лайлихан-Мангиева.png	2019-11-15 10:02:38.250225+00	1	10803196600621	1966-03-08	МКК 50-41	2719875	AN
109	+996 (550) 15 42 78	Мунарбек	Сайназаров	Аскарович	г. Ош, с. Жапалак, ул. Жаны-Чек, 2/3	000094	users/img/Photo_1573811968472.jpg	con	users/qr-codes/996_550_15_42_78-Мунарбек-Сайназаров.png	2019-11-15 10:03:06.317367+00	1	22811198501057	1985-11-28	МКК 212011	0725176	ID
116	+996 (550) 15 42 77	Бермет	Чынгызбек кызы	\N	Ошская обл. р-н Кара-Суу,с. Правда, ул.Жаны-Чек	000101	users/img/Photo_1573879090012.jpg	enum	users/qr-codes/996_550_15_42_77-Бермет-Чынгызбек_кызы.png	2019-11-16 04:42:19.995046+00	1	11105199600334	1996-05-11	МКК 50-34	3176347	AN
110	+996 (550) 15 43 38	Расул	Атабаев	Абдуманабович	г. Ош, с. Кенеш, ул. Алиева 4	000095	users/img/Photo_1573811932843.jpg	con	users/qr-codes/996_550_15_43_38-Расул-Атабаев.png	2019-11-15 10:06:26.497799+00	1	22703198800321	1988-03-27	МКК 50-41	4489346	AN
113	+996 (550) 15 43 41	Сабир	Осмонов	Каримович	г. Ош, с. Арек, ул. Жусубалиева 101	000098	users/img/Photo_1573812272074.jpg	con	users/qr-codes/996_550_15_43_41-Сабир-Осмонов.png	2019-11-15 10:09:40.412701+00	1	22906196300224	1963-06-29	ИИМ 50-41	2167844	AN
114	+996 (550) 15 43 27	Эльнура	Раева	Алижановна	г.Ош,с.Жапалак,ул.Иметали 3	000099	users/img/Photo_1573812582013.jpg	con	users/qr-codes/996_550_15_43_27-Эльнура-Раева.png	2019-11-15 10:12:38.949642+00	1	10912198901128	1989-12-09	МКК 212011	0021072	ID
115	+996 (550) 15 43 39	Аширбубу	Джолчуева	Топчибаевна	Баткенская обл. р-н Кадамжай,г.Айдаркен,ул.Тынчтык 4	000100	users/img/Photo_1573812681349.jpg	con	users/qr-codes/996_550_15_43_39-Аширбубу-Джолчуева.png	2019-11-15 10:14:33.993907+00	1	11406199600402	1996-06-14	МКК 50-48	3392922	AN
117	+996 (550) 15 42 76	Аймээрим	Арапова	Качыбековна	Ошская обл.,р-н Ноокат,с.Котормо,ул.Каримбердиев 57	000102	users/img/Photo_1573879467705.jpg	enum	users/qr-codes/996_550_15_42_76-Аймээрим-Арапова.png	2019-11-16 04:47:40.845183+00	1	12702199900511	1999-02-27	МКК 50-40	4795252	AN
119	+996 (550) 15 42 61	Айзирек	Бактыбек кызы	\N	Жалал-Абадская обл.,р-н Аксы,уч. Капчыгай 1	000104	users/img/Photo_1573879744477.jpg	enum	users/qr-codes/996_550_15_42_61-Айзирек-Бактыбек_кызы.png	2019-11-16 04:53:57.567752+00	1	12711199800132	1998-11-27	МКК 214021	1223971	ID
118	+996 (550) 15 42 51	Гулнара	Аманова	Алтынбековна	г.Ош ,с.Жапалак,ул.Ташиев 4	000103	users/img/Photo_1573879588846.jpg	enum	users/qr-codes/996_550_15_42_51-Гулнара-Аманова.png	2019-11-16 04:49:21.866401+00	1	11608199900918	1999-08-16	МКК 212011	0903755	ID
120	+996 (550) 15 42 52	Каныкей	Калматова	Нурбековна	Баткенская обл,г.Кызыл-Кия ,мкр 1,д.6 , кв 19	000105	users/img/Photo_1573879865162.jpg	enum	users/qr-codes/996_550_15_42_52-Каныкей-Калматова.png	2019-11-16 04:54:33.772026+00	1	10407199901055	1999-07-04	МКК 50-36	4450426	AN
121	+996 (550) 15 42 59	Жумагул	Ташболот кызы	\N	Ошская обл.,р-н Ноокат, с. Чеч-Добо	000106	users/img/Photo_1573880507076.jpg	enum	users/qr-codes/996_550_15_42_59-Жумагул-Ташболот_кызы.png	2019-11-16 05:05:09.204316+00	1	10406199300479	1993-06-04	ИИМ 50-40	2223157	AN
122	+996 (550) 15 42 58	Айнура	Асанова	Сайдакматовна	г. Ош, пр. А. Масалиева 39/41	000107	users/img/Photo_1573880786290.jpg	enum	users/qr-codes/996_550_15_42_58-Айнура-Асанова.png	2019-11-16 05:10:01.475252+00	1	11406197300820	1973-06-14	МКК 212011	0454214	ID
123	+996 (550) 15 42 57	Рахыя	Эркинбаева	Абдырахмановна	г. Ош, ул. Жибекчи 13	000108	users/img/Photo_1573881079852.jpg	enum	users/qr-codes/996_550_15_42_57-Рахыя-Эркинбаева.png	2019-11-16 05:14:38.647914+00	1	10601197800619	1978-01-06	МКК 212011	126171	ID
124	+996 (550) 15 42 53	Азизбек	Доолатбай уулу	\N	г. Ош, ул. Бекболаева 36/7	000109	users/img/Photo_1573881417283.jpg	enum	users/qr-codes/996_550_15_42_53-Азизбек-Доолатбай_уулу.png	2019-11-16 05:20:18.66396+00	1	20712199300764	1993-12-07	МКК 50-41	2672893	AN
125	+996 (550) 15 42 63	Гулиза	Маматысламова	Маматысламовна	Ошская обл.,р-н Чон-Алай, с. Кашка-Суу	000110	users/img/Photo_1573881715085.jpg	enum	users/qr-codes/996_550_15_42_63-Гулиза-Маматысламова.png	2019-11-16 05:27:26.331592+00	1	11706199600991	1996-06-17	МКК 50-76	3410810	AN
126	+996 (550) 15 42 62	Айдай	Сыдыкова	Жакыповна	Ошская обл,Араванский р-н,с.Гулбахар,ул.Пахта-Арал	000111	users/img/Photo_1573881875443.jpg	enum	users/qr-codes/996_550_15_42_62-Айдай-Сыдыкова.png	2019-11-16 05:28:04.468143+00	1	11502200001121	2000-02-15	МКК 50-30	4831999	AN
137	+996 (550) 15 42 16	Шайырбек	Кийизбаев	Сулайманович	Жалал-Абадская обл.,г.Жалал-Абад,пр.Манас 2/10	000122	users/img/Photo_1573890642844.jpg	enum	users/qr-codes/996_550_15_42_16-Шайырбек-Кийизбаев.png	2019-11-16 07:57:30.801573+00	1	22008198900828	1989-08-20	МКК 50-32	2852678	AN
127	+996 (550) 15 42 65	Айсулуу	Аскарбекова	Аскарбековна	г. Ош, мкр. Толойкон, 1/18	000112	users/img/Photo_1573882172682.jpg	enum	users/qr-codes/996_550_15_42_65-Айсулуу-Аскарбекова.png	2019-11-16 05:32:52.649768+00	1	11601199500533	1995-01-16	ИИМ 50-41	2204805	AN
133	+996 (550) 15 42 70	Бекмамат	Ырыскул уулу	\N	Ошская обл.,р-н Ноокат, с. Бел	000118	users/img/Photo_1573883080105.jpg	enum	users/qr-codes/996_550_15_42_70-Бекмамат-Ырыскул_уулу.png	2019-11-16 05:47:56.668634+00	1	20707199400914	1994-07-07	МКК 50-41	4785752	AN
128	+996 (550) 15 42 67	Мээримбек	Ахыналиев	Алмазбекович	Баткенская обл,Кадамжайский р-н,с.Миң-Чынар	000113	users/img/Photo_1573882208299.jpg	enum	users/qr-codes/996_550_15_42_67-Мээримбек-Ахыналиев.png	2019-11-16 05:33:03.729495+00	1	21302199900456	1999-02-13	МКк 50-48	4201344	AN
129	+996 (550) 15 42 74	Шайыргуль	Жолдошова	Амановна	г.Ош,с.Тээке ,ул.Гулбаар 68	000114	users/img/Photo_1573882487319.jpg	enum	users/qr-codes/996_550_15_42_74-Шайыргуль-Жолдошова.png	2019-11-16 05:37:37.886308+00	1	12807197700488	1977-07-28	МКК 50-41	2978534	AN
130	+996 (550) 15 42 75	Айгерим	Токсонбаева	Балтабаевна	г. Ош, ул. Ташкентская 19	000115	users/img/Photo_1573882472535.jpg	enum	users/qr-codes/996_550_15_42_75-Айгерим-Токсонбаева.png	2019-11-16 05:38:09.934209+00	1	10504198901450	1989-04-05	МКК 212011	0794895	ID
131	+996 (550) 15 42 73	Тимурлан	Маметов	Абдибаитович	г. Ош, ул. Атабаева 1/9	000116	users/img/Photo_1573882799414.jpg	enum	users/qr-codes/996_550_15_42_73-Тимурлан-Маметов.png	2019-11-16 05:42:36.414722+00	1	22409199300793	1993-09-24	МКК 50-41	4783926	AN
132	+996 (550) 15 42 71	Айтгүл	Карыбек кызы	\N	Ошская обл,Чоң-Алайский р-н,с.Кызыл-Эшме	000117	users/img/Photo_1573882843359.jpg	enum	users/qr-codes/996_550_15_42_71-Айтгүл-Карыбек_кызы.png	2019-11-16 05:44:24.215945+00	1	12001199900708	1999-01-20	МКК 50-76	4930632	AN
140	+996 (550) 15 42 29	Асылкан	Сатыбалдиева	Базарбаевна	Г.Ош,мкр.Толойкон д.27 кв 26	000125	users/img/Photo_1573891449045.jpg	enum	users/qr-codes/996_550_15_42_29-Асылкан-Сатыбалдиева.png	2019-11-16 08:08:03.11039+00	1	12511195900933	1959-11-25	МКК 212011	0116635	ID
135	+996 (550) 15 42 14	Аймээрим	Раимбердиева	Замирбековна	Баткенская обл,Кадамжайский р-н,с.Калтак,ул.Абдырахманова 30	000120	users/img/Photo_1573889654548.jpg	enum	users/qr-codes/996_550_15_42_14-Аймээрим-Раимбердиева.png	2019-11-16 07:38:01.307772+00	1	12108200100367	2001-08-21	МКК 213024	0803788	ID
138	+996 (550) 15 42 30	Гулмира	Аттокурова	Шарабидиновна	г.Ош, мкр.Кулатов д.9,кв2	000123	users/img/Photo_1573890921167.jpg	enum	users/qr-codes/996_550_15_42_30-Гулмира-Аттокурова.png	2019-11-16 07:59:15.689379+00	1	11804197900680	1979-04-18	МКК 50-41	449993	AN
136	+996 (550) 15 42 26	Гулнара	Кенжеева	Абдылдаевна	Г.Ош ,мкр.Ак-Тилек ,ул.15 д.18	000121	users/img/Photo_1573890673588.jpg	enum	users/qr-codes/996_550_15_42_26-Гулнара-Кенжеева.png	2019-11-16 07:54:17.825229+00	1	12901198601090	1986-01-29	МКК 212011	132370	ID
139	+996 (550) 15 42 23	Тинатин	Абдырахманова	Эркинбаевна	г. Ош, ул. МЖК 8/16	000124	users/img/Photo_1573891327226.jpg	enum	users/qr-codes/996_550_15_42_23-Тинатин-Абдырахманова.png	2019-11-16 08:05:30.03757+00	1	13003198700503	1987-03-30	МКК 50-00	4220089	AN
142	+996 (550) 15 42 28	Токтокан	Жусупова	Абдырахмановна	Баткенская обл,Баткенский р-н,с.Бужум	000127	users/img/Photo_1573891755655.jpg	enum	users/qr-codes/996_550_15_42_28-Токтокан-Жусупова.png	2019-11-16 08:12:39.921632+00	1	12505198100186	1981-05-25	ИИМ 50-00	1970016	AN
141	+996 (550) 15 42 19	Айнура	Турдукулова	Калмаматовна	Ошская обл.,р-н Араван,с.Араван,ул.Жаны-Араван	000126	users/img/Photo_1573891713729.jpg	enum	users/qr-codes/996_550_15_42_19-Айнура-Турдукулова.png	2019-11-16 08:12:21.664632+00	1	11404198500748	1985-04-14	МКК 50-30	3522477	AN
143	+996 (550) 15 42 18	Зымырат	Айткулова	Абдываповна	г. Ош, мкр. Толойкон 29/29	000128	users/img/Photo_1573892100624.jpg	enum	users/qr-codes/996_550_15_42_18-Зымырат-Айткулова.png	2019-11-16 08:18:06.297369+00	1	10805195900499	1959-05-08	МКК 50-41	3531153	AN
134	+996 (550) 15 42 68	Нурсулуу	Алдашүкүрова	Равшанбековна	Ош обл., Ѳзгѳн р., Кыргызстан а., 47	000119	users/img/Photo_1573889198089.jpg	enum	users/qr-codes/996_550_15_42_68-Нурсулуу-Алдашүкүрова.png	2019-11-16 07:31:18.417323+00	1	12501199201171	1992-06-25	МКК 212011	0786268	ID
145	+996 (550) 15 43 40	Кимсан	Жунусова	Шадыевна	г. Ош, ул. Бекбалаева 36/7	000130	users/img/Photo_1573892420833.jpg	enum	users/qr-codes/996_550_15_43_40-Кимсан-Жунусова.png	2019-11-16 08:23:42.088472+00	1	11202196501030	1965-02-12	МКК 50-41	2690485	AN
146	+996 (550) 15 42 36	Диана	Казбекова	Казбековна	г.Ош ,мкрТолейкен д.11 кв 73	000131	users/img/Photo_1573892494276.jpg	enum	users/qr-codes/996_550_15_42_36-Диана-Казбекова.png	2019-11-16 08:24:15.46036+00	1	12001200350073	2003-01-20	МКК 212011	1209345	ID
147	+996 (550) 15 42 34	Акбарча	Бакенова	Камалбековна	г. Ош, мкр. Толойкон 11/73	000132	users/img/Photo_1573892745123.jpg	enum	users/qr-codes/996_550_15_42_34-Акбарча-Бакенова.png	2019-11-16 08:29:41.535816+00	1	10308197901217	1979-08-03	МКК 212011	0372968	ID
148	+996 (550) 15 42 33	Медина	Суерова	Токтоназаровна	Жалал -Абадская обл, пгт.Таш-Кумыр	000133	users/img/Photo_1573892843146.jpg	enum	users/qr-codes/996_550_15_42_33-Медина-Суерова.png	2019-11-16 08:34:03.08407+00	1	12003200300445	2003-03-20	МКК 212011	1179981	ID
155	+996 (550) 15 42 45	Сүйүтбек	Карабеков	Маматканович	г.Ош,мкр.Т.Кулатов д.1,кв.68	000140	users/img/Photo_1573894752748.jpg	con	users/qr-codes/996_550_15_42_45-Сүйүтбек-Карабеков.png	2019-11-16 09:01:41.351312+00	1	21403199500082	1995-03-14	МКК 50-41	2406906	AN
149	+996 (550) 15 42 32	Нурумбет	Иманказыев	Иманказыевич	Ошская обл. р-н Узген, с.Куршаб,ул.Абдраева	000134	users/img/Photo_1573893136022.jpg	enum	users/qr-codes/996_550_15_42_32-Нурумбет-Иманказыев.png	2019-11-16 08:35:37.181575+00	1	22608199700785	1997-08-26	МКК 50-47	3760121	AN
166	+996 (550) 15 42 08	Айгерим	Каңдыбаева	Сүйүндүковна	Ошская обл,Чоң-Алайский р-н,с.Чак	000151	users/img/Photo_1573896475552.jpg	enum	users/qr-codes/996_550_15_42_08-Айгерим-Каңдыбаева.png	2019-11-16 09:31:39.883591+00	1	10508199901128	1999-08-05	МКК 50-76	4391827	AN
150	+996 (550) 15 42 31	Айзирек	Меңдибаева	Балтаевна	г.Ош,мкр Толейкен д.11,кв 92	000135	users/img/Photo_1573893400146.jpg	enum	users/qr-codes/996_550_15_42_31-Айзирек-Меңдибаева.png	2019-11-16 08:40:03.953945+00	1	10908199900206	1999-08-09	МКК 212011	1217915	ID
151	+996 (550) 15 42 40	Темирлан	Каримов	Акматбекович	г. Ош, мкр. Ак-Тилек, ул. 26,д.37	000136	users/img/Photo_1573893490784.jpg	con	users/qr-codes/996_550_15_42_40-Темирлан-Каримов.png	2019-11-16 08:42:14.928287+00	1	21409199500422	1995-09-14	МКК 212011	0152412	ID
164	+996 (550) 15 42 07	Тамара	Саркеева	Жеңишбаевна	г.Ош,мкр.Ак-Тилек ,ул.30,д.13	000149	users/img/Photo_1573896234569.jpg	enum	users/qr-codes/996_550_15_42_07-Тамара-Саркеева.png	2019-11-16 09:26:50.825221+00	1	12810197200606	1972-10-28	МКК 50-41	4478649	AN
152	+996 (550) 15 42 43	Мираида	Сулайманова	Нургазыевна	г.Ош ,ул Краснофлотская 5 н,кв 23	000137	users/img/Photo_1573893813880.jpg	enum	users/qr-codes/996_550_15_42_43-Мираида-Сулайманова.png	2019-11-16 08:46:22.407976+00	1	10708200000842	2000-08-07	МКК 212011	0198185	ID
156	+996 (550) 15 42 37	Гулчехра	Гуламидинова	Мамарасуловна	г. Ош, ул. М. Алымбекова 56А	000141	users/img/Photo_1573895036205.jpg	enum	users/qr-codes/996_550_15_42_37-Гулчехра-Гуламидинова.png	2019-11-16 09:09:11.784416+00	1	12009197701070	1977-09-20	МКК 50-41	3372620	AN
153	+996 (550) 15 42 41	Турдукан	Кыдырбаева	Алдаяровна	г. Ош, мкр. Анар 10/11	000138	users/img/Photo_1573893836610.jpg	enum	users/qr-codes/996_550_15_42_41-Турдукан-Кыдырбаева.png	2019-11-16 08:46:38.152281+00	1	10312195300322	1953-12-03	МКК 212011	0235271	ID
154	+996 (550) 15 42 44	Жумакан	Исмаилова	Аматахуновна	г. Ош, мкр. Кулатова 21/24	000139	users/img/Photo_1573894328759.jpg	con	users/qr-codes/996_550_15_42_44-Жумакан-Исмаилова.png	2019-11-16 08:54:40.309177+00	1	12404195800062	1958-04-24	МКК 212011	0018380	ID
157	+996 (550) 15 42 38	Нуркыял	Камал кызы	\N	г.Ош ,ул.Р.Абдыкадырова  д 207,кв .17	000142	users/img/Photo_1573895286295.jpg	con	users/qr-codes/996_550_15_42_38-Нуркыял-Камал_кызы.png	2019-11-16 09:12:08.707679+00	1	11208199000205	1990-08-12	МКК 212011	0696321	ID
158	+996 (550) 15 42 12	уулу Эльдар	Абдурасулжан	\N	Ошская обл., р-н Ноокат, с.Айбек,ул.Айбек 25	000143	users/img/Photo_1573895430317.jpg	enum	users/qr-codes/996_550_15_42_12-Эльдар-Абдурасулжан_уулу.png	2019-11-16 09:13:17.55877+00	1	22204199900050	1999-04-22	МКК 50-40	4449650	AN
160	+996 (550) 15 43 55	Мээрим	Айдаркулова	Манасовна	г.Ош, мкр.Ак-Тилек ,ул. 14 ,д.17	000145	users/img/Photo_1573895614655.jpg	enum	users/qr-codes/996_550_15_42_39-Мээрим-Айдаркулова.png	2019-11-16 09:17:31.314209+00	1	10211200100166	2001-11-02	МКК212011	0797539	ID
163	+996 (550) 15 42 47	Жанаргүл	Жандарбек кызы	\N	Ошская обл.,р-н Кара-Кулжа, с. Биринчи май	000148	users/img/Photo_1573896130777.jpg	enum	users/qr-codes/996_550_15_42_47-Жанаргул-Жандарбек_кызы.png	2019-11-16 09:24:21.722568+00	1	12909199801255	1998-09-29	МКК 50-42	4364289	AN
159	+996 (550) 15 42 13	Тилек	Абдусамад уулу	\N	Ошская обл, р-н Ноокат, с. Сарыканды	000144	users/img/Photo_1573895652761.jpg	enum	users/qr-codes/996_550_15_42_13-Тилек-Абдусамад_уулу.png	2019-11-16 09:16:49.425114+00	1	20701199900272	1999-01-07	МКК 50-40	4405573	AN
162	+996 (550) 15 42 09	Айымкан	Молдожанова	Абдилажановна	г.Ош,мкр.Ак-Тилек,ул.30,д9	000147	users/img/Photo_1573895978124.jpg	enum	users/qr-codes/996_550_15_42_09-Айымкан-Молдожанова.png	2019-11-16 09:22:39.668122+00	1	10512196450002	1964-12-05	МКК 212011	0431962	ID
161	+996 (550) 15 42 11	Альбина	Асамидинова	Жеңишбековна	Баткенская обл.,р-н Кадамжай,с.Орозбекова,ул.Металлург	000146	users/img/Photo_1573895869717.jpg	enum	users/qr-codes/996_550_15_42_11-Альбина-Асамидинова.png	2019-11-16 09:21:18.374829+00	1	12901199900270	1999-01-29	МКК 50-48	4086397	AN
165	+996 (550) 15 42 46	Айчүрөк	Каратаева	Мамасадыковна	г. Ош, ул. Салиева 26/48	000150	users/img/Photo_1573896321854.jpg	enum	users/qr-codes/996_550_15_42_46-Айчурок-Каратаева.png	2019-11-16 09:27:46.375777+00	1	11702196300277	1963-02-17	МКК 50-41	2653350	AN
167	+996 (550) 15 41 90	Ижобатхон	Ибодова	Нематовна	Ошская обл,р-н Кара-Суу,с.Кашкар-Кыштак,ул.Ошская 41/25	000152	users/img/Photo_1573896535958.jpg	enum	users/qr-codes/996_550_15_41_90-Ижобатхон-Ибодова.png	2019-11-16 09:32:10.989773+00	1	12610196800727	1968-10-26	МКК 216031	0607959	ID
168	+996 (550) 15 41 77	Дамира	Мирзаматова	Рустамбековна	г. Ош, ул. Алиева 110	000153	users/img/Photo_1573896802377.jpg	enum	users/qr-codes/996_550_15_41_77-Дамира-Мирзаматова.png	2019-11-16 09:36:56.453333+00	1	10807198800430	1988-07-08	ИИМ 50-41	1754483	AN
169	+996 (550) 15 41 78	Эльгиза	Эрмек кызы	\N	Ошская обл,Узгенский р-н,с.Мырза-Аке,ул.Н.Танаев 18	000154	users/img/Photo_1573896785033.jpg	enum	users/qr-codes/996_550_15_41_78-Эльгиза-Эрмек_кызы.png	2019-11-16 09:37:13.288524+00	1	11811200000659	2000-11-18	МКК 50-47	4913695	AN
184	+996 (550) 15 41 24	Гульбара	Аденова	Наджиевна	г. Ош, мкр. Кулатова 19/111	000169	users/img/Photo_1573959807172.jpg	enum	users/qr-codes/996_550_15_41_24-Гульбара-Аденова.png	2019-11-17 03:07:27.145718+00	1	11704196000832	1960-04-17	МКК 50-41	2350497	AN
170	+996 (550) 15 41 76	Дарика	Абдыбакир кызы	\N	Ошская обл.,р-н Чон-Алай, с. Чак	000155	users/img/Photo_1573897084180.jpg	enum	users/qr-codes/996_550_15_41_76-Дарика-Абдыбакир_кызы.png	2019-11-16 09:40:42.379575+00	1	10109199501421	1995-09-01	МКК 50-76	2918772	AN
177	+996 (550) 15 41 83	Айгерим	Салыева	Жолчубековна	г.Ош,ул.Кокум-Бий д.100,кв 4	000162	users/img/Photo_1573897643622.jpg	enum	users/qr-codes/996_550_15_41_83-Айгерим-Салыева.png	2019-11-16 09:51:06.525378+00	1	11402200200946	2002-02-14	МКК 212011	0896627	ID
171	+996 (550) 15 41 89	Уланбек	Жаныбек уулу	\N	Ошская обл,Узгенский р-н,с.Эски-Покровка ,ул.К.Сайпидинов 78	000156	users/img/Photo_1573897108047.jpg	enum	users/qr-codes/996_550_15_41_89-Уланбек-Жаныбек_уулу.png	2019-11-16 09:41:32.486974+00	1	21912199901278	1999-12-19	МКК 212011	0900931	ID
172	+996 (550) 15 41 91	Наргиза	Камалова	Буркановна	Ош обл, Өзгөн р., Красный маяк а.	000157	users/img/Photo_1573897337504.jpg	enum	users/qr-codes/996_550_15_41_91-Наргиза-Камалова.png	2019-11-16 09:43:13.928432+00	1	12708198101249	1981-08-27	Mkk 50-47	2436566	AN
182	+996 (550) 15 41 88	Айбегим	Кожобекова	Эрмановна	Жалал-Абадская обл,Аксыйский р-н,с.Жерге-Тал	000167	users/img/Photo_1573898290631.jpg	enum	users/qr-codes/996_550_15_41_88-Айбегим-Кожобекова.png	2019-11-16 10:02:00.792162+00	1	11602200300759	2003-02-16	Мкк 214021	1410280	ID
173	+996 (550) 15 41 75	Махабат	Эргешбаева	Эргешбаевна	Жалал-Абадская обл., г. Таш-Кумыр, ул.Чыныбаева 115	000158	users/img/Photo_1573897295087.jpg	enum	users/qr-codes/996_550_15_41_75-Махабат-Эргешбаева.png	2019-11-16 09:45:25.133581+00	1	10504199000895	1990-04-05	МКК 50-41	4902661	AN
178	+996 (550) 15 43 28	Феруза	Алиева	Кабыловна	Переулок мехнат 27	000163	users/img/IDPhoto_20191116_150420.jpg	enum	users/qr-codes/996_550_15_43_28-Феруза-Алиева.png	2019-11-16 09:53:42.373306+00	1	12006197301012	1973-06-20	Иим 50-41	2199822	AN
174	+996 (550) 15 41 80	Батма	Аалыбекова	Аалыбековна	Ошская обл,Кара-Сууйский р-н,час.Тулейкен,	000159	users/img/Photo_1573897348090.jpg	enum	users/qr-codes/996_550_15_41_80-Батма-Аалыбекова.png	2019-11-16 09:46:32.064867+00	1	13009199900161	1999-09-30	МКК 50-34	4879509	AN
175	+996 (550) 15 41 92	Рустамжан	Тлогобылов	Аллауевич	Ош ш., Г. Айтиев к. 61	000160	users/img/Photo_1573897617304.jpg	enum	users/qr-codes/996_550_15_41_92-Рустамжан-Тлогобылов.png	2019-11-16 09:47:31.255419+00	1	20706196000612	1960-06-07	ИИМ 50-41	1999922	AN
176	+996 (550) 15 41 62	Бектур	Досбаев	Асылбекович	г. Ош, ул. Байтемирова 1А/36	000161	users/img/Photo_1573897587986.jpg	enum	users/qr-codes/996_550_15_41_62-Бектур-Досбаев.png	2019-11-16 09:49:49.321236+00	1	20101199801230	1998-01-01	МКК 212011	0755665	ID
179	+996 (550) 15 41 99	Зепе	Айдаркулова	Манасовна	Ош ш., Ак-тилек к/р. , 14 к., 17	000164	users/img/Photo_1573898006795.jpg	enum	users/qr-codes/996_550_15_41_99-Зепе-Айдаркулова.png	2019-11-16 09:53:49.711647+00	1	11806199900813	1999-06-18	Mkk 50-41	4794409	AN
180	+996 (550) 15 41 84	Бекболсун	Садыров	\N	г.Ош,ул.Касымова 169/12	000165	users/img/Photo_1573897921650.jpg	enum	users/qr-codes/996_550_15_41_84-Бекболсун-Садыров.png	2019-11-16 09:55:57.760697+00	1	20102200101325	2001-02-01	МКК 212011	0152321	ID
183	+996 (550) 15 42 01	Зульфия	Момунова	Назаралиевна	Жалал-абад обл., Аксы р., Сыны а., Р. Момунов к., 13	000168	users/img/Photo_1573898558507.jpg	enum	users/qr-codes/996_550_15_42_01-Зульфия-Момунова.png	2019-11-16 10:03:01.382962+00	1	11512200150220	2001-12-15	Mkk 214024	0874223	ID
181	+996 (550) 15 41 63	Хусан	Дадажонов	Абдусаматович	г. Ош, ул. Курманжан Датка 329	000166	users/img/Photo_1573897913121.jpg	enum	users/qr-codes/996_550_15_41_63-Хусан-Дадажонов.png	2019-11-16 09:56:32.687609+00	1	23107199200271	1992-07-31	МКК 212011	1006391	ID
144	+996 (550) 15 42 27	Нурайым	Молдыкеева	Кенишбековна	Жалал-Абадская обл, пгт.Шамалды -Сай, ул.Южная 23	000129	users/img/Photo_1573892118249.jpg	enum	users/qr-codes/996_550_15_42_27-Нурайым-Молдыкеева.png	2019-11-16 08:18:39.910181+00	1	10110198400721	1984-10-01	МКК 212011	0969433	ID
186	+996 (550) 15 41 28	Алия	Сражидин кызы	\N	Ошская обл.,р-н Ноокат,с.Котормо,ул.Котормо 19	000171	users/img/Photo_1573960630731.jpg	enum	users/qr-codes/996_550_15_41_28-Алия-Сражидин_кызы.png	2019-11-17 03:21:33.944806+00	1	12405200000348	2000-05-24	МКК 50-40	4620189	AN
185	+996 (550) 15 41 27	Бекболсун	Бектурган уулу	\N	Ошская обл.,р-н Узген,с. Кызыл-Тоо,ул.А.Маматбаев 29	000170	users/img/Photo_1573960169881.jpg	enum	users/qr-codes/996_550_15_41_27-Бекболсун-Бектурган_уулу.png	2019-11-17 03:15:21.21244+00	1	22905200100670	2001-05-29	МКК 216061	0967102	ID
187	+996 (550) 15 41 86	Эрбакан	Айдаркулов	Манасович	г. Ош, мкр. Ак-Тилек, ул. 14,д.17	000172	users/img/Photo_1573961122479.jpg	enum	users/qr-codes/996_550_15_41_86-Эрбакан-Айдаркулов.png	2019-11-17 03:30:48.683125+00	1	20210199601632	1996-10-02	МКК 50-41	3604831	AN
188	+996 (550) 15 41 85	Теңизбай	Бокоев	Ысмайылович	г.Ош,мкр.Ак-Тилек ,ул.21,д.32	000173	users/img/Photo_1573961262050.jpg	con	users/qr-codes/996_550_15_41_85-Теңизбай-Бокоев.png	2019-11-17 03:31:35.90542+00	1	22307195900301	1959-07-23	ИИМ 50-41	2033422	AN
189	+996 (550) 15 43 85	Жумагуль	Хасанова	Хасановна	г.Ош,ул.К.Кулматов 15	000174	users/img/Photo_1573961589194.jpg	enum	users/qr-codes/996_550_15_43_85-Жумагуль-Хасанова.png	2019-11-17 03:36:36.499476+00	1	10902199000133	1990-02-09	МКК 212011	1166711	ID
197	+996 (550) 15 41 95	Асылбек	Туменбаев	Акматович	г.Ош,мкр.Ак-Тилек ,ул.30,д.18	000182	users/img/Photo_1573965243431.jpg	enum	users/qr-codes/996_550_15_41_95-Асылбек-Туменбаев.png	2019-11-17 04:36:55.337126+00	1	22707199402223	1994-07-27	МКК 50-41	3668510	AN
190	+996 (550) 15 41 67	Абидин	Токоев	Бурханович	Ошская обл,Кара-Сууйский р-н,с.у.Сары -Колот,с.Ак-Колот	000175	users/img/Photo_1573962119707.jpg	con	users/qr-codes/996_550_15_41_67-Абидин-Токоев.png	2019-11-17 03:45:41.447045+00	1	22210196600315	1966-10-22	МКК 212011	1276766	ID
192	+996 (550) 15 41 68	Бекарстан	Атабеков	Илиязович	Баткенская обл,г.Кызыл -Кия,ул.Асаналиев 27,д.27	000177	users/img/Photo_1573963038076.jpg	con	users/qr-codes/996_550_15_41_68-Бекарстан-Атабеков.png	2019-11-17 04:00:34.435411+00	1	22110199801092	1998-10-21	МКК 50-36	4402342	AN
202	+996 (550) 15 41 49	Айдана	Жыркалбек кызы	\N	Жалал-Абадская обл., г. Таш-Кумыр, ул. Токтогул	000187	users/img/Photo_1573966861725.jpg	enum	users/qr-codes/996_550_15_41_49-Айдана-Жыркалбек_кызы.png	2019-11-17 05:04:25.802257+00	1	11701199800352	1998-01-17	МКК 50-45	4164739	AN
198	+996 (550) 15 41 29	Таңсулуу	Топчубай кызы	\N	Ошская обл,Ноокатский р-н,с.Борбаш	000183	users/img/Photo_1573966170423.jpg	enum	users/qr-codes/996_550_15_41_29-Таңсулуу-Топчубай_кызы.png	2019-11-17 04:51:54.00065+00	1	11303199900715	1999-03-13	Мкк 50-40	4467874	AN
193	+996 (550) 15 41 93	Каныкей	Сайпидинова	Сайпидиновна	Ошская обл,Алайский р-н,с.Гүлчө	000178	users/img/Photo_1573963925053.jpg	enum	users/qr-codes/996_550_15_41_93-Каныкей-Сайпидинова.png	2019-11-17 04:15:46.864513+00	1	10803200200696	2002-03-08	МКК 216011	0769257	ID
194	+996 (550) 15 41 98	Мээрим	Төлөгөн кызы	\N	г.Ош,ул.Бекбалаева д.12 ,кв 14	000179	users/img/Photo_1573964248411.jpg	con	users/qr-codes/996_550_15_41_98-Мээрим-Төлөгөн_кызы.png	2019-11-17 04:20:10.821793+00	1	12007200101031	2001-07-20	МКК 216011	1021477	ID
195	+996 (550) 15 41 97	Нурболот	Айдаралиев	Нурбекович	Ошская обл,Кара-Сууйский р-н,час.Төлөйкөн,с.Коргон	000180	users/img/Photo_1573964472213.jpg	enum	users/qr-codes/996_550_15_41_97-Нурболот-Айдаралиев.png	2019-11-17 04:24:49.113091+00	1	22008199800977	1998-08-20	МКК 50-34	4034550	AN
199	+996 (550) 15 41 30	Нуртемир	Балтабаев	Балтабаевич	г.Ош,ул.Ташкнтская 17	000184	users/img/Photo_1573966425808.jpg	enum	users/qr-codes/996_550_15_41_30-Нуртемир-Балтабаев.png	2019-11-17 04:56:15.351354+00	1	21012199100671	1991-12-10	МКК 212011	1203633	ID
196	+996 (550) 15 41 96	Бектурсун	Оморалиев	Оморалиевич	г.Ош,мкр.Кулатов д.21,кв.21	000181	users/img/Photo_1573964824943.jpg	enum	users/qr-codes/996_550_15_41_96-Бектурсун-Оморалиев.png	2019-11-17 04:30:00.337457+00	1	22108200300051	2003-08-21	МКК 212011	1375668	ID
203	+996 (550) 15 41 33	Курманжан	Тентиева	Салижановна	Ошская обл,Узгенский р-н,с.Шералы	000188	users/img/Photo_1573968042589.jpg	enum	users/qr-codes/996_550_15_41_33-Курманжан-Тентиева.png	2019-11-17 05:23:44.619138+00	1	1160819990738	1999-08-16	Мкк 50-47	4336916	AN
200	+996 (550) 15 42 04	Мавлюда	Усманова	Пахлавановна	Ошская обл.,р-н Кара-Суу,ул. Имам-Ата	000185	users/img/Photo_1573966513035.jpg	enum	users/qr-codes/996_550_15_42_04-Мавлюда-Усманова.png	2019-11-17 04:58:53.780175+00	1	11411198800402	1988-11-14	МКК 212011	0178837	ID
201	+996 (550) 15 41 32	Максат	Пазилидинов	Колдошевич	Ошская обл,Ноокатский р-н,с.Борбаш	000186	users/img/Photo_1573966669099.jpg	enum	users/qr-codes/996_550_15_41_32-Максат-Пазилидинов.png	2019-11-17 05:00:18.55026+00	1	20110199901024	1999-10-01	Мкк 50-40	4452017	AN
191	+996 (550) 15 41 69	Алийма	Момунова	Назаралиевна	Жалал-Абадская обл,Аксыйский р-н,с.Каражыгач	000176	users/img/Photo_1573962449803.jpg	con	users/qr-codes/996_550_15_41_69-Алима-Момунова.png	2019-11-17 03:50:37.507083+00	1	11409198700760	1987-09-14	МКК 212011	0860163	ID
204	+996 (550) 15 41 35	Жылдыз	Ысмайылова	Абжапаровна	г.Ош,ул.Салиевой 48/В	000189	users/img/Photo_1573968525447.jpg	con	users/qr-codes/996_550_15_41_35-Жылдыз-Ысмайылова.png	2019-11-17 05:31:38.004065+00	1	10904198800186	1988-04-09	МКК 212011	0264492	ID
207	+996 (550) 15 40 29	Бурулкан	Ысмайылова	Абжапаровна	Ошская обл,Ноокатский р-н,с.Ятан,ул.Жатан 42	000190	users/img/Photo_1573978429864.jpg	enum	users/qr-codes/996_550_15_40_29-Бурулкан-Ысмайылова.png	2019-11-17 08:17:05.654638+00	1	10102197900327	1979-02-01	МКК 50-40	3522914	AN
210	+996 (550) 15 40 32	Сүйдүмкан	Маматова	Асилбековна	Ошская обл.,р-н Чон-Алай, с. Дароот-Коргон	000193	users/img/Photo_1573980079811.jpg	enum	users/qr-codes/996_550_15_40_32-Суйдумкан-Маматова.png	2019-11-17 08:48:58.46769+00	1	11909200000314	2000-09-19	МКК 216071	0339244	ID
208	+996 (550) 15 40 23	Райкан	Ысмаилова	Апжапаровна	Ошская обл,Алайский р-н,с.Гүлчө,ул.Бөкөев 9	000191	users/img/Photo_1573979343446.jpg	enum	users/qr-codes/996_550_15_40_23-Райкан-Ысмаилова.png	2019-11-17 08:32:19.511259+00	1	12306197200048	1972-06-23	МКК 50-41	4431716	AN
209	+996 (550) 15 40 31	Калысбек	Досиев	Тологонович	г. Ош, 223 квартал, ул. 8, д 7	000192	users/img/Photo_1573979976863.jpg	enum	users/qr-codes/996_550_15_40_31-Калысбек-Досиев.png	2019-11-17 08:45:03.553496+00	1	22412198801322	1988-12-24	МКК 212011	0139689	ID
211	+996 (550) 15 43 87	Нурмира	Кожобекова	\N	г. Ош, ул. Бадыгина 6/9	000194	users/img/Photo_1573980043947.jpg	enum	users/qr-codes/996_550_15_43_87-Нурмира-Кожобекова.png	2019-11-17 08:56:08.60808+00	1	10512197700022	1977-12-05	МКК 212011	1393825	ID
206	+996 (550) 15 41 48	Зуура	Ысмайылова	Абжапаровна	г.Ош.мкр.Тюлейкен д.3,кв.11	000029	users/img/Photo_1573978084875.jpg	enum	users/qr-codes/996_550_15_41_48-Зуура-Ысмайылова.png	2019-11-17 08:11:40.488009+00	1	10201198600417	1998-01-02	МКК 212011	0005575	ID
212	+996 (550) 15 43 86	Аида	Номанова	Ибайдилаевна	Ошская обл,Ноокатский р-н,с.Кыргыз -Ата	000195	users/img/Photo_1573981491365.jpg	enum	users/qr-codes/996_550_15_43_86-Аида-Номанова.png	2019-11-17 09:07:30.459912+00	1	12108199900043	1999-08-21	МКК 216051	1000623	ID
226	+996 (700) 00 00 00	Аовлв	Аты	Вдадв	По двдвд	\N	users/img/Photo_1574063748629.jpg	enum	users/qr-codes/996_700_00_00_00-Аовлв-Аты.png	2019-11-18 07:56:36.734867+00	2	1101010487679	1999-12-31	Мкк 50-41	10000	AN
213	+996 (550) 15 40 35	Дилбар	Байдыева	Ташмаматовна	г.Ош,мкр.Ак-Тилек ,ул.14,д.17	000196	users/img/Photo_1573981867683.jpg	enum	users/qr-codes/996_550_15_40_35-Дилбар-Байдыева.png	2019-11-17 09:14:15.271717+00	1	11007197100954	1971-07-10	МКК 212011	0005989	ID
220	+996 (550) 15 41 39	Нуржамал	Атазакова	Арзыбаевна	Ошская обл,Кара-Сууйский р-н,часть Төлөйкөн,ул.Калмат 30	000203	users/img/Photo_1573987136343.jpg	enum	users/qr-codes/996_550_15_41_39-Нуржамал-Атазакова.png	2019-11-17 10:42:10.529339+00	1	10103198400114	1984-03-01	МКК 50-34	4342506	AN
214	+996 (550) 15 41 20	Зейнегуль	Шердакова	Джаныбековна	г.Ош,ул.Абакир уулу Төрөбек д.3,кв.16	000197	users/img/Photo_1573982628100.jpg	enum	users/qr-codes/996_550_15_41_20-Зейнегуль-Шердакова.png	2019-11-17 09:26:48.716483+00	1	11009198870146	1987-09-10	МКК 212011	0230080	ID
215	+996 (550) 15 40 75	Дилбар	Мамасыдыкова	Мамасыдыковна	г. Ош, ул. Исанова 39/42	000198	users/img/Photo_1573983147636.jpg	enum	users/qr-codes/996_550_15_40_75-Дилбар-Мамасыдыкова.png	2019-11-17 09:37:16.593242+00	1	11401199100988	1991-01-14	МКК 212011	1179180	ID
224	+996 (550) 15 42 60	Акмарал	Чынгызбек кызы	\N	Ошская обл,Кара-Сууйский р-н,с.Жаңы -Арык	000207	users/img/Photo_1574055866200.jpg	enum	users/qr-codes/996_550_15_42_60-Акмарал-Чынгызбек_кызы.png	2019-11-18 05:47:27.592014+00	1	12311199400342	1994-11-23	МКК 50-34	3278688	AN
216	+996 (550) 15 43 83	Сыймык	Улан уулу	\N	Ош. обл, Кара-Суйский рай, с. Төлөйкан, ул. Калмат	000199	users/img/WhatsApp_Image_2019-11-17_at_15.42.23.jpeg	enum	users/qr-codes/996_550_15_43_83-Сыймык-Улан_уулу.png	2019-11-17 09:49:08.854483+00	1	21003199900375	1999-03-10	МКК 50-41	4445969	AN
221	+996 (550) 15 41 38	Минура	Аширбекова	Аттокуровна	г.Ош,с.Орке,ул.Маматеминов	000204	users/img/Photo_1573987381204.jpg	enum	users/qr-codes/996_550_15_41_38-Минура-Аширбекова.png	2019-11-17 10:45:50.644031+00	1	13105198400650	1984-05-31	МКК 50-41	2948157	AN
217	+996 (550) 15 41 36	Анарбек	Үсөнбай уулу	\N	Ош. обл, Кара-Суйский рай, с. Учар, ул. Калмат	000200	users/img/WhatsApp_Image_2019-11-17_at_15.43.17.jpeg	enum	users/qr-codes/996_550_15_41_36-Анарбек-Үсөнбай_уулу.png	2019-11-17 10:24:59.095905+00	1	20602199900403	1999-02-06	МКК 50-41	4747088	AN
205	+996 (550) 15 41 03	Зульфия	Таирова	Талбановна	Ошская обл,Кара-Сууйский р-н,с.Кызыл-Кыштак,уч.Ишкаван.	000030	users/img/Photo_1573976495887.jpg	con	users/qr-codes/996_550_15_41_48-Зульфия-Таирова.png	2019-11-17 07:45:49.25473+00	1	12201196800764	1968-01-22	МКК 50-34	2576995	AN
218	+996 (550) 15 41 37	Акинай	Токтосунова	Мамасадыковна	Ошская обл,с.Кеңеш,ул.Ташкулов 22	000201	users/img/Photo_1573986459948.jpg	con	users/qr-codes/996_550_15_41_37-Акинай-Токтосунова.png	2019-11-17 10:31:02.569139+00	1	11610198700675	1987-10-16	МКК 50-41	4891253	AN
219	+996 (550) 15 40 74	Алтынбек	Арзимамат уулу	\N	Ошская обл., р-н Ноокат, с.Ак-Терек,ул.Ош 18	000202	users/img/IMG-20191117-WA0000.jpg	enum	users/qr-codes/996_550_15_40_74-Алтынбек-Арзимамат_уулу.png	2019-11-17 10:33:33.172372+00	1	20204199900195	1999-04-02	МКК 50-40	4316254	AN
223	+996 (550) 15 41 47	Кыязов	Өмүрбек	Жумабаевич	Ошская обл,Ноокатский р-н,с.Кыргыз-Ата, ул.Т.Абдикеримов д.30	000206	users/img/Photo_1574051755708.jpg	enum	users/qr-codes/996_550_15_41_47-Бактыяр-Жумабай_уулу.png	2019-11-18 04:40:47.786435+00	1	22903198400385	1984-03-29	ИИМ 50-40	2009781	AN
222	+996 (550) 15 41 44	Нурсултан	Зикиров	Бактыбекович	Ошская обл,Ноокатский р-н,с.Интернационал,ул.Кашкалдак 22	000205	users/img/Photo_1573988863735.jpg	enum	users/qr-codes/996_550_15_41_44-Нурсултан-Зикиров.png	2019-11-17 11:19:07.498123+00	1	21307199201438	1992-07-13	ИИМ 50-40	1816153	AN
225	+996 (550) 15 41 46	Айпери	Анапиева	Нурланбековна	Ошская обл,Кара-Сууйский р-н,с.Отуз-Адыр,ул.А.Атамбиев	000208	users/img/Photo_1574063377004.jpg	enum	users/qr-codes/996_550_15_41_46-Айпери-Анапиева.png	2019-11-18 07:53:02.03657+00	1	11611199400919	1994-11-16	МКК 50-34	556503	AN
227	+996 (700) 00 00 10	Аовлв	Аты	Вдадв	По двдвд	000002	users/img/Photo_1574063748629_KxcLVzP.jpg	enum	users/qr-codes/996_700_00_00_10-Аовлв-Аты.png	2019-11-18 07:57:29.696527+00	2	1101010487679	1999-12-31	Мкк 50-41	10000	AN
228	+996 (111) 11 11 11	Кубанычбек	Акмырзаев	Урматбекович	Бишкек ш. Чүй к. 17	000209	users/img/Photo_1574069498123.jpg	con	users/qr-codes/996_111_11_11_11-Кубанычбек-Акмырзаев.png	2019-11-18 09:41:01.268698+00	1	86865494665656	1990-12-12	Мккала	1346161	ID
230	+996 (559) 50 35 00	Союзбек	Орозбек уулу	\N	Ош обл. Өзгөн р. Шоро башат а. 31	000211	users/img/Photo_1574069462399.jpg	cor	users/qr-codes/996_559_50_35_00-Союзбек-Орозбек_уулу.png	2019-11-18 09:48:38.135262+00	1	5646467	1996-05-29	Мкк211031	0227866	ID
234	+996 (550) 15 40 53	Сарварбек	Рахманов	Лутфуллоевич	г. Ош, ул. Хакикат 2	000211	users/img/WhatsApp_Image_2019-11-21_at_14.06.20.jpeg	enum	users/qr-codes/996_550_15_40_53-Сарварбек-Рахманов.png	2019-11-21 10:10:44.518926+00	1	22802199600534	1996-02-28	МКК 50-41	2764919	ID
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.users_user (id, password, is_superuser, last_login, number, district_id, is_staff) FROM stdin;
2	pbkdf2_sha256$150000$YuAW3I214kmo$RsAg0TJcj6K/8pUllGWAdJrHSK3UnG+WwdpoMgU3V7M=	t	2019-12-05 05:12:04.771919+00	+996 (550) 15 41 20	1	t
4	pbkdf2_sha256$150000$eqKKi9VW9biB$7dgKRwfhdVwfDR7TBw++WXU3lMhMlFFaD9GsAfeF3dU=	t	2019-11-18 07:59:42.549845+00	+996 (701) 20 07 16	2	t
1	pbkdf2_sha256$150000$2MyOnVjWqJfu$XTfXeANtYXp0weydk559oA6/DVxJm2syKcpYyMyvPN8=	t	2019-12-09 15:38:40.212464+00	+996 (559) 00 00 00	1	t
3	pbkdf2_sha256$150000$9genA09fHlba$MMbgJFRsihaK6ogDiOUGMdGXH3GRGoVNI4LeDcpjLoE=	t	\N	+996 (550) 15 40 76	1	t
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: soyuz
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuz
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuz
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuz
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuz
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 119, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuz
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuz
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 40, true);


--
-- Name: users_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuz
--

SELECT pg_catalog.setval('public.users_district_id_seq', 2, true);


--
-- Name: users_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuz
--

SELECT pg_catalog.setval('public.users_employee_id_seq', 234, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuz
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuz
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: soyuz
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: users_district users_district_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_district
    ADD CONSTRAINT users_district_pkey PRIMARY KEY (id);


--
-- Name: users_employee users_employee_number_key; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_employee
    ADD CONSTRAINT users_employee_number_key UNIQUE (number);


--
-- Name: users_employee users_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_employee
    ADD CONSTRAINT users_employee_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_number_id_key; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_number_id_key UNIQUE (number);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: users_employee_district_id_ba5a0e80; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX users_employee_district_id_ba5a0e80 ON public.users_employee USING btree (district_id);


--
-- Name: users_employee_number_1c617077_like; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX users_employee_number_1c617077_like ON public.users_employee USING btree (number varchar_pattern_ops);


--
-- Name: users_user_district_id_42933a3a; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX users_user_district_id_42933a3a ON public.users_user USING btree (district_id);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_number_id_8c37388e_like; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX users_user_number_id_8c37388e_like ON public.users_user USING btree (number varchar_pattern_ops);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: soyuz
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_employee users_employee_district_id_ba5a0e80_fk_users_district_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_employee
    ADD CONSTRAINT users_employee_district_id_ba5a0e80_fk_users_district_id FOREIGN KEY (district_id) REFERENCES public.users_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user users_user_district_id_42933a3a_fk_users_district_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_district_id_42933a3a_fk_users_district_id FOREIGN KEY (district_id) REFERENCES public.users_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: soyuz
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

