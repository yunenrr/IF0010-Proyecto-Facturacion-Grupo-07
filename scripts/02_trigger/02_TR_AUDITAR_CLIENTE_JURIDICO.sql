USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER TRIGGER DBO.TR_AUDITAR_CLIENTE_JURIDICO
ON DBO.CLIENTE_JURIDICO
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @ID_TABLA_AUDI INT;

        -- OBTENER ID
        SELECT @ID_TABLA_AUDI = TA.ID_TABLA_AUDITADA
        FROM DBO.TABLA_AUDITADA AS TA
        WHERE TA.NOMBRE_TABLA = 'CLIENTE_JURIDICO';

        -- VERIFICAR QUE LA TABLA EXISTA
        IF @ID_TABLA_AUDI IS NULL
            BEGIN
                INSERT INTO DBO.TABLA_AUDITADA (NOMBRE_TABLA)
                VALUES ('CLIENTE_JURIDICO');

                SET @ID_TABLA_AUDI = SCOPE_IDENTITY();
            END;

        -- REGISTRAR LOS CAMBIOS
        INSERT INTO DBO.HISTORIAL (
            ID_TABLA_AUDITADA,
            REGISTRO_ID,
            OPERACION_REALIZADA,
            ESTADO_PREVIO,
            NUEVO_ESTADO,
            DESCRIPCION
        )
        SELECT
            @ID_TABLA_AUDI AS ID_TABLA_AUDITADA,
            CAST(
                ISNULL(I.ID_CLIENTE, D.ID_CLIENTE) AS VARCHAR(50)
            ) AS REGISTRO_ID,
            CASE
                WHEN D.ID_CLIENTE IS NULL THEN 'INSERT'
                WHEN I.ID_CLIENTE IS NULL THEN 'DELETE'
                ELSE 'UPDATE'
            END AS OPERACION_REALIZADA,
            ISNULL(
                (
                    SELECT D2.*
                    FROM DELETED AS D2
                    WHERE D2.ID_CLIENTE = D.ID_CLIENTE
                    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
                ),
                '{}'
            ) AS ESTADO_PREVIO,
            ISNULL(
                (
                    SELECT I2.*
                    FROM INSERTED AS I2
                    WHERE I2.ID_CLIENTE = I.ID_CLIENTE
                    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
                ),
                '{}'
            ) AS NUEVO_ESTADO,
            CONCAT(
                'Cambio en Cliente Jurídico ID: ',
                ISNULL(I.ID_CLIENTE, D.ID_CLIENTE)
            ) AS DESCRIPCION
        FROM INSERTED AS I
        FULL OUTER JOIN DELETED AS D
            ON I.ID_CLIENTE = D.ID_CLIENTE;

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
