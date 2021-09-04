## Ingresamos con el usuario por default.
sqlplus "/ as sysdba"

## Opción 1:

ALTER USER <Nombre del usuario> IDENTIFIED BY <Nueva contraseña>;

## Opción 2:

PASSW <Nombre del usuario>;
