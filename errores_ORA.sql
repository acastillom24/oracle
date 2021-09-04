# Ejecutar el cmd

## Paso 1:

sqlplus /nolog

CONN /AS SYSDBA

ALTER SYSTEM REGISTER;

EXIT

lsnrctl status

## Paso 2:

sqlplus /nolog 

CONN /AS SYSDBA

ALTER SYSTEM SET LOCAL_LISTENER = '(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))' SCOPE = BOTH;

ALTER SYSTEM REGISTER;

EXIT

lsnrctl status
