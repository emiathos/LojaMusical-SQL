
USE LojaMusical;
GO
-- 1. CONSULTAS BÁSICAS — SELECT
-- 1.1: Consultar todas as colunas e todos os produtos
SELECT *
FROM Produtos;

-- 1.2: Selecionar somente as colunas desejadas
SELECT nome_produto, preco
FROM Produtos;
-- 1.3: Utilizar alias para renomear colunas no resultado
SELECT
    nome_produto AS Produto,
    preco AS Preco_Produto
FROM Produtos;
-- 1.4: Retornar somente uma quantidade limitada de registros
SELECT TOP 3 *
FROM Produtos;

-- 2. FILTROS — WHERE
-- 2.1: Produtos com preço superior a 500
SELECT *
FROM Produtos
WHERE preco > 500;

-- 2.2: Produtos com preço menor ou igual a 850
SELECT *
FROM Produtos
WHERE preco <= 850;

-- 2.3: Produtos de uma categoria específica
SELECT *
FROM Produtos
WHERE categoria = 'Cordas';

-- 2.4: Produtos que não pertencem a uma categoria
SELECT *
FROM Produtos
WHERE categoria <> 'Cordas';

-- 2.5: Combinar condições com AND
SELECT *
FROM Produtos
WHERE preco > 500 AND estoque > 5;

-- 2.6: Combinar alternativas com OR
SELECT *
FROM Produtos
WHERE categoria = 'Cordas'
   OR categoria = 'Efeitos';

-- 2.7: Negar uma condição com NOT
SELECT *
FROM Produtos
WHERE NOT categoria = 'Cordas';

-- 3. FILTROS AVANÇADOS

-- 3.1: Filtrar valores dentro de um intervalo
SELECT *
FROM Produtos
WHERE preco BETWEEN 400 AND 1300;

-- 3.2: Filtrar por uma lista de categorias
SELECT *
FROM Produtos
WHERE categoria IN ('Cordas', 'Efeitos');

-- 3.3: Buscar nomes que começam com uma palavra
SELECT *
FROM Produtos
WHERE nome_produto LIKE 'Guitarra%';

-- 3.4: Buscar nomes que contêm determinada palavra
SELECT *
FROM Produtos
WHERE nome_produto LIKE '%Amplificador%';

-- 3.5: Buscar produtos com estoque igual a zero
SELECT *
FROM Produtos
WHERE estoque = 0;

-- 3.6: Verificar categorias sem valor preenchido
SELECT *
FROM Produtos
WHERE categoria IS NULL;

-- 4. ORDENAÇÃO — ORDER BY

-- 4.1: Ordenar por preço do menor para o maior
SELECT *
FROM Produtos
ORDER BY preco ASC;

-- 4.2: Ordenar por preço do maior para o menor
SELECT *
FROM Produtos
ORDER BY preco DESC;

-- 4.3: Ordenar por categoria e depois por preço
SELECT *
FROM Produtos
ORDER BY categoria ASC, preco DESC;

-- 5. CÁLCULOS E EXPRESSÕES

-- 5.1: Calcular o valor total do estoque por produto
SELECT
    nome_produto,
    preco,
    estoque,
    preco * estoque AS valor_total_estoque
FROM Produtos;

-- 5.2: Simular um desconto de 10%
SELECT
    nome_produto,
    preco AS preco_original,
    preco * 0.90 AS preco_com_desconto
FROM Produtos;

-- 5.3: Aplicar uma classificação baseada no preço
SELECT
    nome_produto,
    preco,
    CASE
        WHEN preco >= 2000 THEN 'Premium'
        WHEN preco >= 800 THEN 'Intermediario'
        ELSE 'Economico'
    END AS faixa_preco
FROM Produtos;

--6. VALORES DISTINTOS — DISTINCT

-- 6.1: Listar as categorias sem repetição
SELECT DISTINCT categoria
FROM Produtos;

-- 7. FUNÇÕES DE AGREGAÇÃO

-- 7.1: Contar quantos produtos existem
SELECT COUNT(*) AS total_produtos
FROM Produtos;

-- 7.2: Calcular o valor médio dos produtos
SELECT AVG(preco) AS preco_medio
FROM Produtos;

-- 7.3: Encontrar o menor preço
SELECT MIN(preco) AS menor_preco
FROM Produtos;

-- 7.4: Encontrar o maior preço
SELECT MAX(preco) AS maior_preco
FROM Produtos;

-- 7.5: Somar os preços cadastrados
SELECT SUM(preco) AS soma_precos
FROM Produtos;

-- 7.6: Calcular o valor total estimado do estoque
SELECT SUM(preco * estoque) AS valor_total_estoque
FROM Produtos;

-- 8. AGRUPAMENTO — GROUP BY E HAVING

-- 8.1: Contar produtos por categoria
SELECT
    categoria,
    COUNT(*) AS quantidade_produtos
FROM Produtos
GROUP BY categoria;

-- 8.2: Calcular o preço médio por categoria
SELECT
    categoria,
    AVG(preco) AS preco_medio
FROM Produtos
GROUP BY categoria;

-- 8.3: Somar as unidades em estoque por categoria
SELECT
    categoria,
    SUM(estoque) AS total_unidades
FROM Produtos
GROUP BY categoria;

-- 8.4: Filtrar categorias com preço médio superior a 500
SELECT
    categoria,
    AVG(preco) AS preco_medio
FROM Produtos
GROUP BY categoria
HAVING AVG(preco) > 500;

  -- 9. SUBCONSULTAS — SUBQUERIES

-- 9.1: Encontrar produtos com preço acima da média geral
SELECT
    nome_produto,
    preco
FROM Produtos
WHERE preco > (
    SELECT AVG(preco)
    FROM Produtos
);

-- 9.2: Encontrar o produto mais caro
SELECT
    nome_produto,
    preco
FROM Produtos
WHERE preco = (
    SELECT MAX(preco)
    FROM Produtos
);

-- 10. PAGINAÇÃO DE RESULTADOS

-- 10.1: Retornar os dois produtos mais baratos
SELECT
    nome_produto,
    preco
FROM Produtos
ORDER BY preco ASC
OFFSET 0 ROWS
FETCH NEXT 2 ROWS ONLY;

-- 10.2: Pular os dois primeiros e retornar os próximos dois
SELECT
    nome_produto,
    preco
FROM Produtos
ORDER BY preco ASC
OFFSET 2 ROWS
FETCH NEXT 2 ROWS ONLY;
