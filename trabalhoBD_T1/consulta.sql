USE loja_cerrado;

--mostrar produtos e suas variacoes
SELECT
    p.descricao,
    s.codigo_sku,
    s.variacao,
    s.preco
FROM PRODUTO p
INNER JOIN SKU s
ON p.rid = s.rid;

--consultar estoque
SELECT
    s.codigo_sku,
    s.variacao,
    e.saldo
FROM SKU s
INNER JOIN ESTOQUE e
ON s.sku_id = e.sku_id;

-- produto nao foram vendidos
SELECT s.codigo_sku, s.variacao
FROM SKU s
LEFT JOIN ITEM i
ON s.sku_id = i.sku_id
WHERE i.sku_id IS NULL;

--calcular  valor pedido
SELECT
    pid,
    SUM(qtd * preco) AS total
FROM ITEM
GROUP BY pid;
