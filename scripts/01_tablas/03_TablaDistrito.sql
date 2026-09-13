USE SistemaDeFacturacion; 

DROP TABLE IF EXISTS distrito;
GO

CREATE TABLE distrito (
    id_distrito INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_canton INT NOT NULL,
    FOREIGN KEY (id_canton) REFERENCES canton(id_canton)
);
