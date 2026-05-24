create database RPGACERVO;
use RPGACERVO;

-- Tabela Tipo
CREATE TABLE Tipo (
    idQuestionario INT          NOT NULL AUTO_INCREMENT,
    nome           VARCHAR(45)  NOT NULL,
    pontuacao      INT          NOT NULL,
    descricao      VARCHAR(120),
    PRIMARY KEY (idQuestionario)
);

-- Tabela Usuarios
CREATE TABLE Usuarios (
    idUsuarios INT          NOT NULL AUTO_INCREMENT,
    nome       VARCHAR(50)  NOT NULL,
    email      VARCHAR(50)  NOT NULL,
    senha      VARCHAR(50)  NOT NULL,
    PRIMARY KEY (idUsuarios)
);

-- Tabela Quiz
CREATE TABLE Quiz (
    idQuizz    INT      NOT NULL AUTO_INCREMENT,
    fkUsuario  INT      NOT NULL,
    fkTipo     INT      NOT NULL,
    data       DATETIME NOT NULL,
    PRIMARY KEY (idQuizz),
    CONSTRAINT fk_quiz_usuario
        FOREIGN KEY (fkUsuario) REFERENCES Usuarios (idUsuarios),
    CONSTRAINT fk_quiz_tipo
        FOREIGN KEY (fkTipo)    REFERENCES Tipo (idQuestionario)
);
