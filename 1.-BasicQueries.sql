-- VISUALIZAR TODAS LAS TABLAS
SELECT * FROM ALL_TABLES;

-- CREAR TABLAS
CREATE TABLE usuario(
  id_usuario int,
  nombre char(10),
  fecha_nacimiento date,
  salario number(6,2)
);

-- INFORMACIÓN DE LAS TABLAS
DESCRIB nombre_tabla;

-- INSERTAR REGISTROS EN UNA TABLA
INSERT INTO nombre_tabla VALUES(
  0001,
  'Alin',
  TO_DATE('24/08/1995', 'dd/mm/yyyy'),
  453.04
);

-- BORRAR FILAS DE UNA TABLA
DELETE FROM nombre_tabla WHERE nombre_campo = <condición>;

-- BORRAR TODOS LOS REGISTROS DE UNA TABLA
DELETE FROM nombre_tabla;

-- CONFIGURACIÓN DE PRIMARY KEY
CREATE TABLE usuario(
  nombre varchar(20) not null,
  clave varchar2(10) not null,
  primary key(nombre)
);

-- ELIMINAR REGISTROS DE UNA TABLA
DELETE FROM nombre_tabla;

-- RECUPERAR LOS REGISTROS DE UNA TABLA
ROLLBACK;

-- ELIMINAR Y RECUPERAR REGISTROS
TRUCATE TABLE nombre_tabla;

-- VALORES POR DEFECTO EN UNA TABLA

