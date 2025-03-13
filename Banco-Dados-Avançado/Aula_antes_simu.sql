CREATE DATABASE meu_novo_banco;
SHOW DATABASES;
USE meu_novo_banco;

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(255)
);

SELECT * FROM clientes;

-- Criação da tabela pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    valor DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

SELECT * FROM pedidos;

INSERT INTO clientes(id,nome)
VALUES (1,'joão'),
(2,'maria'),
(3, 'Pedro');

INSERT INTO pedidos(id,cliente_id,valor)
VALUES (1,1,100.00),
(2,1,200.00),
(3,2,50.00);

SELECT clientes.nome, pedidos.valor
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;

-------------------------------------- exercicio 2 ---------------------------
CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE departamentos (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    funcionario_id INT,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);

INSERT INTO funcionarios (id, nome) 
VALUES 
    (1, 'João'), 
    (2, 'Maria'), 
    (3, 'Pedro');

INSERT INTO departamentos (id, nome, funcionario_id) 
VALUES 
    (1, 'Vendas', 1), 
    (2, 'Marketing', 2);

SELECT f.nome AS nome_funcionario, d.nome AS nome_departamento
FROM funcionarios f
LEFT JOIN departamentos d ON f.id = d.funcionario_id;

------------------------ ExERCICIO 3 ----------------------
CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE categorias (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    produto_id INT,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO produtos (id, nome) 
VALUES 
    (1, 'produto 1'), 
    (2, 'produto 2'), 
    (3, 'produto 3');

INSERT INTO categorias (id, nome, produto_id) 
VALUES 
    (1, 'categoria 1', 1), 
    (2, 'categoria 2', 2);
    
SELECT p.nome AS nome_produto, c.nome AS nome_categoria
FROM produtos p
RIGHT JOIN categorias c
ON p.id = c.produto_id;

------------------------ EXERCICIO 4 -----------------------------

SELECT c.nome AS nome_cliente, p.valor AS valor_pedido FROM clientes c 
LEFT JOIN pedidos p ON c.id = p.cliente_id 
UNION 
SELECT c.nome AS nome_cliente, p.valor AS valor_pedido FROM clientes c 
RIGHT JOIN pedidos p ON c.id = p.cliente_id;
SELECT c.nome AS nome_cliente, p.valor AS valor_pedido FROM clientes c 
LEFT JOIN pedidos p ON c.id = p.cliente_id 
UNION 
SELECT c.nome AS nome_cliente, p.valor AS valor_pedido FROM clientes c 
RIGHT JOIN pedidos p ON c.id = p.cliente_id;

----------------------- exercicio 5 ---------------------------

# CREATE TABLE categorias ( id INT PRIMARY KEY , nome VARCHAR(255));

INSERT INTO categorias (id, nome) 
VALUES 
	 (3, 'categoria 3');
     
SELECT p.nome AS nome_produto, c.nome AS nome_categoria
FROM produtos p
CROSS JOIN categorias c;

------------------------------- exercicio 6 ------------------------ FALTA TERMINAR 

CREATE TABLE clientes (id INT PRIMARY KEY,nome VARCHAR(255));
CREATE TABLE pedidos ( id INT PRIMARY KEY,cliente_id INT, valor DECIMAL(10,2));


------------------------ EX 7 ---------------------- FALTA TERMINAR 
select c.nome as cliente,
p.data_pedido,pr.nome as produto,ip.quantidade,ip.quantidade*pr.preco as preco_total
from clientes c
join pedidos p on c.id=p.cliente_id
group by c.nome
order by total_comprar;

--------------------------- EX 1 PARTE 2  -------------------

CREATE TABLE clientes_index (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255)
);


INSERT INTO clientes_index (id, nome, email) 
VALUES 
    (1, 'João', 'joao@example.com'),
    (2, 'Maria', 'maria@example.com'),
    (3, 'Pedro', 'pedro@example.com');
    
CREATE INDEX idx_email ON clientes_index(email);

SELECT * FROM clientes_index;

--------------------- ex 2 ------------------

CREATE TABLE pedidos_index (
    id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    valor DECIMAL(10, 2)
);

INSERT INTO pedidos_index (id, cliente_id, data_pedido, valor)
VALUES 
    (1, 1, '2022-01-01', 200.00),
    (2, 2, '2022-02-15', 350.50),
    (3, 3, '2022-03-20', 500.75);


CREATE INDEX idx_cliente_data_pedido ON pedidos_index(cliente_id, data_pedido);
