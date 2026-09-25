# Inspeção De Usabilidade - Formulário W3C BAD

## Objetivo

Avaliar, por inspeção pessoal de QA, se a tarefa `responder a pesquisa sobre parques` pode ser compreendida e concluída nas versões before e after do formulário W3C BAD.

As suítes Robot em `tests/usability/` apoiam a inspeção ao registrar telas e percorrer a tarefa de forma reproduzível. Elas não substituem a avaliação heurística nem provam, sozinhas, que uma pessoa compreenderia a interface.

## Referência

As heurísticas usadas como guia foram as 10 heurísticas de Nielsen Norman Group: https://www.nngroup.com/articles/ten-usability-heuristics/

Este documento concentra o relato nas heurísticas relevantes para os achados observados, principalmente:

- Visibilidade do status do sistema.
- Correspondência entre sistema e mundo real.
- Prevenção de erros.
- Reconhecimento em vez de memorização.
- Ajuda e documentação.

## Evidências

As capturas completas são geradas pelas suítes Robot em `tests/usability/` e salvas em `results/screenshots/`. Essa pasta é local e não versionada. Capturas selecionadas são copiadas para `docs/evidence/` para consulta no GitHub.

| Captura | Quando é gerada | Uso na inspeção |
| --- | --- | --- |
| `docs/evidence/usability-before-form.png` | Avaliação heurística da versão before | Evidenciar disposição visual, textos próximos aos controles e organização por tabelas. A ausência de labels programáticos é validada pelos testes Robot. |
| `docs/evidence/usability-after-form.png` | Avaliação heurística da versão after | Evidenciar agrupamento por `fieldset`/`legend`, instruções e labels visíveis. |
| `docs/evidence/usability-after-park-selected.png` | Após escolher parque na versão after | Evidenciar o estado marcado. A associação por nome acessível é validada pelo uso de `role=radio[name="Central Park"]`. |
| `docs/evidence/usability-after-newsletter-filled.png` | Após preencher newsletter na versão after | Evidenciar que os campos opcionais mantêm o estado preenchido. |
| `docs/evidence/usability-before-submit-result.png` | Após envio na versão before | Evidenciar que a página vai para `survey.php`, mas apresenta a área de resultados sem mensagem clara de confirmação. |
| `docs/evidence/usability-after-submit-result.png` | Após envio na versão after | Evidenciar a mensagem `Thank you for submitting your vote, it has been successfully recorded.` |

## Avaliação Heurística

| Tela | Problema observado | Heurística relacionada | Recomendação |
| --- | --- | --- | --- |
| Before - pergunta sobre parque favorito | As opções aparecem visualmente próximas dos textos, mas os radios não possuem labels programáticos. A pessoa pode depender de memória visual para ligar radio e texto. | Reconhecimento em vez de memorização; prevenção de erros | Associar cada radio a um `label` e manter a pergunta dentro de `fieldset` com `legend`. |
| Before - pergunta sobre cidade | A lista de cidades existe, mas a instrução e o controle ficam em estrutura de tabela, sem grupo semântico. Isso aumenta o esforço para entender a relação entre pergunta e controle. | Correspondência entre sistema e mundo real; reconhecimento em vez de memorização | Usar `fieldset` e `legend` para nomear o grupo, além de um texto inicial claro na lista. |
| Before - newsletter opcional | Campos de nome, e-mail e confirmação aparecem desalinhados; alguns textos parecem rótulos visuais, mas não funcionam como labels dos inputs. | Prevenção de erros; ajuda e documentação | Reorganizar o bloco com labels explícitos e indicar claramente que a newsletter é opcional. |
| Before - término da tarefa | O submit navega para `survey.php`, mas a tela observada mostra a área `Last Weeks's Survey Results`, sem agradecimento ou confirmação clara de sucesso. | Visibilidade do status do sistema | Exibir uma mensagem clara de sucesso ou de recebimento da resposta após o envio. |
| After - formulário corrigido | A página informa que campos são obrigatórios salvo indicação contrária, agrupa perguntas e expõe labels. O próximo passo fica mais previsível. | Visibilidade do status do sistema; reconhecimento em vez de memorização | Manter a estrutura semântica e preservar instruções próximas aos controles. |
| After - término da tarefa | O submit navega para `survey.php` e exibe confirmação explícita de envio, incluindo nota de que a submissão faz parte da demonstração e não armazena dados. | Visibilidade do status do sistema | Manter a confirmação clara após envio. |

## Percurso Cognitivo

Tarefa avaliada: responder a pesquisa sobre parques.

Perguntas usadas em cada etapa:

- O próximo objetivo está claro?
- A ação necessária está visível?
- O texto da opção ajuda a escolher a ação?
- Depois da ação, a interface mostra o que aconteceu?

| Etapa | Versão | Pergunta de avaliação | Observação e evidência | Heurística | Recomendação |
| --- | --- | --- | --- | --- | --- |
| Abrir pesquisa | Before | O objetivo da página fica claro? | O título `Citylights Survey` aparece, mas a página tem ruído estrutural e visual antes e ao redor do formulário. Evidência: `docs/evidence/usability-before-form.png`. | Design estético e minimalista; reconhecimento em vez de memorização | Reduzir ruído visual e usar estrutura semântica para destacar a tarefa principal. |
| Abrir pesquisa | After | O objetivo da página fica claro? | O título e o subtítulo aparecem junto do formulário, com instrução geral de obrigatoriedade. Evidência: `docs/evidence/usability-after-form.png`. | Visibilidade do status do sistema | Manter título, subtítulo e instrução próximos do formulário. |
| Escolher parque | Before | A opção escolhida fica clara? | A captura mostra proximidade visual entre radio e texto, mas os testes de acessibilidade mostram ausência de nome acessível `Central Park` e ausência de labels programáticos. | Prevenção de erros; reconhecimento em vez de memorização | Usar `label for` para cada radio e agrupar a pergunta com `fieldset` e `legend`. |
| Escolher parque | After | A opção escolhida fica clara? | A opção `Central Park` possui nome acessível e permanece marcada após a escolha. Evidência: `docs/evidence/usability-after-park-selected.png` e teste com `role=radio[name="Central Park"]`. | Visibilidade do status do sistema; correspondência entre sistema e mundo real | Manter labels clicáveis e estado selecionado perceptível. |
| Escolher cidade | Before | A ação necessária está visível? | A lista aparece abaixo da pergunta, mas sem label programático e sem agrupamento semântico. A pessoa precisa inferir a relação pelo layout. | Reconhecimento em vez de memorização | Associar o controle a um grupo semântico e manter placeholder/instrução clara. |
| Escolher cidade | After | A ação necessária está visível? | O grupo `Greenest City` e a pergunta explicam a escolha; a lista usa opções organizadas por grupos alfabéticos. | Reconhecimento em vez de memorização; ajuda e documentação | Manter optgroups e texto inicial claro. |
| Preencher newsletter | Before | O texto da opção ajuda a escolher a ação? | A pergunta sobre newsletter existe, mas os campos aparecem em colunas desalinhadas; textos como `eMail Address` e `Retype eMail` não funcionam como labels dos inputs. | Prevenção de erros; ajuda e documentação | Usar labels explícitos, indicar opcionalidade e alinhar campo com sua instrução. |
| Preencher newsletter | After | O texto da opção ajuda a escolher a ação? | O bloco informa `Free Newsletter (optional)` e os campos mantêm os valores preenchidos. Evidência: `docs/evidence/usability-after-newsletter-filled.png`. | Ajuda e documentação; prevenção de erros | Manter opcionalidade no legend e labels próximos dos inputs. |
| Finalizar tarefa | Before | Depois da ação, a interface mostra o que aconteceu? | A automação valida navegação para `survey.php`, mas a tela observada mostra resultados de pesquisa sem confirmação clara de envio. Evidência: `docs/evidence/usability-before-submit-result.png`. | Visibilidade do status do sistema | Exibir confirmação clara após envio. |
| Finalizar tarefa | After | Depois da ação, a interface mostra o que aconteceu? | A automação valida navegação para `survey.php` e presença de mensagem explícita de sucesso. Evidência: `docs/evidence/usability-after-submit-result.png`. | Visibilidade do status do sistema | Manter mensagem de sucesso ou resumo da resposta enviada. |

## Síntese

A versão after reduz barreiras importantes ao tornar controles reconhecíveis, agrupados e nomeados. Ela também melhora o feedback de finalização ao exibir uma confirmação explícita depois do submit. A versão before serve como caracterização de barreiras conhecidas: um teste aprovado nessa suíte significa que a barreira esperada foi detectada, não que a página esteja aprovada em acessibilidade ou usabilidade.
