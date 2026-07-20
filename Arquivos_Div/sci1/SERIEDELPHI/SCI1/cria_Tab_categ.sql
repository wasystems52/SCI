CREATE TABLE categ
(
id VARCHAR(2) NOT NULL,
status VARCHAR(1),
marca VARCHAR(1),
data_inc DATE,
data_alt DATE,
data_hab DATE,
nome VARCHAR(25) NOT NULL,
grupo VARCHAR(25) NOT NULL,
CONSTRAINT pk_categ primary key (id)
);
