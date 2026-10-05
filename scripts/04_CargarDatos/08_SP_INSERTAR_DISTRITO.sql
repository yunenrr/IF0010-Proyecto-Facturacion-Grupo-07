USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE dbo.pr_InsertarDistrito
    @ID_DISTRITO INT,
    @Nombre VARCHAR(100),
    @ID_CANTON INT
AS
BEGIN
    SET XACT_ABORT ON;
    SET NOCOUNT ON;

    BEGIN TRY
        IF @ID_DISTRITO IS NULL
            THROW 53001, 'El ID del distrito es obligatorio.', 1;

        IF TRIM(@Nombre) = '' OR @Nombre IS NULL
            THROW 53002, 'El nombre del distrito es obligatorio.', 1;

        IF NOT EXISTS (SELECT 1 FROM CANTON WHERE ID_CANTON = @ID_CANTON)
            THROW 53003, 'El cantón indicado no existe.', 1;

        IF EXISTS (SELECT 1 FROM DISTRITO WHERE ID_DISTRITO = @ID_DISTRITO)
            THROW 53004, 'Ya existe un distrito con ese ID.', 1;

        INSERT INTO DISTRITO (ID_DISTRITO, NOMBRE, ID_CANTON)
        VALUES (@ID_DISTRITO, TRIM(@Nombre), @ID_CANTON);

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