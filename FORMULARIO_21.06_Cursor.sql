

CREATE PROCEDURE CriarNotaFiscal
@DATA DATE
AS
	BEGIN
		DECLARE @cliente varchar(20),@vendedor varchar(20), @produto varchar(20), @numero int,
		@imposto float, @quantidade int, @preço float, @numero_itens int, @contador int, @aux_produto int
		DECLARE @lista_produtos TABLE (produto varchar(20))
		SET @cliente = [dbo].[EntidadeAleatoria]('Cliente')
		SET @vendedor = [dbo].[EntidadeAleatoria]('Vendedor')
		SELECT @numero = MAX(CONVERT(INT,NUMERO)) + 1 FROM [TABELA DE NOTAS FISCAIS]
		SET @imposto = 0.18
		SET @numero_itens = [dbo].[NumeroAleatorio] (2,10)
		SET @contador = 1

		INSERT INTO [TABELA DE NOTAS FISCAIS] (CPF,MATRICULA,DATA,NUMERO,IMPOSTO)
		VALUES (@cliente,@vendedor,@DATA,CONVERT(VARCHAR,@numero),@imposto)
		WHILE @contador <= @numero_itens
			BEGIN
					SET @produto = [dbo].[EntidadeAleatoria]('Produto')
					SELECT @aux_produto = COUNT (*) FROM @lista_produtos WHERE produto = @produto
					IF (@aux_produto = 0)
						BEGIN
								SET @quantidade = [dbo].[NumeroAleatorio](5,100)
								SELECT @preço = [PRECO DE LISTA] FROM [TABELA DE PRODUTOS]
								WHERE [CODIGO DO PRODUTO] = @produto
								INSERT INTO [TABELA DE ITENS NOTAS FISCAIS] (NUMERO,[CODIGO DO PRODUTO],QUANTIDADE,PREÇO)
								VALUES (@numero,@produto,@quantidade,@preço)
								SET @contador = @contador + 1

						END

					INSERT INTO @lista_produtos (produto) VALUES (@produto)


			END



	END

EXEC CriarNotaFiscal '20160624'