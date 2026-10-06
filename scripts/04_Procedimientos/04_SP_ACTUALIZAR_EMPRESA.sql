USE SistemaDeFacturacion;
GO

IF EXISTS (
    SELECT 1
    FROM sys.objects
    WHERE NAME = 'PR_ACTUALIZAREMPRESAEMISORA'
        AND TYPE = 'P'
        )
BEGIN
    DROP PROCEDURE DBO.PR_ACTUALIZAREMPRESAEMISORA;
END;
GO

CREATE PROCEDURE DBO.PR_ACTUALIZAREMPRESAEMISORA
    @ID_EMPRESA INT,
    @CORREO_ELECTRONICO VARCHAR(100),
    @TELEFONO VARCHAR(20),
    @ID_DIRECCION INT,
    @INDICADOR BIT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validaciones de duplicados
        IF EXISTS (SELECT 1 FROM dbo.Empresa_Emisora
                   WHERE CORREO_ELECTRONICO = @CORREO_ELECTRONICO
                     AND ID_EMPRESA <> @ID_EMPRESA)
            THROW 50020, 'El correo electrónico ya está registrado para otra empresa.', 1;

        IF EXISTS (SELECT 1 FROM dbo.Empresa_Emisora
                   WHERE TELEFONO = @TELEFONO
                     AND ID_EMPRESA <> @ID_EMPRESA)
            THROW 50021, 'El número de teléfono ya está registrado para otra empresa.', 1;

        IF EXISTS (SELECT 1 FROM dbo.Empresa_Emisora
                   WHERE ID_DIRECCION = @ID_DIRECCION
                     AND ID_EMPRESA <> @ID_EMPRESA)
            THROW 50022, 'La dirección ya está asignada a otra empresa.', 1;

        -- Actualización
        UPDATE dbo.Empresa_Emisora
        SET CORREO_ELECTRONICO = @CORREO_ELECTRONICO,
            TELEFONO = @TELEFONO,
            ID_DIRECCION = @ID_DIRECCION,
            INDICADOR = @INDICADOR
        WHERE ID_EMPRESA = @ID_EMPRESA;

        IF @@ROWCOUNT = 0
            THROW 50023, 'La empresa emisora no existe.', 1;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
