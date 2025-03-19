# Junção interna  - CROSS JOIN 
----------------
```sql
-- Junção Interna
SELECT                                              -- SELECT == FRONT END
    c.id_cliente,                    -- pega da tabela cliente apelidada o id_cliente
    c.cliente AS nome_cliente,       -- pega da tabela cliente apelidada o cliente e renomeia para nome_cliente
    p.id_produto,                    -- pega da tabela produto a descrição do produto (nome) apelidada de p , e renomeia o nome da coluna da tab para nome_produto
    p.descricao AS nome_produto
FROM                                                -- FROM == BACK END
    cliente c                        -- passa o apelido para o nome da tabela 
CROSS JOIN produto p                 -- faz a combinação de tabelas
WHERE                                -- condição
    c.id_produto = p.id_produto;     -- equanto o id_produto da tab clientes for igual ao id_produto da tab produto
```    

------------------------------------------------
# Juncao interna INNER JOIN
------------------------------------------------

```sql
-- Criar uma consulta com junção onde os vendedores só estejam relacionado com seu respectivo pedido
-- Seleciona todos os produtos da tabela "produto" dentro do banco "banco_teste"

SELECT * FROM banco_teste.produto;

-- Consulta para exibir o ID e nome do cliente, além do ID do produto e sua descrição

SELECT 
    c.id_cliente,                              -- Seleciona o ID do cliente
    c.cliente AS nome_cliente,                 -- Renomeia a coluna "cliente" para "nome_cliente" no resultado
    p.num_pedido AS id_pedido                  -- Ajuste: "id_Produto" estava errado, alterado para "id_pedido"
FROM 
    cliente c                                  -- Tabela principal que contém os clientes
INNER JOIN 
    pedido p ON c.id_cliente = p.id_cliente;   -- Associa pedidos aos clientes pelo ID do cliente
```

------------------------------------------------
-- Junções internas  
------------------------------------------------
```sql
use banco_teste;

SELECT * FROM cliente CROSS JOIN pedido;             -- combinando todas as linhas de ambas.

SELECT *FROM cliente INNER JOIN pedido ON TRUE;      -- pois a condição "ON TRUE" faz com que todas as combinações possíveis sejam retornadas
```

------------------------------------------------
# -- Junções internas INNER JOIN
------------------------------------------------
```sql

SELECT                                                      -- SELECT == FRONT END
    p.num_pedido AS id_pedido,                              -- pega da tabela p o num_pedido e transforma em id_pedido (nome da coluna)
    c.cliente AS nome_cliente,                              -- pega da tabela c o cliente e transforma em nome_cliente
    v.vendedor AS nome_vendedor,                            -- pega da tab v o vendedor e trans em nome_vendedor
    p.prazo_entrega                                         -- pega da tab p o prazo de entrega como esta intuitivo ele n transforma em nada
FROM Pedido p
    INNER JOIN cliente c ON p.id_cliente = c.id_cliente         -- passa o apelido para a tab cliente = c ; e relaciona com a tab produto aonde as 2 tem o id_cliente
    INNER JOIN vendedor v ON p.id_vendedor = v.id_vendedor;     -- passa o apelido para a tab vendedor = v; e relaciona com tab produto aonde o id_vendedor da tab prodduto , seja igual ao id_vendedor da tab vendedor

```
---------------------------------------------------
# -- Filtragem de produtos compras por um cliente específico
--------------------------------------------------
```sql
SELECT * FROM
cliente c inner join produto p where c.cliente = 'Lucas Oliveira'; 
-- A consulta acima não funcionará

*/
-- Crie uma consulta que mostre o nome do produto comprado por cada cliente usando junção interna qualificada
/*


SELECT                                                       -- SELECT == FRONT END
    c.cliente AS nome_cliente,                      -- Nome do cliente
    p.descricao AS nome_produto                     -- Descrição do produto
FROM                                                         -- FROM BACK END
    cliente c                                       -- passa o apelido para cliente que é a tabela PRINCIPAL POR ISSO FOI USADA NO FROM 
INNER JOIN                                                   -- combinação de tabelas  
    pedido pe ON c.id_cliente = pe.id_cliente       -- Junção entre cliente e pedido              
INNER JOIN 
    item_pedido ip ON pe.num_pedido = ip.num_pedido -- Junção entre pedido e item_pedido
INNER JOIN 
    produto p ON ip.id_produto = p.id_produto;      -- Junção entre item_pedido e produto

```
-----------
# -- Crie uma consulta que mostre o nome do produto vendido por cada vendedor usando junção interna qualificada
-----------
```sql
SELECT                                                                -- SELECT == FRONT END
    v.vendedor AS nome_vendedor,                         -- Nome do vendedor
    p.descricao AS produto_vendido                       -- Descrição do produto
FROM                                                                  -- FROM BACK END
    vendedor v                                           -- BUSCA DA TABELA PRINCIPAL APELIDANDO-A
INNER JOIN                                               -- FAZ A COMBINAÇÃO
    pedido pe ON v.id_vendedor = pe.id_vendedor          -- Junção entre vendedor e pedido
INNER JOIN 
    item_pedido ip ON pe.num_pedido = ip.num_pedido      -- Junção entre pedido e item_pedido
INNER JOIN 
    produto p ON ip.id_produto = p.id_Produto;           -- Junção entre item_pedido e produto
```
-----------
# -- Crie uma consulta que mostre o nome do produto vendido por cada vendedor usando junção interna qualificada
-----------
```sql
SELECT 
    v.vendedor AS nome_vendedor,             -- Nome do vendedor
    p.descricao AS produto_vendido           -- Descrição do produto
FROM                                         -- Busca tabela principal
    vendedor v                               -- tabela principal e apelidando-a
INNER JOIN                                   -- combinando tabelas
    pedido pe USING (id_vendedor)            -- Junção entre vendedor e pedido
INNER JOIN 
    item_pedido ip USING (num_pedido)        -- Junção entre pedido e item_pedido
INNER JOIN 
    produto p USING (id_produto);            -- Junção entre item_pedido e produto
 
 -- com a cláusula USING não preciso detalhar a necessidade das duas tabelas.
 ```
---------
# -- Relação vendedor com produto vendido
---------
```sql
SELECT 
    v.vendedor AS nome_vendedor,         -- Nome do vendedor
    p.descricao AS produto_vendido       -- Descrição do produto
FROM                                     -- Busca tabela principal
    vendedor v                           -- apelida a tabela principal de v
NATURAL JOIN                             -- combina automaticamente as colunas fk iguais para facilitar o processo 
    pedido pe                            -- Junção natural entre vendedor e pedido
NATURAL JOIN 
    item_pedido ip                       -- Junção natural entre pedido e item_pedido
NATURAL JOIN 
    produto p;                           -- Junção natural entre item_pedido e produto
```
---------

---------
```sql
                    /*
                    Detalhe importante. 
                    Quando você quer que uma coluna apareça no resultado, é necessário selecioná-la. 
                    Pq estou dizendo isso? Porque o item_pedido pode causar confusão. Então se quiser que o id do pedido apareça, faremos assim:
                     */

SELECT 
    ip.num_pedido As numero_ped,
    v.vendedor AS nome_vendedor,             -- Nome do vendedor
    p.descricao AS produto_vendido           -- Descrição do produto
FROM                                         -- busca da tabela principal 
    vendedor v
NATURAL JOIN 
    pedido pe                                -- Junção natural entre vendedor e pedido
NATURAL JOIN 
    item_pedido ip                           -- Junção natural entre pedido e item_pedido
NATURAL JOIN 
    produto p;                               -- Junção natural entre item_pedido e produt
```
