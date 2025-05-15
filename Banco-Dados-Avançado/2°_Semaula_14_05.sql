USE aula_sandir_14_05;

DROP TABLE IF EXISTS item_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE item_pedido (
    id_item_pedido INT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO clientes (id_cliente, nome, estado) VALUES
(1, 'João Silva', 'SP'),
(2, 'Maria Oliveira', 'RJ'),
(3, 'Carlos Santos', 'MG'),
(4, 'Ana Paula', 'BA'),
(5, 'Ricardo Lima', 'SP');

INSERT INTO produtos (id_produto, nome, preco) VALUES
(1, 'Processador AMD Ryzen 5 5600X', 1199.90),
(2, 'Placa de Vídeo NVIDIA RTX 3060', 2399.00),
(3, 'SSD Kingston 1TB NVMe', 499.99),
(4, 'Placa-mãe ASUS B550M', 849.50),
(5, 'Memória RAM Corsair 16GB DDR4', 399.90);

INSERT INTO pedidos (id_pedido, id_cliente, data_pedido) VALUES
(1, 1, '2025-05-01'),
(2, 2, '2025-05-03'),
(3, 1, '2025-05-05'),
(4, 3, '2025-05-07'),
(5, 4, '2025-05-08');

INSERT INTO item_pedido (id_item_pedido, id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 1, 1199.90),
(2, 1, 2, 1, 2399.00),
(3, 1, 3, 1, 499.99),

(4, 2, 2, 1, 2399.00),
(5, 2, 4, 1, 849.50),

(6, 3, 1, 1, 1199.90),

(7, 4, 3, 1, 499.99),
(8, 4, 4, 1, 849.50),
(9, 4, 5, 2, 399.90),

(10, 5, 1, 1, 1199.90),
(11, 5, 5, 2, 399.90);


-- 1 ---------------------------------------------

SELECT nome 
FROM clientes c
WHERE EXISTS (
    SELECT 1
    FROM pedidos p
    JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
    WHERE p.id_cliente = c.id_cliente
    GROUP BY ip.id_pedido
    HAVING COUNT(DISTINCT ip.id_produto) >= 3
);

-- ---------------------------------------------


-- comando de sandir
SELECT nome FROM CLIENTES C
	WHERE id_cliente IN(
	SELECT ID_CLIENTE
	FROM PEDIDOS P
	GROUP BY ID_CLIENTE
	HAVING SUM (VALOR_TOTAL) >(
		SELECT SUM(VALOR_TOTAL)
		FROM PEDIDO P
		JOIN CLIENTES C ON P.ID_CLIENTE = C.ID_CLIENTE
		WHERE C.CIDADE="SP"
	)
);

-- comando do chat gpt 
SELECT nome 
FROM clientes c
WHERE c.estado = 'SP' -- Garantir que estamos apenas considerando clientes de SP
AND c.id_cliente IN (
    SELECT p.id_cliente
    FROM pedidos p
    JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
    GROUP BY p.id_cliente
    HAVING SUM(ip.quantidade * ip.preco_unitario) > (
        SELECT SUM(ip2.quantidade * ip2.preco_unitario)
        FROM pedidos p2
        JOIN item_pedido ip2 ON p2.id_pedido = ip2.id_pedido
        JOIN clientes c2 ON p2.id_cliente = c2.id_cliente
        WHERE c2.estado = 'SP'
        GROUP BY p2.id_cliente
    )
);

-- 2 ---------------------------------------
-- meses com vendas totais > 10.000
-- chat gpt
ALTER TABLE pedidos ADD COLUMN valor_total DECIMAL(10, 2);

INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, valor_total)
VALUES
(6, 2, '2025-05-10', 5200.00),
(7, 3, '2025-05-12', 10500.00);

SELECT p.id_pedido, c.nome, p.valor_total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE p.data_pedido BETWEEN '2025-05-01' AND '2025-05-31'
AND p.valor_total > 10000;

-- ------------------------------------------------------
-- COMANDO SANDIR

SELECT MES,TOTAL_MES
FROM
	(SELECT DATE_FORMAT (DATA_PEDIDO ,'$Y-$M') AS MES,
    SUM(VALOR_TOTAL) AS TOTAL_MES
    FROM PEDIDOS
    GROUP BY DATE_FORMAT (DATA_PEDIDO ,'$Y-$M')
    ) AS SUBCONSULTA
    WHERE TOTAL_MES>10000;

-- 3 ------------------------------------------
-- ATUALIZA PEÇOS ABAIXO DA MEDIA COM AUMENTO DE 5%

SELECT AVG(preco) AS media_preco FROM produtos; -- CONSULTAR A MEDIA DOS PRODUTOS.

-- AUMENTAR EM 5% A MEDIA DOS PRODUTOS 
UPDATE produtos
SET preco = preco * 1.05
WHERE preco < (SELECT AVG(preco) FROM produtos);


