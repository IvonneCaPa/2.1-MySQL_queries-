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
-- LEFT JOIN i RIGHT JOIN.
-- 10
select pe.apellido1, pe.apellido2, pe.nombre, dep.nombre as departamento from persona as pe left join profesor as pro on pe.id = pro.id_profesor left join departamento as dep on pro.id_departamento=dep.id where pe.tipo="profesor" order by dep.nombre, pe.apellido1, pe.apellido2, pe.nombre;
-- 11
select pe.apellido1, pe.apellido2, pe.nombre, dep.nombre as departamento from persona as pe left join profesor as pro on pe.id = pro.id_profesor left join departamento as dep on pro.id_departamento=dep.id where pe.tipo="profesor" and dep.nombre is null order by dep.nombre, pe.apellido1, pe.apellido2, pe.nombre;
-- 12
select dep.nombre as departamento from persona as pe inner join profesor as pro on pe.id = pro.id_profesor right join departamento as dep on pro.id_departamento=dep.id where pe.nombre is null order by dep.nombre;
-- 13
select concat(pe.nombre, " ", pe.apellido1, " " , pe.apellido2) as Profesor from persona as pe left join profesor as pro on pe.id = pro.id_profesor left join asignatura as asg on pro.id_profesor = asg.id_profesor where pe.tipo = "profesor" and asg.nombre is null order by Profesor;
-- 14
select asg.nombre as "Asignaturas sin profesor asignado" from asignatura as asg left join profesor as pr on asg.id_profesor=pr.id_profesor where pr.id_profesor is null;
-- 15
select distinct dep.nombre from departamento as dep left join profesor as pro on dep.id = pro.id_departamento left join asignatura as asg on pro.id_profesor = asg.id_profesor left join alumno_se_matricula_asignatura as al on asg.id = al.id_asignatura where asg.nombre is null and al.id_curso_escolar is null;
-- Consultas resumen
-- 16
select count(*) as "Total Alumnos Existentes" from persona where tipo = "alumno";
-- 17
select count(*) as "Total Alumnos que nacieron en 1999" from persona where tipo = "alumno" and fecha_nacimiento like '1999%';
-- 18
select departamento.nombre, count(profesor.id_profesor) as "Cantidad de Profesores" from profesor inner join departamento on profesor.id_departamento = departamento.id group by departamento.id order by count(profesor.id_profesor) desc;
-- 19
select departamento.nombre as Departamaneto, concat(persona.nombre, " ",persona.apellido1, " ",persona.apellido2) as Profesor from departamento left join profesor on departamento.id = profesor.id_departamento left join persona on profesor.id_profesor = persona.id;
-- 20
select gr.nombre, asg.nombre from grado as gr left join asignatura as asg on gr.id = asg.id_grado order by gr.nombre desc;
-- 21
select grado.nombre, count(asignatura.id_grado) as "Número de Asignaturas" from grado inner join asignatura on grado.id=asignatura.id_grado group by grado.nombre having count(asignatura.id_grado) > 40;
-- 22
select grado.nombre as Grado, asignatura.tipo as "Tipo de Asignatura", sum(asignatura.creditos) as "Total de Creditos" from grado inner join asignatura on grado.id = asignatura.id_grado group by grado.nombre, asignatura.tipo order by grado.nombre, asignatura.tipo; 
-- 23
select ce.anyo_inicio, count(distinct am.id_alumno) from alumno_se_matricula_asignatura am inner join curso_escolar ce on am.id_curso_escolar = ce.id group by ce.anyo_inicio;
-- 24
select pr.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, count(ag.id) as " No Asignaturas" from persona pe right join profesor pr on pe.id = pr.id_profesor left join asignatura ag on pr.id_profesor =  ag.id_profesor group by pr.id_profesor order by count(ag.id) desc; 
-- 25
select pe.*, gr.nombre as grado, ag.nombre as asignatura, ag.tipo, ag.creditos, ag.cuatrimestre, ce.anyo_inicio, ce.anyo_fin from persona pe inner join alumno_se_matricula_asignatura am on pe.id = am.id_alumno inner join asignatura ag on am.id_asignatura = ag.id inner join grado gr on  ag.id_grado = gr.id inner join curso_escolar ce on am.id_curso_escolar = ce.id order by fecha_nacimiento desc limit 1;
-- 26
select concat(pe.nombre, " ", pe.apellido1, " ", pe.apellido2) as Profesor, de.nombre as Departamento from persona pe inner join profesor pr on pe.id = pr.id_profesor left join asignatura ag on pr.id_profesor = ag.id_profesor inner join departamento de on pr.id_departamento = de.id where ag.id_profesor is null order by Profesor;
use tienda;
-- 27
select nombre from producto;
-- 28
select nombre, precio from producto;
-- 29
select * from producto;
-- 30
select nombre, precio as "precio en €", round((precio/0.96), 2) as "precio en $" from producto;
-- 31
select nombre as Producto, precio as Euros, round((precio/0.96), 2) as "Dólares estaudinenses" from producto;
-- 32
select upper(nombre), precio from producto;
-- 33
select lower(nombre), precio from producto;
-- 34
select nombre, upper(left(nombre, 2)) as "Abreviatura" from fabricante;
-- 35
select nombre, round(precio) as Precio from producto;
-- 36
select nombre, truncate(precio, 0) from producto;
-- 37
select distinct fa.codigo as "Código fabricante con producto" from producto pr inner join fabricante fa on pr.codigo_fabricante = fa.codigo; 



