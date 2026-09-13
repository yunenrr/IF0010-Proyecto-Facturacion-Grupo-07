USE SistemaDeFacturacion; 

CREATE TABLE monedas(
	cod_identificador VARCHAR(10) PRIMARY KEY,
	descripcion VARCHAR(100) NOT NULL,
	simbolo VARCHAR(5) NOT NULL
);
