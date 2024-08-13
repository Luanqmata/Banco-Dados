
CREATE SEQUENCE sequencia1
	INCREMENT 10
	MINVALUE 1
	MAXVALUE 999999
	START 1
	CACHE 1;

SELECT * FROM sequencial /* mostrar tebela*/ 

/* TESTAR */ SELECT NEXTVAL('sequencia1');

/* INSERIR VALOR */ INSERT INTO Laboratorio1 (id) VALUES (NEXTVAL('sequencia1'));

/* CRIANDO TABELA */
CREATE TABLE table1 (
    id_table1 INT PRIMARY KEY,
    versao INT
);

/* CRIANDO SEQUENCIA */
CREATE SEQUENCE sequencia1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    START WITH 1
    CACHE 1;

/* INSERIR VALOR */
INSERT INTO table1 (id_table1, versao)
VALUES (NEXTVAL('sequencia1'), 34);
