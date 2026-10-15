USE LojaMusical;
GO

-- visualizar todos os clientes
SELECT *
FROM Clientes;

-- visualizar nome e cidade
SELECT nome, cidade
FROM Clientes;

-- contar o total de clientes
SELECT COUNT(*) AS total_clientes
FROM Clientes;
