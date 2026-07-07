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
CREATE TABLE medido(
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


