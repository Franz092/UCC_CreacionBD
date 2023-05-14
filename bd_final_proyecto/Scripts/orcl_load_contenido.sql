/*==============================================================*/
/* Table: CONTENIDO                                             */
/*==============================================================*/
create table CONTENIDO (
   ID_CONTENIDO         VARCHAR(30)           not null,
   PESO                 DECIMAL,
   VOLUMEN              DECIMAL,
   CANTIDAD             DECIMAL,
   DESCRIPCION          VARCHAR(50),
   constraint PK_CONTENIDO primary key (ID_CONTENIDO)
);

INSERT INTO CONTENIDO(ID_CONTENIDO, PESO. VOLUMEN, CANTIDAD, DESCRIPCION)VALUES(56W83FG2652864, 50, 250, 4, masivo);
INSERT INTO CONTENIDO(ID_CONTENIDO, PESO. VOLUMEN, CANTIDAD, DESCRIPCION)VALUES(7643839GDT45674, 10, 50, 1, individual);
INSERT INTO CONTENIDO(ID_CONTENIDO, PESO. VOLUMEN, CANTIDAD, DESCRIPCION)VALUES(10675FRTO452637, 30, 150, 3, masivo);
INSERT INTO CONTENIDO(ID_CONTENIDO, PESO. VOLUMEN, CANTIDAD, DESCRIPCION)VALUES(5653ALU3527G780, 60, 300, 4, masivo);
