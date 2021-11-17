SELECT COD_CIA, FEC_PROCESO, NUM_FILA, TIP_DOCUM, ID_CONTRATANTE, TIPO_PERSONA, REPLACE( REPLACE(NOMBRE_PERSONA, ';', ' '), '|', '') NOMBRE_PERSONA,
TIPO_PER_JUR, TAM_PER_JUR, VOLUMEN_TRANS, ACT_ECONOMICA, PROFESION_OCUPA, COND_SUJETO_OBLIG, REGIMEN, 
PEPS, COD_POLIZA, COD_CERTIFICADO, COD_PRODUCTO, NOM_PRODUCTO, RIESGO_TECNICO, CANAL_DISTRIBUCION, MONEDA, 
PAIS_NACIMIENTO, NACIONALIDAD, PAIS_RESIDENCIA, PAIS_CONSTITUCION, PAIS_FUNCIONAMIENTO, LOCALIDAD, PRIMA_NETA, 
SENSIBLE, COD_USR, FE_ACTU, PRIMA_NETA_DOL
    FROM TRON2000.TRAMA_GESTIONRIESGO
        WHERE COD_USR = 'ALINROB'
            AND FEC_PROCESO = TO_DATE('01/10/2021', 'DD/MM/YYYY');
