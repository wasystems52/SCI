CREATE TABLE vendint
(
id INTEGER NOT NULL,
status VARCHAR(1),
marca VARCHAR(1),
data_inc DATE,
data_alt DATE,
data_hab DATE,
nome VARCHAR(15) NOT NULL,
ddd D_DDD,
telefone D_FONE,
ramal D_RAMAL,
cel D_FONE,
email D_EMAIL,
comis DECIMAL(4,2) NOT NULL,
CONSTRAINT pk_vendint primary key (id)
);
