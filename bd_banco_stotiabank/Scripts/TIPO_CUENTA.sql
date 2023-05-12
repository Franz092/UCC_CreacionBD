/*==============================================================*/
/* Table: TIPO_CUENTA                                           */
/*==============================================================*/
create table TIPO_CUENTA (
   ID_TIPO_CUENTA       VARCHAR(2)            not null,
   TIPO_CUENTA          VARCHAR(20)           not null,
   constraint PK_TIPO_CUENTA primary key (ID_TIPO_CUENTA)
);

INSERT INTO TipoCuenta (id_tipo_cuente, tipo_cuenta) VALUES (1, 'ahorros');
INSERT INTO TipoCuenta (id_tipo_cuenta, tipo_cuenta) VALUES (2, 'corriente');
INSERT INTO TipoCuenta (id_tipo_cuenta, tipo_cuenta) VALUES (3, 'cuenta CDT');

