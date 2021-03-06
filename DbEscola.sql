CREATE DATABASE dbEscola;

USE dbEscola;

-- Criando tabelas
CREATE TABLE tbl_alunos(
	AlunoID int not null identity(1,1) PRIMARY KEY,
	Aluno varchar(20),
	Matricula int
);

CREATE TABLE tbl_disciplinas(
	DisciplinaID int not null identity(1,1) PRIMARY KEY,
	Disciplina varchar(20)
);

CREATE TABLE tbl_notas(
	NotasID int not null identity(1,1) PRIMARY KEY,
	DisciplinaID int FOREIGN KEY REFERENCES tbl_disciplinas(DisciplinaID),
	AlunoID int FOREIGN KEY REFERENCES tbl_alunos(AlunoID),
	Bim_1 decimal(10,2),
	Bim_2 decimal(10,2),
	Bim_3 decimal(10,2),
	Bim_4 decimal(10,2)
);

CREATE TABLE tbl_turmas(
	TurmaID int not null PRIMARY KEY,
	DisciplinaID int FOREIGN KEY REFERENCES tbl_disciplinas(DisciplinaID),
	AlunoID int FOREIGN KEY REFERENCES tbl_alunos(AlunoID),
	Sala int
);

-- Inserindo dados a cada tabela
INSERT INTO tbl_alunos (Aluno, Matricula) 
VALUES	('Ana',		 31415),
		('Beatriz',	 92686),
		('Carlos',	 79536),
		('Daniel',	 56433),
		('Eduarda',	 13869),
		('Fernanda', 42680),
		('Gabriel',	 21443),
		('Irene',	 67122);

INSERT INTO tbl_disciplinas (Disciplina) 
VALUES	('Português'),
		('Inglês'),
		('Matemática'),
		('História'),
		('Geografia'),
		('Física'),
		('Química'),
		('Biologia');

INSERT INTO tbl_notas (DisciplinaID, AlunoID, Bim_1) 
VALUES	(1, 1, 10),
		(1, 2, 9.33),
		(1, 3, 8.7),
		(1, 4, 7.5),
		(1, 5, 8.9),
		(1, 6, 10),
		(2, 1, 9),
		(2, 2, 8),
		(2, 3, 9),
		(2, 4, 9.5),
		(2, 5, 9.9),
		(2, 6, 10);

INSERT INTO tbl_turmas (TurmaID, DisciplinaID, AlunoID, Sala) 
VALUES	(600, 1, 1, 101),
		(600, 1, 2, 101),
		(600, 1, 3, 101),
		(600, 1, 4, 101),
		(600, 1, 5, 101),
		(600, 1, 6, 101),
		(600, 2, 1, 103),
		(600, 2, 2, 103),
		(600, 2, 3, 103),
		(600, 2, 4, 103),
		(600, 2, 5, 103),
		(600, 2, 6, 103);

-- Verificando tabelas
SELECT * FROM tbl_alunos;
SELECT * FROM tbl_disciplinas;
SELECT * FROM tbl_notas;
SELECT * FROM tbl_turmas;

-- Selecionando o nome do aluno, a nota no bimestre 1 e a disciplina
SELECT Aluno, Bim_1, Disciplina FROM tbl_notas						-- SELECT <coluna desejada das tabelas juntas>, ..., <coluna desej[...]> FROM <tabela_base>
INNER JOIN tbl_disciplinas								-- INNER JOIN <tabela a ser juntada> 
ON tbl_notas.DisciplinaID = tbl_disciplinas.DisciplinaID			        -- ON <condicao para que junte> -> nesse caso quando retorna as tabelas ordenadas para quando DisciplinasID tem o mesmo "valor" nas duas tabelas
INNER JOIN tbl_alunos ON tbl_notas.AlunoID = tbl_alunos.AlunoID;	                -- INNER JOIN <tabela que a ser juntada> ON <condicao para que junte>
