USE SISTEMADEFACTURACION;
GO

DROP PROCEDURE IF EXISTS DBO.SP_REGISTRAR_SERVICIO;
GO

CREATE OR ALTER PROCEDURE DBO.PR_INSERTAR_SERVICIO
    @COD_INTERNO VARCHAR(100),
    @DESCRIPCION VARCHAR(500),
    @PRECIO_UNITARIO DECIMAL(18, 4),
    @UNIDAD_MEDIDA VARCHAR(100),
    @PORCENTAJE_IMPUESTO DECIMAL(9, 4),
    @ESTADO BIT = 1,
    @ID_SERVICIO INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SET @ID_SERVICIO = NULL;

    DECLARE @ID_TABLA_AUDITADA INT;
    DECLARE @NUEVO_ESTADO NVARCHAR(MAX);

    BEGIN TRY
        SET @COD_INTERNO = UPPER(TRIM(@COD_INTERNO));
        SET @DESCRIPCION = TRIM(@DESCRIPCION);
        SET @UNIDAD_MEDIDA = TRIM(@UNIDAD_MEDIDA);

        IF @ESTADO IS NULL
            SET @ESTADO = 1;

        IF @COD_INTERNO IS NULL OR LEN(@COD_INTERNO) = 0
            THROW 54001, 'El codigo interno es obligatorio.', 1;

        IF LEN(@COD_INTERNO) > 20
            THROW 54002, 'El codigo interno excede los 20 caracteres.', 1;
        IF
            LEFT(@COD_INTERNO, 4) <> 'SERV'
            OR LEN(@COD_INTERNO) < 8
            OR SUBSTRING(@COD_INTERNO, 5, 20) LIKE '%[^0-9]%'
            THROW 54003, 'El codigo debe tener formato SERV + 4 digitos.', 1;

        IF @DESCRIPCION IS NULL OR LEN(@DESCRIPCION) = 0
            THROW 54004, 'La descripcion es obligatoria.', 1;

        IF LEN(@DESCRIPCION) > 100
            THROW 54005, 'La descripcion excede los 100 caracteres.', 1;

        IF @PRECIO_UNITARIO IS NULL
            THROW 54006, 'El precio unitario es obligatorio.', 1;

        IF @PRECIO_UNITARIO <= 0
            THROW 54007, 'El precio unitario debe ser mayor que cero.', 1;

        IF @PRECIO_UNITARIO > 99999999.99
            THROW 54008, 'El precio unitario excede 99,999,999.99.', 1;

        IF @PRECIO_UNITARIO <> ROUND(@PRECIO_UNITARIO, 2)
            THROW 54009, 'El precio unitario admite maximo 2 decimales.', 1;

        IF @UNIDAD_MEDIDA IS NULL OR LEN(@UNIDAD_MEDIDA) = 0
            THROW 54010, 'La unidad de medida es obligatoria.', 1;

        IF LEN(@UNIDAD_MEDIDA) > 20
            THROW 54011, 'La unidad de medida excede los 20 caracteres.', 1;

        IF @UNIDAD_MEDIDA LIKE '%[^A-Za-z0-9 ./]%'
            THROW 54012, 'La unidad de medida tiene caracteres invalidos.', 1;

        SET
            @UNIDAD_MEDIDA
            = UPPER(LEFT(@UNIDAD_MEDIDA, 1))
            + LOWER(SUBSTRING(@UNIDAD_MEDIDA, 2, 20));

        IF @PORCENTAJE_IMPUESTO IS NULL
            THROW 54013, 'El porcentaje de impuesto es obligatorio.', 1;

        IF @PORCENTAJE_IMPUESTO < 0
            THROW 54014, 'El impuesto no puede ser negativo.', 1;

        IF @PORCENTAJE_IMPUESTO NOT IN (0, 1, 2, 4, 8, 13)
            THROW 54015, 'Impuesto invalido: use 0, 1, 2, 4, 8 o 13.', 1;

        BEGIN TRANSACTION;

        IF
            EXISTS (
                SELECT 1
                FROM SERVICIOS WITH (UPDLOCK, HOLDLOCK)
                WHERE COD_INTERNO = @COD_INTERNO
            )
            THROW 54016, 'Ya existe un servicio con ese codigo interno.', 1;

        INSERT INTO SERVICIOS (
            COD_INTERNO,
            DESCRIPCION,
            PRECIO_UNITARIO,
            UNIDAD_MEDIDA,
            PORCENTAJE_IMPUESTO,
            ESTADO,
            FECHA_CREACION
        )
        VALUES (
            @COD_INTERNO,
            @DESCRIPCION,
            CAST(@PRECIO_UNITARIO AS DECIMAL(10, 2)),
            @UNIDAD_MEDIDA,
            CAST(@PORCENTAJE_IMPUESTO AS DECIMAL(5, 2)),
            @ESTADO,
            CAST(GETDATE() AS DATE)
        );

        SET @ID_SERVICIO = SCOPE_IDENTITY();

        SELECT @ID_TABLA_AUDITADA = ID_TABLA_AUDITADA
        FROM TABLA_AUDITADA
        WHERE NOMBRE_TABLA = 'SERVICIOS';

        IF @ID_TABLA_AUDITADA IS NULL
            BEGIN
                INSERT INTO TABLA_AUDITADA (NOMBRE_TABLA)
                VALUES ('SERVICIOS');

                SET @ID_TABLA_AUDITADA = SCOPE_IDENTITY();
            END;

        SET @NUEVO_ESTADO = (
            SELECT
                S.ID_SERVICIO,
                S.COD_INTERNO,
                S.DESCRIPCION,
                S.PRECIO_UNITARIO,
                S.UNIDAD_MEDIDA,
                S.PORCENTAJE_IMPUESTO,
                S.ESTADO,
                S.FECHA_CREACION
            FROM SERVICIOS AS S
            WHERE S.ID_SERVICIO = @ID_SERVICIO
            FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
        );
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        SET @ID_SERVICIO = NULL;

        IF
            ERROR_NUMBER() IN (2601, 2627)
            AND ERROR_MESSAGE() LIKE '%UQ_COD_INTERNO_SERVICOS%'
            THROW 54016, 'Ya existe un servicio con ese codigo interno.', 1;

        THROW;
    END CATCH;
END;
GO
