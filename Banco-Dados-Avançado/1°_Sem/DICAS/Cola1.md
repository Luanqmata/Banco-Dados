
# CRIANDO TABELA SEM O ESQUEMA E POPULANDO 
```sql
CREATE DATABASE MeuBanco;
USE MeuBanco;

CREATE TABLE cliente1 (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100),
    endereco VARCHAR(255),
    cidade VARCHAR(100),
    cep VARCHAR(10),
    uf CHAR(2),
    cpf VARCHAR(11) UNIQUE
);

-- Criando a tabela de vendedores
CREATE TABLE vendedor1 (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    vendedor VARCHAR(100),
    salario DECIMAL(10,2),
    comissao DECIMAL(5,2)
);

-- Criando a tabela de pedidos
CREATE TABLE pedido1 (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_vendedor INT,
    prazo_entrega DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente1(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor1(id_vendedor)
);

-- Criando a tabela de produtos
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    unidade VARCHAR(10),
    descricao VARCHAR(100),
    val_unit DECIMAL(10,2)
);

-- Criando a tabela de itens do pedido
CREATE TABLE item_produto (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    num_pedido INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (num_pedido) REFERENCES pedido1(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO cliente1 (cliente, endereco, cidade, cep, uf, cpf) 
VALUES
('João Silva', 'Rua A, 123', 'São Paulo', '01000000', 'SP', '11122233344'),
('Maria Souza', 'Rua B, 456', 'Rio de Janeiro', '22000000', 'RJ', '22233344455'),
('Carlos Pereira', 'Rua C, 789', 'Belo Horizonte', '31000000', 'MG', '33344455566'),
('Ana Oliveira', 'Rua D, 101', 'Curitiba', '80000000', 'PR', '44455566677'),
('Pedro Santos', 'Rua E, 202', 'Porto Alegre', '90000000', 'RS', '55566677788');

INSERT INTO vendedor1 (vendedor, salario, comissao) 
VALUES
('Carlos Mendes', 3000.00, 5.00),
('Fernanda Lima', 3500.00, 4.50),
('Ricardo Alves', 2800.00, 6.00),
('Juliana Costa', 4000.00, 5.50),
('Roberto Farias', 3200.00, 4.00);

INSERT INTO pedido1 (id_cliente, id_vendedor, prazo_entrega) 
VALUES
(1, 1, '2025-03-01'),
(2, 2, '2025-03-05'),
(3, 3, '2025-03-10'),
(4, 4, '2025-03-15'),
(5, 5, '2025-03-20');

INSERT INTO produto (unidade, descricao, val_unit) 
VALUES
('UN', 'Camiseta', 50.00),
('UN', 'Calça Jeans', 120.00),
('UN', 'Tênis', 200.00),
('UN', 'Jaqueta', 300.00),
('UN', 'Boné', 40.00);

INSERT INTO item_produto (num_pedido, id_produto, quantidade) 
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 1),
(5, 5, 2);

SELECT * FROM pedido1;
```
------
# comandos de filtragem
------
```sql
		#------------- alternar colunas sem precisar apaga-las ----------------------
ALTER TABLE cliente1 MODIFY uf VARCHAR(45);
ALTER TABLE vendedor1 MODIFY comissao DECIMAL(6,3);

SELECT * FROM pedido1;
SELECT * FROM cliente1;
SELECT * FROM item_produto;
SELECT * FROM produto;
SELECT * FROM vendedor1;
```
-----------------
# Cross join serve para junção de tabelas
-----------------
```sql
# --------------------------------------- CROSS JOIN  ----------------------------------------------
# cross join serve para combinar duas tabelas , wherer é daquela tabela , c do apelido e cliente da coluna e referencia para apenas 'joao silva'
# da um apelido pra 2 tabelas cliente1 para 'c' e depois produto para 'p' , filtra todos resultados somente do 'joao silva'.
# CROSS JOIN: Combina todas as linhas da tabela cliente1 com todas as linhas da tabela pedido1
# - gerando todas as combinações possíveis entre essas duas tabelas.
# Apelidos: Dá os apelidos c para cliente1 e p para pedido1 para facilitar o uso nas referências posteriores.
#WHERE: Filtra o resultado para mostrar apenas as combinações onde o id_cliente da tabela cliente1 é igual ao id_cliente da tabela pedido1.

SELECT*FROM cliente1 c cross join produto p where c.cliente="João Silva";
# RESUMO COMANDO: JUNTA 2 TABELAS APELIDA ELAS E FILTRA SOMENTE O CLIENTE JOAO SILVA PRODUTOS E CLIENTE

select*from cliente1 c cross join pedido1 p where c.id_cliente=p.id_cliente;
# RESUMO COMANDO : Combinam-se todas as linhas de cliente1 e pedido1, mas somente as combinações onde o id_cliente é igual entre as duas tabelas são retornadas.

SELECT * FROM vendedor1 v CROSS JOIN pedido1 p WHERE v.id_vendedor = p.id_vendedor;
# RESUMO COMANDO : Combinam-se todas as linhas de vendedor1 e pedido1, mas somente as combinações onde o id_vendedor é igual entre as duas tabelas são retornadas.

```
---------
# INNER JOIN
--------
```sql
# ---------------------------------------- INNER JOIN -----------------------------------------------------------------------
# O INNER JOIN traz dados de duas tabelas onde existe uma correspondência em ambas
# e descarta as linhas que não têm correspondência, como uma filtragem mais especifica de colunas.

SELECT * FROM vendedor1 v INNER JOIN pedido1 p ON TRUE;
# DEMONSTRAÇÃO QUE COM O INNER JOIN PODE SE TER UM RESULTADO PARECIDO COM O CROSS JOIN 
# cada linha da tabela vendedor1 será combinada com todas as linhas da tabela pedido1 (criando um produto cartesiano), mas só usando um INNER JOIN.
```
-----------------
# Filtros passando por todas as tabelas
----------------
```sql
# ----------------------------------- filtragem colunas --------------------------------------
SELECT CL.cliente, PR.descricao                                # Seleciona o nome do cliente (CL.cliente) e a descrição do produto (PR.descricao)
FROM cliente1 cl                                               # Começa a consulta na tabela cliente1 e dá um apelido a ela como cl.
INNER JOIN pedido1 PE ON CL.id_cliente = PE.id_cliente         # Faz um inner join com a tabela pedido1 (apelidada como PE) onde o id_cliente de cliente1 (CL) é igual ao id_cliente de pedido1 (PE)
INNER JOIN item_produto IP ON IP.num_pedido = PE.id_pedido     # Faz outro inner join com a tabela item_produto (apelidada como IP) onde o num_pedido de item_produto é igual ao id_pedido de pedido1.
INNER JOIN produto PR ON PR.id_produto = IP.id_produto;        # Faz o inner join final com a tabela produto (apelidada como PR), unindo pelo id_produto de produto e item_produto.

# RESUMO COMANDO : A consulta traz o nome dos clientes e as descrições dos produtos relacionados aos pedidos feitos
# unindo as quatro tabelas baseadas nos relacionamentos entre elas.

# ------------- comando 2
SELECT c.cliente, pr.descricao AS produto                      # ele seleciona o cliente da tabela cliente1 apelidade de c1 , e pega a descrição da tabela PR (produto) , e renomeia para produto para exibição (nomeia a coluna)
FROM cliente1 c                                                # inicia a busca na tabela de cliente1 apelidada de c 
INNER JOIN pedido1 p ON p.id_cliente = c.id_cliente            # faz a junção de peidos1 com clientes1 traz dados da tabela pedido1 onde os id_cliente ; ON = A condição de junção é que o id_cliente de pedido1 deve ser igual ao id_cliente de cliente1.
INNER JOIN item_produto ip ON ip.num_pedido = p.id_pedido      # faz a junção ta tabela clientes com item produto apelidade de ip , ON = A condição de junção é que o id_cliente de pedido1 deve ser igual ao id_cliente de cliente1
INNER JOIN produto pr ON pr.id_produto = ip.id_produto;        # Faz a junção final entre a tabela item_produto (apelidada como ip) e a tabela produto (apelidada como pr), trazendo os dados dos produtos relacionados aos itens de pedido , A condição de junção é que o campo id_produto de produto deve ser igual ao id_produto de item_produto.

# A consulta combina os dados das tabelas cliente1, pedido1, item_produto e produto, com base nas condições de junção entre elas.
# Ela seleciona o nome do cliente (c.cliente) e a descrição do produto (pr.descricao), renomeando a descrição do produto como produto na saída.
# A consulta retorna os nomes dos clientes e descrições dos produtos que estão presentes em pedidos, itens de pedido e produtos, fazendo as junções necessárias entre as tabelas.
# ------------------------------------------------------------------------------------------
```
-----------------
# Usando USING e NATURAL INNER JOIN 
-----------------
```sql
SELECT*FROM cliente1 INNER JOIN pedido1 USING(id_cliente); # Realiza uma junção entre a tabela cliente1 e a tabela pedido1.só retornará as linhas onde há correspondência entre as duas tabelas.
# USING(id_cliente): Especifica que a junção deve ser feita com base na coluna id_cliente, que deve existir em ambas as tabelas.
# O comando USING simplifica a condição de junção, já que ele automaticamente faz a comparação entre as colunas com o mesmo nome (neste caso, id_cliente) nas duas tabelas.

SELECT*FROM cliente1 NATURAL INNER JOIN pedido1; 
# O NATURAL JOIN é um tipo de junção especial onde o banco de dados automaticamente encontra as colunas com o mesmo nome em ambas as tabelas e as usa como base para realizar a junção.
# Esse comando retorna todas as colunas de ambas as tabelas, cliente1 e pedido1, com base nas colunas que possuem o mesmo nome em ambas (normalmente id_cliente). A junção é feita automaticamente entre essas colunas comuns, sem a necessidade de especificá-las explicitamente.

# ----------------------- comparação dos dois USING NATURAL INTER -----------
# INNER JOIN USING(id_cliente): Especifica diretamente que a junção será feita pela coluna id_cliente.
# NATURAL INNER JOIN: Faz a junção automaticamente entre todas as colunas que possuem o mesmo nome nas duas tabelas, sem a necessidade de especificar o nome da coluna.
# Ambos fazem junções internas, mas o NATURAL JOIN é mais "automático" ao determinar qual coluna será usada na junção, enquanto o USING exige que você especifique explicitamente a coluna.
```
