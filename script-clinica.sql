-- Vamos criar um banco de dados para uma clinica
-- COMANDO DDL para criar um banco de dados:  CREATE DATABASE
CREATE DATABASE clinica;
-- Vamo selecionar o banco clinica com o comando USE
USE clinica;
-- Criar as tabelas com o comando CREATE TABLE
CREATE TABLE paciente(
idpaciente int auto_increment primary key,
nomepaciente varchar(50) not null,
cpfpaciente varchar(13) not null unique,
email varchar(100) not null unique,
telefone varchar(15) not null,
datanascimento date not null
);
CREATE TABLE medico(
idmedico int auto_increment primary key,
nomemedico varchar(50) not null,
crm varchar(20) not null unique,
email varchar(100)  not null unique,
especialidade enum("Pediatria","Oftalmologia","Cardiologia","Dermatologia") not null  default "Dermatologia",
datacadastro date default current_timestamp()
);

CREATE TABLE agendamento(
idagendamento int auto_increment primary key,
idpaciente int not null,
idmedico int not null,
dataconsulta date not null,
horaconsulta time not null,
datahoraagendamento datetime default current_timestamp()
);

ALTER TABLE agendamento
ADD CONSTRAINT `fk_agendamento_pk_paciente`
FOREIGN KEY `agendamento`(`idpaciente`)
REFERENCES `paciente`(`idpaciente`);

ALTER TABLE agendamento
ADD CONSTRAINT `fk_agendamento_pk_medico`
FOREIGN KEY `agendamento`(`idmedico`)
REFERENCES `medico`(`idmedico`);


-- Vamos fazer uso do comando SELECT para selecionar os dados da tabela
-- paciente
-- SELECT : COMANDO PARA SELECIONAR
-- * (ASTERISCO) INDICA QUE TODOS OS CAMPOS DA TABELA SERÃO SELECIONADOS
-- FROM INDICA A ORIGEM, OU SEJA, DE ONDE VEM OS DADOS
-- NOME DA TABELA
SELECT * FROM paciente;
-- Vamos usar o comando INSERT para cadastrar um novo paciente
-- INSERT -> INSERIR
-- INTO -> DENTRO
-- DEFINIÇÃO DE QUAIS CAMPOS SERÃO CADASTRADOS
-- VALUES -> VALORES
-- DEFINIÇÃO DE VALORES QUE SERÃO CADASTRADOS
INSERT INTO paciente(nomepaciente,cpfpaciente,email,telefone,datanascimento)
VALUES("Vagner Souza","22222222222","vagner@gmail.com","11111111","1992-02-18");

