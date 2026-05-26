drop database RPGACERVO;

create database RPGACERVO;
use RPGACERVO;


-- Tabela Tipo

CREATE TABLE Tipo (
    idQuestionario INT          NOT NULL AUTO_INCREMENT,
    fkUsuario INT ,
    nome           VARCHAR(45)  NOT NULL,
    descricao      VARCHAR(120),
    PRIMARY KEY (idQuestionario),
    constraint fk_tipo_usuario
		foreign key (fkUsuario) references Usuario (idUsuario)
);


-- Tabela Usuario
CREATE TABLE Usuario (
    idUsuario INT          NOT NULL AUTO_INCREMENT,
    nome       VARCHAR(50)  NOT NULL,
    email      VARCHAR(50)  NOT NULL,
    senha      VARCHAR(50)  NOT NULL,
    PRIMARY KEY (idUsuario)
);

-- Tabela Quiz
CREATE TABLE Quiz (
    idQuizz    INT      NOT NULL AUTO_INCREMENT,
    fkUsuario  INT      NOT NULL,
    pontuacao int,
    fkTipo     INT      NOT NULL,
    data       DATETIME NOT NULL,
    PRIMARY KEY (idQuizz),
    CONSTRAINT fk_quiz_usuario
        FOREIGN KEY (fkUsuario) REFERENCES Usuario (idUsuario),
    CONSTRAINT fk_quiz_tipo
        FOREIGN KEY (fkTipo)    REFERENCES Tipo (idQuestionario)
);


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
