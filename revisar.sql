-- https://www.it-swarm-es.com/es/sql/buscar-todos-los-campos-en-todas-las-tablas-para-un-valor-especifico-oracle/958485185/
-- https://www.lawebdelprogramador.com/foros/Oracle/1673432-Buscar-un-valor-en-cualquier-campo-de-cualquier-tabla.html
-- https://jorgesanchez.net/manuales/sql/select-basico-sql2016.html
-- http://sql.11sql.com/sql-lite.htm
-- https://programmerclick.com/article/4265372854/
-- https://tar.mx/a/2017/buscar-nombre-de-columna-en-todas-las-tablas-de-oracle.html
-- https://www.ajpdsoft.com/modules.php?name=News&file=print&sid=172
-- https://www.tutorialesprogramacionya.com/oracleya/temarios/descripcion.php?cod=255&punto=1&inicio=


-- Listar todos los campos de las tablas por esquema.
SELECT TABLE_NAME
    FROM ALL_TAB_COLUMNS
        WHERE COLUMN_NAME = 'NUM_ORD_PAGO'
            AND OWNER = 'TRON2000'
        GROUP BY TABLE_NAME, COLUMN_NAME
        ORDER BY TABLE_NAME;
        
        
        
        


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




CREATE OR REPLACE FUNCTION BUSCA_TODO(vPar IN VARCHAR2) RETURN VARCHAR2 IS
vCant INTEGER ;
vRes VARCHAR2(4000) ;
BEGIN
FOR B IN (SELECT
TABLE_NAME TABLA,
COLUMN_NAME COL
FROM USER_TAB_COLS
WHERE DATA_TYPE IN ('VARCHAR2','NUMBER')
ORDER BY TABLE_NAME) LOOP
BEGIN
EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM '||B.TABLA||' WHERE '||B.COL||' = '''||vPar||'''' INTO vCant ;
IF vCant > 0 THEN
vRes := vRes||'['||B.TABLA||'.'||B.COL||'.'||vCant||']' ;
END IF ;
EXCEPTION
WHEN INVALID_NUMBER THEN
NULL ;
WHEN OTHERS THEN
RAISE ;
END ;
END LOOP ;
RETURN vRes ;
END ;
/


SELECT * FROM MP_LISTA_OFAC WHERE NOMB_CLIENTE_EXT LIKE '%ANGELINI%';

SELECT BUSCA_TODO(423121) FROM DUAL;



SELECT DISTINCT C.*,D.NOM_ERROR FROM (
SELECT A.*, B.NUM_SPTO,B.NUM_APLI, B.NUM_SPTO_APLI,B.COD_ERROR,B.FEC_AUTORIZACION,B.COD_USR_AUTORIZACION,B.OBS_AUTORIZACION FROM (
SELECT    COD_CIA, COD_DOCUM,TIP_DOCUM, COD_RAMO, NUM_POLIZA from A2000030 
where NUM_POLIZA IN ('2301110400144', '3021800200897','3011311802706') ) A LEFT JOIN 
(SELECT * FROM A2000221
WHERE COD_ERROR ='234' OR COD_ERROR ='44' OR COD_ERROR ='235'  ) B
ON  A.COD_CIA=B.COD_CIA AND   A.NUM_POLIZA=B.NUM_POLIZA ) C LEFT JOIN
(SELECT * FROM G2000211) D
ON C.COD_ERROR=D.COD_ERROR
WHERE OBS_AUTORIZACION IS NOT NULL
