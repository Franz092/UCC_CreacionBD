/*==============================================================*/
/* Table: RECOLECCION                                           */
/*==============================================================*/
create table RECOLECCION (
   ID_RECOLECCION       VARCHAR(30)           not null,
   DESCRIPCION          VARCHAR(50),
   constraint PK_RECOLECCION primary key (ID_RECOLECCION)
);


INSERT INTO RECOLECCION(ID_RECOLECCION, DESCRIPCION)VALUES(128IOSS, ventanilla única de importación);
INSERT INTO RECOLECCION(ID_RECOLECCION, DESCRIPCION)VALUES(456PVA, contabilidad de IVA aplazada);
INSERT INTO RECOLECCION(ID_RECOLECCION, DESCRIPCION)VALUES(877VOEC, IVA sobre comercio electrónico);
INSERT INTO RECOLECCION(ID_RECOLECCION, DESCRIPCION)VALUES(907VCI, Campo de edición de ID de cobro del proveedor);
