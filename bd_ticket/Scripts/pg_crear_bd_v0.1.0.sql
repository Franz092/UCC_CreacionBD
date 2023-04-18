/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     17/04/2023 20:56:45                          */
/*==============================================================*/


drop table CIUDAD;

drop table CLIENTE;

drop table CLIENTE_DIRECCIONES;

drop table CLIENTE_EMAILS;

drop table CLIENTE_REDES;

drop table CLIENTE_TELEFONOS;

drop table DEPARTAMENTO;

drop table DROGUERIA;

drop table EFECTIVO;

drop table ELEMENTOS_DE_LINEA;

drop table FACTURA;

drop table FORMA_DE_PAGO;

drop table PAIS;

drop table PRODUCTO;

drop table TAJETA_DE_CREDITO;

drop table TAJETA_DE_DEBITO;

drop table VENDOR;

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
   ID_CLIENTE           NUMERIC(20)          not null,
   DOCUMENTO            VARCHAR(20)          not null,
   NOMBRE               VARCHAR(30)          not null,
   APELLIDOS            VARCHAR(30)          not null,
   FECHA_NACIMIENTO     DATE                 null,
   FECHA_VINCULACION    DATE                 null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_CLIENTE check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CLIENTE_DIRECCIONES                                   */
/*==============================================================*/
create table CLIENTE_DIRECCIONES (
   ID_CLIENTE_DIRECCION NUMERIC(15)          not null,
   ID_CLIENTE           NUMERIC(20)          not null,
   ID_CIUDAD            VARCHAR(5)           not null,
   VIA_PRINCIPAL        VARCHAR(20)          not null,
   NOMENCLATURA         VARCHAR(20)          not null,
   COMPLEMENTO          VARCHAR(20)          null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_CLI_DIRS check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null,
   constraint PK_CLIENTE_DIRECCIONES primary key (ID_CLIENTE_DIRECCION)
);

/*==============================================================*/
/* Table: CLIENTE_EMAILS                                        */
/*==============================================================*/
create table CLIENTE_EMAILS (
   ID_CLIENTE_EMAIL     NUMERIC(15)          not null,
   ID_CLIENTE           NUMERIC(20)          not null,
   EMAIL                VARCHAR(100)         null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_CLI_EMAILS check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null,
   constraint PK_CLIENTE_EMAILS primary key (ID_CLIENTE_EMAIL)
);

/*==============================================================*/
/* Table: CLIENTE_REDES                                         */
/*==============================================================*/
create table CLIENTE_REDES (
   ID_CLIENTE_REDES     NUMERIC(15)          not null,
   ID_CLIENTE           NUMERIC(20)          not null,
   NOMBRE_PERFIL        VARCHAR(30)          null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_REDES check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null,
   ID_USUARIO_LOG       VARCHAR(5)           not null,
   constraint PK_CLIENTE_REDES primary key (ID_CLIENTE_REDES)
);

/*==============================================================*/
/* Table: CLIENTE_TELEFONOS                                     */
/*==============================================================*/
create table CLIENTE_TELEFONOS (
   ID_CLIENTE_TELEFONO  NUMERIC(15)          not null,
   ID_CLIENTE           NUMERIC(20)          not null,
   ID_PAIS              VARCHAR(3)           null,
   TELEFONO             VARCHAR(30)          null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_CLI_TEL check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null,
   constraint PK_CLIENTE_TELEFONOS primary key (ID_CLIENTE_TELEFONO)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   ID_DEPTO             VARCHAR(2)           not null,
   ID_PAIS              VARCHAR(3)           not null,
   NOMBRE               VARCHAR(20)          not null,
   constraint PK_DEPARTAMENTO primary key (ID_DEPTO)
);

/*==============================================================*/
/* Table: DROGUERIA                                             */
/*==============================================================*/
create table DROGUERIA (
   ID_DROGUERIA         VARCHAR(10)          not null,
   ID_PRODUCTO          VARCHAR(20)          null,
   ID_FORMA_DE_PAGO     VARCHAR(10)          null,
   NOMBRE               VARCHAR(50)          not null,
   UBICACION            VARCHAR(100)         not null,
   TELEFONO             VARCHAR(20)          null,
   constraint PK_DROGUERIA primary key (ID_DROGUERIA)
);

/*==============================================================*/
/* Table: EFECTIVO                                              */
/*==============================================================*/
create table EFECTIVO (
   ID_EFECTIVO          VARCHAR(10)          not null,
   constraint PK_EFECTIVO primary key (ID_EFECTIVO)
);

/*==============================================================*/
/* Table: ELEMENTOS_DE_LINEA                                    */
/*==============================================================*/
create table ELEMENTOS_DE_LINEA (
   ID_ELEMENTOS_DE_LINEA VARCHAR(10)          not null,
   ID_FACTURA           VARCHAR(10)          null,
   CANTIDAD             VARCHAR(20)          null,
   NOMBRE_DEL_PRODUCTO  VARCHAR(50)          not null,
   TOTAL                NUMERIC(20)          null,
   FECHA_DE_PAGO        TIMESTAMP WITH TIME ZONE null,
   constraint PK_ELEMENTOS_DE_LINEA primary key (ID_ELEMENTOS_DE_LINEA)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           VARCHAR(10)          not null,
   ID_VENDOR            VARCHAR(10)          null,
   ID_PRODUCTO          VARCHAR(20)          null,
   ID_CLIENTE           NUMERIC(20)          null,
   FECHA_DE_PEDIDO      TIMESTAMP WITH TIME ZONE not null,
   SUBTOTAL             DECIMAL(15,12)       not null,
   DESCUENTO            DECIMAL(15,12)       null,
   UBICACION            VARCHAR(20)          null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Table: FORMA_DE_PAGO                                         */
/*==============================================================*/
create table FORMA_DE_PAGO (
   ID_FORMA_DE_PAGO     VARCHAR(10)          not null,
   ID_TAJETA_DE_DEBITO  VARCHAR(20)          null,
   ID_EFECTIVO          VARCHAR(10)          null,
   EFECTIVO             BOOL                 not null,
   constraint PK_FORMA_DE_PAGO primary key (ID_FORMA_DE_PAGO)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID_PAIS              VARCHAR(3)           not null,
   NOMBRE               VARCHAR(20)          not null,
   CODIGO_TELEFONICO    VARCHAR(10)          null,
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          VARCHAR(20)          not null,
   NOMBRE               VARCHAR(60)          not null,
   CODIGO               VARCHAR(20)          null,
   NUMERO_DE_EXISTENCIA VARCHAR(16)          null,
   CATEGORIA            VARCHAR(50)          null,
   PRECIO               DECIMAL(15,12)       not null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: TAJETA_DE_CREDITO                                     */
/*==============================================================*/
create table TAJETA_DE_CREDITO (
   ID_FORMA_DE_PAGO     VARCHAR(10)          null,
   ID_TAJETA_DE_DEBITO  VARCHAR(20)          not null,
   NOMBRE_DE_LA_IDENTIDAD VARCHAR(50)          not null,
   NOMBRE_DEL_TITULAR   VARCHAR(50)          not null,
   MARCA                VARCHAR(20)          null,
   constraint PK_TAJETA_DE_CREDITO primary key (ID_TAJETA_DE_DEBITO)
);

/*==============================================================*/
/* Table: TAJETA_DE_DEBITO                                      */
/*==============================================================*/
create table TAJETA_DE_DEBITO (
   ID_TAJETA_DE_DEBITO  VARCHAR(20)          not null,
   NOMBRE_DE_LA_IDENTIDAD VARCHAR(50)          null,
   NOMBRE_DEL_TITULAR   VARCHAR(50)          null,
   MARCA                VARCHAR(20)          null,
   constraint PK_TAJETA_DE_DEBITO primary key (ID_TAJETA_DE_DEBITO)
);

/*==============================================================*/
/* Table: VENDOR                                                */
/*==============================================================*/
create table VENDOR (
   ID_VENDOR            VARCHAR(10)          not null,
   NOMBRE               VARCHAR(20)          not null,
   APELLIDOS            VARCHAR(30)          not null,
   NUMERO_DE_CAJA       VARCHAR(10)          null,
   CODIGO               VARCHAR(10)          not null,
   constraint PK_VENDOR primary key (ID_VENDOR)
);

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_DEPARTAM foreign key (ID_DEPTO)
      references DEPARTAMENTO (ID_DEPTO)
      on delete restrict on update restrict;

alter table CLIENTE_DIRECCIONES
   add constraint FK_CLIENTE_DIR_REF_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CLIENTE_EMAILS
   add constraint FK_CLIENTE_EMAILS_REF_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CLIENTE_REDES
   add constraint FK_CLIENTE_REDES_REF_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CLIENTE_TELEFONOS
   add constraint FK_CLIENTE_TEL_REF_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS)
      on delete restrict on update restrict;

alter table DROGUERIA
   add constraint FK_DROGUERI_REFERENCE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on delete restrict on update restrict;

alter table DROGUERIA
   add constraint FK_DROGUERI_REFERENCE_FORMA_DE foreign key (ID_FORMA_DE_PAGO)
      references FORMA_DE_PAGO (ID_FORMA_DE_PAGO)
      on delete restrict on update restrict;

alter table ELEMENTOS_DE_LINEA
   add constraint FK_ELEMENTO_REFERENCE_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_VENDOR foreign key (ID_VENDOR)
      references VENDOR (ID_VENDOR)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table FORMA_DE_PAGO
   add constraint FK_FORMA_DE_REFERENCE_TAJETA_D foreign key (ID_TAJETA_DE_DEBITO)
      references TAJETA_DE_DEBITO (ID_TAJETA_DE_DEBITO)
      on delete restrict on update restrict;

alter table FORMA_DE_PAGO
   add constraint FK_FORMA_DE_REFERENCE_EFECTIVO foreign key (ID_EFECTIVO)
      references EFECTIVO (ID_EFECTIVO)
      on delete restrict on update restrict;

alter table TAJETA_DE_CREDITO
   add constraint FK_TAJETA_D_REFERENCE_FORMA_DE foreign key (ID_FORMA_DE_PAGO)
      references FORMA_DE_PAGO (ID_FORMA_DE_PAGO)
      on delete restrict on update restrict;

