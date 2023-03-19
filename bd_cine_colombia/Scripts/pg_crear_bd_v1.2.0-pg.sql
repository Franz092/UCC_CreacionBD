/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     18/03/2023 9:01:26                           */
/*==============================================================*/

/*==============================================================*/
/* Table: ASIENTO                                               */
/*==============================================================*/
create table ASIENTO(
   ID_ASIENTO           VARCHAR(20)          not null,
   ID_SALA              VARCHAR(20)          not null,
   ID_ESTADO            VARCHAR(20)          not null,
   NUM_ASIENTO          VARCHAR(20)          null,
   constraint PK_ASIENTO primary key (ID_ASIENTO)
);

/*==============================================================*/
/* Table: CINE                                                  */
/*==============================================================*/
create table CINE (
   ID_CINE              VARCHAR(5)           not null,
   ID_CIUDAD            VARCHAR(5)           not null,
   NOMBRE               VARCHAR(40)          not null,
   DIRECCION            VARCHAR(50)          not null,
   TELEFONO_ADMIN       VARCHAR(30)          null,
   TELEFONO_CLIENTES    VARCHAR(30)          null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_CINE check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CINE primary key (ID_CINE)
);

/*==============================================================*/
/* Table: CINE_CARTELERAS                                       */
/*==============================================================*/
create table CINE_CARTELERAS (
   ID_CARTELERA         VARCHAR(10)          not null,
   ID_CINE              VARCHAR(5)           not null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_CINE_CAR check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CINE_CARTELERAS primary key (ID_CARTELERA)
);

/*==============================================================*/
/* Table: CINE_SALAS                                            */
/*==============================================================*/
create table CINE_SALAS (
   ID_SALA              VARCHAR(5)           not null,
   ID_CINE              VARCHAR(5)           not null,
   ID_TEATRO            VARCHAR(20)          null,
   NOMBRE               VARCHAR(30)          null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_CINE_SAL check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CINE_SALAS primary key (ID_SALA)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            VARCHAR(5)           not null,
   ID_DEPTO             VARCHAR(2)           not null,
   NOMBRE               VARCHAR(20)          not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMBER(20)           not null,
   ID_TD                VARCHAR(2)           not null,
   ID_REGISTRO_ASIENTO  VARCHAR(20)          null,
   ID_PROMOCION         VARCHAR(20)          null,
   NOMBRE               VARCHAR(30)          not null,
   APELLIDOS            VARCHAR(30)          not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CLIENTE_DIRECCIONES                                   */
/*==============================================================*/
create table CLIENTE_DIRECCIONES (
   ID_CIUDAD            VARCHAR(5)           not null,
   ID_CLIENTE           NUMBER(20)           null,
   constraint PK_CLIENTE_DIRECCIONES primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   ID_DEPTO             VARCHAR(2)           not null,
   NOMBRE               VARCHAR(20)          not null,
   constraint PK_DEPARTAMENTO primary key (ID_DEPTO)
);

/*==============================================================*/
/* Table: DISTRIBUCION                                          */
/*==============================================================*/
create table DISTRIBUCION (
   ID_CARTELERA         VARCHAR(20)          not null,
   ID_SALA              VARCHAR(5)           null,
   ID_FUNCION           VARCHAR(20)          null,
   ID_CINE              VARCHAR(20)          not null,
   ID_DISTRIBUCION      VARCHAR(20)          not null,
   COORDENADA_X         VARCHAR(20)          null,
   COORDENADA_Y         VARCHAR(20)          null,
   TIPOS__PRIN_GER_ADM_ VARCHAR(15)          null,
   constraint PK_DISTRIBUCION primary key (ID_CARTELERA)
);

/*==============================================================*/
/* Table: DISTRIBUCION_FILMS                                    */
/*==============================================================*/
create table DISTRIBUCION_FILMS (
   ID_FILMS             VARCHAR(20)          not null,
   ID_DISTRIBUCION      VARCHAR(30)          not null,
   COORDENADA_X         VARCHAR(30)          null,
   COORDENAD_Y          VARCHAR(30)          null,
   constraint PK_DISTRIBUCION_FILMS primary key (ID_FILMS)
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO (
   ID_ESTADO            VARCHAR(20)          not null,
   ID_PRODUCTO          VARCHAR(20)          not null,
   ID_TEATRO            VARCHAR(20)          not null,
   ID_ASIENTO           VARCHAR(20)          not null,
   DESCRIPCION          VARCHAR(200)         null,
   constraint PK_ESTADO primary key (ID_ESTADO)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           VARCHAR(20)          not null,
   ID_RESULTADO_FACTURA VARCHAR(20)          null,
   ID_RESULTADO         VARCHAR(20)          not null,
   ID_TEATRO            VARCHAR(20)          not null,
   VALOR_PAGAR          FLOAT20              null,
   ESTADO               VARCHAR(20)          null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Table: FUNCION                                               */
/*==============================================================*/
create table FUNCION (
   ID_FUNCION           VARCHAR(20)          not null,
   ID_FACTURA           VARCHAR(20)          not null,
   ID_FILMS             VARCHAR(20)          not null,
   ID_CARTELERA         VARCHAR(20)          not null,
   PUNTOS               FLOAT20              null,
   constraint PK_FUNCION primary key (ID_FUNCION)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA (
   ID_PELICULA          VARCHAR(10)          not null,
   NOMBRE               VARCHAR(100)         not null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_PELICULA check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_PELICULA primary key (ID_PELICULA)
);

/*==============================================================*/
/* Table: PELICULA_CARTELERA                                    */
/*==============================================================*/
create table PELICULA_CARTELERA (
   ID_CARTELERA         VARCHAR(10)          not null,
   ID_PELICULA          VARCHAR(10)          not null,
   constraint PK_PELICULA_CARTELERA primary key (ID_CARTELERA, ID_PELICULA)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          VARCHAR(20)          not null,
   ID_FACTURA           VARCHAR(20)          not null,
   NOMBRE               VARCHAR(20)          not null,
   ESTADO               VARCHAR(20)          null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: PROMOCION                                             */
/*==============================================================*/
create table PROMOCION (
   ID_PROMOCION         VARCHAR(20)          not null,
   NOMBRE               TEXT                 not null,
   DESCUENTO            VARCHAR(20)          null,
   ESTADO               VARCHAR(20)          null,
   constraint PK_PROMOCION primary key (ID_PROMOCION)
);

/*==============================================================*/
/* Table: REGISTRO_ASIENTO                                      */
/*==============================================================*/
create table REGISTRO_ASIENTO (
   ID_REGISTRO_ASIENTO  VARCHAR(20)          not null,
   ID_CARTELERA         VARCHAR(20)          not null,
   NUM_ASIENTO          VARCHAR(20)          null,
   constraint PK_REGISTRO_ASIENTO primary key (ID_REGISTRO_ASIENTO)
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   ID_RESERVA           VARCHAR(20)          not null,
   ID_CLIENTE           NUMBER(20)           null,
   ID_CIUDAD            CHAR(20)             not null,
   HORA                 DATE                 null,
   UBICACION            VARCHAR(20)          null,
   MEDIO_PAGO           VARCHAR(20)          null,
   constraint PK_RESERVA primary key (ID_RESERVA)
);

/*==============================================================*/
/* Table: RESULTADO                                             */
/*==============================================================*/
create table RESULTADO (
   ID_RESULTADO         VARCHAR(20)          not null,
   ESTADO               VARCHAR(20)          null,
   MOMENTO              VARCHAR(20)          null,
   constraint PK_RESULTADO primary key (ID_RESULTADO)
);

/*==============================================================*/
/* Table: RESULTAOD_FACTURA                                     */
/*==============================================================*/
create table RESULTAOD_FACTURA (
   ID_RESULTADO_FACTURA VARCHAR(20)          not null,
   ID_RESULTADO         VARCHAR(20)          null,
   ID_TEATRO            VARCHAR(20)          not null,
   ID_PRODUCTO          VARCHAR(20)          not null,
   VALORES              FLOAT20              null,
   constraint PK_RESULTAOD_FACTURA primary key (ID_RESULTADO_FACTURA)
);

/*==============================================================*/
/* Table: TEATRO                                                */
/*==============================================================*/
create table TEATRO (
   ID_TEATRO            VARCHAR(20)          not null,
   ID_SALA              VARCHAR(20)          not null,
   NOMBRE               CHAR(20)             not null,
   ESTADO               VARCHAR(20)          null,
   constraint PK_TEATRO primary key (ID_TEATRO)
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO (
   ID_TD                VARCHAR(2)           not null,
   NOMBRE               VARCHAR(20)          not null,
   constraint PK_TIPO_DOCUMENTO primary key (ID_TD)
);

alter table CINE
   add constraint FK_CINE_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table CINE_CARTELERAS
   add constraint FK_CINE_CAR_REFERENCE_CINE foreign key (ID_CINE)
      references CINE (ID_CINE)
      on delete restrict on update restrict;

alter table CINE_SALAS
   add constraint FK_CINE_SAL_REFERENCE_TEATRO foreign key (ID_TEATRO)
      references TEATRO (ID_TEATRO)
      on delete restrict on update restrict;

alter table CINE_SALAS
   add constraint FK_CINE_SAL_REFERENCE_CINE foreign key (ID_CINE)
      references CINE (ID_CINE)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_DEPARTAM foreign key (ID_DEPTO)
      references DEPARTAMENTO (ID_DEPTO)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_REFERENCE_REGISTRO foreign key (ID_REGISTRO_ASIENTO)
      references REGISTRO_ASIENTO (ID_REGISTRO_ASIENTO)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_REFERENCE_PROMOCIO foreign key (ID_PROMOCION)
      references PROMOCION (ID_PROMOCION)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_REFERENCE_TIPO_DOC foreign key (ID_TD)
      references TIPO_DOCUMENTO (ID_TD)
      on delete restrict on update restrict;

alter table CLIENTE_DIRECCIONES
   add constraint FK_CLIENTE__REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CLIENTE_DIRECCIONES
   add constraint FK_CLIENTE__REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table DISTRIBUCION
   add constraint FK_DISTRIBU_REFERENCE_CINE_SAL foreign key (ID_SALA)
      references CINE_SALAS (ID_SALA)
      on delete restrict on update restrict;

alter table DISTRIBUCION
   add constraint FK_DISTRIBU_REFERENCE_FUNCION foreign key (ID_FUNCION)
      references FUNCION (ID_FUNCION)
      on delete restrict on update restrict;

alter table ESTADO
   add constraint FK_ESTADO_REFERENCE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on delete restrict on update restrict;

alter table ESTADO
   add constraint FK_ESTADO_REFERENCE_ASIENTO foreign key (ID_ASIENTO)
      references ASIENTO (ID_ASIENTO)
      on delete restrict on update restrict;

alter table ESTADO
   add constraint FK_ESTADO_REFERENCE_TEATRO foreign key (ID_TEATRO)
      references TEATRO (ID_TEATRO)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_RESULTAO foreign key (ID_RESULTADO_FACTURA)
      references RESULTAOD_FACTURA (ID_RESULTADO_FACTURA)
      on delete restrict on update restrict;

alter table FUNCION
   add constraint FK_FUNCION_REFERENCE_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table FUNCION
   add constraint FK_FUNCION_REFERENCE_DISTRIBU foreign key (ID_FILMS)
      references DISTRIBUCION_FILMS (ID_FILMS)
      on delete restrict on update restrict;

alter table PELICULA_CARTELERA
   add constraint FK_PELICULA_REFERENCE_CINE_CAR foreign key (ID_CARTELERA)
      references CINE_CARTELERAS (ID_CARTELERA)
      on delete restrict on update restrict;

alter table PELICULA_CARTELERA
   add constraint FK_PELICULA_REFERENCE_PELICULA foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_REFERENCE_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table RESULTAOD_FACTURA
   add constraint FK_RESULTAO_REFERENCE_RESULTAD foreign key (ID_RESULTADO)
      references RESULTADO (ID_RESULTADO)
      on delete restrict on update restrict;

