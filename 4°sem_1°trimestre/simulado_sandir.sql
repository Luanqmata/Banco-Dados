SELECT * FROM meus_contatos; -- monstrar tabela 
DROP TABLE meus_contatos; -- apagar tabela

CREATE TABLE meus_contatos (
    id_contato SERIAL,  -- adcionando um serial 0 até 9999
    sobrenome VARCHAR(50),  -- varchar para escrita
    primeiro_nome VARCHAR(50),
    telefone NUMERIC(11), -- estabelecendo numeric de 11 de tamanho
    email VARCHAR(100), 
    sexo CHAR(1), -- uma letra 
    data_nascimento DATE, --tipo data 
    profissao VARCHAR(100), 
    cidade VARCHAR(50),
    estado VARCHAR(50),
    estado_civil VARCHAR(20),
    interesses TEXT,  -- para adicionar
    procura TEXT
);
-- populando tabela
INSERT INTO meus_contatos (sobrenome, primeiro_nome, telefone, email, sexo, data_nascimento, profissao, cidade, estado, estado_civil, interesses, procura)
VALUES 
('Campos', 'Sandir', 6181335430, 'sandir.campos@iesgo.edu.br', 'M', '1980-03-12', 'Professor de BD, JS, CSS', 'Formosa', 'GOIAS', 'Casado', 'Tecnologia, Educação', 'Rodou man?!?!?!'),
('Heriberto', 'Romes', 6196538575, 'romes.hiberto@iesgo.edu.br', 'M', '1960-02-17', 'Professor de C#', 'Gringa', 'Unite States America', 'Casado', 'Tecnologia, back end', 'Miojos orientais'),
('Sousa', 'Marcus', 6196432212, 'marcus.sousa@iesgo.edu.br', 'M', '1979-04-10', 'Professor de Matemática Lógica', 'Formosa', 'GOIAS', 'Casado', 'Matemática, Marketplace digital', 'Do shape inexplicável'),
('Alves', 'Juliana', 6286424628, 'juliana.alves@iesgo.edu.br', 'F', '1990-05-25', 'Professora de Autômatos', 'Planaltina', 'DISTRITO FEDERAL', 'Casada', 'Sistemas, Autômatos', 'Explicar para todos'),
('Gress', 'João', 1196835978, 'joao.gress@iesgo.edu.br', 'M', '1998-01-14', 'Professor de Redes', 'São Paulo', 'Sao Paulo', 'Casado', 'Hackear pelo bem, proteger', 'Estar inrrastreável e seguro'),
('Ferreira', 'Ana', 1197896542, 'ana.ferreira@iesgo.edu.br', 'F', '1985-07-23', 'Professora de Inteligência Artificial', 'Curitiba', 'PARA', 'Solteira', 'Tecnologia, IA, Machine Learning', 'Desenvolver '),
('Santos', 'Pedro', 2196345783, 'pedro.santos@iesgo.edu.br', 'M', '1975-10-30', 'Professor de Segurança da Informação', 'Rio de Janeiro', 'Rio Janeiro', 'Casado', 'Criptografia, Segurança digital', 'Manter sistemas seguros'),
('Lima', 'Beatriz', 3197284651, 'beatriz.lima@iesgo.edu.br', 'F', '1992-05-14', 'Professora de Programação Mobile', 'Belo Horizonte', 'Minas Gerais', 'Solteira', 'Desenvolvimento de apps, UX/UI', 'Criar apps'),
('Almeida', 'Lucas', 6198321457, 'lucas.almeida@iesgo.edu.br', 'M', '1988-11-22', 'Professor de Cloud Computing', 'Brasília', 'DISTRITO FEDERAL', 'Casado', 'Cloud, DevOps, Infraestrutura', 'Implementar infraestruturas');

ALTER TABLE meus_contatos ADD PRIMARY KEY (sobrenome,cidade); -- comando que escolhe 1 chave composta 

--questao 3 

ALTER TABLE meus_contatos ADD COLUMN endereco varchar(30);  -- adiciona uma coluna nova 

UPDATE meus_contatos SET endereco= ' campos belos ' WHERE id_contato=9;  -- populando tabela // update atualizando - SET colocar em - tal id 
UPDATE meus_contatos SET endereco = 'Arborland' WHERE id_contato = 1;
UPDATE meus_contatos SET endereco = 'Lunária' WHERE id_contato = 2;
UPDATE meus_contatos SET endereco = 'Terra do Sol' WHERE id_contato = 3;
UPDATE meus_contatos SET endereco = 'Nevápolis' WHERE id_contato = 4;
UPDATE meus_contatos SET endereco = 'Aquaterra' WHERE id_contato = 5;
UPDATE meus_contatos SET endereco = 'Monteluna' WHERE id_contato = 6;
UPDATE meus_contatos SET endereco = 'Silvária' WHERE id_contato = 7;
UPDATE meus_contatos SET endereco = 'Eldoria' WHERE id_contato = 8; -- ir mudando  o contato e adicionando o que vc quer 

SELECT * FROM meus_contatos; -- mostrando tabela

-- q4 

ALTER TABLE meus_contatos ADD COLUMN tipo_estado varchar(30); --adicionando outra coluna e povoando ela 


UPDATE meus_contatos SET tipo_estado='rural' WHERE id_contato = 1;
UPDATE meus_contatos SET tipo_estado='cidade' WHERE id_contato = 2;
UPDATE meus_contatos SET tipo_estado='metrópole' WHERE id_contato = 3;
UPDATE meus_contatos SET tipo_estado='rural' WHERE id_contato = 4;
UPDATE meus_contatos SET tipo_estado='cidade' WHERE id_contato = 5;   -- atualizando meus contatos setando o estado no tipo de estado e no id tal
UPDATE meus_contatos SET tipo_estado='metrópole' WHERE id_contato = 6;
UPDATE meus_contatos SET tipo_estado='rural' WHERE id_contato = 7;
UPDATE meus_contatos SET tipo_estado='cidade' WHERE id_contato = 8;
UPDATE meus_contatos SET tipo_estado='rural' WHERE id_contato = 9;

/*
-- q5 minhas resposta 

ALTER TABLE meus_contatos ADD COLUMN horas_trabalho INT; 

ALTER TABLE meus_contatos ADD CONSTRAINT horas_trabalho_check CHECK (horas_trabalho >= 4);

UPDATE meus_contatos SET horas_trabalho = 5 WHERE id_contato = 1;
UPDATE meus_contatos SET horas_trabalho = 7 WHERE id_contato = 2;
UPDATE meus_contatos SET horas_trabalho = 8 WHERE id_contato = 3;
UPDATE meus_contatos SET horas_trabalho = 6 WHERE id_contato = 4;
UPDATE meus_contatos SET horas_trabalho = 4 WHERE id_contato = 5;
UPDATE meus_contatos SET horas_trabalho = 7 WHERE id_contato = 6;
UPDATE meus_contatos SET horas_trabalho = 6 WHERE id_contato = 7;
UPDATE meus_contatos SET horas_trabalho = 5 WHERE id_contato = 8;
UPDATE meus_contatos SET horas_trabalho = 4 WHERE id_contato = 9;


SELECT * FROM meus_contatos;

*/

-- q5 resposta sandir 

ALTER TABLE meus_contatos ADD COLUMN salario_atual DECIMAL; -- adicionando duas tabelas novas do tipo decimal que é usado para valores $ cash
ALTER TABLE meus_contatos ADD COLUMN salario_pretendido DECIMAL;

ALTER TABLE meus_contatos ADD CONSTRAINT salario_atual_check CHECK (salario_atual < 5000);   -- alterando a tabela tal . adicionando uma contrando com o nome tal , adicionando a checkagem ou condição (salario atual menor que 5k)
ALTER TABLE meus_contatos ADD CONSTRAINT salario_pretendido_check CHECK (salario_pretendido > 8000);   -- alterando a tabela tal . adicionando uma contrando com o nome tal , adicionando a checkagem ou condição (salario atual menor que 8k)

UPDATE meus_contatos SET salario_atual = 4000 WHERE id_contato = 1;  -- menor que 5000
UPDATE meus_contatos SET salario_atual = 4500 WHERE id_contato = 2;
UPDATE meus_contatos SET salario_atual = 3000 WHERE id_contato = 3;
UPDATE meus_contatos SET salario_atual = 2500 WHERE id_contato = 4;
UPDATE meus_contatos SET salario_atual = 4800 WHERE id_contato = 5;
UPDATE meus_contatos SET salario_atual = 3500 WHERE id_contato = 6;
UPDATE meus_contatos SET salario_atual = 4900 WHERE id_contato = 7;
UPDATE meus_contatos SET salario_atual = 2000 WHERE id_contato = 8;
UPDATE meus_contatos SET salario_atual = 2000 WHERE id_contato = 9;

UPDATE meus_contatos SET salario_pretendido = 8500 WHERE id_contato = 1;  -- maior que 8000
UPDATE meus_contatos SET salario_pretendido = 9000 WHERE id_contato = 2;
UPDATE meus_contatos SET salario_pretendido = 8200 WHERE id_contato = 3;
UPDATE meus_contatos SET salario_pretendido = 8800 WHERE id_contato = 4;
UPDATE meus_contatos SET salario_pretendido = 9500 WHERE id_contato = 5;
UPDATE meus_contatos SET salario_pretendido = 8400 WHERE id_contato = 6;
UPDATE meus_contatos SET salario_pretendido = 8700 WHERE id_contato = 7;
UPDATE meus_contatos SET salario_pretendido = 8001 WHERE id_contato = 8;
UPDATE meus_contatos SET salario_pretendido = 8001 WHERE id_contato = 9;

SELECT * FROM meus_contatos; ---imprimindo tabela

-- q6 

CREATE SEQUENCE sequencia1_13   --criando sequencial com nome 
	INCREMENT 13  -- incrementa de 13 em 13 
	MINVALUE 0  -- cmoeça com 0 
	MAXVALUE 999999 -- valor maximo 
	START 0 -- começar com 
	CACHE 1; 
	
DROP SEQUENCE sequencia1_13; -- deletar uma sequenc

-- q7 

ALTER TABLE meus_contatos ADD COLUMN recebe_sequenc INT;  -- adicionando uma coluna nova nos meus contatos 

UPDATE meus_contatos SET recebe_sequenc=NEXTVAL('sequencia1_13') WHERE id_contato = 1;  -- adicionando a sequencial a mao para cada contato
UPDATE meus_contatos SET recebe_sequenc=NEXTVAL('sequencia1_13') WHERE id_contato = 2;
UPDATE meus_contatos SET recebe_sequenc=NEXTVAL('sequencia1_13') WHERE id_contato = 3;
UPDATE meus_contatos SET recebe_sequenc=NEXTVAL('sequencia1_13') WHERE id_contato = 4;
UPDATE meus_contatos SET recebe_sequenc=NEXTVAL('sequencia1_13') WHERE id_contato = 5;
UPDATE meus_contatos SET recebe_sequenc=NEXTVAL('sequencia1_13') WHERE id_contato = 6;
UPDATE meus_contatos SET recebe_sequenc=NEXTVAL('sequencia1_13') WHERE id_contato = 7;
UPDATE meus_contatos SET recebe_sequenc=NEXTVAL('sequencia1_13') WHERE id_contato = 8;
UPDATE meus_contatos SET recebe_sequenc=NEXTVAL('sequencia1_13') WHERE id_contato = 9;

ALTER TABLE meus_contatos DROP CONSTRAINT meus_contatos_pkey;   --- acabando com a chave composta que foi criada na linha 32

ALTER TABLE meus_contatos ADD PRIMARY KEY (recebe_sequenc);   ---- adicionando a nova primary key 

SELECT * FROM meus_contatos;  --- mostrando tabela 

-- q8 CRIAR OUTRA TABELA E COLOCAR UA CHAVE ESTRANGEIRA PARA ESCONDER DADOS SENSIVEIS 
SELECT * FROM salario;  -- mostrando tabela nova 

CREATE TABLE salario (
  id_salario SERIAL PRIMARY KEY,  -- adicionando PK ao id salario e um seria para ser crescente 
  salario_atual DECIMAL,  -- atribui o valor decimal pro salario 
  recebe_sequenc INT REFERENCES meus_contatos (recebe_sequenc)  -- faz referencia de um numero inteiro com a pk da tabela principal meus contatos 
);

INSERT INTO salario
(salario_atual,recebe_sequenc)
VALUES
-- exemplo (4000, 0), do que fazer depois , um user pode ter mais de 1 telefone , ex do modo 2 de comunicação de tabela 1 pra varios , 1 pessoa pode ter varios teleefones
(4000, 0),
(4500, 13),
(3000, 26),
(2500, 39),
(4800, 52),
(3500, 65),
(4900, 78),
(2000, 91),
(2000, 104);

DROP TABLE salario

ALTER TABLE meus_contatos DROP COLUMN salario_atual;

-- q9 
SELECT * FROM telefones;

CREATE TABLE telefones (
    id_telefone SERIAL PRIMARY KEY,
    numero VARCHAR(30),
    recebe_sequenc INT REFERENCES meus_contatos (recebe_sequenc)
);

INSERT INTO telefones
(numero,recebe_sequenc)
VALUES
('61999110005', 0),
('62991231234', 13),
('61998334567', 26),
('62998445678', 39),
('61999556789', 52),
('62998767890', 65),
('61999878901', 78),
('62991189012', 91), 
('61998291023', 104); 

-- q 10 
DROP TABLE interesses
DROP TABLE meus_contatos_interesse
SELECT * FROM interesses
SELECT * FROM meus_contatos_interesse

CREATE TABLE interesses (
   id_interesse SERIAL PRIMARY KEY,
   interesse VARCHAR(30)
);

CREATE TABLE meus_contatos_interesse (
    recebe_sequenc INT REFERENCES meus_contatos(recebe_sequenc),
    id_interesse INT REFERENCES interesses(id_interesse),
    CONSTRAINT interesses_meus_contatos PRIMARY KEY (recebe_sequenc, id_interesse)
);

INSERT INTO interesses
(interesse)
VALUES
('Teconologia'),
('Viagens'),
('Balada'),
('Rpg'),
('Videogame');

INSERT INTO meus_contatos_interesse (recebe_sequenc, id_interesse)
VALUES
(0, 1),  -- Contato com ID 0 tem interesse em Tecnologia (id_interesse 1)
(0, 2),  
(13, 3), -- Contato com ID 13 tem interesse em Balada (id_interesse 3)
(13, 4), 
(26, 5), -- Contato com ID 26 tem interesse em Videogame (id_interesse 5)
(26, 1),
(39, 2),
(39, 3),
(52, 4),
(52, 5),
(65, 1),
(65, 2),
(78, 3),
(78, 4),
(91, 5),
(91, 1),
(104, 2),
(104, 3);
