# Registro De Achados De Acessibilidade

Arquivo para documentar achados manuais e automatizados nas páginas W3C BAD avaliadas neste estudo.

## Fontes Avaliadas

- Before: https://www.w3.org/WAI/demos/bad/before/survey.html
- After: https://www.w3.org/WAI/demos/bad/after/survey.html
- Relatório before da W3C: https://www.w3.org/WAI/demos/bad/before/reports/survey.html
- Relatório after da W3C: https://www.w3.org/WAI/demos/bad/after/reports/survey.html
- WCAG 2.2: https://www.w3.org/TR/WCAG22/

## Observação Sobre WCAG

A demonstração W3C BAD foi criada com referência à WCAG 2.0. Neste projeto, os achados selecionados são relacionados à WCAG 2.2 por análise dos critérios correspondentes antes de citar critério atual.

A execução axe-core registrada no estudo usa as tags `wcag2a`, `wcag2aa`, `wcag21a`, `wcag21aa` e `best-practice`. Ela apoia a triagem, mas não representa uma varredura automática completa de toda a WCAG 2.2.

## Como Interpretar A Suíte Before

As verificações da versão before são caracterizações de barreiras conhecidas. Quando um teste before passa, a leitura correta é: a barreira esperada foi detectada na página avaliada.

Esse resultado não significa que a página before esteja aprovada em acessibilidade. Se a W3C corrigir uma dessas barreiras, o teste que esperava encontrá-la pode falhar por uma mudança positiva e exigir revisão do achado.

## Recorte De Achados

| ID | Versão | Evidência | Impacto | WCAG 2.2 relacionada | Prioridade | Recomendação | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| A11Y-001 | Before | Radio buttons do parque sem labels programáticos | Pessoas usando leitor de tela podem ouvir controles sem nome útil e não entender a opção | 1.3.1, 3.3.2, 4.1.2 | Alta | Associar cada input a um label visível e programático | Aberto |
| A11Y-002 | Before | Campos de nome/e-mail sem labels associados | A pessoa pode não entender qual campo preencher, especialmente com tecnologia assistiva | 1.3.1, 3.3.2 | Alta | Usar `label for/id` ou label envolvendo o input | Aberto |
| A11Y-003 | Before | Grupos de radio sem `fieldset`/`legend` | A pergunta pode se desconectar das opções quando a página é navegada fora do layout visual | 1.3.1 | Média | Agrupar controles relacionados com `fieldset` e `legend` | Aberto |
| A11Y-004 | After | Skip link interno leva ao conteúdo do formulário corrigido | Reduz esforço de navegação por teclado e ajuda a pessoa a chegar ao conteúdo principal | 2.1.1, 2.4.1 | Positivo | Manter skip links apontando para regiões úteis | Validado |

## Achado Explicado Do Começo Ao Fim

### A11Y-001 - Radio buttons sem labels programáticos na versão before

**Causa:** na versão before, as opções de parque aparecem como inputs radio em uma tabela, mas sem associação programática com texto por `label for/id`, `aria-label` ou mecanismo equivalente.

**Como foi evidenciado:** a suíte Robot verifica que a versão before não expõe radio por nome acessível `Central Park`, enquanto a versão after permite localizar e acionar `role=radio[name="Central Park"]`.

**Impacto para a pessoa usuária:** quem navega com leitor de tela ou depende de nomes acessíveis pode encontrar controles com pouca ou nenhuma informação útil. Isso dificulta compreender qual opção está sendo marcada e aumenta o risco de erro no preenchimento.

**Critérios relacionados:** WCAG 2.2 1.3.1 Info and Relationships, 3.3.2 Labels or Instructions e 4.1.2 Name, Role, Value.

**Recomendação:** cada opção deve ter nome acessível claro e persistente. A solução da versão after, com labels associados aos radios e agrupamento por `fieldset`/`legend`, é uma referência adequada para este recorte.

**Evidências:**

- Teste Robot: `Versao Com Barreiras Evidencia Falta De Rotulos E Grupos Semanticos`.
- Teste Robot: `Preencher Campos Da Versao Corrigida Aceita Entradas Esperadas`.
- Relatório W3C before cita falha relacionada à associação programática entre labels e controles em 1.3.1/4.1.2.

## Evidências Automatizadas

Gerar evidências Robot:

```bash
python -m robot --outputdir results/w3c --include accessibility tests/accessibility
```

Execução seletiva por versão:

```bash
python -m robot --outputdir results/w3c-before tests/accessibility/w3c_survey_before_accessibility.robot
python -m robot --outputdir results/w3c-after tests/accessibility/w3c_survey_after_accessibility.robot
```

Gerar evidências axe-core:

```bash
npm run a11y:axe
```

Resultados esperados:

- `results/w3c/log.html`
- `results/w3c/report.html`
- `results/w3c/output.xml`
- `results/axe/before.json`
- `results/axe/after.json`
- `results/axe/summary.md`

Resumo versionável da execução usada como referência:

- `docs/axe-summary.md`
