/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     12/05/2023 15:25:22                          */
/*==============================================================*/


drop table CALCULAR_TOTAL;

drop table CARTA_ENVIO;

drop table CIUDAD;

drop table CLIENTE;

drop table CODIGO_POSTAL;

drop table CONTENIDO;

drop table COSTOS;

drop table DEPARTAMENTO;

drop table DESTINO_DIRECCION;

drop table MENSAJERO;

drop table NO_ORDEN_RECOLECCION;

drop table OFICINA;

drop table ORIGEN_DIRECCION;

drop table PAIS;

drop table RASTREO;

drop table RECOLECCION;

drop table SEGURO;

drop table STATUS_ENTREGA;

drop table TELEFONO_CLIENTE;

drop table TIPO_DE_DOCUMENTO;

drop table TIP_ENVIO;

/*==============================================================*/
/* Table: CALCULAR_TOTAL                                        */
/*==============================================================*/
create table CALCULAR_TOTAL (
   ID_TOTAL             VARCHAR(10)          not null,
   ID_COSTOS            VARCHAR(15,2)        null,
   constraint PK_CALCULAR_TOTAL primary key (ID_TOTAL)
);

/*==============================================================*/
/* Table: CARTA_ENVIO                                           */
/*==============================================================*/
create table CARTA_ENVIO (
   ID_CARTA_ENV         VARCHAR(50)          not null,
   ID_CONTENIDO         VARCHAR(30)          null,
   ID_TIP_ENV           VARCHAR(50)          null,
   ID_RASTREO           VARCHAR(50)          null,
   ID_ORD_RECO          VARCHAR(30)          null,
   ID_STATUS            VARCHAR(50)          null,
   ID_MENSAJERO         VARCHAR(50)          null,
   ID_RECOLECCION       VARCHAR(30)          null,
   ID_OFICINA           VARCHAR(30)          null,
   ID_DESTINO_DIRECCION NUMERIC(15)          null,
   ID_TOTAL             VARCHAR(10)          null,
   ID_CLIENTE           VARCHAR(3)           null,
   VALOR_DECLARADO      DECIMAL(15,2)        null,
   FECHA_HORA           TIMESTAMP WITH TIME ZONE null,
   NO_GUIA              VARCHAR(50)          null,
   NO_RASTREO           VARCHAR(50)          null,
   OBSERVACIONES        VARCHAR(50)          null,
   constraint PK_CARTA_ENVIO primary key (ID_CARTA_ENV)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            VARCHAR(3)           not null,
   ID_DEPTO             VARCHAR(2)           null,
   ID_CODGIGO_POSTAL    VARCHAR(30)          null,
   NOMBRE               VARCHAR(40)          null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           VARCHAR(3)           not null,
   NOMBRE_CLIENTE       VARCHAR(40)          null,
   CORREO               VARCHAR(40)          null,
   N_IDENTIDAD          VARCHAR(20)          null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CODIGO_POSTAL                                         */
/*==============================================================*/
create table CODIGO_POSTAL (
   ID_CODGIGO_POSTAL    VARCHAR(30)          not null,
   DESCRIPCION          VARCHAR(50)          null,
   constraint PK_CODIGO_POSTAL primary key (ID_CODGIGO_POSTAL)
);

/*==============================================================*/
/* Table: CONTENIDO                                             */
/*==============================================================*/
create table CONTENIDO (
   ID_CONTENIDO         VARCHAR(30)          not null,
   PESO                 DECIMAL              null,
   VOLUMEN              DECIMAL              null,
   CANTIDAD             DECIMAL              null,
   DESCRIPCION          VARCHAR(50)          null,
   constraint PK_CONTENIDO primary key (ID_CONTENIDO)
);

/*==============================================================*/
/* Table: COSTOS                                                */
/*==============================================================*/
create table COSTOS (
   ID_COSTOS            VARCHAR(15,2)        not null,
   ID_SEGURO            VARCHAR(30)          null,
   FLETE                DECIMAL(15,2)        null,
   SERVICIO             DECIMAL(15,2)        null,
   SUBTOTAL             DECIMAL(15,2)        null,
   constraint PK_COSTOS primary key (ID_COSTOS)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   ID_DEPTO             VARCHAR(2)           not null,
   IS_PAIS              VARCHAR(2)           null,
   NOMBRE               VARCHAR(20)          not null,
   constraint PK_DEPARTAMENTO primary key (ID_DEPTO)
);

/*==============================================================*/
/* Table: DESTINO_DIRECCION                                     */
/*==============================================================*/
create table DESTINO_DIRECCION (
   ID_DESTINO_DIRECCION NUMERIC(15)          not null,
   ID_CODGIGO_POSTAL    VARCHAR(30)          null,
   ID_CIUDAD            VARCHAR(3)           not null,
   NOMBRE               VARCHAR(3)           null,
   VIA_PRINCIPAL        VARCHAR(20)          not null,
   NOMENCLATURA         VARCHAR(20)          not null,
   COMPLEMENTO          VARCHAR(20)          not null,
   constraint PK_DESTINO_DIRECCION primary key (ID_DESTINO_DIRECCION)
);

/*==============================================================*/
/* Table: MENSAJERO                                             */
/*==============================================================*/
create table MENSAJERO (
   ID_MENSAJERO         VARCHAR(50)          not null,
   ID_RECOLECCION       VARCHAR(30)          null,
   NOMBRE               VARCHAR(50)          null,
   NUMERO               VARCHAR(50)          null,
   DOCUMENTO            VARCHAR(50)          null,
   constraint PK_MENSAJERO primary key (ID_MENSAJERO)
);

/*==============================================================*/
/* Table: NO_ORDEN_RECOLECCION                                  */
/*==============================================================*/
create table NO_ORDEN_RECOLECCION (
   ID_ORD_RECO          VARCHAR(30)          not null,
   constraint PK_NO_ORDEN_RECOLECCION primary key (ID_ORD_RECO)
);

/*==============================================================*/
/* Table: OFICINA                                               */
/*==============================================================*/
create table OFICINA (
   ID_OFICINA           VARCHAR(30)          not null,
   ID_RECOLECCION       VARCHAR(30)          null,
   ID_CIUDAD            VARCHAR(3)           null,
   NOMBRE               VARCHAR(50)          null,
   DIRECCION            VARCHAR(50)          null,
   REFERENCIA           VARCHAR(50)          null,
   constraint PK_OFICINA primary key (ID_OFICINA)
);

/*==============================================================*/
/* Table: ORIGEN_DIRECCION                                      */
/*==============================================================*/
create table ORIGEN_DIRECCION (
   ID_ORIGEN_DIRECCION  NUMERIC(15)          not null,
   ID_CIUDAD            VARCHAR(3)           not null,
   ID_CLIENTE           VARCHAR(3)           null,
   ID_CODGIGO_POSTAL    VARCHAR(30)          null,
   VIA_PRINCIPAL        VARCHAR(20)          not null,
   NOMENCLATURA         VARCHAR(20)          not null,
   COMPLEMENTO          VARCHAR(20)          not null,
   constraint PK_ORIGEN_DIRECCION primary key (ID_ORIGEN_DIRECCION)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   IS_PAIS              VARCHAR(2)           not null,
   NOMBRE               VARCHAR(20)          null,
   CODIGO_TELEFONO      VARCHAR(20)          not null,
   constraint PK_PAIS primary key (IS_PAIS)
);

/*==============================================================*/
/* Table: RASTREO                                               */
/*==============================================================*/
create table RASTREO (
   ID_RASTREO           VARCHAR(50)          not null,
   constraint PK_RASTREO primary key (ID_RASTREO)
);

/*==============================================================*/
/* Table: RECOLECCION                                           */
/*==============================================================*/
create table RECOLECCION (
   ID_RECOLECCION       VARCHAR(30)          not null,
   DESCRIPCION          VARCHAR(50)          null,
   constraint PK_RECOLECCION primary key (ID_RECOLECCION)
);

/*==============================================================*/
/* Table: SEGURO                                                */
/*==============================================================*/
create table SEGURO (
   ID_SEGURO            VARCHAR(30)          not null,
   DESCRIPCION          VARCHAR(50)          null,
   VALOR                DECIMAL(15,2)        null,
   constraint PK_SEGURO primary key (ID_SEGURO)
);

/*==============================================================*/
/* Table: STATUS_ENTREGA                                        */
/*==============================================================*/
create table STATUS_ENTREGA (
   ID_STATUS            VARCHAR(50)          not null,
   RECIBIDO             VARCHAR(50)          null,
   RECEPTOR             VARCHAR(50)          null,
   FECHA                TIMESTAMP WITH LOCAL TIME ZONE null,
   constraint PK_STATUS_ENTREGA primary key (ID_STATUS)
);

/*==============================================================*/
/* Table: TELEFONO_CLIENTE                                      */
/*==============================================================*/
create table TELEFONO_CLIENTE (
   ID_TELEFONO_CLIENTE  VARCHAR(10)          not null,
   ID_CLIENTE           VARCHAR(3)           null,
   IS_PAIS              VARCHAR(2)           null,
   TELEFONO_            NUMERIC(30)          null,
   constraint PK_TELEFONO_CLIENTE primary key (ID_TELEFONO_CLIENTE)
);

/*==============================================================*/
/* Table: TIPO_DE_DOCUMENTO                                     */
/*==============================================================*/
create table TIPO_DE_DOCUMENTO (
   ID_TIPO_DOCUMENTO    VARCHAR(3)           not null,
   ID_CLIENTE           VARCHAR(3)           null,
   TIPO                 VARCHAR(20)          not null,
   constraint PK_TIPO_DE_DOCUMENTO primary key (ID_TIPO_DOCUMENTO)
);

/*==============================================================*/
/* Table: TIP_ENVIO                                             */
/*==============================================================*/
create table TIP_ENVIO (
   ID_TIP_ENV           VARCHAR(50)          not null,
   DESCRIPCION          VARCHAR(50)          null,
   constraint PK_TIP_ENVIO primary key (ID_TIP_ENV)
);

alter table CALCULAR_TOTAL
   add constraint FK_CALCULAR_REFERENCE_COSTOS foreign key (ID_COSTOS)
      references COSTOS (ID_COSTOS)
      on delete restrict on update restrict;

alter table CARTA_ENVIO
   add constraint FK_CARTA_EN_REFERENCE_CONTENID foreign key (ID_CONTENIDO)
      references CONTENIDO (ID_CONTENIDO)
      on delete restrict on update restrict;

alter table CARTA_ENVIO
   add constraint FK_CARTA_EN_REFERENCE_TIP_ENVI foreign key (ID_TIP_ENV)
      references TIP_ENVIO (ID_TIP_ENV)
      on delete restrict on update restrict;

alter table CARTA_ENVIO
   add constraint FK_CARTA_EN_REFERENCE_RASTREO foreign key (ID_RASTREO)
      references RASTREO (ID_RASTREO)
      on delete restrict on update restrict;

alter table CARTA_ENVIO
   add constraint FK_CARTA_EN_REFERENCE_NO_ORDEN foreign key (ID_ORD_RECO)
      references NO_ORDEN_RECOLECCION (ID_ORD_RECO)
      on delete restrict on update restrict;

alter table CARTA_ENVIO
   add constraint FK_CARTA_EN_REFERENCE_STATUS_E foreign key (ID_STATUS)
      references STATUS_ENTREGA (ID_STATUS)
      on delete restrict on update restrict;

alter table CARTA_ENVIO
   add constraint FK_CARTA_EN_REFERENCE_MENSAJER foreign key (ID_MENSAJERO)
      references MENSAJERO (ID_MENSAJERO)
      on delete restrict on update restrict;

alter table CARTA_ENVIO
   add constraint FK_CARTA_EN_REFERENCE_RECOLECC foreign key (ID_RECOLECCION)
      references RECOLECCION (ID_RECOLECCION)
      on delete restrict on update restrict;

alter table CARTA_ENVIO
   add constraint FK_CARTA_EN_REFERENCE_OFICINA foreign key (ID_OFICINA)
      references OFICINA (ID_OFICINA)
      on delete restrict on update restrict;

alter table CARTA_ENVIO
   add constraint FK_CARTA_EN_REFERENCE_DESTINO_ foreign key (ID_DESTINO_DIRECCION)
      references DESTINO_DIRECCION (ID_DESTINO_DIRECCION)
      on delete restrict on update restrict;

alter table CARTA_ENVIO
   add constraint FK_CARTA_EN_REFERENCE_CALCULAR foreign key (ID_TOTAL)
      references CALCULAR_TOTAL (ID_TOTAL)
      on delete restrict on update restrict;

alter table CARTA_ENVIO
   add constraint FK_CARTA_EN_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_DEPARTAM foreign key (ID_DEPTO)
      references DEPARTAMENTO (ID_DEPTO)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_CODIGO_P foreign key (ID_CODGIGO_POSTAL)
      references CODIGO_POSTAL (ID_CODGIGO_POSTAL)
      on delete restrict on update restrict;

alter table COSTOS
   add constraint FK_COSTOS_REFERENCE_SEGURO foreign key (ID_SEGURO)
      references SEGURO (ID_SEGURO)
      on delete restrict on update restrict;

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_REFERENCE_PAIS foreign key (IS_PAIS)
      references PAIS (IS_PAIS)
      on delete restrict on update restrict;

alter table DESTINO_DIRECCION
   add constraint FK_DESTINO__REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table DESTINO_DIRECCION
   add constraint FK_DESTINO__REFERENCE_CODIGO_P foreign key (ID_CODGIGO_POSTAL)
      references CODIGO_POSTAL (ID_CODGIGO_POSTAL)
      on delete restrict on update restrict;

alter table MENSAJERO
   add constraint FK_MENSAJER_REFERENCE_RECOLECC foreign key (ID_RECOLECCION)
      references RECOLECCION (ID_RECOLECCION)
      on delete restrict on update restrict;

alter table OFICINA
   add constraint FK_OFICINA_REFERENCE_RECOLECC foreign key (ID_RECOLECCION)
      references RECOLECCION (ID_RECOLECCION)
      on delete restrict on update restrict;

alter table OFICINA
   add constraint FK_OFICINA_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table ORIGEN_DIRECCION
   add constraint FK_ORIGEN_D_REFERENCE_CODIGO_P foreign key (ID_CODGIGO_POSTAL)
      references CODIGO_POSTAL (ID_CODGIGO_POSTAL)
      on delete restrict on update restrict;

alter table ORIGEN_DIRECCION
   add constraint FK_ORIGEN_D_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table ORIGEN_DIRECCION
   add constraint FK_ORIGEN_D_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table TELEFONO_CLIENTE
   add constraint FK_TELEFONO_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table TELEFONO_CLIENTE
   add constraint FK_TELEFONO_REFERENCE_PAIS foreign key (IS_PAIS)
      references PAIS (IS_PAIS)
      on delete restrict on update restrict;

alter table TIPO_DE_DOCUMENTO
   add constraint FK_TIPO_DE__REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

