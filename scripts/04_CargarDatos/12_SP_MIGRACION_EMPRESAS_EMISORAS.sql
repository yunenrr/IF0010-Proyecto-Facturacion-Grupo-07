USE SISTEMADEFACTURACION;
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE name = 'pr_MigrarEmpresasEmisoras' AND type = 'P')
BEGIN
    DROP PROCEDURE dbo.pr_MigrarEmpresasEmisoras;
END
GO

CREATE OR ALTER PROCEDURE dbo.pr_MigrarEmpresasEmisoras
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
    SET NOCOUNT ON;
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
END;
GO