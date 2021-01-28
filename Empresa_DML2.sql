use empresa;
/*
departamento(num_dep,nom_dep,emp_superv);
empleado(num_emp,nom_emp,sueldo,num_dep);
proyecto(num_proy,nom_proy,fecha_inicio,cod_loc);
trabaja(nun_emp,num_proy,horas);
localidad(cod_loc, descripcion);
*/

/*4)Listar nombre y sueldo de aquellos empleados que cominezan con la letra D, 
ganan entre 80000 y 120000 
y trabajan en un proyecto iniciado en el año 2018*/
-- TABLAS QUE NECESITO: empleado, trabaja , proyecto
SELECT distinct e.nom_emp,e.sueldo_emp
FROM Empleado e
WHERE e.nom_emp LIKE 'D%'
AND e.sueldo_emp BETWEEN 80000 AND 120000
AND EXISTS (SELECT 1
			  FROM Trabaja t JOIN Proyecto p ON t.num_proy = p.num_proy
              WHERE p.fecha_inicio > '20180101'
              AND t.num_emp = e.num_emp);

/*3)Mostar los nombre de los empleados que trabajan en todos los proyectos*/
-- Tablas que necesito: empleado, tabaja, proyecto
SELECT e.nom_emp
FROM EmplEado e JOIN Trabaja t ON e.num_emp = t.num_emp
GROUP BY e.num_emp,e.nom_emp,t.num_emp
HAVING COUNT(*) = (select COUNT(*)
					FROM proyecto);

SELECT e.nom_emp
FROM Empleado e
WHERE NOT EXISTS (SELECT 1
					FROM Proyecto p
                    WHERE NOT EXISTS (SELECT 1
										FROM Trabaja t
                                        WHERE e.num_emp = t.num_emp
                                        AND t.num_proy = p.num_proy));

/*2)Seleccionar nombre y numero de empleados, nombre de depatamento 
y el sueldo del empleado que no trabaje en ningun proyecto*/
-- tablas que necesito: empleados,departamento,trabaja 
SELECT distinct e.num_emp, e.nom_emp, e.sueldo_emp, d.nom_dep
FROM empleado e JOIN departamento d ON e.num_dep = d.nom_dep
				JOIN Trabaja t ON t.num_emp = e.num_emp
WHERE NOT EXISTS (SELECT 1
					FROM proyecto p
                    WHERE p.num_proy = t.num_proy);
                    
SELECT e.num_emp, e.nom_emp, e.sueldo_emp, d.nom_dep
FROM empleado e JOIN departamento d ON e.num_dep = d.nom_dep
				JOIN Trabaja t ON t.num_emp = e.num_emp
WHERE t.num_proy NOT IN (SELECT p.num_proy
							FROM proyecto p);

/*1)Seleccionar los nombres de pryectos donde haya empleados que ganen mas de 10000*/
-- tablas que necesito: proyecto, trabaja,empleado
SELECT distinct p.nom_proy
FROM Proyecto p JOIN Trabaja t ON p.num_proy = t.num_proy
WHERE EXISTS (SELECT 1
				FROM Empleado e
                WHERE e.sueldo_emp > 10000
                AND e.num_emp = t.num_emp);