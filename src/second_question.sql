CREATE OR REPLACE VIEW `roberto-costa.tabela_tratada_desafio_stone.block_crated_day` AS
SELECT COUNT(DISTINCT NUMBER) AS QTDE_BLOCK,
                      DATE(timestamp) AS DATE
FROM `bigquery-public-data.crypto_ethereum.blocks`
GROUP BY 2
ORDER BY 2 ASC