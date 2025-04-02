# povoando banco

```sql
use banco_atividade;

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

INSERT INTO Clientes (id_cliente, nome) VALUES 
(1, 'João Silva'),
(2, 'Maria Oliveira'),
(3, 'Carlos Santos'),
(4, 'Ana Souza'),
(5, 'Pedro Lima');

INSERT INTO Pedidos (id_pedido, id_cliente, data_pedido) VALUES 
(101, 1, '2024-03-20'),
(102, 2, '2024-03-21'),
(103, 3, '2024-03-22'),
(104, 4, '2024-03-23'),
(105, 5, '2024-03-24');
```
----------------
Q1: Listar clientes que fizeram pelo menos um pedido, mostrando nome e data do pedido.
----------------
![image](https://github.com/user-attachments/assets/842c3777-8c16-478a-9241-bddc05aacbe4)

```sql
# Q 1 -----------------------------------------------
-- Escreva uma consulta para listar todos os clientes que fizeram pelo menos um pedido, 
-- mostrando o nome do cliente e a data do pedido.

SELECT
	c.nome,
    p.data_pedido
from
	clientes c
    inner join pedidos p 
    ON c.id_cliente = p.id_cliente;
```
----------------
Q2: Encontrar todos os clientes, incluindo os que não fizeram pedidos, usando LEFT JOIN.
----------------
![image](https://github.com/user-attachments/assets/0278d2d5-6999-48e7-8317-2af6aaa095be)

```sql
# Q 2 ------------------------------------------------
-- - LEFT JOIN para Encontrar Clientes Sem Pedidos

INSERT INTO Clientes (id_cliente, nome) VALUES 
(6, 'luan Silva'),
(7,'teste');

SELECT
	c.nome,
    p.data_pedido
from
	clientes c
    left join pedidos p 
    ON c.id_cliente = p.id_cliente;
```
----------------
Q3: Contar o número de pedidos de cada cliente e ordenar pelo maior número de pedidos.
----------------
![image](https://github.com/user-attachments/assets/22399328-479f-4a0e-839b-7a4abcadd2c2)

```sql
# Q 3 ----------------------------------------------------

INSERT INTO Pedidos (id_pedido, id_cliente, data_pedido) VALUES 
(106, 5, '2024-08-20'),
(107, 2, '2024-08-20');

SELECT 
    c.nome, 									 -- Seleciona o nome do cliente
    COUNT(p.id_pedido) AS total_pedidos  		 -- Conta quantos pedidos o cliente fez
FROM 
    Clientes c  							   	 -- Usa a tabela Clientes como base
LEFT JOIN 
    Pedidos p								     -- Junta com a tabela Pedidos
ON 
    c.id_cliente = p.id_cliente  				 -- Relaciona as tabelas pelo id do cliente
GROUP BY 
    c.nome  									 -- Agrupa os resultados por cliente
ORDER BY 
    total_pedidos DESC; 						 -- Ordena do maior para o menor número de pedidos
```
----------------
Q4: Consultar transações de um cliente específico em um período e otimizar com índice.
----------------
![image](https://github.com/user-attachments/assets/ac88a080-ee0d-43e7-845a-c8395ff82919)

```sql
# Q 4 ----------------------------------------------------
/* 
Escreva uma consulta para listar todas as transações de um cliente específico em um determinado período.

Agora, crie um índice na coluna data_transacao para otimizar essa busca.
*/
DROP TABLE Transacoes;

CREATE TABLE Transacoes (
    id_transacao INT PRIMARY KEY,
    id_cliente INT,
    valor DECIMAL(10,2),
    data_transacao DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Transacoes (id_transacao, id_cliente, valor, data_transacao) VALUES 
(1, 1, 150.75, '2024-03-20'),  
(2, 2, 200.00, '2024-03-21'),  
(3, 3, 50.50, '2024-03-22'),  
(4, 4, 300.30, '2024-03-23'),  
(5, 5, 120.00, '2024-03-24');

SELECT * 
FROM Transacoes 
WHERE id_cliente = 5  									   -- Filtra pelo cliente específico (substitua pelo ID desejado)
AND data_transacao BETWEEN '2024-03-20' AND '2024-03-25';  -- Filtra pelo período desejado
```
----------------
Q5: Normalização de tabela (Separando cliente e produto em tabelas distintas).
----------------

```sql
# Q 5 ------------------------- NORMALIZAÇÃO ---------------------------
/* 
Quais os problemas dessa estrutura?
Reescreva essa tabela de forma normalizada, separando as entidades corretamente.
*/
# R: A tabela apresenta anomalias referentes a 1FN 2FN 3FN pois precisa separar o cliente da tabela do produto c
# criar outra tabela de pedidos e criar outra de relaçção 

CREATE TABLE Clientes5 (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(100)
);

INSERT INTO Clientes5 (id_cliente, nome_cliente) VALUES 
(1, 'João Silva'),
(2, 'Maria Oliveira'),
(3, 'Carlos Santos');

CREATE TABLE Produtos5 (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco DECIMAL(10,2)
);

INSERT INTO Produtos5 (id_produto, nome_produto, preco) VALUES 
(1, 'Notebook', 3000.00),
(2, 'Celular', 1500.00),
(3, 'Tablet', 1200.00);

CREATE TABLE Pedidos5 (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,  -- Referência ao cliente
    id_produto INT,  -- Referência ao produto
    FOREIGN KEY (id_cliente) REFERENCES Clientes5(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produtos5(id_produto)
);

INSERT INTO Pedidos5 (id_pedido, id_cliente, id_produto) VALUES 
(101, 1, 1),
(102, 2, 2),
(103, 3, 3);
```
----------------
Q6: Consultar produtos, categorias e estoque, mostrando nome da categoria, nome do produto e quantidade em estoque.
----------------
![image](https://github.com/user-attachments/assets/2e8fde29-3a77-4ba9-b62d-c9458fcca962)

```sql
# Q 6 ----------------------------------------

SELECT * FROM Categorias;

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(100)
);

INSERT INTO Categorias (id_categoria, nome) VALUES 
(1, 'Eletrônicos'),
(2, 'Móveis'),
(3, 'Roupas');

SELECT * FROM Produtos;

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

INSERT INTO Produtos (id_produto, nome, id_categoria) VALUES 
(1, 'Smartphone', 1),  -- Smartphone na categoria Eletrônicos
(2, 'Sofá', 2),        -- Sofá na categoria Móveis
(3, 'Camiseta', 3);    -- Camiseta na categoria Roupas

SELECT * FROM Estoque;

CREATE TABLE Estoque (
    id_produto INT,
    quantidade INT,
    PRIMARY KEY (id_produto),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

INSERT INTO Estoque (id_produto, quantidade) VALUES 
(1, 50),  -- 50 unidades de Smartphone
(2, 30),  -- 30 unidades de Sofá
(3, 100); -- 100 unidades de Camiseta

/* 
Escreva uma consulta para exibir:
-	O nome da categoria
-	O nome do produto
-	A quantidade em estoque
*/

SELECT
    c.nome AS nome_categoria,
    p.nome AS nome_produto,
    e.quantidade AS qnt_estoque
FROM
    Categorias c
JOIN
    Produtos p ON c.id_categoria = p.id_categoria
JOIN
    Estoque e ON p.id_produto = e.id_produto;
```
----------------
Q7: Listar funcionários que ganham mais que a média salarial da empresa, com subquery e JOIN opcional.
----------------
## com AVG 
![image](https://github.com/user-attachments/assets/897e8ea9-b11d-4659-b224-f830a2408ff6)
## COM JOIN 
![image](https://github.com/user-attachments/assets/897e8ea9-b11d-4659-b224-f830a2408ff6)

```sql
# Q 7 ----------------------------------------

CREATE TABLE Funcionarios (
 	   id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100),
    salario DECIMAL(10,2),
    id_departamento INT
);

INSERT INTO Funcionarios (id_funcionario, nome, salario, id_departamento) VALUES 
(1, 'João Silva', 3000.00, 1),
(2, 'Maria Oliveira', 4500.00, 2),
(3, 'Carlos Santos', 3800.00, 1),
(4, 'Ana Souza', 5000.00, 3),
(5, 'Pedro Lima', 3200.00, 2);

/*
Escreva uma consulta para listar os funcionários que ganham mais do que a média salarial geral da empresa, 
usando subquery.
Agora, reescreva a consulta usando JOIN com uma tabela auxiliar que contenha a média salarial.
 */
 
-- Lista os funcionários que ganham mais que a média salarial da empresa
SELECT 
    f.id_funcionario,
    f.nome,
    f.salario
FROM 
    Funcionarios f
WHERE 
    f.salario > (SELECT AVG(salario) FROM Funcionarios);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
/*    # opcional 
-- Criando a tabela auxiliar para a média salarial
CREATE TEMPORARY TABLE MediaSalarial AS
SELECT AVG(salario) AS media_salarial FROM Funcionarios;
*/
-- Consulta com JOIN
SELECT 
    f.id_funcionario,
    f.nome,
    f.salario
FROM 
    Funcionarios f
JOIN 
    MediaSalarial m ON f.salario > m.media_salarial;
```

----------------
Q8: USANDO WHERE E LIKE e CRIANDO idx
----------------
![image](https://github.com/user-attachments/assets/393a17a3-f051-4c78-9897-aeaa8fbcce10)
```sql
/* 
Escreva uma consulta para encontrar usuários cujo nome começa com "Ana".
Crie um índice apropriado para otimizar essa busca.
Explique em quais situações esse índice não será eficiente.
*/

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

INSERT INTO Usuarios (id_usuario, nome, email) VALUES 
(5, 'Ana Paula', 'ana.paula@email.com'),
(6, 'Ana Beatriz', 'ana.beatriz@email.com'),
(7, 'Ana Clara', 'ana.clara@email.com');

# Escreva uma consulta para encontrar usuários cujo nome começa com "Ana".
SELECT * FROM Usuarios WHERE nome LIKE 'Ana%';

CREATE INDEX idx_email_user on Usuarios(email);
/*
 O índice no email é útil para buscas exatas, mas perde eficiência em funções aplicadas na coluna, 
 LIKE com % no início, baixa variação de dados e tabelas com muitas alterações. 
*/
```
----------------
Q9: Atualizando e apagando dados de uma tab de maneira segura.
----------------
```sql
CREATE TABLE Pedidos9 (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Clientes (id_cliente, nome) VALUES
(101, 'João Silva'),
(102, 'Maria Oliveira'),
(103, 'Carlos Santos'),
(104, 'Ana Beatriz'),
(105, 'Pedro Almeida');

INSERT INTO Pedidos9 (id_pedido, id_cliente, data_pedido) VALUES 
(6, 101, '2024-03-01'),
(7, 102, '2024-03-05'),
(8, 103, '2024-03-10'),
(9, 104, '2024-03-15'),
(10, 105, '2024-03-20');

UPDATE Pedidos9  
SET data_pedido = '2024-04-01' # atualizando 
WHERE id_pedido = 6;

SELECT * FROM Pedidos9;

DELETE FROM Clientes WHERE id_cliente = 101;  # apagando

SELECT * FROM Pedidos9 WHERE id_cliente = 101;
```
----------------
Q10 : Calculando soma de vendas e calculand a media de vendas.
----------------
```sql
	CREATE TABLE Vendas (
	    id_venda INT PRIMARY KEY,
	    id_vendedor INT,
	    valor DECIMAL(10,2)
	);
	
	INSERT INTO Vendas (id_venda, id_vendedor, valor) VALUES 
	(1, 201, 1500.50),
	(2, 202, 2500.00),
	(3, 203, 3200.75),
	(4, 201, 1800.30),
	(5, 204, 2900.00);
	
	SELECT id_vendedor,
		SUM(valor) AS total_vendas
	FROM Vendas
	GROUP BY id_vendedor;
	
	SELECT 
	    id_vendedor, 
	    SUM(valor) AS total_vendas,
	    (SUM(valor) / (SELECT SUM(valor) FROM Vendas)) * 100 AS percentual_participacao
	FROM Vendas
	GROUP BY id_vendedor;
```

## imagem da media :
![image](https://github.com/user-attachments/assets/7192e44f-111e-4030-8766-bcf8c9f0ac65)

## Imagem da soma : 
![image](https://github.com/user-attachments/assets/1e4f170a-ab7e-48d3-848c-03d84279afec)


