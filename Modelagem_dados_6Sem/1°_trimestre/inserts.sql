use rev_prova_6sem;

INSERT INTO cliente (nome, email, telefone) VALUES
('João Silva', 'joao.silva@email.com', '(11) 98765-4321'),
('Maria Santos', 'maria.santos@email.com', '(21) 91234-5678'),
('Pedro Oliveira', 'pedro.oliveira@email.com', '(31) 99999-8888'),
('Ana Souza', 'ana.souza@email.com', '(41) 98888-7777'),
('Carlos Pereira', 'carlos.pereira@email.com', '(51) 97777-6666'),
('Mariana Costa', 'mariana.costa@email.com', '(61) 96666-5555'),
('Lucas Martins', 'lucas.martins@email.com', '(71) 95555-4444'),
('Juliana Almeida', 'juliana.almeida@email.com', '(81) 94444-3333'),
('Rafael Ferreira', 'rafael.ferreira@email.com', '(91) 93333-2222'),
('Fernanda Lima', 'fernanda.lima@email.com', '(12) 92222-1111'),
('Ricardo Gomes', 'ricardo.gomes@email.com', '(22) 91111-0000'),
('Patrícia Rocha', 'patricia.rocha@email.com', '(32) 90000-9999'),
('Gustavo Barbosa', 'gustavo.barbosa@email.com', '(42) 98765-1234'),
('Camila Ribeiro', 'camila.ribeiro@email.com', '(52) 91234-9876'),
('Thiago Azevedo', 'thiago.azevedo@email.com', '(62) 99876-5432'),
('Larissa Castro', 'larissa.castro@email.com', '(72) 95432-1987'),
('Bruno Santos', 'bruno.santos@email.com', '(82) 98712-3456'),
('Amanda Correia', 'amanda.correia@email.com', '(92) 93456-7890'),
('Felipe Mendes', 'felipe.mendes@email.com', '(13) 97890-1234'),
('Letícia Barros', 'leticia.barros@email.com', '(23) 92345-6789');

-- Inserir Pratos
INSERT INTO PRATO (nome_prato, preco) VALUES
('Moqueca de Peixe', 75.50),
('Feijoada Completa', 65.00),
('Picanha na Chapa', 95.00),
('Salmão Grelhado', 85.00),
('Risoto de Camarão', 70.00),
('Lasanha à Bolonhesa', 55.00),
('Frango a Parmegiana', 60.00),
('Bife a Cavalo', 50.00),
('Escondidinho de Carne Seca', 45.00),
('Bobó de Camarão', 72.00),
('Galinha Cabidela', 58.00),
('Arroz de Pato', 88.00),
('Bacalhau à Gomes de Sá', 110.00),
('Polvo à Lagareiro', 120.00),
('Paella Valenciana', 130.00),
('Churrasco Misto', 150.00),
('Pizza Margherita', 40.00),
('Hambúrguer Artesanal', 35.00),
('Sushi Variado (20 peças)', 90.00),
('Yakisoba de Carne', 48.00);



-- Inserir Ingredientes
INSERT INTO INGREDIENTE (nome_ingrediente) VALUES
('Peixe Branco'), ('Azeite de Dendê'), ('Leite de Coco'), ('Feijão Preto'), ('Carne Seca'),
('Linguiça'), ('Picanha'), ('Salmão'), ('Arroz Arbóreo'), ('Camarão'),
('Massa de Lasanha'), ('Molho de Tomate'), ('Queijo Mussarela'), ('Frango'), ('Bife'),
('Ovo'), ('Mandioca'), ('Pato'), ('Bacalhau'), ('Polvo');

-- Inserir Pedidos (valor_total será atualizado depois)
INSERT INTO PEDIDO (id_cliente) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20);

-- Inserir Itens nos Pedidos
INSERT INTO PEDIDO_PRATO (id_pedido, id_prato, quantidade) VALUES
(1, 1, 1), (1, 5, 1), 
(2, 2, 2), 
(3, 3, 1), 
(4, 6, 1), (4, 7, 1), 
(5, 18, 2), (5, 17, 1),
(6, 10, 1),
(7, 19, 1),
(8, 2, 1),
(9, 4, 1),
(10, 8, 2),
(11, 12, 1),
(12, 13, 1),
(13, 15, 1),
(14, 1, 2),
(15, 20, 1),
(16, 3, 1),
(17, 5, 2),
(18, 9, 1),
(19, 11, 1),
(20, 16, 1);


-- Inserir Relação Prato-Ingrediente
INSERT INTO PRATO_INGREDIENTE (id_prato, id_ingrediente) VALUES
(1, 1), (1, 2), (1, 3), -- Moqueca
(2, 4), (2, 5), (2, 6), -- Feijoada
(3, 7), -- Picanha
(4, 8), -- Salmão
(5, 9), (5, 10), -- Risoto de Camarão
(6, 11), (6, 12), (6, 13), -- Lasanha
(7, 12), (7, 13), (7, 14), -- Frango a Parmegiana
(8, 15), (8, 16), -- Bife a Cavalo
(9, 5), (9, 17), -- Escondidinho
(10, 3), (10, 10), (10, 17), -- Bobó de Camarão
(11, 14), -- Galinha Cabidela (simplificado)
(12, 18), -- Arroz de Pato
(13, 19), -- Bacalhau
(14, 20), -- Polvo
(15, 1), (15, 10), (15, 20), -- Paella
(16, 7), (16, 14), (16, 6), -- Churrasco Misto
(17, 12), (17, 13), -- Pizza
(18, 15), -- Hamburguer
(19, 1), (19, 8), -- Sushi
(20, 5), (20, 15); -- Yakisoba

