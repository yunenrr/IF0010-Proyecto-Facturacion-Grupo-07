USE SistemaDeFacturacion;
CREATE TABLE tabla_auditada (
    id_tabla_auditada INT IDENTITY(1,1) PRIMARY KEY,
    nombre_tabla NVARCHAR(50) NOT NULL,
    CONSTRAINT UQ_tabla_auditada_nombre UNIQUE (nombre_tabla)
);
CREATE TABLE historial (
    id_historial INT IDENTITY(1,1) PRIMARY KEY,
    id_tabla_auditada INT NOT NULL,
    registro_id VARCHAR(50) NOT NULL,
    operacion_realizada VARCHAR(10) NOT NULL,
    estado_previo NVARCHAR(MAX) NULL,
    nuevo_estado NVARCHAR(MAX) NULL,
    fecha_cambio DATETIME NOT NULL
        CONSTRAINT DF_historial_fecha DEFAULT GETDATE(),
    descripcion NVARCHAR(255) NULL,
    CONSTRAINT CK_historial_operacion
        CHECK (operacion_realizada IN ('INSERT', 'UPDATE', 'DELETE')),
    CONSTRAINT CK_historial_registroid
        CHECK (LEN(RTRIM(registro_id)) > 0),
    CONSTRAINT FK_historial_tabla
        FOREIGN KEY (id_tabla_auditada) REFERENCES tabla_auditada(id_tabla_auditada)
);
