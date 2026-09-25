# Plano Do Estudo

## Origem

A ideia deste projeto surgiu dos estudos da disciplina **Testes de Usabilidade e Acessibilidade**, da minha pós-graduação em **Engenharia de Qualidade e Teste de Software | PUC Minas**.

## Natureza Do Estudo

Esta versão é um estudo pessoal, baseado em inspeção própria, automação e triagem crítica dos resultados gerados. Não houve sessões com participantes.

## Pergunta Norteadora

Uma pessoa consegue encontrar, compreender e preencher o formulário usando mouse e teclado, sem perder a orientação sobre os campos e suas instruções?

## Objetivo

Comparar as versões before e after do formulário W3C BAD Survey para identificar barreiras de usabilidade e acessibilidade, documentar impacto e automatizar verificações objetivas que possam ser repetidas.

## Escopo Das Páginas

- Before: https://www.w3.org/WAI/demos/bad/before/survey.html
- After: https://www.w3.org/WAI/demos/bad/after/survey.html
- Relatório before da W3C: https://www.w3.org/WAI/demos/bad/before/reports/survey.html
- Relatório after da W3C: https://www.w3.org/WAI/demos/bad/after/reports/survey.html

## Recorte De Investigação

O estudo inicial aprofunda quatro diferenças e barreiras:

1. Rótulos programáticos dos controles do formulário.
2. Agrupamento semântico de perguntas e opções com `fieldset` e `legend`.
3. Operação por teclado e manutenção de orientação durante a tarefa.
4. Skip links e acesso rápido ao conteúdo principal.

O recorte é intencionalmente pequeno para explicar causa, impacto e evidência de cada achado sem transformar a primeira versão em uma auditoria completa de WCAG.

## Cenários Automatizados

| Cenário | Verificação |
| --- | --- |
| Abrir a pesquisa before | A página com barreiras carrega conteúdo visual, mas não expõe heading principal semântico equivalente. |
| Localizar o formulário before | Elementos técnicos estão presentes, mas nomes acessíveis esperados não estão disponíveis. |
| Preencher campos before por seletores técnicos | A página pode ser operada por seletores técnicos, mas não pelo conjunto de nomes acessíveis esperado no estudo. |
| Verificar skip link before | A versão com barreiras não expõe o skip link interno para o conteúdo. |
| Verificar orientação semântica before | Um controle recebe foco programático, mas sem o apoio semântico esperado de labels e grupos. |
| Abrir a pesquisa after | A versão corrigida carrega o conteúdo principal. |
| Localizar o formulário after | Os elementos necessários para a tarefa estão presentes e expõem estrutura semântica básica. |
| Preencher campos after por nomes acessíveis | Os controles aceitam as entradas esperadas por locators acessíveis. |
| Verificar skip link after | O skip link interno leva ao conteúdo principal. |
| Percorrer formulário after por teclado | A sequência definida pode ser operada por teclado e mantém os dados preenchidos corretamente. |
| Percorrer a tarefa de usabilidade before | A suíte registra telas, preenche a tarefa por seletores técnicos e captura o resultado após envio. |
| Percorrer a tarefa de usabilidade after | A suíte registra telas, preenche a tarefa por nomes acessíveis e captura a confirmação após envio. |

As suítes before mantêm cenários de referência para registrar objetivamente barreiras conhecidas. Nesses casos, um teste aprovado significa que a barreira esperada foi detectada, não que a página before esteja aprovada em acessibilidade.

As suítes de usabilidade em Robot registram telas e percorrem a tarefa para apoiar a inspeção. A avaliação heurística e o percurso cognitivo continuam documentados em `docs/usability-inspection.md`, pois a execução automatizada, sozinha, não avalia compreensão humana da interface.

## Roteiro Pessoal Da Tarefa

1. Abrir a página escolhida.
2. Encontrar a pesquisa Citylights Survey.
3. Escolher Central Park como parque favorito.
4. Selecionar Brasília, Brazil como cidade.
5. Preencher nome e e-mail fictícios.
6. Enviar o formulário e observar o resultado apresentado.
7. Repetir a análise na outra versão da página.
8. Registrar onde houve dúvida, perda de orientação, barreira de teclado ou falta de instrução clara.

## Limites Do Estudo

- A demonstração W3C BAD foi criada com referência à WCAG 2.0.
- Este projeto usa os relatórios originais como base histórica e confere a correspondência com WCAG 2.2 antes de citar critério atual.
- Os achados selecionados são relacionados à WCAG 2.2 por análise dos critérios correspondentes.
- A execução axe-core registrada usa as tags `wcag2a`, `wcag2aa`, `wcag21a`, `wcag21aa` e `best-practice`; ela não representa varredura automática completa de toda a WCAG 2.2.
- Ferramentas automáticas ajudam na triagem, mas não determinam acessibilidade integral.
- Um resultado sem violações detectadas deve ser descrito apenas como `sem violações detectadas pela ferramenta`, nunca como conformidade integral com WCAG.
