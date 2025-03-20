# Criando banco e populando:
---------
```sql 
USE banco_simulado;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Clientes(id_cliente,nome) VALUES
(1,'luan'),
(2,'sandir'),
(3,'pablo'),
(4,'teste'),
(5,'romes');

INSERT INTO Pedidos (id_pedido, id_cliente, data_pedido)
VALUES
(1, 1, '2025-12-01'),
(2, 2, '2025-13-02'),
(3, 3, '2025-03-03'),
(4, 4, '2025-03-15'),
(5, 5, '2025-03-17');
```
---------
# Q1:
---------
```sql 
# questao 1
# ------------------------------------------------------------
SELECT p.id_pedido AS registro_pedido,
  p.data_pedido AS DATA_PEDIDO,
       c.nome AS NOME_CLIENTE
FROM Pedidos p
INNER JOIN Clientes c
ON p.id_cliente = c.id_cliente;

```
---------
# Q2:
---------
```sql 
# ------------------------------------------------------------
# questao 2
INSERT INTO Clientes(id_cliente,nome) VALUES
(6,'teste_do_teste'),
(7,'julia da silva');

SELECT c.id_cliente AS id_cliente,
  c.nome AS nome_cliente,
       p.data_pedido AS data_pedido
FROM Clientes c
LEFT JOIN Pedidos p
    ON c.id_cliente = p.id_cliente;

```
---------
# Q3:
---------
```sql 
# ------------------------------------------------------------
# questao 3

SELECT c.id_cliente AS id_cliente,
       c.nome AS nome_cliente,
       p.data_pedido AS data_pedido
FROM Clientes c
RIGHT JOIN Pedidos p
    ON c.id_cliente = p.id_cliente;

```
---------
# Q4:
---------
```sql 
# ------------------------------------------------------------
# questao 4

SELECT c.id_cliente,
       c.nome AS nome_cliente,
       p.data_pedido AS data_pedido
FROM Clientes c
LEFT JOIN Pedidos p
    ON c.id_cliente = p.id_cliente
UNION
SELECT c.id_cliente,
       c.nome AS nome_cliente,
       p.data_pedido AS data_pedido
FROM Pedidos p
RIGHT JOIN Clientes c
    ON c.id_cliente = p.id_cliente;

```
---------
# Q5:
---------
```sql 
# ------------------------------------------------------------
# questao 5

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);

INSERT INTO Produtos (id_produto, nome, preco) VALUES
(1, 'Camiseta', 30.00),
(2, 'Calça', 80.00),
(3, 'Tênis', 150.50),
(4, 'Jaqueta', 199.90),
(5, 'Relógio', 300.50);

SELECT
  c.id_cliente AS registro_client,
  c.nome AS nome_cliente,
  p.id_produto AS registro_produt,
  p.nome AS nome_produto
FROM Clientes c
CROSS JOIN Produtos p;
```
---------
# Q6:
---------
```sql 
# ------------------------------------------------------------
# questao 6

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100)
);
INSERT INTO Usuarios (id_usuario, nome, email, senha) VALUES
(1, 'PAULO ', 'PAULO.JUNIOR@email.com', 'PASSWORD'),
(2, 'LUIS ', 'LUIS.OLIVEIRA@email.com', 'pass'),
(3, 'LUAN ', 'LUAN.SOUSA@email.com', 'ADMIN'),
(4, 'SANDIR ', 'SANDIR.CAMPOS@email.com', 'adminnimad'),
(5, 'ROMES ', 'ROMES.preguica@email.com', '987654321');

CREATE INDEX index_emails ON Usuarios(email); # ---- CRIANDO INDEX NORMAL
CREATE UNIQUE INDEX index_emails_unicos ON Usuarios(email); # ------- CRIANDO INDEX UNICOS
CREATE INDEX index_composto_email_nome ON Usuarios(nome,email);

```
---------
# Q8:
---------
```sql 
# ------------------------------------------------------------
# questao 8

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(80),
    email_cliente VARCHAR(100)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    produto VARCHAR(100),
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
```
---------
# Q10:
---------
```sql 
# ------------------------------------------------------------
# questao 9

# ------------------------------------------------------------
# questao 10
USE questao_10_formatada;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100)
);

INSERT INTO Clientes (id_cliente, nome) VALUES
(1, 'luan '),
(2, 'sandir '),
(3, 'teste '),
(4, 'halbert '),
(5, 'Veronica');

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Pedidos (id_pedido, id_cliente, data_pedido) VALUES
(1, 1, '2019-12-05'),
(2, 2, '2013-06-02'),
(3, 3, '2024-08-05'),
(4, 4, '2017-03-04'),
(5, 5, '2018-03-03');


CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco DECIMAL(10, 2)
);

INSERT INTO Produtos (id_produto, nome_produto, preco) VALUES
(1, 'mouse', 15.99),
(2, 'mouse pad', 29.50),
(3, 'antena bluetoht', 10.00),
(4, 'suporte 3D', 7.50),
(5, 'teclado mecanico', 90.00);

CREATE TABLE ItensPedido (
    id_item INT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

INSERT INTO ItensPedido (id_item, id_pedido, id_produto, quantidade) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 5),  
(5, 4, 5, 4);

SELECT
    p.id_pedido AS registro_pedido,
    c.nome AS nome_cliente,
    i.id_produto AS registro_produto,
    pr.nome_produto AS item_comprado,
    i.quantidade AS qnt_itens_pedido
FROM
    Pedidos p
NATURAL JOIN
    Clientes c
NATURAL JOIN
    ItensPedido i
NATURAL JOIN
    Produtos pr;
```
