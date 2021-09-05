-- CONSULTAS NULL / IS NOT NULL

SELECT * FROM nombre_table WHERE nombre_campo IS NULL;
SELECT * FROM nombre_table WHERE nombre_campo IS NOT NULL;

-- VALORES VACÍOS

SELECT * FROM nombre_table WHERE nombre_campo '';
SELECT * FROM nombre_table WHERE nombre_campo ' ';

-- VALORES POR DEFECTO

CREATE TABLE nombre_tabla(
  nombre_campo1 tipo_dato1 NOT NULL,
  nombre_campo2 tipo_dato2 DEFAULT <valor_defecto>
)

