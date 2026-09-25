# Relatório Curto - Usabilidade E Acessibilidade Do Formulário W3C BAD

## Contexto Acadêmico

A ideia deste projeto surgiu dos estudos da disciplina **Testes de Usabilidade e Acessibilidade**, da minha pós-graduação em **Engenharia de Qualidade e Teste de Software | PUC Minas**.

## Contexto Do Estudo

Este estudo compara duas versões da página Citylights Survey da demonstração W3C Before and After Demonstration. A W3C descreve o material como uma demonstração de uma versão inacessível e uma versão corrigida, com relatórios e anotações para apoiar aprendizado e avaliação.

## Natureza Do Estudo

Esta versão é um estudo pessoal, baseado em inspeção própria, automação e triagem crítica dos resultados gerados. Não houve sessões com participantes.

## Pergunta Norteadora

Uma pessoa consegue encontrar, compreender e preencher o formulário usando mouse e teclado, sem perder a orientação sobre os campos e suas instruções?

## Escopo

- Formulário com barreiras: https://www.w3.org/WAI/demos/bad/before/survey.html
- Formulário com correções: https://www.w3.org/WAI/demos/bad/after/survey.html
- Fluxo avaliado: localizar o formulário, escolher parque, selecionar cidade, preencher dados opcionais da newsletter e enviar a pesquisa.

## Método

### Já Executado

1. Avaliação heurística e percurso cognitivo do preenchimento do formulário pela QA.
2. Registro de telas e comparação com verificações técnicas de acessibilidade.
3. Inspeção técnica de labels, grupos semânticos, teclado e foco via Robot Framework Browser.
4. Automação de verificações repetíveis nos cenários definidos.
5. Execução axe-core para gerar relatório automático complementar.
6. Triagem inicial dos resultados automatizados antes de citar impacto ou critério WCAG.

### Planejado / Não Executado Nesta Versão

1. Inspeção visual manual documentada do indicador de foco visível, com captura ou descrição passo a passo.
2. Revisão manual mais profunda com leitor de tela.
3. Ampliação da comparação com outros fluxos do W3C BAD.

## Interpretação Das Suítes

| Suíte | Como interpretar `PASS` |
| --- | --- |
| Before | A barreira ou condição problemática esperada foi detectada. Isso não significa aprovação de acessibilidade. |
| After | O comportamento corrigido escolhido para o estudo foi observado. |
| Usabilidade Robot | A automação percorreu a tarefa e gerou evidências reprodutíveis para apoiar a inspeção. Ela não substitui julgamento humano. |
| axe-core | A ferramenta executou regras automáticas e gerou achados para triagem. Ela não declara conformidade WCAG completa. |

Se a W3C corrigir uma barreira da versão Before, um teste que espera encontrá-la pode falhar por uma mudança positiva. Antes de atualizar expectativas, é necessário revisar o achado e a evidência.

## Inspeção De Usabilidade

A inspeção de usabilidade foi registrada em `docs/usability-inspection.md` e usa duas técnicas complementares: avaliação heurística, guiada pelas heurísticas de Nielsen, e percurso cognitivo da tarefa `responder a pesquisa sobre parques`.

| Achado | Comparação before/after | Evidência |
| --- | --- | --- |
| Opções de parque dependem mais do layout na versão before | Before mostra radios e textos próximos, mas sem labels programáticos; after associa cada opção ao texto clicável e ao nome acessível. | `docs/evidence/usability-before-form.png`, `docs/evidence/usability-after-park-selected.png` e suítes Robot |
| Cidade exige menos inferência na versão after | Before usa tabela visual para aproximar pergunta e select; after agrupa a pergunta em `fieldset`/`legend` e organiza a lista com `optgroup`. | Suítes Robot `w3c_survey_before_usability.robot` e `w3c_survey_after_usability.robot` |
| Newsletter opcional fica mais compreensível na versão after | Before desalinha campos e textos, deixando a relação entre instrução e input mais fraca; after informa opcionalidade e mantém labels próximos dos campos. | `docs/evidence/usability-after-newsletter-filled.png` |
| Feedback de término melhora na versão after | Before navega para `survey.php`, mas mostra resultados sem confirmação clara; after exibe mensagem explícita de sucesso e nota sobre a demonstração. | `docs/evidence/usability-before-submit-result.png` e `docs/evidence/usability-after-submit-result.png` |

## Principais Achados De Acessibilidade

| Achado | Impacto | Evidência |
| --- | --- | --- |
| Before não possui labels no formulário da pesquisa | Campos e opções podem ser anunciados sem nome acessível | Suite Robot `w3c_survey_before_accessibility.robot` |
| Before não agrupa opções relacionadas com fieldset/legend | A pergunta pode se desconectar das opções para leitor de tela | Suite Robot `w3c_survey_before_accessibility.robot` |
| After permite preenchimento por nomes acessíveis | O mesmo fluxo fica mais robusto para teclado e tecnologia assistiva | Suite Robot `Preencher Campos Da Versao Corrigida Aceita Entradas Esperadas` |
| Skip link e destino | Reduz esforço de navegação por teclado e leva ao conteúdo principal | Resultado do teste Robot `Percorrer O Formulario Corrigido Por Teclado Mantem Orientacao De Foco` |
| Indicador de foco visível | Ajuda a pessoa a perceber onde está durante a navegação por teclado | Planejado: inspeção manual com captura ou descrição do procedimento |

## Varredura Automática

A execução local registrada em `results/axe/` em 2026-09-25 usou axe-core 4.13.0 via `@axe-core/playwright`, com viewport 1366x768 e URLs efetivas das páginas W3C. Ela registrou 7 violações na versão before e 4 na versão after, com 1 item incompleto em cada página.

Regras com violações na versão before: `html-has-lang`, `image-alt`, `label`, `landmark-one-main`, `link-name`, `region`, `select-name`.

Regras com violações na versão after: `empty-table-header`, `label-title-only`, `landmark-one-main`, `region`.

Esse resultado é tratado como triagem automática, não como conclusão final de conformidade. As duas páginas tiveram violações detectadas e exigem interpretação.

## Recomendações

1. Associar todo input a um label programático.
2. Agrupar radios/checkboxes relacionados com fieldset e legend.
3. Manter skip links apontando para regiões úteis.
4. Registrar manualmente o indicador de foco visível em uma próxima iteração.
5. Usar axe-core como triagem, não como única fonte de verdade.

## Limites

A demonstração W3C BAD foi criada com referência à WCAG 2.0. Este relatório usa os relatórios originais como apoio e confere critérios correspondentes na WCAG 2.2 antes de citar critério atual. Ferramentas automáticas podem deixar verificações sem resposta e produzir resultado impreciso; por isso, `sem violações detectadas` nunca deve ser traduzido como conformidade integral.
