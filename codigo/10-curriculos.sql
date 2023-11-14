INSERT INTO curriculos (cod_curriculo, nome_curriculo)
SELECT * FROM (
    VALUES ('CCPBCC20181', 'Ciência da Computação (Bacharelado) - Currículo 18.1')
) AS i (cod_curriculo, nome_curriculo)
WHERE NOT EXISTS (
    SELECT cod_curriculo
    FROM curriculos
    WHERE cod_curriculo = i.cod_curriculo
);

CREATE OR REPLACE PROCEDURE inserir_curriculo_cie_18_1()
LANGUAGE SQL
BEGIN ATOMIC
    DELETE FROM semestres WHERE cod_curriculo = 'CCPBCC20181';

    INSERT INTO semestres (cod_curriculo, cod_disciplina, semestre)
    SELECT * FROM (VALUES
        ('CCPBCC20181', 'INF1025', 1),
        ('CCPBCC20181', 'INF1012', 1),
        ('CCPBCC20181', 'INF1009', 1),
        ('CCPBCC20181', 'INF1031', 1),
        -- ....
        -- ....
        ('CCPBCC20181', 'INF0381', 8),
        ('CCPBCC20181', 'INF1951', 8)
    ) AS i (cod_curriculo, cod_disciplina, semestre)
    WHERE EXISTS (
        SELECT cod_disciplina
        FROM disciplinas
        WHERE cod_disciplina = i.cod_disciplina
    );
END