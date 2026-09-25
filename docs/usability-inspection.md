# Inspecao De Usabilidade - Formulario W3C BAD

## Objetivo

Avaliar, por inspecao pessoal de QA, se a tarefa `responder a pesquisa sobre parques` pode ser compreendida e concluida nas versoes before e after do formulario W3C BAD.

## Referencia

As heuristicas usadas como guia foram as 10 heuristicas de Nielsen Norman Group: https://www.nngroup.com/articles/ten-usability-heuristics/

Este documento concentra o relato nas heuristicas relevantes para os achados observados, principalmente:

- Visibilidade do status do sistema.
- Correspondencia entre sistema e mundo real.
- Prevencao de erros.
- Reconhecimento em vez de memorizacao.
- Ajuda e documentacao.

## Evidencias

As capturas sao geradas pelas suites Robot em `tests/usability/`, separadas por versao, e salvas em `results/screenshots/`.

| Captura | Quando e gerada | Uso na inspecao |
| ------- | --------------- | --------------- |
| `results/screenshots/usability-before-form.png` | Avaliacao heuristica da versao before | Evidenciar formulario com textos soltos, radios sem labels programaticos e organizacao por tabelas |
| `results/screenshots/usability-after-form.png` | Avaliacao heuristica da versao after | Evidenciar agrupamento por fieldset/legend, instrucoes e labels visiveis |
| `results/screenshots/usability-after-park-selected.png` | Apos escolher parque na versao after | Evidenciar que a escolha fica selecionada e associada ao texto da opcao |
| `results/screenshots/usability-after-newsletter-filled.png` | Apos preencher newsletter na versao after | Evidenciar que campos opcionais aceitam dados e mantem o estado preenchido |

## Avaliacao Heuristica

| Tela | Problema observado | Heuristica relacionada | Recomendacao |
| ---- | ------------------ | ---------------------- | ------------ |
| Before - pergunta sobre parque favorito | As opcoes aparecem visualmente proximas dos textos, mas os radios nao possuem labels programaticos. A pessoa pode depender de memoria visual para ligar radio e texto. | Reconhecimento em vez de memorizacao; prevencao de erros | Associar cada radio a um `label` e manter a pergunta dentro de `fieldset` com `legend`. |
| Before - pergunta sobre cidade | A lista de cidades existe, mas a instrucao e o controle ficam em estrutura de tabela, sem grupo semantico. Isso aumenta o esforco para entender a relacao entre pergunta e controle. | Correspondencia entre sistema e mundo real; reconhecimento em vez de memorizacao | Usar `fieldset` e `legend` para nomear o grupo, alem de um texto inicial claro na lista. |
| Before - newsletter opcional | Campos de nome, e-mail e confirmacao aparecem desalinhados; alguns textos parecem rotulos visuais, mas nao funcionam como labels dos inputs. | Prevencao de erros; ajuda e documentacao | Reorganizar o bloco com labels explicitos e indicar claramente que a newsletter e opcional. |
| After - formulario corrigido | A pagina informa que campos sao obrigatorios salvo indicacao contraria, agrupa perguntas e expõe labels. O proximo passo fica mais previsivel. | Visibilidade do status do sistema; reconhecimento em vez de memorizacao | Manter a estrutura semantica e preservar instrucoes proximas aos controles. |
| After - termino da tarefa | O submit navega para `survey.php`, mas a pagina exibida permanece essencialmente o formulario, sem mensagem forte de confirmacao de envio. | Visibilidade do status do sistema | Exibir uma mensagem clara de sucesso ou de recebimento da resposta apos o envio. |

## Percurso Cognitivo

Tarefa avaliada: responder a pesquisa sobre parques.

Perguntas usadas em cada etapa:

- O proximo objetivo esta claro?
- A acao necessaria esta visivel?
- O texto da opcao ajuda a escolher a acao?
- Depois da acao, a interface mostra o que aconteceu?

| Etapa | Versao | Pergunta de avaliacao | Observacao e evidencia | Heuristica | Recomendacao |
| ----- | ------ | --------------------- | ---------------------- | ---------- | ------------ |
| Abrir pesquisa | Before | O objetivo da pagina fica claro? | O titulo `Citylights Survey` aparece, mas a pagina tem muito ruido estrutural e visual antes e ao redor do formulario. Evidencia: `results/screenshots/usability-before-form.png`. | Design estetico e minimalista; reconhecimento em vez de memorizacao | Reduzir ruido visual e usar estrutura semantica para destacar a tarefa principal. |
| Abrir pesquisa | After | O objetivo da pagina fica claro? | O titulo e o subtitulo aparecem junto do formulario, com instrucao geral de obrigatoriedade. Evidencia: `results/screenshots/usability-after-form.png`. | Visibilidade do status do sistema | Manter titulo, subtitulo e instrucao proximos do formulario. |
| Escolher parque | Before | A opcao escolhida fica clara? | Visualmente o radio pode ser marcado, mas o texto da opcao nao esta associado por `label`; clicar no texto nao seleciona necessariamente a opcao. Evidencia: `results/screenshots/usability-before-form.png`. | Prevencao de erros; reconhecimento em vez de memorizacao | Usar `label for` para cada radio e agrupar a pergunta com `fieldset` e `legend`. |
| Escolher parque | After | A opcao escolhida fica clara? | A opcao `Central Park` possui nome acessivel e permanece marcada apos a escolha. Evidencia: `results/screenshots/usability-after-park-selected.png`. | Visibilidade do status do sistema; correspondencia entre sistema e mundo real | Manter labels clicaveis e estado selecionado perceptivel. |
| Escolher cidade | Before | A acao necessaria esta visivel? | A lista aparece abaixo da pergunta, mas sem label programatico e sem agrupamento semantico. A pessoa precisa inferir a relacao pelo layout. | Reconhecimento em vez de memorizacao | Associar o controle a um grupo semantico e manter placeholder/instrucao clara. |
| Escolher cidade | After | A acao necessaria esta visivel? | O grupo `Greenest City` e a pergunta explicam a escolha; a lista usa opcoes organizadas por grupos alfabeticos. | Reconhecimento em vez de memorizacao; ajuda e documentacao | Manter optgroups e texto inicial claro. |
| Preencher newsletter | Before | O texto da opcao ajuda a escolher a acao? | A pergunta sobre newsletter existe, mas os campos aparecem em colunas desalinhadas; textos como `eMail Address` e `Retype eMail` nao funcionam como labels dos inputs. | Prevencao de erros; ajuda e documentacao | Usar labels explicitos, indicar opcionalidade e alinhar campo com sua instrucao. |
| Preencher newsletter | After | O texto da opcao ajuda a escolher a acao? | O bloco informa `Free Newsletter (optional)` e os campos mantem os valores preenchidos. Evidencia: `results/screenshots/usability-after-newsletter-filled.png`. | Ajuda e documentacao; prevencao de erros | Manter opcionalidade no legend e labels proximos dos inputs. |
| Finalizar tarefa | Before | Depois da acao, a interface mostra o que aconteceu? | O submit envia para `survey.php`, mas nao foi observada mensagem forte de confirmacao na pagina. | Visibilidade do status do sistema | Exibir confirmacao clara apos envio. |
| Finalizar tarefa | After | Depois da acao, a interface mostra o que aconteceu? | A automacao valida navegacao para `survey.php`, mas a interface ainda carece de feedback explicito de sucesso. | Visibilidade do status do sistema | Incluir mensagem de sucesso ou resumo da resposta enviada. |

## Sintese

A versao after reduz barreiras importantes ao tornar controles reconheciveis, agrupados e nomeados. A principal melhoria restante, olhando pela lente de usabilidade, esta no feedback de finalizacao: depois do submit, a pessoa deveria receber uma resposta mais clara sobre o que aconteceu.
