USE SistemaDeFacturacion;
CREATE NONCLUSTERED INDEX nc_historial_tabla_fecha
    ON dbo.historial(id_tabla_auditada, fecha_cambio);

    CREATE NONCLUSTERED INDEX nc_historial_tabla_registro
    ON dbo.historial(id_tabla_auditada, registro_id);
