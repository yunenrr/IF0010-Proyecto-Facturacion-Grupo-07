USE SistemaDeFacturacion;

CREATE TABLE DETALLE_FACTURA (
    id_detalle INT IDENTITY(1, 1) NOT NULL,
    identificador_factura VARCHAR(50) NOT NULL,
    numero_correlativo INT NOT NULL,
    descripcion NVARCHAR(255) NOT NULL,
    cantidad DECIMAL(18, 2) NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(18, 2) NOT NULL CHECK (precio_unitario >= 0),
    porcentaje_impuesto DECIMAL(5, 2) NOT NULL CHECK (porcentaje_impuesto >= 0),
    subtotal_linea DECIMAL(18, 2) NOT NULL CHECK (subtotal_linea >= 0),
    montoTotal_linea DECIMAL(18, 2) NOT NULL CHECK (montoTotal_linea >= 0),
    cod_interno_producto VARCHAR(20) NOT NULL,
    CONSTRAINT PK_detalle_factura PRIMARY KEY (identificador_factura, numero_correlativo),
    CONSTRAINT FK_detalle_factura_encabezado FOREIGN KEY (identificador_factura) 
        REFERENCES Factura(identificador) ON DELETE CASCADE,
	CONSTRAINT FK_detalle_producto FOREIGN KEY (cod_interno_producto) 
        REFERENCES productos_y_servicios(cod_interno)
);