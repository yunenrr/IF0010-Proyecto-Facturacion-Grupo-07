USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE DBO.PR_INSERTAR_CANTON
    @ID_CANTON INT,
    @NOMBRE VARCHAR(100),
    @ID_PROVINCIA INT
AS
BEGIN
    SET XACT_ABORT ON;
    SET NOCOUNT ON;

    BEGIN TRY
        IF @ID_CANTON IS NULL
            THROW 52001, 'El ID del cantón es obligatorio.', 1;

        IF TRIM(@NOMBRE) = '' OR @NOMBRE IS NULL
            THROW 52002, 'El nombre del cantón es obligatorio.', 1;

        IF
            NOT EXISTS (
                SELECT 1
                FROM PROVINCIA
                WHERE ID_PROVINCIA = @ID_PROVINCIA
            )
                THROW 52003, 'La provincia indicada no existe.', 1;

        IF
            EXISTS (
                SELECT 1
                FROM CANTON
                WHERE ID_CANTON = @ID_CANTON
            )
                THROW 52004, 'Ya existe un cantón con ese ID.', 1;

        INSERT INTO CANTON (
            ID_CANTON,
            NOMBRE,
            ID_PROVINCIA
        )
        VALUES (
            @ID_CANTON,
            TRIM(@NOMBRE),
            @ID_PROVINCIA
        );

    END TRY
    BEGIN CATCH
        DECLARE @ERRORMESSAGE NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ERRORSEVERITY INT = ERROR_SEVERITY();
        DECLARE @ERRORSTATE INT = ERROR_STATE();

        IF @ERRORSEVERITY < 16
            SET @ERRORSEVERITY = 16;

        RAISERROR (@ERRORMESSAGE, @ERRORSEVERITY, @ERRORSTATE);
        RETURN -1;
    END CATCH;

    RETURN 0;
END;
GO
