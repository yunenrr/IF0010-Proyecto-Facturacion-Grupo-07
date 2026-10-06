USE SISTEMADEFACTURACION;
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE name = 'pr_InsertarCliente' AND type = 'P')
BEGIN
    DROP PROCEDURE dbo.pr_InsertarCliente;
END
GO

CREATE OR ALTER PROCEDURE dbo.pr_InsertarCliente
    @Cedula VARCHAR(20),
    @NombreRazonSocial VARCHAR(100) = 'No aplica',
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(20),
    @IdDireccion INT,
    @IdClienteGenerado INT OUTPUT
AS
BEGIN
    SET XACT_ABORT ON;
    SET NOCOUNT ON;

    BEGIN TRY
        IF TRIM(@Cedula) = '' OR @Cedula IS NULL
            THROW 50001, 'La cédula del cliente es obligatoria y no puede estar vacía.', 1;

        IF TRIM(@CorreoElectronico) = '' OR @CorreoElectronico IS NULL
            THROW 50002, 'El correo electrónico del cliente es obligatorio.', 1;

        IF TRIM(@Telefono) = '' OR @Telefono IS NULL
            THROW 50003, 'El teléfono del cliente es obligatorio.', 1;

        IF @IdDireccion IS NULL
            THROW 50004, 'Debe asociar una dirección válida al cliente.', 1;

        IF NOT EXISTS (SELECT 1 FROM DIRECCION WHERE ID_DIRECCION = @IdDireccion)
            THROW 50005, 'La dirección especificada no existe en el sistema.', 1;

        IF EXISTS (SELECT 1 FROM CLIENTE WHERE CEDULA = @Cedula)
            THROW 50006, 'Ya se encuentra registrado un cliente con el número de cédula indicado.', 1;

        IF EXISTS (SELECT 1 FROM CLIENTE WHERE CORREO_ELECTRONICO = @CorreoElectronico)
            THROW 50007, 'El correo electrónico ingresado ya pertenece a otro cliente registrado.', 1;

        IF EXISTS (SELECT 1 FROM CLIENTE WHERE ID_DIRECCION = @IdDireccion)
            THROW 50008, 'La dirección indicada ya se encuentra asignada a otro cliente (relación 1 a 1).', 1;

        INSERT INTO CLIENTE (
            CEDULA,
            NOMBRE_RAZON_SOCIAL,
            CORREO_ELECTRONICO,
            TELEFONO,
            FECHA_REGISTRO,
            ULTIMA_ACTUALIZACION,
            ID_DIRECCION
        )
        VALUES (
            TRIM(@Cedula),
            ISNULL(NULLIF(TRIM(@NombreRazonSocial), ''), 'No aplica'),
            LOWER(TRIM(@CorreoElectronico)),
            TRIM(@Telefono),
            GETDATE(),
            GETDATE(),
            @IdDireccion
        );

        SET @IdClienteGenerado = SCOPE_IDENTITY();

    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        IF @ErrorSeverity < 16
            SET @ErrorSeverity = 16;

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
        RETURN -1;
    END CATCH;

    RETURN 0;
END;
GO