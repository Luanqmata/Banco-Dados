# Populando tabela exemplo
-----------------
```sql
Use banco_dados_vendas_new;

CREATE TABLE cargo(
	cod_cargo INT PRIMARY KEY,
    descricao_cargo VARCHAR(40)
);

CREATE TABLE funcionarios(
	cod_funcionario INT PRIMARY KEY,
    nome VARCHAR(40),
    cod_cargo INT,
	FOREIGN KEY (cod_cargo) REFERENCES CARGO(cod_cargo)
); 

INSERT INTO cargo(cod_cargo, descricao_cargo)
VALUES (1, 'VENDEDOR'),
(2, 'CAIXA'),
(3, 'GERENTE'),
(4, 'ENTREGADOR');

INSERT INTO funcionarios(cod_funcionario, nome, cod_cargo)
VALUES (1,'JOSE', 3),
(2,'DANIELLLA', 1),
(3,'ANA', 2),
(4,'CARLOS', null);
```
-----------------
# -- Quero o nome do meu funcionário, o código do cargo, e quero descrição des
-----------------
```sql
SELECT 
	f.nome AS Nome_funcionario, 
	f.cod_cargo AS codigo_cargo,
    c.descricao_cargo
FROM 
	funcionarios f
JOIN cargo c ON c.cod_cargo = f.cod_cargo; -- "Natural" "USING"

-- NATURAL - USING - ON: ALIAS
```
-----------------
# Usando LEFT join
-----------------
```sql
 SELECT 
	f.cod_funcionario AS COD_FUNC,
	f.nome AS Nome_funcionario, 
	f.cod_cargo AS codigo_cargo,
    c.descricao_cargo
FROM 
	funcionarios f
LEFT JOIN cargo c USING(cod_cargo);
```
-----------------
# Usando rigth join
-----------------
```sql
 SELECT 
	f.nome AS Nome_funcionario, 
	f.cod_cargo AS codigo_cargo,														
    c.descricao_cargo
FROM 
	funcionarios f
RIGHT JOIN cargo c USING(cod_cargo);
```
-----------------
# Usando left e rigth ao msm tempo
---------------------
 ```sql
SELECT * FROM 
	funcionarios f
NATURAL LEFT JOIN cargo c 
UNION 
SELECT * FROM funcionarios f
NATURAL RIGHT JOIN cargo c 
 */
```
