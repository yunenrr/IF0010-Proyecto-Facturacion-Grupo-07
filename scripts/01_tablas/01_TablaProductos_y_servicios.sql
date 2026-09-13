USE SistemaDeFacturacion;

CREATE TABLE productos_y_servicios(
	cod_interno VARCHAR(20) PRIMARY KEY,
	descripcion VARCHAR(100) NOT NULL,
	precio_unitario DECIMAL(10,2) NOT NULL,
	porcentaje_impuesto DECIMAL(5,2) NOT NULL,
	estado BIT NOT NULL DEFAULT 1,
	fecha_creacion DATE NOT NULL DEFAULT GETDATE(),
	CONSTRAINT precio_no_negativo CHECK(precio_unitario >= 0),
	CONSTRAINT impuesto_no_negativo CHECK(porcentaje_impuesto >= 0)
);