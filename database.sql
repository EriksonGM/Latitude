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

INSERT INTO Servico
values
    ('Facebook')
INSERT INTO Servico
values
    ('Twitter')
INSERT INTO Servico
values
    ('WhatsApp')
INSERT INTO Servico
values
    ('Telegram')
INSERT INTO Servico
values
    ('Skype')
GO

CREATE TABLE UtilizadorServico
(
    IdUtilizador UNIQUEIDENTIFIER NOT NULL REFERENCES Utilizador(IdUtilizador),
    IdServico UNIQUEIDENTIFIER NOT NULL REFERENCES Servico(IdServico),
    IsActivo BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (IdUtilizador,IdServico)
)

CREATE TABLE Interacao
(
    IdInteracao INT NOT NULL IDENTITY PRIMARY KEY,
    --Id
)