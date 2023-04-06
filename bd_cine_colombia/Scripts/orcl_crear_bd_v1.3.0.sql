/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     04/04/2023 17:45:34                          */
/*==============================================================*/




/*==============================================================*/
/* Table: ASIENTO                                               */
/*==============================================================*/
create table ASIENTO (
   ID_ASIENTO           VARCHAR(20)           not null,
   ID_SALA              VARCHAR(20)           not null,
   ID_ESTADO            VARCHAR(20)           not null,
   NUM_ASIENTO          VARCHAR(20),
   constraint PK_ASIENTO primary key (ID_ASIENTO)
);

/*==============================================================*/
/* Table: CINE                                                  */
/*==============================================================*/
create table CINE (
   ID_CINE              VARCHAR(5)            not null,
   ID_CIUDAD            VARCHAR(5)            not null,
   NOMBRE               VARCHAR(40)           not null,
   DIRECCION            VARCHAR(50)           not null,
   TELEFONO_ADMIN       VARCHAR(30),
   TELEFONO_CLIENTES    VARCHAR(30),
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_CINE check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CINE primary key (ID_CINE)
);

/*==============================================================*/
/* Table: CINE_CARTELERAS                                       */
/*==============================================================*/
create table CINE_CARTELERAS (
   ID_CARTELERA         VARCHAR(10)           not null,
   ID_CINE              VARCHAR(5)            not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_CINE_CAR check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CINE_CARTELERAS primary key (ID_CARTELERA)
);

/*==============================================================*/
/* Table: CINE_SALAS                                            */
/*==============================================================*/
create table CINE_SALAS (
   ID_SALA              VARCHAR(5)            not null,
   ID_CINE              VARCHAR(5)            not null,
   ID_TEATRO            VARCHAR(20),
   NOMBRE               VARCHAR(30),
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_CINE_SAL check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CINE_SALAS primary key (ID_SALA)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            VARCHAR(5)            not null,
   ID_DEPTO             VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMBER(20)            not null,
   ID_TD                VARCHAR(2)            not null,
   DOCUMENTO            VARCHAR(20)           not null,
   NOMBRE               VARCHAR(30)           not null,
   APELLIDOS            VARCHAR(30)           not null,
   FECHA_NACIMIENTO     DATE,
   FECHA_VINCULACION    DATE,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_CLIENTE check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CLIENTE_DIRECCIONES                                   */
/*==============================================================*/
create table CLIENTE_DIRECCIONES (
   ID_CLIENTE_DIRECCION NUMBER(15)            not null,
   ID_CLIENTE           NUMBER(20)            not null,
   ID_CIUDAD            VARCHAR(5)            not null,
   VIA_PRINCIPAL        VARCHAR(20)           not null,
   NOMENCLATURA         VARCHAR(20)           not null,
   COMPLEMENTO          VARCHAR(20),
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_CLI_DIRS check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE,
   ID_USUARIO_LOG       VARCHAR(5)            not null,
   constraint PK_CLIENTE_DIRECCIONES primary key (ID_CLIENTE_DIRECCION)
);

/*==============================================================*/
/* Table: CLIENTE_EMAILS                                        */
/*==============================================================*/
create table CLIENTE_EMAILS (
   ID_CLIENTE_EMAIL     NUMBER(15)            not null,
   ID_CLIENTE           NUMBER(20)            not null,
   EMAIL                VARCHAR(100),
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_CLI_EMAILS check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE,
   ID_USUARIO_LOG       VARCHAR(5)            not null,
   constraint PK_CLIENTE_EMAILS primary key (ID_CLIENTE_EMAIL)
);

/*==============================================================*/
/* Table: CLIENTE_REDES                                         */
/*==============================================================*/
create table CLIENTE_REDES (
   ID_CLIENTE_REDES     NUMBER(15)            not null,
   ID_CLIENTE           NUMBER(20)            not null,
   ID_RED_SOCIAL        VARCHAR(5),
   NOMBRE_PERFIL        VARCHAR(30),
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_REDES check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE,
   ID_USUARIO_LOG       VARCHAR(5)            not null,
   constraint PK_CLIENTE_REDES primary key (ID_CLIENTE_REDES)
);

/*==============================================================*/
/* Table: CLIENTE_TELEFONOS                                     */
/*==============================================================*/
create table CLIENTE_TELEFONOS (
   ID_CLIENTE_TELEFONO  NUMBER(15)            not null,
   ID_CLIENTE           NUMBER(20)            not null,
   ID_PAIS              VARCHAR(3),
   TELEFONO             VARCHAR(30),
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_CLI_TEL check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE,
   ID_USUARIO_LOG       VARCHAR(5)            not null,
   constraint PK_CLIENTE_TELEFONOS primary key (ID_CLIENTE_TELEFONO)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   ID_DEPTO             VARCHAR(2)            not null,
   ID_PAIS              VARCHAR(3)            not null,
   NOMBRE               VARCHAR(20)           not null,
   constraint PK_DEPARTAMENTO primary key (ID_DEPTO)
);

/*==============================================================*/
/* Table: DISTRIBUCION                                          */
/*==============================================================*/
create table DISTRIBUCION (
   ID_CARTELERA         VARCHAR(20)           not null,
   ID_SALA              VARCHAR(5)            not null,
   ID_FUNCION           VARCHAR(20)           not null,
   ID_CINE              VARCHAR(20)           not null,
   ID_DISTRIBUCION      VARCHAR(20)           not null,
   COORDENADA_X         VARCHAR(20),
   COORDENADA_Y         VARCHAR(20),
   TIPOS__PRIN_GER_ADM_ VARCHAR(15),
   constraint PK_DISTRIBUCION primary key (ID_CARTELERA)
);

/*==============================================================*/
/* Table: DISTRIBUCION_FILMS                                    */
/*==============================================================*/
create table DISTRIBUCION_FILMS (
   ID_FILMS             VARCHAR(20)           not null,
   ID_DISTRIBUCION      VARCHAR(30)           not null,
   COORDENADA_X         VARCHAR(30),
   COORDENAD_Y          VARCHAR(30),
   constraint PK_DISTRIBUCION_FILMS primary key (ID_FILMS)
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO (
   ID_ESTADO            VARCHAR(20)           not null,
   ID_PRODUCTO          VARCHAR(20)           not null,
   ID_TEATRO            VARCHAR(20)           not null,
   ID_ASIENTO           VARCHAR(20)           not null,
   DESCRIPCION          VARCHAR(200),
   constraint PK_ESTADO primary key (ID_ESTADO)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           VARCHAR(20)           not null,
   ID_RESULTADO_FACTURA VARCHAR(20)           not null,
   ID_RESULTADO         VARCHAR(20)           not null,
   ID_TEATRO            VARCHAR(20)           not null,
   VALOR_PAGAR          FLOAT20,
   ESTADO               VARCHAR(20),
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Table: FUNCION                                               */
/*==============================================================*/
create table FUNCION (
   ID_FUNCION           VARCHAR(20)           not null,
   ID_FACTURA           VARCHAR(20)           not null,
   ID_FILMS             VARCHAR(20)           not null,
   ID_CARTELERA         VARCHAR(20)           not null,
   PUNTOS               FLOAT20,
   constraint PK_FUNCION primary key (ID_FUNCION)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID_PAIS              VARCHAR(3)            not null,
   NOMBRE               VARCHAR(20)           not null,
   CODIGO_TELEFONICO    VARCHAR(10),
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA (
   ID_PELICULA          VARCHAR(10)           not null,
   NOMBRE               VARCHAR(100)          not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_PELICULA check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_PELICULA primary key (ID_PELICULA)
);

/*==============================================================*/
/* Table: PELICULA_CARTELERA                                    */
/*==============================================================*/
create table PELICULA_CARTELERA (
   ID_CARTELERA         VARCHAR(10)           not null,
   ID_PELICULA          VARCHAR(10)           not null,
   constraint PK_PELICULA_CARTELERA primary key (ID_CARTELERA, ID_PELICULA)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          VARCHAR(20)           not null,
   ID_FACTURA           VARCHAR(20)           not null,
   NOMBRE               VARCHAR(20),
   ESTADO               VARCHAR(20),
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: RED_SOCIAL                                            */
/*==============================================================*/
create table RED_SOCIAL (
   ID_RED_SOCIAL        VARCHAR(5)            not null,
   NOMBRE               VARCHAR(20)           not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_RED_SOCI check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_RED_SOCIAL primary key (ID_RED_SOCIAL)
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   ID_RESERVA           VARCHAR(20)           not null,
   ID_CLIENTE           NUMBER(20),
   ID_CIUDAD            CHAR(20)              not null,
   HORA                 TIMESTAMP WITH TIME ZONE,
   UBICACION            VARCHAR(20),
   MEDIO_PAGO           VARCHAR(20),
   constraint PK_RESERVA primary key (ID_RESERVA)
);

/*==============================================================*/
/* Table: RESULTADO                                             */
/*==============================================================*/
create table RESULTADO (
   ID_RESULTADO         VARCHAR(20)           not null,
   ESTADO               VARCHAR(20),
   MOMENTO              VARCHAR(20),
   constraint PK_RESULTADO primary key (ID_RESULTADO)
);

/*==============================================================*/
/* Table: RESULTAOD_FACTURA                                     */
/*==============================================================*/
create table RESULTAOD_FACTURA (
   ID_RESULTADO_FACTURA VARCHAR(20)           not null,
   ID_RESULTADO         VARCHAR(20)           not null,
   ID_TEATRO            VARCHAR(20)           not null,
   ID_PRODUCTO          VARCHAR(20)           not null,
   VALORES              FLOAT20,
   constraint PK_RESULTAOD_FACTURA primary key (ID_RESULTADO_FACTURA)
);

/*==============================================================*/
/* Table: TEATRO                                                */
/*==============================================================*/
create table TEATRO (
   ID_TEATRO            VARCHAR(20)           not null,
   ID_SALA              VARCHAR(20)           not null,
   NOMBRE               CHAR(20),
   ESTADO               VARCHAR(20),
   constraint PK_TEATRO primary key (ID_TEATRO)
);

/*==============================================================*/
/* Table: TIPO_ALGORITMO                                        */
/*==============================================================*/
create table TIPO_ALGORITMO (
   ID_TIPO_ALGORITMO    VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   SCRIPT_LINE          VARCHAR(200)          not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_TIPO_ALG check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_TIPO_ALGORITMO primary key (ID_TIPO_ALGORITMO)
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO (
   ID_TD                VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   constraint PK_TIPO_DOCUMENTO primary key (ID_TD)
);

/*==============================================================*/
/* Table: TIPO_USUARIO                                          */
/*==============================================================*/
create table TIPO_USUARIO (
   ID_TIPO_USUARIO      VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_TIPO_USU check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_TIPO_USUARIO primary key (ID_TIPO_USUARIO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           VARCHAR(5)            not null,
   ID_TIPO_USUARIO      VARCHAR(2)            not null,
   NOMBRE               VARCHAR(50)           not null,
   EMAIL                VARCHAR(100)          not null,
   PASS                 VARCHAR(100)          not null,
   ID_TIPO_ALGORITMO    VARCHAR(2),
   HORA_INICIAL         NUMERIC(2)            not null,
   HORA_FINAL           NUMERIC(2)            not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_USUARIO check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: USUARIO_CINE                                          */
/*==============================================================*/
create table USUARIO_CINE (
   ID_USUARIO           VARCHAR(5)            not null,
   ID_CINE              VARCHAR(5)            not null,
   ESTADO               VARCHAR(1)           default 'A'  not null
      constraint CKC_ESTADO_USUARIO_ check (ESTADO in ('A','I') and ESTADO = upper(ESTADO)),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE  not null,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE,
   ID_USUARIO_LOG       VARCHAR(5)            not null,
   constraint PK_USUARIO_CINE primary key (ID_USUARIO, ID_CINE)
);

alter table CINE
   add constraint FK_CINE_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table CINE_CARTELERAS
   add constraint FK_CINE_CAR_REFERENCE_CINE foreign key (ID_CINE)
      references CINE (ID_CINE);

alter table CINE_SALAS
   add constraint FK_CINE_SAL_REFERENCE_TEATRO foreign key (ID_TEATRO)
      references TEATRO (ID_TEATRO);

alter table CINE_SALAS
   add constraint FK_CINE_SAL_REFERENCE_CINE foreign key (ID_CINE)
      references CINE (ID_CINE);

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_DEPARTAM foreign key (ID_DEPTO)
      references DEPARTAMENTO (ID_DEPTO);

alter table CLIENTE
   add constraint FK_CLIENTE_REFERENCE_TIPO_DOC foreign key (ID_TD)
      references TIPO_DOCUMENTO (ID_TD);

alter table CLIENTE_DIRECCIONES
   add constraint FK_CLIENTE__REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table CLIENTE_DIRECCIONES
   add constraint FK_CLIENTE_DIR_REF_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table CLIENTE_EMAILS
   add constraint FK_CLIENTE_EMAILS_REF_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table CLIENTE_REDES
   add constraint FK_CLIENTE__REFERENCE_RED_SOCI foreign key (ID_RED_SOCIAL)
      references RED_SOCIAL (ID_RED_SOCIAL);

alter table CLIENTE_REDES
   add constraint FK_CLIENTE_REDES_REF_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table CLIENTE_TELEFONOS
   add constraint FK_CLIENTE__REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table CLIENTE_TELEFONOS
   add constraint FK_CLIENTE_TEL_REF_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table DISTRIBUCION
   add constraint FK_DISTRIBU_REFERENCE_FUNCION foreign key (ID_FUNCION)
      references FUNCION (ID_FUNCION);

alter table DISTRIBUCION
   add constraint FK_DISTRIBU_REFERENCE_CINE_SAL foreign key (ID_SALA)
      references CINE_SALAS (ID_SALA);

alter table ESTADO
   add constraint FK_ESTADO_REFERENCE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO);

alter table ESTADO
   add constraint FK_ESTADO_REFERENCE_ASIENTO foreign key (ID_ASIENTO)
      references ASIENTO (ID_ASIENTO);

alter table ESTADO
   add constraint FK_ESTADO_REFERENCE_TEATRO foreign key (ID_TEATRO)
      references TEATRO (ID_TEATRO);

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_RESULTAO foreign key (ID_RESULTADO_FACTURA)
      references RESULTAOD_FACTURA (ID_RESULTADO_FACTURA);

alter table FUNCION
   add constraint FK_FUNCION_REFERENCE_DISTRIBU foreign key (ID_FILMS)
      references DISTRIBUCION_FILMS (ID_FILMS);

alter table PELICULA_CARTELERA
   add constraint FK_PELICULA_REFERENCE_CINE_CAR foreign key (ID_CARTELERA)
      references CINE_CARTELERAS (ID_CARTELERA);

alter table PELICULA_CARTELERA
   add constraint FK_PELICULA_REFERENCE_PELICULA foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA);

alter table PRODUCTO
   add constraint FK_PRODUCTO_REFERENCE_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA);

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table RESULTAOD_FACTURA
   add constraint FK_RESULTAO_REFERENCE_RESULTAD foreign key (ID_RESULTADO)
      references RESULTADO (ID_RESULTADO);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_ALG foreign key (ID_TIPO_ALGORITMO)
      references TIPO_ALGORITMO (ID_TIPO_ALGORITMO);

alter table USUARIO_CINE
   add constraint FK_USUARIO__REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table USUARIO_CINE
   add constraint FK_USUARIO__REFERENCE_CINE foreign key (ID_CINE)
      references CINE (ID_CINE);

