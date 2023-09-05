# Casos de Uso do Sistema

## UC01 - Cadastrar informações

**Objetivo**: Permitir que o usuário cadastre suas informações pessoais no sistema para personalizar as recomendações

**Requisitos**: RF08, RF09

**Atores**: Usuário

**Pré condições**: O usuário seleciona a opção _Montar Grade Horária_, e este não possui nenhuma informação pré-cadastrada.

**Fluxo principal**:

* [1] O sistema exibe uma tela solicitando o histórico escolar do aluno, e um botão de pular.
* [2] O usuário submete o histórico escolar. **[A1]**
* [3] O sistema armazena o histórico, curso atual, período atual e o currículo do aluno.
* [4] O sistema exibe a tela de criação de grade horária.
* [5] O caso de uso é encerrado.

**Fluxos alternativos**:

* **[A1]** O usuário pressiona o botão de pular.
  * [1] O sistema exibe uma tela solicitando o curso atual, período atual e o currículo do aluno, um botão de pular e um botão de continuar.
  * [2] O usuário preenche o formulário e pressiona o botão de continuar. **[A2]**
  * [3] O sistema armazena as informações fornecidas.
  * [4] O sistema exibe a tela de criação de grade horária.
  * [5] O caso de uso é encerrado.

* **[A2]** O usuário pressiona o botão de pular.
  * [1] O sistema altera o funcionamento para recomendações genéricas.
  * [2] O sistema exibe a tela de criação de grade horária.
  * [3] O caso de uso é encerrado.

## UC02 - Avaliar disciplinas e professores

**Objetivo**: Permitir que o usuário avalie uma disciplina ou um professor.

**Requisitos**: RF16, RF17

**Atores**: Usuário

**Pré condições**: O usuário está autenticado.

**Fluxo principal**:

* [1] O sistema exibe uma lista de disciplinas e professores e um campo de texto para pesquisa.
* [2] O usuário seleciona uma disciplina. **[A1]** **[A2]**
* [3] O sistema exibe uma tela para avaliar a disciplina em conteúdo e dificuldade e um botão de salvar.
* [4] O usuário avalia a disciplina e seleciona o botão de salvar. **[A3]**
* [5] O sistema armazena a avaliação do usuário.
* [6] O caso de uso é encerrado

**Fluxos alternativos**:

* **[A1]** O usuário seleciona um professor.
  * O sistema exibe uma tela para avaliar o professor e um botão de salvar.
  * O usuário avalia o professor e seleciona o botão de salvar.
