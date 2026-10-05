uSE SISTEMADEFACTURACION;
GO

DECLARE @Id INT;

-- SAN JOSÉ (Distrito 10101 – Carmen)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida Central, Edificio Omega, piso 3, oficina 301', @IdDistrito=10101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 1, Torre Empresarial Nova, piso 7, suite 702', @IdDistrito=10101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Centro Corporativo Prisma, módulo B12', @IdDistrito=10101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Edificio Sigma, recepción nivel 1', @IdDistrito=10101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 7, Plaza Comercial Central, local 18', @IdDistrito=10101, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Distrito 10102 – Merced)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Edificio Empresarial Merced, piso 2, oficina 205', @IdDistrito=10102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 9, Torre Meridiano, piso 11, suite 1104', @IdDistrito=10102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Centro Ejecutivo Norte, módulo C-07', @IdDistrito=10102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 11, Edificio Delta, piso 4, oficina 402', @IdDistrito=10102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 8, Plaza Merced, local empresarial 9', @IdDistrito=10102, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Distrito 10103 – Hospital)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Paseo Colón, Torre Médica Central, piso 5, consultorio 501', @IdDistrito=10103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 10, Edificio Clínico Horizonte, piso 1, módulo A3', @IdDistrito=10103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 20, Centro Profesional Oeste, oficina 214', @IdDistrito=10103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 12, Torre Médica Sigma, piso 6, consultorio 603', @IdDistrito=10103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 18, Plaza Hospital, local 7', @IdDistrito=10103, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Distrito 10104 – Catedral)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 10, Edificio Catedral Business Center, piso 8', @IdDistrito=10104, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 21, Torre Catedral, piso 3, oficina 305', @IdDistrito=10104, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 12, Centro Ejecutivo Catedral, módulo D14', @IdDistrito=10104, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 19, Plaza Catedral, local corporativo 11', @IdDistrito=10104, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 14, Edificio Empresarial Oriente, piso 2', @IdDistrito=10104, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Distrito 10105 – Zapote)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Costado este de la iglesia de Zapote, Edificio Zeta, piso 4', @IdDistrito=10105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 34, Torre Zapote, piso 9, suite 903', @IdDistrito=10105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 25, Plaza Empresarial Zapote, local 6', @IdDistrito=10105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 36, Edificio Corporativo Sur, piso 1', @IdDistrito=10105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 27, Centro Ejecutivo Zapote, módulo B4', @IdDistrito=10105, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (Distrito 20101 – Alajuela centro)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida Central, Edificio Alajuela Business, piso 2', @IdDistrito=20101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 1, Torre Empresarial Alajuela, piso 5, oficina 502', @IdDistrito=20101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Plaza Comercial Alajuela, local 14', @IdDistrito=20101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Edificio Omega Alajuela, piso 7', @IdDistrito=20101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 7, Centro Ejecutivo Central, módulo C9', @IdDistrito=20101, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (Distrito 30101 – Oriental)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Cartago centro, Edificio Empresarial Oriente, piso 3', @IdDistrito=30101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Torre Cartago, piso 10, suite 1001', @IdDistrito=30101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Comercial Oriental, local 5', @IdDistrito=30101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 6, Centro Ejecutivo Cartago, módulo B3', @IdDistrito=30101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 8, Edificio Sigma Cartago, piso 1', @IdDistrito=30101, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Goicoechea – 10801)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 15, Edificio Goicoechea Business Hub, piso 4, oficina 401', @IdDistrito=10801, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 52, Torre Ejecutiva Norte, piso 6, suite 602', @IdDistrito=10801, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Boulevard Goicoechea, Centro Corporativo Plaza Norte, local 23', @IdDistrito=10801, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Santa Ana – 10901)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Santa Ana centro, Edificio Empresarial Santa Ana, piso 3', @IdDistrito=10901, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida Santa Ana, Torre Oeste, piso 8, oficina 804', @IdDistrito=10901, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Comercial Santa Ana, local 12', @IdDistrito=10901, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Tibás – 11301)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Juan de Tibás, Edificio Empresarial Tibás, piso 2', @IdDistrito=11301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 9, Torre Tibás Norte, piso 10, suite 1003', @IdDistrito=11301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Tibás, local corporativo 7', @IdDistrito=11301, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (San Ramón – 20201)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Ramón centro, Edificio Ejecutivo San Ramón, piso 4', @IdDistrito=20201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Torre San Ramón, piso 9, suite 903', @IdDistrito=20201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Comercial San Ramón, local 11', @IdDistrito=20201, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (Grecia – 20301)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Grecia centro, Edificio Grecia Business Center, piso 5', @IdDistrito=20301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Torre Grecia, piso 7, oficina 702', @IdDistrito=20301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Grecia, local empresarial 9', @IdDistrito=20301, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (Paraíso – 30201)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Paraíso centro, Edificio Empresarial Paraíso, piso 3', @IdDistrito=30201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Torre Paraíso, piso 6, suite 602', @IdDistrito=30201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Comercial Paraíso, local 14', @IdDistrito=30201, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (Tres Ríos – 30301)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Tres Ríos, Edificio Ejecutivo La Unión, piso 4', @IdDistrito=30301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Torre Tres Ríos, piso 9, oficina 905', @IdDistrito=30301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 7, Plaza Tres Ríos, local corporativo 6', @IdDistrito=30301, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Heredia centro – 40101)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Heredia centro, Edificio Fortín Empresarial, piso 2', @IdDistrito=40101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Torre Heredia, piso 11, suite 1102', @IdDistrito=40101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Heredia, local 17', @IdDistrito=40101, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Barva – 40201)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Barva centro, Edificio Barva Business, piso 3', @IdDistrito=40201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Torre Barva, piso 5, oficina 503', @IdDistrito=40201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Barva, local empresarial 8', @IdDistrito=40201, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Liberia – 50101)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Liberia centro, Edificio Guanacaste Business Hub, piso 4', @IdDistrito=50101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Torre Liberia, piso 8, suite 804', @IdDistrito=50101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Liberia, local corporativo 10', @IdDistrito=50101, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Nicoya – 50201)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Nicoya centro, Edificio Colonial Empresarial, piso 2', @IdDistrito=50201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Torre Nicoya, piso 7, oficina 701', @IdDistrito=50201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Nicoya, local 13', @IdDistrito=50201, @IdDireccionGenerado=@Id OUTPUT;

-- PUNTARENAS (Puntarenas – 60101)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Paseo de los Turistas, Edificio Marítimo Empresarial, piso 3', @IdDistrito=60101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Torre Puntarenas, piso 10, suite 1005', @IdDistrito=60101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Puntarenas, local corporativo 6', @IdDistrito=60101, @IdDireccionGenerado=@Id OUTPUT;

-- LIMÓN (Limón centro – 70101)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Limón centro, Edificio Caribe Business Center, piso 2', @IdDistrito=70101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Torre Limón, piso 9, oficina 904', @IdDistrito=70101, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Caribe, local empresarial 11', @IdDistrito=70101, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Curridabat – 11801)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Curridabat centro, Torre Empresarial Este, piso 4, oficina 402', @IdDistrito=11801, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 36, Edificio Curridabat Business, piso 7, suite 703', @IdDistrito=11801, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 29, Plaza Curridabat, local corporativo 15', @IdDistrito=11801, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Montes de Oca – 11501)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Pedro, Edificio Universitario Empresarial, piso 3', @IdDistrito=11501, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Torre San Pedro, piso 9, oficina 904', @IdDistrito=11501, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza San Pedro, local 18', @IdDistrito=11501, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Escazú – 10201)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Escazú centro, Torre Oeste Empresarial, piso 6', @IdDistrito=10201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida Escazú, Edificio Sigma, piso 10, suite 1002', @IdDistrito=10201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 2, Plaza Escazú, local corporativo 21', @IdDistrito=10201, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (San Carlos – 21001)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Quesada, Torre Norte Empresarial, piso 5', @IdDistrito=21001, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida Central, Edificio San Carlos Business, piso 8, oficina 803', @IdDistrito=21001, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Quesada, local corporativo 12', @IdDistrito=21001, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (Atenas – 20501)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Atenas centro, Edificio Empresarial Atenas, piso 2', @IdDistrito=20501, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Torre Atenas, piso 6, suite 602', @IdDistrito=20501, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Atenas, local 9', @IdDistrito=20501, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (Turrialba – 30501)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Turrialba centro, Edificio Empresarial Turrialba, piso 3', @IdDistrito=30501, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Torre Turrialba, piso 7, oficina 701', @IdDistrito=30501, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Turrialba, local corporativo 11', @IdDistrito=30501, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (La Unión – 30301)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Tres Ríos, Torre Empresarial La Unión, piso 5', @IdDistrito=30301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 4, Edificio La Unión Business, piso 9, suite 903', @IdDistrito=30301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 8, Plaza La Unión, local 16', @IdDistrito=30301, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Santo Domingo – 40301)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Santo Domingo centro, Edificio Empresarial Domingo, piso 2', @IdDistrito=40301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Torre Domingo, piso 10, oficina 1004', @IdDistrito=40301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Domingo, local corporativo 7', @IdDistrito=40301, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (San Pablo – 40901)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Pablo centro, Edificio Empresarial San Pablo, piso 4', @IdDistrito=40901, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Torre San Pablo, piso 8, suite 802', @IdDistrito=40901, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza San Pablo, local 10', @IdDistrito=40901, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Santa Cruz – 50301)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Santa Cruz centro, Edificio Empresarial Guanacaste, piso 3', @IdDistrito=50301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Torre Santa Cruz, piso 6, oficina 604', @IdDistrito=50301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Santa Cruz, local corporativo 13', @IdDistrito=50301, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Bagaces – 50401)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Bagaces centro, Edificio Empresarial Bagaces, piso 2', @IdDistrito=50401, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Torre Bagaces, piso 5, suite 503', @IdDistrito=50401, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Bagaces, local 8', @IdDistrito=50401, @IdDireccionGenerado=@Id OUTPUT;

-- PUNTARENAS (Golfito – 60701)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Golfito centro, Edificio Empresarial Pacífico, piso 3', @IdDistrito=60701, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Torre Golfito, piso 9, oficina 902', @IdDistrito=60701, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Golfito, local corporativo 6', @IdDistrito=60701, @IdDireccionGenerado=@Id OUTPUT;

-- LIMÓN (Guápiles – 70201)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Guápiles centro, Edificio Empresarial Caribe Norte, piso 2', @IdDistrito=70201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Torre Guápiles, piso 7, suite 703', @IdDistrito=70201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Guápiles, local 12', @IdDistrito=70201, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Desamparados – 10301)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Desamparados centro, Torre Empresarial Sur, piso 3, oficina 302', @IdDistrito=10301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 14, Edificio Desamparados Business, piso 6, suite 604', @IdDistrito=10301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 10, Plaza Desamparados, local corporativo 9', @IdDistrito=10301, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Pavas – 10109)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Pavas, Boulevard Empresarial Oeste, piso 4, oficina 401', @IdDistrito=10109, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 39, Torre Pavas, piso 8, suite 803', @IdDistrito=10109, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 27, Plaza Pavas, local corporativo 12', @IdDistrito=10109, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Santa Ana – 10903)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Pozos de Santa Ana, Torre Empresarial del Valle, piso 5', @IdDistrito=10903, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 7, Edificio Santa Ana Corporate, piso 9, oficina 904', @IdDistrito=10903, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Santa Ana Norte, local 14', @IdDistrito=10903, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (Alajuela – 20102)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San José de Alajuela, Torre Empresarial Norte, piso 4', @IdDistrito=20102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 5, Edificio Alajuela Corporate, piso 7, suite 702', @IdDistrito=20102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 9, Plaza Alajuela Norte, local 11', @IdDistrito=20102, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (Grecia – 20303)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San José de Grecia, Torre Empresarial Grecia Sur, piso 3', @IdDistrito=20303, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 4, Edificio Grecia Corporate, piso 8, oficina 804', @IdDistrito=20303, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Grecia Sur, local corporativo 10', @IdDistrito=20303, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (Cartago – 30102)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Cartago Occidental, Torre Empresarial Cartago Oeste, piso 2', @IdDistrito=30102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Cartago Corporate, piso 6, suite 603', @IdDistrito=30102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Cartago Oeste, local 15', @IdDistrito=30102, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (Paraíso – 30203)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Orosi, Torre Empresarial Orosi, piso 4', @IdDistrito=30203, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Orosi Business, piso 7, oficina 702', @IdDistrito=30203, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Orosi, local corporativo 13', @IdDistrito=30203, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Heredia – 40103)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Francisco de Heredia, Torre Empresarial Norte, piso 3', @IdDistrito=40103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Heredia Corporate, piso 9, suite 905', @IdDistrito=40103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Heredia Norte, local 18', @IdDistrito=40103, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Barva – 40203)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Pablo de Barva, Torre Empresarial Barva, piso 2', @IdDistrito=40203, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Barva Corporate, piso 7, oficina 703', @IdDistrito=40203, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Barva Sur, local corporativo 9', @IdDistrito=40203, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Liberia – 50103)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Mayorga, Torre Empresarial Liberia Norte, piso 3', @IdDistrito=50103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Liberia Corporate, piso 8, suite 802', @IdDistrito=50103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Liberia Norte, local 12', @IdDistrito=50103, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Nicoya – 50203)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Antonio de Nicoya, Torre Empresarial Nicoya Sur, piso 4', @IdDistrito=50203, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Nicoya Corporate, piso 6, oficina 604', @IdDistrito=50203, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Nicoya Sur, local corporativo 11', @IdDistrito=50203, @IdDireccionGenerado=@Id OUTPUT;

-- PUNTARENAS (Puntarenas – 60108)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Barranca, Torre Empresarial Pacífico Norte, piso 5', @IdDistrito=60108, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 4, Edificio Puntarenas Corporate, piso 9, suite 903', @IdDistrito=60108, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 7, Plaza Barranca, local corporativo 14', @IdDistrito=60108, @IdDireccionGenerado=@Id OUTPUT;

-- LIMÓN (Limón – 70103)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Río Blanco, Torre Empresarial Caribe Oeste, piso 3', @IdDistrito=70103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Caribe Corporate, piso 7, oficina 702', @IdDistrito=70103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Caribe Oeste, local 10', @IdDistrito=70103, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Aserrí – 10601)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Aserrí centro, Torre Empresarial Sur, piso 3, oficina 301', @IdDistrito=10601, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 4, Edificio Aserrí Corporate, piso 7, suite 702', @IdDistrito=10601, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Aserrí, local corporativo 12', @IdDistrito=10601, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Puriscal – 10401)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Puriscal centro, Torre Empresarial Oeste, piso 2', @IdDistrito=10401, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Puriscal Corporate, piso 8, oficina 804', @IdDistrito=10401, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Puriscal, local 10', @IdDistrito=10401, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Mora – 10701)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Ciudad Colón, Torre Empresarial Colón, piso 4', @IdDistrito=10701, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Colón Corporate, piso 9, suite 903', @IdDistrito=10701, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Colón, local corporativo 11', @IdDistrito=10701, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (Palmares – 20701)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Palmares centro, Torre Empresarial Palmares, piso 3', @IdDistrito=20701, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Palmares Corporate, piso 6, oficina 602', @IdDistrito=20701, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Palmares, local 14', @IdDistrito=20701, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (Naranjo – 20601)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Naranjo centro, Torre Empresarial Naranjo, piso 5', @IdDistrito=20601, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Naranjo Corporate, piso 8, suite 803', @IdDistrito=20601, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Naranjo, local corporativo 9', @IdDistrito=20601, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (Cartago – 30103)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Carmen de Cartago, Torre Empresarial Carmen, piso 2', @IdDistrito=30103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 4, Edificio Carmen Corporate, piso 7, oficina 703', @IdDistrito=30103, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 8, Plaza Carmen, local corporativo 13', @IdDistrito=30103, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (La Unión – 30303)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Juan de La Unión, Torre Empresarial San Juan, piso 3', @IdDistrito=30303, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio San Juan Corporate, piso 6, suite 604', @IdDistrito=30303, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza San Juan, local 10', @IdDistrito=30303, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Belén – 40701)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Antonio de Belén, Torre Empresarial Belén, piso 4', @IdDistrito=40701, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Belén Corporate, piso 9, oficina 904', @IdDistrito=40701, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Belén, local corporativo 12', @IdDistrito=40701, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Flores – 40801)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Joaquín de Flores, Torre Empresarial Flores, piso 2', @IdDistrito=40801, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 4, Edificio Flores Corporate, piso 7, suite 702', @IdDistrito=40801, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Flores, local 11', @IdDistrito=40801, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Santa Cruz – 50303)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Veintisiete de Abril, Torre Empresarial Santa Cruz Sur, piso 3', @IdDistrito=50303, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Santa Cruz Sur Corporate, piso 8, oficina 802', @IdDistrito=50303, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Santa Cruz Sur, local corporativo 10', @IdDistrito=50303, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Carrillo – 50501)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Filadelfia, Torre Empresarial Carrillo, piso 4', @IdDistrito=50501, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Carrillo Corporate, piso 7, suite 703', @IdDistrito=50501, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Carrillo, local corporativo 12', @IdDistrito=50501, @IdDireccionGenerado=@Id OUTPUT;

-- PUNTARENAS (Esparza – 60201)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Esparza centro, Torre Empresarial Esparza, piso 3', @IdDistrito=60201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Esparza Corporate, piso 6, oficina 603', @IdDistrito=60201, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Esparza, local corporativo 9', @IdDistrito=60201, @IdDireccionGenerado=@Id OUTPUT;

-- LIMÓN (Siquirres – 70301)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Siquirres centro, Torre Empresarial Caribe Este, piso 2', @IdDistrito=70301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Siquirres Corporate, piso 7, suite 703', @IdDistrito=70301, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Siquirres, local corporativo 11', @IdDistrito=70301, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Hatillo – 10110)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Hatillo 2, Torre Empresarial Hatillo, piso 3, oficina 301', @IdDistrito=10110, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 34, Edificio Hatillo Corporate, piso 7, suite 702', @IdDistrito=10110, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 18, Plaza Hatillo, local corporativo 11', @IdDistrito=10110, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (San Sebastián – 10111)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Sebastián, Torre Empresarial Sur, piso 4', @IdDistrito=10111, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 22, Edificio San Sebastián Corporate, piso 8, oficina 804', @IdDistrito=10111, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 25, Plaza San Sebastián, local 10', @IdDistrito=10111, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Alajuelita – 11001)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Alajuelita centro, Torre Empresarial Alajuelita, piso 3', @IdDistrito=11001, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 5, Edificio Alajuelita Corporate, piso 6, suite 603', @IdDistrito=11001, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 9, Plaza Alajuelita, local corporativo 12', @IdDistrito=11001, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (San Carlos – 21003)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Daniel Flores, Torre Empresarial Norte, piso 2', @IdDistrito=21003, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 4, Edificio San Carlos Norte, piso 7, oficina 703', @IdDistrito=21003, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza San Carlos Norte, local 14', @IdDistrito=21003, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (Grecia – 20302)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Isidro de Grecia, Torre Empresarial Grecia Norte, piso 3', @IdDistrito=20302, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Grecia Norte Corporate, piso 8, suite 802', @IdDistrito=20302, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Grecia Norte, local corporativo 10', @IdDistrito=20302, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (Cartago – 30104)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Nicolás, Torre Empresarial Cartago Norte, piso 4', @IdDistrito=30104, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Cartago Norte Corporate, piso 9, oficina 904', @IdDistrito=30104, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 7, Plaza Cartago Norte, local corporativo 13', @IdDistrito=30104, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (Paraíso – 30202)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Santiago de Paraíso, Torre Empresarial Santiago, piso 2', @IdDistrito=30202, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Santiago Corporate, piso 6, suite 602', @IdDistrito=30202, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Santiago, local corporativo 9', @IdDistrito=30202, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Heredia – 40102)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Mercedes, Torre Empresarial Mercedes, piso 3', @IdDistrito=40102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Mercedes Corporate, piso 8, oficina 803', @IdDistrito=40102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Mercedes, local corporativo 12', @IdDistrito=40102, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Santo Domingo – 40302)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Vicente de Santo Domingo, Torre Empresarial Vicente, piso 2', @IdDistrito=40302, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Vicente Corporate, piso 7, suite 703', @IdDistrito=40302, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Vicente, local corporativo 11', @IdDistrito=40302, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Liberia – 50102)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Cañas Dulces, Torre Empresarial Liberia Este, piso 4', @IdDistrito=50102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Liberia Este Corporate, piso 9, oficina 902', @IdDistrito=50102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Liberia Este, local corporativo 10', @IdDistrito=50102, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Nicoya – 50202)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Mansión, Torre Empresarial Mansión, piso 3', @IdDistrito=50202, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Mansión Corporate, piso 7, suite 702', @IdDistrito=50202, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Mansión, local corporativo 12', @IdDistrito=50202, @IdDireccionGenerado=@Id OUTPUT;

-- PUNTARENAS (Puntarenas – 60112)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Chacarita, Torre Empresarial Chacarita, piso 2', @IdDistrito=60112, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Chacarita Corporate, piso 6, oficina 603', @IdDistrito=60112, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Chacarita, local corporativo 9', @IdDistrito=60112, @IdDireccionGenerado=@Id OUTPUT;

-- LIMÓN (Limón – 70102)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Valle La Estrella, Torre Empresarial Caribe Norte, piso 3', @IdDistrito=70102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 4, Edificio Caribe Norte Corporate, piso 8, suite 804', @IdDistrito=70102, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Caribe Norte, local corporativo 11', @IdDistrito=70102, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Escazú – 10202)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Antonio de Escazú, Torre Empresarial Oeste, piso 3, oficina 302', @IdDistrito=10202, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 7, Edificio Escazú Norte, piso 8, suite 804', @IdDistrito=10202, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Escazú Norte, local corporativo 12', @IdDistrito=10202, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Goicoechea – 10803)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle Blancos, Torre Empresarial Blancos, piso 2', @IdDistrito=10803, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 15, Edificio Blancos Corporate, piso 6, oficina 603', @IdDistrito=10803, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 19, Plaza Blancos, local corporativo 10', @IdDistrito=10803, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Montes de Oca – 11502)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Sabanilla, Torre Empresarial Sabanilla, piso 4', @IdDistrito=11502, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Sabanilla Corporate, piso 7, suite 703', @IdDistrito=11502, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Sabanilla, local corporativo 11', @IdDistrito=11502, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (Alajuela – 20105)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='La Guácima, Torre Empresarial Guácima, piso 3', @IdDistrito=20105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Guácima Corporate, piso 8, oficina 802', @IdDistrito=20105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Guácima, local corporativo 14', @IdDistrito=20105, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (San Ramón – 20203)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Juan, Torre Empresarial San Juan, piso 2', @IdDistrito=20203, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio San Juan Corporate, piso 6, suite 603', @IdDistrito=20203, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza San Juan, local corporativo 9', @IdDistrito=20203, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (La Unión – 30304)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Rafael de La Unión, Torre Empresarial Rafael, piso 4', @IdDistrito=30304, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 6, Edificio Rafael Corporate, piso 9, oficina 904', @IdDistrito=30304, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 8, Plaza Rafael, local corporativo 13', @IdDistrito=30304, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (Turrialba – 30503)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='La Isabel, Torre Empresarial Isabel, piso 3', @IdDistrito=30503, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Isabel Corporate, piso 7, suite 703', @IdDistrito=30503, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Isabel, local corporativo 10', @IdDistrito=30503, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Heredia – 40104)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Ulloa, Torre Empresarial Ulloa, piso 2', @IdDistrito=40104, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Ulloa Corporate, piso 8, oficina 803', @IdDistrito=40104, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Ulloa, local corporativo 12', @IdDistrito=40104, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (San Rafael – 40501)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Rafael centro, Torre Empresarial Rafael Norte, piso 3', @IdDistrito=40501, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Rafael Norte Corporate, piso 7, suite 702', @IdDistrito=40501, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Rafael Norte, local corporativo 11', @IdDistrito=40501, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Liberia – 50104)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Nacascolo, Torre Empresarial Nacascolo, piso 4', @IdDistrito=50104, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Nacascolo Corporate, piso 9, oficina 904', @IdDistrito=50104, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Nacascolo, local corporativo 13', @IdDistrito=50104, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Nicoya – 50204)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Quebrada Honda, Torre Empresarial Honda, piso 2', @IdDistrito=50204, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Honda Corporate, piso 6, suite 603', @IdDistrito=50204, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Honda, local corporativo 9', @IdDistrito=50204, @IdDireccionGenerado=@Id OUTPUT;

-- PUNTARENAS (Puntarenas – 60114)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Acapulco, Torre Empresarial Acapulco, piso 3', @IdDistrito=60114, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 4, Edificio Acapulco Corporate, piso 8, oficina 802', @IdDistrito=60114, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Acapulco, local corporativo 11', @IdDistrito=60114, @IdDireccionGenerado=@Id OUTPUT;

-- LIMÓN (Pococí – 70202)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Jiménez, Torre Empresarial Jiménez, piso 2', @IdDistrito=70202, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Jiménez Corporate, piso 7, suite 703', @IdDistrito=70202, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Jiménez, local corporativo 10', @IdDistrito=70202, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Tibás – 11304)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='León XIII, Torre Empresarial León, piso 3, oficina 302', @IdDistrito=11304, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 9, Edificio León Corporate, piso 7, suite 703', @IdDistrito=11304, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 11, Plaza León, local corporativo 12', @IdDistrito=11304, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Moravia – 11402)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Jerónimo de Moravia, Torre Empresarial Moravia, piso 4', @IdDistrito=11402, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Moravia Corporate, piso 8, oficina 804', @IdDistrito=11402, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Moravia, local corporativo 10', @IdDistrito=11402, @IdDireccionGenerado=@Id OUTPUT;

-- SAN JOSÉ (Montes de Oca – 11504)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Rafael de Montes de Oca, Torre Empresarial Rafael, piso 3', @IdDistrito=11504, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Rafael Corporate, piso 7, suite 702', @IdDistrito=11504, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Rafael, local corporativo 11', @IdDistrito=11504, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (Grecia – 20304)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Roque de Grecia, Torre Empresarial Roque, piso 2', @IdDistrito=20304, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Roque Corporate, piso 6, oficina 603', @IdDistrito=20304, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Roque, local corporativo 9', @IdDistrito=20304, @IdDireccionGenerado=@Id OUTPUT;

-- ALAJUELA (San Carlos – 21005)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Pittier, Torre Empresarial Pittier, piso 3', @IdDistrito=21005, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 4, Edificio Pittier Corporate, piso 8, suite 804', @IdDistrito=21005, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Pittier, local corporativo 12', @IdDistrito=21005, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (Cartago – 30105)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Agua Caliente, Torre Empresarial Agua Caliente, piso 2', @IdDistrito=30105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Agua Caliente Corporate, piso 7, oficina 703', @IdDistrito=30105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Agua Caliente, local corporativo 10', @IdDistrito=30105, @IdDireccionGenerado=@Id OUTPUT;

-- CARTAGO (La Unión – 30302)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San Diego, Torre Empresarial San Diego, piso 4', @IdDistrito=30302, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio San Diego Corporate, piso 9, suite 903', @IdDistrito=30302, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza San Diego, local corporativo 13', @IdDistrito=30302, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Heredia – 40105)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Varablanca, Torre Empresarial Varablanca, piso 3', @IdDistrito=40105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Varablanca Corporate, piso 7, oficina 702', @IdDistrito=40105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Varablanca, local corporativo 11', @IdDistrito=40105, @IdDireccionGenerado=@Id OUTPUT;

-- HEREDIA (Barva – 40204)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='San José de Barva, Torre Empresarial Barva Este, piso 2', @IdDistrito=40204, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 4, Edificio Barva Este Corporate, piso 6, suite 603', @IdDistrito=40204, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 6, Plaza Barva Este, local corporativo 9', @IdDistrito=40204, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Liberia – 50105)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Curubandé, Torre Empresarial Curubandé, piso 3', @IdDistrito=50105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Curubandé Corporate, piso 8, oficina 804', @IdDistrito=50105, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Curubandé, local corporativo 12', @IdDistrito=50105, @IdDireccionGenerado=@Id OUTPUT;

-- GUANACASTE (Nicoya – 50205)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Sámara, Torre Empresarial Sámara, piso 4', @IdDistrito=50205, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 1, Edificio Sámara Corporate, piso 7, suite 703', @IdDistrito=50205, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 3, Plaza Sámara, local corporativo 10', @IdDistrito=50205, @IdDireccionGenerado=@Id OUTPUT;

-- PUNTARENAS (Puntarenas – 60115)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='El Roble, Torre Empresarial Roble, piso 2', @IdDistrito=60115, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Roble Corporate, piso 6, oficina 603', @IdDistrito=60115, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Roble, local corporativo 9', @IdDistrito=60115, @IdDireccionGenerado=@Id OUTPUT;

-- LIMÓN (Pococí – 70203)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Rita, Torre Empresarial Rita, piso 3', @IdDistrito=70203, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 2, Edificio Rita Corporate, piso 8, suite 802', @IdDistrito=70203, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 4, Plaza Rita, local corporativo 11', @IdDistrito=70203, @IdDireccionGenerado=@Id OUTPUT;

-- LIMÓN (Siquirres – 70302)
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Pacuarito, Torre Empresarial Pacuarito, piso 2', @IdDistrito=70302, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Avenida 3, Edificio Pacuarito Corporate, piso 7, oficina 703', @IdDistrito=70302, @IdDireccionGenerado=@Id OUTPUT;
EXEC dbo.pr_InsertarDireccion @DireccionExacta='Calle 5, Plaza Pacuarito, local corporativo 10', @IdDistrito=70302, @IdDireccionGenerado=@Id OUTPUT;
