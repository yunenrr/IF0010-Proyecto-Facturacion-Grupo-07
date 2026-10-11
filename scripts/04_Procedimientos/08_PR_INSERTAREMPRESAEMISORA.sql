USE SISTEMADEFACTURACION;
GO

IF
    EXISTS (
        SELECT 1 FROM SYS.OBJECTS
        WHERE NAME = 'PR_INSERTAREMPRESAEMISORA' AND TYPE = 'P'
    )
    BEGIN
        DROP PROCEDURE DBO.PR_INSERTAREMPRESAEMISORA;
    END
GO

CREATE OR ALTER PROCEDURE DBO.PR_INSERTAREMPRESAEMISORA
    @CEDULA VARCHAR(20),
    @NOMBRECOMERCIAL VARCHAR(100),
    @RAZONSOCIAL VARCHAR(100),
    @INDICADOR BIT = 1,
    @CORREOELECTRONICO VARCHAR(100),
    @TELEFONO VARCHAR(20),
    @IDDIRECCION INT,
    @IDEMPRESAGENERADO INT OUTPUT
AS
BEGIN
    SET XACT_ABORT ON;
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;
        IF TRIM(@CEDULA) = '' OR @CEDULA IS NULL
            THROW 50001,
            'La cédula de la empresa es obligatoria y no puede estar vacía.', 1;

        IF TRIM(@RAZONSOCIAL) = '' OR @RAZONSOCIAL IS NULL
            THROW 50002,
            'La razón social de la empresa es obligatoria.', 1;

        IF @IDDIRECCION IS NULL
            THROW 50003,
            'Debe asociar una dirección válida a la empresa.', 1;

        IF
            NOT EXISTS (
                SELECT 1 FROM DIRECCION
                WHERE ID_DIRECCION = @IDDIRECCION
            )
            THROW 50004,
            'La dirección especificada no existe en el sistema.', 1;

        IF
            EXISTS (
                SELECT 1 FROM EMPRESA_EMISORA
                WHERE CEDULA = @CEDULA
            )
            THROW 50005,
            'Ya se encuentra registrada una empresa con el número de cédula indicado.', -- noqa: LT05
            1;

        IF
            EXISTS (
                SELECT 1 FROM EMPRESA_EMISORA
                WHERE CORREO_ELECTRONICO = @CORREOELECTRONICO
            )
            THROW 50006,
            'El correo electrónico ingresado ya pertenece a otra empresa registrada.', -- noqa: LT05
            1;

        INSERT INTO EMPRESA_EMISORA (
            CEDULA,
            NOMBRE_COMERCIAL,
            RAZON_SOCIAL,
            FECHA,
            INDICADOR,
            CORREO_ELECTRONICO,
            TELEFONO,
            ID_DIRECCION
        )
        VALUES (
            TRIM(@CEDULA),
            TRIM(@NOMBRECOMERCIAL),
            TRIM(@RAZONSOCIAL),
            GETDATE(),
            @INDICADOR,
            LOWER(TRIM(@CORREOELECTRONICO)),
            TRIM(@TELEFONO),
            @IDDIRECCION
        );

        SET @IDEMPRESAGENERADO = SCOPE_IDENTITY();
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;
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
