-- Crear la base de datos
CREATE DATABASE EventosHallie;
GO
USE EventosHallie;
GO


CREATE TABLE Salas (
    ID_Sala INT PRIMARY KEY,
    Nombre_Sala VARCHAR(50),
    Capacidad INT,
    Ubicacion VARCHAR(100)
);

CREATE TABLE Horarios (
    ID_Horario INT PRIMARY KEY,
    Fecha DATE,
    Hora_Inicio TIME,
    Hora_Fin TIME
);


CREATE TABLE Organizadores (
    ID_Organizador INT PRIMARY KEY,
    Nombre_Organizador VARCHAR(50),
    Cargo VARCHAR(50),
    Contacto VARCHAR(100)
);

CREATE TABLE Eventos (
    ID_Evento INT PRIMARY KEY,
    Nombre_Evento VARCHAR(100),
    Descripcion VARCHAR(MAX),
    Fecha_Hora DATETIME,
    ID_Sala INT FOREIGN KEY REFERENCES Salas(ID_Sala),
    ID_Organizador INT FOREIGN KEY REFERENCES Organizadores(ID_Organizador),
    ID_Horario INT FOREIGN KEY REFERENCES Horarios(ID_Horario)
);


CREATE TABLE Recursos (
    ID_Recurso INT PRIMARY KEY,
    Nombre_Recurso VARCHAR(100),
    Disponibilidad BIT,
    Costo DECIMAL(10, 2),
    ID_Evento INT FOREIGN KEY REFERENCES Eventos(ID_Evento)
);


CREATE TABLE Patrocinadores (
    ID_Patrocinador INT PRIMARY KEY,
    Nombre_Patrocinador VARCHAR(100),
    Tipo_Patrocinio VARCHAR(50),
    Beneficios VARCHAR(MAX),
    ID_Evento INT FOREIGN KEY REFERENCES Eventos(ID_Evento)
);


CREATE TABLE Asistentes (
    ID_Asistente INT PRIMARY KEY,
    Nombre_Asistente VARCHAR(100),
    Correo VARCHAR(100),
    Telefono VARCHAR(20),
    ID_Evento INT FOREIGN KEY REFERENCES Eventos(ID_Evento)
);



INSERT INTO Salas (ID_Sala, Nombre_Sala, Capacidad, Ubicacion)
VALUES (1, 'Sala A', 100, 'Piso 1, Edificio Principal'),
       (2, 'Sala B', 50, 'Piso 2, Edificio Secundario'),
       (3, 'Sala C', 200, 'Piso 3, Edificio Principal');


INSERT INTO Horarios (ID_Horario, Fecha, Hora_Inicio, Hora_Fin)
VALUES (1, '2024-06-10', '09:00:00', '12:00:00'),
       (2, '2024-06-10', '13:00:00', '17:00:00'),
       (3, '2024-06-11', '09:30:00', '11:30:00');


INSERT INTO Organizadores (ID_Organizador, Nombre_Organizador, Cargo, Contacto)
VALUES (1, 'Juan Pérez', 'Gerente de Eventos', 'juan@example.com'),
       (2, 'María García', 'Coordinadora de Logística', 'maria@example.com'),
       (3, 'Luis Martínez', 'Asistente de Marketing', 'luis@example.com');

INSERT INTO Eventos (ID_Evento, Nombre_Evento, Descripcion, Fecha_Hora, ID_Sala, ID_Organizador, ID_Horario)
VALUES (1, 'Conferencia Tech Summit 2024', 'Evento anual para profesionales de la industria tecnológica', '2024-06-10 09:00:00', 1, 1, 1),
       (2, 'Taller de Desarrollo de Software', 'Taller práctico sobre metodologías ágiles y desarrollo de software', '2024-06-10 13:00:00', 2, 2, 2),
       (3, 'Charla de Inteligencia Artificial', 'Charla sobre los avances y aplicaciones de la inteligencia artificial en la industria', '2024-06-11 09:30:00', 3, 3, 3);

	 
INSERT INTO Recursos (ID_Recurso, Nombre_Recurso, Disponibilidad, Costo, ID_Evento)
VALUES (1, 'Proyector HD', 1, 50.00, 1),
       (2, 'Micrófono Inalámbrico', 1, 30.00, 2),
       (3, 'Coffee Break', 1, 15.00, 3);

INSERT INTO Patrocinadores (ID_Patrocinador, Nombre_Patrocinador, Tipo_Patrocinio, Beneficios, ID_Evento)
VALUES (1, 'Empresa A', 'Patrocinio Oro', 'Stand promocional y presencia en materiales de marketing', 1),
       (2, 'Empresa B', 'Patrocinio Plata', 'Mención en', 2),
       (3, 'Empresa C', 'Patrocinio Bronce', 'Mención en', 3);

INSERT INTO Asistentes (ID_Asistente, Nombre_Asistente, Correo, Telefono, ID_Evento)
VALUES (1, 'Carlos López', 'carlos@example.com', '111-222-3333', 1),
       (2, 'Ana Rodríguez', 'ana@example.com', '444-555-6666', 2),
       (3, 'Pedro Martínez', 'pedro@example.com', '777-888-9999', 3);


SELECT * FROM Salas;
SELECT * FROM Horarios;
SELECT * FROM Organizadores;
SELECT * FROM Eventos;
SELECT * FROM Recursos;
SELECT * FROM Patrocinadores;
SELECT * FROM Asistentes;