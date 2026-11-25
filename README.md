# IF0010-Proyecto-Facturacion-Grupo-07
Título del proyecto: Sistema de Facturación

Descripción general: Este proyecto consiste en el diseño e implementación del módulo central de facturación comercial para la empresa "Soluciones Magníficas S.A." utilizando Microsoft SQL Server. El sistema gestiona empresas emisoras, clientes, catálogos (tipos de documento, monedas, estados de factura, productos/servicios), encabezados y detalles de facturas, así como un historial de auditoría. El diseño cumple con estrictos requisitos de negocio, integridad referencial y rendimiento.

Integrantes del grupo
Saray Mora Monge C5H467
Jennifer Quirós Chavarría C4I674
Emily Girón Cordero C4F428
Dayan Rodríguez Chaves C4J073

Requisitos:
Para poder ejecutar y probar este proyecto, se requiere el siguiente entorno:
Motor de Base de Datos: Microsoft SQL Server 2019 o superior.
Cliente de Base de Datos: SQL Server Management Studio (SSMS) o Azure Data Studi

Instrucciones de ejecución: Para desplegar el proyecto, se deben ejecutar los scripts en el estricto orden de las carpetas dentro del directorio  scripts :
1.   01_tablas : Creación de las tablas e integridad referencial.
2.   02_trigger : Creación de los triggers.
3.   03_CargarDatos : Inserción de datos maestros y transaccionales.
4.   04_DropCargarDatos : Se encarga de limpiar/eliminar estructuras temporales de carga para que no interfieran con los índices finales.
5.   05_Procedimientos : Creación de procedimientos almacenados.
6.   06_indices : Creación de índices no agrupados.
7.   07_funciones : Creación de funciones escalares y de tabla.
8.   08_vistas : Creación de vistas.
9.   09_consultas : Consultas de prueba.
