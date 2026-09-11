USE SistemaDeFacturacion;

CREATE TABLE historial(
    id_historial INT IDENTITY(1,1) PRIMARY KEY,
    tabla_afectada VARCHAR(50) NOT NULL,
    registro_id VARCHAR(50) NOT NULL,
    operacion_realizada VARCHAR(10) NOT NULL,
    estado_previo VARCHAR(50) NULL,
    nuevo_estado VARCHAR(50) NULL,
    fecha_cambio DATETIME NOT NULL
        CONSTRAINT DF_historial_fecha DEFAULT GETDATE(),
    descripcion VARCHAR(255) NULL,
    CONSTRAINT CK_historial_operacion
        CHECK (operacion_realizada IN ('INSERT', 'UPDATE', 'DELETE')),
    CONSTRAINT CK_historial_tabla
        CHECK (tabla_afectada IN ('Factura', 'DetalleFactura', 'Cliente', 'Producto')),
    CONSTRAINT CK_historial_registroid
        CHECK (LEN(RTRIM(registro_id)) > 0)
);