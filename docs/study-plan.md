# Plano Do Estudo

## Origem

A ideia deste projeto surgiu dos estudos da disciplina **Testes de Usabilidade e Acessibilidade**, da minha pos-graduacao em **Engenharia de Qualidade e Teste de Software | PUC Minas**.

## Natureza Do Estudo

Esta versao e um estudo pessoal, baseado em inspecao propria, automacao e triagem critica dos resultados gerados.

## Pergunta Norteadora

Uma pessoa consegue encontrar, compreender e preencher o formulario usando mouse e teclado, sem perder a orientacao sobre os campos e suas instrucoes?

## Objetivo

Comparar as versoes before e after do formulario W3C BAD Survey para identificar barreiras de usabilidade e acessibilidade, documentar impacto e automatizar verificacoes objetivas que possam ser repetidas.

## Escopo Das Paginas

- Before: https://www.w3.org/WAI/demos/bad/before/survey.html
- After: https://www.w3.org/WAI/demos/bad/after/survey.html
- Relatorio before da W3C: https://www.w3.org/WAI/demos/bad/before/reports/survey.html
- Relatorio after da W3C: https://www.w3.org/WAI/demos/bad/after/reports/survey.html

## Recorte De Investigacao

O estudo inicial aprofunda quatro diferencas/barreiras:

1. Rotulos programaticos dos controles do formulario.
2. Agrupamento semantico de perguntas e opcoes com `fieldset` e `legend`.
3. Operacao por teclado e orientacao de foco durante a tarefa.
4. Skip links e acesso rapido ao conteudo principal.

O recorte e intencionalmente pequeno para permitir explicar causa, impacto e evidencia de cada achado sem transformar a primeira versao em uma auditoria completa de WCAG.

## Cenarios Automatizados

| Cenario | Verificacao |
| ------- | ----------- |
| Abrir a pesquisa | A pagina e seu conteudo principal carregam |
| Localizar o formulario | Os elementos necessarios para a tarefa estao presentes |
| Preencher campos da versao corrigida | Os controles aceitam as entradas esperadas |
| Percorrer o formulario por teclado | A sequencia definida pode ser operada e o foco pode ser identificado |

A suite tambem mantem um quinto cenario comparativo para registrar objetivamente barreiras da versao before.

## Roteiro Pessoal Da Tarefa

1. Abrir a pagina escolhida.
2. Encontrar a pesquisa Citylights Survey.
3. Escolher Central Park como parque favorito.
4. Selecionar Brasilia, Brazil como cidade.
5. Preencher nome e e-mail ficticios.
6. Repetir a analise na outra versao da pagina.
7. Registrar onde houve duvida, perda de orientacao, barreira de teclado ou falta de instrucao clara.

## Limites Do Estudo

- A demonstracao W3C BAD foi criada com referencia a WCAG 2.0.
- Este projeto usa os relatorios originais como base historica e confere a correspondencia com WCAG 2.2 antes de citar criterio atual.
- Ferramentas automaticas ajudam na triagem, mas nao determinam acessibilidade integral.
- Um resultado sem violacoes detectadas deve ser descrito apenas como `sem violacoes detectadas pela ferramenta`, nunca como conformidade integral com WCAG.
