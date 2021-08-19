-- DQL

USE GUFI_TARDE;
GO

-- LISTAR TODOS OS TIPOS DE USUARIO:
SELECT * FROM TIPOUSUARIO;
GO

-- LISTAR TODOS OS USUARIOS:
SELECT * FROM USUARIO;
GO

-- LISTAR TODAS AS INSTITUI��ES:
SELECT * FROM INSTITUICAO;
GO

-- LISTAR TODOS OS EVENTOS:
SELECT * FROM EVENTO;
GO

-- LISTAR OS TIPOS DE SITUA��O:
SELECT * FROM SITUACAO;
GO

-- LISTAR TODAS AS PRESEN�AS:
SELECT * FROM PRESENCA;
GO

-- SELECIONA OS DADOS DOS USU�RIOS, MOSTRANDO O TIPO DE USU�RIO:
SELECT 
U.idUsuario as ID, 
U.nomeUsuario 'Nome do Usu�rio', 
TU.tituloTipoUsuario [Tipo de Usu�rio] 
FROM USUARIO U
INNER JOIN TIPOUSUARIO TU
ON U.idTipoUsuario = TU.idTipoUsuario;
GO

-- SELECIONA OS DADOS DO EVENTO, DA INSTITUI��O E DOS TIPOS DE EVENTOS:
SELECT 
E.nomeEvento Evento,
I.nomeFantasia Institui��o,
TE.tituloTipoEvento [Tipo do Evento]
FROM EVENTO E
INNER JOIN INSTITUICAO I
ON E.idInstituicao = I.idInstituicao
INNER JOIN TIPOEVENTO TE
ON E.idTipoEvento = TE.idTipoEvento;
GO

-- SELECIONA OS DADOS DOS EVENTOS, DA INSTITUI��O, 
-- DOS TIPOS DE EVENTOS E DOS USU�RIOS 
-- E A SITUA��O DE PRESEN�A:
SELECT 
nomeUsuario [Nome do usu�rio],
TU.tituloTipoUsuario [Tipo do usu�rio],
U.email AS Email,
E.nomeEvento Evento,
E.dataEvento, CONVERT(VARCHAR(20), E.dataEvento,106) [Data do Evento],
TE.tituloTipoEvento 'Tipo do Evento',
I.nomeFantasia Institui��o,
S.descricao Situa��o,
E.acessoLivre
FROM USUARIO U
INNER JOIN PRESENCA P 
ON U.idUsuario = P.idUsuario
INNER JOIN EVENTO E 
ON P.idEvento = E.idEvento
INNER JOIN INSTITUICAO I 
ON E.idInstituicao = I.idInstituicao
JOIN TIPOEVENTO TE 
ON E.idTipoEvento = TE.idTipoEvento
INNER JOIN SITUACAO S 
ON P.idUsuario = S.idSituacao
INNER JOIN TIPOUSUARIO TU 
ON U.idTipoUsuario = TU.idTipoUsuario
GO

-- BUSCA UM USU�RIO POR MEIO DE SEU E-MAIL E SENHA:
SELECT nomeUsuario 'Nome do Usu�rio', email, senha FROM USUARIO
WHERE email = 'adm@adm.com' AND senha = 'adm12345'
GO