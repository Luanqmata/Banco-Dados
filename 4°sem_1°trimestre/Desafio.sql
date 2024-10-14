-- 1 - Você recebeu a missão de criar um banco de dados em uma loja, entre os vários arquivos que ela possui. vcrecebeu o exemplo da foto abaixo, partindo deste único arquivo vc deverá criar um novo banco de dados queapresente as seguintes características:
-- Não possua dados não atômicos
-- Não possua DFP
-- Não possua DFT
-- Não possua relacionamento com cardinalidade n->n
-- Ao final da criação deste banco de dados cada tabela deve possuir um mínimo de 20 tuplas além das já
-- encontradas neste arquivo (tabelas associativas ficam livres desta regra)
-- ( IMAGEM DA TABELA )

--------------------------------B1----------------------
SELECT * FROM Produtos;
DROP TABLE Produtos;

CREATE TABLE Produtos (
    Cod_Produto INT PRIMARY KEY,
    Nome_Produto VARCHAR(50) NOT NULL,
    Val_Unitario DECIMAL(10, 2) NOT NULL,
    Unidade VARCHAR(10) NOT NULL,
    Prazo_Entrega INT
);

INSERT INTO Produtos (Cod_Produto, Nome_Produto, Val_Unitario, Unidade, Prazo_Entrega) VALUES
(45, 'Cartucho', 25.00, 'unid', 15),
(300, 'Papel A4', 10.00, 'res', 10),
(350, 'Grampo', 5.00, 'CX', 5),
(78, 'DVD', 1.00, 'unid', 7),	
(85, 'Papel A4', 10.00, 'res', 10);

--PODE PULAR PARA O BLOCO B2

-- usar esse comndo depois de criar a ultima tabela que é a de dados do cliente 
--porque as referencias so podem ser feitas depois que a tabela ja foicriada entao depois que vc criar a ultima vc pode vim aqui e executar esses comandos
--como os comandos de cima (	ler linha 92	)
ALTER TABLE Dados_Pedido
ADD CONSTRAINT fk_produto
FOREIGN KEY (Cod_Produto) REFERENCES Produtos(Cod_Produto);

-----------------------------B2----------------------------------
SELECT * FROM Funcionarios;
DROP TABLE Funcionarios;

CREATE TABLE Funcionarios (
    Cod_Vendedor INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

INSERT INTO Funcionarios (Cod_Vendedor, Nome) VALUES
(2541, 'João'),
(2542, 'Maria');

--PODE PULAR PARA O BLOCO B3

-- usar esse comndo depois de criar a ultima tabela que é a de dados do cliente 
--porque as referencias so podem ser feitas depois que a tabela ja foicriada entao depois que vc criar a ultima vc pode vim aqui e executar esses comandos
--como os comandos de cima (	ler linha 92	)
ALTER TABLE Clientes
ADD Cod_Vendedor INT,
ADD FOREIGN KEY (Cod_Vendedor) REFERENCES Funcionarios(Cod_Vendedor);

UPDATE Clientes SET Cod_Vendedor = 2541 WHERE Nome = 'Juan';
UPDATE Clientes SET Cod_Vendedor = 2542 WHERE Nome = 'Marcela';

---------------------------------B3----------------------------------------------
SELECT * FROM CLientes;
DROP TABLE Clientes;

CREATE TABLE Clientes (
    CPF CHAR(14) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

INSERT INTO Clientes (CPF, Nome) VALUES
('111.111.111-11', 'Juan'),
('222.222.222-22', 'Marcela');

--------------------------------------B4-----------------------------------------

SELECT * FROM Dados_Pedido;
DROP TABLE Dados_Pedido;

CREATE TABLE Dados_Pedido (
    Num_pedido INT,
    Cliente VARCHAR(50),
    Endereco VARCHAR(100),
    CPF CHAR(14),
    COD_Produto INT,
    Produto VARCHAR(50),
    Val_Unitario DECIMAL(10, 2),
    QTDE INT,
    Unidade VARCHAR(10),
    Total DECIMAL(10, 2),
    Total_Pedido DECIMAL(10, 2),
    FOREIGN KEY (CPF) REFERENCES Clientes(CPF),
	FOREIGN KEY (Cod_Produto) REFERENCES Produtos(Cod_Produto)
);

INSERT INTO Dados_Pedido (Num_pedido, Cliente, Endereco, CPF, COD_Produto, Produto, Val_Unitario, QTDE, Unidade, Total, Total_Pedido)
VALUES 
(1874, 'Juan', 'Qd 02 cj J casa 22 setor sul gama DF', '111.111.111-11', 45, 'Cartucho', 25.00, 5, 'unid', 125.00, 535.00),
(1874, 'Juan', 'Qd 02 cj J casa 22 setor sul gama DF', '111.111.111-11', 300, 'Papel A4', 10.00, 10, 'res', 100.00, 535.00),
(1874, 'Juan', 'Qd 02 cj J casa 22 setor sul gama DF', '111.111.111-11', 350, 'Grampo', 5.00, 12, 'CX', 60.00, 535.00),
(3275, 'Marcela', 'QSD 23 casa 34 Taguatinga Sul DF', '222.222.222-22', 78, 'DVD', 1.00, 200, 'unid', 200.00, 535.00),
(3275, 'Marcela', 'QSD 23 casa 34 Taguatinga Sul DF', '222.222.222-22', 85, 'Papel A4', 10.00, 5, 'res', 50.00, 535.00);

--depois de criar essa tabela voltar na linha 22 a 24 e rodar aquele comando , e tambem na linha 42 a 44 e linha 46 a 47. 
-- depois disso voce pode adicioanr oque quiser ao banco de dados de maneira correta (só quando vc for adicionar clientes novos vc precisar atribuir o vendedor aquele cliente)
----------------------------------------------------------------------------------------------------------------------------------------------

-- colocando 2 funcionarios novos 
SELECT * FROM Funcionarios;
INSERT INTO Funcionarios (Cod_Vendedor, Nome) VALUES
(2543, 'Ana'),
(2544, 'Carlos');

-- colocando +4 produtos 
SELECT * FROM Produtos;
INSERT INTO Produtos (Cod_Produto, Nome_Produto, Val_Unitario, Unidade, Prazo_Entrega) VALUES
(79, 'Caderno', 15.00, 'unid', 5),
(80, 'Caneta', 2.00, 'unid', 10),
(81, 'Lápis', 1.00, 'unid', 3),
(82, 'Borracha', 0.50, 'unid', 2);

-- adicionando +3clientes novos
SELECT * FROM CLientes;
INSERT INTO Clientes (CPF, Nome) VALUES
('333.333.333-33', 'Pedro'),
('444.444.444-44', 'Sofia'),
('555.555.555-55', 'Lucas');

-- adicionando os clientes aos vendedores ou vise versa adicionando os cod dos vendedores aos clientes 
UPDATE Clientes SET Cod_Vendedor = 2541 WHERE CPF = '333.333.333-33';
UPDATE Clientes SET Cod_Vendedor = 2543 WHERE CPF = '444.444.444-44';
UPDATE Clientes SET Cod_Vendedor = 2544 WHERE CPF = '555.555.555-55';

-- colocando 20 novas tuplas na tabela de dados 
SELECT * FROM Dados_Pedido;

INSERT INTO Dados_Pedido (Num_pedido, Cliente, Endereco, CPF, COD_Produto, Produto, Val_Unitario, QTDE, Unidade, Total, Total_Pedido)
VALUES 
(1875, 'Juan', 'Qd 02 cj J casa 22 setor sul gama DF', '111.111.111-11', 45, 'Cartucho', 25.00, 2, 'unid', 50.00, 535.00),
(1876, 'Marcela', 'QSD 23 casa 34 Taguatinga Sul DF', '222.222.222-22', 300, 'Papel A4', 10.00, 3, 'res', 30.00, 535.00),
(1877, 'Pedro', 'Rua das Flores, 45', '333.333.333-33', 350, 'Grampo', 5.00, 20, 'CX', 100.00, 1000.00),
(1878, 'Sofia', 'Avenida Central, 123', '444.444.444-44', 78, 'DVD', 1.00, 10, 'unid', 10.00, 500.00),
(1879, 'Lucas', 'Setor Norte, Bloco 12', '555.555.555-55', 79, 'Caderno', 15.00, 4, 'unid', 60.00, 300.00),
(1880, 'Juan', 'Qd 02 cj J casa 22 setor sul gama DF', '111.111.111-11', 80, 'Caneta', 2.00, 50, 'unid', 100.00, 200.00),
(1881, 'Marcela', 'QSD 23 casa 34 Taguatinga Sul DF', '222.222.222-22', 81, 'Lápis', 1.00, 30, 'unid', 30.00, 100.00),
(1882, 'Pedro', 'Rua das Flores, 45', '333.333.333-33', 82, 'Borracha', 0.50, 100, 'unid', 50.00, 500.00),
(1883, 'Sofia', 'Avenida Central, 123', '444.444.444-44', 45, 'Cartucho', 25.00, 3, 'unid', 75.00, 600.00),
(1884, 'Lucas', 'Setor Norte, Bloco 12', '555.555.555-55', 300, 'Papel A4', 10.00, 7, 'res', 70.00, 500.00),
(1885, 'Juan', 'Qd 02 cj J casa 22 setor sul gama DF', '111.111.111-11', 350, 'Grampo', 5.00, 15, 'CX', 75.00, 200.00),
(1886, 'Marcela', 'QSD 23 casa 34 Taguatinga Sul DF', '222.222.222-22', 78, 'DVD', 1.00, 50, 'unid', 50.00, 300.00),
(1887, 'Pedro', 'Rua das Flores, 45', '333.333.333-33', 79, 'Caderno', 15.00, 5, 'unid', 75.00, 250.00),
(1888, 'Sofia', 'Avenida Central, 123', '444.444.444-44', 80, 'Caneta', 2.00, 20, 'unid', 40.00, 300.00),
(1889, 'Lucas', 'Setor Norte, Bloco 12', '555.555.555-55', 81, 'Lápis', 1.00, 25, 'unid', 25.00, 200.00),
(1890, 'Juan', 'Qd 02 cj J casa 22 setor sul gama DF', '111.111.111-11', 82, 'Borracha', 0.50, 40, 'unid', 20.00, 150.00),
(1891, 'Marcela', 'QSD 23 casa 34 Taguatinga Sul DF', '222.222.222-22', 45, 'Cartucho', 25.00, 4, 'unid', 100.00, 600.00),
(1892, 'Pedro', 'Rua das Flores, 45', '333.333.333-33', 300, 'Papel A4', 10.00, 6, 'res', 60.00, 450.00),
(1893, 'Sofia', 'Avenida Central, 123', '444.444.444-44', 350, 'Grampo', 5.00, 10, 'CX', 50.00, 200.00),
(1894, 'Lucas', 'Setor Norte, Bloco 12', '555.555.555-55', 78, 'DVD', 1.00, 100, 'unid', 100.00, 1000.00);
