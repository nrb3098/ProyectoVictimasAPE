-- Creación de tablas principales
CREATE TABLE Regional (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    REG_NOMBRE VARCHAR(100) NOT NULL
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


-- Inserción de datos mock
-- 1. Regional
INSERT INTO Regional (REG_NOMBRE) VALUES 
('Regional Centro'),
('Regional Norte'),
('Regional Sur'),
('Regional Oriente'),
('Regional Occidente');

-- 2. Municipios
INSERT INTO Municipios (MPO_NOMBRE) VALUES 
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
INSERT INTO Metas (Nombre_meta, Cifra_meta, Regional_ID, Fecha_inicio, Fecha_corte) VALUES
('Meta 1', 1000, 1, '2024-01-01', '2024-12-31'),
('Meta 2', 2000, 2, '2024-01-01', '2024-12-31'),
('Meta 3', 1500, 3, '2024-01-01', '2024-12-31'),
('Meta 4', 1800, 4, '2024-01-01', '2024-12-31'),
('Meta 5', 1200, 5, '2024-01-01', '2024-12-31');

-- 4. Orientaciones
INSERT INTO Orientaciones (Numero_documento, Tipo_documento, Tipo_orientacion, Funcionario_ID, Regional_ID, Municipio_ID, Centro_ID, Descripcion) VALUES
('123456789', 'CC', 'Taller', 3, 1, 1, 1, 'Orientación inicial'),
('987654321', 'CC', 'Capacitación', 4, 2, 2, 2, 'Capacitación avanzada'),
('456789123', 'CC', 'Asesoría', 5, 3, 3, 3, 'Asesoría técnica'),
('654321987', 'CC', 'Taller', 6, 4, 4, 4, 'Orientación grupal'),
('321654987', 'CC', 'Asesoría', 7, 5, 5, 5, 'Sesión personalizada'),
('789123456', 'TI', 'Capacitación', 8, 1, 6, 6, 'Capacitación laboral'),
('147258369', 'CC', 'Taller', 9, 2, 7, 7, 'Taller educativo'),
('258369147', 'TI', 'Asesoría', 10, 3, 8, 8, 'Consulta individual'),
('369147258', 'CC', 'Capacitación', 11, 4, 9, 9, 'Taller grupal'),
('741852963', 'TI', 'Taller', 12, 5, 10, 10, 'Asesoramiento general');

-- 5. Inscritos
INSERT INTO Inscritos (
    TIPO_IDENTIFICACION, IDENTIFICACION, TPB_ID, ID_PERSONA, ESTADO, DESCRIPCION, TPB_ID2, TIPO_POBLACION_SOFIA, 
    DEPARTAMENTO, OFT_ID, TIPO_IDENTIFICACION3, IDENTIFICACION4, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, 
    GENERO, PAI_ID, DPT_ID, DEPARTAMENTO5, MPO_ID, MUNICIPIO, FECHA_INSCRIPCION, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO, 
    ES_PDET, ES_PNIS, CATEGORIA_RURALIDAD
) VALUES
(
    'CC', '1010', 5, 30001234, 1, 'Inscripción completada', 5, 'DESPLAZADOS POR LA VIOLENCIA',
    '57020 Cesar', '15798245', 'CC', '1010', 'MARIO ALBERTO', 'PEREZ', 'GARCIA',
    'HOMBRE', 57, '57020', 'Cesar', '57020550', 'Pelaya', '10:00,0', '1985-08-15', 
    '57020550', 'SI', 'NO', 'Urbano'
);

-- 6. Colocados
INSERT INTO Colocados (
    TIPO_IDENTIFICACION, IDENTIFICACION, TPB_ID, ID_PERSONA, ESTADO, DESCRIPCION, TPB_ID2, TIPO_POBLACION_SOFIA, 
    DEPARTAMENTO, OFT_ID, ENV_ID, TIPO_IDENTIFICACION3, IDENTIFICACION4, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, 
    GENERO, PAI_ID, DPT_ID, DEPARTAMENTO5, MPO_ID, MUNICIPIO, SOLICITUD, OCU_ID, OCUPACION, DENOMINACION, 
    EMP_ID, EMPRESA, FECHA_COLOCACION, ES_EGRESADO, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO, ES_PDET, ES_PNIS, 
    CATEGORIA_RURALIDAD
) VALUES
(
    'CC', '2020', 8, 40005678, 1, 'Colocación exitosa', 8, 'DESPLAZADOS POR LA VIOLENCIA',
    '57020 Cesar', '98765432', '98766555', 'CC', '2020', 'ANA MARIA', 'GOMEZ', 'RODRIGUEZ',
    'MUJER', 57, '57020', 'Cesar', '57020550', 'Valledupar', 'Solicitud Aprobada', 
    '12345', 'Ingeniera', 'Desarrollo de Software', '56789', 'TechCorp S.A.', 
    '2022-01-15', 'SI', '1995-03-22', '57020550', 'NO', 'NO', 'Urbano'
);

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
