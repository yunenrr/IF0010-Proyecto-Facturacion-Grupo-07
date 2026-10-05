-- CARGA MASIVA DE PRODUCTOS CON PROCEDIMIENTO ALMACENADO
USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE DBO.PR_INSERCION_MASIVA_PRODUCTOS
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        WITH NUMEROS AS (
            SELECT TOP (1000)
                ROW_NUMBER() OVER (
                    ORDER BY (SELECT NULL)
                ) AS NUMERO
            FROM SYS.ALL_OBJECTS AS A
            CROSS JOIN SYS.ALL_OBJECTS AS B
        )
        INSERT INTO DBO.PRODUCTOS (
            COD_INTERNO,
            DESCRIPCION,
            PRECIO_UNITARIO,
            PORCENTAJE_IMPUESTO,
            STOCK,
            ESTADO
        )
        SELECT
            'PROD'
            + RIGHT(
                '0000' + CAST(NUMEROS.NUMERO AS VARCHAR(4)),
                4
            ),
            'Producto de prueba '
            + CAST(NUMEROS.NUMERO AS VARCHAR(4)),
            CAST(
                500.00 + (NUMEROS.NUMERO * 100)
                AS DECIMAL(10, 2)
            ),
            13.00,
            100,
            1
        FROM NUMEROS
        WHERE NOT EXISTS (
            SELECT 1
            FROM DBO.PRODUCTOS AS P
            WHERE P.COD_INTERNO
                = 'PROD'
                + RIGHT(
                    '0000'
                    + CAST(NUMEROS.NUMERO AS VARCHAR(4)),
                    4
                )
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END;
GO
EXEC DBO.PR_INSERCION_MASIVA_PRODUCTOS;
GO