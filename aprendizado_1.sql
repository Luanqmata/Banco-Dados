DROP TABLE Laboratorio1 /*apagar tabela*/

CREATE TABLE Laboratorio1 (
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    sexo VARCHAR(10),
    idade INT,
    interesse VARCHAR(200),
    interesse2 VARCHAR(200),
    CONSTRAINT pk_Laboratorio1 PRIMARY KEY (nome, sobrenome)
);

SELECT * FROM Laboratorio1 /* mostrar tebela*/

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Diego', 'Oliveira', 'M', 19, 'celta rebaixado', 'pc gamer');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Caue', 'Machado', 'M', 33, 'paint ball', 'Tecnologia');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Julio', 'Cesar', 'M', 19, 'toyota Supra', 'Skyline');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Daniel', 'Amorin', 'M', 22, 'Mundial do palmeiras', 'Homens');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Marcos', 'Felipe', 'M', 19, 'Civic Type R', 'Dinheiro');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Halbert', 'Nascimento', 'M', 30, 'Tecnologia', 'Aero modelo');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Paulo', 'Stertz', 'M', 21, 'tecnologia', 'Armamento de fogo');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Eduardo', 'Menezes', 'M', 19, 'Dinheiro', 'Carro');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Joao', 'Guilherme', 'M', 19, 'Vender o celta', 'XRE-300');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Kaic', 'Marçal', 'M', 19, 'Ser inteligente que nem sandir', 'ganhar mais que romes');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Vinicius', 'Santiago', 'M', 19, 'Programação', 'Vasco da Gama');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Vitor', 'Junio', 'M', 20, 'comer', 'Dormir');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Thallis', 'Henrrique', 'M', 19, 'Goticas', 'Peugeot 208');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Luis', 'Gustavo', 'M', 21, 'Honda Civic', 'gs1200');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Veronica', 'Graninch', 'F', 26, 'Boiolagens', 'Viagens');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Gabryella', 'Lima', 'F', 19, 'Croche', 'Desenho');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Enzo', 'Vieira', 'M', 19, 'Liberdade', 'Taça Guanabara');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Caue', 'Saad', 'M', 21, 'Pc games', 'Carro');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Leandro', 'Chaves', 'M', 23, 'Empresário', 'Cyber segurança');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Wendel', 'Gabriel', 'M', 20, 'Banco de Dados', 'Front-end');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Gabriel', 'Lima', 'M', 21, 'Nadar no Dinheiro', 'Mestre do Java');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Gabriel', 'Yuji', 'M', 23, 'Dinheiro', 'Mulheres');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Kevin', 'Garza', 'M', 19, 'Jogos', 'Filmes');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Nicole', 'Carvalho', 'F', 19, 'Comida', 'Ir pro céu');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Murilo', 'Rios', 'M', 19, 'Dinheiro', 'Adora homens');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Luan', 'Calazans', 'M', 22, 'Codar', 'Andar de moto');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Luis', 'Dias', 'M', 21, 'Ter uma Alfa Romeo', 'Fazer parte do Red Team');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Luan', 'Kevinny', 'M', 27, 'Tecnologia', '');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('Eduardo', 'Netto', 'M', 24, 'Design Gráfico', 'Desenvolvimento Mobile');

INSERT INTO Laboratorio1 (nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES ('', '', 'M', NULL, '', ''); /* Tabela modelo */

/*CRIANDO SEQUENCIA */
CREATE SEQUENCE sequencia1
	INCREMENT 10
	MINVALUE 1
	MAXVALUE 999999
	START 1
	CACHE 1;

/* TESTAR */ SELECT NEXTVAL('sequencia1');

/* INSERIR VALOR */ INSERT INTO Laboratorio1 (id) VALUES (NEXTVAL('sequencia1'));
