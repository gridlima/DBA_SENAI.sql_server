
--- Na empresa Esquina dos Sucos temos 3 categorias de produtos: Garrafas, Lata ou PET. 
--- Imagine que, pela legisla��o, o imposto pago depende do tipo de embalagem do produto e,
--- a cada momento, ele muda. Temos o campo IMPOSTO na tabela de notas fiscais, que determina o 
--- imposto a ser pago (al�quota sobre o faturamento). 
---Fa�a uma stored procedure que ter� como entrada de dados a figura abaixo.

-- M�s 
-- Aliquota
-- Produto
-- Tipo de Produto (GARRAFAS, LATA OU PET)
 
---Ela ir� modificar a al�quota para a al�quota informada na entrada da stored procedure, 
---para as vendas de todas as notas fiscais no m�s/ano informados, para todos os produtos do tipo informado.
---Nome da stored procedure: AtualizaImposto.



SELECT * FROM [TABELA DE NOTAS FISCAIS]

SELECT * FROM [TABELA DE ITENS NOTAS FISCAIS]

-- ANALISE 1
SELECT * FROM [TABELA DE NOTAS FISCAIS]NF
INNER JOIN [TABELA DE ITENS NOTAS FISCAIS]INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN [TABELA DE PRODUTOS]TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]

SELECT * FROM [TABELA DE PRODUTOS]

--ANALISE 2
SELECT * FROM [TABELA DE NOTAS FISCAIS]NF
INNER JOIN [TABELA DE ITENS NOTAS FISCAIS]INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN [TABELA DE PRODUTOS]TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
WHERE MONTH(NF.DATA) = 1 AND YEAR(NF.DATA) = 2015 AND TP.EMBALAGEM = 'Lata'
 
---ANALISE 3 -- N�O EXECUTAR
UPDATE NF
SET NF.IMPOSTO = 0.18
FROM [TABELA DE NOTAS FISCAIS]NF
INNER JOIN [TABELA DE ITENS NOTAS FISCAIS]INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN [TABELA DE PRODUTOS]TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
WHERE MONTH(NF.DATA) = 1 AND YEAR(NF.DATA) = 2015 AND TP.EMBALAGEM = 'Lata'


--PROCEDURE---
CREATE PROCEDURE AtualizaImposto 
@MES INT, @ANO INT, @EMBALAGEM VARCHAR (10), @IMPOSTO FLOAT
AS
	UPDATE NF
	SET NF.IMPOSTO = IMPOSTO
	FROM [TABELA DE NOTAS FISCAIS]NF
	INNER JOIN [TABELA DE ITENS NOTAS FISCAIS]INF
	ON NF.NUMERO = INF.NUMERO
	INNER JOIN [TABELA DE PRODUTOS]TP
	ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
	WHERE MONTH(NF.DATA) = @MES AND YEAR(NF.DATA) = @ANO AND TP.EMBALAGEM = @EMBALAGEM

EXEC AtualizaImposto @MES=2, @ANO=2017, @EMBALAGEM='LATA', @IMPOSTO=0.16

SELECT TP.EMBALAGEM,NF.DATA, NF.IMPOSTO FROM [TABELA DE NOTAS FISCAIS]NF
INNER JOIN [TABELA DE ITENS NOTAS FISCAIS]INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN [TABELA DE PRODUTOS]TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
WHERE MONTH(NF.DATA) = 2 AND YEAR (NF.DATA) = 2017 AND TP.EMBALAGEM = 'LATA'

