-- DQL

USE GUFI_TARDE;
GO

-- LISTAR TODOS OS TIPOS DE USUARIO:
SELECT * FROM TIPOUSUARIO;
GO

-- LISTAR TODOS OS USUARIOS:
SELECT * FROM USUARIO;
GO

-- LISTAR TODAS AS INSTITUIÇÕES:
SELECT * FROM INSTITUICAO;
GO

-- LISTAR TODOS OS EVENTOS:
SELECT * FROM EVENTO;
GO

-- LISTAR OS TIPOS DE SITUAÇÃO:
SELECT * FROM SITUACAO;
GO

-- LISTAR TODAS AS PRESENÇAS:
SELECT * FROM PRESENCA;
GO

-- SELECIONA OS DADOS DOS USUÁRIOS, MOSTRANDO O TIPO DE USUÁRIO:
SELECT 
U.idUsuario as ID, 
U.nomeUsuario 'Nome do Usuário', 
TU.tituloTipoUsuario [Tipo de Usuário] 
FROM USUARIO U
INNER JOIN TIPOUSUARIO TU
ON U.idTipoUsuario = TU.idTipoUsuario;
GO

-- SELECIONA OS DADOS DO EVENTO, DA INSTITUIÇÃO E DOS TIPOS DE EVENTOS:
SELECT 
E.nomeEvento Evento,
I.nomeFantasia Instituição,
TE.tituloTipoEvento [Tipo do Evento]
FROM EVENTO E
INNER JOIN INSTITUICAO I
ON E.idInstituicao = I.idInstituicao
INNER JOIN TIPOEVENTO TE
ON E.idTipoEvento = TE.idTipoEvento;
GO

-- SELECIONA OS DADOS DOS EVENTOS, DA INSTITUIÇÃO, 
-- DOS TIPOS DE EVENTOS E DOS USUÁRIOS 
-- E A SITUAÇÃO DE PRESENÇA:
SELECT 
nomeUsuario [Nome do usuário],
TU.tituloTipoUsuario [Tipo do usuário],
U.email AS Email,
E.nomeEvento Evento,
E.dataEvento, CONVERT(VARCHAR(20), E.dataEvento,106) [Data do Evento],
TE.tituloTipoEvento 'Tipo do Evento',
I.nomeFantasia Instituição,
S.descricao Situação,
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

-- BUSCA UM USUÁRIO POR MEIO DE SEU E-MAIL E SENHA:
SELECT nomeUsuario 'Nome do Usuário', email, senha FROM USUARIO
WHERE email = 'adm@adm.com' AND senha = 'adm12345'
GO