-- ============================
--   TABLA: Campus
-- ============================
CREATE TABLE
    Campus (
        campus_id INT PRIMARY KEY,
        nombre VARCHAR(50),
        ciudad VARCHAR(50)
    );

-- ============================
--   TABLA: Modalidad
-- ============================
CREATE TABLE
    Modalidad (
        modalidad_id INT PRIMARY KEY,
        nombre_modalidad VARCHAR(50) UNIQUE
    );

-- ============================
--   TABLA: Promocion
-- ============================
CREATE TABLE
    Promocion (
        promocion_id INT PRIMARY KEY,
        nombre VARCHAR(50),
        modalidad_id INT,
        campus_id INT,
        fecha_comienzo DATE,
        FOREIGN KEY (modalidad_id) REFERENCES Modalidad (modalidad_id),
        FOREIGN KEY (campus_id) REFERENCES Campus (campus_id)
    );

-- ============================
--   TABLA: Alumno
-- ============================
CREATE TABLE
    Alumno (
        alumno_id INT PRIMARY KEY,
        nombre VARCHAR(50),
        apellido VARCHAR(50),
        email VARCHAR(50) UNIQUE
    );

-- ============================
--   TABLA: Rol
-- ============================
CREATE TABLE
    Rol (rol_id INT PRIMARY KEY, tipo_rol VARCHAR(50));

-- ============================
--   TABLA: Profesor
-- ============================
CREATE TABLE
    Profesor (
        profesor_id INT PRIMARY KEY,
        nombre VARCHAR(50),
        apellido VARCHAR(50),
        email VARCHAR(50) UNIQUE,
        rol_id INT,
        campus_id INT,
        FOREIGN KEY (rol_id) REFERENCES Rol (rol_id),
        FOREIGN KEY (campus_id) REFERENCES Campus (campus_id)
    );

-- ============================
--   TABLA: Tipo_Bootcamp
-- ============================
CREATE TABLE
    Tipo_Bootcamp (
        tipo_bootcamp_id INT PRIMARY KEY,
        nombre_tipo VARCHAR(50),
        duracion_semanas INT
    );

-- ============================
--   TABLA: Proyecto
-- ============================
CREATE TABLE
    Proyecto (
        proyecto_id INT PRIMARY KEY,
        nombre_proyecto VARCHAR(50),
        tipo_bootcamp_id INT,
        FOREIGN KEY (tipo_bootcamp_id) REFERENCES Tipo_Bootcamp (tipo_bootcamp_id)
    );

-- ============================
--   TABLA INTERMEDIA: Alumno_Proyecto
-- ============================
CREATE TABLE
    Alumno_Proyecto (
        alumno_proyecto_id INT PRIMARY KEY,
        alumno_id INT,
        proyecto_id INT,
        resultado VARCHAR(50),
        FOREIGN KEY (alumno_id) REFERENCES Alumno (alumno_id),
        FOREIGN KEY (proyecto_id) REFERENCES Proyecto (proyecto_id)
    );

-- ============================
--   TABLA INTERMEDIA: Alumno_Promocion
-- ============================
CREATE TABLE
    Alumno_Promocion (
        alumno_promocion_id INT PRIMARY KEY,
        alumno_id INT,
        promocion_id INT,
        FOREIGN KEY (alumno_id) REFERENCES Alumno (alumno_id),
        FOREIGN KEY (promocion_id) REFERENCES Promocion (promocion_id)
    );