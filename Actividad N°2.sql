--Actividad N°2
-- Estudiantes (EstudianteID, Nombre, Edad)
-- Cursos (CursoID, NombreCurso, Profesor)
-- Inscripciones (EstudianteID, CursoID, Nota)
--DDL
CREATE TABLE estudiantes(
estudianteID INTEGER PRIMARY KEY NOT NULL, 
  nombre VARCHAR(50) NOT NULL, 
  edad INTEGER NOT NULL
);

CREATE TABLE cursos(
  cursoID INTEGER PRIMARY KEY NOT NULL,
  nombreCurso VARCHAR(50) NOT NULL,
  profesor VARCHAR(50) 
  );
 
 CREATE TABLE inscripciones(
    estudianteID INTEGER NOT NULL,
    cursoID INTEGER NOT NULL,
    nota DECIMAL(2, 1),  
    PRIMARY KEY (estudianteID, cursoID),
    FOREIGN KEY (estudianteID) REFERENCES estudiantes(estudianteID),
    FOREIGN KEY (cursoID) REFERENCES cursos(cursoID)
 
 
 );

--DML
--Registros para pruebas

INSERT INTO estudiantes VALUES 
(2097315,'Pedro de Urdemalas',22),
(2341873,'Samuel Cordoba',19),
(2358171,'Nicolas Arenas',20),
(2342174,'Mani Ampudia',19);

INSERT INTO cursos VALUES
(750122, 'Cálculo I', 'Siervo Joya'),
(730001, 'Álgebra Lineal', 'Siervo Joya'),
(730002, 'Física I', 'Maria Rodriguez'),
(730003, 'Taller de ingenieria', 'Oscar Perez');
  
INSERT INTO inscripciones VALUES
(2358171, 750122, 4.5),  -- Nicolas
(2341873, 730001, 4.3),  -- Samuel 
(2342174, 730002, 3.9),  -- Mani
(2097315, 730003, 3.5);  -- Pedro

--Consultas
--DQL

--Punto1
--σ Nombre='Pedro de Urdemalas' (Estudiantes)
--{t | t ∈ Estudiantes ∧ t[Nombre] = 'Pedro de Urdemalas'}

SELECT * FROM estudiantes WHERE nombre='Pedro de Urdemalas'

--Punto2
--π nombrecurso (cursos × inscripciones)
--{t[nombrecurso] | t ∈ cursos ∧ u ∈ inscripciones}

SELECT DISTINCT nombrecurso FROM cursos CROSS JOIN inscripciones;


--Punto3
--{t | t ∈ estudiantes × inscripciones ∧ t[estudiantes.estudianteID] = t[inscripciones.estudianteID]}
--Estudiantes ⋈ Inscripciones

SELECT * FROM estudiantes JOIN inscripciones ON estudiantes.estudianteID = inscripciones.estudianteID

--Punto4
--{t[cursoid] | t ∈ cursos ∧ t[nombrecurso] = 'Cálculo I' ∧ t[profesor] = 'Siervo Joya'}
--π cursoID (σ nombreCur='Cálculo I' ∧ profesor='Siervo Joya' (cursos))

SELECT cursoID FROM cursos WHERE nombrecurso='Cálculo I' AND profesor='Siervo Joya' 

--Punto5
--{t | t ∈ Estudiantes AND u ∈ Inscripciones AND t[EstudianteID] = u[EstudianteID] AND t[CursoID] ='750122' }
-- estudiantes ⋈ (σ cursoID=750122 (inscripciones))

SELECT * FROM estudiantes JOIN inscripciones ON estudiantes.estudianteID = inscripciones.estudianteID AND inscripciones.cursoID=750122
