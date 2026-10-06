DECLARE @DireccionesBase TABLE (
    ID INT IDENTITY (1, 1),
    DIRECCION_EXACTA VARCHAR(500),
    ID_DISTRITO INT
);

INSERT INTO @DireccionesBase (
    DIRECCION_EXACTA,
    ID_DISTRITO
)
VALUES
('Avenida Central, Calle 1, casa Nº 1050, frente a la plaza principal', 10101),
('Calle 4, Avenidas 3 y 5, edificio El Carmen, apto 2B', 10101),
('Diagonal 26, frente al costado norte del parque', 10102),
('Paseo Colón, 150 metros oeste del hospital', 10103),
('Avenida 10, Calle 21, contiguo al templo católico', 10104),
('Costado este de la iglesia de Zapote, 75 metros sur', 10105),
('Urbanización San Francisco, etapa 2, casa #45', 10106),
('Boulevard principal de La Uruca, frente a oficinas centrales', 10107),
('Mata Redonda, Sabana Oeste, torre empresarial piso 4', 10108),
('Pavas, Rincón Grande, 200 metros norte del salón comunal', 10109),
('Hatillo 2, diagonal a la delegación policial', 10110),
('San Sebastián, puente peatonal 100 metros al este', 10111),
('Escazú centro, costado oeste del mercado municipal', 10201),
('San Antonio de Escazú, 300 metros arriba de la escuela', 10202),
('San Rafael de Escazú, condominio horizontal casa #12', 10203),
('Desamparados centro, avenida principal frente al bazar', 10301),
('San Miguel de Desamparados, contiguo al EBAIS', 10302),
('San Juan de Dios, 50 metros sur del super local', 10303),
('San Rafael Arriba, urbanización Los Girasoles casa #8', 10304),
('San Antonio de Desamparados, entrada principal', 10305),
('Frailes de Desamparados, frente a la plaza de deportes', 10306),
('Patarra, sector los pinos, casa esquinera', 10307),
('San Cristobal Norte, 100 metros del trapiche', 10308),
('Rosario de Desamparados, bajando hacia el río', 10309),
('Damas de Desamparados, costado sur de la ermita', 10310),
('San Rafael Abajo, centro comercial local 5', 10311),
('Gravilias, etapa 3, bloque 4 casa #15', 10312),
('Los Guido, sector 3, última parada de buses', 10313),
('Santiago de Puriscal, contiguo al banco estatal', 10401),
('Mercedes Sur de Puriscal, 200 metros norte del cruce', 10402),
('Barbacoas de Puriscal, frente al salón comunal', 10403),
('San Marcos de Tarrazú, costado este del parque', 10501),
('San Lorenzo de Tarrazú, sector cafetalero', 10502),
('Aserrí centro, 75 metros este del mercado', 10601),
('Tarbaca de Aserrí, mirador turístico 50 metros sur', 10602),
('Vuelta de Jorco, contiguo al escuela central', 10603),
('San Gabriel de Aserrí, frente a la plaza', 10604),
('Colón, Ciudad Colón, costado norte del mercado', 10701),
('Guayabo de Mora, 150 metros oeste del cruce', 10702),
('Tabarcia de Mora, frente a la delegación', 10703),
('Guadalupe de Goicoechea, costado este del templo', 10801),
('San Francisco de Goicoechea, urbanización la luz casa #9', 10802),
('Calle Blancos, 200 metros norte de los semáforos', 10803),
('Mata de Plátano, sector el alto, casa blanca', 10804),
('Ipis de Goicoechea, entrada principal a la urbanización', 10805),
('Rancho Redondo, 500 metros antes de la lechería', 10806),
('Purral de Goicoechea, sector 2, casa esquinera', 10807),
('Santa Ana centro, 100 metros norte de la iglesia', 10901),
('Salitral de Santa Ana, costado sur de la plaza', 10902),
('Pozos de Santa Ana, condominio los Pinos casa #22', 10903),
('Piedades de Santa Ana, sector el llano', 10905),
('Alajuelita centro, contiguo al costado sur del parque', 11001),
('San Josecito de Alajuelita, urbanización las marías', 11002),
('San Antonio de Alajuelita, 50 metros este del puente', 11003),
('Concepción de Alajuelita, sector alto', 11004),
('San Felipe de Alajuelita, frente al Ebais', 11005),
('San Isidro de Coronado, costado norte del parque', 11101),
('San Rafael de Coronado, 300 metros este del cruce', 11102),
('Patalillo de Coronado, urbanización la florida', 11104),
('San Ignacio de Acosta, frente al mercado', 11201),
('Palmichal de Acosta, bajando hacia la plaza', 11203),
('San Juan de Tibás, 150 metros norte del parque', 11301),
('Cinco Esquinas de Tibás, contiguo a la purruja', 11302),
('Anselmo Llorente de Tibás, casa #102', 11303),
('León XIII de Tibás, etapa 1, bloque 3', 11304),
('Colima de Tibás, urbanización los Álamos', 11305),
('San Vicente de Moravia, costado este del parque', 11401),
('San Jerónimo de Moravia, 200 metros norte de la escuela', 11402),
('La Trinidad de Moravia, sector el alto', 11403),
('San Pedro de Montes de Oca, frente a la fuente de la Hispanidad', 11501),
('Sabanilla de Montes de Oca, residencial del este casa #14', 11502),
('Mercedes de Montes de Oca, 100 metros sur del servicentro', 11503),
('San Rafael de Montes de Oca, contiguo al colegio', 11504),
('Curridabat centro, costado oeste de la iglesia católica', 11801),
('Granadilla de Curridabat, condominio terrazas casa #5', 11802),
('Sánchez de Curridabat, entrada principal residencial', 11803),
('Tirrases de Curridabat, sector ponceano casa #30', 11804),
('San Isidro de El General, avenida central calle 2', 11901),
('Daniel Flores, Pérez Zeledón, frente al centro comercial', 11903),
('Alajuela centro, Costado oeste del Parque Central', 20101),
('San José de Alajuela, 200m norte de la plaza', 20102),
('La Guácima de Alajuela, condominio hacienda los reyes', 20105),
('San Ramón centro, costado norte del mercado municipal', 20201),
('Grecia centro, frente a la iglesia de metal', 20301),
('Atenas centro, 150m este del parque central', 20501),
('Naranjo centro, costado oeste del templo', 20601),
('Palmares centro, 75m norte de la bomba', 20701),
('San Carlos, Quesada, costado este de la catedral', 21001),
('Cartago centro, Ruinas de Santiago 50m norte', 30101),
('Paraíso de Cartago, frente al parque metropolitano', 30201),
('Tres Ríos de La Unión, costado oeste del parque', 30301),
('Turrialba centro, frente al mercado municipal', 30501),
('Heredia centro, El Fortín 50m norte', 40101),
('Barva de Heredia, costado este de la plaza', 40201),
('Santo Domingo de Heredia, frente al parque', 40301),
('San Antonio de Belén, contiguo al polideportivo', 40701),
('Liberia centro, Guanacaste, frente al parque central', 50101),
('Nicoya centro, costado oeste del templo colonial', 50201),
('Puntarenas centro, Paseo de los Turistas frente al mar', 60101),
('Limón centro, frente al parque Vargas', 70101);

DECLARE @BLOQUE INT = 1;
DECLARE @TOTAL_BLOQUES INT = 500;
DECLARE @ID_BASE INT;
DECLARE @MAX_ID_BASE INT;
DECLARE @DIRECCION_EXACTA VARCHAR(500);
DECLARE @ID_DISTRITO INT;
DECLARE @ID_GENERADO INT;

SELECT @MAX_ID_BASE = MAX(ID) FROM @DireccionesBase;

WHILE @BLOQUE <= @TOTAL_BLOQUES
    BEGIN
        SET @ID_BASE = 1;

        WHILE @ID_BASE <= @MAX_ID_BASE
            BEGIN
                SELECT
                    @DIRECCION_EXACTA = CONCAT(
                        '[Lote ',
                        CAST(@BLOQUE AS VARCHAR(10)),
                        '] ',
                        DIRECCION_EXACTA
                    ),
                    @ID_DISTRITO = ID_DISTRITO
                FROM @DireccionesBase
                WHERE ID = @ID_BASE;

                EXEC DBO.PR_INSERTARDIRECCION
                    @DIRECCIONEXACTA = @DIRECCION_EXACTA,
                    @IDDISTRITO = @ID_DISTRITO,
                    @IDDIRECCIONGENERADO = @ID_GENERADO OUTPUT;

                SET @ID_BASE = @ID_BASE + 1;
            END;

        SET @BLOQUE = @BLOQUE + 1;
    END;
GO
