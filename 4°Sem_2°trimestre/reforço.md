# Sistema de Gerenciamento de Banco de Dados (SGBD)

## Baseado em tabelas e relacionamentos

### Estrutura da Tabela
- **Tuplas**: Linhas da tabela  
- **Argumentos**: Colunas da tabela  

---

## Diferença entre `UNIQUE` e Chave Primária
- **Chave Primária**: Não permite valores nulos.  
- **UNIQUE**: Permite valores nulos.  

---

## Diferença entre `ALTER TABLE` e `UPDATE`
- **Alter table**: comando para alterar estrutura da tabela.  
- **UPDATE + SET**: comando para alterar tuplas da tabela.
## Exemplos em SQL


 ```sql
SELECT * FROM tabela_aleatoria; 
DROP TABLE tabela_aleatoria;

CREATE TABLE tabela_aleatoria (
    nome VARCHAR(30),
	idade INT,
	data_nasci DATE,
	saldo DECIMAL(10,2)
);

INSERT INTO tabela_aleatoria
VALUES
('teste',39,'10-05-2002',159.60)

-----------------------------------
SELECT * FROM tab_sandir; 
DROP TABLE tab_sandir;

CREATE TABLE tab_sandir (
    nome VARCHAR(30),
	idade INT,
	data_nasci DATE,
	argumento4 time,
	argumento5 timestamp,
	argumento6 boolean,
	saldo DECIMAL(10,2)
);

INSERT INTO tab_sandir (nome, idade, data_nasci, argumento4, argumento5, argumento6, saldo) 
VALUES (
    'João Silva',       -- Nome fictício
    25,                 -- Idade
    '1999-05-15',       -- Data de nascimento
    '12:30:00',         -- Hora fictícia
    '2024-11-20 14:00:00', -- Timestamp fictício
    TRUE,               -- Valor booleano
    1250.75             -- Saldo fictício
);

--------------------------------------------------------
SELECT * FROM pessoa; 
DROP TABLE pessoa;

CREATE TABLE pessoa (
   id_pessoa SERIAL PRIMARY KEY,
   nome VARCHAR(30),
   telefone NUMERIC(11),
   email VARCHAR(60)
);

---------------------------------------------
SELECT * FROM pedidos; 
DROP TABLE pedidos;

CREATE TABLE pedidos(
   id_pedido SERIAL,
   id_cliente INT,
   data_pedido DATE,
   PRIMARY KEY (id_pedido,id_cliente)
);

INSERT INTO pedidos (id_cliente, data_pedido)
VALUES 
(1026, '10-05-2003'),
(1078, '11-09-2002'),
(3045, '20-09-2002');

-- adicionar colluna 
ALTER TABLE pedidos ADD COLUMN coluna_nova VARCHAR(30);
-- apagar coluna
ALTER TABLE pedidos DROP COLUMN coluna_nova;
--mudar nome  do campo 
ALTER TABLE pedidos ADD COLUMN coluna_nova VARCHAR(20);
ALTER TABLE pedidos RENAME COLUMN coluna_nova TO quantidade;

-- alterar tipo de dado da coluna 
ALTER TABLE pedidos ALTER COLUMN quantidade TYPE INT;

--trataneto de erro usandi USING 
ALTER TABLE pedidos ALTER COLUMN quantidade TYPE INT USING quantidade::integer; -- GPT
ALTER TABLE pedidos ALTER COLUMN quantidade TYPE VARCHAR;


 ```
# Parte 2
```sql

----------------------------------------------------------------

SELECT * FROM pai;
DROP TABLE pai;

CREATE TABLE pai (
    id_col  SERIAL,
    coluna1 VARCHAR(30),
    coluna2 INT,
    PRIMARY KEY (id_col)
);

INSERT INTO pai(coluna1,coluna2)
VALUES
('teste',345),
('luan',22),
('sandir',33)

UPDATE pai SET coluna2 = 11 WHERE id_col = 1
UPDATE pai SET coluna2 = 54 WHERE id_col = 2
UPDATE pai SET coluna2 = 21 WHERE id_col = 3

--------------------------------------------------------------------------

SELECT * FROM filho;
DROP TABLE filho;

CREATE TABLE filho (
    id_col2 SERIAL ,
    coluna1 VARCHAR(50),
    chave_estrangeira INTEGER REFERENCES pai (id_col),
	PRIMARY KEY (id_col2)
);

INSERT INTO filho
VALUES
(1,'sanduiche de bacon',1)

ALTER TABLE filho DROP CONSTRAINT filho_pkey  -- removendo pk dessa tabela 
ALTER TABLE filho ADD CONSTRAINT filho_pkey PRIMARY KEY (id_col2) -- adicionando pkey 

---------------------------------------------------------------

SELECT * FROM outro_filho;
DROP TABLE outro_filho;

CREATE TABLE outro_filho(
    id_col3 SERIAL,
	coluna1 VARCHAR(30),
	coluna2 INT
);

ALTER TABLE outro_filho
ADD CONSTRAINT outro_filho_pkey PRIMARY KEY (id_col3)

ALTER TABLE outro_filho 
ADD CONSTRAINT OUTRO_FILHO_FK FOREIGN KEY (coluna2) REFERENCES pai (id_col);

-----------------------------------------------------------------

```
