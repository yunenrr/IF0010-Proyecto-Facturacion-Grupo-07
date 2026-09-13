USE SistemaDeFacturacion;

CREATE NONCLUSTERED INDEX nc_productos_activos
ON productos_y_servicios (descripcion)
INCLUDE (precio_unitario, porcentaje_impuesto)
WHERE estado = 1;