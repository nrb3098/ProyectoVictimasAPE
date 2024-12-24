-- Verificar si el usuario ya existe antes de crearlo
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'ravape_user') THEN
        CREATE USER ravape_user WITH PASSWORD 'Acceso_db1_rav_APE';
    END IF;
END
$$;

-- Crear la base de datos si no existe
--CREATE DATABASE rav_ape_db1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';

-- Asignar el propietario de la base de datos al usuario
ALTER DATABASE rav_ape_db1 OWNER TO ravape_user;

-- Conectar a la base de datos para asignar permisos
\c rav_ape_db1

\du

-- Otorgar permisos al usuario
GRANT CONNECT ON DATABASE rav_ape_db1 TO ravape_user;
GRANT USAGE ON SCHEMA public TO ravape_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO ravape_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO ravape_user;

-- Aplicar automáticamente permisos para futuras tablas y secuencias
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO ravape_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO ravape_user;


--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2024-12-24 11:04:10
-- TOC entry 3432 (class 1262 OID 16384)
-- Name: rav_ape_db1; Type: DATABASE; Schema: -; Owner: postgres
--

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
-- TOC entry 218 (class 1259 OID 16402)
-- Name: Colocados; Type: TABLE; Schema: public; Owner: ravape_user
--

CREATE TABLE public."Colocados" (
    id bigint NOT NULL,
    tipo_identificacion character varying(10) NOT NULL,
    identificacion character varying(20) NOT NULL,
    tpb_id bigint,
    id_persona bigint,
    estado bigint,
    descripcion character varying(255),
    tpb_id2 bigint,
    tipo_poblacion_sofia character varying(100),
    departamento character varying(100),
    oft_id character varying(20),
    env_id character varying(20),
    tipo_identificacion3 character varying(10),
    identificacion4 character varying(20),
    nombres character varying(100),
    primer_apellido character varying(100),
    segundo_apellido character varying(100),
    genero character varying(20),
    pai_id bigint,
    dpt_id character varying(10),
    departamento5 character varying(100),
    mpo_id character varying(20),
    municipio character varying(100),
    solicitud character varying(255),
    oc_uid character varying(20),
    ocupacion character varying(100),
    denominacion character varying(100),
    emp_id character varying(20),
    empresa character varying(100),
    fecha_colocacion character varying(30),
    es_egresado character varying(10),
    fecha_nacimiento character varying(30),
    mpo_id_nacimiento character varying(20),
    es_pdet character varying(10),
    es_pnis character varying(10),
    categoria_ruralidad character varying(50)
);


ALTER TABLE public."Colocados" OWNER TO ravape_user;

--
-- TOC entry 217 (class 1259 OID 16401)
-- Name: Colocados_id_seq; Type: SEQUENCE; Schema: public; Owner: ravape_user
--

CREATE SEQUENCE public."Colocados_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Colocados_id_seq" OWNER TO ravape_user;

--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 217
-- Name: Colocados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravape_user
--

ALTER SEQUENCE public."Colocados_id_seq" OWNED BY public."Colocados".id;


--
-- TOC entry 220 (class 1259 OID 16411)
-- Name: Inscritos; Type: TABLE; Schema: public; Owner: ravape_user
--

CREATE TABLE public."Inscritos" (
    id bigint NOT NULL,
    tipo_identificacion character varying(10) NOT NULL,
    identificacion character varying(20) NOT NULL,
    tpb_id bigint,
    id_persona bigint,
    estado bigint,
    descripcion character varying(255),
    tpb_id2 bigint,
    tipo_poblacion_sofia character varying(100),
    departamento character varying(100),
    oft_id character varying(20),
    tipo_identificacion3 character varying(10),
    identificacion4 character varying(20),
    nombres character varying(100),
    primer_apellido character varying(100),
    segundo_apellido character varying(100),
    genero character varying(20),
    pai_id bigint,
    dpt_id character varying(10),
    departamento5 character varying(100),
    mpo_id character varying(20),
    municipio character varying(100),
    fecha_inscripcion character varying(30),
    fecha_nacimiento character varying(30),
    mpo_id_nacimiento character varying(20),
    es_pdet character varying(10),
    es_pnis character varying(10),
    categoria_ruralidad character varying(50)
);


ALTER TABLE public."Inscritos" OWNER TO ravape_user;

--
-- TOC entry 219 (class 1259 OID 16410)
-- Name: Inscritos_id_seq; Type: SEQUENCE; Schema: public; Owner: ravape_user
--

CREATE SEQUENCE public."Inscritos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Inscritos_id_seq" OWNER TO ravape_user;

--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 219
-- Name: Inscritos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravape_user
--

ALTER SEQUENCE public."Inscritos_id_seq" OWNED BY public."Inscritos".id;


--
-- TOC entry 222 (class 1259 OID 16420)
-- Name: Orientaciones; Type: TABLE; Schema: public; Owner: ravape_user
--

CREATE TABLE public."Orientaciones" (
    id bigint NOT NULL,
    tipo_identificacion character varying(10) NOT NULL,
    identificacion character varying(20) NOT NULL,
    tpb_id bigint,
    id_persona bigint,
    estado bigint,
    descripcion character varying(255),
    tpb_id2 bigint,
    tipo_poblacion_sofia character varying(100),
    departamento character varying(100),
    oft_id character varying(20),
    horio_id character varying(20),
    tipo_identificacion3 character varying(10),
    identificacion4 character varying(20),
    nombres character varying(100),
    primer_apellido character varying(100),
    segundo_apellido character varying(100),
    genero character varying(20),
    pai_id bigint,
    dpt_id character varying(10),
    departamento5 character varying(100),
    mpo_id character varying(20),
    municipio character varying(100),
    fecha_primera_orientacion character varying(30),
    fecha_nacimiento character varying(30),
    mpo_id_nacimiento character varying(20),
    funcionario_ape_oriento character varying(100),
    reg_id bigint,
    regional_fun_ape_oriento character varying(100),
    mpo_id6 character varying(20),
    es_pdet character varying(10),
    es_pnis character varying(10),
    categoria_ruralidad character varying(50)
);


ALTER TABLE public."Orientaciones" OWNER TO ravape_user;

--
-- TOC entry 221 (class 1259 OID 16419)
-- Name: Orientaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: ravape_user
--

CREATE SEQUENCE public."Orientaciones_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Orientaciones_id_seq" OWNER TO ravape_user;

--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 221
-- Name: Orientaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravape_user
--

ALTER SEQUENCE public."Orientaciones_id_seq" OWNED BY public."Orientaciones".id;


--
-- TOC entry 231 (class 1259 OID 32803)
-- Name: RUV_Victimas_LITE; Type: TABLE; Schema: public; Owner: ravape_user
--

CREATE TABLE public."RUV_Victimas_LITE" (
    id bigint NOT NULL,
    tipo_identificacion character varying(10) NOT NULL,
    identificacion character varying(20) NOT NULL,
    caracterizacion jsonb NOT NULL,
    etnia character varying(60) NOT NULL
);


ALTER TABLE public."RUV_Victimas_LITE" OWNER TO ravape_user;

--
-- TOC entry 230 (class 1259 OID 32802)
-- Name: RUV_Victimas_LITE_id_seq; Type: SEQUENCE; Schema: public; Owner: ravape_user
--

CREATE SEQUENCE public."RUV_Victimas_LITE_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RUV_Victimas_LITE_id_seq" OWNER TO ravape_user;

--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 230
-- Name: RUV_Victimas_LITE_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravape_user
--

ALTER SEQUENCE public."RUV_Victimas_LITE_id_seq" OWNED BY public."RUV_Victimas_LITE".id;


--
-- TOC entry 229 (class 1259 OID 32778)
-- Name: Regionales; Type: TABLE; Schema: public; Owner: ravape_user
--

CREATE TABLE public."Regionales" (
    id bigint NOT NULL,
    regional_nombre character varying(100) NOT NULL
);


ALTER TABLE public."Regionales" OWNER TO ravape_user;

--
-- TOC entry 228 (class 1259 OID 32777)
-- Name: Regionales_id_seq; Type: SEQUENCE; Schema: public; Owner: ravape_user
--

CREATE SEQUENCE public."Regionales_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Regionales_id_seq" OWNER TO ravape_user;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 228
-- Name: Regionales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravape_user
--

ALTER SEQUENCE public."Regionales_id_seq" OWNED BY public."Regionales".id;


--
-- TOC entry 227 (class 1259 OID 24596)
-- Name: csv_registros; Type: TABLE; Schema: public; Owner: ravape_user
--

CREATE TABLE public.csv_registros (
    id integer NOT NULL,
    tipo_archivo character varying(50) NOT NULL,
    ruta_archivo text NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.csv_registros OWNER TO ravape_user;

--
-- TOC entry 226 (class 1259 OID 24595)
-- Name: csv_registros_id_seq; Type: SEQUENCE; Schema: public; Owner: ravape_user
--

CREATE SEQUENCE public.csv_registros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.csv_registros_id_seq OWNER TO ravape_user;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 226
-- Name: csv_registros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravape_user
--

ALTER SEQUENCE public.csv_registros_id_seq OWNED BY public.csv_registros.id;


--
-- TOC entry 233 (class 1259 OID 40961)
-- Name: meta; Type: TABLE; Schema: public; Owner: ravape_user
--

CREATE TABLE public.meta (
    id bigint NOT NULL,
    nombre_meta character varying(100) NOT NULL,
    cifra_meta bigint NOT NULL,
    regional_id bigint NOT NULL,
    fecha_inicio timestamp with time zone NOT NULL,
    fecha_corte timestamp with time zone NOT NULL
);


ALTER TABLE public.meta OWNER TO ravape_user;

--
-- TOC entry 232 (class 1259 OID 40960)
-- Name: meta_id_seq; Type: SEQUENCE; Schema: public; Owner: ravape_user
--

CREATE SEQUENCE public.meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.meta_id_seq OWNER TO ravape_user;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 232
-- Name: meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravape_user
--

ALTER SEQUENCE public.meta_id_seq OWNED BY public.meta.id;


--
-- TOC entry 224 (class 1259 OID 16429)
-- Name: municipios; Type: TABLE; Schema: public; Owner: ravape_user
--

CREATE TABLE public.municipios (
    id bigint NOT NULL,
    municipio_nombre character varying(100) NOT NULL
);


ALTER TABLE public.municipios OWNER TO ravape_user;

--
-- TOC entry 223 (class 1259 OID 16428)
-- Name: municipios_id_seq; Type: SEQUENCE; Schema: public; Owner: ravape_user
--

CREATE SEQUENCE public.municipios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.municipios_id_seq OWNER TO ravape_user;

--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 223
-- Name: municipios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravape_user
--

ALTER SEQUENCE public.municipios_id_seq OWNED BY public.municipios.id;


--
-- TOC entry 3240 (class 2604 OID 16405)
-- Name: Colocados id; Type: DEFAULT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public."Colocados" ALTER COLUMN id SET DEFAULT nextval('public."Colocados_id_seq"'::regclass);


--
-- TOC entry 3241 (class 2604 OID 16414)
-- Name: Inscritos id; Type: DEFAULT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public."Inscritos" ALTER COLUMN id SET DEFAULT nextval('public."Inscritos_id_seq"'::regclass);


--
-- TOC entry 3242 (class 2604 OID 16423)
-- Name: Orientaciones id; Type: DEFAULT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public."Orientaciones" ALTER COLUMN id SET DEFAULT nextval('public."Orientaciones_id_seq"'::regclass);


--
-- TOC entry 3247 (class 2604 OID 32806)
-- Name: RUV_Victimas_LITE id; Type: DEFAULT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public."RUV_Victimas_LITE" ALTER COLUMN id SET DEFAULT nextval('public."RUV_Victimas_LITE_id_seq"'::regclass);


--
-- TOC entry 3246 (class 2604 OID 32781)
-- Name: Regionales id; Type: DEFAULT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public."Regionales" ALTER COLUMN id SET DEFAULT nextval('public."Regionales_id_seq"'::regclass);


--
-- TOC entry 3244 (class 2604 OID 24599)
-- Name: csv_registros id; Type: DEFAULT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public.csv_registros ALTER COLUMN id SET DEFAULT nextval('public.csv_registros_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 40964)
-- Name: meta id; Type: DEFAULT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public.meta ALTER COLUMN id SET DEFAULT nextval('public.meta_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 16432)
-- Name: municipios id; Type: DEFAULT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public.municipios ALTER COLUMN id SET DEFAULT nextval('public.municipios_id_seq'::regclass);


--
-- TOC entry 3412 (class 0 OID 16402)
-- Dependencies: 218
-- Data for Name: Colocados; Type: TABLE DATA; Schema: public; Owner: ravape_user
--

INSERT INTO public."Colocados" VALUES (1, 'CC', '10001', 1, 20001, 0, 'Estado_1', 1, 'Población Desplazada', '367 Departamento_1', '1', '301', 'CC', '10001', 'Nombre_1', 'Apellido1_1', 'Apellido2_1', 'Masculino', 3, '367', 'Departamento_1', '-', 'Municipio_1', '91', '2829', 'Ocupacion_1', 'Denominacion_1', '156', 'Empresa_1', '2024-01-01T00:00:00-05:00', '1', '1994-11-19T00:00:00-05:00', '7345', NULL, NULL, '');
INSERT INTO public."Colocados" VALUES (2, 'CC', '10002', 5, 20002, 0, 'Estado_2', 5, 'Víctima de Conflicto Armado', '806 Departamento_2', '2', '302', 'CC', '10002', 'Nombre_2', 'Apellido1_2', 'Apellido2_2', 'Masculino', 7, '806', 'Departamento_2', '-', 'Municipio_2', '6', '2069', 'Ocupacion_2', 'Denominacion_2', '116', 'Empresa_2', '2024-03-09T00:00:00-05:00', '1', '1991-02-13T00:00:00-05:00', '8878', NULL, NULL, '');
INSERT INTO public."Colocados" VALUES (3, 'CC', '10003', 1, 20003, 0, 'Estado_3', 1, 'Población Desplazada', '179 Departamento_3', '3', '303', 'CC', '10003', 'Nombre_3', 'Apellido1_3', 'Apellido2_3', 'Masculino', 6, '179', 'Departamento_3', '-', 'Municipio_3', '41', '2699', 'Ocupacion_3', 'Denominacion_3', '360', 'Empresa_3', '2024-05-16T00:00:00-05:00', '1', '1988-08-09T00:00:00-05:00', '5745', NULL, NULL, '');
INSERT INTO public."Colocados" VALUES (4, 'CC', '10004', 5, 20004, 0, 'Estado_4', 5, 'Víctima de Conflicto Armado', '308 Departamento_4', '4', '304', 'CC', '10004', 'Nombre_4', 'Apellido1_4', 'Apellido2_4', 'Masculino', 4, '308', 'Departamento_4', '-', 'Municipio_4', '47', '1585', 'Ocupacion_4', 'Denominacion_4', '470', 'Empresa_4', '2024-07-23T00:00:00-05:00', '1', '2001-09-29T00:00:00-05:00', '4967', NULL, NULL, '');
INSERT INTO public."Colocados" VALUES (5, 'CC', '10005', 5, 20005, 1, 'Estado_5', 5, 'Víctima de Conflicto Armado', '668 Departamento_5', '5', '305', 'CC', '10005', 'Nombre_5', 'Apellido1_5', 'Apellido2_5', 'Masculino', 7, '668', 'Departamento_5', '-', 'Municipio_5', '98', '9684', 'Ocupacion_5', 'Denominacion_5', '331', 'Empresa_5', '2024-09-30T00:00:00-05:00', '0', '1989-04-01T00:00:00-05:00', '3193', NULL, NULL, '');


--
-- TOC entry 3414 (class 0 OID 16411)
-- Dependencies: 220
-- Data for Name: Inscritos; Type: TABLE DATA; Schema: public; Owner: ravape_user
--

INSERT INTO public."Inscritos" VALUES (1, 'CC', '10004', 5, 20004, 0, 'Estado_4', 5, 'Víctima de Conflicto Armado', '825 Departamento_4', '4', 'CC', '10004', 'Nombre_4', 'Apellido1_4', 'Apellido2_4', 'Masculino', 2, '825', 'Departamento_4', '-', 'Municipio_4', '2024-07-23T00:00:00-05:00', '1981-12-18T00:00:00-05:00', '5727', NULL, NULL, '');
INSERT INTO public."Inscritos" VALUES (2, 'CC', '10003', 1, 20003, 0, 'Estado_3', 1, 'Población Desplazada', '593 Departamento_3', '3', 'CC', '10003', 'Nombre_3', 'Apellido1_3', 'Apellido2_3', 'Masculino', 3, '593', 'Departamento_3', '-', 'Municipio_3', '2024-05-16T00:00:00-05:00', '1983-02-04T00:00:00-05:00', '1056', NULL, NULL, '');
INSERT INTO public."Inscritos" VALUES (3, 'CC', '10001', 1, 20001, 0, 'Estado_1', 1, 'Población Desplazada', '298 Departamento_1', '1', 'CC', '10001', 'Nombre_1', 'Apellido1_1', 'Apellido2_1', 'Masculino', 6, '298', 'Departamento_1', '-', 'Municipio_1', '2024-01-01T00:00:00-05:00', '1982-07-10T00:00:00-05:00', '6439', NULL, NULL, '');
INSERT INTO public."Inscritos" VALUES (4, 'CC', '10002', 5, 20002, 0, 'Estado_2', 5, 'Víctima de Conflicto Armado', '316 Departamento_2', '2', 'CC', '10002', 'Nombre_2', 'Apellido1_2', 'Apellido2_2', 'Masculino', 1, '316', 'Departamento_2', '-', 'Municipio_2', '2024-03-09T00:00:00-05:00', '1991-03-14T00:00:00-05:00', '9287', NULL, NULL, '');
INSERT INTO public."Inscritos" VALUES (5, 'CC', '10005', 5, 20005, 1, 'Estado_5', 5, 'Víctima de Conflicto Armado', '470 Departamento_5', '5', 'CC', '10005', 'Nombre_5', 'Apellido1_5', 'Apellido2_5', 'Masculino', 9, '470', 'Departamento_5', '-', 'Municipio_5', '2024-09-30T00:00:00-05:00', '1993-05-11T00:00:00-05:00', '8259', NULL, NULL, '');


--
-- TOC entry 3416 (class 0 OID 16420)
-- Dependencies: 222
-- Data for Name: Orientaciones; Type: TABLE DATA; Schema: public; Owner: ravape_user
--

INSERT INTO public."Orientaciones" VALUES (1, 'CC', '10001', 1, 20001, 0, 'Estado_1', 1, 'Población Desplazada', '819 Departamento_1', '1', '201', 'CC', '10001', 'Nombre_1', 'Apellido1_1', 'Apellido2_1', 'Femenino', 10, '819', 'Departamento_1', '-', 'Municipio_1', '2024-01-01T00:00:00-05:00', '1995-09-12T00:00:00-05:00', '2373', '  ', NULL, '', NULL, NULL, NULL, '');
INSERT INTO public."Orientaciones" VALUES (2, 'CC', '10002', 5, 20002, 0, 'Estado_2', 5, 'Víctima de Conflicto Armado', '819 Departamento_2', '2', '202', 'CC', '10002', 'Nombre_2', 'Apellido1_2', 'Apellido2_2', 'Femenino', 10, '819', 'Departamento_2', '-', 'Municipio_2', '2024-03-09T00:00:00-05:00', '2000-12-29T00:00:00-05:00', '6424', '  ', NULL, '', NULL, NULL, NULL, '');
INSERT INTO public."Orientaciones" VALUES (3, 'CC', '10003', 1, 20003, 0, 'Estado_3', 1, 'Población Desplazada', '708 Departamento_3', '3', '203', 'CC', '10003', 'Nombre_3', 'Apellido1_3', 'Apellido2_3', 'Femenino', 6, '708', 'Departamento_3', '-', 'Municipio_3', '2024-05-16T00:00:00-05:00', '1992-05-21T00:00:00-05:00', '1914', '  ', NULL, '', NULL, NULL, NULL, '');
INSERT INTO public."Orientaciones" VALUES (4, 'CC', '10004', 5, 20004, 0, 'Estado_4', 5, 'Víctima de Conflicto Armado', '385 Departamento_4', '4', '204', 'CC', '10004', 'Nombre_4', 'Apellido1_4', 'Apellido2_4', 'Femenino', 3, '385', 'Departamento_4', '-', 'Municipio_4', '2024-07-23T00:00:00-05:00', '2000-11-30T00:00:00-05:00', '4021', '  ', NULL, '', NULL, NULL, NULL, '');
INSERT INTO public."Orientaciones" VALUES (5, 'CC', '10005', 5, 20005, 1, 'Estado_5', 5, 'Víctima de Conflicto Armado', '175 Departamento_5', '5', '205', 'CC', '10005', 'Nombre_5', 'Apellido1_5', 'Apellido2_5', 'Femenino', 1, '175', 'Departamento_5', '-', 'Municipio_5', '2024-09-30T00:00:00-05:00', '2003-01-12T00:00:00-05:00', '1653', '  ', NULL, '', NULL, NULL, NULL, '');


--
-- TOC entry 3424 (class 0 OID 32803)
-- Dependencies: 231
-- Data for Name: RUV_Victimas_LITE; Type: TABLE DATA; Schema: public; Owner: ravape_user
--

INSERT INTO public."RUV_Victimas_LITE" VALUES (1, 'TI', '49700565', '["AMENAZA", "PERDIDA DE BIENES MUEBLES O INMUEBLES"]', 'PALENQUERO');
INSERT INTO public."RUV_Victimas_LITE" VALUES (2, 'CC', '10005', '["ABANDONO O DESPOJO FORZADO DE TIERRAS"]', 'GITANO(A) ROM');
INSERT INTO public."RUV_Victimas_LITE" VALUES (3, 'CC', '10004', '["TORTURA", "DELITOS CONTRA LA LIBERTAD Y LA INTEGRIDAD SEXUAL EN DESARROLLO DEL CONFLICTO ARMADO"]', 'PALENQUERO');
INSERT INTO public."RUV_Victimas_LITE" VALUES (4, 'RC', '63862453', '["DESPLAZAMIENTO FORZADO", "AMENAZA", "SIN INFORMACION"]', 'INDIGENA');
INSERT INTO public."RUV_Victimas_LITE" VALUES (5, 'TI', '11528847', '["SIN INFORMACION", "TORTURA", "PERDIDA DE BIENES MUEBLES O INMUEBLES"]', 'PALENQUERO');
INSERT INTO public."RUV_Victimas_LITE" VALUES (6, 'CC', '10001', '["DESPLAZAMIENTO FORZADO"]', 'NEGRO(A) O AFROCOLOMBIANO(A)');
INSERT INTO public."RUV_Victimas_LITE" VALUES (7, 'TI', '12345678', '["HOMICIDIO", "AMENAZA"]', 'RAIZAL DEL ARCHIPIELAGO DE SAN ANDRES Y PROVIDENCIA');
INSERT INTO public."RUV_Victimas_LITE" VALUES (8, 'CC', '10002', '["ABANDONO O DESPOJO FORZADO DE TIERRAS", "AMENAZA"]', 'NINGUNA');
INSERT INTO public."RUV_Victimas_LITE" VALUES (9, 'CC', '10003', '["CONFINAMIENTO", "SECUESTRO"]', 'NEGRO(A) O AFROCOLOMBIANO(A)');
INSERT INTO public."RUV_Victimas_LITE" VALUES (10, 'TI', '34567890', '["TORTURA", "MINAS ANTIPERSONAL, MUNICIÓN SIN EXPLOTAR Y ARTEFACTO EXPLOSIVO IMPROVISADO"]', 'INDIGENA (ACREDITADO RA');


--
-- TOC entry 3422 (class 0 OID 32778)
-- Dependencies: 229
-- Data for Name: Regionales; Type: TABLE DATA; Schema: public; Owner: ravape_user
--


--
-- TOC entry 3418 (class 0 OID 16429)
-- Dependencies: 224
-- Data for Name: municipios; Type: TABLE DATA; Schema: public; Owner: ravape_user
--

INSERT INTO public.municipios VALUES (1, 'Bogotá');
INSERT INTO public.municipios VALUES (2, 'Medellín');
INSERT INTO public.municipios VALUES (3, 'Cali');
INSERT INTO public.municipios VALUES (4, 'Barranquilla');
INSERT INTO public.municipios VALUES (5, 'Cartagena');
INSERT INTO public.municipios VALUES (6, 'Bucaramanga');
INSERT INTO public.municipios VALUES (7, 'Cúcuta');
INSERT INTO public.municipios VALUES (8, 'Manizales');
INSERT INTO public.municipios VALUES (9, 'Pereira');
INSERT INTO public.municipios VALUES (10, 'Armenia');
INSERT INTO public.municipios VALUES (11, 'Villavicencio');
INSERT INTO public.municipios VALUES (12, 'Ibagué');
INSERT INTO public.municipios VALUES (13, 'Santa Marta');
INSERT INTO public.municipios VALUES (14, 'Sincelejo');
INSERT INTO public.municipios VALUES (15, 'Montería');


-- 3. Metas
INSERT INTO public.meta ("nombre_meta", "cifra_meta", "regional_id", "fecha_inicio", "fecha_corte") VALUES ('Meta Iscritos', 1000, 1, '2024-01-01', '2024-12-31');
INSERT INTO public.meta ("nombre_meta", "cifra_meta", "regional_id", "fecha_inicio", "fecha_corte") VALUES ('Meta Colocados', 1000, 1, '2024-01-01', '2024-12-31');
INSERT INTO public.meta ("nombre_meta", "cifra_meta", "regional_id", "fecha_inicio", "fecha_corte") VALUES ('Meta Orientados', 1000, 1, '2024-01-01', '2024-12-31');



-- Inserción de datos mock
-- 1. Regional
INSERT INTO public."Regionales" (Regional_NOMBRE) VALUES ('Regional Centro');
INSERT INTO public."Regionales" (Regional_NOMBRE) VALUES ('Regional Norte');
INSERT INTO public."Regionales" (Regional_NOMBRE) VALUES ('Regional Sur');
INSERT INTO public."Regionales" (Regional_NOMBRE) VALUES ('Regional Oriente');
INSERT INTO public."Regionales" (Regional_NOMBRE) VALUES ('Regional Occidente');



--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 217
-- Name: Colocados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravape_user
--

SELECT pg_catalog.setval('public."Colocados_id_seq"', 5, true);


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 219
-- Name: Inscritos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravape_user
--

SELECT pg_catalog.setval('public."Inscritos_id_seq"', 5, true);


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 221
-- Name: Orientaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravape_user
--

SELECT pg_catalog.setval('public."Orientaciones_id_seq"', 5, true);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 230
-- Name: RUV_Victimas_LITE_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravape_user
--

SELECT pg_catalog.setval('public."RUV_Victimas_LITE_id_seq"', 1, false);


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 228
-- Name: Regionales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravape_user
--

SELECT pg_catalog.setval('public."Regionales_id_seq"', 1, false);


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 226
-- Name: csv_registros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravape_user
--

SELECT pg_catalog.setval('public.csv_registros_id_seq', 5, true);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 232
-- Name: meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravape_user
--

SELECT pg_catalog.setval('public.meta_id_seq', 1, false);


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 223
-- Name: municipios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravape_user
--

SELECT pg_catalog.setval('public.municipios_id_seq', 15, true);


--
-- TOC entry 3250 (class 2606 OID 16409)
-- Name: Colocados Colocados_pkey; Type: CONSTRAINT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public."Colocados"
    ADD CONSTRAINT "Colocados_pkey" PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 16418)
-- Name: Inscritos Inscritos_pkey; Type: CONSTRAINT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public."Inscritos"
    ADD CONSTRAINT "Inscritos_pkey" PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 16427)
-- Name: Orientaciones Orientaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public."Orientaciones"
    ADD CONSTRAINT "Orientaciones_pkey" PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 32810)
-- Name: RUV_Victimas_LITE RUV_Victimas_LITE_pkey; Type: CONSTRAINT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public."RUV_Victimas_LITE"
    ADD CONSTRAINT "RUV_Victimas_LITE_pkey" PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 32783)
-- Name: Regionales Regionales_pkey; Type: CONSTRAINT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public."Regionales"
    ADD CONSTRAINT "Regionales_pkey" PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 24604)
-- Name: csv_registros csv_registros_pkey; Type: CONSTRAINT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public.csv_registros
    ADD CONSTRAINT csv_registros_pkey PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 40966)
-- Name: meta meta_pkey; Type: CONSTRAINT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public.meta
    ADD CONSTRAINT meta_pkey  PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 16434)
-- Name: municipios municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 40967)
-- Name: meta fk_meta_regional; Type: FK CONSTRAINT; Schema: public; Owner: ravape_user
--

ALTER TABLE ONLY public.meta
    ADD CONSTRAINT fk_meta_regional FOREIGN KEY (regional_id) REFERENCES public."Regionales"(id);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 3432
-- Name: DATABASE rav_ape_db1; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE rav_ape_db1 TO ravape_user;


-- Completed on 2024-12-24 11:04:10

--
-- PostgreSQL database dump complete
--

