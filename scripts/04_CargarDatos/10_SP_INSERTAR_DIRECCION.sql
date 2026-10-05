USE SISTEMADEFACTURACION;
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE name = 'pr_InsertarDireccion' AND type = 'P')
BEGIN
    DROP PROCEDURE dbo.pr_InsertarDireccion;
END;
GO

CREATE OR ALTER PROCEDURE dbo.pr_InsertarDireccion
    @DireccionExacta VARCHAR(255),
    @IdDistrito INT,
    @IdDireccionGenerado INT OUTPUT
AS
BEGIN
    SET XACT_ABORT ON;
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO DIRECCION (DIRECCION_EXACTA, ID_DISTRITO)
        VALUES (TRIM(@DireccionExacta), @IdDistrito);

        SET @IdDireccionGenerado = SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        IF @ErrorSeverity < 16 SET @ErrorSeverity = 16;
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
        RETURN -1;
    END CATCH;

    RETURN 0;
END;
GO
