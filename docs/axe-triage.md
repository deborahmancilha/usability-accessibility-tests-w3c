# Triagem Da Varredura Automatica

## Ferramenta

- Motor: axe-core
- Integracao: `@axe-core/playwright`
- Navegador: Chromium via Playwright
- Script: `scripts/run_axe_checks.mjs`

## Resultado Da Ultima Execucao Local

| Pagina | Violacoes | Incompletos | Passes | Interpretacao |
| ------ | --------- | ----------- | ------ | ------------- |
| before | 7 | 1 | 25 | Ha problemas automatizaveis que reforcam a necessidade de investigacao manual |
| after | 4 | 1 | 30 | A versao corrigida melhora, mas ainda exige triagem e revisao humana |

## Como Interpretar

A varredura automatica identifica sinais tecnicos reproduziveis. Ela nao substitui avaliacao humana de teclado, foco, entendimento da tarefa, clareza de instrucoes e experiencia com tecnologia assistiva.

Quando a ferramenta nao encontrar violacoes, a conclusao correta e: `sem violacoes detectadas pela ferramenta nesta execucao`. Nao use esse resultado para afirmar conformidade integral com WCAG.

## Triagem Inicial

1. Priorizar violacoes com impacto `critical` ou `serious` nos JSONs.
2. Conferir se o problema afeta o fluxo da tarefa definida no estudo.
3. Relacionar cada achado confirmado a uma evidencia Robot, print, JSON axe ou anotacao de observacao.
4. Registrar falso positivo ou inconclusivo como `necessita verificacao manual`.
5. Atualizar `docs/accessibility-findings.md` somente com achados interpretados, nao apenas copiados da ferramenta.

## Comando

```bash
npm run a11y:axe
```
