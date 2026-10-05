-- Insert de monedas sin validar reglas de negocio
USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE DBO.PR_INSERCION_MONEDAS
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO DBO.MONEDAS (
            COD_IDENTIFICADOR,
            DESCRIPCION,
            SIMBOLO
        )
        VALUES
            ('CRC', 'Colon costarricense', NCHAR(8353)),
            ('USD', 'Dolar estadounidense', N'$'),
            ('EUR', 'Euro', NCHAR(8364)),
            ('MXN', 'Peso mexicano', N'$');

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END;
GO
EXEC DBO.PR_INSERCION_MONEDAS;
GO
