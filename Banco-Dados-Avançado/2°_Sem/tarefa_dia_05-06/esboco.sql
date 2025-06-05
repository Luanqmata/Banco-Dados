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

