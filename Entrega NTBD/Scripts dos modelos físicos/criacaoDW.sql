-- ----------------------------------------------------------------------------

-- Universidade Federal de São Carlos - UFSCar Sorocaba
-- Novas Tecnologias em Banco de Dados
-- Professora Sahudy Montenegro González
-- Projeto Data Warehouse - Fase Intermediária. Modelagem, projeto físico e ETL

-- -----------------------------------------------------------------------------

-- Daniel Ramos Miola			438340
-- Igor Felipe Ferreira Ceridório	408611
-- Monique Spessoto Ribeiro   		489964

-- Arquivo: criacaoDW.sql
-- Objetivo: script sql com o objetivo de implementar o modelo lógico do data warehouse
-- utilizado no projeto.

-- DROP TABLE Local;
-- DROP TABLE Medico;
-- DROP TABLE Tempo;
-- DROP TABLE Paciente;
-- DROP TABLE Convenio;
-- DROP TABLE Consultas;

--Criação da dimensão Local
CREATE TABLE Local(
	codigo			SERIAL PRIMARY KEY,
	nome_hospital		VARCHAR(60),
	nome_dpto		VARCHAR(60)
);

--Criação da dimensão Medico
CREATE TABLE Medico(
	codigo			BIGINT PRIMARY KEY,
	nome			VARCHAR(50),
	especialidade		VARCHAR(20),
	cidade			VARCHAR(60),
	estado			VARCHAR(60),
	pais			VARCHAR(60),
	ultima_atualizacao	TIMESTAMP
);

--Criação da dimensão Tempo
CREATE TABLE Tempo(
	codigo			SERIAL PRIMARY KEY,
	dia			INT,
	mes			INT,
	ano			INT
);

--Criação da dimensão Paciente
CREATE TABLE Paciente(
	codigo			BIGINT PRIMARY KEY,
	nome			VARCHAR(50),
	sexo			CHAR,
	data_nasc		DATE
);

--Criação da dimensão Convenio
CREATE TABLE Convenio(
	codigo			BIGINT PRIMARY KEY,
	nome			VARCHAR(20)
);

--Criação do fato Consultas
CREATE TABLE Consultas(
	cod_local		BIGINT,
	cod_medico		BIGINT,
	cod_tempo		BIGINT,
	cod_paciente		BIGINT,
	cod_convenio		BIGINT,
	contador_pacientes	BIGINT,
	media_agendamento	BIGINT,
	contador_tratamento	BIGINT,
	FOREIGN KEY	(cod_local) 	REFERENCES Local(codigo)	ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY	(cod_medico) 	REFERENCES Medico(codigo) 	ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY	(cod_tempo) 	REFERENCES Tempo(codigo) 	ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY	(cod_paciente) 	REFERENCES Paciente(codigo) 	ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY	(cod_convenio)	REFERENCES Convenio(codigo)	ON DELETE SET NULL ON UPDATE SET NULL
);
