USE SISTEMADEFACTURACION;
GO

DECLARE @Contador INT = 1;
DECLARE @CedulaGen VARCHAR(20);
DECLARE @NombreGen VARCHAR(100);
DECLARE @RazonGen VARCHAR(100);
DECLARE @CorreoGen VARCHAR(100);
DECLARE @TelefonoGen VARCHAR(20);
DECLARE @IdSalida INT;

SET NOCOUNT ON;

WHILE @Contador <= 100
BEGIN
    DECLARE @IdDireccionValido INT = @Contador;

    SET @CedulaGen = '3-101-' + RIGHT('000000' + CAST(@Contador AS VARCHAR(10)), 6);
    SET @NombreGen = 'Empresa Pruebas S.A. ' + CAST(@Contador AS VARCHAR(10));
    SET @RazonGen = 'Corporación Comercial ' + CAST(@Contador AS VARCHAR(10)) + ' Limitada';
    SET @CorreoGen = 'contacto' + CAST(@Contador AS VARCHAR(10)) + '@empresaprueba.com';
    SET @TelefonoGen = '8000' + RIGHT('0000' + CAST(@Contador AS VARCHAR(10)), 4);

    EXEC dbo.pr_MigrarEmpresasEmisoras
        @Cedula = @CedulaGen,
        @NombreComercial = @NombreGen,
        @RazonSocial = @RazonGen,
        @Indicador = 1,
        @CorreoElectronico = @CorreoGen,
        @Telefono = @TelefonoGen,
        @IdDireccion = @IdDireccionValido,
        @IdEmpresaGenerado = @IdSalida OUTPUT;

    SET @Contador = @Contador + 1;
END;

PRINT '¡Proceso finalizado! Se han migrado las 100 empresas emisoras exitosamente en tiempo récord.';
GO