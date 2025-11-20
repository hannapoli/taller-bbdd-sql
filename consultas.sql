-- Obtener todos los alumnos y la información de la promoción y modalidad en la que están inscritos
SELECT
    a.alumno_id,
    a.nombre AS alumno_nombre,
    a.apellido AS alumno_apellido,
    p.nombre AS promocion_nombre,
    m.nombre_modalidad,
    p.fecha_comienzo
FROM
    Alumno a
    JOIN Alumno_Promocion ap ON a.alumno_id = ap.alumno_id
    JOIN Promocion p ON ap.promocion_id = p.promocion_id
    JOIN Modalidad m ON p.modalidad_id = m.modalidad_id;

--Obtener todos los profesores y los campus en los que enseñan, junto con su rol
SELECT
    pr.profesor_id,
    pr.nombre AS profesor_nombre,
    pr.apellido AS profesor_apellido,
    pr.email AS profesor_email,
    r.tipo_rol,
    c.nombre AS campus_nombre,
    c.ciudad AS campus_ciudad
FROM
    Profesor pr
    JOIN Rol r ON pr.rol_id = r.rol_id
    JOIN Campus c ON pr.campus_id = c.campus_id;

--Obtener los proyectos y los alumnos que participan en ellos, junto con los resultados de los proyectos
SELECT
    p.nombre_proyecto,
    a.nombre AS alumno_nombre,
    a.apellido AS alumno_apellido,
    ap.resultado
FROM
    Proyecto p
    JOIN Alumno_Proyecto ap ON p.proyecto_id = ap.proyecto_id
    JOIN Alumno a ON ap.alumno_id = a.alumno_id;

--Obtener los detalles de la promoción, modalidad y campus, para un alumno específico
SELECT
    a.nombre AS alumno_nombre,
    a.apellido AS alumno_apellido,
    p.nombre AS promocion_nombre,
    m.nombre_modalidad,
    p.fecha_comienzo,
    c.nombre AS campus_nombre,
    c.ciudad AS campus_ciudad
FROM
    Alumno a
    JOIN Alumno_Promocion ap ON a.alumno_id = ap.alumno_id
    JOIN Promocion p ON ap.promocion_id = p.promocion_id
    JOIN Modalidad m ON p.modalidad_id = m.modalidad_id
    JOIN Campus c ON p.campus_id = c.campus_id
WHERE
    a.alumno_id = 12;

--Listar alumnos y profesores de una promoción
select distinct
    pr.nombre as Promocion,
    pr.fecha_comienzo,
    p.nombre || ' ' || p.apellido as Profesor,
    r.tipo_rol,
    a.nombre || ' ' || a.apellido as Alumno
from
    promocion pr
    INNER JOIN campus c ON c.campus_id = pr.campus_id
    INNER JOIN profesor p ON p.campus_id = c.campus_id
    INNER JOIN rol r ON r.rol_id = p.rol_id
    INNER JOIN alumno_promocion ap ON ap.promocion_id = pr.promocion_id
    INNER JOIN alumno a ON a.alumno_id = ap.alumno_id
ORDER BY
    promocion,
    fecha_comienzo;