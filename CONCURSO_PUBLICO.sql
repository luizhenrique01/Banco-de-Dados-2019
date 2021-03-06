CREATE DATABASE CONCURSO_PUBLICO;
USE CONCURSO_PUBLICO;

CREATE TABLE ORGANIZACAO(
CNPJ CHAR(19) NOT NULL,
NOME VARCHAR(80) NOT NULL,
ENDERECO VARCHAR(80) NOT NULL,
PRIMARY KEY(CNPJ)
);

CREATE TABLE DEPARTAMENTO(
ID INT unsigned auto_increment NOT NULL,
NOME VARCHAR(80) NOT NULL,
TELEFONE CHAR(15) NOT NULL,
Primary key(id)
);

CREATE TABLE CONCURSO(
ID INT UNSIGNED auto_increment NOT NULL,
NOME VARCHAR(80) NOT NULL,
DESCRICAO VARCHAR(200) NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE ETAPAS(
ID INT unsigned auto_increment NOT NULL,
NOME VARCHAR(80) NOT NULL,
TIPO varchar(80) NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE CANDIDATO(
ID INT unsigned auto_increment NOT NULL,
NOME VARCHAR(80) NOT NULL,
ENDERECO VARCHAR(80) NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE CARGOS(
ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
NOME VARCHAR(80) NOT NULL,
SALARIO DOUBLE(9,4),
PRIMARY KEY(ID)
);

CREATE TABLE VINCULADOS(
DEPARTAMENTO_ID INT UNSIGNED NOT NULL,
CARGOS_ID INT UNSIGNED NOT NULL,
LOCAL VARCHAR(100) NOT NULL,
TEMPO TIME NOT NULL,
foreign key(DEPARTAMENTO_ID) references DEPARTAMENTO(ID),
foreign key(CARGOS_ID) references CARGOS(ID)
);

CREATE TABLE OFERECIDOS(
CARGOS_ID INT UNSIGNED NOT NULL,
CONCURSO_ID INT UNSIGNED NOT NULL,
DATA DATE NOT NULL,
SALARIO DOUBLE(9,4) NOT NULL,
FOREIGN KEY(CARGOS_ID) REFERENCES CARGOS(ID),
FOREIGN KEY(CONCURSO_ID) REFERENCES CONCURSO(ID)
);

CREATE TABLE PARTICIPA(
ETAPAS_ID INT UNSIGNED NOT NULL,
CANDIDATO_ID INT UNSIGNED NOT NULL,
DATA DATE NOT NULL,
NOTA DOUBLE(3,2),
FOREIGN KEY(ETAPAS_ID) REFERENCES ETAPAS(ID),
FOREIGN KEY(CANDIDATO_ID) REFERENCES CANDIDATO(ID)
);