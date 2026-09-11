USE SistemaDeFacturacion;
CREATE NONCLUSTERED INDEX nc_historial_tabla_fecha
    ON dbo.historial(tabla_afectada, fecha_cambio);
