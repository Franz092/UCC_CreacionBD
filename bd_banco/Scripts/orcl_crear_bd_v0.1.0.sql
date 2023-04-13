/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     05/04/2023 19:30:06                          */
/*==============================================================*/




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
/* Table: CLASE_PRODUCTO                                        */
/*==============================================================*/
create table CLASE_PRODUCTO (
   ID_CLASE_PRODUCTO    VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_CLASE_PR check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CLASE_PRODUCTO primary key (ID_CLASE_PRODUCTO)
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
/* Table: CUENTA                                                */
/*==============================================================*/
create table CUENTA (
   ID_CUENTA            NUMBER(15)            not null,
   ID_TIPO_CUENTA       VARCHAR(2)            not null,
   ID_PAIS              VARCHAR(3)            not null,
   ID_TIPO_USUARIO      VARCHAR(2)            not null,
   CUE_ID_TIPO_USUARIO  VARCHAR(2)            not null,
   MON_ID_TIPO_USUARIO  VARCHAR(3)            not null,
   FECHA_APERTURA       TIMESTAMP WITH LOCAL TIME ZONE  not null,
   DESCRIPCION          CHAR(10),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE  not null,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE,
   ID_USUARIO_LOG       VARCHAR(5)            not null,
   constraint PK_CUENTA primary key (ID_CUENTA)
);

/*==============================================================*/
/* Table: CUENTA_CLIENTES                                       */
/*==============================================================*/
create table CUENTA_CLIENTES (
   ID_CUENTA_CLIENTES   CHAR(10)              not null,
   ID_CUENTA            NUMBER(15)            not null,
   FECHA                TIMESTAMP WITH TIME ZONE,
   constraint PK_CUENTA_CLIENTES primary key (ID_CUENTA_CLIENTES, ID_CUENTA)
);

/*==============================================================*/
/* Table: CUENTA_CONTROL                                        */
/*==============================================================*/
create table CUENTA_CONTROL (
   ID_CUENTA_MOV_CONTROL NUMBER(5)             not null,
   FECHA                TIMESTAMP WITH TIME ZONE,
   constraint PK_CUENTA_CONTROL primary key (ID_CUENTA_MOV_CONTROL)
);

comment on table CUENTA_CONTROL is
'CONTROL NUMERACION';

/*==============================================================*/
/* Table: CUENTA_ESTADO                                         */
/*==============================================================*/
create table CUENTA_ESTADO (
   ID_TIPO_USUARIO      VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_CUENTA_E check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CUENTA_ESTADO primary key (ID_TIPO_USUARIO)
);

/*==============================================================*/
/* Table: CUENTA_MOVIMIENTO                                     */
/*==============================================================*/
create table CUENTA_MOVIMIENTO (
   ID_CUENTA_MOVIMIENTO NUMBER(30)            not null,
   ID_CUENTA_CONTROL    NUMBER(5)             not null,
   ID_CUENTA            NUMBER(15)            not null,
   VALOR                NUMBER(15,2)          not null,
   constraint PK_CUENTA_MOVIMIENTO primary key (ID_CUENTA_MOVIMIENTO, ID_CUENTA_CONTROL)
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
/* Table: DEPOSITO                                              */
/*==============================================================*/
create table DEPOSITO (
   ID_TIPO_USUARIO      VARCHAR(3)            not null,
   ID_CUENTA_CLIENTES   CHAR(10),
   ID_CUENTA            NUMBER(15),
   ID_CLASE_PRODUCTO    VARCHAR(2),
   ID_DEPOSITO          NUMBER(10)            not null,
   FECHA                TIMESTAMP WITH LOCAL TIME ZONE,
   CANTIDAD             FLOAT(200),
   constraint PK_DEPOSITO primary key (ID_TIPO_USUARIO)
);

/*==============================================================*/
/* Table: MONEDA                                                */
/*==============================================================*/
create table MONEDA (
   ID_TIPO_USUARIO      VARCHAR(3)            not null,
   ID_PAIS              VARCHAR(3),
   NOMBRE               VARCHAR(20)           not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_MONEDA check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_MONEDA primary key (ID_TIPO_USUARIO)
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
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          CHAR(10)              not null,
   ID_CLASE_PRODUCTO    VARCHAR(2),
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
/* Table: RETIRO                                                */
/*==============================================================*/
create table RETIRO (
   ID_CUENTA            NUMBER(15)            not null,
   ID_TIPO_USUARIO      VARCHAR(3)            not null,
   ID_RETIRO            NUMBER(10)            not null,
   FECHA                TIMESTAMP WITH LOCAL TIME ZONE,
   CANTIDAD             FLOAT(200),
   constraint PK_RETIRO primary key (ID_CUENTA)
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
/* Table: TIPO_CUENTA                                           */
/*==============================================================*/
create table TIPO_CUENTA (
   ID_TIPO_CUENTA       VARCHAR(2)            not null,
   ID_CLASE_PRODUCTO    VARCHAR(2),
   NOMBRE               VARCHAR(20)           not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_TIPO_CUE check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint AK_KEY_2_TIPO_CUE unique (ID_TIPO_CUENTA)
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
/* Table: TIPO_EMBARGO                                          */
/*==============================================================*/
create table TIPO_EMBARGO (
   ID_TIPO_USUARIO      VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_TIPO_EMB check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_TIPO_EMBARGO primary key (ID_TIPO_USUARIO)
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
/* Table: TRANSACCION                                           */
/*==============================================================*/
create table TRANSACCION (
   ID_CLIENTE           NUMBER(20)            not null,
   ID_CUENTA            NUMBER(15)            not null,
   ID_TRANSACCION       FLOAT(200)            not null,
   NUMERO_CUENTA        NUMBER(10),
   FECHA_TRANSACION     TIMESTAMP WITH TIME ZONE  not null,
   CUENTA_DESTINO       NUMBER(10),
   MONTO                FLOAT(200)            not null,
   constraint PK_TRANSACCION primary key (ID_CLIENTE, ID_CUENTA, ID_TRANSACCION)
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

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_TIPO_CUE foreign key (ID_TIPO_CUENTA)
      references TIPO_CUENTA (ID_TIPO_CUENTA);

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_TIPO_EMB foreign key (ID_TIPO_USUARIO)
      references TIPO_EMBARGO (ID_TIPO_USUARIO);

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_CUENTA_E foreign key (CUE_ID_TIPO_USUARIO)
      references CUENTA_ESTADO (ID_TIPO_USUARIO);

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_MONEDA foreign key (MON_ID_TIPO_USUARIO)
      references MONEDA (ID_TIPO_USUARIO);

alter table CUENTA_CLIENTES
   add constraint FK_CUENTA_C_REFERENCE_CUENTA foreign key (ID_CUENTA)
      references CUENTA (ID_CUENTA);

alter table CUENTA_MOVIMIENTO
   add constraint FK_CUENTA_M_REFERENCE_CUENTA_C foreign key (ID_CUENTA_CONTROL)
      references CUENTA_CONTROL (ID_CUENTA_MOV_CONTROL);

alter table CUENTA_MOVIMIENTO
   add constraint FK_CUENTA_M_REFERENCE_CUENTA foreign key (ID_CUENTA)
      references CUENTA (ID_CUENTA);

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table DEPOSITO
   add constraint FK_DEPOSITO_REFERENCE_CUENTA_C foreign key (ID_CUENTA_CLIENTES, ID_CUENTA)
      references CUENTA_CLIENTES (ID_CUENTA_CLIENTES, ID_CUENTA);

alter table DEPOSITO
   add constraint FK_DEPOSITO_REFERENCE_CLASE_PR foreign key (ID_CLASE_PRODUCTO)
      references CLASE_PRODUCTO (ID_CLASE_PRODUCTO);

alter table MONEDA
   add constraint FK_MONEDA_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table PRODUCTO
   add constraint FK_PRODUCTO_REFERENCE_CLASE_PR foreign key (ID_CLASE_PRODUCTO)
      references CLASE_PRODUCTO (ID_CLASE_PRODUCTO);

alter table RETIRO
   add constraint FK_RETIRO_REFERENCE_CUENTA foreign key (ID_CUENTA)
      references CUENTA (ID_CUENTA);

alter table RETIRO
   add constraint FK_RETIRO_REFERENCE_MONEDA foreign key (ID_TIPO_USUARIO)
      references MONEDA (ID_TIPO_USUARIO);

alter table TIPO_CUENTA
   add constraint FK_TIPO_CUE_REFERENCE_CLASE_PR foreign key (ID_CLASE_PRODUCTO)
      references CLASE_PRODUCTO (ID_CLASE_PRODUCTO);

alter table TRANSACCION
   add constraint FK_TRANSACC_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table TRANSACCION
   add constraint FK_TRANSACC_REFERENCE_CUENTA foreign key (ID_CUENTA)
      references CUENTA (ID_CUENTA);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_ALG foreign key (ID_TIPO_ALGORITMO)
      references TIPO_ALGORITMO (ID_TIPO_ALGORITMO);

