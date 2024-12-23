-- Verificar si el usuario ya existe antes de crearlo
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'ruv_user') THEN
        CREATE USER ruv_user WITH PASSWORD 'ruv_password';
    END IF;
END
$$;

-- Crear la base de datos si no existe
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'ruv_db') THEN
        CREATE DATABASE ruv_db;
    END IF;
END
$$;

-- Asignar el propietario de la base de datos al usuario
ALTER DATABASE ruv_db OWNER TO ruv_user;

-- Conectar a la base de datos para asignar permisos
\c ruv_db

-- Otorgar permisos al usuario
GRANT CONNECT ON DATABASE ruv_db TO ruv_user;
GRANT USAGE ON SCHEMA public TO ruv_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO ruv_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO ruv_user;

-- Aplicar automáticamente permisos para futuras tablas y secuencias
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO ruv_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO ruv_user;




-- Inserción de datos mock
-- 1. Regional
INSERT INTO Regionales (Regional_NOMBRE) VALUES 
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
INSERT INTO "RUV_Victimas_LITE" (ID, tipo_identificacion, Identificacion, Caracterizacion, Etnia) VALUES
(1, 'TI', '49700565', '["AMENAZA", "PERDIDA DE BIENES MUEBLES O INMUEBLES"]', 'PALENQUERO'),
(2, 'CC', '10005', '["ABANDONO O DESPOJO FORZADO DE TIERRAS"]', 'GITANO(A) ROM'),
(3, 'CC', '10004', '["TORTURA", "DELITOS CONTRA LA LIBERTAD Y LA INTEGRIDAD SEXUAL EN DESARROLLO DEL CONFLICTO ARMADO"]', 'PALENQUERO'),
(4, 'RC', '63862453', '["DESPLAZAMIENTO FORZADO", "AMENAZA", "SIN INFORMACION"]', 'INDIGENA'),
(5, 'TI', '11528847', '["SIN INFORMACION", "TORTURA", "PERDIDA DE BIENES MUEBLES O INMUEBLES"]', 'PALENQUERO'),
(6, 'CC', '10001', '["DESPLAZAMIENTO FORZADO"]', 'NEGRO(A) O AFROCOLOMBIANO(A)'),
(7, 'TI', '12345678', '["HOMICIDIO", "AMENAZA"]', 'RAIZAL DEL ARCHIPIELAGO DE SAN ANDRES Y PROVIDENCIA'),
(8, 'CC', '10002', '["ABANDONO O DESPOJO FORZADO DE TIERRAS", "AMENAZA"]', 'NINGUNA'),
(9, 'CC', '10003', '["CONFINAMIENTO", "SECUESTRO"]', 'NEGRO(A) O AFROCOLOMBIANO(A)'),
(10, 'TI', '34567890', '["TORTURA", "MINAS ANTIPERSONAL, MUNICIÓN SIN EXPLOTAR Y ARTEFACTO EXPLOSIVO IMPROVISADO"]', 'INDIGENA (ACREDITADO RA');

-- Script completo
