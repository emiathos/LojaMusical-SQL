USE LojaMusical;
GO

CREATE TABLE Produtos (
    id_produto INT IDENTITY(1,1) PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);
GO
