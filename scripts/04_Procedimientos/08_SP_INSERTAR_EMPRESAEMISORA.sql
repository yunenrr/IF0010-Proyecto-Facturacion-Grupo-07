USE SISTEMADEFACTURACION;
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE name = 'pr_InsertarEmpresaEmisora' AND type = 'P')
BEGIN
	DROP PROCEDURE dbo.pr_InsertarEmpresaEmisora;
END
GO

CREATE OR ALTER PROCEDURE dbo.pr_InsertarEmpresaEmisora
    @Cedula VARCHAR(20),
    @NombreComercial VARCHAR(100),
    @RazonSocial VARCHAR(100),
    @Indicador BIT = 1,
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(20),
    @IdDireccion INT,
    @IdEmpresaGenerado INT OUTPUT
AS
BEGIN
    SET XACT_ABORT ON;
    SET NOCOUNT ON;

    BEGIN TRY
        IF TRIM(@Cedula) = '' OR @Cedula IS NULL
            THROW 50001, 'La cédula de la empresa es obligatoria y no puede estar vacía.', 1;

        IF TRIM(@RazonSocial) = '' OR @RazonSocial IS NULL
            THROW 50002, 'La razón social de la empresa es obligatoria.', 1;

        IF @IdDireccion IS NULL
            THROW 50003, 'Debe asociar una dirección válida a la empresa.', 1;

        IF NOT EXISTS (SELECT 1 FROM DIRECCION WHERE ID_DIRECCION = @IdDireccion)
            THROW 50004, 'La dirección especificada no existe en el sistema.', 1;

        IF EXISTS (SELECT 1 FROM EMPRESA_EMISORA WHERE CEDULA = @Cedula)
            THROW 50005, 'Ya se encuentra registrada una empresa con el número de cédula indicado.', 1;

        IF EXISTS (SELECT 1 FROM EMPRESA_EMISORA WHERE CORREO_ELECTRONICO = @CorreoElectronico)
            THROW 50006, 'El correo electrónico ingresado ya pertenece a otra empresa registrada.', 1;

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
            TRIM(@Cedula),
            TRIM(@NombreComercial),
            TRIM(@RazonSocial),
            GETDATE(),
            @Indicador,
            LOWER(TRIM(@CorreoElectronico)),
            TRIM(@Telefono),
            @IdDireccion
        );

        SET @IdEmpresaGenerado = SCOPE_IDENTITY();

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