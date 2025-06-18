use prova_escrita;

CREATE TABLE IF NOT EXISTS Pedidos_Desnormalizados (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    status_pedido VARCHAR(50) NOT NULL,
    
    cliente_id INT NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) NOT NULL,
    telefone_cliente VARCHAR(20),
    endereco_cliente VARCHAR(255),
    cidade_cliente VARCHAR(100),
    estado_cliente VARCHAR(50),
    cep_cliente VARCHAR(10),
    
    produto_id INT NOT NULL,
    nome_produto VARCHAR(100) NOT NULL,
    descricao_produto TEXT,
    preco_unitario DECIMAL(10,2) NOT NULL,
    categoria_produto VARCHAR(50),
    
    quantidade INT NOT NULL,
    total_item DECIMAL(10,2) NOT NULL,
    
    metodo_pagamento VARCHAR(50),
    data_pagamento DATE
);


INSERT INTO Pedidos_Desnormalizados (
    data_pedido, status_pedido,
    cliente_id, nome_cliente, email_cliente, telefone_cliente, endereco_cliente, cidade_cliente, estado_cliente, cep_cliente,
    produto_id, nome_produto, descricao_produto, preco_unitario, categoria_produto,
    quantidade, total_item,
    metodo_pagamento, data_pagamento
) VALUES
(
    '2025-05-10', 'Concluído',
    101, 'João Silva', 'joao.silva@email.com', '11987654321', 'Rua A, 123', 'São Paulo', 'SP', '01000-000',
    1, 'Smartphone X', 'Smartphone de última geração', 2500.00, 'Eletrônicos',
    1, 2500.00,
    'Cartão de Crédito', '2025-05-10'
),
(
    '2025-05-10', 'Concluído',
    102, 'Maria Oliveira', 'maria.oliveira@email.com', '21987654322', 'Av. B, 456', 'Rio de Janeiro', 'RJ', '20000-000',
    2, 'Notebook Pro', 'Notebook para profissionais', 4000.00, 'Eletrônicos',
    1, 4000.00,
    'Boleto Bancário', '2025-05-11'
),
(
    '2025-05-11', 'Pendente',
    101, 'João Silva', 'joao.silva@email.com', '11987654321', 'Rua A, 123', 'São Paulo', 'SP', '01000-000',
    3, 'Fone de Ouvido Bluetooth', 'Fone sem fio com cancelamento de ruído', 300.00, 'Acessórios',
    2, 600.00,
    'Cartão de Crédito', NULL
),
(
    '2025-05-12', 'Concluído',
    103, 'Pedro Souza', 'pedro.souza@email.com', '31987654323', 'Rua C, 789', 'Belo Horizonte', 'MG', '30000-000',
    4, 'Smart TV 50 polegadas', 'TV 4K com sistema inteligente', 3500.00, 'Eletrônicos',
    1, 3500.00,
    'PIX', '2025-05-12'
),
(
    '2025-05-12', 'Concluído',
    104, 'Ana Costa', 'ana.costa@email.com', '41987654324', 'Av. D, 101', 'Curitiba', 'PR', '80000-000',
    5, 'Câmera DSLR', 'Câmera profissional com alta resolução', 5000.00, 'Fotografia',
    1, 5000.00,
    'Cartão de Crédito', '2025-05-12'
),
(
    '2025-05-13', 'Concluído',
    105, 'Lucas Pereira', 'lucas.pereira@email.com', '51987654325', 'Rua E, 202', 'Porto Alegre', 'RS', '90000-000',
    1, 'Smartphone X', 'Smartphone de última geração', 2500.00, 'Eletrônicos',
    1, 2500.00,
    'Cartão de Crédito', '2025-05-13'
),
(
    '2025-05-13', 'Pendente',
    106, 'Sofia Almeida', 'sofia.almeida@email.com', '61987654326', 'Av. F, 303', 'Brasília', 'DF', '70000-000',
    6, 'Mouse Gamer', 'Mouse de alta precisão para jogos', 150.00, 'Periféricos',
    3, 450.00,
    'Boleto Bancário', NULL
),
(
    '2025-05-14', 'Concluído',
    107, 'Gabriel Lima', 'gabriel.lima@email.com', '71987654327', 'Rua G, 404', 'Salvador', 'BA', '40000-000',
    7, 'Teclado Mecânico', 'Teclado com switches mecânicos', 400.00, 'Periféricos',
    1, 400.00,
    'PIX', '2025-05-14'
),
(
    '2025-05-14', 'Concluído',
    108, 'Laura Santos', 'laura.santos@email.com', '81987654328', 'Av. H, 505', 'Recife', 'PE', '50000-000',
    8, 'Monitor Ultrawide', 'Monitor de 34 polegadas', 1800.00, 'Monitores',
    1, 1800.00,
    'Cartão de Crédito', '2025-05-14'
),
(
    '2025-05-15', 'Concluído',
    109, 'Miguel Rocha', 'miguel.rocha@email.com', '91987654329', 'Rua I, 606', 'Fortaleza', 'CE', '60000-000',
    9, 'Webcam Full HD', 'Webcam para videoconferências', 200.00, 'Acessórios',
    2, 400.00,
    'Cartão de Crédito', '2025-05-15'
);
-- Questão 01 - Prova final


-- Questão 01 - Normalização

-- Estamos desativando temporariamente a verificação de chave estrangeira. 
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE Clientes;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    cep VARCHAR(10)
);

DROP TABLE Produtos;

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco_unitario DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50)
);

DROP TABLE Pedidos;

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    status_pedido VARCHAR(50) NOT NULL,
    metodo_pagamento VARCHAR(50),
    data_pagamento DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE Itens_Pedido;

CREATE TABLE Itens_Pedido (
    id_item_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    total_item DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Inserir dados na tabela Clientes
INSERT INTO Clientes (id_cliente, nome, email, telefone, endereco, cidade, estado, cep)
SELECT DISTINCT
    cliente_id,
    nome_cliente,
    email_cliente,
    telefone_cliente,
    endereco_cliente,
    cidade_cliente,
    estado_cliente,
    cep_cliente
FROM Pedidos_Desnormalizados;

-- Inserir dados na tabela Produtos
INSERT INTO Produtos (id_produto, nome_produto, descricao, preco_unitario, categoria)
SELECT DISTINCT
    produto_id,
    nome_produto,
    descricao_produto,
    preco_unitario,
    categoria_produto
FROM Pedidos_Desnormalizados;

INSERT INTO Pedidos (id_pedido, id_cliente, data_pedido, status_pedido, metodo_pagamento, data_pagamento)
SELECT DISTINCT
    pedido_id,
    cliente_id,
    data_pedido,
    status_pedido,
    metodo_pagamento,
    data_pagamento
FROM Pedidos_Desnormalizados;

INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, total_item)
SELECT
    pedido_id,
    produto_id,
    quantidade,
    total_item
FROM Pedidos_Desnormalizados;

SET FOREIGN_KEY_CHECKS = 1;
-- DESTA PARTE PARA CIMA DIREITOS AUTORAIS DE PABLO LOPES: ( link do git mas ele nao tem git )

-- PT2 ---------------
-- todos os pedidos com os detalhes do cliente que o realizou:

SELECT 
    p.id_pedido,
    p.data_pedido,
    p.status_pedido,
    p.metodo_pagamento,
    p.data_pagamento,
    c.id_cliente,
    c.nome,
    c.email,
    c.telefone,
    c.endereco,
    c.cidade,
    c.estado,
    c.cep
FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.id_cliente;


-- Liste todos os itens de pedido com os detalhes do produto correspondente:

SELECT 
    i.id_item_pedido,
    i.id_pedido,
    i.quantidade,
    i.total_item,
    pr.id_produto,
    pr.nome_produto,
    pr.descricao,
    pr.preco_unitario,
    pr.categoria
FROM Itens_Pedido i
JOIN Produtos pr ON i.id_produto = pr.id_produto;

-- Liste todos os clientes e seus pedidos, incluindo clientes que não fizeram pedidos
SELECT 
    c.id_cliente,
    c.nome,
    c.email,
    c.telefone,
    c.endereco,
    c.cidade,
    c.estado,
    c.cep,
    p.id_pedido,
    p.data_pedido,
    p.status_pedido,
    p.metodo_pagamento,
    p.data_pagamento
FROM Clientes c
LEFT JOIN Pedidos p ON c.id_cliente = p.id_cliente;

-- iste todos os produtos e os itens de pedido em que aparecem, incluindo produtos que nunca foram pedidos (RIGHT JOIN)

SELECT 
    pr.id_produto,
    pr.nome_produto,
    pr.descricao,
    pr.preco_unitario,
    pr.categoria,
    ip.id_item_pedido,
    ip.id_pedido,
    ip.quantidade,
    ip.total_item
FROM Itens_Pedido ip
RIGHT JOIN Produtos pr ON pr.id_produto = ip.id_produto;


-- self join (join comum)
SELECT
    c.id_cliente,
    c.nome AS nome_cliente,
    COUNT(p.id_pedido) AS total_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
HAVING COUNT(p.id_pedido) > 1;

-- Liste todos os pedidos e seus itens, incluindo os detalhes do produto e do cliente

SELECT 
    p.id_pedido,
    p.data_pedido,
    p.status_pedido,
    p.metodo_pagamento,
    p.data_pagamento,
    
    c.id_cliente,
    c.nome AS nome_cliente,
    c.email,
    c.telefone,
    c.endereco,
    c.cidade,
    c.estado,
    c.cep,

    i.id_item_pedido,
    i.quantidade,
    i.total_item,

    pr.id_produto,
    pr.nome_produto,
    pr.descricao,
    pr.preco_unitario,
    pr.categoria

FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.id_cliente
JOIN Itens_Pedido i ON p.id_pedido = i.id_pedido
JOIN Produtos pr ON i.id_produto = pr.id_produto;

-- pt3 --------------------------

CREATE INDEX idx_email_cliente ON Clientes(email);
CREATE INDEX idx_nome_produto ON Produtos(nome_produto);

CREATE INDEX idx_pedidos_id_cliente ON Pedidos(id_cliente);
CREATE INDEX idx_itens_pedido_id_pedido ON Itens_Pedido(id_pedido);
CREATE INDEX idx_itens_pedido_id_produto ON Itens_Pedido(id_produto);

CREATE INDEX idx_data_pedido ON Pedidos(data_pedido);

-- pt4 -----------------------------------------

CREATE VIEW vw_detalhes_pedidos AS
SELECT
    p.id_pedido,
    p.data_pedido,
    p.status_pedido,
    p.metodo_pagamento,
    p.data_pagamento,
    
    c.id_cliente,
    c.nome AS nome_cliente,
    c.email,
    c.telefone,
    c.endereco,
    c.cidade,
    c.estado,
    c.cep,

    i.id_item_pedido,
    i.quantidade,
    i.total_item,

    pr.id_produto,
    pr.nome_produto,
    pr.descricao,
    pr.preco_unitario,
    pr.categoria

FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.id_cliente
JOIN Itens_Pedido i ON p.id_pedido = i.id_pedido
JOIN Produtos pr ON i.id_produto = pr.id_produto;

SELECT * FROM vw_detalhes_pedidos;

-- -------------------------

CREATE VIEW vw_vendas_por_categoria AS
SELECT
    pr.categoria,
    SUM(i.total_item) AS total_vendas
FROM Pedidos p
JOIN Itens_Pedido i ON p.id_pedido = i.id_pedido
JOIN Produtos pr ON i.id_produto = pr.id_produto
WHERE p.status_pedido = 'Concluído'
GROUP BY pr.categoria;

SELECT * FROM vw_vendas_por_categoria;

-- --------------------------

CREATE VIEW vw_clientes_gastos AS
SELECT
    c.id_cliente,
    c.nome,
    c.email,
    SUM(i.total_item) AS total_gasto
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
JOIN Itens_Pedido i ON p.id_pedido = i.id_pedido
WHERE p.status_pedido = 'Concluído'
GROUP BY c.id_cliente, c.nome, c.email;

SELECT * FROM vw_clientes_gastos;

-- PT5 -----------------------------

--  NAO COMPIEM APENAS se BASEEM NOS EXEMPLOS =  CONCAT() , SUBSTRING() YEAR() , MONTH() , DAY() ,
--  DATEDIFF() , DATE_FORMAT() COUNT() BASEADO NOS EXEMPLOS ABAIXOS

SELECT 
    id_cliente,
    UPPER(nome) AS nome_maiusculo
FROM Clientes;

SELECT 
    id_cliente,
    LOWER(email) AS email_minusculo
FROM Clientes;

SELECT 
    AVG(preco_unitario) AS preco_medio_produtos
FROM Produtos;

SELECT 
    SUM(total_item) AS total_vendido
FROM Itens_Pedido;

SELECT 
    COUNT(*) AS total_pedidos
FROM Pedidos;

-- pt6 ---------------------------------------
DELIMITER //

CREATE FUNCTION calcular_total_pedido(pedido_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(total_item)
    INTO total
    FROM Itens_Pedido
    WHERE id_pedido = pedido_id;

    RETURN IFNULL(total, 0.00);
END;
//

DELIMITER ;

SELECT calcular_total_pedido(1);

-- ---------------------------------------------------------
DELIMITER //

CREATE FUNCTION descricao_categoria_produto(categoria VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE descricao_amigavel VARCHAR(100);

    IF categoria = 'Eletronicos' THEN
        SET descricao_amigavel = 'Eletronicos em Geral';
    ELSE
        SET descricao_amigavel = categoria;
    END IF;

    RETURN descricao_amigavel;
END;
//

DELIMITER ;

SELECT descricao_categoria_produto('Eletrônicos');

-- PT7 ---------------------------------------------------------------------
-- INSERIR CLIENTE
DELIMITER //

CREATE PROCEDURE inserir_cliente (
    IN p_nome VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_telefone VARCHAR(20),
    IN p_endereco VARCHAR(255),
    IN p_cidade VARCHAR(100),
    IN p_estado VARCHAR(50),
    IN p_cep VARCHAR(10)
)
BEGIN
    INSERT INTO Clientes (nome, email, telefone, endereco, cidade, estado, cep)
    VALUES (p_nome, p_email, p_telefone, p_endereco, p_cidade, p_estado, p_cep);
END;
//

DELIMITER ;

-- USANDO PROCIDURE
CALL inserir_cliente( 
    'João da Silva',
    'joao.sila@email.com',
    '62 91234-5678',
    'Rua das Palmeiras, 123',
    'Goiânia',
    'GO',
    '74000-000'
);


-- Uma procedure para atualizar o status de um pedido
DELIMITER //

CREATE PROCEDURE atualizar_status_pedido (
    IN p_id_pedido INT,
    IN p_novo_status VARCHAR(50)
)
BEGIN
    UPDATE Pedidos
    SET status_pedido = p_novo_status
    WHERE id_pedido = p_id_pedido;
END;
//

DELIMITER ;

CALL atualizar_status_pedido( 
    1,
    'Concluído'
);
