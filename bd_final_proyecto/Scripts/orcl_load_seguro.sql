/*==============================================================*/
/* Table: SEGURO                                                */
/*==============================================================*/
create table SEGURO (
   ID_SEGURO            VARCHAR(30)           not null,
   DESCRIPCION          VARCHAR(50),
   VALOR                DECIMAL(15,2),
   constraint PK_SEGURO primary key (ID_SEGURO)
);

INSERT INTO SEGURO(ID_SEGURO, DESCRIPCCION, VALOR)VALUES(675454, Poliza especifica, 300000);
INSERT INTO SEGURO(ID_SEGURO, DESCRIPCCION, VALOR)VALUES(454755, Prima, 150000);
INSERT INTO SEGURO(ID_SEGURO, DESCRIPCCION, VALOR)VALUES(674444, Deducible, 120000);
INSERT INTO SEGURO(ID_SEGURO, DESCRIPCCION, VALOR)VALUES(577733, Cobertura, 80000);
