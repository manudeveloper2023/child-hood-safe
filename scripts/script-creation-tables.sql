CREATE DATABASE DBChildHoodSafe
USE DBChildHoodSafe


-- BASE DE DATOS DE CHILDHOODSAFE

-- @AUTHOR : TEAMCHILDHOODSAFE

-- E#(NUMBER) : IDENTIFICADOR DE ENTIDADES CON RELACIONES , 
-- USARLOS CON CTRL + F , PARA IDENTIFICAR LAS RELACIONES DE LAS ENTIDADES


-- PROYECTO : APLICATIVO PARA REALIZAR DENUNCIAS ANONIMAS 

-- VERSION DEL MICROSOFT SQL MANAGEMENT STUDIO : 
-- Microsoft SQL Server 2022 (RTM) - 16.0.1000.6 (X64)   Oct  8 2022 05:58:25   
-- Copyright (C) 2022 Microsoft Corporation  Developer Edition (64-bit) 
-- on Windows 10 Home 10.0 <X64> (Build 19045: ) (Hypervisor) 

-- REPOSITORIO GITHUB




--TABLA APROXIMACIÓN EDAD

---------------USO DE TINYINT EN EDAD MENOR Y MAYOR---------------------
-- Seleccionamos la edad menor y mayor para poder realizar promedios  --
-- además , lo tenemos en tipo de dato TINYINT , el cual tiene un	  --
-- rango de [ 0 , 255 ] y teniendo en cuenta que los menores de edad  --
-- son menores a 18 años , es ideal para la situación que poseemos	  --
------------------------------------------------------------------------
	

CREATE TABLE Aproximacion_Edad
(
  Aproximacion_EdadID INT IDENTITY(1,1) NOT NULL,
  edad_menor          TINYINT NOT NULL,
  edad_mayor          TINYINT NOT NULL,
  PRIMARY KEY (Aproximacion_EdadID)
);


CREATE TABLE Categoria
(
  CategoriaID INT IDENTITY(1,1)  NOT NULL,
  categoria   NVARCHAR(100) NOT NULL, --> LIMITE DE CARACTERES [1,100]
  PRIMARY KEY (CategoriaID)
);

CREATE TABLE Categoria_Posts
(
  PostsID     INT  NOT NULL,
  CategoriaID INT NOT NULL,
  PRIMARY KEY (PostsID, CategoriaID) --> LLAVE COMPUESTA

  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS 
  --> #E01
  
);

--TABLA Comentario

---------------USO DE Comentario_Respuesta-------------------------------
-- Es una recursividad en Comentario , el cual se hace referencia a si -- 
-- mismo , ya que un comentario puede dar una respuesta a otro		   --
-- comentario														   --
-------------------------------------------------------------------------

CREATE TABLE Comentario
(
  ComentarioID         INT   IDENTITY(1,1)     NOT NULL,
  UsuarioID            INT      NOT NULL,
  PostsID              INT      NOT NULL,
  Comentario_Respuesta INT      NULL    ,
  comentario           TEXT     NOT NULL,
  fecha_publicado      DATETIME NOT NULL,
  PRIMARY KEY (ComentarioID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS 
  --> #E02
);

CREATE TABLE Comisaria
(
  ComisariaID         INT  IDENTITY(1,1)  NOT NULL,
  Division_PolicialID INT  NOT NULL,
  UbigeoID            CHAR(6) NOT NULL, --> LIMITE DE CARACTERES [1,6]
  comisaria           NVARCHAR(50) NOT NULL, --> LIMITE DE CARACTERES [1,50]
  PRIMARY KEY (ComisariaID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS 
  --> #E03
);


--TABLA Comunidad

------------------------------USO DE CREADORID-------------------------------
-- Tiene una relación de 0 a 1 con Usuarios , el cual menciona el creador  --
-- de la comunidad , el cual debe ser un Usuario					       --
-----------------------------------------------------------------------------



CREATE TABLE Comunidad
(
  ComunidadID    INT    IDENTITY(1,1)   NOT NULL,
  CreadorID      INT NOT NULL , 
  nombre         NVARCHAR(100)     NOT NULL, --> LIMITE DE CARACTERES [1,100]
  descripcion    TEXT     NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  PRIMARY KEY (ComunidadID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E04
);

CREATE TABLE Correo_Electronico
(
  Correo_ElectronicoID INT  IDENTITY(1,1)  NOT NULL,
  UsuarioID            INT  NOT NULL,
  correo_electronico   NVARCHAR(320) NOT NULL, --> LIMITE DE CARACTERES [1,320]
  PRIMARY KEY (Correo_ElectronicoID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E05
);

CREATE TABLE Denuncia_Anonima
(
  Denuncia_AnonimaID      INT  IDENTITY(1,1)      NOT NULL,
  DificultadID            INT      NOT NULL,
  UbigeoID                CHAR(6)      NOT NULL, --> LIMITE DE CARACTERES [1,6]
  Descripcion_MenorID     INT      NOT NULL,
  UsuarioID               INT      NOT NULL,
  descripcion_caso        TEXT     NULL,
  fecha_registro_denuncia DATETIME NOT NULL,
  PRIMARY KEY (Denuncia_AnonimaID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E06
);



-- TABLA Denuncia_En_Proceso

--------------------USO DE Denuncia_En_Proceso---------------------------
-- Proviene de una relación de 0 a 1.Por eso , no posee IDENTITY ,	   --
-- además comparte el ID con [Denuncia_Anonima] , lo cual nos		   --
-- ayuda a filtrar los datos que han sido admitidos en la denuncia	   --		
-- anonima  														   --
-------------------------------------------------------------------------


CREATE TABLE Denuncia_En_Proceso
(
  Denuncia_En_ProcesoID     INT      NOT NULL,
  FiscaliaID                INT      NOT NULL,
  ComisariaID               INT      NOT NULL,
  fecha_registro_en_proceso DATETIME NOT NULL    ,
  PRIMARY KEY (Denuncia_En_ProcesoID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E07
);

-- TABLA Denuncia_Aprobada

--------------------USO DE Denuncia_Aprobada-----------------------------
-- Proviene de una relación de 0 a 1.Por eso , no posee IDENTITY ,	   --
-- además comparte el ID con [Denuncia_En_Proceso] , lo cual nos	   --
-- ayuda a filtrar los datos que han sido aprobados en la denuncia	   --		
-- en proceso														   --
-------------------------------------------------------------------------

CREATE TABLE Denuncia_Aprobada
(
  Denuncia_AprobadaID       INT      NOT NULL,
  descripcion               TEXT     NOT NULL,
  fecha_registro_aprobacion DATETIME NOT NULL    ,
  PRIMARY KEY (Denuncia_AprobadaID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E08
);



CREATE TABLE Descripcion_Menor
(
  Descripcion_MenorID INT   IDENTITY(1,1)  NOT NULL,
  SexoID              INT NOT NULL,
  Aproximacion_EdadID INT NOT NULL,
  Tonalidad_PielID    INT NOT NULL,
  PrendasID           INT NOT NULL,
  PRIMARY KEY (Descripcion_MenorID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E09
);

CREATE TABLE Descripcion_Menor_Estado_Fisica  
(
  Estado_FisicoID     INT NOT NULL,
  Descripcion_MenorID INT NOT NULL,
  PRIMARY KEY (Estado_FisicoID, Descripcion_MenorID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E10
);

CREATE TABLE Descripcion_Menor_Trabajo_Ilegal
(
  Trabajo_IlegalID    INT NOT NULL,
  Descripcion_MenorID INT NOT NULL,
  PRIMARY KEY (Trabajo_IlegalID, Descripcion_MenorID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E11
);

CREATE TABLE Dificultad
(
  DificultadID       INT  IDENTITY(1,1)  NOT NULL,
  niveles_dificultad NVARCHAR(50)	NOT NULL, --> LIMITE DE CARACTERES [1,50]
  PRIMARY KEY (DificultadID)
);

CREATE TABLE Division_Policial
(
  DivisionPolicialID INT  IDENTITY(1,1)  NOT NULL,
  division_policial  NVARCHAR(100) NOT NULL, --> LIMITE DE CARACTERES [1,100]
  PRIMARY KEY (DivisionPolicialID)
);

CREATE TABLE Estado_Fisico
(
  Estado_FisicoID INT  IDENTITY(1,1)  NOT NULL,
  estado_fisico     NVARCHAR(100) NOT NULL, --> LIMITE DE CARACTERES [1,100]
  PRIMARY KEY (Estado_FisicoID)
);

CREATE TABLE Estado_Prendas
(
  Estado_PrendasID INT  IDENTITY(1,1) NOT NULL,
  estado_prendas   NVARCHAR(50) NOT NULL, --> LIMITE DE CARACTERES [1,50]
  PRIMARY KEY (Estado_PrendasID)

);

CREATE TABLE Etiqueta
(
  EtiquetaID INT   IDENTITY(1,1)  NOT NULL,
  etiquetas  NVARCHAR(50) NOT NULL, --> LIMITE DE CARACTERES [1,50]
  PRIMARY KEY (EtiquetaID)
);

CREATE TABLE Etiquetas_Posts
(
  PostsID    INT NOT NULL,
  EtiquetaID INT NOT NULL,
  PRIMARY KEY (PostsID, EtiquetaID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E12
);

CREATE TABLE Fiscalia
(
  FiscaliaID INT   IDENTITY(1,1) NOT NULL,
  UbigeoID   CHAR(6)  NOT NULL, --> LIMITE DE CARACTERES [1,6]
  fiscalia     NVARCHAR(100) NOT NULL, --> LIMITE DE CARACTERES [1,100]
  PRIMARY KEY (FiscaliaID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E13
);

-- TABLA Posts

--------------------USO DE Denuncia_Aprobada------------------------------------
-- Se usa para que los usuarios puedan postear las denuncia_aprobadas.Según , --
-- la descripción que posee													  --
--------------------------------------------------------------------------------


CREATE TABLE Posts
(
  PostsID             INT   IDENTITY(1,1)    NOT NULL,
  ComunidadID         INT      NOT NULL,
  Denuncia_AprobadaID INT      NULL    ,
  UsuarioID           INT      NOT NULL,
  titulo              NVARCHAR(100)     NOT NULL, --> LIMITE DE CARACTERES [1,100]
  contenido           TEXT     NOT NULL,
  fecha_publicacion   DATETIME NOT NULL
  PRIMARY KEY (PostsID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E14
);


CREATE TABLE Prendas
(
  PrendasID        INT    IDENTITY(1,1) NOT NULL,
  descripcion_ropa TEXT NOT NULL,
  PRIMARY KEY (PrendasID)
);


CREATE TABLE Prendas_Estado_Prendas
(
  PrendasID        INT NOT NULL,
  Estado_PrendasID INT NOT NULL,
  PRIMARY KEY (PrendasID, Estado_PrendasID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E15

);


-- TABLA Sexo

--------------------USO DE NVARCHAR(9) EN sexo --------------------------------------
-- Usamos NVARCHAR para el sexo , ya que el máximo entre Masculino y Femenino  --
-- es de 9																		   --
-------------------------------------------------------------------------------------


CREATE TABLE Sexo
(
  SexoID INT   IDENTITY(1,1) NOT NULL,
  sexo    NVARCHAR(9) NOT NULL, --> LIMITE DE CARACTERES [1,9]
  PRIMARY KEY (SexoID)
);



-- TABLA Telefono

--------------------USO DE NVARCHAR(9) EN numero_telefonico ----------------------
-- En el  Perú , posee el número telefónico posee 9 digitos					    --													
----------------------------------------------------------------------------------


CREATE TABLE Telefono
(
  TelefonoID        INT IDENTITY(1,1)  NOT NULL,
  UsuarioID         INT  NOT NULL,
  numero_telefonico CHAR(9)	 NOT NULL, --> LIMITE DE CARACTERES [1,9]
  PRIMARY KEY (TelefonoID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E16
);

CREATE TABLE Tonalidad_Piel
(
  Tonalidad_PielID INT  IDENTITY(1,1) NOT NULL,
  tonalidad_piel   NVARCHAR(20) NOT NULL, --> LIMITE DE CARACTERES [1,20]
  PRIMARY KEY (Tonalidad_PielID)
);

CREATE TABLE Trabajo_Ilegal
(
  Trabajo_IlegalID INT   IDENTITY(1,1) NOT NULL,
  trabajo_ilegal   NVARCHAR(50) NOT NULL, --> LIMITE DE CARACTERES [1,50]
  PRIMARY KEY (Trabajo_IlegalID)
);


-- TABLA Ubigeo 

--------------------USO DE NVARCHAR(6) EN UbigeoID ----------------------
-- El Ubigeo en Perú , posee 6 caracteres							   --									
-------------------------------------------------------------------------

--------------------USO DE NVARCHAR(15) EN departamento------------------
-- El departamento en Perú , que tiene más caracteres es Madre de Dios --
-- con 15 caracteres												   --
-------------------------------------------------------------------------

--------------------USO DE NVARCHAR(30) EN provincia---------------------
-- El departamento en Perú , que tiene más caracteres es			   --
-- Provincia Constitucional del Callao con 29 caracteres 			   --
-------------------------------------------------------------------------


--------------------USO DE NVARCHAR(35) EN distrito----------------------
-- El departamento en Perú , que tiene más caracteres es			   --
-- Andrés Avelino Cáceres Dorregaray con 33 caraceteres  			   --
-------------------------------------------------------------------------

CREATE TABLE Ubigeo
(
  UbigeoID     CHAR(6)  NOT NULL,     --> LIMITE DE CARACTERES [1,6]
  departamento NVARCHAR(15) NOT NULL, --> LIMITE DE CARACTERES [1,15]
  provincia    NVARCHAR(30) NOT NULL, --> LIMITE DE CARACTERES [1,30]
  distrito     NVARCHAR(35) NOT NULL, --> LIMITE DE CARACTERES [1,30]
  PRIMARY KEY (UbigeoID)
);

CREATE TABLE Usuario
(
  UsuarioID   INT  IDENTITY(1,1)   NOT NULL,
  alias          NVARCHAR(30)      NOT NULL,  --> LIMITE DE CARACTERES [1,30]
  fecha_registro DATETIME NOT NULL, 
  contraseña     NVARCHAR(30)      NOT NULL,  --> LIMITE DE CARACTERES [1,15]
  PRIMARY KEY (UsuarioID)
);

CREATE TABLE Usuario_Comunidad
(
  UsuarioID     INT      NOT NULL,
  ComunidadID   INT      NOT NULL,
  fecha_ingreso DATETIME NOT NULL,
  PRIMARY KEY (UsuarioID, ComunidadID)
  --> LLAVES FORANEAS AL FINAL DE LA CREACIÓN DE TABLAS
  --> #E17
);



-- ENTIDAD CATEGORIA_POSTS #E01

ALTER TABLE Categoria_Posts
  ADD CONSTRAINT FK_Posts_TO_Categoria_Posts
    FOREIGN KEY (PostsID)
    REFERENCES Posts (PostsID);

ALTER TABLE Categoria_Posts
  ADD CONSTRAINT FK_Categoria_TO_Categoria_Posts
    FOREIGN KEY (CategoriaID)
    REFERENCES Categoria (CategoriaID);

-- ENTIDAD COMENTARIO #E02 

ALTER TABLE Comentario
  ADD CONSTRAINT FK_Usuario_TO_Comentario
    FOREIGN KEY (UsuarioID)
    REFERENCES Usuario (UsuarioID);

ALTER TABLE Comentario
  ADD CONSTRAINT FK_Comentario_TO_Comentario
    FOREIGN KEY (Comentario_Respuesta)
    REFERENCES Comentario (ComentarioID);

ALTER TABLE Comentario
  ADD CONSTRAINT FK_Posts_TO_Comentario
    FOREIGN KEY (PostsID)
    REFERENCES Posts (PostsID);

-- ENTIDAD COMISARIA #E03

ALTER TABLE Comisaria
  ADD CONSTRAINT FK_Division_Policial_TO_Comisaria
    FOREIGN KEY (Division_PolicialID)
    REFERENCES Division_Policial (DivisionPolicialID);

ALTER TABLE Comisaria
  ADD CONSTRAINT FK_Ubigeo_TO_Comisaria
    FOREIGN KEY (UbigeoID)
    REFERENCES Ubigeo (UbigeoID);

-- ENTIDAD COMUNIDAD #E04

ALTER TABLE Comunidad
  ADD CONSTRAINT FK_Usuario_TO_Comunidad
    FOREIGN KEY (CreadorID)
    REFERENCES Usuario (UsuarioID);

-- ENTIDAD CORREO ELECTRONICO #E05


ALTER TABLE Correo_Electronico
  ADD CONSTRAINT FK_Usuario_TO_Correo_Electronico
    FOREIGN KEY (UsuarioID)
    REFERENCES Usuario (UsuarioID);

-- ENTIDAD DENUNCIA ANONIMA #E06


ALTER TABLE Denuncia_Anonima
  ADD CONSTRAINT FK_Dificultad_TO_Denuncia_Anonima
    FOREIGN KEY (DificultadID)
    REFERENCES Dificultad (DificultadID);

ALTER TABLE Denuncia_Anonima
  ADD CONSTRAINT FK_Ubigeo_TO_Denuncia_Anonima
    FOREIGN KEY (UbigeoID)
    REFERENCES Ubigeo (UbigeoID);

ALTER TABLE Denuncia_Anonima
  ADD CONSTRAINT FK_Usuario_TO_Denuncia_Anonima
    FOREIGN KEY (UsuarioID)
    REFERENCES Usuario (UsuarioID);

ALTER TABLE Denuncia_Anonima
  ADD CONSTRAINT FK_Descripcion_Menor_TO_Denuncia_Anonima
    FOREIGN KEY (Descripcion_MenorID)
    REFERENCES Descripcion_Menor (Descripcion_MenorID);

-- ENTIDAD DENUNCIA_EN_PROCESO #E07

ALTER TABLE Denuncia_En_Proceso
  ADD CONSTRAINT FK_Denuncia_Anonima_TO_Denuncia_En_Proceso
    FOREIGN KEY (Denuncia_En_ProcesoID)
    REFERENCES Denuncia_Anonima (Denuncia_AnonimaID);

ALTER TABLE Denuncia_En_Proceso
  ADD CONSTRAINT FK_Fiscalia_TO_Denuncia_En_Proceso
    FOREIGN KEY (FiscaliaID)
    REFERENCES Fiscalia (FiscaliaID);

ALTER TABLE Denuncia_En_Proceso
  ADD CONSTRAINT FK_Comisaria_TO_Denuncia_En_Proceso
    FOREIGN KEY (ComisariaID)
    REFERENCES Comisaria (ComisariaID);

-- ENTIDAD DENUNCIA APROBADA #E08

ALTER TABLE Denuncia_Aprobada
  ADD CONSTRAINT FK_Denuncia_En_Proceso_TO_Denuncia_Aprobada
    FOREIGN KEY (Denuncia_AprobadaID)
    REFERENCES Denuncia_En_Proceso (Denuncia_En_ProcesoID);

-- ENTIDAD DESCRIPCION MENOR #E09

ALTER TABLE Descripcion_Menor
  ADD CONSTRAINT FK_Sexo_TO_Descripcion_Menor
    FOREIGN KEY (SexoID)
    REFERENCES Sexo (SexoID);

ALTER TABLE Descripcion_Menor
  ADD CONSTRAINT FK_Aproximacion_Edad_TO_Descripcion_Menor
    FOREIGN KEY (Aproximacion_EdadID)
    REFERENCES Aproximacion_Edad (Aproximacion_EdadID);

ALTER TABLE Descripcion_Menor
  ADD CONSTRAINT FK_Tonalidad_Piel_TO_Descripcion_Menor
    FOREIGN KEY (Tonalidad_PielID)
    REFERENCES Tonalidad_Piel (Tonalidad_PielID);

ALTER TABLE Descripcion_Menor
  ADD CONSTRAINT FK_Prendas_TO_Descripcion_Menor
    FOREIGN KEY (PrendasID)
    REFERENCES Prendas (PrendasID);

-- ENTIDAD DESCRIPCION_MENOR_ESTADO_FISICA #E10


ALTER TABLE Descripcion_Menor_Estado_Fisica  
  ADD CONSTRAINT FK_Estado_Fisico_TO_Descripcion_Menor_Estado_Fisica  
    FOREIGN KEY (Estado_FisicoID)
    REFERENCES Estado_Fisico (Estado_FisicoID);

ALTER TABLE Descripcion_Menor_Estado_Fisica  
  ADD CONSTRAINT FK_Descripcion_Menor_TO_Descripcion_Menor_Estado_Fisica  
    FOREIGN KEY (Descripcion_MenorID)
    REFERENCES Descripcion_Menor (Descripcion_MenorID);

-- ENTIDAD DESCRIPCION_MENOR_TRABAJO_ILEGAL #E11

ALTER TABLE Descripcion_Menor_Trabajo_Ilegal
  ADD CONSTRAINT FK_Trabajo_Ilegal_TO_Descripcion_Menor_Trabajo_Ilegal
    FOREIGN KEY (Trabajo_IlegalID)
    REFERENCES Trabajo_Ilegal (Trabajo_IlegalID);

ALTER TABLE Descripcion_Menor_Trabajo_Ilegal
  ADD CONSTRAINT FK_Descripcion_Menor_TO_Descripcion_Menor_Trabajo_Ilegal
    FOREIGN KEY (Descripcion_MenorID)
    REFERENCES Descripcion_Menor (Descripcion_MenorID);

-- ENTIDAD ETIQUETAS_POSTS #E12

ALTER TABLE Etiquetas_Posts
  ADD CONSTRAINT FK_Posts_TO_Etiquetas_Posts
    FOREIGN KEY (PostsID)
    REFERENCES Posts (PostsID);

ALTER TABLE Etiquetas_Posts
  ADD CONSTRAINT FK_Etiqueta_TO_Etiquetas_Posts
    FOREIGN KEY (EtiquetaID)
    REFERENCES Etiqueta (EtiquetaID);

-- ENTIDAD FISCALIA #E13

ALTER TABLE Fiscalia
  ADD CONSTRAINT FK_Ubigeo_TO_Fiscalia
    FOREIGN KEY (UbigeoID)
    REFERENCES Ubigeo (UbigeoID);


-- ENTIDAD POSTS #E14

ALTER TABLE Posts
  ADD CONSTRAINT FK_Comunidad_TO_Posts
    FOREIGN KEY (ComunidadID)
    REFERENCES Comunidad (ComunidadID);

ALTER TABLE Posts
  ADD CONSTRAINT FK_Denuncia_Aprobada_TO_Posts
    FOREIGN KEY (Denuncia_AprobadaID)
    REFERENCES Denuncia_Aprobada (Denuncia_AprobadaID);

ALTER TABLE Posts
  ADD CONSTRAINT FK_Usuario_TO_Posts
    FOREIGN KEY (UsuarioID)
    REFERENCES Usuario (UsuarioID);


-- ENTIDAD PRENDAS_ESTADO_PRENDAS #E15

ALTER TABLE Prendas_Estado_Prendas
  ADD CONSTRAINT FK_Prendas_TO_Prendas_Estado_Prendas
    FOREIGN KEY (PrendasID)
    REFERENCES Prendas (PrendasID);

ALTER TABLE Prendas_Estado_Prendas
  ADD CONSTRAINT FK_Estado_Prendas_TO_Prendas_Estado_Prendas
    FOREIGN KEY (Estado_PrendasID)
    REFERENCES Estado_Prendas (Estado_PrendasID);


-- ENTIDAD TELEFONO #E16


ALTER TABLE Telefono
  ADD CONSTRAINT FK_Usuario_TO_Telefono
    FOREIGN KEY (UsuarioID)
    REFERENCES Usuario (UsuarioID);

-- ENTIDAD USUARIO COMUNIDAD #17
ALTER TABLE Usuario_Comunidad
  ADD CONSTRAINT FK_Usuario_TO_Usuario_Comunidad
    FOREIGN KEY (UsuarioID)
    REFERENCES Usuario (UsuarioID);

ALTER TABLE Usuario_Comunidad
  ADD CONSTRAINT FK_Comunidad_TO_Usuario_Comunidad
    FOREIGN KEY (ComunidadID)
    REFERENCES Comunidad (ComunidadID);
