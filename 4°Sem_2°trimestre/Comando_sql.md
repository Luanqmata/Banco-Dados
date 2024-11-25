# Comandos post gree sql

```sql
-- Criando uma sequência com incremento de 13
CREATE SEQUENCE sequencia1_13   --criando sequencial com nome 
	INCREMENT 13  -- incrementa de 13 em 13 
	MINVALUE 0  -- cmoeça com 0 
	MAXVALUE 999999 -- valor maximo 
	START 0 -- começar com 
	CACHE 1; 
	

-- Atualizando um campo com o próximo valor da sequência
UPDATE meus_contatos 
SET recebe_sequenc=NEXTVAL('sequencia1_13')
WHERE id_contato = 1;

---------------------------------------------------

-- Atualizando valores em uma tabela com base em uma condição
UPDATE nome_da_tabela
SET coluna = 'novo_valor'
WHERE condicao;

-- Atualizando múltiplas colunas em uma tabela
UPDATE nome_da_tabela
SET coluna1 = 'valor1', coluna2 = 'valor2'
WHERE condicao;

-- Atualizando a coluna 'ativo' para falso em todos os registros
UPDATE meus_contatos
SET ativo = false;
-- WHERE id = 1

------------------------------------

-- Adicionando uma nova coluna à tabela
ALTER TABLE meus_contatos
ADD COLUMN data_nascimento DATE;

-- Alterando o tipo da coluna 'telefone' para BIGINT
ALTER TABLE meus_contatos
ALTER COLUMN telefone TYPE BIGINT;

-- Renomeando a coluna 'telefone' para 'celular'
ALTER TABLE meus_contatos
RENAME COLUMN telefone TO celular;

-- Renomeando a tabela para um novo nome
ALTER TABLE nome_da_tabela
RENAME TO novo_nome;

-- Excluindo uma coluna da tabela
ALTER TABLE nome_da_tabela
DROP COLUMN nome_da_coluna;

-- Adicionando uma restrição UNIQUE em uma coluna
ALTER TABLE nome_da_tabela
ADD CONSTRAINT nome_da_constraint UNIQUE (coluna);

----------------------------

-- Adicionando uma chave estrangeira à tabela
ALTER TABLE meus_contatos
ADD CONSTRAINT fk_usuario 
FOREIGN KEY (usuario_id) 
REFERENCES usuarios(id);

-- Removendo uma chave estrangeira da tabela
ALTER TABLE meus_contatos
DROP CONSTRAINT fk_usuario;

-- Adicionando uma restrição CHECK para verificar salário mínimo
ALTER TABLE meus_contatos 
ADD CONSTRAINT salario_pretendido_check 
CHECK (salario_pretendido > 8000);

-- Adicionando outra restrição CHECK para salário
ALTER TABLE meus_contatos 
ADD CONSTRAINT salario_pretendido_check 
CHECK (salario_pretendido > 8000); 

-- Adicionando uma chave estrangeira à tabela 'tbl_pecas'
ALTER TABLE tbl_pecas
ADD CONSTRAINT fk_pecas_fornecedor
FOREIGN KEY (cod_fornec)
REFERENCES tbl_fornecedor (cod_fornecedor);

-- Adicionando uma chave estrangeira à tabela 'tbl_venda'
ALTER TABLE tbl_venda
ADD CONSTRAINT fk_vendedor_venda
FOREIGN KEY (cod_vendedor)
REFERENCES tbl_vendedor (cod_vendedor);

-- Alterando o valor padrão da coluna 'ativo' para true
ALTER TABLE meus_contatos
ALTER COLUMN ativo SET DEFAULT true;

-- Removendo o valor padrão da coluna 'ativo'
ALTER TABLE meus_contatos
ALTER COLUMN ativo DROP DEFAULT;

-- Definindo uma coluna como obrigatória (NOT NULL)
ALTER TABLE nome_da_tabela
ALTER COLUMN nome_da_coluna SET NOT NULL;

-- Permitindo valores nulos em uma coluna
ALTER TABLE nome_da_tabela
ALTER COLUMN nome_da_coluna DROP NOT NULL;

------------------------------------------------
-- Consultando usuários com idade maior que 18
SELECT * FROM usuarios
WHERE idade > 18;

-- Consultando usuários ativos com idade maior que 18
SELECT * FROM usuarios
WHERE idade > 18 AND ativo = true;

-- Consultando usuários que não são da cidade 'São Paulo'
SELECT * FROM usuarios
WHERE cidade != 'São Paulo';

-- Consultando usuários com idade entre 20 e 30
SELECT * FROM usuarios
WHERE idade BETWEEN 20 AND 30;

-- Consultando usuários em uma lista específica de cidades
SELECT * FROM usuarios
WHERE cidade IN ('Rio de Janeiro', 'São Paulo', 'Belo Horizonte');

-- Consultando usuários com nomes que começam com 'Jo'
SELECT * FROM usuarios
WHERE nome LIKE 'Jo%'; -- Nomes que começam com "Jo"

-- Consultando usuários com nomes que não terminam com 'a'
SELECT * FROM usuarios
WHERE nome NOT LIKE '%a'; -- Nomes que não terminam com "a"

------------------------------------------------

-- Usado para filtrar resultados com funções de agregação
SELECT coluna1, COUNT(*)
FROM nome_da_tabela
GROUP BY coluna1
HAVING COUNT(*) > valor;

-- Agrupando por cidade e contando usuários por cidade
SELECT cidade, COUNT(*)
FROM usuarios
GROUP BY cidade
HAVING COUNT(*) > 5;

------------------------------------------------

-- Criando uma tabela com colunas e constraints
CREATE TABLE nome_da_tabela (
    id SERIAL PRIMARY KEY,
    coluna1 tipo NOT NULL UNIQUE,
    coluna2 tipo,
    CONSTRAINT nome_da_constraint UNIQUE (coluna2)
);

-- Criando uma tabela com uma chave única em múltiplas colunas
CREATE TABLE nome_da_tabela (
    coluna1 tipo,
    coluna2 tipo,
    CONSTRAINT nome_da_constraint UNIQUE (coluna1, coluna2)
);

-- Criando tabela para armazenar telefones de clientes com chave estrangeira
CREATE TABLE telefone_cliente (
      cod_cliente INT,
      telefone NUMERIC(11),
      FOREIGN KEY (cod_cliente) REFERENCES cliente (cod_cliente)
);

------------------------- N ~ N -----------------------------

-- Criando tabela para relacionamento muitos-para-muitos
CREATE TABLE tab_inte_pessoa (
	id_pessoa INT,
	id_interesse INT,
	PRIMARY KEY (id_pessoa,id_interesse),
	FOREIGN KEY (id_pessoa) REFERENCES tb_pessoa (id_pessoa),
	FOREIGN KEY (id_interesse) REFERENCES tb_interesse (id_interesse)
);

-- Criando tabela para relacionamento muitos-para-muitos com chave primária composta
CREATE TABLE meus_contatos_interesse (
    recebe_sequenc INT REFERENCES meus_contatos(recebe_sequenc),
    id_interesse INT REFERENCES interesses(id_interesse),
    CONSTRAINT interesses_meus_contatos PRIMARY KEY (recebe_sequenc, id_interesse)
);

-----------------------------------------------

-- Usando GROUP BY para agrupamentos e estatísticas
SELECT 
    COUNT(*) num_linhas,           -- Conta o número total de linhas na tabela, incluindo valores NULL
    COUNT(val) num_valores,        -- Conta o número de valores NÃO NULOS na coluna 'val'
    MAX(val) msior_saldo_banc,     -- Retorna o maior valor presente na coluna 'val'
    MIN(val) menor_saldo_bancario, -- Retorna o menor valor presente na coluna 'val'
    AVG(val) saldo_bancario_medio, -- Calcula a média dos valores na coluna 'val' (exclui valores NULL)
    SUM(val) soma_de_saldo_bancario -- Calcula a soma de todos os valores na coluna 'val' (exclui valores NULL)
FROM 
    numeros;                       -- Nome da tabela de onde os dados estão sendo consultados

-- Agrupando por cidade e calculando idade média
SELECT cidade, AVG(idade) AS idade_media
FROM usuarios
GROUP BY cidade;

-- Contando usuários por cidade e estado
SELECT cidade, estado, COUNT(*)
FROM usuarios
GROUP BY cidade, estado;

-- Listando cidades em ordem decrescente de usuários
SELECT cidade, COUNT(*) AS total_usuarios
FROM usuarios
GROUP BY cidade
ORDER BY total_usuarios DESC;

-- Exibindo apenas cidades com mais de 10 usuários
SELECT cidade, COUNT(*) AS total_usuarios
FROM usuarios
GROUP BY cidade
HAVING COUNT(*) > 10;

---------------------------------------------------------

-- Calculando agregados por contas do tipo 'CHE'
SELECT MAX(saldo)                   -- Obtém o maior saldo de cada conta
FROM conta                          -- Tabela onde os dados estão armazenados
WHERE tipo_de_conta = 'CHE'         -- Filtra apenas as contas do tipo "CHE" (provavelmente "Cheque Especial")
GROUP BY id_conta;                  -- Agrupa os resultados por cada conta individual (id_conta)

SELECT MIN(saldo)                   -- Obtém o menor saldo de cada conta
FROM conta                          -- Tabela onde os dados estão armazenados
WHERE tipo_de_conta = 'CHE'         -- Filtra apenas as contas do tipo "CHE"
GROUP BY id_conta;                  -- Agrupa os resultados por cada conta individual

SELECT AVG(saldo)                   -- Calcula a média dos saldos de cada conta
FROM conta                          -- Tabela onde os dados estão armazenados
WHERE tipo_de_conta = 'CHE'         -- Filtra apenas as contas do tipo "CHE"
GROUP BY id_conta;                  -- Agrupa os resultados por cada conta individual

SELECT SUM(saldo)                   -- Calcula a soma dos saldos de cada conta
FROM conta                          -- Tabela onde os dados estão armazenados
WHERE tipo_de_conta = 'CHE'         -- Filtra apenas as contas do tipo "CHE"
GROUP BY id_conta;                  -- Agrupa os resultados por cada conta individual

SELECT COUNT(*)                     -- Conta o número total de registros para cada conta
FROM conta                          -- Tabela onde os dados estão armazenados
WHERE tipo_de_conta = 'CHE'         -- Filtra apenas as contas do tipo "CHE"
GROUP BY id_conta;                  -- Agrupa os resultados por cada conta individual

```
