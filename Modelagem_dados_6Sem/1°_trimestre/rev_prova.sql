CREATE TABLE IF NOT EXISTS cliente (
  idcliente INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  telefone VARCHAR(20) NULL,
  PRIMARY KEY (idcliente)
);

--------------------------------

CREATE TABLE IF NOT EXISTS pedido (
  idpedido INT NOT NULL AUTO_INCREMENT,  -- Identificador único do pedido
  id_cliente INT NULL,                   -- Chave estrangeira para cliente
  data_pedido DATETIME NULL,             -- Data do pedido
  valor_total DECIMAL(10,2) NULL,        -- Valor total do pedido
  PRIMARY KEY (idpedido),                -- Define a chave primária

  INDEX pedido_clienteFK_idx (id_cliente ASC) VISIBLE, -- Cria índice para melhorar busca

  CONSTRAINT pedido_clienteFK             -- Define restrição de chave estrangeira
    FOREIGN KEY (id_cliente)
    REFERENCES cliente (idcliente)       -- Relaciona com tabela cliente
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

--------------------------------


CREATE TABLE IF NOT EXISTS prato (
  idprato INT NOT NULL AUTO_INCREMENT,   -- Identificador único do prato
  nome_prato VARCHAR(45) NULL,           -- Nome do prato
  preco DECIMAL(10,2) NULL,              -- Preço do prato
  PRIMARY KEY (idprato)
);

--------------------------------

CREATE TABLE IF NOT EXISTS pedido_prato (
  idpedido_prato INT NOT NULL AUTO_INCREMENT, -- Identificador da relação
  id_pedido INT NULL,                         -- FK para pedido
  id_prato INT NULL,                          -- FK para prato
  quantidade INT NULL,                        -- Quantidade do prato no pedido
  PRIMARY KEY (idpedido_prato),

  INDEX pedidoFK_idx (id_pedido ASC) VISIBLE,
  INDEX pratoFK_idx (id_prato ASC) VISIBLE,

  CONSTRAINT pedidoFK
    FOREIGN KEY (id_pedido)
    REFERENCES pedido (idpedido),
  CONSTRAINT pratoFK
    FOREIGN KEY (id_prato)
    REFERENCES prato (idprato)
);

---------------------------------

CREATE TABLE IF NOT EXISTS ingrediente (
  idingrediente INT NOT NULL AUTO_INCREMENT, -- Identificador do ingrediente
  nome_ingrediente VARCHAR(45) NULL,         -- Nome do ingrediente
  PRIMARY KEY (idingrediente)
);


---------------------------------


CREATE TABLE IF NOT EXISTS prato_ingrediente (
  idprato_ingrediente INT NOT NULL AUTO_INCREMENT,
  id_prato INT NULL,                          -- FK para prato
  id_ingrediente INT NULL,                    -- FK para ingrediente
  PRIMARY KEY (idprato_ingrediente),

  INDEX pratoFK_idx (id_prato ASC) VISIBLE,
  INDEX ingredienteFK_idx (id_ingrediente ASC) VISIBLE,

  CONSTRAINT prato_FK
    FOREIGN KEY (id_prato) REFERENCES prato (idprato),
  CONSTRAINT ingredienteFK
    FOREIGN KEY (id_ingrediente) REFERENCES ingrediente (idingrediente)
);


--===================================================
SET SQL_SAFE_UPDATES = 1;

-- --------------------------
    -- Inserir Clientes
INSERT INTO CLIENTE (nome, email, telefone) VALUES
('João Silva', 'joao.silva@email.com', '(11) 98765-4321'),
('Maria Santos', 'maria.santos@email.com', '(21) 91234-5678'),
('Pedro Oliveira', 'pedro.oliveira@email.com', '(31) 99999-8888');

-- Inserir Pratos
INSERT INTO PRATO (nome_prato, preco) VALUES
('Moqueca de Peixe', 75.50),
('Feijoada Completa', 65.00),
('Picanha na Chapa', 95.00),
('Salmão Grelhado', 85.00),
('Risoto de Camarão', 70.00);

-- Inserir Ingredientes
INSERT INTO INGREDIENTE (nome_ingrediente) VALUES
('Peixe Branco'), ('Azeite de Dendê'), ('Leite de Coco'), ('Feijão Preto'), ('Carne Seca'),
('Linguiça'), ('Picanha'), ('Salmão'), ('Arroz Arbóreo'), ('Camarão'),
('Massa de Lasanha'), ('Molho de Tomate'), ('Queijo Mussarela'), ('Frango'), ('Bife'),
('Ovo'), ('Mandioca'), ('Pato'), ('Bacalhau'), ('Polvo');

-- Inserir Pedidos (valor_total será atualizado depois)
INSERT INTO PEDIDO (id_cliente) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20);

-- Inserir Itens nos Pedidos
INSERT INTO PEDIDO_PRATO (id_pedido, id_prato, quantidade) VALUES
(1, 1, 1), (1, 5, 1), 
(2, 2, 2), 
(3, 3, 1), 
(4, 6, 1), (4, 7, 1), 
(5, 18, 2), (5, 17, 1);

-- Inserir Relação Prato-Ingrediente
INSERT INTO PRATO_INGREDIENTE (id_prato, id_ingrediente) VALUES
(1, 1), (1, 2), (1, 3), -- Moqueca
(2, 4), (2, 5), (2, 6), -- Feijoada
(3, 7), -- Picanha
(4, 8), -- Salmão
(5, 9), (5, 10), -- Risoto de Camarão
(6, 11), (6, 12), (6, 13), -- Lasanha
(7, 12), (7, 13), (7, 14), -- Frango a Parmegiana
(8, 15), (8, 16), -- Bife a Cavalo
(9, 5), (9, 17), -- Escondidinho
(10, 3), (10, 10), (10, 17), -- Bobó de Camarão
(11, 14), -- Galinha Cabidela (simplificado)
(12, 18), -- Arroz de Pato
(13, 19), -- Bacalhau
(14, 20), -- Polvo
(15, 1), (15, 10), (15, 20), -- Paella
(16, 7), (16, 14), (16, 6), -- Churrasco Misto
(17, 12), (17, 13), -- Pizza
(18, 15), -- Hamburguer
(19, 1), (19, 8), -- Sushi
(20, 5), (20, 15); -- Yakisoba

----- --------------------------------


UPDATE pedido p
SET valor_total = (
SELECT SUM(pr.preco * pp.quantidade) 
FROM 
  pedido_prato pp
JOIN 
  prato pr ON pp.id_prato = pr.idprato

WHERE 
  pp.id_pedido = p.idpedido
);
-- --------------------------------
-- Valor Total pedidos
SELECT 
  p.idpedido
,   c.nome AS Nome_Cliente
, p.data_pedido
, p.valor_total 
FROM 
  pedido p
JOIN 
  cliente c ON p.id_cliente = c.idcliente
ORDER BY 
  p.idpedido DESC;

-- --------------------------------
-- Valor Total pedidos 
SELECT 
  p.idpedido
,   c.nome AS Nome_Cliente
, p.data_pedido
, (SELECT SUM(pr.preco * pp.quantidade) 
FROM 
  pedido_prato pp
JOIN 
  prato pr ON pp.id_prato = pr.idprato

WHERE 
  pp.id_pedido = p.idpedido ) AS Valor_total
FROM 
  pedido p
JOIN 
  cliente c ON p.id_cliente = c.idcliente
ORDER BY 
  p.idpedido;
    
-- ------------------------------------------------
-- Identificação dos pratos mais pedidos
SELECT 
  pr.nome_prato
, COUNT(pp.id_prato) AS Total_pedidos
FROM 
  pedido_prato pp
JOIN
  prato pr ON pr.idprato = pp.id_prato
GROUP BY 
  pr.nome_prato
ORDER BY
  total_pedidos DESC;

-- ------------------------------------------
-- Pedido com detalhes dos clientes e pratos
SELECT 
    c.nome AS cliente,
    p.data_pedido,
    pr.nome_prato,
    pp.quantidade,
    pr.preco AS preco_individual,
    (pp.quantidade * pr.preco) AS subtotal
FROM pedido p
JOIN cliente c ON p.id_cliente = c.idcliente
JOIN pedido_prato pp ON p.idpedido = pp.id_pedido
JOIN prato pr ON pp.id_prato = pr.idprato
ORDER BY p.data_pedido DESC;

-- Mostrar pratos e respectivos ingredientes:
SELECT 
    pr.nome_prato,
    pr.preco,
    i.nome_ingrediente
FROM prato pr
INNER JOIN prato_ingrediente pi ON pr.idprato = pi.id_prato
INNER JOIN ingrediente i ON pi.id_ingrediente = i.idingrediente
ORDER BY pr.nome_prato, i.nome_ingrediente;

--- joins avançados

-- Qual o custo médio de projetos por cliente?

SELECT
    c.nome_cliente AS "Nome Cliente",
    COUNT(p.projeto_id) AS "Quantidade Projetos",
    CAST(AVG(p.valor_projeto) AS DECIMAL(10,2)) AS "Custo Medio"
FROM
    Clientes c
JOIN
    Projetos p ON p.cliente_id = c.cliente_id
GROUP BY
    c.cliente_id, c.nome_cliente
ORDER BY
    AVG(p.valor_projeto) DESC;
    
-- ---------------------------------
-- Qual profissional está em mais projetos?
SELECT
    f.nome_funcionario AS "Profissional",
    car.nome_cargo AS "Cargo",
    COUNT(ap.projeto_id) AS "Quantidade de Projetos"
FROM
    funcionarios f
JOIN
    alocacao_projetos ap ON f.funcionario_id = ap.funcionario_id
JOIN
    cargos car ON f.cargo_id = car.cargo_id
GROUP BY
    f.funcionario_id
,   f.nome_funcionario
,   car.nome_cargo
ORDER BY
    COUNT(ap.projeto_id) DESC;
-- LIMIT 30;

-- --------------------------------
/*
VALIDAÇÃO EXTERNA
SELECT * 
FROM
    projetos p
JOIN
    alocacao_projetos ap ON p.projeto_id = ap.projeto_id
JOIN
    funcionarios f ON ap.funcionario_id = f.funcionario_id
JOIN
    cargos car ON f.cargo_id = car.cargo_id
JOIN
    areas_tecnologia a ON car.area_id = a.area_id
WHERE
    a.nome_area = 'Segurança';
*/    

-- Qual cliente tem o projeto que mais gasta com segurança?    
SELECT
    c.nome_cliente AS "Cliente",
    p.nome_projeto AS "Projeto",
    car.nome_cargo AS "Cargo Segurança",
    SUM(ap.horas_alocadas * car.custo_hora) AS "Gasto com Segurança"
FROM
    projetos p
JOIN
    clientes c ON p.cliente_id = c.cliente_id
JOIN
    alocacao_projetos ap ON p.projeto_id = ap.projeto_id
JOIN
    funcionarios f ON ap.funcionario_id = f.funcionario_id
JOIN
    cargos car ON f.cargo_id = car.cargo_id
JOIN
    areas_tecnologia a ON car.area_id = a.area_id
WHERE
    a.nome_area = 'Segurança'
GROUP BY
    c.cliente_id
,   c.nome_cliente
,   p.projeto_id
,   p.nome_projeto
,   car.nome_cargo
ORDER BY
    SUM(ap.horas_alocadas * car.custo_hora) DESC;
-- LIMIT 20;

-- ---------------------------------------
-- Qual projeto mais gasta com banco de dados?
SELECT
    p.nome_projeto AS "Projeto",
    c.nome_cliente AS "Cliente",
    SUM(ap.horas_alocadas * car.custo_hora) AS "Gasto com Banco de Dados" -- Coloquei assim porque é requisição da pergunta. 'BD'
FROM
    projetos p
JOIN
    clientes c ON p.cliente_id = c.cliente_id
JOIN
    alocacao_projetos ap ON p.projeto_id = ap.projeto_id
JOIN
    funcionarios f ON ap.funcionario_id = f.funcionario_id
JOIN
    cargos car ON f.cargo_id = car.cargo_id
JOIN
    areas_tecnologia a ON car.area_id = a.area_id
WHERE
    a.nome_area = 'Banco de Dados'
GROUP BY
    p.projeto_id, p.nome_projeto, c.nome_cliente
ORDER BY
    SUM(ap.horas_alocadas * car.custo_hora) DESC;
 

-- -----------------------------------------------------------------
-- Qual colaborador que mais recebeu valores em fevereiro de 2025?
SELECT
    f.nome_funcionario AS "Colaborador",
    car.nome_cargo AS "Cargo",
   CAST(SUM(ap.horas_alocadas * car.custo_hora) AS DECIMAL(10,2)) AS "Valor Recebido"
FROM
    funcionarios f
JOIN
    alocacao_projetos ap ON f.funcionario_id = ap.funcionario_id
JOIN
    cargos car ON f.cargo_id = car.cargo_id
WHERE
    YEAR(ap.data_inicio_alocacao) = 2025 AND MONTH(ap.data_inicio_alocacao) = 2
    OR YEAR(ap.data_fim_alocacao) = 2025 AND MONTH(ap.data_fim_alocacao) = 2
    OR (ap.data_inicio_alocacao <= '2025-02-28' AND (ap.data_fim_alocacao IS NULL OR ap.data_fim_alocacao >= '2025-02-01'))
GROUP BY
    f.funcionario_id, f.nome_funcionario, car.nome_cargo
ORDER BY
    SUM(ap.horas_alocadas * car.custo_hora) DESC;
    
-- -------------------------------------------------------------
-- Quanto recebeu o colaborador que mais recebeu em julho de 2025?
SELECT
    f.nome_funcionario AS "Colaborador",
    car.nome_cargo AS "Cargo",
    CAST(SUM(ap.horas_alocadas * car.custo_hora) AS DECIMAL(10,2))AS "Valor Recebido"
FROM
    funcionarios f
JOIN
    alocacao_projetos ap ON f.funcionario_id = ap.funcionario_id
JOIN
    cargos car ON f.cargo_id = car.cargo_id
WHERE
    (ap.data_inicio_alocacao <= '2025-07-31' AND (ap.data_fim_alocacao IS NULL OR ap.data_fim_alocacao >= '2025-07-01'))
GROUP BY
    f.funcionario_id, f.nome_funcionario, car.nome_cargo
ORDER BY
    SUM(ap.horas_alocadas * car.custo_hora) DESC
LIMIT 1;    

-- ----------------------------------------------------------
-- Qual e quantas entregas tiveram os projetos?

SELECT
    p.nome_projeto AS "Projeto",
    c.nome_cliente AS "Cliente",
    COUNT(e.entrega_id) AS "Total Entregas",
    SUM(CASE WHEN e.status_entrega = 'APROVADA' THEN 1 ELSE 0 END) AS "Entregas Aprovadas",
    SUM(CASE WHEN e.status_entrega = 'PENDENTE' THEN 1 ELSE 0 END) AS "Entregas Pendentes",
    SUM(CASE WHEN e.status_entrega = 'ENTREGUE' THEN 1 ELSE 0 END) AS "Entregas Concluídas",
    SUM(e.horas_gastas) AS "Horas Totais Gastas"
FROM
    projetos p
JOIN
    clientes c ON p.cliente_id = c.cliente_id
LEFT JOIN
    entregas e ON p.projeto_id = e.projeto_id
GROUP BY
    p.projeto_id, p.nome_projeto, c.nome_cliente
ORDER BY
    COUNT(e.entrega_id) DESC;
