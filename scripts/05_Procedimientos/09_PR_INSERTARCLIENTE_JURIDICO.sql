USE SISTEMADEFACTURACION;
GO

IF
    EXISTS (
        SELECT 1
        FROM SYS.OBJECTS
        WHERE NAME = 'PR_INSERTARCLIENTE_JURIDICO' AND TYPE = 'P'
    )
    BEGIN
        DROP PROCEDURE DBO.PR_INSERTARCLIENTE_JURIDICO;
    END
GO

CREATE OR ALTER PROCEDURE DBO.PR_INSERTARCLIENTE_JURIDICO
    @CEDULA VARCHAR(20),
    @RAZON_SOCIAL VARCHAR(100),
    @NOMBRE_COMERCIAL VARCHAR(100) = NULL,
    @CORREO_ELECTRONICO VARCHAR(100),
    @TELEFONO VARCHAR(20),
    @ID_DIRECCION INT,
    @ID_CLIENTE_GENERADO INT OUTPUT
AS
BEGIN
    SET XACT_ABORT ON;
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;
        DECLARE @MSG NVARCHAR(500);

        IF TRIM(@CEDULA) = '' OR @CEDULA IS NULL
            BEGIN
                SET
                    @MSG = 'La cédula jurídica es obligatoria '
                    + 'y no puede estar vacía.';
                THROW 50001, @MSG, 1;
            END

        IF TRIM(@RAZON_SOCIAL) = '' OR @RAZON_SOCIAL IS NULL
            BEGIN
                SET @MSG = 'La razón social es obligatoria.';
                THROW 50001, @MSG, 1;
            END

        IF TRIM(@CORREO_ELECTRONICO) = '' OR @CORREO_ELECTRONICO IS NULL
            BEGIN
                SET
                    @MSG = 'El correo electrónico del cliente '
                    + 'es obligatorio.';
                THROW 50002, @MSG, 1;
            END

        IF TRIM(@TELEFONO) = '' OR @TELEFONO IS NULL
            BEGIN
                SET @MSG = 'El teléfono del cliente es obligatorio.';
                THROW 50003, @MSG, 1;
            END

        IF @ID_DIRECCION IS NULL
            BEGIN
                SET
                    @MSG = 'Debe asociar una dirección válida '
                    + 'al cliente.';
                THROW 50004, @MSG, 1;
            END

        IF
            NOT EXISTS (
                SELECT 1
                FROM DIRECCION
                WHERE ID_DIRECCION = @ID_DIRECCION
            )
            BEGIN
                SET
                    @MSG = 'La dirección especificada no existe '
                    + 'en el sistema.';
                THROW 50005, @MSG, 1;
            END

        IF
            EXISTS (
                SELECT 1
                FROM CLIENTE_FISICO
                WHERE CEDULA = @CEDULA
            )
            OR EXISTS (
                SELECT 1
                FROM CLIENTE_JURIDICO
                WHERE CEDULA = @CEDULA
            )
            BEGIN
                SET
                    @MSG = 'Ya se encuentra registrado un cliente '
                    + 'con el número de cédula indicado.';
                THROW 50006, @MSG, 1;
            END

        IF
            EXISTS (
                SELECT 1
                FROM CLIENTE_FISICO
                WHERE CORREO_ELECTRONICO = @CORREO_ELECTRONICO
            )
            OR EXISTS (
                SELECT 1
                FROM CLIENTE_JURIDICO
                WHERE CORREO_ELECTRONICO = @CORREO_ELECTRONICO
            )
            BEGIN
                SET
                    @MSG = 'El correo electrónico ingresado ya '
                    + 'pertenece a otro cliente registrado.';
                THROW 50007, @MSG, 1;
            END

        IF
            EXISTS (
                SELECT 1
                FROM CLIENTE_FISICO
                WHERE ID_DIRECCION = @ID_DIRECCION
            )
            OR EXISTS (
                SELECT 1
                FROM CLIENTE_JURIDICO
                WHERE ID_DIRECCION = @ID_DIRECCION
            )
            BEGIN
                SET
                    @MSG = 'La dirección indicada ya se encuentra '
                    + 'asignada a otro cliente.';
                THROW 50008, @MSG, 1;
            END

        INSERT INTO CLIENTE_JURIDICO (
            CEDULA,
            RAZON_SOCIAL,
            NOMBRE_COMERCIAL,
            CORREO_ELECTRONICO,
            TELEFONO,
            FECHA_REGISTRO,
            ULTIMA_ACTUALIZACION,
            ID_DIRECCION
        )
        VALUES (
            TRIM(@CEDULA),
            TRIM(@RAZON_SOCIAL),
            ISNULL(NULLIF(TRIM(@NOMBRE_COMERCIAL), ''), NULL),
            LOWER(TRIM(@CORREO_ELECTRONICO)),
            TRIM(@TELEFONO),
            GETDATE(),
            GETDATE(),
            @ID_DIRECCION
        );

        SET @ID_CLIENTE_GENERADO = SCOPE_IDENTITY();

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        DECLARE @ERROR_MESSAGE NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ERROR_SEVERITY INT = ERROR_SEVERITY();
        DECLARE @ERROR_STATE INT = ERROR_STATE();

        IF @ERROR_SEVERITY < 16
            SET @ERROR_SEVERITY = 16;

        RAISERROR (@ERROR_MESSAGE, @ERROR_SEVERITY, @ERROR_STATE);
        RETURN -1;
    END CATCH;

    RETURN 0;
END;
GO
