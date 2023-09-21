# Dados

## Tabelas

* disciplina
  * (text) cod-disciplina [PK]
  * (text) nome
  * (text) ementa
  * (int)  creditos
  * (text) cod-departamento [FK]

* turma
  * (text) cod-disciplina [PK] [FK]
  * (text) cod-turma [PK] [FK]
  * (int)  vagas
  * (text) destino
  * (text) cod-professor [FK]

* disponibilidade
  * (text) cod-disciplina  [PK] [FK]
  * (text) cod-turma       [PK] [FK]
  * (enum) dia             [PK]
  * (int)  hora-inicio
  * (int)  hora-fim
  * (bool) shf

* professor
  * (string) cod-professor
  * (string) nome

* usuario (a verificar)
  * (text) cod
  * (text) nome
  * (bin)  senha-hash

* avaliacao-disciplina
  * (text) id [PK]
  * (text) cod-usuario [FK]
  * (text) cod-disciplina [FK]
  * (int)  nota1 (a definir)
  * (int)  nota2 (a definir)

* avaliacao-professor
  * (text) id [PK]
  * (text) cod-usuario [FK]
  * (text) cod-professor
  * (int)  nota

* grades
  * (text) id [PK]
  * (bin)  conteudo
