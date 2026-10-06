-- ACTUALIZAR STOCK
USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE DBO.PR_STOCKPRODUCTO
    @ID_PRODUCTO INT,
    @CANTIDAD INT,
    @TIPO_MOVIMIENTO BIT -- 1 = ENTRADA, 0 = SALIDA
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @STOCK_ACTUAL INT;
    DECLARE @ESTADO_PRODUCTO BIT;
    DECLARE @STOCK_NUEVO INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- PARAMETROS NO NULOS
        IF @ID_PRODUCTO IS NULL
            OR @CANTIDAD IS NULL
            OR @TIPO_MOVIMIENTO IS NULL
            THROW 50020, 'No se permiten parámetros nulos', 1;

        -- VALIDAR CANTIDAD MAYOR A 0
        IF @CANTIDAD <= 0
            THROW 50021, 'La cantidad debe ser mayor a cero.', 1;

        -- OBTENER STOCK ACTUAL
        SELECT
            @STOCK_ACTUAL = STOCK,
            @ESTADO_PRODUCTO = ESTADO
        FROM DBO.PRODUCTOS WITH (UPDLOCK, HOLDLOCK)
        WHERE ID_PRODUCTO = @ID_PRODUCTO;

        -- VALIDAR QUE EL PRODUCTO EXISTA
        IF @@ROWCOUNT = 0
            THROW 50022, 'El producto no existe.', 1;

        -- VALIDAR DISPONIBILIDAD PARA SALIDA
        IF @TIPO_MOVIMIENTO = 0
            AND @ESTADO_PRODUCTO = 0
            THROW 50023, 'El producto no está disponible.', 1;

        -- CALCULAR STOCK NUEVO
        IF @TIPO_MOVIMIENTO = 1
        BEGIN
            SET @STOCK_NUEVO = @STOCK_ACTUAL + @CANTIDAD;
        END
        ELSE
        BEGIN
            IF @STOCK_ACTUAL < @CANTIDAD
                THROW 50024, 'No hay esa cantidad de productos', 1;

            SET @STOCK_NUEVO = @STOCK_ACTUAL - @CANTIDAD;
        END;

        -- ACTUALIZAR STOCK
        UPDATE DBO.PRODUCTOS
        SET STOCK = @STOCK_NUEVO
        WHERE ID_PRODUCTO = @ID_PRODUCTO
            AND STOCK = @STOCK_ACTUAL;

        IF @@ROWCOUNT = 0
            THROW 50025, 'No se pudo actualizar el stock.', 1;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END;
GO