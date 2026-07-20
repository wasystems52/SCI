CREATE TABLE transp
(
id INTEGER NOT NULL,
status VARCHAR(1),
marca VARCHAR(1),
data_inc DATE,
data_alt DATE,
data_hab DATE,
nome D_NOME NOT NULL,
nome_fant VARCHAR(50),
tiprua D_TIPRUA,
titrua D_TITRUA,
nomerua D_NOMERUA NOT NULL,
numrua D_NUMRUA NOT NULL,
bairro D_BAIRRO,
cidade D_CIDADE NOT NULL,
id_uf VARCHAR(2) NOT NULL,
cep VARCHAR(9) NOT NULL,
ddd D_DDD,
telefone D_FONE,
ramal D_RAMAL,
fax D_FONE,
contato VARCHAR(30),
cgc D_CPFCGC,
ie D_RGIE,
email D_EMAIL,
blemail CHAR(1),
www VARCHAR(60),
CONSTRAINT pk_transp primary key (id),
CONSTRAINT pk_transp_uf FOREIGN KEY (id_uf) REFERENCES uf (id) ON UPDATE CASCADE
);
CREATE INDEX nome_tranp ON transp(nome);
CREATE INDEX nomerua_transp ON transp(nomerua);
CREATE INDEX cep_transp ON transp(cep);


