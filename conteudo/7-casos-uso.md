# Casos de Uso do Sistema

## UC01 - Criar grade horária

**Objetivo**: Permitir que o usuário inicie o processo de criação de uma grade horária

**Requisitos**: RF07, RF08, RF09

**Atores**: Usuário

**Prioridade**: Alta

**Pré condições**: Nenhuma

**Trigger**: O ator seleciona a opção _Montar Grade Horária_.

**Fluxo principal**:

* [1] O sistema exibe uma tela solicitando os seguintes dados do usuário, além de um botão de continuar.
  * Curso atual;
  * Período atual;
  * Currículo do curso;
  * Histórico escolar.
* [2] O ator seleciona a opção _Continuar_. **[A1]** **[A2]**
* [3] O sistema exibe uma grade horária:
  * Colunas indo de 07h até as 21h;
  * Linhas indo de Segunda à Sábado;
  * Uma coluna a mais para disciplinas sem horário definido.
* [4] O sistema exibe uma área contendo recomendações de disciplinas. **[RN1]**
* [5] O sistema exibe um campo de pesquisa para buscar disciplinas. **[RN2]**
* [6] O sistema exibe um botão de voltar.
* [7] O caso de uso é encerrado.

**Fluxos alternativos**:

* **[A1]** O ator insere o curso e currículo atual:
  * [1] O sistema armazena as informações internamente e no navegador de internet do usuário.
  * [2] O sistema retorna ao passo 2.

* **[A2]** O ator fornece o histórico escolar:
  * [1] O sistema valida o arquivo fornecido.
  * [2] O sistema exibe um resumo do histórico escolar para confirmação do usuário.
  * [3] O sistema armazena os dados processados internamente e no navegador de internet do usuario.
  * [4] O sistema retorna ao passo 2 do fluxo principal.

**Regras de negócio**:

* **[RN1]**: O sistema exibe até três recomendações simultâneas.

* **[RN2]**: Se o ator não tiver escrito nada no campo de pesquisa, irá aparecer no campo as disciplinas que ainda faltam cursar ou do período atual do ator.

## UC02 - Usar recomendação

**Objetivo**: Permitir que o usuário utilize uma recomendação para complementar sua grade.

**Requisitos**: RF06, RF10

**Atores**: Usuário

**Prioridade**: Alta

**Pré condições**: O ator deve estar na tela de edição de grade horária.

**Trigger**: O ator seleciona uma disciplina da área de recomendação.

**Fluxo principal**:

* [1] O sistema exibe turmas possíveis para a disciplina selecionada.
* [2] O ator seleciona uma das turmas exibidas. **[A1]**
* [3] A disciplina é inserida na grade horária.
* [4] As recomendações são atualizadas de acordo com a alteração da grade horária.
* [5] O caso de uso é encerrado.

**Fluxo alternativo**:

* **[A1]** O ator não seleciona nenhuma das turmas exibidas.
  * [1] A exibição contendo as turmas da disciplina é removida.
  * [2] O sistema retorna ao passo 1 do fluxo principal.

## UC03 - Buscar por disciplinas

**Objetivo**: Permitir que o usuário busque e selecione disciplinas para inserir na grade horária.

**Requisitos**: RF10

**Atores**: Usuário

**Prioridade**: Alta

**Pré condições**: O ator deve estar na tela de edição de grade horária.

**Trigger**: O ator seleciona uma disciplina da área de recomendação.

**Fluxo principal**:

* [1] O ator seleciona uma das disciplinas exibidas na área de pesquisa. **[A1]**
* [2] O sistema exibe turmas possíveis para a disciplina selecionada.
* [3] O ator seleciona uma das turmas exibidas. **[A2]**
* [4] A disciplina é inserida na grade horária.
* [5] As recomendações são atualizadas de acordo com a alteração da grade horária.
* [6] O caso de uso é encerrado.

**Fluxo alternativo**:

* **[A1]**: O ator edita o texto do campo de pesquisa de disciplinas
  * [1] O sistema altera as disciplinas exibidas na área de pesquisa para satisfazer o texto no campo de pesquisa. **[RN3]**
  * O sistema retorna ao passo 1 do fluxo principal.

* **[A2]**: O ator não seleciona nenhuma das turmas exibidas.
  * [1] A exibição contendo as turmas da disciplina é removida.
  * [2] O sistema retorna ao passo 1 do fluxo principal.

**Regras de negócio**:

* **[RN3]**: O sistema exibe disciplinas que contenham o texto no código ou nome da disciplina ou o nome do professor de alguma das turmas da disciplina.
