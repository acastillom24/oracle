-- Abrimos sql plus e ingresamos con el siguiente usuario:
SYS /AS SYSDBA

-- Crear un nuevo usuario.
CREATE USER <nombre_usuario> IDENTIFIED BY <password>;

-- Error: ORA-65096
-- Comando: DCL - Lenguaje de control de datos.
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- Ejecutamos nuevamente el siguiente comando:
CREATE USER <nombre_usuario> IDENTIFIED BY <password>;

-- Asignar permisos y privilegios.
-- Comando: DCL - Lenguaje de control de datos
GRANT DBA TO <nombre_usuario>;
