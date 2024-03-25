--------------------------------------------------------------------------------
-- Paso 1: DER. 
--------------------------------------------------------------------------------
-- Diagrama DER adjunto a la entrega con nombre: 1_DER_Biblioteca.mwb

--------------------------------------------------------------------------------
-- Paso 2: Creación de la estructura e inserción de datos (DDL). 
--------------------------------------------------------------------------------
CREATE DATABASE biblioteca;

USE biblioteca;


-- Tabla SOCIOS
CREATE TABLE socios (
  dni INT NOT NULL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  fecha_alta DATE NOT NULL,
  estado_suscripcion VARCHAR(20) NOT NULL DEFAULT 'A' -- A: Activo, I: Inhabilitado
);

-- Tabla LIBROS
CREATE TABLE libros (
  id_libro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  autor VARCHAR(50) NOT NULL,
  genero VARCHAR(50) NOT NULL,
  anio_publicacion INT NOT NULL
);

-- Tabla PRESTAMOS
CREATE TABLE prestamos (
  id_prestamo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_socio INT NOT NULL,
  id_libro INT NOT NULL,
  fecha_retiro DATE NOT NULL,
  fecha_devolucion DATE NOT NULL,
  estado VARCHAR(20) NOT NULL DEFAULT 'V' -- V: Vigente, D: Devuelto
);

-- Agrego las claves foráneas a la Tabla Prestamos. 
ALTER TABLE prestamos
  ADD CONSTRAINT fk_socio FOREIGN KEY (id_socio) REFERENCES socios (dni),
  ADD CONSTRAINT fk_libro FOREIGN KEY (id_libro) REFERENCES libros (id_libro);


--------------------------------------------------------------------------------
-- Paso 3: Inserción de Datos (DML). 
--------------------------------------------------------------------------------
-- SOCIOS
INSERT INTO Socios (DNI, Nombre, Apellido, fecha_nacimiento, Direccion, Telefono, fecha_alta, estado_suscripcion) VALUES (33445566, 'Juan',  	'Perez', 	'1988-05-15', 'Av Siempreviva 555', 	'011-1567899879', '2015-05-15', 'Activa');
INSERT INTO Socios (DNI, Nombre, Apellido, fecha_nacimiento, Direccion, Telefono, fecha_alta, estado_suscripcion) VALUES (34347788, 'Carlos', 	'Calabresa','1987-05-27', 'Av Cordoba 123', 		'011-1564566549', '2016-06-16', 'Activa');
INSERT INTO Socios (DNI, Nombre, Apellido, fecha_nacimiento, Direccion, Telefono, fecha_alta, estado_suscripcion) VALUES (33556677, 'Esteban', 	'Quito', 	'1988-04-24', 'Av del Trabajador 1122', '011-1561233219', '2014-04-14', 'Desactiva');
INSERT INTO Socios (DNI, Nombre, Apellido, fecha_nacimiento, Direccion, Telefono, fecha_alta, estado_suscripcion) VALUES (33445588, 'Andrea', 	'Lira', 	'1989-01-29', 'Bv los Andes 3355', 		'0342-155398022', '2019-01-11', 'Activa');

INSERT INTO Socios (DNI, Nombre, Apellido, fecha_nacimiento, Direccion, Telefono, fecha_alta, estado_suscripcion) VALUES (45454545, 'Ignacio', 	'Ramos', 	'1985-05-13', 'Almirante Brown 3355',	'0311-155394987', '2019-01-11', 'Desactiva');
INSERT INTO Socios (DNI, Nombre, Apellido, fecha_nacimiento, Direccion, Telefono, fecha_alta, estado_suscripcion) VALUES (39393939, 'Alejo', 	'Embon', 	'1983-09-19', 'Mendoza 3355'	, 		'0264-155398079', '2019-01-11', 'Activa');
INSERT INTO Socios (DNI, Nombre, Apellido, fecha_nacimiento, Direccion, Telefono, fecha_alta, estado_suscripcion) VALUES (29292929, 'Tomar', 	'Rodriguez','1979-02-15', 'Sucre 3355'		, 		'0351-155398025', '2019-01-11', 'Desactiva');

-- LIBROS 
INSERT INTO Libros (Titulo, Autor, Genero, anio_publicacion) VALUES ('El principito 									', 'Antoine de Saint-Exupery 	', 'Ciencia Ficción 	', 2016);
INSERT INTO Libros (Titulo, Autor, Genero, anio_publicacion) VALUES ('El Alquimista 									', 'Paulo Cohelo 				', 'Novela Narrativa 	', 1995);
INSERT INTO Libros (Titulo, Autor, Genero, anio_publicacion) VALUES ('Einstein, su vida y su universo 					', 'Walter Isaacson 			', 'Biografía 			', 2007);
INSERT INTO Libros (Titulo, Autor, Genero, anio_publicacion) VALUES ('Metamorfosis 										', 'Franz Kafka 				', 'Terror 				', 1999);
INSERT INTO Libros (Titulo, Autor, Genero, anio_publicacion) VALUES ('El Hobbit 										', 'J. R. R. Tolkien 			', 'Ciencia Ficción 	', 2003);
INSERT INTO Libros (Titulo, Autor, Genero, anio_publicacion) VALUES ('El señor de los anillos: La comunidad del anillo	', 'J. R. R. Tolkien 			', 'Ciencia Ficción 	', 2003);
INSERT INTO Libros (Titulo, Autor, Genero, anio_publicacion) VALUES ('Cancion de hielo y fuego vol 1: Juego de tronos	', 'George R. R. Martin 		', 'Ciencia Ficción 	', 2019);

-- PRESTAMOS 
INSERT INTO Prestamos (id_socio, id_libro, fecha_retiro, fecha_devolucion, estado) VALUES (33445566, 7, '2022-05-05', '2022-05-20', 'Devuelto');
INSERT INTO Prestamos (id_socio, id_libro, fecha_retiro, fecha_devolucion, estado) VALUES (33445566, 5, '2022-05-15', '2022-06-01', 'Devuelto');
INSERT INTO Prestamos (id_socio, id_libro, fecha_retiro, fecha_devolucion, estado) VALUES (33445588, 4, '2022-07-01', '2022-07-16', 'Vencido');
INSERT INTO Prestamos (id_socio, id_libro, fecha_retiro, fecha_devolucion, estado) VALUES (45454545, 1, '2022-07-01', '2022-07-16', 'Vencido');
INSERT INTO Prestamos (id_socio, id_libro, fecha_retiro, fecha_devolucion, estado) VALUES (39393939, 6, '2022-07-01', '2022-07-16', 'Vencido');
INSERT INTO Prestamos (id_socio, id_libro, fecha_retiro, fecha_devolucion, estado) VALUES (29292929, 6, '2022-08-01', '2022-07-16', 'Vencido');
INSERT INTO Prestamos (id_socio, id_libro, fecha_retiro, fecha_devolucion, estado) VALUES (29292929, 3, '2022-07-01', '2022-07-16', 'Vencido');
INSERT INTO Prestamos (id_socio, id_libro, fecha_retiro, fecha_devolucion, estado) VALUES (34347788, 2, '2022-01-10', '2022-07-25', 'Devuelto');
INSERT INTO Prestamos (id_socio, id_libro, fecha_retiro, fecha_devolucion, estado) VALUES (33445588, 2, '2022-02-10', '2022-07-25', 'Devuelto');
INSERT INTO Prestamos (id_socio, id_libro, fecha_retiro, fecha_devolucion, estado) VALUES (29292929, 2, '2022-03-10', '2022-07-26', 'Pendiente');

--------------------------------------------------------------------------------
-- Paso 4: Consultas
--------------------------------------------------------------------------------
-- A. Listar dni, nombre y apellido de socios que tengan una suscripción activa.

use biblioteca;

SELECT *
FROM   SOCIOS
WHERE  estado_suscripcion = 'Activa';


-- B. Listar dni, nombre, apellido, teléfono, título del libro, fecha de retiro y fecha
--    de devolución de aquellos préstamos que se hayan vencido.
SELECT 	s.DNI, 
		s.Nombre, 
		s.Apellido, 
		s.Telefono, 
		l.Titulo, 
		p.fecha_retiro, 
		p.fecha_devolucion
FROM   	socios s 	inner join prestamos p on s.dni = p.id_socio
					inner join libros l on l.id_libro = p.id_libro
WHERE  	estado = 'Vencido'

-- C. Listar dni, nombre, apellido, teléfono, título del libro, fecha de retiro y fecha
--    de devolución de aquellos préstamos que se estén por vencer en el día.
SELECT 	s.DNI, 
		s.Nombre, 
		s.Apellido, 
		s.Telefono, 
		l.Titulo, 
		p.fecha_retiro, 
		p.fecha_devolucion
FROM   	socios s 	inner join prestamos p on s.dni = p.id_socio
					inner join libros l on l.id_libro = p.id_libro
WHERE  	p.fecha_devolucion = curdate();

-- D. Listar título, autor, género, año de la edición de los libros disponibles para
--    prestar por autor, se debe validar que el libro no se encuentre prestado en
--    ese momento.
SELECT 	l.Titulo, 
        l.autor, 
        l.genero, 
        l.anio_publicacion
FROM   	libros l 
WHERE  	l.id_libro not in (	select 	id_libro 
							from 	prestamos 
							where 	upper(estado) in ('PENDIENTE','VENCIDO'));


-- E. Listar título, autor, género y la cantidad de veces que fueron prestados los
--    libros ordenándolos de manera descendente desde el libro que fue
--    prestado la mayor cantidad de veces.
SELECT 	l.Titulo, 
        l.autor, 
        l.genero, 
        count(*) as Cantidad
FROM   	prestamos p inner join libros l on p.id_libro = l.id_libro
GROUP BY p.id_libro,
		l.Titulo, 
        l.autor, 
        l.genero
ORDER BY Cantidad desc;        

-- F. Mostrar título, nombre, apellido y fecha de devolución para un libro
--    determinado que se encuentra en préstamo, del que se quiere saber
--    cuando vuelve a estar disponible para prestar nuevamente.
SELECT 	l.titulo, 
		s.nombre, 
        s.apellido, 
        p.fecha_devolucion
FROM    prestamos p inner join socios s on p.id_socio = s.dni
					inner join libros l on p.id_libro = l.id_libro
WHERE 	upper(p.estado) in ('VENCIDO','PENDIENTE');


--------------------------------------------------------------------------------
-- Paso 5: Funciones
--------------------------------------------------------------------------------

-- Definicion de la Funcion
DELIMITER $$

CREATE FUNCTION obtener_libros_disponibles(consulta_genero VARCHAR(50))
RETURNS TABLE(
  id_libro INT,
  titulo VARCHAR(100),
  autor VARCHAR(50)
)
BEGIN

	SELECT 	l.id_libro, 
			l.titulo, 
			l.autor,
			l.genero
	FROM 	libros l
	WHERE  	TRIM(l.genero) = consulta_genero
			and id_libro not in (	SELECT 	id_libro 
									FROM 	prestamos 
									WHERE 	estado in ('Vencido','Pendiente'));

END $$

DELIMITER ;

-- Ejecución de la Funcion:
SELECT * FROM obtener_libros_disponibles('Ciencia Ficción 	');


-- Resultado Consulta:
/*

# id_libro	titulo												autor							genero
1			El principito 										Antoine de Saint-Exupery 		Ciencia Ficción 	
5			El Hobbit 											J. R. R. Tolkien 				Ciencia Ficción 	
6			El señor de los anillos: La comunidad del anillo	J. R. R. Tolkien 				Ciencia Ficción 	
7			Cancion de hielo y fuego vol 1: Juego de tronos		George R. R. Martin 			Ciencia Ficción 	

*/

--------------------------------------------------------------------------------
-- Paso 6: Procedimientos.
--------------------------------------------------------------------------------

USE `biblioteca`;
DROP procedure IF EXISTS `alta_actualiza_socio`;

USE `biblioteca`;
DROP procedure IF EXISTS `biblioteca`.`alta_actualiza_socio`;
;

DELIMITER $$
USE `biblioteca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_actualiza_socio`(
  IN dni_socio INT,
  IN nombre VARCHAR(50),
  IN apellido VARCHAR(50),
  IN fecha_nacimiento DATE,
  IN direccion VARCHAR(100), 
  IN telefono VARCHAR(15),
  IN fecha_alta DATE,
  IN estado_suscripcion VARCHAR(20)
)
BEGIN

  DECLARE socio_existe INT;

  -- Verifica si el socio existe
  SELECT COUNT(*) INTO socio_existe
  FROM socios
  WHERE dni = dni_socio;

  IF socio_existe > 0 THEN
    -- Actualiza la información del socio
    UPDATE socios
    SET nombre = nombre,
        apellido = apellido,
        fecha_nacimiento = fecha_nacimiento,
        direccion = direccion,
        telefono = telefono, 
        fecha_alta = fecha_alta,
        estado_suscripcion = 'Activa'
    WHERE dni = dni_socio;
  ELSE
    -- Inserta un nuevo socio
    INSERT INTO socios (dni, nombre, apellido, fecha_nacimiento, direccion, telefono, fecha_alta, estado_suscripcion)
    VALUES (dni_socio, nombre, apellido, fecha_nacimiento, direccion, telefono, fecha_alta, estado_suscripcion);
  END IF;

  SELECT *
  FROM socios
  WHERE dni = dni_socio;

END$$

DELIMITER ;


-- Ejecución del Stored Procedure. 
CALL alta_actualiza_socio('40350415', 'Jeronimo', 'Rodriguez', '2000-05-31', 'Mendoza 123', '1533335555', curdate(), 'Activa');
CALL alta_actualiza_socio('33556677', 'Sebastian', 'Quito', '2000-01-26', 'Olazabal 2059', '1533335555', curdate(), 'Activa');


--------------------------------------------------------------------------------
-- Creación 2do Stored Procedure. 
USE `biblioteca`;
DROP procedure IF EXISTS `obtener_socios_prestamos_vencidos`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE obtener_socios_prestamos_vencidos()

BEGIN

  SELECT 	s.*, 
			l.titulo, 
            p.fecha_devolucion
  FROM 		socios s
			INNER JOIN prestamos p ON p.id_socio = s.dni
			INNER JOIN libros l ON l.id_libro = p.id_libro
  WHERE p.estado = 'Vencido';

END$$

DELIMITER ;



-- Ejecución del 2do Stored Procedure. 
CALL obtener_socios_prestamos_vencidos();

