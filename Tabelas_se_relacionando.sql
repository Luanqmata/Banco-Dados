-- Criação da tabela marcas
CREATE TABLE marcas (
    id_marca INT PRIMARY key,  
    nome_marca VARCHAR(100)
);

-- Criação da tabela nome_veiculo
CREATE TABLE nome_veiculo (
    id_nome INT PRIMARY KEY,  
    id_marca INT, 
    nome_moto VARCHAR(100),
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);

INSERT INTO marcas(id_marca,nome_marca)
VALUES (1,'HONDA')

INSERT INTO nome_veiculo (id_nome , id_marca , nome_moto)
VALUES (1,1,'Biz 110i')

SELECT * FROM marcas
SELECT * FROM nome_veiculo

-- DROP TABLE nome_veiculo

INSERT INTO marcas(id_marca,nome_marca)
VALUES (2,'Yamaha')
INSERT INTO nome_veiculo (id_nome , id_marca , nome_moto)
VALUES (2,2,'SHYNERAY')

INSERT INTO marcas(id_marca,nome_marca)
VALUES (3,'kawasaki')
INSERT INTO nome_veiculo (id_nome , id_marca , nome_moto)
VALUES (3,3,'Ninja 300')

INSERT INTO marcas(id_marca,nome_marca)
VALUES (4,'Thriump')
INSERT INTO nome_veiculo (id_nome , id_marca , nome_moto)
VALUES (4,4,'TIGER 750')


INSERT INTO nome_veiculo (id_nome , id_marca , nome_moto)
VALUES (5,1,'CB 300')
INSERT INTO nome_veiculo (id_nome , id_marca , nome_moto)
VALUES (6,1,'CB 500')

INSERT INTO nome_veiculo (id_nome , id_marca , nome_moto)
VALUES (7,3,'Ninja H2r"x')

