-- ACTUALIZACION DE SERVICIOS
USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE DBO.PR_ACTUALIZAR_SERVICIO
    @ID_SERVICIO INT,
    @DESCRIPCION VARCHAR(100),
    @PRECIO_UNITARIO DECIMAL(10, 2),
    @UNIDAD_MEDIDA VARCHAR(20),
    @PORCENTAJE_IMPUESTO DECIMAL(5, 2),
    @ESTADO BIT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- VALIDAR PARAMETROS NO NULOS
        IF @ID_SERVICIO IS NULL
            OR @DESCRIPCION IS NULL
            OR @PRECIO_UNITARIO IS NULL
            OR @UNIDAD_MEDIDA IS NULL
            OR @PORCENTAJE_IMPUESTO IS NULL
            OR @ESTADO IS NULL
            THROW 50030, 'No se permiten parámetros nulos', 1;

        -- VALIDAR QUE DESCRIPCION NO ESTE VACIA
        IF LEN(TRIM(@DESCRIPCION)) = 0
            THROW 50031, 'Error. Descripción vacía', 1;

        -- VALIDAR QUE UNIDAD DE MEDIDA NO ESTE VACIA
        IF LEN(TRIM(@UNIDAD_MEDIDA)) = 0
            THROW 50032, 'Error. Unidad de medida vacía', 1;

        -- VALIDAR PRECIO MAYOR A 0
        IF @PRECIO_UNITARIO <= 0
            THROW 50033, 'El precio debe ser mayor a cero', 1;

        -- VALIDAR IMPUESTO ENTRE 0 Y 100
        IF @PORCENTAJE_IMPUESTO < 0
            OR @PORCENTAJE_IMPUESTO > 100
            THROW 50034, 'El porcentaje de impuesto debe estar entre 0 y 100', 1;

        -- VALIDAR QUE EL SERVICIO EXISTA
        IF NOT EXISTS (
            SELECT 1
            FROM DBO.SERVICIOS
            WHERE ID_SERVICIO = @ID_SERVICIO
        )
            THROW 50035, 'El servicio no existe', 1;

        -- ACTUALIZAR SERVICIO
        UPDATE DBO.SERVICIOS
        SET
            DESCRIPCION = TRIM(@DESCRIPCION),
            PRECIO_UNITARIO = @PRECIO_UNITARIO,
            UNIDAD_MEDIDA = TRIM(@UNIDAD_MEDIDA),
            PORCENTAJE_IMPUESTO = @PORCENTAJE_IMPUESTO,
            ESTADO = @ESTADO
        WHERE ID_SERVICIO = @ID_SERVICIO;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END;
GO