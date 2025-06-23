
-- =========================================
-- SIGEBI - Stored Procedures SQL
-- Basado en el Documento SRS
-- =========================================

-- =========================================
-- Módulo: Gestión de Libros
-- =========================================

CREATE PROCEDURE sp_registrar_libro (
    IN p_titulo VARCHAR(255),
    IN p_autor VARCHAR(255),
    IN p_isbn VARCHAR(20),
    IN p_editorial VARCHAR(100),
    IN p_anio INT,
    IN p_categoria VARCHAR(100)
)
BEGIN
    -- Insertar nuevo libro
END;

CREATE PROCEDURE sp_modificar_libro (
    IN p_id_libro INT,
    IN p_titulo VARCHAR(255),
    IN p_autor VARCHAR(255),
    IN p_isbn VARCHAR(20),
    IN p_editorial VARCHAR(100),
    IN p_anio INT,
    IN p_categoria VARCHAR(100)
)
BEGIN
    -- Actualizar información del libro
END;

CREATE PROCEDURE sp_eliminar_libro (
    IN p_id_libro INT
)
BEGIN
    -- Eliminación lógica del libro
END;

CREATE PROCEDURE sp_buscar_libros (
    IN p_criterio VARCHAR(255)
)
BEGIN
    -- Buscar libros por criterio (título, autor, ISBN, categoría)
END;

CREATE PROCEDURE sp_estado_libro (
    IN p_id_libro INT
)
BEGIN
    -- Mostrar estado del libro (disponible, prestado, reservado)
END;

-- =========================================
-- Módulo: Gestión de Usuarios
-- =========================================

CREATE PROCEDURE sp_registrar_usuario (
    IN p_nombre VARCHAR(255),
    IN p_tipo_usuario VARCHAR(50),
    IN p_email VARCHAR(100)
)
BEGIN
    -- Insertar nuevo usuario
END;

CREATE PROCEDURE sp_asignar_rol (
    IN p_id_usuario INT,
    IN p_rol VARCHAR(50)
)
BEGIN
    -- Asignar rol al usuario
END;

CREATE PROCEDURE sp_editar_usuario (
    IN p_id_usuario INT,
    IN p_nombre VARCHAR(255),
    IN p_email VARCHAR(100)
)
BEGIN
    -- Editar usuario
END;

CREATE PROCEDURE sp_activar_usuario (
    IN p_id_usuario INT,
    IN p_estado BOOLEAN
)
BEGIN
    -- Activar o desactivar usuario
END;

CREATE PROCEDURE sp_historial_prestamos (
    IN p_id_usuario INT
)
BEGIN
    -- Registrar historial de préstamos
END;

-- =========================================
-- Módulo: Préstamos y Devoluciones
-- =========================================

CREATE PROCEDURE sp_registrar_prestamo (
    IN p_id_usuario INT,
    IN p_id_libro INT,
    IN p_fecha_prestamo DATE,
    IN p_fecha_vencimiento DATE
)
BEGIN
    -- Insertar préstamo
END;

CREATE PROCEDURE sp_controlar_vencimiento (
    IN p_id_prestamo INT
)
BEGIN
    -- Controlar vencimiento
END;

CREATE PROCEDURE sp_registrar_devolucion (
    IN p_id_prestamo INT,
    IN p_fecha_devolucion DATE
)
BEGIN
    -- Registrar devolución
END;

CREATE PROCEDURE sp_calcular_penalizacion (
    IN p_id_prestamo INT
)
BEGIN
    -- Calcular penalización
END;

CREATE PROCEDURE sp_restringir_prestamo (
    IN p_id_usuario INT
)
BEGIN
    -- Verificar si el usuario tiene penalizaciones o libros pendientes
END;

-- =========================================
-- Módulo: Notificaciones
-- =========================================

CREATE PROCEDURE sp_notificar_antes_vencimiento ()
BEGIN
    -- Notificar 2 días antes del vencimiento
END;

CREATE PROCEDURE sp_notificar_dia_vencimiento ()
BEGIN
    -- Notificar el día del vencimiento
END;

CREATE PROCEDURE sp_notificar_penalizacion ()
BEGIN
    -- Notificar por penalización
END;

-- =========================================
-- Módulo: Reportes y Estadísticas
-- =========================================

CREATE PROCEDURE sp_reporte_libros_mas_prestados ()
BEGIN
    -- Generar reporte de libros más prestados
END;

CREATE PROCEDURE sp_reporte_historial_usuario (
    IN p_id_usuario INT
)
BEGIN
    -- Generar historial de préstamos por usuario
END;

CREATE PROCEDURE sp_reporte_usuarios_penalizados ()
BEGIN
    -- Reporte de usuarios con penalizaciones
END;

CREATE PROCEDURE sp_exportar_reportes (
    IN p_formato VARCHAR(10)
)
BEGIN
    -- Exportar reportes a PDF o Excel
END;

-- =========================================
-- Módulo: Administración del Sistema
-- =========================================

CREATE PROCEDURE sp_gestion_parametros ()
BEGIN
    -- Gestión de parámetros del sistema
END;

CREATE PROCEDURE sp_configurar_plantillas ()
BEGIN
    -- Configuración de plantillas de notificaciones
END;

CREATE PROCEDURE sp_panel_actividad ()
BEGIN
    -- Panel general de actividad
END;
