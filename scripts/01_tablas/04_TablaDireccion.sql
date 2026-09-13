USE SistemaDeFacturacion; 

DROP TABLE IF EXISTS direccion;
GO

CREATE TABLE direccion (
    id_direccion INT IDENTITY(1,1) PRIMARY KEY,
    direccion_exacta VARCHAR(255) NOT NULL,
    id_distrito INT NOT NULL,
    FOREIGN KEY (id_distrito) REFERENCES distrito(id_distrito)
);
