-- Script de Inserção de Dados

USE faculdade_iesgo;

-- Inserção de dados na tabela Alunos
INSERT INTO Alunos (nome, sobrenome, data_nascimento, email, telefone, endereco, cidade, estado, cep) VALUES
('Ana', 'Silva', '2000-01-15', 'ana.silva@email.com', '11987654321', 'Rua A, 123', 'São Paulo', 'SP', '01000-000'),
('Bruno', 'Souza', '1999-03-20', 'bruno.souza@email.com', '21987654322', 'Av. B, 456', 'Rio de Janeiro', 'RJ', '20000-000'),
('Carla', 'Oliveira', '2001-07-22', 'carla.oliveira@email.com', '31987654323', 'Rua C, 789', 'Belo Horizonte', 'MG', '30000-000'),
('Daniel', 'Santos', '1998-11-01', 'daniel.santos@email.com', '41987654324', 'Av. D, 101', 'Curitiba', 'PR', '80000-000'),
('Eduarda', 'Pereira', '2002-05-10', 'eduarda.pereira@email.com', '51987654325', 'Rua E, 202', 'Porto Alegre', 'RS', '90000-000'),
('Felipe', 'Costa', '1997-09-25', 'felipe.costa@email.com', '61987654326', 'Av. F, 303', 'Brasília', 'DF', '70000-000'),
('Gabriela', 'Martins', '2000-02-28', 'gabriela.martins@email.com', '71987654327', 'Rua G, 404', 'Salvador', 'BA', '40000-000'),
('Henrique', 'Rocha', '1999-06-12', 'henrique.rocha@email.com', '81987654328', 'Av. H, 505', 'Recife', 'PE', '50000-000'),
('Isabela', 'Almeida', '2001-08-05', 'isabela.almeida@email.com', '91987654329', 'Rua I, 606', 'Fortaleza', 'CE', '60000-000'),
('João', 'Fernandes', '1998-04-18', 'joao.fernandes@email.com', '11987654330', 'Av. J, 707', 'São Paulo', 'SP', '01000-001');

-- Inserção de dados na tabela Cursos
INSERT INTO Cursos (nome_curso, descricao, carga_horaria) VALUES
('Sistemas de Informação', 'Curso de graduação em Sistemas de Informação', 3200),
('Ciência da Computação', 'Curso de graduação em Ciência da Computação', 3600),
('Engenharia de Software', 'Curso de graduação em Engenharia de Software', 3800),
('Análise e Desenvolvimento de Sistemas', 'Curso tecnólogo em Análise e Desenvolvimento de Sistemas', 2400),
('Redes de Computadores', 'Curso tecnólogo em Redes de Computadores', 2000),
('Gestão de TI', 'Curso de graduação em Gestão de Tecnologia da Informação', 2800),
('Segurança da Informação', 'Curso de pós-graduação em Segurança da Informação', 400),
('Inteligência Artificial', 'Curso de pós-graduação em Inteligência Artificial', 400),
('Banco de Dados', 'Curso de pós-graduação em Banco de Dados', 360),
('Desenvolvimento Web', 'Curso de extensão em Desenvolvimento Web', 180);

-- Inserção de dados na tabela Disciplinas
INSERT INTO Disciplinas (nome_disciplina, carga_horaria_disciplina, curso_id) VALUES
('Banco de Dados I', 80, 1),
('Programação Orientada a Objetos', 80, 1),
('Estrutura de Dados', 80, 2),
('Engenharia de Requisitos', 60, 3),
('Redes de Computadores I', 80, 5),
('Sistemas Operacionais', 60, 2),
('Cálculo I', 80, 1),
('Algoritmos e Lógica de Programação', 80, 1),
('Segurança de Redes', 60, 7),
('Inteligência Artificial Aplicada', 80, 8);

-- Inserção de dados na tabela Professores
INSERT INTO Professores (nome, sobrenome, email, telefone, especializacao) VALUES
('Carlos', 'Lima', 'carlos.lima@email.com', '11998877665', 'Banco de Dados, SQL'),
('Mariana', 'Gomes', 'mariana.gomes@email.com', '21998877666', 'Programação, Java'),
('Pedro', 'Nunes', 'pedro.nunes@email.com', '31998877667', 'Estrutura de Dados, Algoritmos'),
('Juliana', 'Dias', 'juliana.dias@email.com', '41998877668', 'Engenharia de Software, UML'),
('Ricardo', 'Silva', 'ricardo.silva@email.com', '51998877669', 'Redes de Computadores, Segurança'),
('Fernanda', 'Castro', 'fernanda.castro@email.com', '61998877670', 'Sistemas Operacionais, Linux'),
('Gustavo', 'Melo', 'gustavo.melo@email.com', '71998877671', 'Matemática, Cálculo'),
('Patrícia', 'Ribeiro', 'patricia.ribeiro@email.com', '81998877672', 'Lógica de Programação, Python'),
('Roberto', 'Freitas', 'roberto.freitas@email.com', '91998877673', 'Segurança da Informação, Criptografia'),
('Sandra', 'Lopes', 'sandra.lopes@email.com', '11998877674', 'Inteligência Artificial, Machine Learning');

-- Inserção de dados na tabela Turmas
INSERT INTO Turmas (disciplina_id, professor_id, ano, semestre) VALUES
(1, 1, 2025, 1),
(2, 2, 2025, 1),
(3, 3, 2025, 1),
(4, 4, 2025, 1),
(5, 5, 2025, 1),
(1, 1, 2024, 2),
(2, 2, 2024, 2),
(6, 6, 2025, 1),
(7, 7, 2025, 1),
(8, 8, 2025, 1);

-- Inserção de dados na tabela Matriculas
INSERT INTO Matriculas (aluno_id, turma_id, data_matricula, nota) VALUES
(1, 1, '2025-02-01', 8.5),
(2, 2, '2025-02-01', 7.8),
(3, 3, '2025-02-02', 9.2),
(4, 4, '2025-02-02', 6.5),
(5, 5, '2025-02-03', 8.0),
(6, 1, '2025-02-03', 7.0),
(7, 2, '2025-02-04', 9.5),
(8, 3, '2025-02-04', 6.0),
(9, 4, '2025-02-05', 8.8),
(10, 5, '2025-02-05', 7.5);


