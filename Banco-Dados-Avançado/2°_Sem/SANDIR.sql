USE TAREFA_SAIDEIRA_SANDIR_LOUCO_21e99;

-- Tabelas
SELECT * FROM itens_pedidos;

DROP TABLE IF EXISTS itens_pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(90)
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(99),
    valor_produto DECIMAL(10,2)
);

CREATE TABLE itens_pedidos (
    id_item_pedido INT PRIMARY KEY,
    id_pedido INT,
    id_cliente INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Dados
INSERT INTO clientes (id_cliente, nome) VALUES
(1, 'Carlos Oliveira'),
(2, 'Mariana Silva'),
(3, 'João Pedro'),
(4, 'Ana Clara'),
(5, 'Fernando Souza'),
(6, 'Lucas Ramos'),         -- Este e os dois abaixo não compraram nada
(7, 'Patrícia Mendes'),
(8, 'Eduardo Lima');

INSERT INTO produtos (id_produto, nome_produto, valor_produto) VALUES
(1, 'Honda CG 160 Fan', 13250.00),
(2, 'Yamaha Fazer 250', 18990.00),
(3, 'Honda CB 500X', 38990.00),
(4, 'Kawasaki Z400', 28990.00),
(5, 'Royal Enfield Meteor 350', 21990.00);

INSERT INTO itens_pedidos (id_item_pedido, id_pedido, id_cliente, id_produto, quantidade) VALUES
(1, 1001, 1, 2, 2),  -- Carlos comprou 2 Yamaha Fazer
(2, 1002, 2, 1, 3),  -- Mariana comprou 3 Honda CG 160
(3, 1003, 3, 5, 1),  -- João comprou 1 Royal Enfield
(4, 1004, 4, 4, 1),  -- Ana comprou 1 Kawasaki Z400
(5, 1005, 5, 3, 2),  -- Fernando comprou 2 Honda CB 500X
(6, 1002, 2, 5, 2),  -- Mariana comprou 2 Royal Enfield Meteor 350 no mesmo pedido
(7, 1002, 2, 4, 1),  -- Mariana comprou 1 Kawasaki Z400 no mesmo pedido (total 3 produtos diferentes)
(8, 1006, 6, 1, 2),  -- Lucas comprou 2 Honda CG 160
(9, 1007, 7, 3, 1),  -- Patrícia comprou 1 Honda CB 500X
(10, 1008, 8, 2, 3), -- Eduardo comprou 3 Yamaha Fazer
(11, 1009, 5, 4, 1), -- Fernando comprou 1 Kawasaki Z400
(12, 1010, 5, 2, 1), -- Fernando comprou 1 Yamaha Fazer
(13, 1011, 3, 4, 2); -- João comprou 2 Kawasaki Z400

-- Consulta: Clientes que compraram pelo menos 3 produtos diferentes em um mesmo pedido
SELECT *
FROM clientes c
WHERE EXISTS (
    SELECT 1
    FROM itens_pedidos i
    WHERE i.id_cliente = c.id_cliente
    GROUP BY i.id_pedido
    HAVING COUNT(DISTINCT i.id_produto) >= 3
);
