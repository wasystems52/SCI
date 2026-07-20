CREATE TABLE autoria
(id INTEGER NOT NULL,
status VARCHAR(1),
marca VARCHAR(1),
data_inc DATE,
data_alt DATE,
data_hab DATE,
id_autor INTEGER NOT NULL,
id_livro VARCHAR(4) NOT NULL,
pdaut_livro DECIMAL(4,2) NOT NULL,
pdaut_autor DECIMAL(4,2) NOT NULL,
CONSTRAINT pk_Autoria PRIMARY KEY (id));
