-- BASE DE DADOS
CREATE DATABASE IF NOT EXISTS Universidade
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE Universidade;

-- TABELAS DIMENSIONAIS

CREATE TABLE DimProfessor (
    ProfessorSK INT AUTO_INCREMENT PRIMARY KEY,
    ProfessorID INT NOT NULL,
    NomeProfessor VARCHAR(100),
    Titulacao VARCHAR(50),
    TempoInstituicao INT,
    UNIQUE (ProfessorID)
) ENGINE=InnoDB;

CREATE TABLE DimDepartamento (
    DepartamentoSK INT AUTO_INCREMENT PRIMARY KEY,
    DepartamentoID INT NOT NULL,
    NomeDepartamento VARCHAR(100),
    Campus VARCHAR(80),
    NomeCoordenador VARCHAR(100),
    UNIQUE (DepartamentoID)
) ENGINE=InnoDB;

CREATE TABLE DimCurso (
    CursoSK INT AUTO_INCREMENT PRIMARY KEY,
    CursoID INT NOT NULL,
    NomeCurso VARCHAR(100),
    Modalidade VARCHAR(30),
    Nivel VARCHAR(30),
    UNIQUE (CursoID)
) ENGINE=InnoDB;

CREATE TABLE DimDisciplina (
    DisciplinaSK INT AUTO_INCREMENT PRIMARY KEY,
    DisciplinaID INT NOT NULL,
    NomeDisciplina VARCHAR(100),
    CargaHoraria INT,
    NumeroCreditos INT,
    PossuiPreRequisitos TINYINT(1),
    UNIQUE (DisciplinaID)
) ENGINE=InnoDB;

CREATE TABLE DimData (
    DataSK INT PRIMARY KEY,
    DataCompleta DATE NOT NULL,
    Ano INT,
    Semestre INT,
    Trimestre INT,
    Mes INT,
    NomeMes VARCHAR(20),
    Dia INT,
    DiaSemana VARCHAR(20)
) ENGINE=InnoDB;

-- TABELA FATO

CREATE TABLE FatoProfessorOferta (
    FatoID INT AUTO_INCREMENT PRIMARY KEY,

    ProfessorSK INT NOT NULL,
    DisciplinaSK INT NOT NULL,
    CursoSK INT NOT NULL,
    DepartamentoSK INT NOT NULL,
    DataOfertaSK INT NOT NULL,

    Qtd_Creditos INT,
    Qtd_PreRequisitos INT,
    Qtd_Alunos_Matriculados INT,

    CONSTRAINT FK_Fato_Professor
        FOREIGN KEY (ProfessorSK) REFERENCES DimProfessor(ProfessorSK),
    CONSTRAINT FK_Fato_Disciplina
        FOREIGN KEY (DisciplinaSK) REFERENCES DimDisciplina(DisciplinaSK),
    CONSTRAINT FK_Fato_Curso
        FOREIGN KEY (CursoSK) REFERENCES DimCurso(CursoSK),
    CONSTRAINT FK_Fato_Departamento
        FOREIGN KEY (DepartamentoSK) REFERENCES DimDepartamento(DepartamentoSK),
    CONSTRAINT FK_Fato_Data
        FOREIGN KEY (DataOfertaSK) REFERENCES DimData(DataSK)
) ENGINE=InnoDB;
