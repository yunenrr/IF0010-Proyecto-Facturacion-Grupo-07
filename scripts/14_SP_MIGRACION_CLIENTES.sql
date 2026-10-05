USE SISTEMADEFACTURACION;
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE name = 'pr_MigrarClientes' AND type = 'P')
BEGIN
    DROP PROCEDURE dbo.pr_MigrarClientes;
END
GO

CREATE OR ALTER PROCEDURE dbo.pr_MigrarClientes
    @Cedula VARCHAR(20),
    @NombreRazonSocial VARCHAR(100) = 'No aplica',
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(20),
    @IdDireccion INT,
    @IdClienteGenerado INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

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
END;
GO