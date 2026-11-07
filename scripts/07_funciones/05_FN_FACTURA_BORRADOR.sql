-- Función que recibe el ID de factura y devuelve 1 si el estado es
-- BORRADOR, o 0 para cualquier otro estado
USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER FUNCTION DBO.FN_FACTURA_BORRADOR(
    @ID_FACTURA INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @SALIDA BIT = 0;

    IF
        EXISTS (
            SELECT 1
            FROM DBO.FACTURA AS F
            INNER JOIN DBO.ESTADO_FACTURA AS EF
                ON F.COD_IDENTIFICADOR_ESTADO = EF.COD_IDENTIFICADOR
            WHERE
                F.IDENTIFICADOR = @ID_FACTURA
                AND EF.ESTADO = 'BORRADOR'
        )
        BEGIN
            SET @SALIDA = 1;
        END;

    RETURN @SALIDA;
END;
GO
