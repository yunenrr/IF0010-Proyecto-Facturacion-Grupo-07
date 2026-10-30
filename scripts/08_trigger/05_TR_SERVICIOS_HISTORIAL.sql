USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER TRIGGER DBO.TR_SERVICIOS_HISTORIAL
    ON DBO.SERVICIOS
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION; -- Requisito del proyecto

        DECLARE @ID_TABLA INT;

        SELECT @ID_TABLA = ID_TABLA_AUDITADA
        FROM DBO.TABLA_AUDITADA
        WHERE NOMBRE_TABLA = 'SERVICIOS';

        IF @ID_TABLA IS NULL
            BEGIN
                INSERT INTO DBO.TABLA_AUDITADA (NOMBRE_TABLA)
                VALUES ('SERVICIOS');

                SET @ID_TABLA = SCOPE_IDENTITY();
            END

        -- Se guarda la fila completa (antes y después) en formato JSON
        INSERT INTO DBO.HISTORIAL (
            ID_TABLA_AUDITADA,
            REGISTRO_ID,
            OPERACION_REALIZADA,
            ESTADO_PREVIO,
            NUEVO_ESTADO,
            DESCRIPCION
        )
        SELECT
            @ID_TABLA,
            CAST(I.ID_SERVICIO AS VARCHAR(50)),
            'UPDATE',
            (
                SELECT *
                FROM DELETED AS D2
                WHERE D2.ID_SERVICIO = D.ID_SERVICIO
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
            ),
            (
                SELECT *
                FROM INSERTED AS I2
                WHERE I2.ID_SERVICIO = I.ID_SERVICIO
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
            ),
            CONCAT('Servicio modificado por ', SUSER_SNAME())
        FROM INSERTED AS I
        INNER JOIN DELETED AS D
            ON I.ID_SERVICIO = D.ID_SERVICIO;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE();

        RAISERROR (@MSG, 16, 1); -- Requisito del proyecto
    END CATCH;
END;
GO