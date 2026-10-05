-- Insercion de tipos de documento sin validar reglas de negocio
USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE DBO.PR_CARGA_TIPOS_DOCUMENTO
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO DBO.TIPO_DOCUMENTO (
            COD_IDENTIFICADOR,
            DESCRIPCION
        )
        VALUES
        ('FAC', 'Factura'),
        ('TIQ', 'Tiquete');

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END;
GO

EXEC DBO.PR_CARGA_TIPOS_DOCUMENTO;
GO
