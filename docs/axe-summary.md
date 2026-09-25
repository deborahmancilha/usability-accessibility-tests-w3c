# Resumo Estável Da Varredura Axe-Core

Este arquivo registra, em formato versionável, a execução local usada como referência no README. Os JSONs completos continuam sendo gerados em `results/axe/` e não são versionados.

## Execução Registrada

| Item | Valor |
| --- | --- |
| Data da execução | 2026-09-25 |
| Ferramenta | axe-core 4.13.0 via `@axe-core/playwright` 4.13.0 |
| Playwright | 1.62.1 |
| Navegador | Chromium via Playwright |
| Viewport | 1366x768 |
| Script | `scripts/run_axe_checks.mjs` |
| Tags axe executadas | `wcag2a`, `wcag2aa`, `wcag21a`, `wcag21aa`, `best-practice` |

## Resultado

| Página | URL efetiva | Violações | Incompletos | Passes | Regras com violações |
| --- | --- | --- | --- | --- | --- |
| before | https://www.w3.org/WAI/demos/bad/before/survey.html | 7 | 1 | 25 | `html-has-lang`, `image-alt`, `label`, `landmark-one-main`, `link-name`, `region`, `select-name` |
| after | https://www.w3.org/WAI/demos/bad/after/survey.html | 4 | 1 | 30 | `empty-table-header`, `label-title-only`, `landmark-one-main`, `region` |

Itens incompletos:

| Página | Regra | Decisão de triagem |
| --- | --- | --- |
| before | `color-contrast` | Manter como pendente de verificação manual ou configuração complementar. |
| after | `color-contrast` | Manter como pendente de verificação manual ou configuração complementar. |

## Decisões De Triagem

- A contagem de violações orienta investigação, mas não é usada como declaração de conformidade.
- As duas páginas tiveram violações detectadas; por isso, `AXE_FAIL_ON_VIOLATIONS=true` falha quando qualquer uma delas apresenta violação.
- Os achados selecionados no estudo são relacionados à WCAG 2.2 por análise dos critérios correspondentes, não por uma varredura automática completa de toda a WCAG 2.2.
- A execução do axe usou as tags registradas acima. Elas incluem WCAG 2.0, WCAG 2.1 e boas práticas automatizáveis suportadas pela ferramenta.
