CREATE OR REPLACE VIEW `roberto-costa.tabela_tratada_desafio_stone.block_with_more_gas_and_tokens` AS
WITH
BLOCK_WITH_TOKENS AS (

SELECT          A.NAME AS NAME_TOKEN,
                B.GAS_USED AS GAS_USED,
                A.BLOCK_HASH AS BLOCK_HASH

FROM `bigquery-public-data.crypto_ethereum.tokens` A
LEFT JOIN `bigquery-public-data.crypto_ethereum.blocks` B ON A.block_hash = B.hash),

BLOCK_WITH_MORE_GAS AS (SELECT BLOCK_HASH, GAS_USED FROM BLOCK_WITH_TOKENS
ORDER BY 2 DESC LIMIT 1)

SELECT B.NAME_TOKEN,
       B.BLOCK_HASH,
       B.GAS_USED
FROM BLOCK_WITH_MORE_GAS A 
LEFT JOIN BLOCK_WITH_TOKENS B ON A.BLOCK_HASH = B.BLOCK_HASH