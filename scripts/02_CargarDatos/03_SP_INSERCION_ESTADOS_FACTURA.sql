--INSERCION ESTADOS DE FACTURA
--SIN VALIDAR REGLAS DE NEGOCIO
USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE DBO.PR_INSERCION_ESTADOS_FACTURA
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO DBO.ESTADO_FACTURA (
            COD_IDENTIFICADOR,
            DESCRIPCION,
            ESTADO
        )
        VALUES
        (
            'BOR',
            'Factura en borrador, puede agregar mas filas',
            'BORRADOR'
        ),
        (
            'EMI',
            'Factura emitida al cliente',
            'EMITIDA'
        ),
        (
            'PAG',
            'Factura pagada por el cliente',
            'PAGADA'
        ),
        (
            'CAN',
            'Factura cancelada',
            'CANCELADA'
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

EXEC DBO.PR_INSERCION_ESTADOS_FACTURA;
GO
