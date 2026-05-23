CREATE DATABASE RPGACERVO;

use RPGACERVO;


CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) not null,
	email VARCHAR(50) not null unique,
	senha VARCHAR(50) not null
    );

create table esteriotipos (
	id int primary key auto_increment,
    nome varchar (50),
    descricao text
    );

select * from usuario;


desc usuario;
