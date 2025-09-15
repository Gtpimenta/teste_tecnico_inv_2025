-- Questão 3:

SELECT
        NOME_PDV,
        SUM(SELLIN) AS TOTAL_SELLIN,
        MES,
        ANO
FROM PONTO_VENDA_UNIDADE
GROUP BY
    NOME_PDV,
    MES,
    ANO
ORDER BY
        ANO ASC
        MES ASC
        NOME_PDV ASC;