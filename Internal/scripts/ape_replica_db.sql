-- 1. Inserción en la tabla REGIONAL
INSERT INTO REGIONAL (REG_ID, REG_NOMBRE, REG_DIRECCION, REG_TEL, REG_TEL_ALT, REG_FAX, REG_CORREO_E, REG_CORREO_E_ALT, MPO_ID) VALUES
(1, 'Regional 1', 'Dirección 1', '12345671', '76543211', '123-4561', 'regional1@email.com', 'alt1@email.com', 101);
INSERT INTO REGIONAL (REG_ID, REG_NOMBRE, REG_DIRECCION, REG_TEL, REG_TEL_ALT, REG_FAX, REG_CORREO_E, REG_CORREO_E_ALT, MPO_ID) VALUES
(2, 'Regional 2', 'Dirección 2', '12345672', '76543212', '123-4562', 'regional2@email.com', 'alt2@email.com', 102);
INSERT INTO REGIONAL (REG_ID, REG_NOMBRE, REG_DIRECCION, REG_TEL, REG_TEL_ALT, REG_FAX, REG_CORREO_E, REG_CORREO_E_ALT, MPO_ID) VALUES
(3, 'Regional 3', 'Dirección 3', '12345673', '76543213', '123-4563', 'regional3@email.com', 'alt3@email.com', 103);
INSERT INTO REGIONAL (REG_ID, REG_NOMBRE, REG_DIRECCION, REG_TEL, REG_TEL_ALT, REG_FAX, REG_CORREO_E, REG_CORREO_E_ALT, MPO_ID) VALUES
(4, 'Regional 4', 'Dirección 4', '12345674', '76543214', '123-4564', 'regional4@email.com', 'alt4@email.com', 104);
INSERT INTO REGIONAL (REG_ID, REG_NOMBRE, REG_DIRECCION, REG_TEL, REG_TEL_ALT, REG_FAX, REG_CORREO_E, REG_CORREO_E_ALT, MPO_ID) VALUES
(5, 'Regional 5', 'Dirección 5', '12345675', '76543215', '123-4565', 'regional5@email.com', 'alt5@email.com', 105);

-- 3. Inserción en la tabla SEC_USUARIO
INSERT INTO SEC_USUARIO (USU_ID, TDI_ID, USU_NUMERO_DOC, USU_PASSWORD, USU_ACTIVO, USU_BLOQUEADO, USU_EMAIL, USU_FCH_REGISTRO, USU_TIPO) VALUES
('user1', 2, 10001, 'password1', 1, 0, 'user1@example.com', TO_DATE('2022-08-18', 'YYYY-MM-DD'), 0);
INSERT INTO SEC_USUARIO (USU_ID, TDI_ID, USU_NUMERO_DOC, USU_PASSWORD, USU_ACTIVO, USU_BLOQUEADO, USU_EMAIL, USU_FCH_REGISTRO, USU_TIPO) VALUES
('user2', 1, 10002, 'password2', 1, 0, 'user2@example.com', TO_DATE('2021-01-19', 'YYYY-MM-DD'), 0);
INSERT INTO SEC_USUARIO (USU_ID, TDI_ID, USU_NUMERO_DOC, USU_PASSWORD, USU_ACTIVO, USU_BLOQUEADO, USU_EMAIL, USU_FCH_REGISTRO, USU_TIPO) VALUES
('user3', 1, 10003, 'password3', 1, 0, 'user3@example.com', TO_DATE('2022-03-10', 'YYYY-MM-DD'), 0);
INSERT INTO SEC_USUARIO (USU_ID, TDI_ID, USU_NUMERO_DOC, USU_PASSWORD, USU_ACTIVO, USU_BLOQUEADO, USU_EMAIL, USU_FCH_REGISTRO, USU_TIPO) VALUES
('user4', 3, 10004, 'password4', 1, 0, 'user4@example.com', TO_DATE('2021-10-08', 'YYYY-MM-DD'), 0);
INSERT INTO SEC_USUARIO (USU_ID, TDI_ID, USU_NUMERO_DOC, USU_PASSWORD, USU_ACTIVO, USU_BLOQUEADO, USU_EMAIL, USU_FCH_REGISTRO, USU_TIPO) VALUES
('user5', 3, 10005, 'password5', 1, 0, 'user5@example.com', TO_DATE('2021-04-02', 'YYYY-MM-DD'), 0);

-- 4. Inserción en la tabla CENTRO_SPE
INSERT INTO CENTRO_SPE (CSPE_ID, CSPE_NOMBRE, CSPE_DIRECCION, CSPE_TEL, CSPE_TEL_ALT, CSPE_CORREO_E, CSPE_CORREO_E_ALT, CSPE_ESTADO, REG_ID, MPO_ID) VALUES
(1, 'Centro 1', 'Dirección 1', '98765431', '34567891', 'centro1@email.com', 'alt_centro1@email.com', 1, 1, 201);
INSERT INTO CENTRO_SPE (CSPE_ID, CSPE_NOMBRE, CSPE_DIRECCION, CSPE_TEL, CSPE_TEL_ALT, CSPE_CORREO_E, CSPE_CORREO_E_ALT, CSPE_ESTADO, REG_ID, MPO_ID) VALUES
(2, 'Centro 2', 'Dirección 2', '98765432', '34567892', 'centro2@email.com', 'alt_centro2@email.com', 1, 2, 202);
INSERT INTO CENTRO_SPE (CSPE_ID, CSPE_NOMBRE, CSPE_DIRECCION, CSPE_TEL, CSPE_TEL_ALT, CSPE_CORREO_E, CSPE_CORREO_E_ALT, CSPE_ESTADO, REG_ID, MPO_ID) VALUES
(3, 'Centro 3', 'Dirección 3', '98765433', '34567893', 'centro3@email.com', 'alt_centro3@email.com', 1, 3, 203);
INSERT INTO CENTRO_SPE (CSPE_ID, CSPE_NOMBRE, CSPE_DIRECCION, CSPE_TEL, CSPE_TEL_ALT, CSPE_CORREO_E, CSPE_CORREO_E_ALT, CSPE_ESTADO, REG_ID, MPO_ID) VALUES
(4, 'Centro 4', 'Dirección 4', '98765434', '34567894', 'centro4@email.com', 'alt_centro4@email.com', 1, 4, 204);
INSERT INTO CENTRO_SPE (CSPE_ID, CSPE_NOMBRE, CSPE_DIRECCION, CSPE_TEL, CSPE_TEL_ALT, CSPE_CORREO_E, CSPE_CORREO_E_ALT, CSPE_ESTADO, REG_ID, MPO_ID) VALUES
(5, 'Centro 5', 'Dirección 5', '98765435', '34567895', 'centro5@email.com', 'alt_centro5@email.com', 1, 5, 205);

-- 5. Inserción en la tabla HIS_ORIENTACION_OFT
INSERT INTO HIS_ORIENTACION_OFT (HORIO_ID, TORI_ID, HORIO_FCH, FUN_ID, PES_ID, OFT_ID, HORIO_DESCRIPCION, FECHA_REGISTRO, EVENTO_ID, PDC_ID) VALUES
(1, 1, TO_TIMESTAMP('2022-01-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, 1, 'Descripción 1', TO_DATE('2022-01-10', 'YYYY-MM-DD'), 1, 1);
INSERT INTO HIS_ORIENTACION_OFT (HORIO_ID, TORI_ID, HORIO_FCH, FUN_ID, PES_ID, OFT_ID, HORIO_DESCRIPCION, FECHA_REGISTRO, EVENTO_ID, PDC_ID) VALUES
(2, 2, TO_TIMESTAMP('2023-03-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2, 2, 'Descripción 2', TO_DATE('2023-03-15', 'YYYY-MM-DD'), 2, 2);
INSERT INTO HIS_ORIENTACION_OFT (HORIO_ID, TORI_ID, HORIO_FCH, FUN_ID, PES_ID, OFT_ID, HORIO_DESCRIPCION, FECHA_REGISTRO, EVENTO_ID, PDC_ID) VALUES
(3, 3, TO_TIMESTAMP('2023-05-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3, 3, 'Descripción 3', TO_DATE('2023-05-20', 'YYYY-MM-DD'), 3, 3);
INSERT INTO HIS_ORIENTACION_OFT (HORIO_ID, TORI_ID, HORIO_FCH, FUN_ID, PES_ID, OFT_ID, HORIO_DESCRIPCION, FECHA_REGISTRO, EVENTO_ID, PDC_ID) VALUES
(4, 4, TO_TIMESTAMP('2022-12-25 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 4, 4, 'Descripción 4', TO_DATE('2022-12-25', 'YYYY-MM-DD'), 4, 4);
INSERT INTO HIS_ORIENTACION_OFT (HORIO_ID, TORI_ID, HORIO_FCH, FUN_ID, PES_ID, OFT_ID, HORIO_DESCRIPCION, FECHA_REGISTRO, EVENTO_ID, PDC_ID) VALUES
(5, 5, TO_TIMESTAMP('2023-06-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5, 5, 'Descripción 5', TO_DATE('2023-06-30', 'YYYY-MM-DD'), 5, 5);

-- 6. Inserción en la tabla OFERTA
INSERT INTO OFERTA (OFT_ID, TDI_ID, OFT_IDENTIFICACION, OFT_NOMBRES, OFT_PRIMER_APELLIDO, OFT_SEGUNDO_APELLIDO, OFT_GENERO, OFT_FCH_NACIMIENTO, ESC_ID, OFT_LIB_MILITAR, ETR_ID, PAI_ID, DPT_ID, MPO_ID, OFT_DIRECCION, OFT_TEL, OFT_CORREO_E, OFT_SUELDO_ACEPTARIA, REG_ID, OFT_TIEMPO_BUSQUEDA, OFT_AUTORIZACION, OFT_CLAVE, OFT_PREGUNTA, OFT_RESPUESTA, OFT_SISBEN_NIVEL, OFT_SISBEN_TIPO, OFT_PERSONAS_CARGO, OFT_MED_INSCRIPCION) VALUES
(1, 3, 5001, 'Nombre1', 'Apellido1_1', 'Apellido2_1', 1, TO_DATE('1980-03-10', 'YYYY-MM-DD'), 4, 2, 3, 101, 301, 401, 'Calle 1', '123451', 'persona1@example.com', 25374, 1, 325, 1, 5348, 'Pregunta_1', 'Respuesta_1', 5, 1, 0, 1);
INSERT INTO OFERTA (OFT_ID, TDI_ID, OFT_IDENTIFICACION, OFT_NOMBRES, OFT_PRIMER_APELLIDO, OFT_SEGUNDO_APELLIDO, OFT_GENERO, OFT_FCH_NACIMIENTO, ESC_ID, OFT_LIB_MILITAR, ETR_ID, PAI_ID, DPT_ID, MPO_ID, OFT_DIRECCION, OFT_TEL, OFT_CORREO_E, OFT_SUELDO_ACEPTARIA, REG_ID, OFT_TIEMPO_BUSQUEDA, OFT_AUTORIZACION, OFT_CLAVE, OFT_PREGUNTA, OFT_RESPUESTA, OFT_SISBEN_NIVEL, OFT_SISBEN_TIPO, OFT_PERSONAS_CARGO, OFT_MED_INSCRIPCION) VALUES
(2, 2, 5002, 'Nombre2', 'Apellido1_2', 'Apellido2_2', 1, TO_DATE('1988-04-07', 'YYYY-MM-DD'), 2, 2, 1, 102, 302, 402, 'Calle 2', '123452', 'persona2@example.com', 37080, 2, 227, 3, 5320, 'Pregunta_2', 'Respuesta_2', 5, 0, 1, 0);
INSERT INTO OFERTA (OFT_ID, TDI_ID, OFT_IDENTIFICACION, OFT_NOMBRES, OFT_PRIMER_APELLIDO, OFT_SEGUNDO_APELLIDO, OFT_GENERO, OFT_FCH_NACIMIENTO, ESC_ID, OFT_LIB_MILITAR, ETR_ID, PAI_ID, DPT_ID, MPO_ID, OFT_DIRECCION, OFT_TEL, OFT_CORREO_E, OFT_SUELDO_ACEPTARIA, REG_ID, OFT_TIEMPO_BUSQUEDA, OFT_AUTORIZACION, OFT_CLAVE, OFT_PREGUNTA, OFT_RESPUESTA, OFT_SISBEN_NIVEL, OFT_SISBEN_TIPO, OFT_PERSONAS_CARGO, OFT_MED_INSCRIPCION) VALUES
(3, 1, 5003, 'Nombre3', 'Apellido1_3', 'Apellido2_3', 1, TO_DATE('1986-12-17', 'YYYY-MM-DD'), 4, 2, 5, 103, 303, 403, 'Calle 3', '123453', 'persona3@example.com', 32274, 3, 123, 2, 2739, 'Pregunta_3', 'Respuesta_3', 2, 0, 0, 1);
INSERT INTO OFERTA (OFT_ID, TDI_ID, OFT_IDENTIFICACION, OFT_NOMBRES, OFT_PRIMER_APELLIDO, OFT_SEGUNDO_APELLIDO, OFT_GENERO, OFT_FCH_NACIMIENTO, ESC_ID, OFT_LIB_MILITAR, ETR_ID, PAI_ID, DPT_ID, MPO_ID, OFT_DIRECCION, OFT_TEL, OFT_CORREO_E, OFT_SUELDO_ACEPTARIA, REG_ID, OFT_TIEMPO_BUSQUEDA, OFT_AUTORIZACION, OFT_CLAVE, OFT_PREGUNTA, OFT_RESPUESTA, OFT_SISBEN_NIVEL, OFT_SISBEN_TIPO, OFT_PERSONAS_CARGO, OFT_MED_INSCRIPCION) VALUES
(4, 2, 5004, 'Nombre4', 'Apellido1_4', 'Apellido2_4', 1, TO_DATE('1992-02-20', 'YYYY-MM-DD'), 5, 2, 1, 104, 304, 404, 'Calle 4', '123454', 'persona4@example.com', 33065, 4, 226, 3, 3397, 'Pregunta_4', 'Respuesta_4', 2, 1, 0, 1);
INSERT INTO OFERTA (OFT_ID, TDI_ID, OFT_IDENTIFICACION, OFT_NOMBRES, OFT_PRIMER_APELLIDO, OFT_SEGUNDO_APELLIDO, OFT_GENERO, OFT_FCH_NACIMIENTO, ESC_ID, OFT_LIB_MILITAR, ETR_ID, PAI_ID, DPT_ID, MPO_ID, OFT_DIRECCION, OFT_TEL, OFT_CORREO_E, OFT_SUELDO_ACEPTARIA, REG_ID, OFT_TIEMPO_BUSQUEDA, OFT_AUTORIZACION, OFT_CLAVE, OFT_PREGUNTA, OFT_RESPUESTA, OFT_SISBEN_NIVEL, OFT_SISBEN_TIPO, OFT_PERSONAS_CARGO, OFT_MED_INSCRIPCION) VALUES
(5, 1, 5005, 'Nombre5', 'Apellido1_5', 'Apellido2_5', 0, TO_DATE('1987-11-16', 'YYYY-MM-DD'), 1, 2, 2, 105, 305, 405, 'Calle 5', '123455', 'persona5@example.com', 41756, 5, 216, 1, 1809, 'Pregunta_5', 'Respuesta_5', 1, 0, 5, 0);

-- 6. Inserción en la tabla HIS_ORIENTACION_OFT
INSERT INTO FUNCIONARIO (FUN_ID, OFT_ID, FUN_FCH_REGISTRO, FUN_ESTADO, CSPE_ID, REG_ID, USR_NOMBRE, FUN_VER_TODAS_REGIONALES) VALUES
(1, 1, TO_DATE('2023-12-04', 'YYYY-MM-DD'), 0, 1, 1, 'user1', 1);
INSERT INTO FUNCIONARIO (FUN_ID, OFT_ID, FUN_FCH_REGISTRO, FUN_ESTADO, CSPE_ID, REG_ID, USR_NOMBRE, FUN_VER_TODAS_REGIONALES) VALUES
(2, 2, TO_DATE('2022-01-27', 'YYYY-MM-DD'), 1, 2, 2, 'user2', 0);
INSERT INTO FUNCIONARIO (FUN_ID, OFT_ID, FUN_FCH_REGISTRO, FUN_ESTADO, CSPE_ID, REG_ID, USR_NOMBRE, FUN_VER_TODAS_REGIONALES) VALUES
(3, 3, TO_DATE('2022-05-18', 'YYYY-MM-DD'), 0, 3, 3, 'user3', 1);
INSERT INTO FUNCIONARIO (FUN_ID, OFT_ID, FUN_FCH_REGISTRO, FUN_ESTADO, CSPE_ID, REG_ID, USR_NOMBRE, FUN_VER_TODAS_REGIONALES) VALUES
(4, 4, TO_DATE('2021-07-01', 'YYYY-MM-DD'), 0, 4, 4, 'user4', 0);
INSERT INTO FUNCIONARIO (FUN_ID, OFT_ID, FUN_FCH_REGISTRO, FUN_ESTADO, CSPE_ID, REG_ID, USR_NOMBRE, FUN_VER_TODAS_REGIONALES) VALUES
(5, 5, TO_DATE('2022-12-20', 'YYYY-MM-DD'), 0, 5, 5, 'user5', 1);
-- Datos para la tabla RUV
INSERT INTO RUV (TIPO_IDENTIFICACION, IDENTIFICACION, TPB_ID, ID_PERSONA, ESTADO, DESCRIPCION) VALUES
('CC', 10001, 1, 20001, 0, 'Estado_1');
INSERT INTO RUV (TIPO_IDENTIFICACION, IDENTIFICACION, TPB_ID, ID_PERSONA, ESTADO, DESCRIPCION) VALUES
('CC', 10002, 5, 20002, 0, 'Estado_2');
INSERT INTO RUV (TIPO_IDENTIFICACION, IDENTIFICACION, TPB_ID, ID_PERSONA, ESTADO, DESCRIPCION) VALUES
('CC', 10003, 1, 20003, 0, 'Estado_3');
INSERT INTO RUV (TIPO_IDENTIFICACION, IDENTIFICACION, TPB_ID, ID_PERSONA, ESTADO, DESCRIPCION) VALUES
('CC', 10004, 5, 20004, 0, 'Estado_4');
INSERT INTO RUV (TIPO_IDENTIFICACION, IDENTIFICACION, TPB_ID, ID_PERSONA, ESTADO, DESCRIPCION) VALUES
('CC', 10005, 5, 20005, 1, 'Estado_5');

-- Datos modificados para la tabla AC_ORIENTADOS
INSERT INTO AC_ORIENTADOS (OFT_ID, HORIO_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, FECHA_PRIMERA_ORIENTACION, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(1, 201, 'CC', 10001, 'Nombre_1', 'Apellido1_1', 'Apellido2_1', 'Femenino', 10, 819, 'Departamento_1', 3127, 'Municipio_1', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('1995-09-12', 'YYYY-MM-DD'), 2373);
INSERT INTO AC_ORIENTADOS (OFT_ID, HORIO_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, FECHA_PRIMERA_ORIENTACION, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(2, 202, 'CC', 10002, 'Nombre_2', 'Apellido1_2', 'Apellido2_2', 'Femenino', 10, 819, 'Departamento_2', 3572, 'Municipio_2', TO_DATE('2024-03-09', 'YYYY-MM-DD'), TO_DATE('2000-12-29', 'YYYY-MM-DD'), 6424);
INSERT INTO AC_ORIENTADOS (OFT_ID, HORIO_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, FECHA_PRIMERA_ORIENTACION, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(3, 203, 'CC', 10003, 'Nombre_3', 'Apellido1_3', 'Apellido2_3', 'Femenino', 6, 708, 'Departamento_3', 4050, 'Municipio_3', TO_DATE('2024-05-16', 'YYYY-MM-DD'), TO_DATE('1992-05-21', 'YYYY-MM-DD'), 1914);
INSERT INTO AC_ORIENTADOS (OFT_ID, HORIO_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, FECHA_PRIMERA_ORIENTACION, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(4, 204, 'CC', 10004, 'Nombre_4', 'Apellido1_4', 'Apellido2_4', 'Femenino', 3, 385, 'Departamento_4', 7811, 'Municipio_4', TO_DATE('2024-07-23', 'YYYY-MM-DD'), TO_DATE('2000-11-30', 'YYYY-MM-DD'), 4021);
INSERT INTO AC_ORIENTADOS (OFT_ID, HORIO_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, FECHA_PRIMERA_ORIENTACION, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(5, 205, 'CC', 10005, 'Nombre_5', 'Apellido1_5', 'Apellido2_5', 'Femenino', 1, 175, 'Departamento_5', 4972, 'Municipio_5', TO_DATE('2024-09-30', 'YYYY-MM-DD'), TO_DATE('2003-01-12', 'YYYY-MM-DD'), 1653);

-- Datos modificados para la tabla AC_INSCRITOS
INSERT INTO AC_INSCRITOS (OFT_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, FECHA_INSCRIPCION, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(1, 'CC', 10001, 'Nombre_1', 'Apellido1_1', 'Apellido2_1', 'Masculino', 6, 298, 'Departamento_1', 1113, 'Municipio_1', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('1982-07-10', 'YYYY-MM-DD'), 6439);
INSERT INTO AC_INSCRITOS (OFT_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, FECHA_INSCRIPCION, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(2, 'CC', 10002, 'Nombre_2', 'Apellido1_2', 'Apellido2_2', 'Masculino', 1, 316, 'Departamento_2', 8625, 'Municipio_2', TO_DATE('2024-03-09', 'YYYY-MM-DD'), TO_DATE('1991-03-14', 'YYYY-MM-DD'), 9287);
INSERT INTO AC_INSCRITOS (OFT_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, FECHA_INSCRIPCION, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(3, 'CC', 10003, 'Nombre_3', 'Apellido1_3', 'Apellido2_3', 'Masculino', 3, 593, 'Departamento_3', 8059, 'Municipio_3', TO_DATE('2024-05-16', 'YYYY-MM-DD'), TO_DATE('1983-02-04', 'YYYY-MM-DD'), 1056);
INSERT INTO AC_INSCRITOS (OFT_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, FECHA_INSCRIPCION, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(4, 'CC', 10004, 'Nombre_4', 'Apellido1_4', 'Apellido2_4', 'Masculino', 2, 825, 'Departamento_4', 2234, 'Municipio_4', TO_DATE('2024-07-23', 'YYYY-MM-DD'), TO_DATE('1981-12-18', 'YYYY-MM-DD'), 5727);
INSERT INTO AC_INSCRITOS (OFT_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, FECHA_INSCRIPCION, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(5, 'CC', 10005, 'Nombre_5', 'Apellido1_5', 'Apellido2_5', 'Masculino', 9, 470, 'Departamento_5', 8089, 'Municipio_5', TO_DATE('2024-09-30', 'YYYY-MM-DD'), TO_DATE('1993-05-11', 'YYYY-MM-DD'), 8259);

-- Datos modificados para la tabla AC_COLOCACIONES
INSERT INTO AC_COLOCACIONES (OFT_ID, ENV_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, SOLICITUD, OCU_ID, OCUPACION, DENOMINACION, EMP_ID, EMPRESA, FECHA_COLOCACION, ES_EGRESADO, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(1, 301, 'CC', 10001, 'Nombre_1', 'Apellido1_1', 'Apellido2_1', 'Masculino', 3, 367, 'Departamento_1', 4897, 'Municipio_1', 91, 2829, 'Ocupacion_1', 'Denominacion_1', 156, 'Empresa_1', TO_DATE('2024-01-01', 'YYYY-MM-DD'), 1, TO_DATE('1994-11-19', 'YYYY-MM-DD'), 7345);
INSERT INTO AC_COLOCACIONES (OFT_ID, ENV_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, SOLICITUD, OCU_ID, OCUPACION, DENOMINACION, EMP_ID, EMPRESA, FECHA_COLOCACION, ES_EGRESADO, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(2, 302, 'CC', 10002, 'Nombre_2', 'Apellido1_2', 'Apellido2_2', 'Masculino', 7, 806, 'Departamento_2', 3759, 'Municipio_2', 6, 2069, 'Ocupacion_2', 'Denominacion_2', 116, 'Empresa_2', TO_DATE('2024-03-09', 'YYYY-MM-DD'), 1, TO_DATE('1991-02-13', 'YYYY-MM-DD'), 8878);
INSERT INTO AC_COLOCACIONES (OFT_ID, ENV_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, SOLICITUD, OCU_ID, OCUPACION, DENOMINACION, EMP_ID, EMPRESA, FECHA_COLOCACION, ES_EGRESADO, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(3, 303, 'CC', 10003, 'Nombre_3', 'Apellido1_3', 'Apellido2_3', 'Masculino', 6, 179, 'Departamento_3', 2770, 'Municipio_3', 41, 2699, 'Ocupacion_3', 'Denominacion_3', 360, 'Empresa_3', TO_DATE('2024-05-16', 'YYYY-MM-DD'), 1, TO_DATE('1988-08-09', 'YYYY-MM-DD'), 5745);
INSERT INTO AC_COLOCACIONES (OFT_ID, ENV_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, SOLICITUD, OCU_ID, OCUPACION, DENOMINACION, EMP_ID, EMPRESA, FECHA_COLOCACION, ES_EGRESADO, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(4, 304, 'CC', 10004, 'Nombre_4', 'Apellido1_4', 'Apellido2_4', 'Masculino', 4, 308, 'Departamento_4', 6357, 'Municipio_4', 47, 1585, 'Ocupacion_4', 'Denominacion_4', 470, 'Empresa_4', TO_DATE('2024-07-23', 'YYYY-MM-DD'), 1, TO_DATE('2001-09-29', 'YYYY-MM-DD'), 4967);
INSERT INTO AC_COLOCACIONES (OFT_ID, ENV_ID, TIPO_IDENTIFICACION, IDENTIFICACION, NOMBRES, PRIMER_APELLIDO, SEGUNDO_APELLIDO, GENERO, PAI_ID, DPT_ID, DEPARTAMENTO, MPO_ID, MUNICIPIO, SOLICITUD, OCU_ID, OCUPACION, DENOMINACION, EMP_ID, EMPRESA, FECHA_COLOCACION, ES_EGRESADO, FECHA_NACIMIENTO, MPO_ID_NACIMIENTO) VALUES
(5, 305, 'CC', 10005, 'Nombre_5', 'Apellido1_5', 'Apellido2_5', 'Masculino', 7, 668, 'Departamento_5', 5630, 'Municipio_5', 98, 9684, 'Ocupacion_5', 'Denominacion_5', 331, 'Empresa_5', TO_DATE('2024-09-30', 'YYYY-MM-DD'), 0, TO_DATE('1989-04-01', 'YYYY-MM-DD'), 3193);

-- Datos para la tabla MUNICIPIOS_CARACTERIZADOS
INSERT INTO MUNICIPIOS_CARACTERIZADOS (MPO_ID, ES_PDET, ES_PNIS, RURALIDAD) VALUES
(401, 1, 0, 'Alta');
INSERT INTO MUNICIPIOS_CARACTERIZADOS (MPO_ID, ES_PDET, ES_PNIS, RURALIDAD) VALUES
(402, 0, 1, 'Media');
INSERT INTO MUNICIPIOS_CARACTERIZADOS (MPO_ID, ES_PDET, ES_PNIS, RURALIDAD) VALUES
(403, 1, 0, 'Baja');
INSERT INTO MUNICIPIOS_CARACTERIZADOS (MPO_ID, ES_PDET, ES_PNIS, RURALIDAD) VALUES
(404, 0, 1, 'Media');
INSERT INTO MUNICIPIOS_CARACTERIZADOS (MPO_ID, ES_PDET, ES_PNIS, RURALIDAD) VALUES
(405, 1, 0, 'Alta');

-- Datos para la tabla TIPO_POBLACION_SOFIA_RUV
INSERT INTO TIPO_POBLACION_SOFIA_RUV (TPB_ID, TIPO_POBLACION_SOFIA) VALUES
('1', 'Población Desplazada');
INSERT INTO TIPO_POBLACION_SOFIA_RUV (TPB_ID, TIPO_POBLACION_SOFIA) VALUES
('5', 'Víctima de Conflicto Armado');

