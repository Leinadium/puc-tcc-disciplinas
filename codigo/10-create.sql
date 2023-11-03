CREATE TABLE IF NOT EXISTS departamentos (
    cod_depto CHAR(3) PRIMARY KEY,
    nome_depto TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS disciplinas (
    cod_disciplina CHAR(7) PRIMARY KEY,
    cod_depto CHAR(3) NOT NULL,
    nome_disciplina TEXT NOT NULL,
    ementa TEXT,
    creditos SMALLINT NOT NULL,
    FOREIGN KEY (cod_depto) REFERENCES departamentos(cod_depto)
);

CREATE TABLE IF NOT EXISTS prerequisitos (
    cod_disc_orig CHAR(7) NOT NULL,
    grupo_prereq SMALLINT NOT NULL,
    cod_disc_depen CHAR(7) NOT NULL,
    PRIMARY KEY (cod_disc_orig, grupo_prereq, cod_disc_depen),
    FOREIGN KEY (cod_disc_orig) REFERENCES disciplinas(cod_disciplina)
);

CREATE TABLE IF NOT EXISTS professores (
    nome_professor TEXT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS turmas (
    cod_turma CHAR(3) NOT NULL,
    cod_disciplina CHAR(7) NOT NULL,
    nome_professor TEXT NOT NULL,
    shf SMALLINT NOT NULL,
    PRIMARY KEY (cod_turma, cod_disciplina),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplinas(cod_disciplina),
    FOREIGN KEY (nome_professor) REFERENCES professores(nome_professor)
);

CREATE TABLE IF NOT EXISTS horarios (
    cod_disciplina CHAR(7) NOT NULL,
    cod_turma CHAR(3) NOT NULL,
    dia CHAR(3) NOT NULL,
    hora_inicio SMALLINT NOT NULL,
    hora_fim SMALLINT,
    PRIMARY KEY (cod_disciplina, cod_turma, dia, hora_inicio),
    FOREIGN KEY (cod_disciplina, cod_turma) REFERENCES turmas(cod_disciplina, cod_turma)
);

CREATE TABLE IF NOT EXISTS alocacoes (
    cod_disciplina CHAR(7) NOT NULL,
    cod_turma CHAR(3) NOT NULL,
    destino VARCHAR(80) NOT NULL,
    vagas SMALLINT NOT NULL,
    PRIMARY KEY (cod_disciplina, cod_turma, destino),
    FOREIGN KEY (cod_disciplina, cod_turma) REFERENCES turmas(cod_disciplina, cod_turma)
);

CREATE TABLE IF NOT EXISTS curriculos (
    cod_curriculo VARCHAR(11) PRIMARY KEY,
    nome_curriculo TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS semestres (
    cod_disciplina CHAR(7) NOT NULL,
    cod_curriculo VARCHAR(11) NOT NULL,
    semestre SMALLINT NOT NULL,
    PRIMARY KEY (cod_disciplina, cod_curriculo),
    -- não é verdade: pode ser que não existe mais a disciplina do currículo, ou mudou o nome
    -- FOREIGN KEY (cod_disciplina) REFERENCES disciplinas(cod_disciplina),
    FOREIGN KEY (cod_curriculo) REFERENCES curriculos(cod_curriculo)
);

CREATE TABLE IF NOT EXISTS usuarios (
    cod_usuario CHAR(7) PRIMARY KEY,
    nome_usuario TEXT NOT NULL,
    cod_curriculo VARCHAR(11),
    FOREIGN KEY (cod_curriculo) REFERENCES curriculos(cod_curriculo)
);

CREATE TABLE IF NOT EXISTS grades (
    cod_grade CHAR(8) PRIMARY KEY,
    cod_usuario CHAR(7) NOT NULL,
    conteudo TEXT NOT NULL,
    FOREIGN KEY (cod_usuario) REFERENCES usuarios(cod_usuario)
);

CREATE TABLE IF NOT EXISTS historicos (
    cod_usuario CHAR(7) NOT NULL,
    cod_disciplina CHAR(7) NOT NULL,
    semestre SMALLINT NOT NULL,
    grau SMALLINT,  -- a disciplina pode nao ter nota
    PRIMARY KEY (cod_usuario, cod_disciplina, semestre),
    FOREIGN KEY (cod_usuario) REFERENCES usuarios(cod_usuario)
    -- sem foreign key para disciplinas,
    -- pois pode ser que o usuário tenha cursado disciplinas que não estão mais no currículo
);

CREATE TABLE IF NOT EXISTS avaliacoes_disciplinas (
    cod_usuario CHAR(7) NOT NULL,
    cod_disciplina CHAR(7) NOT NULL,
    nota_avaliacao SMALLINT NOT NULL,
    data_avaliacao DATE NOT NULL,
    PRIMARY KEY (cod_usuario, cod_disciplina),
    FOREIGN KEY (cod_usuario) REFERENCES usuarios(cod_usuario)
    -- FOREIGN KEY (cod_disciplina) REFERENCES disciplinas(cod_disciplina)
);


CREATE TABLE IF NOT EXISTS avaliacoes_professores (
    cod_usuario CHAR(7) NOT NULL,
    nome_professor TEXT NOT NULL,
    nota_avaliacao SMALLINT NOT NULL,
    data_avaliacao DATE NOT NULL,
    PRIMARY KEY (cod_usuario, nome_professor),
    FOREIGN KEY (cod_usuario) REFERENCES usuarios(cod_usuario)
    -- FOREIGN KEY (nome_professor) REFERENCES professores(nome_professor)
);


CREATE TABLE IF NOT EXISTS modificacao (
    data_ementa DATE NOT NULL,
    data_geral  DATE NOT NULL,
    PRIMARY KEY (data_ementa, data_geral)
)