# Relatorio Curto - Usabilidade E Acessibilidade Do Formulario W3C BAD

## Contexto Academico

A ideia deste projeto surgiu dos estudos da disciplina **Testes de Usabilidade e Acessibilidade**, da minha pos-graduacao em **Engenharia de Qualidade e Teste de Software | PUC Minas**.

## Contexto Do Estudo

Este estudo compara duas versoes da pagina Citylights Survey da demonstracao W3C Before and After Demonstration. A W3C descreve o material como uma demonstracao de um site inacessivel e uma versao corrigida, com relatorios e anotacoes para apoiar aprendizado e avaliacao.

## Natureza Do Estudo

Esta versao e um estudo pessoal, baseado em inspecao propria, automacao e triagem critica dos resultados gerados.

## Pergunta Norteadora

Uma pessoa consegue encontrar, compreender e preencher o formulario usando mouse e teclado, sem perder a orientacao sobre os campos e suas instrucoes?

## Escopo

- Formulario com barreiras: https://www.w3.org/WAI/demos/bad/before/survey.html
- Formulario com correcoes: https://www.w3.org/WAI/demos/bad/after/survey.html
- Fluxo avaliado: localizar o formulario, escolher parque, selecionar cidade e preencher dados opcionais da newsletter.

## Metodo

### Ja Executado

1. Foi realizada uma avaliacao heuristica e um percurso cognitivo do preenchimento do formulario pela QA.
2. Os achados foram documentados com capturas de tela e comparados as verificacoes tecnicas de acessibilidade.
3. Inspecao tecnica de labels, grupos semanticos, teclado e foco via Robot Framework Browser.
4. Automacao de verificacoes repetiveis nos cenarios definidos.
5. Execucao axe-core para gerar relatorio automatico complementar.
6. Triagem inicial dos resultados automatizados antes de citar impacto ou criterio WCAG.

### Planejado / Nao Executado Nesta Versao

1. Inspecao visual manual documentada do indicador de foco visivel, com captura ou descricao passo a passo.
2. Revisao manual mais profunda com leitor de tela.
3. Ampliacao da comparacao com outros fluxos do W3C BAD.

## Cenarios Robot

| Cenario | Evidencia |
| ------- | --------- |
| Abrir a pesquisa | Conteudo principal e formulario carregam |
| Localizar o formulario | Controles necessarios estao presentes e possuem estrutura semantica na versao after |
| Preencher campos da versao corrigida | Controles aceitam entradas esperadas |
| Percorrer o formulario por teclado | Foco e operacao por teclado sao verificaveis |

## Inspecao De Usabilidade

A inspecao de usabilidade foi registrada em `docs/usability-inspection.md` e usa duas tecnicas complementares: avaliacao heuristica, guiada pelas heuristicas de Nielsen, e percurso cognitivo da tarefa `responder a pesquisa sobre parques`.

| Achado | Comparacao before/after | Evidencia |
| ------ | ----------------------- | --------- |
| Opcoes de parque dependem mais do layout na versao before | Before mostra radios e textos proximos, mas sem labels programaticos; after associa cada opcao ao texto clicavel e ao nome acessivel. | `results/screenshots/usability-before-form.png` e `results/screenshots/usability-after-park-selected.png` |
| Cidade exige menos inferencia na versao after | Before usa tabela visual para aproximar pergunta e select; after agrupa a pergunta em `fieldset`/`legend` e organiza a lista com `optgroup`. | Suites Robot `w3c_survey_before_usability.robot` e `w3c_survey_after_usability.robot` |
| Newsletter opcional fica mais compreensivel na versao after | Before desalinha campos e textos, deixando a relacao entre instrucao e input mais fraca; after informa opcionalidade e mantem labels proximos dos campos. | `results/screenshots/usability-after-newsletter-filled.png` |
| Feedback de termino ainda e limitado | As duas versoes enviam para `survey.php`, mas nao exibem uma mensagem forte de confirmacao de sucesso. | Percurso cognitivo documentado em `docs/usability-inspection.md` |

## Principais Achados

| Achado | Impacto | Evidencia |
| ------ | ------- | --------- |
| Before nao possui labels no formulario da pesquisa | Campos e opcoes podem ser anunciados sem nome acessivel | Suite Robot `w3c_survey_before_accessibility.robot` |
| Before nao agrupa opcoes relacionadas com fieldset/legend | A pergunta pode se desconectar das opcoes para leitor de tela | Suite Robot `w3c_survey_before_accessibility.robot` |
| After permite preenchimento por nomes acessiveis | O mesmo fluxo fica mais robusto para teclado e tecnologia assistiva | Suite Robot `Preencher Campos Da Versao Corrigida Aceita Entradas Esperadas` |
| Skip link e destino | Reduz esforco de navegacao por teclado e leva ao conteudo principal | Resultado do teste Robot `Percorrer O Formulario Corrigido Por Teclado Mantem Orientacao De Foco` |
| Indicador de foco visivel | Ajuda a pessoa a perceber onde esta durante a navegacao por teclado | Planejado: inspecao manual com captura ou descricao do procedimento |

## Varredura Automatica

A ultima execucao local do axe-core registrou 7 violacoes na versao before e 4 na versao after, com 1 item incompleto em cada pagina. Isso e tratado como triagem automatica, nao como conclusao final de conformidade.

## Recomendacoes

1. Associar todo input a um label programatico.
2. Agrupar radios/checkboxes relacionados com fieldset e legend.
3. Manter skip links apontando para regioes uteis.
4. Registrar manualmente o indicador de foco visivel em uma proxima iteracao.
5. Usar axe-core como triagem, nao como unica fonte de verdade.

## Limites

A demonstracao W3C BAD foi criada com referencia a WCAG 2.0. Este relatorio usa os relatorios originais como apoio e confere criterios correspondentes na WCAG 2.2 antes de citar criterio atual. Ferramentas automaticas podem deixar verificacoes sem resposta e produzir resultado impreciso; por isso, `sem violacoes detectadas` nunca deve ser traduzido como conformidade integral.
