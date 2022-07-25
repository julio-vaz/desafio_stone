CREATE OR REPLACE VIEW `roberto-costa.tabela_tratada_desafio_stone.variation_block` AS
WITH
variation_block AS ( 
            SELECT COUNT(DISTINCT A.BLOCK_NUMBER) as QTDE_BLOCK,
                   DATE(B.timestamp) AS DATE
FROM `bigquery-public-data.crypto_ethereum.tokens` A
LEFT JOIN `bigquery-public-data.crypto_ethereum.blocks` B ON A.block_hash = B.hash
WHERE DATE(B.TIMESTAMP) BETWEEN CURRENT_DATE() -15 AND CURRENT_DATE()
GROUP BY 2
ORDER BY 2 DESC)

SELECT AVG(QTDE_BLOCK) AS VARIAC_BLOCO_TKEN_DIA
FROM variation_block