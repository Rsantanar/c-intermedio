MÓDULO DE GESTIÓN DE LIBROS 

CREATE PROCEDURE sp_RegistrarLibro 
@Titulo VARCHAR(255), 
@Autor VARCHAR(100), 
@ISBN VARCHAR(20), 
@Editorial VARCHAR(100), 
@Anio INT, 
@Categoria VARCHAR(50), 
@Estado VARCHAR(20) 
AS 
BEGIN 
INSERT INTO Libro (Titulo, Autor, ISBN, Editorial, Anio, Categoria, Estado) 
VALUES (@Titulo, @Autor, @ISBN, @Editorial, @Anio, @Categoria, @Estado) 
END; 

CREATE PROCEDURE sp_ModificarLibro 
@LibroID INT, 
@Titulo VARCHAR(255), 
@Autor VARCHAR(100), 
@ISBN VARCHAR(20), 
@Editorial VARCHAR(100), 
@Anio INT, 
@Categoria VARCHAR(50) 
AS 
BEGIN 
UPDATE Libro 
SET Titulo = @Titulo, Autor = @Autor, ISBN = @ISBN, 
Editorial = @Editorial, Anio = @Anio, Categoria = @Categoria 
WHERE LibroID = @LibroID 
END; 

CREATE PROCEDURE sp_EliminarLibroLogico 
@LibroID INT 
AS 
BEGIN 
UPDATE Libro SET Estado = 'inactivo' WHERE LibroID = @LibroID 
END;


 MÓDULO DE USUARIOS Y ROLES 

CREATE PROCEDURE sp_RegistrarUsuario 
@Nombre VARCHAR(100), 
@Correo VARCHAR(100), 
@TipoUsuario VARCHAR(50), 
@Estado VARCHAR(20) 
AS 
BEGIN 
INSERT INTO Usuario (Nombre, Correo, TipoUsuario, Estado) 
VALUES (@Nombre, @Correo, @TipoUsuario, @Estado) 
END; 

CREATE PROCEDURE sp_AsignarRolUsuario 
@UsuarioID INT, 
@RolID INT 
AS 
BEGIN 
INSERT INTO UsuarioRol (UsuarioID, RolID) VALUES (@UsuarioID, @RolID) 
END; 

CREATE PROCEDURE sp_ActivarDesactivarUsuario 
@UsuarioID INT, 
@Estado VARCHAR(20) 
AS 
BEGIN 
UPDATE Usuario SET Estado = @Estado WHERE UsuarioID = @UsuarioID 
END; 

 MÓDULO DE PRÉSTAMOS Y DEVOLUCIONES 

CREATE PROCEDURE sp_RegistrarPrestamo 
@UsuarioID INT, 
@FechaPrestamo DATE,
@FechaVencimiento DATE 
AS 
BEGIN 
INSERT INTO Prestamo (UsuarioID, FechaPrestamo, FechaVencimiento, Estado) 
VALUES (@UsuarioID, @FechaPrestamo, @FechaVencimiento, 'activo') 
END; 

CREATE PROCEDURE sp_AgregarDetallePrestamo 
@PrestamoID INT, 
@LibroID INT 
AS 
BEGIN 
INSERT INTO DetallePrestamo (PrestamoID, LibroID, Estado) 
VALUES (@PrestamoID, @LibroID, 'prestado') 
UPDATE Libro SET Estado = 'prestado' WHERE LibroID = @LibroID 
END; 



CREATE PROCEDURE sp_RegistrarDevolucion 
@DetallePrestamoID INT, 
@FechaDevolucion DATE 
AS 
BEGIN 
UPDATE DetallePrestamo 
SET Estado = 'devuelto', FechaDevolucion = @FechaDevolucion 
WHERE DetallePrestamoID = @DetallePrestamoID 
DECLARE @LibroID INT 
SELECT @LibroID = LibroID FROM DetallePrestamo WHERE DetallePrestamoID = @DetallePrestamoID 
UPDATE Libro SET Estado = 'disponible' WHERE LibroID = @LibroID 
END; 

CREATE PROCEDURE sp_CalcularPenalizacion 
@DetallePrestamoID INT 
AS 
BEGIN 
DECLARE @FechaVencimiento DATE, @FechaDevolucion DATE, @DiasRetraso INT 
SELECT @FechaVencimiento = P.FechaVencimiento, @FechaDevolucion = DP.FechaDevolucion 
FROM DetallePrestamo DP
INNER JOIN Prestamo P ON DP.PrestamoID = P.PrestamoID 
WHERE DP.DetallePrestamoID = @DetallePrestamoID 
SET @DiasRetraso = DATEDIFF(DAY, @FechaVencimiento, @FechaDevolucion 
IF @DiasRetraso > 0 
BEGIN 
INSERT INTO Penalizacion (DetallePrestamoID, Monto, Estado) 
VALUES (@DetallePrestamoID, @DiasRetraso * 2.00, 'activa') 
END 
END; 

CREATE PROCEDURE sp_RegistrarNotificacion 
@UsuarioID INT, 
@Tipo VARCHAR(50), 
@Fecha DATE, 
@Estado VARCHAR(20) 
AS 
BEGIN 
INSERT INTO Notificacion (UsuarioID, Tipo, Fecha, Estado) 
VALUES (@UsuarioID, @Tipo, @Fecha, @Estado) 
END;
