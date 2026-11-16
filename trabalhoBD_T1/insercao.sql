USE loja_cerrado;

INSERT INTO PRODUTO VALUES
(10, 'Teclado', 'Perifericos'),
(20, 'Mouse', 'Perifericos'),
(30, 'Cadeira', 'Moveis'),
(40, 'Monitor', 'Eletronicos'),
(50, 'Mesa', 'Moveis');

INSERT INTO SKU
(rid, codigo_sku, variacao, preco)
VALUES
(10, 'TEC001', 'Teclado ABNT2', 100.00),
(10, 'TEC002', 'Teclado Mecanico', 180.00),
(10, 'TEC003', 'Teclado Membrana', 70.00),
(10, 'TEC004', 'Teclado RGB', 220.00),
(10, 'TEC005', 'Teclado Sem Fio', 150.00),

(20, 'MOU001', 'Mouse Com Fio', 40.00),
(20, 'MOU002', 'Mouse Sem Fio', 65.00),
(20, 'MOU003', 'Mouse Gamer', 120.00),
(20, 'MOU004', 'Mouse Ergonomico', 90.00),
(20, 'MOU005', 'Mouse Bluetooth', 85.00),

(30, 'CAD001', 'Cadeira Escritorio', 350.00),
(30, 'CAD002', 'Cadeira Gamer', 750.00),
(30, 'CAD003', 'Cadeira Executiva', 500.00),
(30, 'CAD004', 'Cadeira Presidente', 600.00),
(30, 'CAD005', 'Cadeira Ergonomica', 900.00),

(40, 'MON001', 'Monitor 19 Polegadas', 450.00),
(40, 'MON002', 'Monitor 22 Polegadas', 600.00),
(40, 'MON003', 'Monitor 24 Polegadas', 850.00),
(40, 'MON004', 'Monitor 27 Polegadas', 1200.00),
(40, 'MON005', 'Monitor Ultrawide', 1600.00),

(50, 'MES001', 'Mesa Escritorio', 250.00),
(50, 'MES002', 'Mesa Gamer', 450.00),
(50, 'MES003', 'Mesa Madeira', 500.00),
(50, 'MES004', 'Mesa Compacta', 180.00),
(50, 'MES005', 'Mesa Em L', 650.00);

INSERT INTO ESTOQUE (sku_id, saldo)
SELECT sku_id, 10 FROM SKU;
