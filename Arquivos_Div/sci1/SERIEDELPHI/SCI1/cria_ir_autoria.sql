ALTER TABLE autoria
ADD CONSTRAINT fk_autoria_cliFor FOREIGN KEY (id_Autor) REFERENCES cliFor (id),
ADD CONSTRAINT fk_autoria_Livro FOREIGN KEY (id_Livro) REFERENCES Livros (id) ON UPDATE CASCADE;
