USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER PROCEDURE DBO.PR_INSERTARPRODUCTO
    @CODINTERNO VARCHAR(20),
    @DESCRIPCION VARCHAR(100),
    @PRECIOUNITARIO DECIMAL(10, 2),
    @PORCENTAJEIMPUESTO DECIMAL(5, 2),
    @STOCK INT = 0,
    @IDPRODUCTOGENERADO INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF (@PRECIOUNITARIO <= 0)
            THROW 60001, 'El precio debe ser mayor a cero.', 1;
        IF (@PORCENTAJEIMPUESTO < 0)
            THROW 60002, 'El impuesto no puede ser negativo.', 1;
        IF (@STOCK < 0)
            THROW 60003, 'El stock no puede ser negativo.', 1;
        IF
            EXISTS (
                SELECT 1
                FROM DBO.PRODUCTOS
                WHERE COD_INTERNO = @CODINTERNO
            )
            THROW 60004, 'EL CÓDIGO INTERNO YA EXISTE.', 1;

        INSERT INTO DBO.PRODUCTOS (
            COD_INTERNO,
            DESCRIPCION,
            PRECIO_UNITARIO,
            PORCENTAJE_IMPUESTO,
            STOCK,
            ESTADO,
            FECHA_CREACION
        )
        VALUES (
            TRIM(@CODINTERNO),
            TRIM(@DESCRIPCION),
            @PRECIOUNITARIO,
            @PORCENTAJEIMPUESTO,
            @STOCK,
            1,
            GETDATE()
        );

        SET @IDPRODUCTOGENERADO = SCOPE_IDENTITY();

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
