use banco_de_funcoes;

DROP TABLE clientes;
SELECT * FROM clientes;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único do cliente',
    nome VARCHAR(100) NOT NULL COMMENT 'Nome completo do cliente',
    email VARCHAR(100) UNIQUE COMMENT 'Endereço de e-mail único do cliente',
    telefone VARCHAR(15) COMMENT 'Número de telefone do cliente (para Q2)',
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora do cadastro do cliente (para Q11)',
    cidade VARCHAR(100) COMMENT 'Cidade de residência do cliente (para Q17)',
    data_nascimento DATE NULL COMMENT 'Data de nascimento do cliente (para Q1)'
) COMMENT='Tabela de clientes da empresa';

INSERT INTO clientes(nome,email,telefone,data_cadastro,cidade,data_nascimento)
VALUES('luan','luancalazans6@gmail.com','61996774268','2025-06-05','formosa-go','2002-09-20');

INSERT INTO clientes (nome, email, telefone, cidade, data_nascimento) VALUES
("Ana Silva", "ana.silva@email.com", "11987654321", "São Paulo", "1990-05-15"),
("Bruno Costa", "bruno.costa@email.com", "21998765432", "Rio de Janeiro", "1985-11-20"),
("Carla Dias", "carla.dias@email.com", "31988887777", "Belo Horizonte", "1995-02-10"),
("Daniel Martins", "daniel.martins@email.com", "41977776666", "Curitiba", "1988-07-25"),
("Eduarda Ferreira", "eduarda.ferreira@email.com", "51966665555", "Porto Alegre", "2000-01-30"),
("Fábio Souza", "fabio.souza@email.com", "61955554444", "Brasília", "1992-09-05"),
("Gabriela Lima", "gabriela.lima@email.com", "71944443333", "Salvador", "1983-12-12"),
("Hugo Pereira", "hugo.pereira@email.com", "81933332222", "Recife", "1998-04-18"),
("Isabela Santos", "isabela.santos@email.com", "91922221111", "Belém", "1991-06-22"),
("João Oliveira", "joao.oliveira@email.com", "85911110000", "Fortaleza", "1980-03-01"),
("Larissa Almeida", "larissa.almeida@email.com", "11912345678", "São Paulo", "1993-10-08"),
("Marcos Rocha", "marcos.rocha@email.com", "21987651234", "Rio de Janeiro", "1987-08-14"),
("Natália Barbosa", "natalia.barbosa@email.com", "31999998888", "Belo Horizonte", "1999-11-29"),
("Otávio Mendes", "otavio.mendes@email.com", "41976543210", "Curitiba", "1982-05-03"),
("Patrícia Castro", "patricia.castro@email.com", "51988887777", "Porto Alegre", "1996-07-19"),
("Rafael Gomes", "rafael.gomes@email.com", "61977778888", "Brasília", "1989-01-24"),
("Sofia Ribeiro", "sofia.ribeiro@email.com", "71966667777", "Salvador", "1994-03-11"),
("Thiago Azevedo", "thiago.azevedo@email.com", "81955556666", "Recife", "1986-09-16"),
("Vanessa Carvalho", "vanessa.carvalho@email.com", "91944445555", "Belém", "1997-12-07"),
("William Nunes", "william.nunes@email.com", "85933334444", "Fortaleza", "1981-02-28"),
("Xavier Pinto", "xavier.pinto@email.com", "11922223333", "São Paulo", "1990-08-20");

-- q1 ---------------------------------------


DELIMITER $$

CREATE FUNCTION calcula_idade(data_nascimento DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE idade_atual INT;
  SET idade_atual = TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()); -- AQUI VC CHAMA UMA FUNCAO PROPIA DO POSTGSQL QUE É USADA PARA CALCULAR DIFERENÇA DEPOIS VC ESOLHE A FORMA COMO VAI SER EXIBIDA (YEAR,DAY) 
-- AI ELA PEDE 2 PARAMETROS PARA CALCULAR A DIFERE~ÇA E USA OUTRA FUNÇÃO PROPIA QUE É A DO DIA ATUAL
  RETURN idade_atual;
END $$

DELIMITER ;

SELECT nome, calcula_idade(data_nascimento) AS idade FROM clientes;

-- q2 ---------------------------------------

DELIMITER $$

CREATE FUNCTION formatar_telefone(telefone VARCHAR(15))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  DECLARE tamanho INT;
  DECLARE ddd VARCHAR(2);
  DECLARE parte1 VARCHAR(5);
  DECLARE parte2 VARCHAR(4);
  DECLARE resultado VARCHAR(20);

  SET telefone = REPLACE(telefone, ' ', '');
  SET telefone = REPLACE(telefone, '-', '');
  SET telefone = REPLACE(telefone, '(', '');
  SET telefone = REPLACE(telefone, ')', '');

  SET tamanho = CHAR_LENGTH(telefone);

  IF tamanho = 10 THEN
    SET ddd = SUBSTRING(telefone, 1, 2);
    SET parte1 = SUBSTRING(telefone, 3, 4);
    SET parte2 = SUBSTRING(telefone, 7, 4);
    SET resultado = CONCAT('(', ddd, ') ', parte1, '-', parte2);

  ELSEIF tamanho = 11 THEN
    SET ddd = SUBSTRING(telefone, 1, 2);
    SET parte1 = SUBSTRING(telefone, 3, 5);
    SET parte2 = SUBSTRING(telefone, 8, 4);
    SET resultado = CONCAT('(', ddd, ') ', parte1, '-', parte2);

  ELSE
    SET resultado = 'Número inválido';
  END IF;

  RETURN resultado;
END $$

DELIMITER ;

-- testes
SELECT formatar_telefone('61996774268');
SELECT formatar_telefone('6132467890');
SELECT formatar_telefone('123');

-- na tabela
SELECT nome, formatar_telefone(telefone) AS telefone_formatado FROM clientes;

-- q3 --------------------------------------------

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO pedidos (id_cliente, data_pedido) VALUES 
(1, '2025-06-10 14:30:00'),
(1, '2025-06-11 09:15:00'),
(3, '2025-06-10 16:45:00'),
(5, '2025-06-09 11:00:00'),
(5, '2025-06-10 10:00:00'),
(5, '2025-06-10 17:00:00');

DELIMITER //

CREATE FUNCTION contar_pedidos_cliente(cliente_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_pedidos INT;

    SELECT COUNT(*) INTO total_pedidos
    FROM pedidos
    WHERE id_cliente = cliente_id;

    RETURN total_pedidos;
END;
//

DELIMITER ;

SELECT contar_pedidos_cliente(1);
SELECT contar_pedidos_cliente(3);

-- q4 -------------------------------------------

DELIMITER //

CREATE FUNCTION calcular_desconto_progressivo(valor_total DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE desconto DECIMAL(10,2);

    IF valor_total > 1000 THEN
        SET desconto = valor_total * 0.15;
    ELSEIF valor_total > 500 THEN
        SET desconto = valor_total * 0.10;
    ELSEIF valor_total > 100 THEN
        SET desconto = valor_total * 0.05;
    ELSE
        SET desconto = 0;
    END IF;

    RETURN desconto;
END;
//

DELIMITER ;

 
SELECT calcular_desconto_progressivo(50);    -- Resultado: 0.00
SELECT calcular_desconto_progressivo(150);   -- Resultado: 7.50 (5%)
SELECT calcular_desconto_progressivo(600);   -- Resultado: 60.00 (10%)
SELECT calcular_desconto_progressivo(1200);  -- Resultado: 180.00 (15%)

-- Q5 ----------------------------------------------------

SELECT * FROM produtos;
DROP TABLE produtos;
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    quantidade_estoque INT
);

INSERT INTO produtos (nome, quantidade_estoque) VALUES
('Notebook', 15),
('Smartphone', 30),
('Fone de Ouvido', 50),
('Teclado', 25),
('Mouse', 40);


DELIMITER //

CREATE FUNCTION verificar_estoque_produto(
    produto_id INT,
    quantidade_desejada INT
)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE estoque_atual INT;

    SELECT quantidade_estoque INTO estoque_atual
    FROM produtos 
    WHERE id_produto = produto_id;

    IF estoque_atual IS NULL THEN
        RETURN 'Produto não encontrado';
    ELSEIF estoque_atual >= quantidade_desejada THEN
        RETURN 'Disponível';
    ELSE
        RETURN 'Indisponível';
    END IF;
END;
//

DELIMITER ;

SELECT verificar_estoque_produto(1, 10);

SELECT verificar_estoque_produto(6, 2); ## nao identifica o erro data toolong for column

-- q6 -----------------------------------------------------------
DELIMITER //

CREATE FUNCTION obter_nome_mes(
	mes_numerico INT
)
RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN
    DECLARE mes_string VARCHAR(40);

    IF mes_numerico IS NULL OR mes_numerico < 1 OR mes_numerico > 12 THEN
        SET mes_string = 'Mês inválido';
    ELSEIF mes_numerico = 1 THEN 
        SET mes_string = 'Janeiro';
    ELSEIF mes_numerico = 2 THEN
        SET mes_string = 'Fevereiro';
    ELSEIF mes_numerico = 3 THEN
        SET mes_string = 'Março';
	ELSEIF mes_numerico = 4 THEN
        SET mes_string = 'Abril';
    ELSEIF mes_numerico = 5 THEN
        SET mes_string = 'Maio';
    ELSEIF mes_numerico = 6 THEN
        SET mes_string = 'Junho';
    ELSEIF mes_numerico = 7 THEN
        SET mes_string = 'Julho';
    ELSEIF mes_numerico = 8 THEN
        SET mes_string = 'Agosto';
    ELSEIF mes_numerico = 9 THEN
        SET mes_string = 'Setembro';
    ELSEIF mes_numerico = 10 THEN
        SET mes_string = 'Outubro';
    ELSEIF mes_numerico = 11 THEN
        SET mes_string = 'Novembro';
    ELSEIF mes_numerico = 12 THEN
        SET mes_string = 'Dezembro';
    END IF;

    RETURN mes_string;
END;
//

DELIMITER ;

SELECT obter_nome_mes(1)
-- Q7 ----------------------------------------------------------
	
DELIMITER //

CREATE FUNCTION calcula_media_notas(
	n1 INT,
    n2 INT,
    n3 INT
)
RETURNS DECIMAL(10,1)
DETERMINISTIC
BEGIN
	DECLARE media_final DECIMAL (10,1);
    
    SET media_final = (n1+n2+n3) / 3;
    
    RETURN media_final;
END;
//

DELIMITER ;

SELECT calcula_media_notas(5,6,2);

-- q8 --------------------------------------------------------

DELIMITER //

CREATE FUNCTION gerar_senha_aleatoria(
    comprimento INT
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE caracteres_permitidos VARCHAR(100) DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    DECLARE senha VARCHAR(255) DEFAULT '';
    DECLARE i INT DEFAULT 1;
    DECLARE indice INT;

    WHILE i <= comprimento DO
        SET indice = FLOOR(1 + RAND() * LENGTH(caracteres_permitidos));
        SET senha = CONCAT(senha, SUBSTRING(caracteres_permitidos, indice, 1));
        SET i = i + 1;
    END WHILE;

    RETURN senha;
END;
//

DELIMITER ;

SELECT gerar_senha_aleatoria(12);

-- Q9 --------------------------------------------------------------

DELIMITER //

CREATE FUNCTION converter_fahrenheit_para_celsius( fahrenheit INT )
returns DECIMAL(10,1)
DETERMINISTIC
BEGIN
	DECLARE resultado DECIMAL(10,1);
    
    SET resultado = (fahrenheit - 32) * 5 / 9;
    
    RETURN resultado;
END;
//
DELIMITER ;

SELECT converter_fahrenheit_para_celsius(98);

-- Q10 ---------------------------------------------------------

DELIMITER //

CREATE FUNCTION verifica_email( email VARCHAR(255) )
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	IF locate('@',email) >= 1 AND LOCATE('.',email) >= 1 THEN 
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END;
//

DELIMITER ;

SELECT verifica_email('teste@exemplo.com');
SELECT verifica_email('emailinvalido');

