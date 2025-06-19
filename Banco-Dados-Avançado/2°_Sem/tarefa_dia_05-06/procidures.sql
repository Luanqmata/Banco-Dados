use precidure_bd;

DROP TABLE clientes;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único do cliente',
    nome VARCHAR(100) NOT NULL COMMENT 'Nome completo do cliente',
    email VARCHAR(100) UNIQUE COMMENT 'Endereço de e-mail único do cliente',
    telefone VARCHAR(15) COMMENT 'Número de telefone do cliente (para Q2)',
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora do cadastro do cliente (para Q11)',
    cidade VARCHAR(100) COMMENT 'Cidade de residência do cliente (para Q17)',
    data_nascimento DATE NULL COMMENT 'Data de nascimento do cliente (para Q1)'
) COMMENT='Tabela de clientes da empresa';

INSERT INTO clientes (nome, email, telefone, cidade, data_nascimento) VALUES
("gabriel quiroz", "ana.silva@email.com", "11987654321", "São Paulo", "1990-05-15"),
("vitor", "bruno.costa@email.com", "21998765432", "Rio de Janeiro", "1985-11-20"),
("PABLO SOARES", "carla.dias@email.com", "31988887777", "Belo Horizonte", "1995-02-10"),
("PABLO CRUZEIRO", "daniel.martins@email.com", "41977776666", "Curitiba", "1988-07-25"),
("MATHEUS CAMPOS", "eduarda.ferreira@email.com", "51966665555", "Porto Alegre", "2000-01-30"),
("ENZO VIEIRA", "fabio.souza@email.com", "61955554444", "Brasília", "1992-09-05"),
("CRISTOPHER YOHAN", "gabriela.lima@email.com", "71944443333", "Salvador", "1983-12-12"),
("GUILHERME", "hugo.pereira@email.com", "81933332222", "Recife", "1998-04-18"),
("SAMUEL", "isabela.santos@email.com", "91922221111", "Belém", "1991-06-22"),
("LUIS FELIPE", "joao.oliveira@email.com", "85911110000", "Fortaleza", "1980-03-01"),
("GABRIEL LIMA", "larissa.almeida@email.com", "11912345678", "São Paulo", "1993-10-08"),
("LUAN CALAZANS", "marcos.rocha@email.com", "21987651234", "Rio de Janeiro", "1987-08-14"),
("EDUARDO", "natalia.barbosa@email.com", "31999998888", "Belo Horizonte", "1999-11-29");

-- --------------------------------------------------------------------
DROP TABLE contas;

CREATE TABLE contas (
    id_conta INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único da conta',
    id_cliente INT UNIQUE COMMENT 'Chave estrangeira para a tabela clientes (assumindo 1 conta por cliente)',
    saldo DECIMAL(10, 2) DEFAULT 0.00 COMMENT 'Saldo atual da conta',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Contas bancárias dos clientes';

INSERT INTO contas (id_cliente, saldo) VALUES
(1, 2500.00),
(2, 500.000),
(3, 2000.00),
(4, 20.00),
(5, 10000.00),
(6, 800.00),
(7, 3550.00),
(8, 2500.00),
(9, 12.00),
(10, 12.50),
(11, 12.00),
(12, 350.00),
(13, 950.80);

-- -----------------------------------------------------------------
-- FAZER
