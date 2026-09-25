# Triagem Da Varredura Automática

## Ferramenta

- Motor: axe-core 4.13.0
- Integração: `@axe-core/playwright` 4.13.0
- Playwright: 1.62.1
- Navegador: Chromium via Playwright
- Viewport: 1366x768
- Script: `scripts/run_axe_checks.mjs`
- Tags executadas: `wcag2a`, `wcag2aa`, `wcag21a`, `wcag21aa`, `best-practice`

## Resultado Da Última Execução Local

Execução registrada nos JSONs em 2026-09-25, com timestamps:

- Before: `2026-09-25T13:48:39.484Z`
- After: `2026-09-25T13:48:41.245Z`

| Página | URL efetiva | Violações | Incompletos | Passes | Regras com violações |
| --- | --- | --- | --- | --- | --- |
| before | https://www.w3.org/WAI/demos/bad/before/survey.html | 7 | 1 | 25 | `html-has-lang`, `image-alt`, `label`, `landmark-one-main`, `link-name`, `region`, `select-name` |
| after | https://www.w3.org/WAI/demos/bad/after/survey.html | 4 | 1 | 30 | `empty-table-header`, `label-title-only`, `landmark-one-main`, `region` |

Itens incompletos:

| Página | Regra | Impacto | Observação |
| --- | --- | --- | --- |
| before | `color-contrast` | serious | Exige verificação manual ou configuração complementar para concluir a análise. |
| after | `color-contrast` | serious | Exige verificação manual ou configuração complementar para concluir a análise. |

## Como Interpretar

A varredura automática identifica sinais técnicos reproduzíveis. Ela não substitui avaliação humana de teclado, foco, entendimento da tarefa, clareza de instruções e experiência com tecnologia assistiva.

As duas páginas tiveram violações detectadas. A diferença numérica entre before e after ajuda a orientar a investigação, mas não deve ser usada como declaração de conformidade ou aprovação.

Quando a ferramenta não encontrar violações, a conclusão correta é: `sem violações detectadas pela ferramenta nesta execução`. Não use esse resultado para afirmar conformidade integral com WCAG.

## Triagem Inicial

1. Priorizar violações com impacto `critical` ou `serious` nos JSONs.
2. Conferir se o problema afeta o fluxo da tarefa definida no estudo.
3. Relacionar cada achado confirmado a uma evidência Robot, print, JSON axe ou anotação de observação.
4. Registrar falso positivo ou inconclusivo como `necessita verificação manual`.
5. Atualizar `docs/accessibility-findings.md` somente com achados interpretados, não apenas copiados da ferramenta.

## Observações Por Página

Before concentra violações diretamente relacionadas ao recorte do estudo, como `label` e `select-name`, que reforçam a investigação sobre nomes acessíveis e instruções de formulário.

After reduz parte dessas barreiras, mas ainda apresenta violações e boas práticas sinalizadas pela ferramenta, como `label-title-only`, `landmark-one-main` e `region`. Esses pontos precisam de triagem própria antes de virarem achado confirmado.

## Comando

```bash
npm run a11y:axe
```

Para reproduzir a triagem, preserve também `results/axe/before.json`, `results/axe/after.json` e `results/axe/summary.md` da execução analisada.
