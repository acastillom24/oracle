-- Consulta para pólizas
SELECT T7.COD_CIA, T7.COD_RAMO, T7.NOM_RAMO, T7.NUM_POLIZA, T7.TIP_DOCUM, T7.COD_DOCUM, T7.NOMBRE_CONTR, 
T7.NUM_SPTO, T7.NUM_APLI, T7.FEC_EFEC_SPTO, T7.FEC_VCTO_SPTO, T7.TIP_SPTO, T7.SITUACION, T7.MCA_PROVISIONAL, T7.PRIMA_TOTAL, SUM(H.IMP_RECIBO) PRIMA_PAGADA
FROM
(SELECT T6.COD_CIA, T6.COD_RAMO, T6.NOM_RAMO, T6.NUM_POLIZA, T6.TIP_DOCUM, T6.COD_DOCUM, T6.NOMBRE_CONTR, 
T6.NUM_SPTO, T6.NUM_APLI, T6.FEC_EFEC_SPTO, T6.FEC_VCTO_SPTO, T6.TIP_SPTO, T6.SITUACION, T6.MCA_PROVISIONAL, SUM(G.IMP_RECIBO) PRIMA_TOTAL
FROM
(SELECT DISTINCT T5.COD_CIA, T5.COD_RAMO, T5.NOM_RAMO, T5.NUM_POLIZA, T5.TIP_DOCUM, T5.COD_DOCUM, (F.APE1_TERCERO||' '|| F.APE2_TERCERO||' '|| F.NOM_TERCERO) NOMBRE_CONTR, 
T5.NUM_SPTO, T5.NUM_APLI, T5.FEC_EFEC_SPTO, T5.FEC_VCTO_SPTO, T5.TIP_SPTO, T5.SITUACION, T5.MCA_PROVISIONAL
    FROM
(SELECT T4.COD_CIA, T4.COD_RAMO, E.NOM_RAMO, T4.NUM_POLIZA, T4.TIP_DOCUM, T4.COD_DOCUM, T4.NUM_SPTO, T4.NUM_APLI, T4.FEC_EFEC_SPTO, T4.FEC_VCTO_SPTO, T4.TIP_SPTO, T4.MCA_PROVISIONAL, T4.SITUACION
    FROM 
(SELECT COD_CIA, COD_RAMO, NUM_POLIZA, TIP_DOCUM, COD_DOCUM, NUM_SPTO, NUM_APLI, FEC_EFEC_SPTO, FEC_VCTO_SPTO, TIP_SPTO, MCA_PROVISIONAL,
               CASE WHEN TIP_SPTO = 'AT' THEN 'ANULADA' 
                WHEN MCA_PROVISIONAL = 'S' THEN 'PROVISIONAL' 
                WHEN FEC_VCTO_SPTO >= SYSDATE THEN 'VIGENTE' 
                WHEN FEC_EFEC_SPTO < SYSDATE THEN 'EXPIRADA' 
                ELSE 'EXPIRADA' 
                END SITUACION
    FROM
(SELECT T3.COD_CIA, T3.COD_RAMO, T3.NUM_POLIZA, T3.TIP_DOCUM, T3.COD_DOCUM, T3.NUM_SPTO, T3.NUM_APLI, T3.FEC_EFEC_SPTO, D.TIP_SPTO, D.MCA_PROVISIONAL, MAX(D.FEC_VCTO_SPTO) FEC_VCTO_SPTO
    FROM
(SELECT T2.COD_CIA, T2.COD_RAMO, T2.NUM_POLIZA, T2.TIP_DOCUM, T2.COD_DOCUM, T2.NUM_SPTO, T2.NUM_APLI, MIN(C.FEC_EFEC_SPTO) FEC_EFEC_SPTO
    FROM
(SELECT A.COD_CIA, A.COD_RAMO, A.NUM_POLIZA, A.TIP_DOCUM, A.COD_DOCUM, A.NUM_SPTO, MAX(B.NUM_APLI) NUM_APLI
    FROM    
    (SELECT T1.COD_CIA, T1.COD_RAMO, T1.NUM_POLIZA, T1.TIP_DOCUM, T1.COD_DOCUM, MAX(T1.NUM_SPTO) NUM_SPTO
            FROM A2000030 T1 WHERE  T1.COD_DOCUM IN ('25764861') GROUP BY T1.COD_CIA, T1.COD_RAMO, T1.NUM_POLIZA, T1.TIP_DOCUM, T1.COD_DOCUM
                ) A
    INNER JOIN (SELECT * FROM A2000030) B ON (A.NUM_POLIZA = B.NUM_POLIZA AND A.COD_DOCUM = B.COD_DOCUM) GROUP BY A.COD_CIA, A.COD_RAMO, A.NUM_POLIZA, A.TIP_DOCUM, A.COD_DOCUM,  A.NUM_SPTO) T2
    INNER JOIN (SELECT * FROM A2000030) C ON (T2.NUM_POLIZA = C.NUM_POLIZA AND T2.COD_DOCUM = C.COD_DOCUM) GROUP BY T2.COD_CIA, T2.COD_RAMO, T2.NUM_POLIZA, T2.TIP_DOCUM, T2.COD_DOCUM,  T2.NUM_SPTO, T2.NUM_APLI) T3
    INNER JOIN (SELECT * FROM A2000030) D ON (T3.NUM_POLIZA = D.NUM_POLIZA AND T3.COD_DOCUM = D.COD_DOCUM AND T3.NUM_SPTO = D.NUM_SPTO AND T3.NUM_APLI = D.NUM_APLI) 
    GROUP BY T3.COD_CIA, T3.COD_RAMO, T3.NUM_POLIZA, T3.TIP_DOCUM, T3.COD_DOCUM,  T3.NUM_SPTO, T3.NUM_APLI, T3.FEC_EFEC_SPTO, TIP_SPTO, MCA_PROVISIONAL) ORDER BY NUM_POLIZA) T4
    INNER JOIN (SELECT * FROM A1001800) E ON (T4.COD_RAMO = E.COD_RAMO)) T5
    INNER JOIN (SELECT * FROM A1001399) F ON (T5.COD_DOCUM = F.COD_DOCUM)) T6
    INNER JOIN (SELECT * FROM A2990700) G ON (T6.NUM_POLIZA = G.NUM_POLIZA) 
    GROUP BY T6.COD_CIA, T6.COD_RAMO, T6.NOM_RAMO, T6.NUM_POLIZA, T6.TIP_DOCUM, T6.COD_DOCUM, T6.NOMBRE_CONTR, T6.NUM_SPTO, T6.NUM_APLI, T6.FEC_EFEC_SPTO, T6.FEC_VCTO_SPTO, T6.TIP_SPTO, T6.SITUACION, T6.MCA_PROVISIONAL) T7
    INNER JOIN (SELECT * FROM A2990700 WHERE TIP_SITUACION = 'CT') H ON (T7.NUM_POLIZA = H.NUM_POLIZA)
    GROUP BY T7.COD_CIA, T7.COD_RAMO, T7.NOM_RAMO, T7.NUM_POLIZA, T7.TIP_DOCUM, T7.COD_DOCUM, T7.NOMBRE_CONTR, T7.NUM_SPTO, T7.NUM_APLI, T7.FEC_EFEC_SPTO, T7.FEC_VCTO_SPTO, T7.TIP_SPTO, T7.SITUACION, T7.MCA_PROVISIONAL, T7.PRIMA_TOTAL;
