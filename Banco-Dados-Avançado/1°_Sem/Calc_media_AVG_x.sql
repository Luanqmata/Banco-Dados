use loucuras;

CREATE TABLE Vendas (
    id INT PRIMARY KEY,
    id_vendedor INT,
    valor DECIMAL(10, 2)
);

INSERT INTO Vendas (id, id_vendedor, valor) VALUES (1, 101, 1500.00);
INSERT INTO Vendas (id, id_vendedor, valor) VALUES (2, 102, 2500.00);
INSERT INTO Vendas (id, id_vendedor, valor) VALUES (3, 101, 1000.00);
INSERT INTO Vendas (id, id_vendedor, valor) VALUES (4, 103, 2000.00);
INSERT INTO Vendas (id, id_vendedor, valor) VALUES (5, 102, 1500.00);
INSERT INTO Vendas (id, id_vendedor, valor) VALUES (6, 104, 3000.00);
INSERT INTO Vendas (id, id_vendedor, valor) VALUES (7, 101, 500.00);

SELECT 
    id_vendedor, 
    SUM(valor) AS total_vendas,
    (SUM(valor) / (SELECT SUM(valor) FROM Vendas)) * 100 AS percentual_participacao
FROM Vendas
GROUP BY id_vendedor;


SELECT
	id_vendedor,
    SUM(valor) AS vendas
FROM
	vendas
WHERE
	valor > (SELECT AVG(valor) FROM Vendas)
GROUP BY
	id_vendedor;
    
    
# ----------------------------------


CREATE TABLE lista_numeros(
	numeros INT
);

INSERT INTO lista_numeros(numeros)
VALUES
(1),
(2),
(3),
(4),
(5),
(6);

SELECT 
	AVG(numeros) AS media 
FROM lista_numeros;

# ---------------------------------------------
-- ##########################################
-- # EXEMPLO 1: MÉDIA DE NOTAS DE ALUNOS
-- ##########################################

CREATE TABLE notas (
    aluno VARCHAR(50),
    nota INT
);

INSERT INTO notas (aluno, nota) VALUES
('Ana', 8),
('Bruno', 7),
('Carlos', 6),
('Ana', 9),
('Bruno', 8),
('Carlos', 7);

-- 1. Média geral de todas as notas
SELECT AVG(nota) AS media_geral FROM notas;

-- 2. Média de nota por aluno
SELECT aluno, AVG(nota) AS media_aluno
FROM notas
GROUP BY aluno;

-- 3. Alunos com nota acima da média (sem usar AVG)
SELECT nota
FROM notas
WHERE nota > (
    SELECT SUM(nota)*1.0 / COUNT(*) FROM notas
);

-- ------------------------------------------
-- ##########################################
-- # EXEMPLO 2: SOMA DE VENDAS POR VENDEDOR
-- ##########################################

CREATE TABLE vendas2 (
    vendedor VARCHAR(50),
    valor DECIMAL(10,2)
);

INSERT INTO vendas2 (vendedor, valor) VALUES
('João', 1000),
('Maria', 2000),
('João', 1500),
('Maria', 2500),
('Lucas', 3000);

-- 1. Soma total de todas as vendas
SELECT SUM(valor) AS total_vendido FROM vendas2;

-- 2. Soma de vendas por vendedor
SELECT vendedor, SUM(valor) AS total_por_vendedor
FROM vendas2
GROUP BY vendedor;

-- ------------------------------------------
-- ##########################################
-- # EXEMPLO 3: CONTAGEM, MÁXIMO E MÍNIMO
-- ##########################################

-- 1. Quantidade total de registros na tabela de vendas
SELECT COUNT(*) AS total_linhas FROM vendas;

-- 2. Quantidade de vendas por vendedor
SELECT vendedor, COUNT(*) AS total_vendas
FROM vendas
GROUP BY vendedor;

-- 3. Maior e menor valor de venda
SELECT MAX(valor) AS maior_venda, MIN(valor) AS menor_venda FROM vendas;

-- ------------------------------------------

    
