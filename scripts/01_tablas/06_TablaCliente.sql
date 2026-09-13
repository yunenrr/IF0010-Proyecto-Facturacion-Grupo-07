USE SistemaDeFacturacion; 

DROP TABLE IF EXISTS cliente;
GO

CREATE TABLE cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL,
    nombre_razon_social VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fecha_registro DATE NOT NULL, 
    ultima_actualizacion DATE NOT NULL,
    id_direccion INT UNIQUE NOT NULL,
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);
