SELECT * FROM meus_contatos;
DROP TABLE meus_contatos;

CREATE TABLE meus_contatos (
    id_contato SERIAL,
    sobrenome VARCHAR(50),
    primeiro_nome VARCHAR(50),
    telefone NUMERIC(11),
    email VARCHAR(100),
    sexo CHAR(1),
    data_nascimento DATE,
    profissao VARCHAR(100),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    estado_civil VARCHAR(20),
    interesses TEXT,
    procura TEXT
);

INSERT INTO meus_contatos (sobrenome, primeiro_nome, telefone, email, sexo, data_nascimento, profissao, cidade, estado, estado_civil, interesses, procura)
VALUES 
('Campos', 'Sandir', 6181335430, 'sandir.campos@iesgo.edu.br', 'M', '1980-03-12', 'Professor de BD, JS, CSS', 'Formosa', 'GO', 'Casado', 'Tecnologia, Educação', 'Rodou man?!?!?!'),
('Heriberto', 'Romes', 6196538575, 'romes.hiberto@iesgo.edu.br', 'M', '1960-02-17', 'Professor de C#', 'Gringa', 'USA', 'Casado', 'Tecnologia, back end', 'Miojos orientais'),
('Sousa', 'Marcus', 6196432212, 'marcus.sousa@iesgo.edu.br', 'M', '1979-04-10', 'Professor de Matemática Lógica', 'Formosa', 'GO', 'Casado', 'Matemática, Marketplace digital', 'Do shape inexplicável'),
('Alves', 'Juliana', 6286424628, 'juliana.alves@iesgo.edu.br', 'F', '1990-05-25', 'Professora de Autômatos', 'Planaltina', 'DF', 'Casada', 'Sistemas, Autômatos', 'Explicar para todos'),
('Gress', 'João', 1196835978, 'joao.gress@iesgo.edu.br', 'M', '1998-01-14', 'Professor de Redes', 'São Paulo', 'SP', 'Casado', 'Hackear pelo bem, proteger', 'Estar inrrastreável e seguro'),
('Ferreira', 'Ana', 1197896542, 'ana.ferreira@iesgo.edu.br', 'F', '1985-07-23', 'Professora de Inteligência Artificial', 'Curitiba', 'PR', 'Solteira', 'Tecnologia, IA, Machine Learning', 'Desenvolver '),
('Santos', 'Pedro', 2196345783, 'pedro.santos@iesgo.edu.br', 'M', '1975-10-30', 'Professor de Segurança da Informação', 'Rio de Janeiro', 'RJ', 'Casado', 'Criptografia, Segurança digital', 'Manter sistemas seguros'),
('Lima', 'Beatriz', 3197284651, 'beatriz.lima@iesgo.edu.br', 'F', '1992-05-14', 'Professora de Programação Mobile', 'Belo Horizonte', 'MG', 'Solteira', 'Desenvolvimento de apps, UX/UI', 'Criar apps'),
('Almeida', 'Lucas', 6198321457, 'lucas.almeida@iesgo.edu.br', 'M', '1988-11-22', 'Professor de Cloud Computing', 'Brasília', 'DF', 'Casado', 'Cloud, DevOps, Infraestrutura', 'Implementar infraestruturas');


------------

ALTER TABLE meus_contatos ADD CONSTRAINT pk_meus_contatos PRIMARY KEY (telefone, id_contato);

-----------
ALTER TABLE meus_contatos ADD COLUMN iniciais_primeiro_nome VARCHAR(2);

UPDATE meus_contatos
SET iniciais_primeiro_nome = SUBSTRING(primeiro_nome, 1, 2);
-----------
ALTER TABLE meus_contatos ADD COLUMN ddd_estado VARCHAR(50);

UPDATE meus_contatos
SET ddd_estado = CONCAT(SUBSTRING(telefone::TEXT, 1, 2), ' - ', estado);
----------
ALTER TABLE meus_contatos
ADD COLUMN horas_minima INT;

ALTER TABLE meus_contatos
ADD CONSTRAINT horas_minima_check CHECK (horas_minima >= 4);

UPDATE meus_contatos   -- adicionador de int
SET horas_minima = 5    --adicionando a hora (minima 4)
WHERE id_contato = 9;  --adicionando de acordo com PK
-----------

CREATE SEQUENCE sequencia1_13
	INCREMENT 13
	MINVALUE 0
	MAXVALUE 999999
	START 0
	CACHE 1;
	
DROP SEQUENCE sequencia1_13;

-----------
ALTER TABLE meus_contatos
ADD COLUMN recebe_sequenc INT;

UPDATE meus_contatos
SET recebe_sequenc = nextval('sequencia1_13');

ALTER TABLE meus_contatos
ADD CONSTRAINT unique_recebe_sequenc UNIQUE (recebe_sequenc);

----------------
SELECT * FROM pessoas -- facilitar manuseio
CREATE TABLE pessoas (
    id_pessoa SERIAL PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    recebe_sequenc INT UNIQUE,  
    FOREIGN KEY (recebe_sequenc) REFERENCES meus_contatos(recebe_sequenc)
);

INSERT INTO pessoas (cpf, recebe_sequenc)
VALUES
('12345678909', 0),
('98765432100', 13),
('12378945630', 26),
('45612378901', 39),
('32165498700', 52),
('65432198765', 65),
('78945612300', 78),
('14725836901', 91),
('36925814780', 104);

------

SELECT * FROM motos; -- ver se deu certo
DROP TABLE motos; -- usar caso algo de errado

CREATE TABLE motos (
    id_moto SERIAL PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    recebe_sequenc INT,
    FOREIGN KEY (recebe_sequenc) REFERENCES meus_contatos(recebe_sequenc)
);

INSERT INTO motos (modelo, recebe_sequenc)
VALUES 
('Honda CB 500', 0),
('Yamaha MT-03', 0),
('Suzuki GSX-R750', 13),
('Kawasaki Ninja', 13),
('BMW R1250GS', 26),
('Ducati Monster', 26),
('Harley Davidson', 39),
('Honda XRE 300', 52),
('Yamaha Fazer 250', 52),
('KTM Duke 200', 65),
('Honda CG 150', 78),
('Yamaha NMAX', 91),
('Suzuki Intruder', 104);

-------
SELECT * FROM tipos_uso;
CREATE TABLE tipos_uso (  -- pt1 criar a tabela que ira se relacionar
    id_tipo SERIAL PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

INSERT INTO tipos_uso (descricao)
VALUES 
('Trilha'),
('Pista'),
('Autódromo'),
('Off Road'),
('Rolezinho'),
('Bode');
-- pt2 criar a tabela filho que ira fazer o intercalamento da comunicação das duas tabelas
CREATE TABLE moto_tipo_uso (
    id_moto INT,
    id_tipo INT,
    PRIMARY KEY (id_moto, id_tipo),
    FOREIGN KEY (id_moto) REFERENCES motos(id_moto),
    FOREIGN KEY (id_tipo) REFERENCES tipos_uso(id_tipo)
);

INSERT INTO moto_tipo_uso (id_moto, id_tipo)
VALUES 
(1, 1),
(1, 2),
(2, 2),
(2, 4),
(3, 2),
(4, 5),
(5, 1),
(6, 3),
(7, 6),
(8, 1),
(9, 4);




----- mostrar elas se relacionando
SELECT 
    m.modelo AS moto,
    tu.descricao AS tipo_uso
FROM 
    motos m
JOIN 
    moto_tipo_uso mtu ON m.id_moto = mtu.id_moto
JOIN 
    tipos_uso tu ON mtu.id_tipo = tu.id_tipo;
