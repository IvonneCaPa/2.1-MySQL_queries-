use universidad;
-- 01
SELECT apellido1, apellido2, nombre, tipo FROM persona WHERE tipo = "alumno" ORDER BY apellido1 ASC, apellido2 ASC, nombre;
-- 02
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL AND tipo = 'alumno';
-- 03
SELECT nombre, apellido1, apellido2, fecha_nacimiento FROM persona WHERE fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento < '2000-01-01';
-- 04
SELECT nombre, apellido1, apellido2, nif, telefono FROM persona WHERE tipo = 'profesor' AND telefono is null AND nif LIKE '%k';
-- 05
SELECT nombre AS "Matarias del primer cuatrimestre, tercer grado con identificador 7" FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado =7;
-- 06
SELECT pe.apellido1, pe.apellido2, pe.nombre, dep.nombre FROM persona AS pe JOIN profesor AS pr ON pe.id = pr.id_profesor JOIN departamento AS dep ON pr.id_departamento = dep.id;
-- 07
select asg.nombre as "Asignaturas del alumno con NIF 26902806M", ce.anyo_inicio, ce.anyo_fin from asignatura AS asg inner join alumno_se_matricula_asignatura AS al on asg.id = al.id_asignatura inner join curso_escolar AS ce on al.id_curso_escolar = ce.id inner join persona AS pe on al.id_alumno = pe.id where pe.nif = "26902806M";
-- 08
select distinct departamento.nombre from departamento  inner join profesor on departamento.id = profesor.id_departamento inner join asignatura on profesor.id_profesor = asignatura.id_profesor inner join grado on asignatura.id_grado = grado.id where grado.id = 4;
-- 09
select distinctrow persona.nombre, persona.apellido1 from persona inner join alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno inner join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar=curso_escolar.id where curso_escolar.anyo_inicio = 2018 and curso_escolar.anyo_fin=2019; 
-- 10
