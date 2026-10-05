USE SISTEMADEFACTURACION;
GO
  
DECLARE @Id INT;
DECLARE @i INT = 1;
DECLARE @total INT = 50000;
DECLARE @IdDistrito INT;
DECLARE @DireccionExacta VARCHAR(200);

IF OBJECT_ID('tempdb..#Distritos') IS NOT NULL DROP TABLE #Distritos;

SELECT ID_DISTRITO,
       ROW_NUMBER() OVER (ORDER BY ID_DISTRITO) AS rn
INTO #Distritos
FROM Distrito;

DECLARE @TotalDistritos INT = (SELECT COUNT(*) FROM #Distritos);

WHILE @i <= @total
BEGIN
    SELECT @IdDistrito = ID_DISTRITO
    FROM #Distritos
    WHERE rn = ((@i - 1) % @TotalDistritos) + 1;

    SET @DireccionExacta = 'Dirección generada #' + CAST(@i AS VARCHAR(10)) + 
                           ', Edificio Genérico ' + CAST((@i % 100) AS VARCHAR(3)) + 
                           ', piso ' + CAST((@i % 20) + 1 AS VARCHAR(2)) + 
                           ', oficina ' + CAST((@i % 50) + 1 AS VARCHAR(2));

    EXEC dbo.pr_InsertarDireccion 
        @DireccionExacta     = @DireccionExacta,
        @IdDistrito          = @IdDistrito,
        @IdDireccionGenerado = @Id OUTPUT;

    SET @i = @i + 1;
END

DROP TABLE #Distritos;
GO
