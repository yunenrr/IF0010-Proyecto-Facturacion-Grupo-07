USE SISTEMADEFACTURACION;
GO

DECLARE @Contador INT = 1;
DECLARE @CedulaGen VARCHAR(20);
DECLARE @NombreGen VARCHAR(100);
DECLARE @CorreoGen VARCHAR(100);
DECLARE @TelefonoGen VARCHAR(20);
DECLARE @IdDireccionValido INT;
DECLARE @IdSalida INT;

SET NOCOUNT ON;

WHILE @Contador <= 50000
BEGIN
    SET @IdDireccionValido = @Contador;

    SET @CedulaGen = '1-' + RIGHT('0000' + CAST((@Contador % 9000) + 1000 AS VARCHAR(10)), 4) + '-' + RIGHT('0000' + CAST(@Contador AS VARCHAR(10)), 4);
    SET @NombreGen = 'Cliente Pruebas S.A. ' + CAST(@Contador AS VARCHAR(10));
    SET @CorreoGen = 'clienteprueba' + CAST(@Contador AS VARCHAR(10)) + '@facturacioncr.com';
    SET @TelefonoGen = '8' + RIGHT('0000000' + CAST(7000000 + @Contador AS VARCHAR(10)), 7);

    EXEC dbo.pr_MigrarClientes
        @Cedula = @CedulaGen,
        @NombreRazonSocial = @NombreGen,
        @CorreoElectronico = @CorreoGen,
        @Telefono = @TelefonoGen,
        @IdDireccion = @IdDireccionValido,
        @IdClienteGenerado = @IdSalida OUTPUT;

    SET @Contador = @Contador + 1;
END;

GO