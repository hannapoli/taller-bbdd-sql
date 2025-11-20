# Proyecto – Base de Datos Relacional. 
# Base de datos de una academia

## 1. Introducción
En este proyecto hemos diseñado y construido una base de datos relacional completa para gestionar la información de una escuela de bootcamps.El objetivo principal es modelar entidades reales como campus, promociones, alumnos, profesores y proyectos, y establecer relaciones lógicas entre ellas para garantizar integridad, consistencia y eficiencia en el manejo de datos.

## 2. Objetivos del Proyecto
- Diseñar un esquema relacional sólido basado en necesidades reales de un entorno educativo.
- Crear tablas con claves primarias, claves foráneas y restricciones de unicidad.
- Importar datos desde archivos CSV y poblar la base de datos respetando las dependencias entre tablas.
- Practicar conceptos clave:
	- Normalización
	- Integridad referencial
	- Relaciones 1-N y N-N
	- Tablas puente / intermedias
	- Carga de datos y validación

## 3. Arquitectura del Modelo de Datos
La base de datos se compone de 9 tablas principales, organizadas de manera que los datos mantengan coherencia y no se dupliquen innecesariamente.

### 1. Campus
Define los campus físicos de la escuela.Atributos clave:
- ID del campus
- Nombre
- Ciudad

### 2. Modalidad
Define el tipo de modalidad en la que se realiza un bootcamp (por ejemplo, Online, Presencial, Híbrida).Incluye una restricción de unicidad.

### 3. Promoción
Relaciona una modalidad y un campus específicos con un grupo de alumnos.Representa el concepto de "cohorte".

### 4. Alumno_Promocion (tabla intermedia)
Permite gestionar la relación N–N entre alumnos y promociones.Incluye:
- ID alumno promocion
- El alumno
- La promoción


### 5. Alumno
Contiene la información personal de cada estudiante e incluye una relación directa con su promoción.

### 6. Rol
Se utiliza para clasificar a los profesores según su función:
- Lead teacher
- Teaching assistant
- Invitadoetc.

### 7. Profesor
Contiene la información de los profesores y su relación con un rol y un campus.

### 8. Tipo_Bootcamp
Define categorías generales como:
- Data Science
- Web Development
- CiberseguridadCon una duración asociada.

### 9. Proyecto
Registra los proyectos que se realizan dentro de cada tipo de bootcamp.

### 10. Alumno_Proyecto (tabla intermedia)
Permite gestionar la relación N–N entre alumnos y proyectos.Incluye:
- El alumno
- El proyecto
- El resultado obtenidoCon una restricción UNIQUE para evitar duplicidades.

## 4. Relaciones Entre Tablas
Este es un modelo que combina relaciones 1:N y N:N:

### Relaciones 1 a N
- Un campus → muchas promociones
- Una modalidad → muchas promociones
- Una promoción → muchos alumnos
- Un campus → muchos profesores
- Un rol → muchos profesores
- Un tipo de bootcamp → muchos proyectos

### Relaciones N a N
#### 1. Alumnos y proyectos:
- Un alumno puede tener muchos proyectos.
- Un proyecto puede pertenecer a muchos alumnos.
- Esto se resuelve con la tabla **Alumno_Proyecto**.

#### 2. Alumnos y promociones:
- Un alumno puede participar en varias promociones.
- Una promoción puede tener muchos alumnos.
- Esto se resuelve con la tabla **Alumno_Promocion**.

## 5. Proceso de Construcción de las Tablas
Las tablas se crean definiendo:
- **Claves primarias (PK)**
- **Claves foráneas (FK)** que conectan entidades
- **Restricciones** como UNIQUE para emails o combinaciones clave
- Tipos de datos apropiados:
- VARCHAR para texto
- INT para identificadores
- DATE para fechas
El resultado es un esquema robusto, listo para insertar información de forma segura.

## 6. Carga de Datos desde CSV
El bootcamp proporcionó dos archivos CSV que contienen información de alumnos y sus resultados en 5 proyectos:
- Proyecto HLF
- Proyecto EDA
- Proyecto BBDD
- Proyecto ML
- Proyecto Deployment

Para insertarlos correctamente:
**1. Se generan primero datos maestros**
- Campus
- Promociones
- Proyectos
- Tipos de bootcamp

**2. Insertar alumos**
Después se insertan los alumnos asignando cada uno a su promoción y campus.

**3. Insertar relaciones** 
Finalmente se insertan las relaciones de proyectos en la tabla Alumno_Proyecto, donde además se guarda el resultado del alumno en cada proyecto. Además, se relaciona las promociones con los alumnos mediante la tabla Alumno_Promocion.

## 7. Beneficios del Modelo
- Evita duplicidades en nombres de campus, roles, modalidades y promociones.
- Asegura integridad entre alumnos y proyectos gracias a las claves foráneas.
- Permite obtener queries analíticas como:
	- Ganadores de proyectos
	- Listado de alumnos por campus
	- Proyectos mejor evaluados
	- Promociones más grandes
- Escala fácilmente si se agregan más:
	- Bootcamps
	- Profesores
	- Competencias
	- Resultados

