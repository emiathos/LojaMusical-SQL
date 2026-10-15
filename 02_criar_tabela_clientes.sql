USE LojaMusical;
GO

CREATE TABLE Clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    cidade VARCHAR(80),
    data_cadastro DATE
);
GO
