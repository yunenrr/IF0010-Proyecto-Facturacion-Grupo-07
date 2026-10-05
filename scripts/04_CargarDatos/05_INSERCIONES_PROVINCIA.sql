USE SISTEMADEFACTURACION;
GO

EXEC dbo.pr_InsertarProvincia @ID_PROVINCIA=1, @Nombre='San José';
EXEC dbo.pr_InsertarProvincia @ID_PROVINCIA=2, @Nombre='Alajuela';
EXEC dbo.pr_InsertarProvincia @ID_PROVINCIA=3, @Nombre='Cartago';
EXEC dbo.pr_InsertarProvincia @ID_PROVINCIA=4, @Nombre='Heredia';
EXEC dbo.pr_InsertarProvincia @ID_PROVINCIA=5, @Nombre='Guanacaste';
EXEC dbo.pr_InsertarProvincia @ID_PROVINCIA=6, @Nombre='Puntarenas';
EXEC dbo.pr_InsertarProvincia @ID_PROVINCIA=7, @Nombre='Limón';
GO