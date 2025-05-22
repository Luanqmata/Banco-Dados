use aula_21_05_lbsc;

CREATE TABLE alunos(
	id_alunos INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO alunos (nome, email) VALUES
('Ana Beatriz Lima', 'ana.lima@email.com'),
('Carlos Eduardo Silva', 'carlos.silva@email.com'),
('Fernanda Oliveira', 'fernanda.oliveira@email.com'),
('João Pedro Martins', 'joao.martins@email.com'),
('Mariana Costa', 'mariana.costa@email.com'),
('Rafael Souza', 'rafael.souza@email.com');

CREATE INDEX IDX_nome ON alunos(nome);

-- -----------------------------------------------------------

CREATE TABLE artigos(
	id_artigos INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200),
    conteudo TEXT,
    FULLTEXT(titulo, conteudo)
);

INSERT INTO artigos (titulo, conteudo) VALUES
(
  'A Importância da Cibersegurança nas Empresas Modernas',
  'Com o avanço da transformação digital, empresas de todos os portes enfrentam ameaças constantes no ambiente virtual. Investir em políticas de segurança da informação, conscientização dos colaboradores e soluções de monitoramento contínuo é essencial para proteger dados sensíveis e garantir a continuidade dos negócios.'
),
(
  'Redes de Computadores: Fundamentos e Aplicações',
  'As redes de computadores são a espinha dorsal da comunicação digital. Compreender os protocolos de comunicação, os modelos OSI e TCP/IP, além dos dispositivos envolvidos, é fundamental para projetar, implementar e gerenciar infraestruturas eficientes e seguras.'
),
(
  'Introdução ao Machine Learning: Conceitos e Aplicações Práticas',
  'Machine Learning é um ramo da inteligência artificial focado no desenvolvimento de algoritmos que aprendem com dados. Suas aplicações variam desde recomendações personalizadas até detecção de fraudes, tornando-se uma ferramenta poderosa para análise preditiva em diversos setores.'
);

SELECT * FROM artigos WHERE MATCH( titulo, conteudo) AGAINST('Machine' IN BOOLEAN MODE);
SELECT * FROM artigos WHERE MATCH( titulo, conteudo) AGAINST('artificial');

SHOW INDEX FROM artigos;

DROP INDEX idx_nome ON table_nam;
-- -------------------------
CREATE INDEX idx_nome_email ON alunos(nome,email);

SELECT * FROM alunos WHERE nome = 'João Pedro Martins' AND email = 'joao.martins@email.com';

-- -------------------------
-- EXPLAIN

EXPLAIN SELECT * FROM alunos WHERE nome = 'joão'; -- comando para fazer monitoramento do funcionamento do banco dedados

-- PRATICANDO EXPLAIN ------

CREATE TABLE motos_zikas(
	id_moto SERIAL PRIMARY KEY,
	nome_modelo VARCHAR(300)
);

INSERT INTO motos_zikas() 
VALUES 
(01,'MT-03'),
(02,'R15'),
(03,'R3'),
(04,'mt-07'),
(05,'mt-09'),
(06,'Hornet'),
(07,'XJ6'),
(08,'Cb-300');

INSERT INTO motos_zikas() 
VALUES 
(09,'CB650'),
(10,'CB650R'),
(11,'KAWASAKI NINJA');

EXPLAIN SELECT * FROM motos_zikas WHERE nome_modelo ='KAWA';

-- -------
-- FUN 


DELIMITER //

CREATE FUNCTION somar(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN a + b;
END;
//
DELIMITER ;

SELECT somar(10,5);

-- ------
-- PROCIDURE

CREATE TABLE usuarios2 (
  nome VARCHAR(50)
);

DELIMITER //

CREATE PROCEDURE inserir_usuario(IN nome_inserido VARCHAR(50))
BEGIN
  INSERT INTO usuarios2(nome) VALUES (nome_inserido);
END;
//

DELIMITER ;

CALL inserir_usuario('João');
CALL inserir_usuario('Maria');

SELECT * FROM usuarios2;

