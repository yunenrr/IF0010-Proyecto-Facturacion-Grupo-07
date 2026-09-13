USE SistemaDeFacturacion;

CREATE TABLE estado_factura(
	cod_identificador VARCHAR(10) PRIMARY KEY,
	descripcion VARCHAR(200) NOT NULL,
	estado VARCHAR(50) NOT NULL,
	CONSTRAINT uq_estado_factura UNIQUE(estado)
);
