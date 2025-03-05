-- Correciones
-- 03. 
show columns from producto;
 -- 11.
select codigo_fabricante as "Código del Faricante" from producto;
/*+++++ Más consultas ++++++++*/
-- 12.
select distinct codigo_fabricante as "Código del Faricante" from producto;
-- 13. 
select * from fabricante order by nombre;
-- 14.
select * from fabricante order by nombre desc;
-- 15
select nombre, precio from producto order by nombre asc, precio desc;
-- 16
select * from fabricante limit 5;