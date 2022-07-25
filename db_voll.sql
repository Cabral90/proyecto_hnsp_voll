DROP DATABASE IF EXISTS voll_hnsp;
CREATE DATABASE voll_hnsp;

CREATE TABLE voll (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    fecha_creacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    fecha_ult_atualizacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    fecha_nascimiento DATE NOT NULL,
    fecha_emision_pas DATE NOT NULL,
    fecha_caducidad_pas	DATE NOT NULL,
    nacionalidad TEXT NOT NULL, 
    nombre	TEXT NOT NULL, 
    lugar_nascimiento TEXT NOT NULL, 
    residencia_actual TEXT NOT NULL, 
    num_pasaporte TEXT NOT NULL, 
    lugar_emision_pas TEXT NOT NULL, 
    profesion TEXT NOT NULL, 
    tido_voluntariado TEXT NOT NULL, 
    telefono TEXT NOT NULL, 
    email TEXT NOT NULL, 
    inst_referencia	 TEXT NOT NULL
);

CREATE TABLE voll_all (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    fecha_creacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    fecha_ult_atualizacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    fecha_nascimiento DATE NOT NULL,
    fecha_emision_pas DATE NOT NULL,
    fecha_caducidad_pas	DATE NOT NULL,
    fecha_ini_estancia DATE NOT NULL,
    fecha_fin_estancia DATE NOT NULL,
    num_edif CHAR(6) NOT NULL,
    puerta CHAR(4) NOT NULL,
    nacionalidad TEXT NOT NULL, 
    nombre	TEXT NOT NULL, 
    lugar_nascimiento TEXT NOT NULL, 
    residencia_actual TEXT NOT NULL, 
    num_pasaporte TEXT NOT NULL, 
    lugar_emision_pas TEXT NOT NULL, 
    profesion TEXT NOT NULL, 
    tido_voluntariado TEXT NOT NULL, 
    telefono TEXT NOT NULL, 
    email TEXT NOT NULL, 
    inst_referencia	 TEXT NOT NULL, 
    -- RESEIDENCIA 
    calle TEXT NOT NULL, 
    municipio TEXT NOT NULL,
    provincia TEXT NOT NULL,
    -- ESPECIALIDAD 
    especialidad TEXT NOT NULL, 
    -- PERIODO DE ESTANCIA 
    seccion_voll TEXT NOT NULL,
    nombre_responsable TEXT NOT NULL
);

-- crear Indices de busquedas

CREATE TABLE residencia(
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    id_voll UUID,
    fecha_creacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    fecha_ult_atualizacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    calle TEXT NOT NULL, 
    municipio TEXT NOT NULL,
    provincia TEXT NOT NULL, 
    num_edif CHAR(6) NOT NULL,
    puerta CHAR(4) NOT NULL,
    


);

CREATE TABLE especialidad_voll (
    id PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    id_voll UUID
    fecha_creacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    fecha_ult_atualizacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    nombre TEXT NOT NULL,
    FOREIGN KEY (id_voll) REFERENCES voll (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- crear indoces de busqueda y filtros 

CREATE TABLE periodo_estancia_voll(
    id PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    id_voll UUID
    fecha_creacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    fecha_ult_atualizacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    fecha_inicio_voll DATE NOT NULL,
    fecha_fin_voll	DATE NOT NULL,
    FOREIGN KEY (id_voll) REFERENCES voll (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE hnsp_secion_voll(
    id PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    id_voll UUID
    fecha_creacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    fecha_ult_atualizacion TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    fecha_ini DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    nombre TEXT NOT NULL,
    responsable TEXT NOT NULL,

    FOREIGN KEY (id_voll) REFERENCES voll (id) ON DELETE CASCADE ON UPDATE CASCADE
);
