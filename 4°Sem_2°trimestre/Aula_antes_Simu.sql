CREATE TABLE banco (
	funcao VARCHAR(20),
	data_inicio DATE,
	data_fim DATE
)

insert into banco
VALUES	
('caixa','22/08/2008',null),
('caixa','22/08/2006','22/08/2008')

SELECT * FROM banco
WHERE data_fim is null
AND NOT
(funcao='caixa' OR data_inicio < '01/01/2007')

insert into banco
values
('gerente','22/08/2008',null)

insert into banco
values
('supervisor','22/08/2005',null)

----------------- extraindo
--ver data atual
select current_date

--ver somente o ano
select extract('year' from current_date)  --ver somente o ano atual
-- ver a hora no banco de dados 
select now();
-- extrair o na hora 
select date_part('year',now())
-- para mes 
select date_part('month',now())
-- para dia
select date_part('day',now())
-- para tempo
select date_part('hour',now())
-- minutos
select date_part('minute', now())
--segundos
select date_part('second', now())

----------------------------------------------------
create table empregado (
   id_empregado SERIAL,
   nome VARCHAR(30),
   sobrenome VARCHAR(15),
   data_inicio DATE
)

SELECT * FROM empregado
DROP TABLE empregado

INSERT INTO empregado (nome,sobrenome,data_inicio)
VALUES
('luan','calazans','01/01/2007'),
('luan','halbert','01/01/2008'),
('luan','james','01/01/2003'),
('luan','silva','01/01/2005'),
('luan','selva','01/01/2006'),
('luan','cleito','01/01/2009')

SELECT id_empregado, nome, sobrenome, data_inicio
FROM empregado
WHERE data_inicio BETWEEN '2005-01-01' AND '2007-12-31';

-- adicionando Nome com segunda letra A e no meio letra E
INSERT INTO empregado (nome,sobrenome,data_inicio)
VALUES
('laean','SILVESTRE','01/01/2007')

-- BUSCANDO COM _ E % (ELEMENTOS CURINGA)  [segunda letra ]
SELECT nome
FROM empregado 
WHERE nome LIKE '_a%e%'

---- adicionando coluna cordenardor
ALTER TABLE empregado 
ADD COLUMN id_coordenador INT

-- adicionando 1 com id cordenador preenchido
INSERT INTO empregado (nome,sobrenome,data_inicio,id_coordenador)
VALUES
('laean','testes','01/01/2007',38)

-- BUSCAR TODOS OS VALORES NULOS
SELECT id_empregado,nome,sobrenome,id_coordenador
FROM empregado
WHERE id_coordenador IS NULL

-- BUSCAR TODOS VALORES NAO NULOS
SELECT id_empregado,nome,sobrenome,id_coordenador
FROM empregado
WHERE id_coordenador IS NOT NULL

SELECT * FROM empregado
	/*  INSERT DE PABLO  (nome da tabela dele ta funcionario)
	
SELECT id_empregado, nome_func, sobrenome_func, data_inicio
FROM funcionario
WHERE data_inicio <'01-01-2007'
AND data_inicio >='01-01-2005';

SELECT id_empregado, nome_func, sobrenome_func, data_inicio
FROM funcionario
WHERE data_inicio <'01-01-2005'
AND data_inicio >='01-01-2000';

SELECT id_empregado, nome_func, sobrenome_func, data_inicio
FROM funcionario
WHERE data_inicio <'01-01-2009'
AND data_inicio >='01-01-2000';

SELECT id_empregado, nome_func, sobrenome_func, data_inicio
FROM funcionario
WHERE data_inicio <='01-01-2007';


SELECT id_empregado, nome_func, sobrenome_func, data_inicio
FROM funcionario
WHERE data_inicio ='01-01-2007';

SELECT id_empregado, nome_func, sobrenome_func, data_inicio
FROM funcionario
WHERE data_inicio BETWEEN '01-01-2005' AND '31-12-2006';

*/
--------------------------------------------------------
CREATE TABLE conta (
    id_conta SERIAL,
    cod_produto VARCHAR(3),
    id_cliente SERIAL,
    saldo_disponivel DECIMAL
);

INSERT INTO conta (cod_produto, saldo_disponivel)
VALUES
('CHE', 455.50),
('CHE', 305.50),
('CHE', 205.50),
('CDC', 1005.50),
('CIV', 4000.50),
('CNS', 45.00);

-- TODOS
SELECT id_conta,cod_produto,id_cliente,saldo_disponivel FROM conta WHERE cod_produto = 'CHE'
OR cod_produto = 'CDC'
OR cod_produto = 'CIV'
OR cod_produto = 'CNS'
-- SEM CHE 
SELECT id_conta,cod_produto,id_cliente,saldo_disponivel FROM conta WHERE cod_produto != 'CHE'
OR cod_produto = 'CDC'
OR cod_produto = 'CIV'
OR cod_produto = 'CNS'
-------- COM CHE 
SELECT id_conta,cod_produto,id_cliente,saldo_disponivel FROM conta WHERE cod_produto = 'CHE'
AND cod_produto != 'CDC'
AND cod_produto != 'CIV'
AND cod_produto != 'CNS'

-- COM  NOT IN (nao mostrar oq vc seleciona)
SELECT id_conta,cod_produto,id_cliente,saldo_disponivel FROM conta 
WHERE cod_produto NOT IN('CDC','CIV','CNS')

-- COM IN (mostrar oq vc quer)
SELECT id_conta,cod_produto,id_cliente,saldo_disponivel FROM conta 
WHERE cod_produto IN('CDC','CIV','CNS')

SELECT * FROM conta;
DROP TABLE conta;

--------------------------------------------------
SELECT * FROM cidade;
DROP TABLE cidade;

CREATE TABLE cidade (
id_cidade SERIAL,
nome_cidade VARCHAR(30),
codigo_estado CHAR(2)
)

INSERT INTO cidade(nome_cidade,codigo_estado)
VALUES
('FORMOSA' , 'GO'),
('SALVADOR' , 'BA'),
('SAO PAULO' , 'SP'),
('SANTOS' , 'SP'),
('MANAUS' , 'AM'),
('CURITIBA' , 'PR')

--imprimir cidades com letra S (primeira letra da esquerda)
select id_cidade,nome_cidade,codigo_estado
FROM public.cidade
WHERE LEFT(nome_cidade,1)='S';

-- imprimir cidades diferente de letra S (primeira letra da esquerda)
select id_cidade,nome_cidade,codigo_estado
FROM public.cidade
WHERE LEFT(nome_cidade,1)!='S';

-- ADICIONANDO SORTE 
INSERT INTO cidade(nome_cidade,codigo_estado)
VALUES
('SORTE','SO');

-- imprimir as duas primeiras letras da esquerda = SO
select id_cidade,nome_cidade,codigo_estado
FROM public.cidade
WHERE LEFT(nome_cidade,2)='SO';


-----------------------==================================----------------------------

-- DESAFIO AULA (EXERCICIOS)

DROP TABLE ultima_tabela;

SELECT * FROM ultima_tabela;

CREATE TABLE ultima_tabela (
    Tnx_id SERIAL,
	Tnx_date DATE,
	Conta_id NUMERIC(3),
	Tnx_cod_tipo VARCHAR(3),
	quantia DECIMAL(10,2)
)

INSERT INTO ultima_tabela(Tnx_date,Conta_id,Tnx_cod_tipo,quantia)
VALUES
('22/02/2005',101,'CDT',1000.00),
('23/02/2005',102,'CDT',525.75),
('24/02/2005',101,'DBT',100.00),
('24/02/2005',103,'CDT',55),
('25/02/2005',101,'DBT',50),
('25/02/2005',103,'DBT',25),
('25/02/2005',102,'CDT',125.37),
('26/02/2005',103,'DBT',10),
('27/02/2005',101,'CDT',75)

--- Q1 adicionar filtro [  Tnx_date<'26/02/2005' AND(Tnx_cod_tipo='DBT' OR quantia >100)  ])
SELECT Tnx_date,Conta_id,Tnx_cod_tipo,quantia
FROM ultima_tabela
WHERE Tnx_date < '2005-02-26'
  AND (Tnx_cod_tipo = 'DBT' OR quantia > 100);

--- Q2 adicionar o filtro [   Conta_id IN (101,103) AND NOT (Tnx_cod_tipo='DBT' OR quantia>100)   ]
SELECT Tnx_date,Conta_id,Tnx_cod_tipo,quantia
FROM ultima_tabela
WHERE Conta_id IN (101,103)
  AND NOT (Tnx_cod_tipo='DBT' OR quantia>100)

--- Q3 CRIAR UMA TABELA E BUSCAR TODAS CONTAS ABERTAS EM 2002

SELECT * FROM registro;
DROP TABLE registro;

CREATE TABLE registro (
   id_pessoa SERIAL,
   data_inscricao DATE,
   nome_sobrenome VARCHAR(50)
)

INSERT INTO registro(data_inscricao,nome_sobrenome)
VALUES
('10/10/2005','ROBERTO JUSTOS'),
('20/09/2002','lUAN CALAZANS'),
('05/08/2002','SANDIR CAMPOS'),
('01/01/2001','MICHAEL JACKSON'),
('06/06/2002','BUCKET HEAD'),
('20/05/2002','OLAVO DE CARVALHO'),
('05/08/2008','JAMES WEB'),
('20/02/2002','HILARY CLINTON')

-- FILTRAR TODOS DE 2002 
SELECT id_pessoa,data_inscricao,nome_sobrenome
FROM registro
WHERE EXTRACT(YEAR FROM data_inscricao) = 2002; -- OU PODERIA -- [   WHERE data_inscricao BETWEEN '2002-01-01' AND '2002-12-31'   ];

-- Q4 
SELECT * FROM clientes_nao_corporativos;

CREATE TABLE clientes_nao_corporativos (
   id_nao_corporativo SERIAL,
   nome VARCHAR(30),
   sobrenome VARCHAR(25)
)

INSERT INTO clientes_nao_corporativos(nome,sobrenome)
VALUES
('Luan','calazans'),
('Bill','Gaets'),
('Chalim','Bronx'),
('Platao','Sarue'),
('James','Waeb'),
('Elon','Maske'),
('Anonymous','laerte'),
('MC','Daleste')

-- FILTRAR TODOS COM A SEGUNDA LETRA SENDO A E LETRAS E DEPOIS DA LETRA A
SELECT nome,sobrenome
FROM clientes_nao_corporativos 
WHERE sobrenome LIKE '_a%e%'
