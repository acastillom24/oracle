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









