USE SistemaDeFacturacion; 

DROP TABLE IF EXISTS canton;
GO

CREATE TABLE canton (
    id_canton INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_provincia INT NOT NULL,
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);
