
CREATE TABLE atletas (
    id INTEGER,
    nome_completo VARCHAR(255),
    nome_abreviado VARCHAR(50),
    nome_oficial VARCHAR(255),
    genero VARCHAR(10),
    tipo_atleta VARCHAR(20),
    codigo_pais VARCHAR(3),
    pais VARCHAR(50),
    nacionalidade VARCHAR(50),
    residencia VARCHAR(50),
    origem VARCHAR(50),
    codigo_federacao VARCHAR(3),
    altura INTEGER,
    peso INTEGER,
    esportes TEXT[],
    eventos TEXT[],
    data_aniverario DATE 
);

SELECT * FROM atletas
DROP TABLE atletas;

INSERT INTO atletas (
    id,nome_completo,nome_abreviado,nome_oficial,genero,tipo_atleta,codigo_pais,pais,nacionalidade,residencia,origem,codigo_federacao,altura,peso,esportes,eventos,data_aniverario
) VALUES
(1535420, 'VALENCIA Alejandra', 'VALENCIA A', 'Alejandra VALENCIA', 'Female', 'Athlete', 'MEX', 'Mexico', 'Mexico', 'Mexico', 'Mexico', 'MEX', 0, 0, ARRAY['Archery'], ARRAY['Women''s Individual', 'Women''s Team', 'Mixed Team'], '1994-10-17'),
(1535429, 'RUIZ Angela', 'RUIZ A', 'Angela RUIZ', 'Female', 'Athlete', 'MEX', 'Mexico', 'Mexico', 'Mexico', 'Mexico', 'MEX', 0, 0, ARRAY['Archery'], ARRAY['Women''s Individual', 'Women''s Team'], '2006-07-28'),
(1535430, 'GRANDE Matias', 'GRANDE M', 'Matias GRANDE', 'Male', 'Athlete', 'MEX', 'Mexico', 'Mexico', 'Mexico', 'Mexico', 'MEX', 0, 0, ARRAY['Archery'], ARRAY['Men''s Individual', 'Men''s Team', 'Mixed Team'], '2004-04-26'),
(1536460, 'ROJAS Carlos', 'ROJAS C', 'Carlos ROJAS', 'Male', 'Athlete', 'MEX', 'Mexico', 'Mexico', 'Mexico', 'Mexico', 'MEX', 0, 0, ARRAY['Archery'], ARRAY['Men''s Individual', 'Men''s Team'], '2000-01-14'),
(1536467, 'MARTINEZ WING Bruno', 'MARTINEZ WING B', 'Bruno MARTINEZ WING', 'Male', 'Athlete', 'MEX', 'Mexico', 'Mexico', 'Mexico', 'Mexico', 'MEX', 0, 0, ARRAY['Archery'], ARRAY['Men''s Individual', 'Men''s Team'], '1998-03-08'),
(1536479, 'VAZQUEZ Ana', 'VAZQUEZ A', 'Ana VAZQUEZ', 'Female', 'Athlete', 'MEX', 'Mexico', 'Mexico', 'Mexico', 'Mexico', 'MEX', 0, 0, ARRAY['Archery'], ARRAY['Women''s Individual', 'Women''s Team'], '2000-10-05'),
(1536632, 'FALLAH Mobina', 'FALLAH M', 'Mobina FALLAH', 'Female', 'Athlete', 'IRI', 'IR Iran', 'Islamic Republic of Iran', 'IR Iran', 'Islamic Republic of Iran', 'IRI', 0, 0, ARRAY['Archery'], ARRAY['Women''s Individual'], '1999-08-13'),
(1537163, 'D''AMOUR Nicholas', 'D''AMOUR N', 'Nicholas D''AMOUR', 'Male', 'Athlete', 'ISV', 'Virgin Islands, US', 'Virgin Islands, US', 'United States', 'United States of America', 'USA', 0, 0, ARRAY['Archery'], ARRAY['Men''s Individual'], '2001-09-04'),
(1535421, 'VALENCIA Alejandra', 'VALENCIA A', 'Alejandra VALENCIA', 'Female', 'Athlete', 'MEX', 'Mexico', 'Mexico', 'Mexico', 'Mexico', 'MEX', 0, 0, ARRAY['Archery'], ARRAY['Women''s Individual', 'Women''s Team', 'Mixed Team'], '1994-10-18'),
(1541265, 'BARBELIN Lisa', 'BARBELIN L', 'Lisa BARBELIN', 'Female', 'Athlete', 'FRA', 'France', 'France', 'France', 'France', 'FRA', 0, 0, ARRAY['Archery'], ARRAY['Women''s Individual', 'Women''s Team', 'Mixed Team'], '2000-04-10')

-- apagando a coluna de function 
ALTER TABLE atletas
DROP COLUMN tipo_atleta;
-- mundado nome da tabela 
ALTER TABLE atletas
RENAME TO atletas2024;

-- imprimindo tabela nova 
SELECT * FROM atletas2024
DROP TABLE atletas2024;


-- Adicionando seq
CREATE SEQUENCE atletas2024_id_seq;
-- Passo 2: Alterar a coluna id para usar a sequência criada
ALTER TABLE atletas2024
ALTER COLUMN id SET DEFAULT nextval('atletas2024_id_seq');
-- Passo 3: Adicionar a chave primária à coluna id
ALTER TABLE atletas2024
ADD PRIMARY KEY (id);


-- criando coluna 
ALTER TABLE atletas2024
ADD COLUMN status VARCHAR(20);

--alterando tipo de dado da coluna 
SELECT DISTINCT peso FROM atletas2024; -- comando que verifica se pode ser mudado ou nao 
SELECT DISTINCT altura FROM atletas2024;

ALTER TABLE atletas2024
ALTER COLUMN peso TYPE VARCHAR(10) USING peso::VARCHAR; -- mudando de int para varchar

ALTER TABLE atletas2024
ALTER COLUMN altura TYPE VARCHAR(10) USING altura::VARCHAR;
