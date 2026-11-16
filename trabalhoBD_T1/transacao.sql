USE loja_cerrado;



START TRANSACTION;

UPDATE ESTOQUE
SET saldo = saldo - 2
WHERE sku_id = 1
AND saldo >= 2;

SELECT ROW_COUNT();

