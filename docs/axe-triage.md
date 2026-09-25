# Triagem Da Varredura Axe-Core

Este documento registra, em formato versionável, a execução local usada como referência no README. Os JSONs completos continuam sendo gerados em `results/axe/` e não são versionados.

## Execução Analisada

| Item | Valor |
| --- | --- |
| Data da execução | 2026-09-25 |
| Timestamp before | `2026-09-25T13:48:39.484Z` |
| Timestamp after | `2026-09-25T13:48:41.245Z` |
| Ferramenta | axe-core 4.13.0 via `@axe-core/playwright` 4.13.0 |
| Playwright | 1.62.1 |
| Navegador | Chromium via Playwright |
| Viewport | 1366x768 |
| Script | `scripts/run_axe_checks.mjs` |
| Tags axe executadas | `wcag2a`, `wcag2aa`, `wcag21a`, `wcag21aa`, `best-practice` |

URLs efetivas avaliadas:

- Before: https://www.w3.org/WAI/demos/bad/before/survey.html
- After: https://www.w3.org/WAI/demos/bad/after/survey.html

## Resultados Por Página

| Página | URL efetiva | Violações | Incompletos | Passes | Regras com violações |
| --- | --- | --- | --- | --- | --- |
| before | https://www.w3.org/WAI/demos/bad/before/survey.html | 7 | 1 | 25 | `html-has-lang`, `image-alt`, `label`, `landmark-one-main`, `link-name`, `region`, `select-name` |
| after | https://www.w3.org/WAI/demos/bad/after/survey.html | 4 | 1 | 30 | `empty-table-header`, `label-title-only`, `landmark-one-main`, `region` |

Itens incompletos:

| Página | Regra | Impacto | Decisão de triagem |
| --- | --- | --- | --- |
| before | `color-contrast` | serious | Manter como pendente de verificação manual ou configuração complementar. |
| after | `color-contrast` | serious | Manter como pendente de verificação manual ou configuração complementar. |

## Triagem Dos Achados

| Regra ou grupo | Página | Decisão |
| --- | --- | --- |
| `label` e `select-name` | before | Entram no recorte de investigação sobre nomes acessíveis, labels e instruções de formulário. |
| `html-has-lang`, `image-alt`, `link-name`, `landmark-one-main`, `region` | before | Mantidos como achados automáticos para investigação. Não foram todos transformados em achados detalhados nesta versão do estudo. |
| `empty-table-header`, `label-title-only`, `landmark-one-main`, `region` | after | Mantidos como pontos de triagem. A versão after melhora o fluxo estudado, mas ainda teve violações detectadas pela ferramenta. |
| `color-contrast` | before e after | Inconclusivo na execução automática. Exige verificação manual ou configuração complementar. |

Entrou em `docs/accessibility-findings.md`:

- A11Y-001: radio buttons do parque sem labels programáticos na versão before.
- A11Y-002: campos de nome/e-mail sem labels associados na versão before.
- A11Y-003: grupos de radio sem `fieldset`/`legend` na versão before.
- A11Y-004: skip link interno levando ao conteúdo do formulário corrigido na versão after.

## Limites E Reprodução

A varredura automática identifica sinais técnicos reproduzíveis. Ela não substitui avaliação humana de teclado, foco, entendimento da tarefa, clareza de instruções e experiência com tecnologia assistiva.

As duas páginas tiveram violações detectadas. A diferença numérica entre before e after ajuda a orientar a investigação, mas não deve ser usada como declaração de conformidade ou aprovação.

Os achados selecionados no estudo são relacionados à WCAG 2.2 por análise dos critérios correspondentes. A execução do axe-core registrada aqui usou as tags `wcag2a`, `wcag2aa`, `wcag21a`, `wcag21aa` e `best-practice`; isso não equivale a uma varredura automática completa de toda a WCAG 2.2.

Quando a ferramenta não encontrar violações, a conclusão correta é: `sem violações detectadas pela ferramenta nesta execução`. Não use esse resultado para afirmar conformidade integral com WCAG.

Comando:

```bash
npm run a11y:axe
```

Para falhar o comando quando houver qualquer violação:

```bash
AXE_FAIL_ON_VIOLATIONS=true npm run a11y:axe
```

Esse modo usa a existência de qualquer violação como critério de saída. Como o script analisa as versões before e after, violações em qualquer uma das duas páginas fazem o comando terminar com falha.

Para reproduzir a triagem, preserve também `results/axe/before.json`, `results/axe/after.json` e `results/axe/summary.md` da execução analisada.
