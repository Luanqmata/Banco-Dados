DROP TABLE Laboratorio1 /*apagar tabela*/

CREATE TABLE Laboratorio1 (
    id INT PRIMARY KEY,        
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    sexo VARCHAR(10),
    idade INT,
    interesse VARCHAR(200),
    interesse2 VARCHAR(200)
);

SELECT * FROM Laboratorio1 /* mostrar tebela*/

CREATE SEQUENCE sequencia_laboratorio
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    START WITH 1
    CACHE 1;
    
INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Diego', 'Oliveira', 'M', 19, 'celta rebaixado', 'pc gamer');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Caue', 'Machado', 'M', 33, 'paint ball', 'Tecnologia');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Julio', 'Cesar', 'M', 19, 'toyota Supra', 'Skyline');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Daniel', 'Amorin', 'M', 22, 'Mundial do palmeiras', 'Homens');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Marcos', 'Felipe', 'M', 19, 'Civic Type R', 'Dinheiro');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Halbert', 'Nascimento', 'M', 30, 'Tecnologia', 'Aero modelo');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Paulo', 'Stertz', 'M', 21, 'tecnologia', 'Armamento de fogo');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Eduardo', 'Menezes', 'M', 19, 'Dinheiro', 'Carro');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Joao', 'Guilherme', 'M', 19, 'Vender o celta', 'XRE-300');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Kaic', 'Marçal', 'M', 19, 'Ser inteligente que nem sandir', 'ganhar mais que romes');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Vinicius', 'Santiago', 'M', 19, 'Programação', 'Vasco da Gama');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Vitor', 'Junio', 'M', 20, 'comer', 'Dormir');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Thallis', 'Henrrique', 'M', 19, 'Goticas', 'Peugeot 208');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Luis', 'Gustavo', 'M', 21, 'Honda Civic', 'gs1200');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Veronica', 'Graninch', 'F', 26, 'Boiolagens', 'Viagens');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Gabryella', 'Lima', 'F', 19, 'Croche', 'Desenho');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Enzo', 'Vieira', 'M', 19, 'Liberdade', 'Taça Guanabara');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Caue', 'Saad', 'M', 21, 'Pc games', 'Carro');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Leandro', 'Chaves', 'M', 23, 'Empresário', 'Cyber segurança');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Wendel', 'Gabriel', 'M', 20, 'Banco de Dados', 'Front-end');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Gabriel', 'Lima', 'M', 21, 'Nadar no Dinheiro', 'Mestre do Java');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Gabriel', 'Yuji', 'M', 23, 'Dinheiro', 'Mulheres');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Kevin', 'Garza', 'M', 19, 'Jogos', 'Filmes');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Nicole', 'Carvalho', 'F', 19, 'Comida', 'Ir pro céu');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Murilo', 'Rios', 'M', 19, 'Dinheiro', 'Adora homens');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Luan', 'Calazans', 'M', 22, 'Codar', 'Andar de moto');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Luis', 'Dias', 'M', 21, 'Ter uma Alfa Romeo', 'Fazer parte do Red Team');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Luan', 'Kevinny', 'M', 27, 'Tecnologia', '');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), 'Eduardo', 'Netto', 'M', 24, 'Design Gráfico', 'Desenvolvimento Mobile');

INSERT INTO Laboratorio1 (id, nome, sobrenome, sexo, idade, interesse, interesse2)
VALUES (NEXTVAL('sequencia_laboratorio'), '', '', 'M', NULL, '', ''); /* Tabela modelo */


