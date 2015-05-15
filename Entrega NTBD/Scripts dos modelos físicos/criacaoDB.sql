-- DROP TABLE Consulta;
-- DROP TABLE Paciente;
-- DROP TABLE HospitalDpto;
-- DROP TABLE Hospital;
-- DROP TABLE Departamento;
-- DROP TABLE Convenio;
-- DROP TABLE Medico;

CREATE TABLE Convenio(
	codigo				INT PRIMARY KEY,
	nome				VARCHAR(60),
	numeroconvenio		VARCHAR(10),
	datainicio			DATE,
	datavalidade		DATE,
	nometitular			VARCHAR(60),
	tipo				VARCHAR(30)
);

CREATE TABLE Medico(
	codigo				INT PRIMARY KEY,
	nome 				VARCHAR(60),
	CRM					VARCHAR(6),
	especialidade		VARCHAR(60),
	datanasc			DATE,
	datainiciocarreira	DATE,
	sexo				VARCHAR(10),
	telefone			VARCHAR(9),
	cidade				VARCHAR(60),
	estado 				VARCHAR(60),
	pais 				VARCHAR(60)
);

CREATE TABLE Departamento(
	codigo				INT PRIMARY KEY,
	nomedpto			VARCHAR(60)
);

CREATE TABLE Hospital(
	codigo				INT PRIMARY KEY,
	nome 				VARCHAR(60),
	endereco			VARCHAR(60),
	telefone			VARCHAR(9)
);

CREATE TABLE HospitalDpto(
	hospital_codigo		INT,
	departamento_codigo	INT,
	especialidade		VARCHAR(60),
	PRIMARY KEY (hospital_codigo, departamento_codigo),
	FOREIGN KEY (hospital_codigo) REFERENCES Hospital(codigo) ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY (departamento_codigo) REFERENCES Departamento(codigo) ON DELETE SET NULL ON UPDATE SET NULL
);

CREATE TABLE Paciente(
	codigo 				INT PRIMARY KEY,
	convenio_codigo		INT,
	nome 				VARCHAR(60),
	CPF					VARCHAR(11),
	RG					VARCHAR(9),
	sexo				VARCHAR(10),
	datanasc			DATE,
	estadocivil			VARCHAR(8),
	CEP					VARCHAR(9),
	cidade				VARCHAR(60),
	FOREIGN KEY	(convenio_codigo) REFERENCES Convenio(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Consulta(
	codigo 								INT,
	paciente_codigo 					INT,
	medico_codigo						INT,
	hospitaldpto_departamento_codigo	INT,
	hospitaldpto_hospital_codigo		INT,
	dataconsulta						DATE,
	dataagendamento						DATE,
	statusdiagnostico					VARCHAR(19),
	PRIMARY KEY (codigo, paciente_codigo, medico_codigo, hospitaldpto_departamento_codigo, hospitaldpto_hospital_codigo),
	FOREIGN KEY (paciente_codigo) REFERENCES Paciente (codigo),
	FOREIGN KEY (medico_codigo) REFERENCES Medico (codigo),
	FOREIGN KEY (hospitaldpto_hospital_codigo, hospitaldpto_departamento_codigo) REFERENCES HospitalDpto(hospital_codigo, departamento_codigo)
);

-- consulta (statusdiagnostico<Ineficaz, Em tratamento, Parcialmente eficaz e Eficaz>)
-- convenio (tipo<pleno ou semi-pleno>)

-- Convenios (
-- Allians Saúde
-- Ameplan
-- Amesp
-- Amil Saúde
-- Avimed
-- Biovida
-- Blue Life
-- Blue Med Saúde
-- Bradesco Saúde
-- Caixa Saúde
-- Care Plus
-- Classes Laboriosas
-- Garantia de Saúde
-- Golden Cross
-- Greenline
-- Intermédica
-- Itálica
-- Lam Saúde
-- Lincx
-- Marítima Saúde
-- Medical Health
-- Medisantas Brasil
-- Med-Tour
-- Next Seisa
-- Notre Dame
-- Oeste Saúde
-- Omega Saúde
-- Omint
-- One Health
-- Porto Seguro Saúde
-- Prevent Sênior
-- Samcil
-- Santa Helena Saúde
-- Santamalia
-- Medicol
-- Serma
-- Sul América
-- Unimed
-- )

-- Especialidades(
-- Acupuntura
-- Alergia e Imunologia
-- Anestesiologia
-- Angiologia
-- Oncologia
-- Cardiologia
-- Cirurgia Cardiovascular
-- Cirurgia da Mão
-- Cirurgia de cabeça e pescoço
-- Cirurgia do Aparelho Digestivo
-- Cirurgia Geral
-- Cirurgia Pediátrica
-- Cirurgia Plástica
-- Cirurgia Torácica
-- Cirurgia Vascular
-- Clínica Médica
-- Coloproctologia
-- Dermatologia
-- Endocrinologia e Metabologia
-- Endoscopia
-- Gastroenterologia
-- Genética médica
-- Geriatria
-- Ginecologia e obstetrícia
-- Hematologia e Hemoterapia
-- Homeopatia
-- Infectologia
-- Mastologia
-- Medicina de Família e Comunidade
-- Medicina do Trabalho
-- Medicina do Tráfego
-- Medicina Esportiva
-- Medicina Física e Reabilitação
-- Medicina Intensiva
-- Medicina Legal e Perícia Médica
-- Medicina Nuclear
-- Medicina Preventiva e Social
-- Nefrologia
-- Neurocirurgia
-- Neurologia
-- Nutrologia
-- Oftalmologia
-- Ortopedia e Traumatologia
-- Otorrinolaringologia
-- Patologia
-- Patologia Clínica
-- Pediatria
-- Pneumologia
-- Psiquiatria
-- Radiologia e Diagnóstico por Imagem
-- Radioterapia
-- Reumatologia
-- Urologia
-- )