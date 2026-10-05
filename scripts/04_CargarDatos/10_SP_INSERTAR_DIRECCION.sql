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
        IF TRIM(@DireccionExacta) = '' OR @DireccionExacta IS NULL
            THROW 54001, 'La dirección exacta es obligatoria.', 1;

        IF @IdDistrito IS NULL
            THROW 54002, 'Debe asociar un distrito válido a la dirección.', 1;

        IF NOT EXISTS (SELECT 1 FROM DISTRITO WHERE ID_DISTRITO = @IdDistrito)
            THROW 54003, 'El distrito especificado no existe.', 1;

        IF EXISTS (SELECT 1 FROM DIRECCION WHERE DIRECCION_EXACTA = @DireccionExacta AND ID_DISTRITO = @IdDistrito)
            THROW 54004, 'Ya existe una dirección idéntica registrada en este distrito.', 1;

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
