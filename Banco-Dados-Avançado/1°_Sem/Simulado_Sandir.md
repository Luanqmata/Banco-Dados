# Correção Simulado Sandir
-----------------
```sql
use correcao_simulado;
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100)
);
insert into Clientes
values
(1,"cristopher"),
(2,"enzo");

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
insert into Pedidos
Values
(2,null,"null");
```
-----------------
# Fazendo inner join das tabelas 
-----------------
```sql
-- questão 1 

SELECT p.id_pedido AS registro_pedido,
       p.data_pedido AS DATA_PEDIDO,
       c.nome AS NOME_CLIENTE
FROM Pedidos p
INNER JOIN Clientes c
       ON p.id_cliente = c.id_cliente;
```       
-----------------
# Dando preferencia a tabela da esquerda. Printar clientes que fizeram pedidos ate oque nao fizeram
-----------------
```sql
-- questão 2

select c.nome,p.id_pedido,p.data_pedido from  clientes c
left join pedidos p on c.id_cliente=p.id_cliente;
```
-----------------
# Dando preferencia a tabela da direita e obtendo o mesmo resultado 
-----------------
```sql
-- questão 3
select c.nome,p.id_pedido,p.data_pedido from  pedidos p
right join  clientes c on c.id_cliente=p.id_cliente;
```
-----------------
# Simulando FULL OUTER JOIN 
-----------------
```sql
-- questão 4

select c.nome,p.id_pedido,p.data_pedido from  clientes c
left join pedidos p on c.id_cliente=p.id_cliente
union
select c.nome,p.id_pedido,p.data_pedido from  clientes c
right join  pedidos p on c.id_cliente=p.id_cliente;
```

-----------------
# Fazendo cross join produtos e clientes
-----------------
```sql
-- questão 5

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);
insert into produtos
values
(2,"pincel",2);

select * from  clientes c
cross join  produtos p ;
```

-----------------
# Criando index's simples ,composto ,unico
-----------------
```sql
-- questão 6
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100)
);

-- 1)
Create index idx_email on usuarios(email);

-- 2)
Create unique index idx_email_unico on usuarios(email);

-- 3)
Create index idx_email_nome_composto on usuarios(nome,email);
```
-----------------
# A tabela Pedidos contém milhões de registros. Consultas frequentes buscam pedidos dentro de um intervalode datas.
## Crie um índice para otimizar essas buscas
-----------------
```sql
-- questão 7

Create index idx_data_pedido on pedidos(data_pedido);

```
-- questão 8

CREATE TABLE Pedidos2 (
    id_pedido INT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    email_cliente VARCHAR(100),
    produto VARCHAR(100),
    quantidade INT,
    preco_unitario DECIMAL(10,2)
);
drop table  Pedidos2;

CREATE TABLE Clientes2 (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Pedidos2 (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes2(id_cliente)
);

CREATE TABLE Produtos2 (
    id_produto INT PRIMARY KEY,
    produto varchar (20),
    preco_uni DECIMAL
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY,
    id_pedido INT,
     id_produto INT,
   quantidade int,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos2(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos2(id_produto)
);

-- questão 9

drop table Produtos;

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    id_categoria INT,
    preco DECIMAL(10,2),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

select c.nome as categoria,p.nome as produtos 
from categorias c
left join produtos p on c.id_categoria=p.id_categoria;

-- questão 10
select p.id_pedido,c.nome as nome_cliente,pr.produto as  nome_produto,pr.preco_uni from
clientes2 c
inner join  pedidos2 p on c.id_cliente=p.id_cliente
join item_pedido it on it.id_pedido=p.id_pedido
join produtos2 pr on pr.id_produto=it.id_produto;
