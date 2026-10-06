USE SISTEMADEFACTURACION;
GO

IF EXISTS (
    SELECT 1
    FROM SYS.OBJECTS
    WHERE NAME = 'PR_ACTUALIZARCLIENTE'
      AND TYPE = 'P'
)
BEGIN
    DROP PROCEDURE DBO.PR_ACTUALIZARCLIENTE;
END;
GO

CREATE OR ALTER PROCEDURE DBO.PR_ACTUALIZARCLIENTE
    @ID_CLIENTE INT,
    @CORREO_ELECTRONICO VARCHAR(100),
    @TELEFONO VARCHAR(20),
    @ID_DIRECCION INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF EXISTS (
                SELECT 1
                FROM DBO.CLIENTE
                WHERE CORREO_ELECTRONICO = @CORREO_ELECTRONICO
                  AND ID_CLIENTE <> @ID_CLIENTE
            )
            THROW 50010, 'El correo electrónico ya está registrado para otro cliente.', 1;

        IF EXISTS (
                SELECT 1
                FROM DBO.CLIENTE
                WHERE TELEFONO = @TELEFONO
                  AND ID_CLIENTE <> @ID_CLIENTE
            )
            THROW 50011, 'El número de teléfono ya está registrado para otro cliente.', 1;

        IF EXISTS (
                SELECT 1
                FROM DBO.CLIENTE
                WHERE ID_DIRECCION = @ID_DIRECCION
                  AND ID_CLIENTE <> @ID_CLIENTE
            )
            THROW 50012, 'La dirección ya está asignada a otro cliente.', 1;

        UPDATE DBO.CLIENTE
        SET CORREO_ELECTRONICO = @CORREO_ELECTRONICO,
            TELEFONO = @TELEFONO,
            ID_DIRECCION = @ID_DIRECCION
        WHERE ID_CLIENTE = @ID_CLIENTE;

        IF @@ROWCOUNT = 0
            THROW 50013, 'El cliente no existe.', 1;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH;

    RETURN 0;
END;
GO
