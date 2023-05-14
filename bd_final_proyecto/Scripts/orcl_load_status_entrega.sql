/*==============================================================*/
/* Table: STATUS_ENTREGA                                        */
/*==============================================================*/
create table STATUS_ENTREGA (
   ID_STATUS            VARCHAR(50)           not null,
   RECIBIDO             VARCHAR(50),
   RECEPTOR             VARCHAR(50),
   FECHA                TIMESTAMP WITH LOCAL TIME ZONE,
   constraint PK_STATUS_ENTREGA primary key (ID_STATUS)
);

INSERT INTO STATUS_ENTREGA(ID_STATUST_ENTREGA, RECEBIDO, RECEPTOR, FECHA)VALUES(7873, SI,Juliana Alvarez,43598);
INSERT INTO STATUS_ENTREGA(ID_STATUST_ENTREGA, RECEBIDO, RECEPTOR, FECHA)VALUES(9982, NO,Yulian Caicedo,40033);
INSERT INTO STATUS_ENTREGA(ID_STATUST_ENTREGA, RECEBIDO, RECEPTOR, FECHA)VALUES(5556, NO,Juan Castillo,44193);
INSERT INTO STATUS_ENTREGA(ID_STATUST_ENTREGA, RECEBIDO, RECEPTOR, FECHA)VALUES(3335, SI,Carlos Barreiro,41305);

