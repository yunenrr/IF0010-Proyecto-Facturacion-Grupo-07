USE SistemaDeFacturacion;

CREATE TABLE FACTURA (
    identificador VARCHAR(50) NOT NULL,
    fecha_emision DATE NOT NULL,
    subtotal DECIMAL(18, 2) NOT NULL CHECK (subtotal >= 0),
    total_descuentos DECIMAL(18, 2) NOT NULL CHECK (total_descuentos >= 0),
    impuestos_aplicados DECIMAL(18, 2) NOT NULL CHECK (impuestos_aplicados >= 0),
    monto_total DECIMAL(18, 2) NOT NULL CHECK (monto_total >= 0),
    fecha_creacion DATETIME NOT NULL DEFAULT GETDATE(),
    modificacion DATETIME NULL,
    observaciones NVARCHAR(255) NULL,
    id_empresa INT NOT NULL,
    id_cliente INT NOT NULL,
    cod_identificador_moneda VARCHAR(10) NOT NULL,
    cod_identificador_tipo VARCHAR(10) NOT NULL,
    cod_identificador_estado VARCHAR(10) NOT NULL,
    CONSTRAINT PK_factura PRIMARY KEY (identificador),
    CONSTRAINT FK_factura_empresa FOREIGN KEY (id_empresa) REFERENCES empresa_emisora(id_empresa),
    CONSTRAINT FK_factura_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
	CONSTRAINT FK_factura_moneda FOREIGN KEY (cod_identificador_moneda) REFERENCES monedas(cod_identificador),
    CONSTRAINT FK_factura_tipo FOREIGN KEY (cod_identificador_tipo) REFERENCES tipo_documento(cod_identificador),
    CONSTRAINT FK_factura_estado FOREIGN KEY (cod_identificador_estado) REFERENCES estado_factura(cod_identificador)
);