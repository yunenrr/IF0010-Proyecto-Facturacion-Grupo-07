USE SistemaDeFacturacion; 

DROP TABLE IF EXISTS provincia;
GO

CREATE TABLE provincia (
    id_provincia INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

