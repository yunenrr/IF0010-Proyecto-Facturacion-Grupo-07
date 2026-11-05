USE SISTEMADEFACTURACION;
GO

CREATE TRIGGER DBO.TR_DIRECCION_AUDITORIA
ON DBO.DIRECCION
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ID_TABLA_AUDITADA INT;
    DECLARE @FILAS_INSERTADAS INT = (SELECT COUNT(*) FROM INSERTED);
    DECLARE @FILAS_ELIMINADAS INT = (SELECT COUNT(*) FROM DELETED);

    SELECT @ID_TABLA_AUDITADA = TA.ID_TABLA_AUDITADA
    FROM DBO.TABLA_AUDITADA AS TA
    WHERE TA.NOMBRE_TABLA = 'DIRECCION';

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
                I.ID_DIRECCION,
                'INSERT',
                NULL,
                I.DIRECCION_EXACTA,
                GETDATE(),
                'SE CREO UNA NUEVA DIRECCION'
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
                I.ID_DIRECCION,
                'UPDATE',
                D.DIRECCION_EXACTA,
                I.DIRECCION_EXACTA,
                GETDATE(),
                'SE ACTUALIZO LA UBICACION'
            FROM INSERTED AS I
            INNER JOIN DELETED AS D
                ON I.ID_DIRECCION = D.ID_DIRECCION;
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
                D.ID_DIRECCION,
                'DELETE',
                D.DIRECCION_EXACTA,
                NULL,
                GETDATE(),
                'SE ELIMINO LA DIRECCION'
            FROM DELETED AS D;
        END;
END;
GO
