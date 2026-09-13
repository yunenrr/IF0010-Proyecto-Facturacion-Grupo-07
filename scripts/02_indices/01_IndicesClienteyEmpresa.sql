USE SistemaDeFacturacion;

CREATE NONCLUSTERED INDEX nc_cliente_cedula 
ON cliente(cedula) INCLUDE (correo_electronico, telefono);

CREATE NONCLUSTERED INDEX nc_empresa_cedula 
ON empresa_emisora(cedula) INCLUDE (correo_electronico, telefono);
