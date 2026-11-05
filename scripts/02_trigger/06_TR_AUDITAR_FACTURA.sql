USE SISTEMADEFACTURACION;
GO

CREATE TRIGGER DBO.TR_FACTURA_AUDITORIA
ON DBO.FACTURA
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ID_TABLA_AUDITADA INT;
    DECLARE @FILAS_INSERTADAS INT = (SELECT COUNT(*) FROM INSERTED);
    DECLARE @FILAS_ELIMINADAS INT = (SELECT COUNT(*) FROM DELETED);

    SELECT @ID_TABLA_AUDITADA = TA.ID_TABLA_AUDITADA
    FROM DBO.TABLA_AUDITADA AS TA
    WHERE TA.NOMBRE_TABLA = 'FACTURA';

    -- INSERT
    IF @FILAS_INSERTADAS > 0 AND @FILAS_ELIMINADAS = 0
        BEGIN
            INSERT INTO DBO.HISTORIAL (
                ID_TABLA_AUDITADA,
                REGISTRO_ID,
                OPERACION_REALIZADA,
                ESTADO_PREVIO,
                NUEVO_ESTADO,
                FECHA_CAMBIO,
                DESCRIPCION
            )
            SELECT
                @ID_TABLA_AUDITADA,
                I.IDENTIFICADOR,
                'INSERT',
                NULL,
                CAST(I.MONTO_TOTAL AS VARCHAR(100)),
                GETDATE(),
                'SE CREO UNA NUEVA FACTURA'
            FROM INSERTED AS I;
        END;

    -- UPDATE
    IF @FILAS_INSERTADAS > 0 AND @FILAS_ELIMINADAS > 0
        BEGIN
            INSERT INTO DBO.HISTORIAL (
                ID_TABLA_AUDITADA,
                REGISTRO_ID,
                OPERACION_REALIZADA,
                ESTADO_PREVIO,
                NUEVO_ESTADO,
                FECHA_CAMBIO,
                DESCRIPCION
            )
            SELECT
                @ID_TABLA_AUDITADA,
                I.IDENTIFICADOR,
                'UPDATE',
                CAST(D.MONTO_TOTAL AS VARCHAR(100)),
                CAST(I.MONTO_TOTAL AS VARCHAR(100)),
                GETDATE(),
                'SE MODIFICO LA FACTURA'
            FROM INSERTED AS I
            INNER JOIN DELETED AS D
                ON I.IDENTIFICADOR = D.IDENTIFICADOR;
        END;

    -- DELETE
    IF @FILAS_ELIMINADAS > 0 AND @FILAS_INSERTADAS = 0
        BEGIN
            INSERT INTO DBO.HISTORIAL (
                ID_TABLA_AUDITADA,
                REGISTRO_ID,
                OPERACION_REALIZADA,
                ESTADO_PREVIO,
                NUEVO_ESTADO,
                FECHA_CAMBIO,
                DESCRIPCION
            )
            SELECT
                @ID_TABLA_AUDITADA,
                D.IDENTIFICADOR,
                'DELETE',
                CAST(D.MONTO_TOTAL AS VARCHAR(100)),
                NULL,
                GETDATE(),
                'SE ELIMINO LA FACTURA'
            FROM DELETED AS D;
        END;
END;
GO
