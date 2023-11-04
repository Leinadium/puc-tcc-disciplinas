WITH rec_c1 AS (
    SELECT cod_disciplina
    FROM semestres
    WHERE cod_curriculo = 
          (SELECT cod_curriculo FROM usuarios where cod_usuario = @usuario)
), rec_c2_1 AS (
    SELECT s.cod_disciplina, count(u.cod_usuario) as qtd
    FROM semestres s, usuarios u
    WHERE s.cod_curriculo = u.cod_curriculo
      AND u.cod_curriculo = 
          (SELECT cod_curriculo FROM usuarios where cod_usuario = @usuario)
    GROUP BY s.cod_disciplina
), rec_c2_2 AS (
    SELECT count(cod_usuario)
    FROM usuarios
    WHERE cod_curriculo = 
          (SELECT cod_curriculo FROM usuarios where cod_usuario = @usuario)
), rec_h AS (
    SELECT h1.cod_disciplina, count(DISTINCT h1.cod_turma) as possiveis, todas
	FROM horarios h1
		LEFT JOIN (
			SELECT cod_disciplina, count(cod_turma) as todas
			FROM turmas
			GROUP BY cod_disciplina
	) AS h2 ON h1.cod_disciplina = h2.cod_disciplina
	WHERE (dia, hora_inicio, hora_fim) NOT IN (
		SELECT dia, hora_inicio, hora_fim
		FROM horarios
		WHERE @escolhas
	)
	GROUP BY h1.cod_disciplina, todas
), rec_o AS (
    SELECT cod_disciplina, avg(nota_avaliacao) as media
    FROM avaliacoes_disciplinas
    GROUP BY cod_disciplina
), rec_p AS (
    SELECT d.cod_disciplina, avg(a.nota_avaliacao) as media
    FROM disciplinas d, avaliacoes_professores a, turmas t
    WHERE d.cod_disciplina = t.cod_disciplina
    AND t.nome_professor = a.nome_professor
    GROUP BY d.cod_disciplina, d.nome_disciplina
), rec_a AS (
    SELECT cod_disciplina, avg(grau) as media
    FROM historicos
    GROUP BY cod_disciplina
), filtro AS (
    SELECT d.cod_disciplina
    FROM disciplinas d
    WHERE cod_disciplina NOT IN (
        SELECT h.cod_disciplina
        FROM historicos h
        WHERE cod_usuario = @usuario
    )
)

SELECT f.cod_disciplina,
    c1.cod_disciplina IS NOT NULL conteudo1,
    c2_1.qtd conteudo21,
    c2_2.count conteudo22,
    h.cod_disciplina IS NOT NULL horario,
    o.media opiniao,
    p.media professor,
    a.media avaliacao
FROM filtro f
    LEFT JOIN rec_c1 c1 ON f.cod_disciplina = c1.cod_disciplina
    LEFT JOIN rec_c2_1 c2_1 ON f.cod_disciplina = c2_1.cod_disciplina
    LEFT JOIN rec_h h ON f.cod_disciplina = h.cod_disciplina
    LEFT JOIN rec_o o ON f.cod_disciplina = o.cod_disciplina
    LEFT JOIN rec_p p ON f.cod_disciplina = p.cod_disciplina
    LEFT JOIN rec_a a ON f.cod_disciplina = a.cod_disciplina,
    rec_c2_2 c2_2