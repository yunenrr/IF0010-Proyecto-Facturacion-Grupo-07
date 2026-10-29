USE SISTEMADEFACTURACION;
GO

DECLARE @CONTADOR INT = 1;
DECLARE @CEDULAGEN VARCHAR(20);
DECLARE @NOMBREGEN VARCHAR(100);
DECLARE @CORREOGEN VARCHAR(100);
DECLARE @TELEFONOGEN VARCHAR(20);
DECLARE @IDDIRECCIONVALIDO INT;
DECLARE @IDSALIDA INT;

SET NOCOUNT ON;

WHILE @CONTADOR <= 50000
    BEGIN
        SET @IDDIRECCIONVALIDO = @CONTADOR;

        SET
            @CEDULAGEN
            = '1-'
            + RIGHT(
                '0000'
                + CAST(
                    (@CONTADOR % 9000) + 1000
                    AS VARCHAR(10)
                ),
                4
            )
            + '-'
            + RIGHT(
                '0000' + CAST(@CONTADOR AS VARCHAR(10)),
                4
            );

        SET
            @NOMBREGEN
            = 'Cliente Pruebas S.A. '
            + CAST(@CONTADOR AS VARCHAR(10));

        SET
            @CORREOGEN
            = 'clienteprueba'
            + CAST(@CONTADOR AS VARCHAR(10))
            + '@facturacioncr.com';

        SET
            @TELEFONOGEN
            = '8'
            + RIGHT(
                '0000000'
                + CAST(
                    7000000 + @CONTADOR
                    AS VARCHAR(10)
                ),
                7
            );

        EXEC DBO.PR_MIGRARCLIENTES
            @CEDULA = @CEDULAGEN,
            @NOMBRERAZONSOCIAL = @NOMBREGEN,
            @CORREOELECTRONICO = @CORREOGEN,
            @TELEFONO = @TELEFONOGEN,
            @IDDIRECCION = @IDDIRECCIONVALIDO,
            @IDCLIENTEGENERADO = @IDSALIDA OUTPUT;

        SET @CONTADOR = @CONTADOR + 1;
    END;
GO
