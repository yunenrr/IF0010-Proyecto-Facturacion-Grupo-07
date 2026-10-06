-- ACTUALIZACION DE PRODUCTOS
USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE DBO.PR_ACTUALIZARPRODUCTO
    @ID_PRODUCTO INT,
    @DESCRIPCION VARCHAR(100),
    @PRECIO_UNITARIO DECIMAL(10, 2),
    @PORCENTAJE_IMPUESTO DECIMAL(5, 2),
    @ESTADO BIT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- PARAMETROS NO NULOS
        IF @ID_PRODUCTO IS NULL
            OR @DESCRIPCION IS NULL
            OR @PRECIO_UNITARIO IS NULL
            OR @PORCENTAJE_IMPUESTO IS NULL
            OR @ESTADO IS NULL
            THROW 50010, 'No se permiten parámetros nulos', 1;

        -- VALIDAR QUE DESCRIPCION NO ESTE VACIA
        IF LEN(TRIM(@DESCRIPCION)) = 0
            THROW 50011, 'Error. Descripción vacía', 1;

        -- PRECIO MAYOR A 0
        IF @PRECIO_UNITARIO <= 0
            THROW 50012, 'El precio debe ser mayor a cero', 1;

        -- IMPUESTO ENTRE 0 Y 100
        IF @PORCENTAJE_IMPUESTO < 0
            OR @PORCENTAJE_IMPUESTO > 100
            THROW 50013, 'El porcentaje de impuesto debe estar entre 0 y 100', 1;

        -- PRODUCTO EXISTENTE
        IF NOT EXISTS (
            SELECT 1
            FROM DBO.PRODUCTOS
            WHERE ID_PRODUCTO = @ID_PRODUCTO
        )
            THROW 50014, 'El producto no existe', 1;

        UPDATE DBO.PRODUCTOS
        SET
            DESCRIPCION = TRIM(@DESCRIPCION),
            PRECIO_UNITARIO = @PRECIO_UNITARIO,
            PORCENTAJE_IMPUESTO = @PORCENTAJE_IMPUESTO,
            ESTADO = @ESTADO
        WHERE ID_PRODUCTO = @ID_PRODUCTO;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END;
GO