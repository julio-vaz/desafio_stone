CREATE OR REPLACE VIEW `roberto-costa.tabela_tratada_desafio_stone.token_created_block` AS
SELECT COUNT(DISTINCT A.address) as QTDE_TOKEN,
                        B.NUMBER AS BLOCK_NUMBER
FROM `bigquery-public-data.crypto_ethereum.tokens` A
LEFT JOIN `bigquery-public-data.crypto_ethereum.blocks` B ON A.block_hash = B.hash
GROUP BY 2