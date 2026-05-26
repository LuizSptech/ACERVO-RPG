-- DROP DATABASE ACERVORPG;

CREATE DATABASE ACERVORPG;
USE ACERVORPG;


-- TABELA USUARIO


CREATE TABLE Usuario (
    idUsuario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,

    PRIMARY KEY (idUsuario)
);


-- TABELA TIPO


CREATE TABLE Tipo (
    idTipo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(200),

    PRIMARY KEY (idTipo)
);


-- TABELA QUIZ


CREATE TABLE Quiz (
    idQuiz INT NOT NULL AUTO_INCREMENT,
    fkUsuario INT NOT NULL,
    fkTipoResultado INT NOT NULL,
    dataQuiz DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (idQuiz),

    CONSTRAINT fkQuizUsuario
        FOREIGN KEY (fkUsuario)
        REFERENCES Usuario(idUsuario),

    CONSTRAINT fkQuizTipo
        FOREIGN KEY (fkTipoResultado)
        REFERENCES Tipo(idTipo)
);


-- TABELA resultadoQuiz


CREATE TABLE ResultadoQuiz (
    idResultadoQuiz INT NOT NULL AUTO_INCREMENT,
    fkQuiz INT NOT NULL,
    fkTipo INT NOT NULL,
    pontuacao INT NOT NULL,

    PRIMARY KEY (idResultadoQuiz),

    CONSTRAINT fkResultadoQuiz
        FOREIGN KEY (fkQuiz)
        REFERENCES Quiz(idQuiz),

    CONSTRAINT fkResultadoTipo
        FOREIGN KEY (fkTipo)
        REFERENCES Tipo(idTipo)
);


-- INSERT

INSERT INTO Tipo (nome, descricao) values 
('Protagonista', 'Você naturalmente assume liderança e conduz o grupo em momentos importantes. Suas decisões movem a história.');

INSERT INTO Tipo (nome, descricao) values 
('Combeiro', 'Você adora explorar mecânicas, criar builds fortes e encontrar maneiras eficientes de vencer desafios.');

INSERT INTO Tipo (nome, descricao) values 
('Advogado de Regras', 'Você valoriza consistência e domínio do sistema. Conhecer as regras faz parte da diversão');

INSERT INTO Tipo (nome, descricao) values 
('Narrador / Ator', 'Você joga pela interpretação, narrativa e profundidade emocional dos personagens.');

INSERT INTO Tipo (nome, descricao) values 
('Suporte', 'Você entende a dinâmica da mesa e ajuda o grupo a funcionar bem, mesmo sem buscar os holofotes.');

INSERT INTO Tipo (nome, descricao) values 
('Mestre', 'Você domina regras, narrativa e estratégia. Talvez não seja só um jogador, mas o mestre da campanha.');

select * from Tipo;
select * from Usuario;
select * from Quiz;
select * from ResultadoQuiz;

SELECT idUsuario, nome, email FROM Usuario WHERE email = 'luizfernandolufe@yahoo.com.br' AND senha = '1234567';
SELECT idUsuario, nome, email FROM Usuario WHERE email = 'luizfernando@yahoo.com' AND senha = '1234567';