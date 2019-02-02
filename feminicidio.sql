-- Generado por Oracle SQL Developer Data Modeler 18.4.0.339.1532
--   en:        2019-02-01 21:51:32 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE agresion (
    id_agresion          INTEGER NOT NULL,
    tipo_relacion        VARCHAR2(1000 CHAR),
    agresion_previa      VARCHAR2(1000),
    id_arma              INTEGER NOT NULL,
    victima_id_persona   INTEGER NOT NULL,
    agresor_id_persona   INTEGER NOT NULL
);

ALTER TABLE agresion ADD CONSTRAINT agresion_pk PRIMARY KEY ( id_agresion );

CREATE TABLE agresor (
    id_persona          INTEGER NOT NULL,
    situacion_agresor   VARCHAR2(1000)
);

ALTER TABLE agresor ADD CONSTRAINT agresor_pk PRIMARY KEY ( id_persona );

CREATE TABLE arma (
    id_arma     INTEGER NOT NULL,
    tipo_arma   VARCHAR2(500 CHAR)
);

ALTER TABLE arma ADD CONSTRAINT arma_pk PRIMARY KEY ( id_arma );

CREATE TABLE departamento (
    id_departamento   INTEGER NOT NULL,
    nombre            VARCHAR2(1000 CHAR),
    id_pais           INTEGER NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE feminicidio (
    id_feminicidio      INTEGER NOT NULL,
    fecha_feminicidio   DATE,
    hora_feminicidio    DATE,
    testigo             VARCHAR2(1000),
    sentencia           VARCHAR2(500),
    id_agresion         INTEGER NOT NULL,
    id_estado           INTEGER NOT NULL,
    id_lugar            INTEGER NOT NULL,
    id_noticia          INTEGER NOT NULL,
    id_noticia2         INTEGER NOT NULL,
    id_noticia2_1       INTEGER NOT NULL
);

ALTER TABLE feminicidio ADD CONSTRAINT feminicidio_pk PRIMARY KEY ( id_feminicidio );

CREATE TABLE lugar (
    id_lugar       INTEGER NOT NULL,
    calle          VARCHAR2(1000),
    distrito       VARCHAR2(1000),
    id_provincia   INTEGER NOT NULL
);

ALTER TABLE lugar ADD CONSTRAINT lugar_pk PRIMARY KEY ( id_lugar );

CREATE TABLE noticia (
    id_noticia       INTEGER NOT NULL,
    url              VARCHAR2(2000 CHAR),
    fecha_consulta   DATE,
    texto            VARCHAR2(2000),
    autor            VARCHAR2(500),
    palabras         VARCHAR2(700),
    categoria        VARCHAR2(500)
);

ALTER TABLE noticia ADD CONSTRAINT noticia_pk PRIMARY KEY ( id_noticia );

CREATE TABLE pais (
    id_pais   INTEGER NOT NULL,
    nombre    VARCHAR2(115 CHAR)
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id_pais );

CREATE TABLE persona (
    id_persona     INTEGER NOT NULL,
    nombres        VARCHAR2(1000),
    apellidos      VARCHAR2(1000),
    edad           REAL,
    nacionalidad   VARCHAR2(1000),
    ocupacion      VARCHAR2(1000)
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( id_persona );

CREATE TABLE provincia (
    id_provincia      INTEGER NOT NULL,
    nombre            VARCHAR2(1000),
    id_departamento   INTEGER NOT NULL
);

ALTER TABLE provincia ADD CONSTRAINT provincia_pk PRIMARY KEY ( id_provincia );

CREATE TABLE situacion (
    id_estado     INTEGER NOT NULL,
    tipo_estado   VARCHAR2(500)
);

ALTER TABLE situacion ADD CONSTRAINT situacion_pk PRIMARY KEY ( id_estado );

CREATE TABLE victima (
    id_persona     INTEGER NOT NULL,
    causa_muerte   VARCHAR2(1000)
);

ALTER TABLE victima ADD CONSTRAINT victima_pk PRIMARY KEY ( id_persona );

ALTER TABLE agresion
    ADD CONSTRAINT agresion_agresor_fk FOREIGN KEY ( agresor_id_persona )
        REFERENCES agresor ( id_persona );

ALTER TABLE agresion
    ADD CONSTRAINT agresion_arma_fk FOREIGN KEY ( id_arma )
        REFERENCES arma ( id_arma );

ALTER TABLE agresion
    ADD CONSTRAINT agresion_victima_fk FOREIGN KEY ( victima_id_persona )
        REFERENCES victima ( id_persona );

ALTER TABLE agresor
    ADD CONSTRAINT agresor_persona_fk FOREIGN KEY ( id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE departamento
    ADD CONSTRAINT departamento_pais_fk FOREIGN KEY ( id_pais )
        REFERENCES pais ( id_pais );

ALTER TABLE feminicidio
    ADD CONSTRAINT feminicidio_agresion_fk FOREIGN KEY ( id_agresion )
        REFERENCES agresion ( id_agresion );

ALTER TABLE feminicidio
    ADD CONSTRAINT feminicidio_lugar_fk FOREIGN KEY ( id_lugar )
        REFERENCES lugar ( id_lugar );

ALTER TABLE feminicidio
    ADD CONSTRAINT feminicidio_noticia_fk FOREIGN KEY ( id_noticia )
        REFERENCES noticia ( id_noticia );

ALTER TABLE feminicidio
    ADD CONSTRAINT feminicidio_noticia_fkv2 FOREIGN KEY ( id_noticia2 )
        REFERENCES noticia ( id_noticia );

ALTER TABLE feminicidio
    ADD CONSTRAINT feminicidio_noticia_fkv3 FOREIGN KEY ( id_noticia2_1 )
        REFERENCES noticia ( id_noticia );

ALTER TABLE feminicidio
    ADD CONSTRAINT feminicidio_situacion_fk FOREIGN KEY ( id_estado )
        REFERENCES situacion ( id_estado );

ALTER TABLE lugar
    ADD CONSTRAINT lugar_provincia_fk FOREIGN KEY ( id_provincia )
        REFERENCES provincia ( id_provincia );

ALTER TABLE provincia
    ADD CONSTRAINT provincia_departamento_fk FOREIGN KEY ( id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE victima
    ADD CONSTRAINT victima_persona_fk FOREIGN KEY ( id_persona )
        REFERENCES persona ( id_persona );

CREATE SEQUENCE agresion_id_agresion_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER agresion_id_agresion_trg BEFORE
    INSERT ON agresion
    FOR EACH ROW
    WHEN ( new.id_agresion IS NULL )
BEGIN
    :new.id_agresion := agresion_id_agresion_seq.nextval;
END;
/

CREATE SEQUENCE arma_id_arma_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER arma_id_arma_trg BEFORE
    INSERT ON arma
    FOR EACH ROW
    WHEN ( new.id_arma IS NULL )
BEGIN
    :new.id_arma := arma_id_arma_seq.nextval;
END;
/

CREATE SEQUENCE departamento_id_departamento START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER departamento_id_departamento BEFORE
    INSERT ON departamento
    FOR EACH ROW
    WHEN ( new.id_departamento IS NULL )
BEGIN
    :new.id_departamento := departamento_id_departamento.nextval;
END;
/

CREATE SEQUENCE feminicidio_id_feminicidio_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER feminicidio_id_feminicidio_trg BEFORE
    INSERT ON feminicidio
    FOR EACH ROW
    WHEN ( new.id_feminicidio IS NULL )
BEGIN
    :new.id_feminicidio := feminicidio_id_feminicidio_seq.nextval;
END;
/

CREATE SEQUENCE lugar_id_lugar_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER lugar_id_lugar_trg BEFORE
    INSERT ON lugar
    FOR EACH ROW
    WHEN ( new.id_lugar IS NULL )
BEGIN
    :new.id_lugar := lugar_id_lugar_seq.nextval;
END;
/

CREATE SEQUENCE noticia_id_noticia_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER noticia_id_noticia_trg BEFORE
    INSERT ON noticia
    FOR EACH ROW
    WHEN ( new.id_noticia IS NULL )
BEGIN
    :new.id_noticia := noticia_id_noticia_seq.nextval;
END;
/

CREATE SEQUENCE pais_id_pais_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pais_id_pais_trg BEFORE
    INSERT ON pais
    FOR EACH ROW
    WHEN ( new.id_pais IS NULL )
BEGIN
    :new.id_pais := pais_id_pais_seq.nextval;
END;
/

CREATE SEQUENCE persona_id_persona_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER persona_id_persona_trg BEFORE
    INSERT ON persona
    FOR EACH ROW
    WHEN ( new.id_persona IS NULL )
BEGIN
    :new.id_persona := persona_id_persona_seq.nextval;
END;
/

CREATE SEQUENCE provincia_id_provincia_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER provincia_id_provincia_trg BEFORE
    INSERT ON provincia
    FOR EACH ROW
    WHEN ( new.id_provincia IS NULL )
BEGIN
    :new.id_provincia := provincia_id_provincia_seq.nextval;
END;
/

CREATE SEQUENCE situacion_id_estado_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER situacion_id_estado_trg BEFORE
    INSERT ON situacion
    FOR EACH ROW
    WHEN ( new.id_estado IS NULL )
BEGIN
    :new.id_estado := situacion_id_estado_seq.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          10
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         10
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
