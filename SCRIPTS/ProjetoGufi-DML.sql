-- DML

USE GUFI_TARDE;
GO

INSERT INTO TIPOUSUARIO (tituloTipoUsuario)
VALUES ('ADMINISTRADOR'), ('COMUM');
GO

INSERT INTO USUARIO (idTipoUsuario, nomeUsuario, email, senha)
VALUES (1, 'Administrador', 'adm@adm.com', 'adm12345');
GO

-- COMANDO PARA ZERAR OS ID's DAS TABELAS
-- TRUNCATE TABLE USUARIO

INSERT INTO USUARIO (idTipoUsuario, nomeUsuario, email, senha)
VALUES (2, 'Saulo', 'saulo@email.com', 'SAULO12345'),
		(2, 'Lucas', 'lucas@email.com', 'LUCAS12345');
GO

INSERT INTO INSTITUICAO (CNPJ, nomeFantasia, endereco)
VALUES ('99999999999999', 'Escola SENAI de Informática', 'Al. Barão de Limeira, 539');
GO

INSERT INTO TIPOEVENTO (tituloTipoEvento)
VALUES ('C#'), ('REACTJS'), ('SQL');
GO

INSERT INTO EVENTO (idTipoEvento, idInstituicao, nomeEvento, descricao, dataEvento, acessoLivre)
VALUES (1, 1, 'ORIENTAÇÃO A OBJETOS', 'Conceitos sobre os pilares da programação orientada a objetos', '18/08/2021 18:00',1),
	   (2, 1, 'CICLO DE VIDA','Como utilizar os ciclos de vida com a biblioteca ReactJs','19/08/2021 10:00',0);
GO

INSERT INTO SITUACAO (descricao)
VALUES ('APROVADA'), ('RECUSADA'), ('AGUARDANDO');
GO

INSERT INTO PRESENCA (idUsuario, idEvento, idSituacao)
VALUES (2, 1, 3), (3, 2, 1);
GO

-- TRUNCATE TABLE PRESENCA 
