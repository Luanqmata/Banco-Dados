-- LEI DE TABELA NAO PODE TER OBJETOS ATOMICOS E OBJETOS NAO PODEM SE REPETIR NA MSM TABELA

DROP TABLE tb_brinquedo_grupo;

CREATE TABLE tb_brinquedo_grupo (
	id_brinquedo INT,
	brinquedo VARCHAR(30),
	cor_1 VARCHAR(30),
	cor_2 VARCHAR(30),
	cor_3 VARCHAR(30)
);

INSERT INTO tb_brinquedo_grupo (id_brinquedo, brinquedo, cor_1, cor_2, cor_3)
VALUES
(5, 'bola', 'branco', 'amarelo', 'azul'),
(6,'bumerangue','verde','amarelo',''),
(9,'pipa','vermelha','azul','verde'),  --ESSA TABELA ELA INFRIGE A 1° LEI POR QUE ELA SE REPETE E DE ACORDO COM A PRIMEIRA REGRA ELA NAO PODE REPETIR
(12,'ioiô','branco','amarelo','');

SELECT * FROM tb_brinquedo_grupo;

------------------------------------------------------------------------
SELECT * FROM tb_brinquedo_nao_atomico;
DROP TABLE tb_brinquedo_nao_atomico;

CREATE TABLE tb_brinquedo_nao_atomico (
	id_brinquedo INT,
	brinquedo VARCHAR(30),
	cor TEXT
);

INSERT INTO tb_brinquedo_nao_atomico (id_brinquedo, brinquedo, cor)
VALUES
(5, 'bola', 'branco,amarelo,azul'),
(6, 'bumerangue', 'verde,amarelo'), -- essa 2° tabem infrige a 1°lei tambem porque ela tem objetos não atomicos
(9, 'pipa', 'azul,verde,vermelho'),
(12, 'ioiô', 'branco,amarelo');

------------------------------------------------------------------------
SELECT * FROM tabela_super_heroi;
DROP TABLE tabela_super_heroi;

CREATE TABLE tabela_super_heroi (
	nome VARCHAR(50),
	poder VARCHAR(50),
	fraqueza VARCHAR(50),
	iniciais CHAR(2)
);

INSERT INTO tabela_super_heroi (nome, poder, fraqueza, iniciais)
VALUES 
('Super lixeiro', 'limpa rapido', 'Alvejante', 'SL'),
('O corretor', 'Faz dinheiro do nada', '', 'OC'),
('Super cara', 'Voa', 'passaros', 'SC'),
('Garçom maravilha', 'nunca esquece um pedido', 'insetos', 'GM'),
('Homem poeira', 'Cria tempestades de areia', 'alvejante', 'HP'),
('Super cara', 'super força', 'passaros', 'SC'),
('Mulher furiosa', 'fica muito, muito, muito nervosa', '', 'MF'),
('O sapo', 'Lingua da justiça', 'insetos', 'OS'),
('Garota bibliotecária', 'pode achar qualquer coisa', '', 'GB'),
('Mulher ganso', 'boa', '', 'MG'),
('Super palito', 'substitui humanos', 'jogo da forca', 'SP');

ALTER TABLE tabela_super_heroi ADD PRIMARY KEY (nome, poder);

ALTER TABLE tabela_super_heroi
ADD COLUMN pais VARCHAR(50),
ADD COLUMN cidade VARCHAR(50);

UPDATE tabela_super_heroi SET pais = 'Brasil', cidade = 'São Paulo' WHERE nome = 'Super lixeiro';
UPDATE tabela_super_heroi SET pais = 'Estados Unidos', cidade = 'Nova York' WHERE nome = 'O corretor';
UPDATE tabela_super_heroi SET pais = 'Canadá', cidade = 'Toronto' WHERE nome = 'Super cara';
UPDATE tabela_super_heroi SET pais = 'Brasil', cidade = 'Rio de Janeiro' WHERE nome = 'Garçom maravilha';
UPDATE tabela_super_heroi SET pais = 'Egito', cidade = 'Cairo' WHERE nome = 'Homem poeira';
UPDATE tabela_super_heroi SET pais = 'França', cidade = 'Paris' WHERE nome = 'Mulher furiosa';
UPDATE tabela_super_heroi SET pais = 'Brasil', cidade = 'Curitiba' WHERE nome = 'O sapo';
UPDATE tabela_super_heroi SET pais = 'Alemanha', cidade = 'Berlim' WHERE nome = 'Garota bibliotecária';
UPDATE tabela_super_heroi SET pais = 'Austrália', cidade = 'Sydney' WHERE nome = 'Mulher ganso';
UPDATE tabela_super_heroi SET pais = 'Japão', cidade = 'Tóquio' WHERE nome = 'Super palito';

ALTER TABLE tabela_super_heroi ALTER COLUMN pais SET NOT NULL;
ALTER TABLE tabela_super_heroi ALTER COLUMN cidade SET NOT NULL; -- setar como not null 

---------------------------------------------------------------------------------- 
-- OBEDECENDO REGRAS 2FN -- nao pode depender de 1 fator da PK e tem q ser 1FN
SELECT * FROM super_heroi;
DROP TABLE super_heroi;

CREATE TABLE super_heroi (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    poder VARCHAR(50),
    fraqueza VARCHAR(50)
);

INSERT INTO super_heroi (nome, poder, fraqueza)
VALUES 
('Super lixeiro', 'limpa rapido', 'Alvejante'),
('O corretor', 'Faz dinheiro do nada', ''),
('Super cara', 'Voa', 'passaros'),
('Garçom maravilha', 'nunca esquece um pedido', 'insetos'),
('Homem poeira', 'Cria tempestades de areia', 'alvejante'),
('Mulher furiosa', 'fica muito, muito, muito nervosa', ''),
('O sapo', 'Lingua da justiça', 'insetos'),
('Garota bibliotecária', 'pode achar qualquer coisa', ''),
('Mulher ganso', 'boa', ''),
('Super palito', 'substitui humanos', 'jogo da forca');

SELECT * FROM localizacao;
DROP TABLE localizacao;

CREATE TABLE localizacao (
    id_super_heroi INT PRIMARY KEY,
    pais VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_super_heroi) REFERENCES super_heroi(id)
);

INSERT INTO localizacao (id_super_heroi, pais, cidade)
VALUES 
(1, 'Brasil', 'São Paulo'),
(2, 'Estados Unidos', 'Nova York'),
(3, 'Canadá', 'Toronto'),
(4, 'Brasil', 'Rio de Janeiro'),
(5, 'Egito', 'Cairo'),
(6, 'França', 'Paris'),
(7, 'Brasil', 'Curitiba'),
(8, 'Alemanha', 'Berlim'),
(9, 'Austrália', 'Sydney'),
(10, 'Japão', 'Tóquio');

SELECT * FROM iniciais_super_heroi;
DROP TABLE iniciais_super_heroi;

CREATE TABLE iniciais_super_heroi (
    id_super_heroi INT PRIMARY KEY,
    iniciais CHAR(2) NOT NULL,
    FOREIGN KEY (id_super_heroi) REFERENCES super_heroi(id)
);

INSERT INTO iniciais_super_heroi (id_super_heroi, iniciais)
VALUES 
(1, 'SL'),
(2, 'OC'),
(3, 'SC'),
(4, 'GM'),
(5, 'HP'),
(6, 'MF'),
(7, 'OS'),
(8, 'GB'),
(9, 'MG'),
(10, 'SP');
