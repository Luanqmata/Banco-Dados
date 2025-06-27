-- Script de Criação das Tabelas

CREATE DATABASE IF NOT EXISTS faculdade_iesgo;
USE faculdade_iesgo;

-- Tabela Alunos
CREATE TABLE IF NOT EXISTS Alunos (
    aluno_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    cep VARCHAR(10)
);

-- Tabela Cursos
CREATE TABLE IF NOT EXISTS Cursos (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT,
    carga_horaria INT
);

-- Tabela Disciplinas
CREATE TABLE IF NOT EXISTS Disciplinas (
    disciplina_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_disciplina VARCHAR(100) NOT NULL UNIQUE,
    carga_horaria_disciplina INT,
    curso_id INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);

-- Tabela Professores
CREATE TABLE IF NOT EXISTS Professores (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    especializacao VARCHAR(255)
);

-- Tabela Turmas
CREATE TABLE IF NOT EXISTS Turmas (
    turma_id INT PRIMARY KEY AUTO_INCREMENT,
    disciplina_id INT NOT NULL,
    professor_id INT NOT NULL,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(disciplina_id),
    FOREIGN KEY (professor_id) REFERENCES Professores(professor_id)
);

-- Tabela Matriculas
CREATE TABLE IF NOT EXISTS Matriculas (
    matricula_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    turma_id INT NOT NULL,
    data_matricula DATE NOT NULL,
    nota DECIMAL(4,2),
    FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id)
);


