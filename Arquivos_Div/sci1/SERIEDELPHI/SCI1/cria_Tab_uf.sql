CREATE TABLE uf
(
id VARCHAR(2) NOT NULL,
status VARCHAR(1),
marca VARCHAR(1),
data_inc DATE,
data_alt DATE,
data_hab DATE,
nomest VARCHAR(25) NOT NULL,
regiao VARCHAR(15) NOT NULL,
icm DECIMAL(2) NOT NULL,
CONSTRAINT pk_uf primary key (id)
);


