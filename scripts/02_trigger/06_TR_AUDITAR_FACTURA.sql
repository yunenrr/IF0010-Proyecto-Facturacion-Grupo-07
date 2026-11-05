USE SISTEMADEFACTURACION;
GO

CREATE TRIGGER TR_FACTURA_AUDITORIA
ON FACTURA
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ID_TABLA_AUDITADA INT;

    SELECT
        @ID_TABLA_AUDITADA = ID_TABLA_AUDITADA
    FROM TABLA_AUDITADA
    WHERE NOMBRE_TABLA = 'FACTURA';

    -- INSERT
    IF EXISTS (
        SELECT 1
        FROM INSERTED
    )
    AND NOT EXISTS (
        SELECT 1
        FROM DELETED
    )
    BEGIN
        INSERT INTO HISTORIAL (
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
    IF EXISTS (
        SELECT 1
        FROM INSERTED
    )
    AND EXISTS (
        SELECT 1
        FROM DELETED
    )
    BEGIN
        INSERT INTO HISTORIAL (
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
    IF EXISTS (
        SELECT 1
        FROM DELETED
    )
    AND NOT EXISTS (
        SELECT 1
        FROM INSERTED
    )
    BEGIN
        INSERT INTO HISTORIAL (
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
