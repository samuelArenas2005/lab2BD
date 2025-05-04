-- Laboratorio N° 2 de Base de Datos
-- Actividad N°3

--DDL CREACION DE LAS RELACIONES

--Crear Tabla Departamentos
CREATE table Departamentos(
	ID INT PRIMARY KEY,
  	NombreDepartamento VARCHAR(30),
  	JefeDepartamento VARCHAR(30)
);

--Crear tabla Empleados
CREATE table Empleados(
	ID INT PRIMARY KEY,
  	Nombre VARCHAR(30),
  	DepartamentoID INT,
  	Salario INT,
  	FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(ID)
)

-- DML INSERTAR DATOS DENTRO DE LA TABLA COMO EJEMPLO PRACTICO

INSERT INTO Departamentos (ID, NombreDepartamento, JefeDepartamento) VALUES
(953, 'Ingeniería', 'Lucía Méndez'),
(101, 'Finanzas', 'Hindley Earnshaw'),
(202, 'Recursos Humanos', 'José Raquel Benavides'),
(303, 'Marketing', 'Camilo Vargas');

-- Tabla: Empleados
INSERT INTO Empleados (ID, Nombre, DepartamentoID, Salario) VALUES
(1, 'Mikaela Lafuente', 101, 4200),
(2, 'Carlos Domínguez', 953, 5000),
(3, 'Ana María', 953, 5600),
(4, 'Luis Torres', 202, 6100),
(5, 'Sandra Patiño', 202, 6100),
(6, 'Pedro Salazar', 101, 4700),
(7, 'Beatriz Morales', 303, 5800),
(8, 'Kevin Díaz', 202, 6200),  -- Mayor salario en depto de José Raquel Benavides
(9, 'Natalia Romero', 101, 3900);

--DQL CONSULTAS SOBRE LAS RELACIONES.Departamentos

--CONSULTA N°1
SELECT e.Nombre, e.Salario FROM Empleados e 
WHERE Departamentoid = 953

--CONSULTA N°2
SELECT e.Salario FROM Empleados e
WHERE e.Nombre = 'Mikaela Lafuente'

--CONSULTA N°3
SELECT e.Nombre FROM Empleados e 
JOIN Departamentos d ON e.DepartamentoID = d.ID
WHERE d.JefeDepartamento = 'Hindley Earnshaw'

--CONSULTA N°4
SELECT e.ID, e.Nombre,e.Salario FROM Empleados e 
WHERE e.Salario = 
(SELECT MAX(e.Salario) FROM Empleados e)

--CONSULTA N°5
SELECT e.Nombre FROM Empleados e 
JOIN Departamentos d ON e.DepartamentoID = d.ID  
WHERE e.Salario = 
(SELECT MAX(e.Salario) FROM Empleados e 
 JOIN Departamentos d ON e.DepartamentoID = d.ID  
 WHERE d.JefeDepartamento = 'José Raquel Benavides');

