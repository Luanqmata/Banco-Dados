# -- Criando TAB exemplo :
-------------------------
```sql
CREATE TABLE clientes_antigos(
	nome VARCHAR(30),
    Email VARCHAR(40),
    telefone TEXT,
    Idade INT
);

INSERT INTO clientes_antigos(nome, email, telefone, Idade)
VALUES('Jorge Massafo', 'jorgemassafo44@gmail.com', '6199601023', 15),
('Mariana Kernel', 'kernel.Maria@outlook.com', '21998765432', 28),
('Carlla Mendes', 'carllaM12@gmail.com', '31987651234', 45),
('Ana Costa', 'ana.costa@hotmail.com', '41987646789', 29),
('Pedro Blasinsk', 'pedroB@outlook.com', '51987657876', 37),
('Fernando Borges', 'fernando.bor90@gmail.com', '61987653456', 42),
('Richard Santiago', 'SantiagoR3@gmail.com', '62987657890', 50),
('Marck Cleiborn', 'Cleiborn007@outlook.com', '6199672330', 12),
('Marta Cristina', 'MartaCristina0890@gmail.com', '6299862203', 18);
```
--------------------
# -- TAbela a ser populada
----------------
```sql
CREATE TABLE clientes_novos(
	nome VARCHAR(30),
    Email VARCHAR(40),
    telefone Text,
    idade INT
);
```
---------------------
# -- Upando dados de uma tabela com filtros
---------------------
```sql
INSERT INTO clientes_novos(nome, Email, telefone) SELECT nome, Email, telefone FROM clientes_antigos WHERE idade >=18;
-- Inserção com SELECT
--- UPAR DADOS DE UMA TABELA EXISTENTE PARA OUTRA FILTRNADO APENAS MAIORES DE 18

-- inserção com Order By
INSERT INTO clientes_novos(nome, Email, telefone) SELECT nome, Email, telefone FROM clientes_antigos ORDER BY nome;
--- UPAR DADOS DE UMA TABELA EXISTENTE PARA OUTRA FILTRNADO POR NOME 

```
----------------
# -- Inserção baseada em tabela antiga com condição específica 
-----------------
```sql
CREATE TABLE clientes_novissimos SELECT * FROM clientes_antigos;

CREATE TABLE clientes_novissimos_atual SELECT * FROM clientes_antigos WHERE idade > 18;

CREATE TABLE clientes_nov SELECT * FROM clientes_novsissimos_atual;
```
