Create Database Latitude
go
Use Latitude
go

CREATE TABLE Utilizador
(
    IdUtilizador UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Nome VARCHAR(100) NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Senha VARCHAR(2500) NOT NULL,
    DataCriacao DATETIME NOT NULL DEFAULT GetDate(),
    UltimoLogin DATETIME,
    IsActivo BIT NOT NULL DEFAULT 1
)
GO

CREATE TABLE Servico
(
    IdServico UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    Nome VARCHAR(100) NOT NULL
)

INSERT INTO Servico (Nome) values ('Facebook')
INSERT INTO Servico (Nome) values ('Twitter')
INSERT INTO Servico (Nome) values ('WhatsApp')
INSERT INTO Servico (Nome) values ('Telegram')
INSERT INTO Servico (Nome) values ('Skype')
GO

CREATE TABLE UtilizadorServico
(
    IdUtilizador UNIQUEIDENTIFIER NOT NULL REFERENCES Utilizador(IdUtilizador),
    IdServico UNIQUEIDENTIFIER NOT NULL REFERENCES Servico(IdServico),
    IsActivo BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (IdUtilizador,IdServico)
)

Create Table EstadoInteracao
(
IdEstadoInteracao Int Not Null Primary Key,
Estado varchar(50) Not Null
)
go

Insert Into EstadoInteracao values (1,'Recebido')
Insert Into EstadoInteracao values (2,'Em cola')
Insert Into EstadoInteracao values (3,'Em atendimento')
Insert Into EstadoInteracao values (4,'Terminada')
Insert Into EstadoInteracao values (5,'Qualificada')
go

Create Table Tipificacao
(
	IdTipificacao Int Not Null Identity Primary Key,
	Valor varchar(50) Not Null,
	IsActivo bit not null default 1,
	IdPai Int References Tipificacao(IdTipificacao)
)

Create Table Contacto
(
	IdContacto UNIQUEIDENTIFIER NOT NULL Primary KEy Default NEWSEQUENTIALID(),
	Nome varchar(100),
	Facebook varchar(250),
	Twitter varchar(250),
	WhatsApp varchar(250),
	Telegram varchar(250),
	Skype varchar(250)
)

CREATE TABLE Interacao
(
    IdInteracao INT NOT NULL IDENTITY PRIMARY KEY,
    IdUtilizador UNIQUEIDENTIFIER REFERENCES Utilizador(IdUtilizador),
	IdServico UNIQUEIDENTIFIER NOT NULL REFERENCES Servico(IdServico),
	Contacto UNIQUEIDENTIFIER NOT NULL REFERENCES Contacto(IdContacto),
	IdEstadoInteracao INT NOT NULL References EstadoInteracao(IdEstadoInteracao),
	DataRegisto Datetime Not Null Default GetDate(),
	IdTipificacao Int References Tipificacao(IdTipificacao),
	Qualificacao Int
)

Create Table Mensagem
(
	IdMensagem Int Not Null Identity Primary Key,
	IdInteracao Int Not Null References Interacao (IdInteracao),
	DataEvento Datetime Not Null Default GetDate(),
	Texto varchar(max) Not Null,
	FoiInbound bit not Null
)