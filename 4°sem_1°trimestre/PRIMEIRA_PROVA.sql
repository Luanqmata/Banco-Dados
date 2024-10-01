SELECT * FROM tabela_superheroi;
DROP TABLE tabela_superheroi;

CREATE TABLE tabela_superheroi (
	id_heroi SERIAL,
	nome VARCHAR(30),
	poder VARCHAR(50),
	fraqueza VARCHAR(60),
	comida_preferida TEXT
);

INSERT INTO tabela_superheroi(nome,poder,fraqueza,comida_preferida)
VALUES 
('Super lixeiro','limpa rapido','Alvejante','macarrao instantaneo')

INSERT INTO tabela_superheroi(nome,poder,fraqueza,comida_preferida)
VALUES 
('O corretor','Faz dinheiro do nada','','espaguete')

INSERT INTO tabela_superheroi(nome,poder,fraqueza,comida_preferida)
VALUES 
('Super cara','Voa','passaros','sementes')

INSERT INTO tabela_superheroi(nome,poder,fraqueza,comida_preferida)
VALUES 
('garçom maravilha','nunca esquece um pedido','insetos','resto de comida')

INSERT INTO tabela_superheroi(nome,poder,fraqueza,comida_preferida)
VALUES 
('homem poeira','Cria tempestades de areia','alvejante','cimento')

INSERT INTO tabela_superheroi(nome,poder,fraqueza,comida_preferida)
VALUES 
('Super cara','super força','passaros','super rosquinha')

INSERT INTO tabela_superheroi(nome,poder,fraqueza,comida_preferida)
VALUES 
('mulher furiosa','fica muito,muito,muito nervosa','','Rabanada oriental')

INSERT INTO tabela_superheroi(nome,poder,fraqueza,comida_preferida)
VALUES 
('O sapo','Lingua da justiça','insetos','sucrilhos de chocolate')

INSERT INTO tabela_superheroi(nome,poder,fraqueza,comida_preferida)
VALUES 
('garota bibliotecaria','pode achar qualqr coisa','','pao com ovo')

INSERT INTO tabela_superheroi(nome,poder,fraqueza,comida_preferida)
VALUES 
('mulher ganso','boa','','pizza de calabresa')

INSERT INTO tabela_superheroi(nome,poder,fraqueza,comida_preferida)
VALUES 
('super palito','subsstitui humanos','jogo da forca','doce suspiro')

ALTER TABLE tabela_superheroi ADD PRIMARY KEY (id_heroi);


---------------------------------Q2-------------------------------------
SELECT * FROM tabela_superheroi;

ALTER TABLE tabela_superheroi ADD COLUMN inciais CHAR(2);
 
UPDATE tabela_superheroi SET inciais = 'SL' WHERE id_heroi = 1;
UPDATE tabela_superheroi SET inciais = 'OC' WHERE id_heroi = 2;
UPDATE tabela_superheroi SET inciais = 'SC' WHERE id_heroi = 3;
UPDATE tabela_superheroi SET inciais = 'GM' WHERE id_heroi = 4;
UPDATE tabela_superheroi SET inciais = 'HP' WHERE id_heroi = 5;
UPDATE tabela_superheroi SET inciais = 'SC' WHERE id_heroi = 6;
UPDATE tabela_superheroi SET inciais = 'MF' WHERE id_heroi = 7;
UPDATE tabela_superheroi SET inciais = 'OS' WHERE id_heroi = 8;
UPDATE tabela_superheroi SET inciais = 'GB' WHERE id_heroi = 9;
UPDATE tabela_superheroi SET inciais = 'MG' WHERE id_heroi = 10;
UPDATE tabela_superheroi SET inciais = 'SP' WHERE id_heroi = 11;

ALTER TABLE tabela_superheroi ALTER COLUMN inciais SET NOT NULL;

---------------------------------q3--------------------------------------

CREATE SEQUENCE sequencia1_15
	INCREMENT 15
	MINVALUE 0
	MAXVALUE 999999
	START 0
	CACHE 1;
	
DROP SEQUENCE sequencia1_15; -- deletar uma sequenc

--------------------------------q4-------------------------------------
SELECT * FROM tabela_superheroi;

ALTER TABLE tabela_superheroi ADD COLUMN recebe_seq INT;

UPDATE tabela_superheroi SET recebe_seq=NEXTVAL('sequencia1_15') WHERE id_heroi = 1;
UPDATE tabela_superheroi SET recebe_seq=NEXTVAL('sequencia1_15') WHERE id_heroi = 2;
UPDATE tabela_superheroi SET recebe_seq=NEXTVAL('sequencia1_15') WHERE id_heroi = 3;
UPDATE tabela_superheroi SET recebe_seq=NEXTVAL('sequencia1_15') WHERE id_heroi = 4;
UPDATE tabela_superheroi SET recebe_seq=NEXTVAL('sequencia1_15') WHERE id_heroi = 5;
UPDATE tabela_superheroi SET recebe_seq=NEXTVAL('sequencia1_15') WHERE id_heroi = 6;
UPDATE tabela_superheroi SET recebe_seq=NEXTVAL('sequencia1_15') WHERE id_heroi = 7;
UPDATE tabela_superheroi SET recebe_seq=NEXTVAL('sequencia1_15') WHERE id_heroi = 8;
UPDATE tabela_superheroi SET recebe_seq=NEXTVAL('sequencia1_15') WHERE id_heroi = 9;
UPDATE tabela_superheroi SET recebe_seq=NEXTVAL('sequencia1_15') WHERE id_heroi = 10;
UPDATE tabela_superheroi SET recebe_seq=NEXTVAL('sequencia1_15') WHERE id_heroi = 11;

----------------------------------q5-------------------------------------------------
SELECT * FROM tabela_superheroi;

ALTER TABLE tabela_superheroi DROP CONSTRAINT tabela_superheroi_pkey; -- peguei a pk do jeito que o senhor ensinou peloa pagina inicial do admin olhando nos arquivos

ALTER TABLE tabela_superheroi ADD PRIMARY KEY (recebe_seq);

-----------------------------q6----------------------------------------------------
SELECT * FROM tabela_superheroi;

ALTER TABLE tabela_superheroi DROP COLUMN possue_dft;

ALTER TABLE tabela_superheroi ADD COLUMN possue_dft CHAR(2);

ALTER TABLE tabela_superheroi ADD CONSTRAINT unique_possue_dft UNIQUE (possue_dft);

UPDATE tabela_superheroi SET possue_dft = 'MI' WHERE id_heroi = 1;
UPDATE tabela_superheroi SET possue_dft = 'ES' WHERE id_heroi = 2;
UPDATE tabela_superheroi SET possue_dft = 'SE' WHERE id_heroi = 3;
UPDATE tabela_superheroi SET possue_dft = 'RC' WHERE id_heroi = 4;
UPDATE tabela_superheroi SET possue_dft = 'CI' WHERE id_heroi = 5;
UPDATE tabela_superheroi SET possue_dft = 'SR' WHERE id_heroi = 6;
UPDATE tabela_superheroi SET possue_dft = 'RO' WHERE id_heroi = 7;
UPDATE tabela_superheroi SET possue_dft = 'SC' WHERE id_heroi = 8;
UPDATE tabela_superheroi SET possue_dft = 'PO' WHERE id_heroi = 9;
UPDATE tabela_superheroi SET possue_dft = 'PC' WHERE id_heroi = 10;
UPDATE tabela_superheroi SET possue_dft = 'DS' WHERE id_heroi = 11;

-- INICIAIS DAS COMIDAS PREFERIDAS
----------------------------------Q7-----------------------------------------------
SELECT * FROM tabela_superheroi;

ALTER TABLE tabela_superheroi ADD COLUMN idade INT;
ALTER TABLE tabela_superheroi ADD COLUMN salario_ideal DECIMAL;

ALTER TABLE tabela_superheroi ADD CONSTRAINT idade_check CHECK (idade > 18);
ALTER TABLE tabela_superheroi ADD CONSTRAINT salario_ideal_check CHECK (salario_ideal >= 1200);

UPDATE tabela_superheroi SET idade = 19 WHERE id_heroi = 1;
UPDATE tabela_superheroi SET idade = 20 WHERE id_heroi = 2;
UPDATE tabela_superheroi SET idade = 22 WHERE id_heroi = 3;
UPDATE tabela_superheroi SET idade = 21 WHERE id_heroi = 4;
UPDATE tabela_superheroi SET idade = 19 WHERE id_heroi = 5;
UPDATE tabela_superheroi SET idade = 28 WHERE id_heroi = 6;
UPDATE tabela_superheroi SET idade = 37 WHERE id_heroi = 7;
UPDATE tabela_superheroi SET idade = 30 WHERE id_heroi = 8;
UPDATE tabela_superheroi SET idade = 25 WHERE id_heroi = 9;
UPDATE tabela_superheroi SET idade = 19 WHERE id_heroi = 10;
UPDATE tabela_superheroi SET idade = 44 WHERE id_heroi = 11;

UPDATE tabela_superheroi SET salario_ideal = 2000 WHERE id_heroi = 1;
UPDATE tabela_superheroi SET salario_ideal = 5000 WHERE id_heroi = 2;
UPDATE tabela_superheroi SET salario_ideal = 2800 WHERE id_heroi = 3;
UPDATE tabela_superheroi SET salario_ideal = 2999 WHERE id_heroi = 4;
UPDATE tabela_superheroi SET salario_ideal = 1200 WHERE id_heroi = 5;
UPDATE tabela_superheroi SET salario_ideal = 1202 WHERE id_heroi = 6;
UPDATE tabela_superheroi SET salario_ideal = 8000 WHERE id_heroi = 7;
UPDATE tabela_superheroi SET salario_ideal = 9000 WHERE id_heroi = 8;
UPDATE tabela_superheroi SET salario_ideal = 11000 WHERE id_heroi = 9;
UPDATE tabela_superheroi SET salario_ideal = 20000 WHERE id_heroi = 10;
UPDATE tabela_superheroi SET salario_ideal = 4500 WHERE id_heroi = 11;

------------------------------------ q8 ------------------------------------
SELECT * FROM idade_escondida;
DROP TABLE idade_escondida;

CREATE TABLE idade_escondida (
  id_idade SERIAL PRIMARY KEY,
  idade INT,
  recebe_seq INT REFERENCES tabela_superheroi (recebe_seq)
);

INSERT INTO idade_escondida
(idade,recebe_seq)
VALUES
(19,0),
(20,15),
(22,30),
(21,45),
(19,60),
(28,75),
(37,90),
(30,105),
(25,120),
(19,135),
(44,150)

ALTER TABLE tabela_superheroi DROP COLUMN idade; -- apagar a idade da cluna principal porque queremos oculta-la
-------------------------------- q9 ---------------------------------------
SELECT * FROM motos;
DROP TABLE motos;

CREATE TABLE motos (
  id_moto SERIAL PRIMARY KEY,
  nome_moto VARCHAR(30),
  recebe_seq INT REFERENCES tabela_superheroi (recebe_seq)
);

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('KASAKI',0)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('TENERE',0)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('hayabusa',15)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('moto de motrocros',15)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('ninja',30)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('cb250',45)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('cg 150',45)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('tenere 500cc',60)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('tracer 800 (sonho)',60)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('falcon',75)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('bizz 100i',90)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('pop 100',105)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('xre 300',120)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('xre 300 adventure', 120)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('lander 2000', 135)

INSERT INTO motos
(nome_moto,recebe_seq)
VALUES
('s1000rr r', 150)

------------------------------------ q 10 -------------------------------
DROP TABLE rodagem
DROP TABLE rodagem_interesse
SELECT * FROM rodagem
SELECT * FROM rodagem_interesse


CREATE TABLE rodagem (
   id_rodagem SERIAL PRIMARY KEY,
   interesse VARCHAR(30)
);


CREATE TABLE rodagem_interesse (
  recebe_seq INT REFERENCES tabela_superheroi (recebe_seq),
  id_rodagem INT REFERENCES rodagem(id_rodagem),
  CONSTRAINT rodagem_interesse_pk PRIMARY KEY (recebe_seq, id_rodagem)
);

INSERT INTO rodagem (interesse)
VALUES
('trilha'),
('pista'),
('autódromo'),
('terra'),
('estrada');


INSERT INTO meus_contatos_interesse (recebe_sequenc, id_interesse)
VALUES
(0, 1),
(0, 2),
(15, 3),
(15, 4), 
(30, 5), 
(30, 1),
(45, 2),
(45, 3),
(60, 4),
(60, 5),
(75, 1),
(75, 2),
(90, 3),
(90, 4),
(105, 5),
(105, 1),
(120, 2),
(120, 3);
