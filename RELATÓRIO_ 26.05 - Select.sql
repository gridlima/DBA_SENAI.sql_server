

---Crie uma consulta que mostre o nome do vendedor, o n�mero da nota fiscal, o valor faturado da nota e quanto o vendedor
---ganhou de comiss�o para cada nota fiscal.

SELECT * FROM [TABELA DE VENDEDORES]
SELECT * FROM [TABELA DE NOTAS FISCAIS]
SELECT * FROM [TABELA DE PRODUTOS]
SELECT * FROM [TABELA DE ITENS NOTAS FISCAIS]

SELECT NF.NUMERO AS 'Notas fiscais Vendas', INF.NOME AS 'Nome do Vendedor', INF.BAIRRO FROM [TABELA DE NOTAS FISCAIS]NF
INNER JOIN [TABELA DE VENDEDORES]INF SELECT [TABELA DE VENDEDORES].MATRICULA, [TABELA DE VENDEDORES].NOME, COUNT(*) AS 'NOTA FISCAL POR VENDEDOR' 
FROM [TABELA DE VENDEDORES] 
INNER JOIN [TABELA DE NOTAS FISCAIS] 
ON [TABELA DE VENDEDORES].MATRICULA = [TABELA DE NOTAS FISCAIS].MATRICULA
GROUP BY [TABELA DE VENDEDORES].MATRICULA, [TABELA DE VENDEDORES].NOME
SELECT NUMERO AS 'NUMERO DA NF' FROM [TABELA DE ITENS NOTAS FISCAIS]
UNION ALL
SELECT NUMERO FROM [TABELA DE NOTAS FISCAIS]



SELECT NF.NUMERO AS 'Notas fiscais Vendas', INF.NOME AS 'Nome do Vendedor', INF.BAIRRO FROM [TABELA DE NOTAS FISCAIS]NF
INNER JOIN [TABELA DE VENDEDORES]INF
ON NF.MATRICULA = INF.MATRICULA
ORDER BY BAIRRO