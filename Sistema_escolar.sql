CREATE DATABASE Sistema_Escolar2;
USE Sistema_Escolar2;

-- Primero las tablas que no dependen de otras
CREATE TABLE direcciones(
    ID_direccion INT AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    Calle TEXT NOT NULL,
    Numero INT NOT NULL,
    Sector VARCHAR(18),
    Municipio TEXT NOT NULL,
    Provincia TEXT NOT NULL,
    Pais TEXT NOT NULL,
    Codigo_postal VARCHAR(10)
);

CREATE TABLE departamentos(
    ID_departamento INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    Nombre_departamento VARCHAR(40)
);

CREATE TABLE cursos(
    ID_curso INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    Nombre_curso VARCHAR(50),
    Descripcion TEXT
);

-- Ahora las tablas que tienen claves foráneas
CREATE TABLE estudiantes(
    ID_est INT AUTO_INCREMENT UNIQUE PRIMARY KEY NOT NULL,
    Nombre_est TEXT NOT NULL,
    Apellido TEXT NOT NULL,
    Fecha_nacimiento DATE NOT NULL,
    ID_direccion INT,
    FOREIGN KEY(ID_direccion) REFERENCES direcciones(ID_direccion)
);

CREATE TABLE profesores(
    ID_profesor INT AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    Nombre_prof TEXT NOT NULL,
    Apellido TEXT NOT NULL,
    ID_departamento INT,
    FOREIGN KEY (ID_departamento) REFERENCES departamentos(ID_departamento)
);

CREATE TABLE matricula(
    ID_matricula INT AUTO_INCREMENT PRIMARY KEY,
    ID_est INT,
    ID_curso INT,
    fecha_matricula DATE,
    FOREIGN KEY (ID_est) REFERENCES estudiantes(ID_est),
    FOREIGN KEY (ID_curso) REFERENCES cursos(ID_curso)
);
