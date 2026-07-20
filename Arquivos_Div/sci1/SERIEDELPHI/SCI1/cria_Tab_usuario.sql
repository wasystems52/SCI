CREATE TABLE usuario
(
id INTEGER NOT NULL,
status VARCHAR(1),
marca VARCHAR(1),
data_inc DATE,
data_alt DATE,
data_hab DATE,
senha CHAR(7),
nome VARCHAR(30),
fantasia VARCHAR(15),
dpto VARCHAR(20),
nivel CHAR(1),
CONSTRAINT pk_usuario PRIMARY KEY (id)
);
