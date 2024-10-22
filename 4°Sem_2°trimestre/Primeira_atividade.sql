DROP TABLE IF EXISTS TB_INICIAIS;
DROP TABLE IF EXISTS super_herois;
DROP TABLE IF EXISTS TB_ARQUIINIMIGO;
DROP TABLE IF EXISTS TB_CIDADE;

CREATE TABLE TB_INICIAIS (
    ID_INICIAL INT PRIMARY KEY,
    INICIAIS CHAR(2)
);

INSERT INTO TB_INICIAIS (ID_INICIAL, INICIAIS) 
VALUES (1, 'JW');

------------------------------------------------------------------------------------

CREATE TABLE TB_CIDADE (
    ID_CIDADE INT PRIMARY KEY,
    NOME_CIDADE VARCHAR(30) NOT NULL
);

INSERT INTO TB_CIDADE (ID_CIDADE, NOME_CIDADE)
VALUES (1, 'Formosa');
------------------------------------------------------------------------------------

CREATE TABLE super_herois (
    ID INT PRIMARY KEY,
    NOME VARCHAR(30),
    PODER VARCHAR(30),
    FRAQUEZA VARCHAR(30),
    INCIAIS INT,
    PAIS VARCHAR(30),
    ID_CIDADE INT,
    FOREIGN KEY (INCIAIS) REFERENCES TB_INICIAIS (ID_INICIAL),
    FOREIGN KEY (ID_CIDADE) REFERENCES TB_CIDADE(ID_CIDADE)
);

INSERT INTO super_herois (ID, NOME, PODER, FRAQUEZA, INCIAIS, PAIS, ID_CIDADE) 
VALUES (1, 'James Webb', 'Super visualização', 'Escuro', 1, 'Brazil', 1);

------------------------------------------------------------------------------------

CREATE TABLE TB_ARQUIINIMIGO (
    ID_ARQUIINICIAL INT PRIMARY KEY,
    INICIAIS_ARQUI CHAR(2) NOT NULL,
    ARQUIINIMIGO VARCHAR(30) NOT NULL,
    ID_ARQUIINIMIGO INT UNIQUE NOT NULL,
    ID_CIDADE INT,
    ID_SUPER_HEROI INT,
    FOREIGN KEY (ID_SUPER_HEROI) REFERENCES super_herois(ID),
    FOREIGN KEY (ID_CIDADE) REFERENCES TB_CIDADE(ID_CIDADE)
);

INSERT INTO TB_ARQUIINIMIGO (ID_ARQUIINICIAL, INICIAIS_ARQUI, ARQUIINIMIGO, ID_ARQUIINIMIGO, ID_CIDADE, ID_SUPER_HEROI)
VALUES (1, 'LT', 'Lex Luthor', 101, 1, 1);  

------------------------------------------------------------------------------------

SELECT * FROM super_herois; -- FIM DA PRIMEIRA 

------------------------------------------------------------------------------------
DROP TABLE funcionario;
DROP TABLE tb_cursos;

CREATE TABLE funcionario (
    ID_FUNCIONARIO SERIAL PRIMARY KEY,
    NOME_INSTRUTOR VARCHAR(50),
    NUMERO_INSTRUTOR NUMERIC(11)
);

CREATE TABLE tb_cursos (
    ID_CURSO SERIAL PRIMARY KEY,
    NOME_CURSO VARCHAR(50),
    ID_FUNCIONARIO INT,
    FOREIGN KEY (ID_FUNCIONARIO) REFERENCES funcionario(ID_FUNCIONARIO)
);

INSERT INTO funcionario (NOME_INSTRUTOR, NUMERO_INSTRUTOR)
VALUES ('Carlos Silva', 12345678901);

INSERT INTO tb_cursos (NOME_CURSO, ID_FUNCIONARIO)
VALUES ('Programação em SQL', 1);

SELECT * FROM funcionario;
SELECT * FROM tb_cursos;

--------------------------------------------------------------------------------------
