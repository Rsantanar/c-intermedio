
-- Gestión de Libros
CREATE PROCEDURE sp_registrar_libro (
    IN p_titulo VARCHAR(255),
    IN p_autor VARCHAR(255),
    IN p_isbn VARCHAR(20),
    IN p_editorial VARCHAR(100),
    IN p_anio INT,
    IN p_categoria VARCHAR(100)
)
BEGIN
    -- Lógica para insertar un nuevo libro
END;

CREATE PROCEDURE sp_actualizar_libro (
    IN p_id_libro INT,
    IN p_titulo VARCHAR(255),
    IN p_autor VARCHAR(255),
    IN p_isbn VARCHAR(20),
    IN p_editorial VARCHAR(100),
    IN p_anio INT,
    IN p_categoria VARCHAR(100)
)
BEGIN
    -- Lógica para actualizar un libro existente
END;

CREATE PROCEDURE sp_eliminar_libro (
    IN p_id_libro INT
)
BEGIN
    -- Lógica para eliminación lógica de un libro
END;

CREATE PROCEDURE sp_buscar_libros (
    IN p_criterio VARCHAR(255)
)
BEGIN
    -- Lógica para buscar libros por título, autor, categoría o ISBN
END;

CREATE PROCEDURE sp_consultar_estado_libro (
    IN p_id_libro INT
)
BEGIN
    -- Lógica para consultar estado (disponible, prestado, reservado)
END;

-- Gestión de Usuarios
CREATE PROCEDURE sp_registrar_usuario (
    IN p_nombre VARCHAR(255),
    IN p_tipo_usuario VARCHAR(50),
    IN p_email VARCHAR(100)
)
BEGIN
    -- Lógica para registrar nuevo usuario
END;

CREATE PROCEDURE sp_asignar_rol_usuario (
    IN p_id_usuario INT,
    IN p_rol VARCHAR(50)
)
BEGIN
    -- Lógica para asignar rol al usuario
END;

CREATE PROCEDURE sp_actualizar_usuario (
    IN p_id_usuario INT,
    IN p_nombre VARCHAR(255),
    IN p_email VARCHAR(100)
)
BEGIN
    -- Lógica para actualizar información del usuario
END;

CREATE PROCEDURE sp_activar_usuario (
    IN p_id_usuario INT,
    IN p_estado BOOLEAN
)
BEGIN
    -- Lógica para activar/desactivar cuenta
END;

CREATE PROCEDURE sp_registrar_historial_prestamos (
    IN p_id_usuario INT,
    IN p_id_libro INT
)
BEGIN
    -- Lógica para registrar historial de préstamo
END;

-- Préstamos y Devoluciones
CREATE PROCEDURE sp_registrar_prestamo (
    IN p_id_usuario INT,
    IN p_id_libro INT,
    IN p_fecha_prestamo DATE,
    IN p_fecha_vencimiento DATE
)
BEGIN
    -- Lógica para registrar préstamo
END;

CREATE PROCEDURE sp_registrar_devolucion (
    IN p_id_prestamo INT,
    IN p_fecha_devolucion DATE
)
BEGIN
    -- Lógica para registrar devolución
END;

CREATE PROCEDURE sp_calcular_penalizacion (
    IN p_id_prestamo INT
)
BEGIN
    -- Lógica para calcular penalización por retraso
END;

CREATE PROCEDURE sp_verificar_prestamo_valido (
    IN p_id_usuario INT
)
BEGIN
    -- Lógica para verificar si el usuario puede realizar un préstamo
END;

-- Notificaciones
CREATE PROCEDURE sp_enviar_recordatorio_vencimiento ()
BEGIN
    -- Lógica para enviar recordatorio de vencimiento
END;

CREATE PROCEDURE sp_enviar_alerta_penalizacion ()
BEGIN
    -- Lógica para enviar alerta de penalización
END;
