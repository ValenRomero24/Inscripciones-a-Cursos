-- // Insertar estudiantes
INSERT INTO estudiantes (nombre, edad)
VALUES 	('Juan Perez', 20),
		('Martha Wayne', 28),
        ('Valentin Romero', 24),
        ('Victoria Zapata', 23),
        ('Agustin Argañaraz', 24);
        
-- // Insertar cursos        
INSERT INTO cursos (nombre, duracion)
VALUES 	('Programacion Web', '4 Meses'),
		('Python (Basico)', '6 Meses'),
        ('Python (Avanzado)', '6 Meses'),
        ('Programacion Web (avanzado)', '8 Meses');
        
-- SELECT * FROM estudiantes;
-- SELECT* FROM cursos;

-- // Asociar cursos y estudiantes
INSERT INTO inscripciones (id_estudiante, id_curso)
VALUES 	(1,2),
		(1,4),
-- //        
        (2,3),
        (2,4),
-- //        
        (4,1),
        (4,2),
-- //
        (5,1),
        (5,3);

-- SELECT * FROM inscripciones;

-- // Proyectar estudiantes y sus cursos
SELECT e.nombre AS 'Alumno', c.nombre AS 'Curso'
FROM inscripciones i
JOIN estudiantes e ON i.id_estudiante = e.id
JOIN cursos c ON i.id_curso = c.id
ORDER BY e.nombre ASC;

-- // Proyectar estudiantes inscriptos a un curso buscado por nombre
SELECT e.nombre AS 'Alumno', c.nombre AS 'Curso'
FROM inscripciones i
JOIN estudiantes e ON i.id_estudiante = e.id
JOIN cursos c ON i.id_curso = c.id
WHERE c.nombre = 'Python (Avanzado)';

-- // Proyeectar los cursos en los que esta inscrito un alumno buscado por nombre
SELECT e.nombre AS 'Alumno', c.nombre 'Curso'
FROM inscripciones i
JOIN estudiantes e ON i.id_estudiante = e.id
JOIN cursos c ON i.id_curso = c.id
WHERE e.nombre = 'Juan Perez';

-- // Contar el numero de estudiantes inscriptos en cada curso, mostrar nombre y cantidad
SELECT c.nombre AS 'Curso', COUNT(e.id) AS 'cant_estudiantes'
FROM inscripciones i
JOIN estudiantes e ON i.id_estudiante = e.id
JOIN cursos c ON i.id_curso = c.id
GROUP BY c.nombre;

-- // Encontrar estudiantes que no esten inscriptos a ningun curso
SELECT e.nombre AS 'Alumno', e.id AS 'ID', i.id_curso
FROM estudiantes e
LEFT JOIN inscripciones i ON e.id = i.id_estudiante
WHERE i.id_curso IS NULL;