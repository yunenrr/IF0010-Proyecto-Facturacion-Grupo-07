USE SISTEMADEFACTURACION;
GO

SET NOCOUNT ON;

WITH NUMEROS AS (
    SELECT TOP (25000)
        ROW_NUMBER() OVER (
            ORDER BY A.OBJECT_ID, B.OBJECT_ID
        ) AS N
    FROM SYS.ALL_OBJECTS AS A
    CROSS JOIN SYS.OBJECTS AS B
)
INSERT INTO DBO.CLIENTE_FISICO (
    CEDULA,
    NOMBRE,
    APELLIDO1,
    APELLIDO2,
    CORREO_ELECTRONICO,
    TELEFONO,
    FECHA_REGISTRO,
    ULTIMA_ACTUALIZACION,
    ID_DIRECCION
)
SELECT
    CONCAT(
        '1-',
        RIGHT(
            '0000'
            + CAST((N % 9000) + 1000 AS VARCHAR(10)),
            4
        ),
        '-',
        RIGHT(
            '0000'
            + CAST(N * 2 AS VARCHAR(10)),
            4
        )
    ),
    CONCAT('Nombre', N),
    CONCAT('Apellido', N),
    CONCAT('Apellido2_', N),
    LOWER(
        CONCAT(
            'clienteprueba',
            N * 2,
            '@facturacioncr.com'
        )
    ),
    CONCAT(
        '8',
        RIGHT(
            '0000000'
            + CAST(7000000 + N AS VARCHAR(10)),
            7
        )
    ),
    GETDATE(),
    GETDATE(),
    N * 2
FROM NUMEROS;
GO

WITH NUMEROS AS (
    SELECT TOP (25000)
        ROW_NUMBER() OVER (
            ORDER BY A.OBJECT_ID, B.OBJECT_ID
        ) AS N
    FROM SYS.ALL_OBJECTS AS A
    CROSS JOIN SYS.OBJECTS AS B
)
INSERT INTO DBO.CLIENTE_JURIDICO (
    CEDULA,
    RAZON_SOCIAL,
    NOMBRE_COMERCIAL,
    CORREO_ELECTRONICO,
    TELEFONO,
    FECHA_REGISTRO,
    ULTIMA_ACTUALIZACION,
    ID_DIRECCION
)
SELECT
    CONCAT(
        '3-101-',
        RIGHT(
            '000000'
            + CAST((N * 2) - 1 AS VARCHAR(10)),
            6
        )
    ),
    CONCAT('EMPRESA CLIENTE S.A. ', N),
    CONCAT('COMERCIAL CLIENTE ', N),
    LOWER(
        CONCAT(
            'clienteprueba',
            (N * 2) - 1,
            '@facturacioncr.com'
        )
    ),
    CONCAT(
        '8',
        RIGHT(
            '0000000'
            + CAST(7000000 + N AS VARCHAR(10)),
            7
        )
    ),
    GETDATE(),
    GETDATE(),
    (N * 2) - 1
FROM NUMEROS;
GO
