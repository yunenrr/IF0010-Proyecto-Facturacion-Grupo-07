USE SISTEMADEFACTURACION;
GO

DECLARE @CONTADOR INT = 1;
DECLARE @CEDULAGEN VARCHAR(20);
DECLARE @NOMBREGEN VARCHAR(50);
DECLARE @APELLIDOGEN VARCHAR(50);
DECLARE @RAZONGEN VARCHAR(100);
DECLARE @CORREOGEN VARCHAR(100);
DECLARE @TELEFONOGEN VARCHAR(20);
DECLARE @IDDIRECCIONVALIDO INT;
DECLARE @IDSALIDA INT;

SET NOCOUNT ON;

WHILE @CONTADOR <= 50000
    BEGIN
        SET @IDDIRECCIONVALIDO = @CONTADOR;
        
        SET @CORREOGEN = 'clienteprueba'
            + CAST(@CONTADOR AS VARCHAR(10))
            + '@facturacioncr.com';
            
        SET @TELEFONOGEN = '8'
            + RIGHT(
                '0000000' + CAST(7000000 + @CONTADOR AS VARCHAR(10)),
                7
            );

        -- Alternamos entre cliente físico y jurídico
        IF (@CONTADOR % 2 = 0)
            BEGIN
                -- FÍSICO
                SET @CEDULAGEN = '1-'
                    + RIGHT(
                        '0000' 
                        + CAST((@CONTADOR % 9000) + 1000 AS VARCHAR(10)),
                        4
                    )
                    + '-'
                    + RIGHT(
                        '0000' + CAST(@CONTADOR AS VARCHAR(10)),
                        4
                    );
                    
                SET @NOMBREGEN = 'Nombre'
                    + CAST(@CONTADOR AS VARCHAR(10));
                    
                SET @APELLIDOGEN = 'Apellido'
                    + CAST(@CONTADOR AS VARCHAR(10));

                EXEC DBO.PR_MIGRAR_CLIENTE_FISICO
                    @CEDULA = @CEDULAGEN,
                    @NOMBRE = @NOMBREGEN,
                    @APELLIDO1 = @APELLIDOGEN,
                    @CORREOELECTRONICO = @CORREOGEN,
                    @TELEFONO = @TELEFONOGEN,
                    @IDDIRECCION = @IDDIRECCIONVALIDO,
                    @IDCLIENTEGENERADO = @IDSALIDA OUTPUT;
            END
        ELSE
            BEGIN
                -- JURÍDICO
                SET @CEDULAGEN = '3-101-'
                    + RIGHT(
                        '000000' + CAST(@CONTADOR AS VARCHAR(10)),
                        6
                    );
                    
                SET @RAZONGEN = 'Empresa Cliente S.A. '
                    + CAST(@CONTADOR AS VARCHAR(10));

                EXEC DBO.PR_MIGRAR_CLIENTE_JURIDICO
                    @CEDULA = @CEDULAGEN,
                    @RAZONSOCIAL = @RAZONGEN,
                    @CORREOELECTRONICO = @CORREOGEN,
                    @TELEFONO = @TELEFONOGEN,
                    @IDDIRECCION = @IDDIRECCIONVALIDO,
                    @IDCLIENTEGENERADO = @IDSALIDA OUTPUT;
            END

        SET @CONTADOR = @CONTADOR + 1;
    END;
GO
