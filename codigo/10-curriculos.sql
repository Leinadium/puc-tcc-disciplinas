-- removendo o currículo, se ja existir
DELETE FROM curriculos WHERE cod_curriculo = 'CCPBCO20180';
-- inserindo o curriculo
INSERT INTO curriculos (cod_curriculo, nome_curriculo)
VALUES ('CCPBCO20180', 'Ciência da Computação (Bacharelado) - Currículo 18.0');
-- removendo as disciplinas, se ja existirem
DELETE FROM semestres WHERE cod_curriculo = 'CCPBCO20180';
-- inserindo as disciplinas
INSERT INTO semestres (cod_curriculo, cod_disciplina, semestre)
SELECT * FROM (VALUES
    ('CCPBCO20180', 'INF1025', 1),
    ('CCPBCO20180', 'INF1012', 1),
    ('CCPBCO20180', 'INF1009', 1),
    -- ...
    ('CCPBCO20180', 'INF1951', 8)
) AS i (cod_curriculo, cod_disciplina, semestre)
WHERE EXISTS (
    SELECT cod_disciplina
    FROM disciplinas
    WHERE cod_disciplina = i.cod_disciplina
);