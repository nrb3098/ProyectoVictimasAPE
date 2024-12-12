-- Creación de tablas principales
CREATE TABLE Regional (
    ID INT primary KEY AUTO_INCREMENT,
    REG_NOMBRE VARCHAR(100) not NULL
);

CREATE TABLE Municipios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    MPO_NOMBRE VARCHAR(100) NOT NULL
);

CREATE TABLE Metas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_meta VARCHAR(100) NOT NULL,
    Cifra_meta INT NOT NULL,
    Regional_ID INT NOT NULL,
    Fecha_inicio DATE NOT NULL,
    Fecha_corte DATE NOT NULL,
    FOREIGN KEY (Regional_ID) REFERENCES Regional(ID)
);

CREATE TABLE Orientaciones (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Numero_documento VARCHAR(20) NOT NULL,
    Tipo_documento VARCHAR(20) NOT NULL,
    Fecha_orientacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_orientacion VARCHAR(50) NOT NULL,
    Funcionario_ID INT NOT NULL,
    Regional_ID INT NOT NULL,
    Municipio_ID INT NOT NULL,
    Centro_ID INT NOT NULL,
    Descripcion TEXT,
    FOREIGN KEY (Funcionario_ID) REFERENCES Usuarios(ID),
    FOREIGN KEY (Regional_ID) REFERENCES Regional(ID),
    FOREIGN KEY (Municipio_ID) REFERENCES Municipios(ID),
    FOREIGN KEY (Centro_ID) REFERENCES Centro_SPE(ID)
);

CREATE TABLE Inscritos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TIPO_IDENTIFICACION VARCHAR(10) NOT NULL,
    IDENTIFICACION VARCHAR(20) NOT NULL,
    TPB_ID INT,
    ID_PERSONA INT,
    ESTADO INT,
    DESCRIPCION VARCHAR(255),
    TPB_ID2 INT,
    TIPO_POBLACION_SOFIA VARCHAR(100),
    DEPARTAMENTO VARCHAR(100),
    OFT_ID VARCHAR(20),
    TIPO_IDENTIFICACION3 VARCHAR(10),
    IDENTIFICACION4 VARCHAR(20),
    NOMBRES VARCHAR(100),
    PRIMER_APELLIDO VARCHAR(100),
    SEGUNDO_APELLIDO VARCHAR(100),
    GENERO VARCHAR(20),
    PAI_ID INT,
    DPT_ID VARCHAR(10),
    DEPARTAMENTO5 VARCHAR(100),
    MPO_ID VARCHAR(20),
    MUNICIPIO VARCHAR(100),
    FECHA_INSCRIPCION VARCHAR(20),
    FECHA_NACIMIENTO VARCHAR(20),
    MPO_ID_NACIMIENTO VARCHAR(20),
    ES_PDET VARCHAR(10),
    ES_PNIS VARCHAR(10),
    CATEGORIA_RURALIDAD VARCHAR(50)
);

CREATE TABLE Colocados (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TIPO_IDENTIFICACION VARCHAR(10) NOT NULL,
    IDENTIFICACION VARCHAR(20) NOT NULL,
    TPB_ID INT,
    ID_PERSONA INT,
    ESTADO INT,
    DESCRIPCION VARCHAR(255),
    TPB_ID2 INT,
    TIPO_POBLACION_SOFIA VARCHAR(100),
    DEPARTAMENTO VARCHAR(100),
    OFT_ID VARCHAR(20),
    ENV_ID VARCHAR(20),
    TIPO_IDENTIFICACION3 VARCHAR(10),
    IDENTIFICACION4 VARCHAR(20),
    NOMBRES VARCHAR(100),
    PRIMER_APELLIDO VARCHAR(100),
    SEGUNDO_APELLIDO VARCHAR(100),
    GENERO VARCHAR(20),
    PAI_ID INT,
    DPT_ID VARCHAR(10),
    DEPARTAMENTO5 VARCHAR(100),
    MPO_ID VARCHAR(20),
    MUNICIPIO VARCHAR(100),
    SOLICITUD VARCHAR(255),
    OCU_ID VARCHAR(20),
    OCUPACION VARCHAR(100),
    DENOMINACION VARCHAR(100),
    EMP_ID VARCHAR(20),
    EMPRESA VARCHAR(100),
    FECHA_COLOCACION VARCHAR(20),
    ES_EGRESADO VARCHAR(10),
    FECHA_NACIMIENTO VARCHAR(20),
    MPO_ID_NACIMIENTO VARCHAR(20),
    ES_PDET VARCHAR(10),
    ES_PNIS VARCHAR(10),
    CATEGORIA_RURALIDAD VARCHAR(50)
);

CREATE TABLE RUV_Victimas_LITE (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TIPO_IDENTIFICACION VARCHAR(10) NOT NULL,
    IDENTIFICACION VARCHAR(20) NOT NULL,
    CARACTERIZACION JSON NOT NULL,
    FORMACION JSON NOT NULL
);

CREATE TABLE csv_registros (
    id SERIAL PRIMARY KEY,
    tipo_archivo VARCHAR(50) NOT NULL, -- Puede ser "orientaciones", "inscritos", "colocados"
    ruta_archivo TEXT NOT NULL,        -- Ruta relativa donde se almacena el archivo
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- Inserción de datos mock
-- 1. Regional
INSERT INTO Regionals (Regional_NOMBRE) VALUES 
('Regional Centro'),
('Regional Norte'),
('Regional Sur'),
('Regional Oriente'),
('Regional Occidente');

-- 2. Municipios
INSERT INTO Municipios (Municipio_NOMBRE) VALUES 
('Bogotá'),
('Medellín'),
('Cali'),
('Barranquilla'),
('Cartagena'),
('Bucaramanga'),
('Cúcuta'),
('Manizales'),
('Pereira'),
('Armenia'),
('Villavicencio'),
('Ibagué'),
('Santa Marta'),
('Sincelejo'),
('Montería');

-- 3. Metas
INSERT INTO meta ("nombre_meta", "cifra_meta", "regional_id", "fecha_inicio", "fecha_corte") VALUES 
('Meta Iscritos', 1000, 1, '2024-01-01', '2024-12-31');

INSERT INTO meta ("nombre_meta", "cifra_meta", "regional_id", "fecha_inicio", "fecha_corte") VALUES 
('Meta Colocados', 1000, 1, '2024-01-01', '2024-12-31');

INSERT INTO meta ("nombre_meta", "cifra_meta", "regional_id", "fecha_inicio", "fecha_corte") VALUES 
('Meta Orientados', 1000, 1, '2024-01-01', '2024-12-31');




-- 7. RUV_Lite
INSERT INTO RUV_Victimas_LITE (TIPO_IDENTIFICACION, IDENTIFICACION, CARACTERIZACION, FORMACION) VALUES
(
    'CC', 
    '123456789', 
    '{"nivel_educativo": "Bachillerato", "estado": "Completo", "detalles": {"año_graduación": 2010, "institución": "Colegio Nacional"}}',
    '{"programas": ["Técnico en Sistemas", "Curso de Emprendimiento"], "estado_actual": "En Progreso"}'
),
(
    'TI', 
    '987654321', 
    '{"nivel_educativo": "Primaria", "estado": "Incompleto", "detalles": {"último_grado_cursado": 4, "año_retiro": 2008}}',
    '{"programas": ["Curso de Costura"], "estado_actual": "Finalizado"}'
);

-- Script completo
