-- Ingresamos con el usuario por default.
sqlplus "/ as sysdba"

-- Opción 1:
ALTER USER <nombre_usuario> IDENTIFIED BY <new_password>;

-- Opción 2:
PASSW <nombre_usuario>;
