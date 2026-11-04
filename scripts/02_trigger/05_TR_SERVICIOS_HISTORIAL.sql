USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER TRIGGER DBO.TR_SERVICIOS_HISTORIAL
ON DBO.SERVICIOS
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

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

        INSERT INTO DBO.HISTORIAL (
            ID_TABLA_AUDITADA,
            REGISTRO_ID,
            OPERACION_REALIZADA,
            ESTADO_PREVIO,
            NUEVO_ESTADO,
            DESCRIPCION
        )
        SELECT
            @ID_TABLA AS ID_TABLA_AUDITADA,
            CAST(
                ISNULL(I.ID_SERVICIO, D.ID_SERVICIO) AS VARCHAR(50)
            ) AS REGISTRO_ID,
            CASE
                WHEN D.ID_SERVICIO IS NULL THEN 'INSERT'
                WHEN I.ID_SERVICIO IS NULL THEN 'DELETE'
                ELSE 'UPDATE'
            END AS OPERACION_REALIZADA,
            -- Si es INSERT, guarda '{}' en vez de NULL
            ISNULL(
                (
                    SELECT D2.*
                    FROM DELETED AS D2
                    WHERE D2.ID_SERVICIO = D.ID_SERVICIO
                    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
                ),
                '{}'
            ) AS ESTADO_PREVIO,
            ISNULL(
                (
                    SELECT I2.*
                    FROM INSERTED AS I2
                    WHERE I2.ID_SERVICIO = I.ID_SERVICIO
                    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
                ),
                '{}'
            ) AS NUEVO_ESTADO,
            CONCAT(
                'Cambio en Servicio ID: ',
                ISNULL(I.ID_SERVICIO, D.ID_SERVICIO)
            ) AS DESCRIPCION
        FROM INSERTED AS I
        FULL OUTER JOIN DELETED AS D
            ON I.ID_SERVICIO = D.ID_SERVICIO;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @MSG NVARCHAR(4000) = ERROR_MESSAGE();

        RAISERROR (@MSG, 16, 1);
    END CATCH;
END;
GO
