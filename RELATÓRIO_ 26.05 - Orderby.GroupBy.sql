
---Monte uma consulta que liste o nome, bairro e cidade ordenando por ordem alfabética pelo nome do cliente.

SELECT NOME, BAIRRO, CIDADE FROM [TABELA DE CLIENTES]
ORDER BY NOME

--- Listar as notas vendidas e seus respectivos vendedores ordenados pelo bairro do vendedor 

SELECT NF.NUMERO AS 'Notas fiscais Vendas', INF.NOME AS 'Nome do Vendedor', INF.BAIRRO FROM [TABELA DE NOTAS FISCAIS]NF
INNER JOIN [TABELA DE VENDEDORES]INF
ON NF.MATRICULA = INF.MATRICULA
ORDER BY BAIRRO

--- Liste a menor venda pela Esquina de Suco para cada produto.

SELECT PR.[NOME DO PRODUTO],INF.[CODIGO DO PRODUTO], MIN(INF.QUANTIDADE * INF.PREÇO) AS 'Valor Mínimo de Venda' FROM [TABELA DE ITENS NOTAS FISCAIS]INF
INNER JOIN [TABELA DE PRODUTOS]PR
ON INF.[CODIGO DO PRODUTO] = PR.[CODIGO DO PRODUTO]
GROUP BY PR.[NOME DO PRODUTO],INF.[CODIGO DO PRODUTO]