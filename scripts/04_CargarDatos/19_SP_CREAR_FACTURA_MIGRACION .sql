USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE USP_CREAR_FACTURA_SIN_FILTRO (
    @ID_EMPRESA INT,
    @ID_CLIENTE INT,
    @COD_MONEDA CHAR(3),
    @COD_TIPO VARCHAR(10),
    @COD_ESTADO VARCHAR(10),
    @FECHA_EMISION DATE = NULL,
    @OBSERVACIONES NVARCHAR(255) = NULL,
    @SUBTOTAL DECIMAL(18, 2) = 0,
    @TOTAL_DESCUENTOS DECIMAL(18, 2) = 0,
    @IMPUESTOS_APLICADOS DECIMAL(18, 2) = 0,
    @MONTO_TOTAL DECIMAL(18, 2) = 0,
    @IDENTIFICADOR VARCHAR(50) = NULL OUTPUT,
    @CODIGO_ERROR INT OUTPUT,
    @MENSAJE VARCHAR(500) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    SET @CODIGO_ERROR = 0;
    SET @MENSAJE = 'Factura creada correctamente';

    -- Proceso
    BEGIN TRY
        BEGIN TRANSACTION;

        IF @IDENTIFICADOR IS NULL
            SET @IDENTIFICADOR
                = FORMAT(GETDATE(), 'yyyyMMddHHmmss')
                + '-'
                + @COD_TIPO;

        INSERT INTO FACTURA (
            IDENTIFICADOR,
            FECHA_EMISION,
            SUBTOTAL,
            TOTAL_DESCUENTOS,
            IMPUESTOS_APLICADOS,
            MONTO_TOTAL,
            OBSERVACIONES,
            ID_EMPRESA,
            ID_CLIENTE,
            COD_IDENTIFICADOR_MONEDA,
            COD_IDENTIFICADOR_TIPO,
            COD_IDENTIFICADOR_ESTADO
        )
        VALUES (
            @IDENTIFICADOR,
            ISNULL(@FECHA_EMISION, CAST(GETDATE() AS DATE)),
            @SUBTOTAL,
            @TOTAL_DESCUENTOS,
            @IMPUESTOS_APLICADOS,
            @MONTO_TOTAL,
            @OBSERVACIONES,
            @ID_EMPRESA,
            @ID_CLIENTE,
            @COD_MONEDA,
            @COD_TIPO,
            @COD_ESTADO
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- si algo falla se deshace todo
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @CODIGO_ERROR = ERROR_NUMBER();
        SET @MENSAJE = ERROR_MESSAGE();
    END CATCH;
END;
GO
