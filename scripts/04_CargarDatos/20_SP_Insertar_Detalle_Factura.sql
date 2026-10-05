USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE USP_CREAR_DETALLE_FACTURA(
    @IDENTIFICADOR_FACTURA VARCHAR(50),
    @ID_PRODUCTO INT = NULL,
    @ID_SERVICIO INT = NULL,
    @CANTIDAD DECIMAL(18, 2),
    @NUMERO_CORRELATIVO INT OUTPUT,
    @CODIGO_ERROR INT OUTPUT,
    @MENSAJE VARCHAR(500) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DESCRIPCION NVARCHAR(255);
    DECLARE @PRECIO DECIMAL(18, 2);
    DECLARE @IMPUESTO DECIMAL(5, 2);
    DECLARE @SUBTOTAL DECIMAL(18, 2);
    DECLARE @TOTAL DECIMAL(18, 2);

    SET @NUMERO_CORRELATIVO = NULL;
    SET @CODIGO_ERROR = 0;
    SET @MENSAJE = 'Detalle creado correctamente';

    -- Validaciones
    IF @IDENTIFICADOR_FACTURA IS NULL
       OR LEN(@IDENTIFICADOR_FACTURA) > 50
    BEGIN
        SET @CODIGO_ERROR = 4;
        SET @MENSAJE = 'El identificador de factura es obligatorio y no '
                       + 'puede exceder 50 caracteres';
        RETURN;
    END

    IF (@ID_PRODUCTO IS NULL AND @ID_SERVICIO IS NULL)
       OR (@ID_PRODUCTO IS NOT NULL AND @ID_SERVICIO IS NOT NULL)
    BEGIN
        SET @CODIGO_ERROR = 5;
        SET @MENSAJE = 'Debe especificar exactamente un producto o un servicio';
        RETURN;
    END

    IF NOT EXISTS (
        SELECT 1
        FROM FACTURA AS F
        INNER JOIN ESTADO_FACTURA AS E
            ON F.COD_IDENTIFICADOR_ESTADO = E.COD_IDENTIFICADOR
        WHERE F.IDENTIFICADOR = @IDENTIFICADOR_FACTURA
          AND E.ESTADO = 'BORRADOR'
    )
    BEGIN
        SET @CODIGO_ERROR = 1;
        SET @MENSAJE = 'La factura no existe o no esta en estado BORRADOR';
        RETURN;
    END

    IF @CANTIDAD IS NULL OR @CANTIDAD <= 0
    BEGIN
        SET @CODIGO_ERROR = 2;
        SET @MENSAJE = 'La cantidad debe ser mayor a 0';
        RETURN;
    END

    IF @ID_PRODUCTO IS NOT NULL
    BEGIN
        SELECT
            @DESCRIPCION = P.DESCRIPCION,
            @PRECIO = P.PRECIO_UNITARIO,
            @IMPUESTO = P.PORCENTAJE_IMPUESTO
        FROM PRODUCTOS AS P
        WHERE P.ID_PRODUCTO = @ID_PRODUCTO
          AND P.ESTADO = 1;
    END
    ELSE
    BEGIN
        SELECT
            @DESCRIPCION = S.DESCRIPCION,
            @PRECIO = S.PRECIO_UNITARIO,
            @IMPUESTO = S.PORCENTAJE_IMPUESTO
        FROM SERVICIOS AS S
        WHERE S.ID_SERVICIO = @ID_SERVICIO
          AND S.ESTADO = 1;
    END

    IF @DESCRIPCION IS NULL
    BEGIN
        SET @CODIGO_ERROR = 3;
        SET @MENSAJE = 'El producto o servicio no existe o esta inactivo';
        RETURN;
    END

    IF LEN(@DESCRIPCION) > 255
    BEGIN
        SET @CODIGO_ERROR = 6;
        SET @MENSAJE = 'La descripción no puede exceder 255 caracteres';
        RETURN;
    END

    IF @PRECIO IS NULL OR @PRECIO <= 0
    BEGIN
        SET @CODIGO_ERROR = 7;
        SET @MENSAJE = 'El precio unitario es obligatorio y debe ser mayor a 0';
        RETURN;
    END

    IF @IMPUESTO IS NULL OR @IMPUESTO < 0
    BEGIN
        SET @CODIGO_ERROR = 8;
        SET @MENSAJE = 'El porcentaje de impuesto es obligatorio y no puede '
                       + 'ser negativo';
        RETURN;
    END

    -- Proceso
    SET @SUBTOTAL = @CANTIDAD * @PRECIO;
    SET @TOTAL = @SUBTOTAL + (@SUBTOTAL * @IMPUESTO / 100);

    BEGIN TRY
        BEGIN TRANSACTION;

        SELECT @NUMERO_CORRELATIVO = ISNULL(MAX(NUMERO_CORRELATIVO), 0) + 1
        FROM DETALLE_FACTURA WITH (UPDLOCK, HOLDLOCK)
        WHERE IDENTIFICADOR_FACTURA = @IDENTIFICADOR_FACTURA;

        INSERT INTO DETALLE_FACTURA (
            IDENTIFICADOR_FACTURA,
            NUMERO_CORRELATIVO,
            DESCRIPCION,
            CANTIDAD,
            PRECIO_UNITARIO,
            PORCENTAJE_IMPUESTO,
            SUBTOTAL_LINEA,
            MONTOTOTAL_LINEA,
            ID_PRODUCTO,
            ID_SERVICIO
        )
        VALUES (
            @IDENTIFICADOR_FACTURA,
            @NUMERO_CORRELATIVO,
            @DESCRIPCION,
            @CANTIDAD,
            @PRECIO,
            @IMPUESTO,
            @SUBTOTAL,
            @TOTAL,
            @ID_PRODUCTO,
            @ID_SERVICIO
        );

        UPDATE FACTURA
        SET
            SUBTOTAL = (
                SELECT SUM(SUBTOTAL_LINEA)
                FROM DETALLE_FACTURA
                WHERE IDENTIFICADOR_FACTURA = @IDENTIFICADOR_FACTURA
            ),
            IMPUESTOS_APLICADOS = (
                SELECT SUM(MONTOTOTAL_LINEA - SUBTOTAL_LINEA)
                FROM DETALLE_FACTURA
                WHERE IDENTIFICADOR_FACTURA = @IDENTIFICADOR_FACTURA
            ),
            MONTO_TOTAL = (
                SELECT SUM(MONTOTOTAL_LINEA)
                FROM DETALLE_FACTURA
                WHERE IDENTIFICADOR_FACTURA = @IDENTIFICADOR_FACTURA
            ),
            MODIFICACION = GETDATE()
        WHERE IDENTIFICADOR = @IDENTIFICADOR_FACTURA;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @NUMERO_CORRELATIVO = NULL;
        SET @CODIGO_ERROR = ERROR_NUMBER();
        SET @MENSAJE = ERROR_MESSAGE();
    END CATCH;
END;
GO
