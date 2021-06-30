

--Na Aula 11 (Exemplos de Relat�rios) criamos um relat�rio chamado de
--Relat�rio de vendas v�lidas. Adapte este relat�rio gerando um script que
--baseado numa data (MES/ANO) e (CPF) podemos ter a seguinte
--mensagem abaixo:
			
-- O cliente �rica Carvalho n�o ultrapasssou o seu volume de compra nesse per�odo!
-- Nome: �rica Carvalho
-- Volume de Compras: 24500 Quantidade Comprada: 19086
-- MES/ANO: 12/2016

DECLARE @DATA DATE,@CPF VARCHAR(11), @NOME VARCHAR(100), @QTDCOMPRADA INT, @VOL FLOAT

SET @DATA = '20161201'
SET @CPF = '1471156710'

SELECT @NOME = NOME,@VOL = [VOLUME DE COMPRA] FROM [TABELA DE CLIENTES] WHERE CPF = @CPF

--PRINT @NOME
--PRINT @VOL
--PRINT @CPF
--PRINT @DATA

SELECT @QTDCOMPRADA = SUM (INF.QUANTIDADE) FROM [TABELA DE NOTAS FISCAIS] NF
INNER JOIN [TABELA DE ITENS NOTAS FISCAIS]INF
ON NF.NUMERO = INF.NUMERO
WHERE NF.CPF = @CPF AND SUBSTRING (CONVERT(VARCHAR,NF.DATA,103),4,12) = SUBSTRING (CONVERT(VARCHAR,@DATA,103),4,12)

IF @QTDCOMPRADA <= @VOL
	PRINT 'O cliente ' + @NOME + ' n�o ultrapasssou o seu volume de compra nesse per�odo!'
ELSE
	PRINT 'O cliente ' + @NOME + ' ultrapasssou o seu volume de compra nesse per�odo!'

PRINT 'Nome:' + @NOME
PRINT 'Volume de Compras: ' +CONVERT(VARCHAR,@VOL) + ' Quantidade Comprada: ' + CONVERT(VARCHAR,@QTDCOMPRADA)
PRINT 'MES/ANO: ' + SUBSTRING (CONVERT(VARCHAR,@DATA,103),4,12)



----- ALTERE O SCRIPT ABAIXO ( INFORMADO NO ENUNCIADO ) PARA INCLUIR O DIA E O N�MERO
----- DE NOTAS EM UMA TABELA ([TABELA NOTAS]). USE O QUE FOI APRENDIDO NA �LTIMA AULA.

DECLARE @DATA_INICIAL DATE
DECLARE @DATA_FINAL DATE
DECLARE @NUMNOTAS INT
SET @DATA_INICIAL = '20170101'
SET @DATA_FINAL = '20170110'

WHILE @DATA_INICIAL <= @DATA_FINAL
BEGIN
	SELECT @NUMNOTAS = COUNT(*) FROM [TABELA DE NOTAS FISCAIS]
	WHERE DATA = @DATA_FINAL

	INSERT INTO TABELANOTAS (DATA, NUMNOTAS) VALUES (@DATA_INICIAL, @NUMNOTAS)
	SELECT @DATA_INICIAL = DATEADD(DAY, 1, @DATA_INICIAL)

END


SELECT * FROM TABELANOTAS