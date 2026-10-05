USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE DBO.PR_INSERTAR_PROVINCIA
    @ID_PROVINCIA INT,
    @NOMBRE VARCHAR(50)
AS
BEGIN
    SET XACT_ABORT ON;
    SET NOCOUNT ON;

    BEGIN TRY
        IF @ID_PROVINCIA IS NULL
            THROW 51001, 'El ID de la provincia es obligatorio.', 1;

        IF TRIM(@NOMBRE) = '' OR @NOMBRE IS NULL
            THROW 51002, 'El nombre de la provincia es obligatorio.', 1;

        IF
            EXISTS (
                SELECT 1
                FROM PROVINCIA
                WHERE ID_PROVINCIA = @ID_PROVINCIA
            )
                THROW 51003, 'Ya existe una provincia con ese ID.', 1;

        INSERT INTO PROVINCIA (
            ID_PROVINCIA,
            NOMBRE
        )
        VALUES (
            @ID_PROVINCIA,
            TRIM(@NOMBRE)
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
