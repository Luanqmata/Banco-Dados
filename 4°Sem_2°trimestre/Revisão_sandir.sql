--Feito por Pablo

﻿--Revisão BANCO DE DADOS
--Agregação e agrupamentos

CREATE TABLE conta
(
	id_conta SERIAL,
	id_funcionario_abertura INT,
	tipo_de_conta VARCHAR(5),
	valor_limite NUMERIC(11,2),
	saldo NUMERIC(10,2),
	local_agencia VARCHAR(60)
);
INSERT INTO conta(id_funcionario_abertura, tipo_de_conta, valor_limite, saldo, local_agencia)
VALUES(4, 'CHE', 10000.00, 35000.00, 'SÃO PAULO'),
(1, 'CNS', 4500.00, 2000.00, 'RIO DE JANEIRO'),
(1, 'CIV', 36600.00, 12000.00, 'RIO DE JANEIRO'),
(1, 'CHE', 80000.00, 68000.00, 'RIO DE JANEIRO'),
(1, 'CDC', 2000.00, 1500.00, 'RIO DE JANEIRO'),
(4, 'CIV', 9600.00, 1800.00, 'SÃO PAULO'),
(2, 'CIV', 25000.00, 22000.00, 'GRAMADO'),
(2, 'CNS', 45000.00, 18000.00, 'GRAMADO'),
(3, 'CDC', 3000.00, 2700.00, 'VILA BOA'),
(3, 'CHE', 30000.00, 28000.00, 'VILA BOA'),
(3, 'CIV', 32000.00, 10000.00, 'VILA BOA'),
(4, 'CNS', 2500.00, 2500.00, 'SÃO PAULO'),
(5, 'CDS', 4000.00, 3800.00, 'OURO PRETO'),
(2, 'CDC', 650.00, 4500.00, 'GRAMADO'),
(4, 'CHE', 4800.00, 4200.00, 'SÃO PAULO'),
(3, 'CHE', 1500.00, 4000.00, 'VILA BOA'),
(5, 'CIV', 50000.00, 52000.00, 'OURO PRETO'),
(5, 'CNS', 100.00, 6000.00, 'OURO PRETO'),
(5, 'CDC', 550.00, 5200.00, 'OURO PRETO'),
(3, 'CNS', 10.00, 5800.00, 'VILA BOA'),
(2, 'CNS', 60000.00, 5500.00, 'GRAMADO'),
(5, 'CDC', 6300.00, 7000.00, 'BRASÍLIA'),
(2, 'CIV', 6500.00, 25000.00, 'GRAMADO'),
(2, 'CHE', 1500.00, 65200.00, 'GRAMADO');

SELECT * FROM conta
 

SELECT id_funcionario_abertura FROM conta
GROUP BY id_funcionario_abertura

------------------------------------------
SELECT id_funcionario_abertura, COUNT(*)quantidade_contas_abertas
FROM conta
GROUP BY id_funcionario_abertura
ORDER BY id_funcionario_abertura

SELECT COUNT(*) FROM conta

-------------------------------------------
--EX:
SELECT id_funcionario_abertura,
COUNT (*) FROM conta
WHERE id_funcionario_abertura=1
GROUP BY id_funcionario_abertura

--PARA ATRIBUIR NOME: 
SELECT id_funcionario_abertura,
COUNT (*) quantidade_contas_abertas FROM conta
WHERE id_funcionario_abertura=1
GROUP BY id_funcionario_abertura

--Filtrar agrupamento
/*Sempre que houver a necessidade de utilizar o GROUP BY, utilizaremos o HEAVING*/
SELECT id_funcionario_abertura, COUNT(*) quantidade_contas_abertas
FROM conta
GROUP BY id_funcionario_abertura
HAVING COUNT(*)>4

------------------------------------------------------
UPDATE conta SET id_funcionario_abertura = 2 WHERE id_conta = 1

UPDATE conta SET id_funcionario_abertura = 5 WHERE id_conta IN (10,11,12); 
--------------------------------------------------------

--Métodos de agregação
--Tudo Junto:
SELECT MAX(saldo) msior_saldo_banc,
MIN(saldo) menor_saldo_bancario,
AVG(saldo) saldo_bancario_medio,
SUM(saldo) soma_de_saldo_bancario,
COUNT(*) contagem_quant_contas_abertas
FROM conta
WHERE tipo_de_conta='CHE'


---------------------------------
--Separado de jeito simplificado

SELECT MAX(saldo) FROM conta WHERE tipo_de_conta='CHE'
GROUP BY id_conta

SELECT MIN(saldo) FROM conta WHERE tipo_de_conta='CHE'
GROUP BY id_conta

SELECT AVG(saldo) FROM conta WHERE tipo_de_conta='CHE'
GROUP BY id_conta 

SELECT SUM(saldo) FROM conta WHERE tipo_de_conta='CHE'
GROUP BY id_conta

SELECT COUNT(*) FROM conta WHERE tipo_de_conta='CHE'
GROUP BY id_conta
----------------------
--Separado mais "complexo"

SELECT id_funcionario_abertura,  
MAX(valor_limite) max_valor_limite_maximo
FROM conta WHERE tipo_de_conta='CHE'
GROUP BY id_funcionario_abertura


SELECT id_funcionario_abertura,  
MIN(valor_limite) limite_minimo_valor
FROM conta WHERE tipo_de_conta='CHE'
GROUP BY id_funcionario_abertura

SELECT id_funcionario_abertura,
AVG(valor_limite) valor_lim_avg
FROM conta WHERE tipo_de_conta='CHE'
GROUP BY id_funcionario_abertura


SELECT id_funcionario_abertura,
COUNT(valor_limite) contando_valor_limite
FROM conta WHERE tipo_de_conta='CHE'
GROUP BY id_funcionario_abertura


SELECT id_funcionario_abertura,
SUM(valor_limite) somando_valor_limite
FROM conta WHERE tipo_de_conta='CHE'
GROUP BY id_funcionario_abertura

----------------------------------------------
--Seleciona os tipos de conta 'CHE, CDC, CIV, CNS, CDS'

SELECT tipo_de_conta,
MAX(saldo) maior_saldo_banc,
MIN(saldo) menor_saldo_bancario,
AVG(saldo) saldo_bancario_medio,
SUM(saldo) soma_de_saldo_bancario,
COUNT(*) contagem_quant_contas_abertas
FROM conta
GROUP BY(tipo_de_conta)

--------------------------------------------------------------
--Contando valores distintos

SELECT id_conta, id_funcionario_abertura
FROM conta
ORDER BY id_funcionario_abertura

SELECT COUNT(id_funcionario_abertura)
FROM conta
-----------------------------------------------------
--Contagem correta de 
SELECT COUNT( DISTINCT id_funcionario_abertura)
FROM conta

--------------------------------------------------------------------


CREATE TABLE numeros
(
	val INT
);

INSERT INTO numeros(val)
VALUES(1),
(3),
(5);

SELECT * FROM numeros
------------------------------------------------

SELECT COUNT(*) num_linhas,
COUNT(val) num_valores,
MAX(val) msior_saldo_banc,
MIN(val) menor_saldo_bancario,
AVG(val) saldo_bancario_medio,
SUM(val) soma_de_saldo_bancario
FROM numeros

----------------------------------------------------------

INSERT INTO numeros
VALUES(null);
