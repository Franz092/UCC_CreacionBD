/*==============================================================*/
/* Table: OFICINA                                               */
/*==============================================================*/
create table OFICINA (
   ID_OFICINA           VARCHAR(30)           not null,
   ID_RECOLECCION       VARCHAR(30),
   ID_CIUDAD            VARCHAR(3),
   NOMBRE               VARCHAR(50),
   DIRECCION            VARCHAR(50),
   REFERENCIA           VARCHAR(50),
   constraint PK_OFICINA primary key (ID_OFICINA)
);
INSERT INTO OFICINA( ID_OFICINA, ID_RECOLECCION, ID_CIUDAD, NOMBRE, DIRECCION, REFERENCIA)VALUES(901.245.789-2, 128IOSS, Let,Deprisa,Cra. 36a #10 - 170,Buen tiempo de entrega y estado de mercancia);
INSERT INTO OFICINA( ID_OFICINA, ID_RECOLECCION, ID_CIUDAD, NOMBRE, DIRECCION, REFERENCIA)VALUES(8605123303, 456PVA, Med,Servientrega S.a,Cra. 39 #32-1,Estado de mercancia buena);
INSERT INTO OFICINA( ID_OFICINA, ID_RECOLECCION, ID_CIUDAD, NOMBRE, DIRECCION, REFERENCIA)VALUES(900308342 – 2, 877VOEC, Ara,Grupo TCC,Cra. 23 # 25 - 32 ,Brinda tranquilidad y confianza as sus clientes);
INSERT INTO OFICINA( ID_OFICINA, ID_RECOLECCION, ID_CIUDAD, NOMBRE, DIRECCION, REFERENCIA)VALUES(8605026091, 907VCI, Bar,DHL,Cra. 5 #10 -17 Local 5 ,Buena atecion y confianza a sus clientes);
