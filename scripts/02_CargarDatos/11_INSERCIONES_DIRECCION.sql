USE SISTEMADEFACTURACION;
GO

WITH N0 AS (
    SELECT 1 AS C
    UNION ALL
    SELECT 1
    UNION ALL
    SELECT 1
    UNION ALL
    SELECT 1
    UNION ALL
    SELECT 1
    UNION ALL
    SELECT 1
    UNION ALL
    SELECT 1
    UNION ALL
    SELECT 1
    UNION ALL
    SELECT 1
    UNION ALL
    SELECT 1
),
N1 AS (
    SELECT 1 AS C 
    FROM N0 AS A
    CROSS JOIN N0 AS B
),
N2 AS (
    SELECT 1 AS C 
    FROM N1 AS A
    CROSS JOIN N1 AS B
),
N3 AS (
    SELECT 1 AS C 
    FROM N2 AS A
    CROSS JOIN N0 AS B
),
Numeros AS (
    SELECT TOP (50000) 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS N
    FROM N3
)

INSERT INTO DIRECCION (DIRECCION_EXACTA, ID_DISTRITO)
SELECT
    CONCAT(
        'Calle ', 
        N, 
        ', Ave Central, Edificio Corporativo #', 
        N
    ) AS DIRECCION_EXACTA,
    10101 + (N % 5) AS ID_DISTRITO
FROM Numeros;
