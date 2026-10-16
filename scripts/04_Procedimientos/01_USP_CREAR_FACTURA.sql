USE SISTEMADEFACTURACION;
GO
CREATE OR ALTER PROCEDURE USP_CREAR_FACTURA
    @ID_EMPRESA INT,
    @ID_CLIENTE INT,
    @COD_MONEDA CHAR(3),
    @COD_TIPO VARCHAR(10),
    @OBSERVACIONES NVARCHAR(255) = NULL,
    @IDENTIFICADOR INT OUTPUT,
    @IDENTIFICADOR_COMPROBANTE VARCHAR(50) OUTPUT,
    @CODIGO_ERROR INT OUTPUT,
    @MENSAJE VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @COD_ESTADO VARCHAR(10);

    SET @IDENTIFICADOR = NULL;
    SET @IDENTIFICADOR_COMPROBANTE = NULL;
    SET @CODIGO_ERROR = 0;
    SET @MENSAJE = 'Factura creada correctamente';
    IF @ID_EMPRESA IS NULL
        BEGIN
            SET @CODIGO_ERROR = 6;
            SET @MENSAJE = 'El ID de empresa es obligatorio';
            RETURN;
        END

    IF @ID_CLIENTE IS NULL
        BEGIN
            SET @CODIGO_ERROR = 7;
            SET @MENSAJE = 'El ID de cliente es obligatorio';
            RETURN;
        END

    IF @COD_MONEDA IS NULL
        BEGIN
            SET @CODIGO_ERROR = 8;
            SET @MENSAJE = 'El código de moneda es obligatorio';
            RETURN;
        END

    IF LEN(@COD_MONEDA) <> 3
        BEGIN
            SET @CODIGO_ERROR = 12;
            SET @MENSAJE = 'El código de moneda debe tener 3 caracteres';
            RETURN;
        END

    IF @COD_TIPO IS NULL
        BEGIN
            SET @CODIGO_ERROR = 9;
            SET @MENSAJE = 'El código de tipo de documento es obligatorio';
            RETURN;
        END

    IF LEN(@COD_TIPO) > 10
        BEGIN
            SET @CODIGO_ERROR = 10;
            SET
                @MENSAJE = 'El código de tipo de '
                + 'documento no puede exceder 10 caracteres';
            RETURN;
        END

    IF @OBSERVACIONES IS NOT NULL AND LEN(@OBSERVACIONES) > 255
        BEGIN
            SET @CODIGO_ERROR = 11;
            SET @MENSAJE = 'Las observaciones no pueden exceder 255 caracteres';
            RETURN;
        END

    IF
        NOT EXISTS (
            SELECT 1 FROM EMPRESA_EMISORA
            WHERE ID_EMPRESA = @ID_EMPRESA AND INDICADOR = 1
        )
        BEGIN
            SET @CODIGO_ERROR = 1;
            SET @MENSAJE = 'La empresa no existe o no esta activa';
            RETURN;
        END

    IF
        NOT EXISTS (
            SELECT 1 FROM CLIENTE
            WHERE ID_CLIENTE = @ID_CLIENTE
        )
        BEGIN
            SET @CODIGO_ERROR = 2;
            SET @MENSAJE = 'El cliente no existe';
            RETURN;
        END

    IF
        NOT EXISTS (
            SELECT 1 FROM MONEDAS
            WHERE COD_IDENTIFICADOR = @COD_MONEDA
        )
        BEGIN
            SET @CODIGO_ERROR = 3;
            SET @MENSAJE = 'La moneda no existe';
            RETURN;
        END

    IF
        NOT EXISTS (
            SELECT 1 FROM TIPO_DOCUMENTO
            WHERE COD_IDENTIFICADOR = @COD_TIPO
        )
        BEGIN
            SET @CODIGO_ERROR = 4;
            SET @MENSAJE = 'El tipo de documento no existe';
            RETURN;
        END

    SELECT @COD_ESTADO = COD_IDENTIFICADOR
    FROM ESTADO_FACTURA
    WHERE ESTADO = 'BORRADOR';

    IF @COD_ESTADO IS NULL
        BEGIN
            SET @CODIGO_ERROR = 5;
            SET @MENSAJE = 'No existe el estado BORRADOR en ESTADO_FACTURA';
            RETURN;
        END
    -- proceso

    BEGIN TRY
        BEGIN TRANSACTION;

        SET
            @IDENTIFICADOR_COMPROBANTE
            = DBO.FN_CLAVE_COMPROBANTE(GETDATE(), @COD_TIPO);

        INSERT INTO FACTURA (
            IDENTIFICADOR_COMPROBANTE, FECHA_EMISION, SUBTOTAL,
            TOTAL_DESCUENTOS,
            IMPUESTOS_APLICADOS, MONTO_TOTAL, OBSERVACIONES,
            ID_EMPRESA, ID_CLIENTE, COD_IDENTIFICADOR_MONEDA,
            COD_IDENTIFICADOR_TIPO, COD_IDENTIFICADOR_ESTADO
        )
        VALUES (
            @IDENTIFICADOR_COMPROBANTE, CAST(GETDATE() AS DATE), 0, 0,
            0, 0, @OBSERVACIONES,
            @ID_EMPRESA, @ID_CLIENTE, @COD_MONEDA,
            @COD_TIPO, @COD_ESTADO
        );

        SET @IDENTIFICADOR = SCOPE_IDENTITY();

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @IDENTIFICADOR = NULL;
        SET @IDENTIFICADOR_COMPROBANTE = NULL;
        SET @CODIGO_ERROR = ERROR_NUMBER();
        SET @MENSAJE = ERROR_MESSAGE();
    END CATCH
END;
GO
