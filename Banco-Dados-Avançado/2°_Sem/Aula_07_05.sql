use aula_07_05_luanC;

DROP TABLE clientes;

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255)
);



DROP TABLE pedidos;

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    valor DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);


DROP TABLE produtos;

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    preco DECIMAL(10, 2)
);



DROP TABLE itens_pedidos;

CREATE TABLE itens_pedidos (
    id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);


INSERT INTO clientes (id, nome, email) VALUES
    (1, 'João Silva', 'joao.silva@example.com'),
    (2, 'Maria Oliveira', 'maria.oliveira@example.com'),
    (3, 'Pedro Santos', 'pedro.santos@example.com');

INSERT INTO pedidos (id, cliente_id, data_pedido, valor) VALUES
    (1, 1, '2023-01-10', 350.00),
    (2, 1, '2023-03-05', 720.00),
    (3, 2, '2023-04-18', 120.00),
    (4, 3, '2023-06-02', 999.99);

INSERT INTO produtos (id, nome, preco) VALUES
    (1, 'Mouse Gamer Logitech G203', 120.00),
    (2, 'Teclado Mecânico Redragon Kumara', 250.00),
    (3, 'Monitor LG 24"', 900.00),
    (4, 'SSD Kingston 480GB', 280.00),
    (5, 'Memória RAM DDR4 8GB', 180.00),
    (6, 'Processador Ryzen 5 5600G', 950.00),
    (7, 'Placa de Vídeo GTX 1660 Super', 1500.00),
    (8, 'Fonte Corsair 650W', 450.00);

INSERT INTO itens_pedidos (id, pedido_id, produto_id, quantidade) VALUES
    (1, 1, 1, 1),
    (2, 1, 2, 1),
    (3, 2, 3, 1),
    (4, 2, 5, 2),
    (5, 3, 4, 1),
    (6, 4, 6, 1),
    (7, 4, 7, 1);

SELECT *
FROM produtos
WHERE preco > (
    SELECT AVG(preco)
    FROM produtos
);

-- --------------------------------------------------------

	CREATE TABLE cliente2 (
		id INT PRIMARY KEY,
		nome VARCHAR(100),
		cidade VARCHAR(100)
	);	

	CREATE TABLE pedido2 (
		id INT PRIMARY KEY,
		cliente_id INT,
		produto VARCHAR(100),
		valor DECIMAL(10,2),
		FOREIGN KEY (cliente_id) REFERENCES cliente2(id)
	);

	INSERT INTO cliente2 (id, nome, cidade) VALUES
		(1, 'Lucas Lima', 'Goiânia'),
		(2, 'Ana Paula', 'São Paulo'),
		(3, 'Carlos Souza', 'Belo Horizonte'),
		(4, 'Fernanda Castro', 'Goiânia'),
		(5, 'Bruno Silva', 'Rio de Janeiro');

	INSERT INTO pedido2 (id, cliente_id, produto, valor) VALUES
		(1, 1, 'Notebook Dell', 4500.00),
		(2, 2, 'Mouse Gamer', 150.00),
		(3, 2, 'Teclado Mecânico', 320.00),
		(4, 3, 'Monitor LG 24"', 980.00),
		(5, 5, 'HD Externo 1TB', 350.00);
	
-- com ON
SELECT nome 
FROM cliente2
WHERE id IN (SELECT id FROM pedido2);

-- com NOT IN
SELECT nome 
FROM cliente2
WHERE id NOT IN (SELECT cliente_id FROM pedido2);

