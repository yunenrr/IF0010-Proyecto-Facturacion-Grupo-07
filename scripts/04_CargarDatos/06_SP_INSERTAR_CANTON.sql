USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE dbo.pr_InsertarCanton
    @ID_CANTON INT,
    @Nombre VARCHAR(100),
    @ID_PROVINCIA INT
AS
BEGIN
    SET XACT_ABORT ON;
    SET NOCOUNT ON;

    BEGIN TRY
        IF @ID_CANTON IS NULL
            THROW 52001, 'El ID del cantón es obligatorio.', 1;

        IF TRIM(@Nombre) = '' OR @Nombre IS NULL
            THROW 52002, 'El nombre del cantón es obligatorio.', 1;

        IF NOT EXISTS (SELECT 1 FROM PROVINCIA WHERE ID_PROVINCIA = @ID_PROVINCIA)
            THROW 52003, 'La provincia indicada no existe.', 1;

        IF EXISTS (SELECT 1 FROM CANTON WHERE ID_CANTON = @ID_CANTON)
            THROW 52004, 'Ya existe un cantón con ese ID.', 1;

        INSERT INTO CANTON (ID_CANTON, NOMBRE, ID_PROVINCIA)
        VALUES (@ID_CANTON, TRIM(@Nombre), @ID_PROVINCIA);

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