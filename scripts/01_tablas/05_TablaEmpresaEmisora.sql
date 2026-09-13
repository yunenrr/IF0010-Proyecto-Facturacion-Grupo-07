USE SistemaDeFacturacion; 

DROP TABLE IF EXISTS empresa_emisora;
GO

CREATE TABLE empresa_emisora (
    id_empresa INT IDENTITY(1,1) PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL,
    nombre_comercial VARCHAR(100) NOT NULL,
    razon_social VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    indicador VARCHAR(10) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    id_direccion INT UNIQUE NOT NULL,
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);
