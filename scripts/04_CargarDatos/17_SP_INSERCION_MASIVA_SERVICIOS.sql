--SP INSERCION MASIVA DE SERVICIOS 
USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE DBO.PR_INSERCION_MASIVA_SERVICIOS
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        WITH N AS (
            SELECT TOP (1000)
                ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS N
            FROM SYS.ALL_OBJECTS A
            CROSS JOIN SYS.ALL_OBJECTS B
        )
        INSERT INTO DBO.SERVICIOS (
            COD_INTERNO,
            DESCRIPCION,
            PRECIO_UNITARIO,
            UNIDAD_MEDIDA,
            PORCENTAJE_IMPUESTO,
            ESTADO
        )
        SELECT
            'SERV' + RIGHT('0000' + CAST(N AS VARCHAR(4)), 4),
            'Servicio de prueba ' + CAST(N AS VARCHAR(4)),
            CAST(5000.00 + (N * 100) AS DECIMAL(10, 2)),
            'Unidad',
            13.00,
            1
        FROM N
        WHERE NOT EXISTS (
            SELECT 1
            FROM DBO.SERVICIOS S
            WHERE S.COD_INTERNO =
                'SERV' + RIGHT(
                    '0000' + CAST(N.N AS VARCHAR(4)),
                    4
                )
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END;
GO
EXEC DBO.PR_INSERCION_MASIVA_SERVICIOS;
GO
