USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE dbo.pr_InsertarProvincia
    @ID_PROVINCIA INT,
    @Nombre VARCHAR(50)
AS
BEGIN
    SET XACT_ABORT ON;
    SET NOCOUNT ON;

    BEGIN TRY
        IF @ID_PROVINCIA IS NULL
            THROW 51001, 'El ID de la provincia es obligatorio.', 1;

        IF TRIM(@Nombre) = '' OR @Nombre IS NULL
            THROW 51002, 'El nombre de la provincia es obligatorio.', 1;

        IF EXISTS (SELECT 1 FROM PROVINCIA WHERE ID_PROVINCIA = @ID_PROVINCIA)
            THROW 51003, 'Ya existe una provincia con ese ID.', 1;

        INSERT INTO PROVINCIA (ID_PROVINCIA, NOMBRE)
        VALUES (@ID_PROVINCIA, TRIM(@Nombre));

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
