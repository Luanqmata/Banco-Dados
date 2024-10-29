FAZER 4 TABELAS 
1° FORMA NORMAL
2° OBEDECENDO 1° LEI FORMAL
3° OBEDECENDO 2° LEI FORMAL
4° OBEDECENDO 3° LEI FORMAL

---=====================================================---

SELECT * FROM item_pedido;

DROP TABLE item_pedido;

CREATE TABLE item_pedido (
     ID_pedido INT,
     ID_PRODUTO INT,
     Valor_total DECIMAL
);

ALTER TABLE item_pedido ADD CONSTRAINT pk_itens_pedidos PRIMARY KEY (ID_pedido,ID_PRODUTO)
--=============================================================--

SELECT * FROM produtos;

DROP TABLE produtos;

CREATE TABLE produtos (
     ID_produto SERIAL PRIMARY KEY,
     COD_produto INT,
     Produto VARCHAR(30);
     VAL_unitario DECIMAL
);


--===============================================================--
SELECT * FROM tabela_principal;

DROP TABLE tabela_principal;

CREATE TABLE tabela_principal (
   num_pedido INT PRIMARY KEY,
   ------------------------------- vendedor
   cliente VARCHAR(30),
   endereco VARCHAR(50),
   cpf NUMERIC(11),
   -------------------------------- cliente 
   COD_produto INT,
   produto VARCHAR(20),
   VAL_unitario DECIMAL,
   -------------------------------- produto
   QNTDE INT,
   Tipo_Remessa VARCHAR(10),
   total DECIMAL,
   total_pedido DECIMAL
   --------------------------------- detalhes do produto
);

INSERT INTO tabela_principal (num_pedido, cliente, endereco, cpf, COD_produto, produto, VAL_unitario, QNTDE, Tipo_Remessa, total, total_pedido) 
VALUES (1, 'João da Silva', 'Rua das Flores, 123', 12345678909, 101, 'Produto Exemplo', 19.99, 2, 'unidade', 39.98, 39.98);
