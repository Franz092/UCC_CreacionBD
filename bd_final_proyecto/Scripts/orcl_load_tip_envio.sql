/*==============================================================*/
/* Table: TIP_ENVIO                                             */
/*==============================================================*/
create table TIP_ENVIO (
   ID_TIP_ENV           VARCHAR(50)           not null,
   DESCRIPCION          VARCHAR(50),
   constraint PK_TIP_ENVIO primary key (ID_TIP_ENV)
);


INSERT INTO TIP_ENVIO(ID_TIP_ENVIO, DESCRIPCION)VALUES(56864,Entrega rapida);
INSERT INTO TIP_ENVIO(ID_TIP_ENVIO, DESCRIPCION)VALUES(34216,Contra rembolso);
INSERT INTO TIP_ENVIO(ID_TIP_ENVIO, DESCRIPCION)VALUES(90876,Urgente);
INSERT INTO TIP_ENVIO(ID_TIP_ENVIO, DESCRIPCION)VALUES(96467,Domicilio);
