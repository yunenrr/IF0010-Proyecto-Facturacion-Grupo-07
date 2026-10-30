USE SISTEMADEFACTURACION;
GO

CREATE OR ALTER TRIGGER DBO.TR_AUDIT_CLIENTE_FISICO
    ON DBO.CLIENTE_FISICO
    AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION; -- Requisito del proyecto

        DECLARE @ID_TABLA INT;

        SELECT @ID_TABLA = ID_TABLA_AUDITADA
        FROM DBO.TABLA_AUDITADA
        WHERE NOMBRE_TABLA = 'CLIENTE_FISICO';

        IF @ID_TABLA IS NULL
            BEGIN
                INSERT INTO DBO.TABLA_AUDITADA (NOMBRE_TABLA)
                VALUES ('CLIENTE_FISICO');

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
            @ID_TABLA,
            CAST(ISNULL(I.ID_CLIENTE, D.ID_CLIENTE) AS VARCHAR(50)),
            CASE
                WHEN D.ID_CLIENTE IS NULL THEN 'INSERT'
                WHEN I.ID_CLIENTE IS NULL THEN 'DELETE'
                ELSE 'UPDATE'
            END,
            -- Si es INSERT, guarda '{}' en vez de NULL
            ISNULL(
                (
                    SELECT *
                    FROM DELETED AS D2
                    WHERE D2.ID_CLIENTE = D.ID_CLIENTE
                    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
                ),
                '{}'
            ),
            ISNULL(
                (
                    SELECT *
                    FROM INSERTED AS I2
                    WHERE I2.ID_CLIENTE = I.ID_CLIENTE
                    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
                ),
                '{}'
            ),
            'Cambio en Cliente Físico ID: '
            + CAST(ISNULL(I.ID_CLIENTE, D.ID_CLIENTE) AS VARCHAR(50))
        FROM INSERTED AS I
        FULL OUTER JOIN DELETED AS D
            ON I.ID_CLIENTE = D.ID_CLIENTE;

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