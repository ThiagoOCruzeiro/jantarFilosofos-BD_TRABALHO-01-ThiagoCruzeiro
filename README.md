Trabalho 1 – Remodelagem do Banco de Dados da Loja Cerrado
1. Objetivo e Escopo
Remodelar o banco de dados da Loja Cerrado para otimizar o controle de clientes, pedidos, produtos e estoques. A principal melhoria é a inclusão da tabela SKU, permitindo gerenciar diferentes variações e preços de um mesmo produto de forma individualizada e sem redundância.

2. Estrutura e Relacionamentos
O banco foi estruturado em seis tabelas interligadas:

CLIENTE: Armazena nome e cidade (1:N com PEDIDO).

PEDIDO: Registra o status e o cliente comprador (1:N com ITEM).

PRODUTO: Cadastra os itens principais e categorias (1:N com SKU).

SKU: Identifica cada variação específica, código e preço (1:1 com ESTOQUE e 1:N com ITEM).

ESTOQUE: Controla o saldo disponível por SKU (com trava CHECK para evitar saldo negativo).

ITEM: Associa os SKUs vendidos aos pedidos, registrando quantidade e preço praticado.


3. Implementação (DDL)

4. Carga de Dados (DML)

5. Consultas Principais

6. Transações, ACID e Segurança
Controle de Vendas: Uso de transações (START TRANSACTION, COMMIT e ROLLBACK) para garantir que a baixa no estoque e o registro do pedido ocorram em conjunto, evitando vendas sem baixa ou baixas indevidas.

Propriedades ACID: Aplicação de Atomicidade (operação completa ou desfeita), Consistência (regras e saldos válidos), Isolamento (controle de compras simultâneas) e Durabilidade (persistência após falhas).

Segurança e Manutenção: Controle de acesso por usuários/senhas, criação de índices para performance e realização periódica de backups com testes de restauração.

7. Conclusão
A remodelagem com a tabela SKU, aliada ao controle transacional e às regras de integridade, elimina inconsistências de cadastro e garante precisão na gestão de vendas e estoques da Loja Cerrado.
