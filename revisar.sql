-- https://www.it-swarm-es.com/es/sql/buscar-todos-los-campos-en-todas-las-tablas-para-un-valor-especifico-oracle/958485185/
-- https://www.lawebdelprogramador.com/foros/Oracle/1673432-Buscar-un-valor-en-cualquier-campo-de-cualquier-tabla.html
-- https://jorgesanchez.net/manuales/sql/select-basico-sql2016.html
-- http://sql.11sql.com/sql-lite.htm
-- https://programmerclick.com/article/4265372854/
-- https://tar.mx/a/2017/buscar-nombre-de-columna-en-todas-las-tablas-de-oracle.html
-- https://www.ajpdsoft.com/modules.php?name=News&file=print&sid=172
-- https://www.tutorialesprogramacionya.com/oracleya/temarios/descripcion.php?cod=255&punto=1&inicio=

SELECT TABLE_NAME TABLA, COLUMN_NAME COLUMNA FROM USER_TAB_COLS
    WHERE DATA_TYPE IN ('VARCHAR2', 'NUMBER')
    ORDER BY TABLE_NAME;
    
    
 select table_name, column_name, data_type from user_tab_cols;
 
 CREATE OR REPLACE FUNCTION BUSCA_TODO(vPar number) 
    RETURN number 
    IS
    --Declaración de variables
    vCant INTEGER;
    vRes VARCHAR2(4000);
    --Acciones
    BEGIN 
    FOR B IN (
        SELECT TABLE_NAME TABLA, COLUMN_NAME COLUMNA FROM USER_TAB_COLS
            WHERE DATA_TYPE IN ('VARCHAR2', 'NUMBER')
            ORDER BY TABLE_NAME) 
    LOOP

    BEGIN 
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM '||B.TABLA||' WHERE '||B.COLUMNA||' = '||vPar||'' INTO vCant;

    IF vCant > 0 THEN
        vRes := vRes||'['||B.TABLA||'.'||B.COLUMNA||'.'||vCant||']' ;
    END IF ;

    EXCEPTION
        WHEN INVALID_NUMBER THEN NULL ;
        WHEN OTHERS THEN RAISE ;
    END ;

    END LOOP ;

    RETURN vRes ;
END ;/
