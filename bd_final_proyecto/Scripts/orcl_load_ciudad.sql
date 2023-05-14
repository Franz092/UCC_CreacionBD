/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            VARCHAR(3)            not null,
   ID_DEPTO             VARCHAR(2),
   ID_CODGIGO_POSTAL    VARCHAR(30),
   NOMBRE               VARCHAR(40),
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Let','Ama', 910001,'Leticia');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Med','Ant', 50001,'Medellín');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Ara','Ara', 810001,'Arauca');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Bar','Atl', 80001,'Barranquilla');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Bog','Bog', 110111,'Bogotá');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Car','Bol',  130003,'Cartagena de Indias');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Tun','Boy', 150001,'Tunja');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Man','Cal', 170001,'Manizales');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Flo','Caq', 180001,'Florencia');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Yop','Cas', 850001,'Yopal');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Pop','Cau', 190001,'Popayán');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Val','Ces', 200001,'Valledupar');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Qui','Cho', 270001,'Quibdó');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Mon','Cór', 230001,'Montería');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Bog','Cun', 110141,'Bogotá');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Iní','Gua', 940001,'Inírida');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('San','Gua', 950001,'San José del Guaviare');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Nei','Hui', 410001,'Neiva');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Rio','La ', 440001,'Riohacha');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('San','Mag', 470001,'Santa Marta');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Vil','Met', 500001,'Villavicencio');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Pas','Nar', 520001,'Pasto');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('San','Nor', 540001,'San José de Cúcuta');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Moc','Put', 860001,'Mocoa');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Arm','Qui', 630001,'Armenia');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Per','Ris', 600000,'Pereira');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('San','San', 880001,'San Andrés');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Buc','San', 680001,'Bucaramanga');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Sin','Suc', 250251,'Sincelejo');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Iba','Tol', 681012,'Ibagué');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Cal','Val', 760000,'Cali');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Mit','Vau', 970001,'Mitú');
INSERT INTO CIUDAD (ID_CIUDAD,ID_DEPTO, ID_CODIGO_POSTAL,  NOMBRE)VALUES ('Pue','Vic', 990001,'Puerto Carreño');
