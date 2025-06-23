/*
-- Tabla: Rol
CREATE TABLE Rol (
    RolID INT PRIMARY KEY IDENTITY,
    NombreRol VARCHAR(50) NOT NULL
);

-- Tabla: Usuario
CREATE TABLE Usuario (
    UsuarioID INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) UNIQUE NOT NULL,
    TipoUsuario VARCHAR(50) NOT NULL,
    Estado VARCHAR(20) NOT NULL
);

-- Tabla intermedia: UsuarioRol
CREATE TABLE UsuarioRol (
    UsuarioRolID INT PRIMARY KEY IDENTITY,
    UsuarioID INT NOT NULL,
    RolID INT NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID),
    FOREIGN KEY (RolID) REFERENCES Rol(RolID)
);

-- Tabla: Libro
CREATE TABLE Libro (
    LibroID INT PRIMARY KEY IDENTITY,
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(100) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Editorial VARCHAR(100),
    Anio INT,
    Categoria VARCHAR(50),
    Estado VARCHAR(20) NOT NULL
);

-- Tabla: Prestamo
CREATE TABLE Prestamo (
    PrestamoID INT PRIMARY KEY IDENTITY,
    UsuarioID INT NOT NULL,
    FechaPrestamo DATE NOT NULL,
    FechaVencimiento DATE NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID)
);

-- Tabla: DetallePrestamo
CREATE TABLE DetallePrestamo (
    DetallePrestamoID INT PRIMARY KEY IDENTITY,
    PrestamoID INT NOT NULL,
    LibroID INT NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    FechaDevolucion DATE,
    FOREIGN KEY (PrestamoID) REFERENCES Prestamo(PrestamoID),
    FOREIGN KEY (LibroID) REFERENCES Libro(LibroID)
);

-- Tabla: Penalizacion
CREATE TABLE Penalizacion (
    PenalizacionID INT PRIMARY KEY IDENTITY,
    DetallePrestamoID INT NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (DetallePrestamoID) REFERENCES DetallePrestamo(DetallePrestamoID)
);

-- Tabla: Notificacion
CREATE TABLE Notificacion (
    NotificacionID INT PRIMARY KEY IDENTITY,
    UsuarioID INT NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID)
);*/
