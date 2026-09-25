# Registro De Achados De Acessibilidade

Arquivo para documentar achados manuais e automatizados nas paginas W3C BAD.

## Fontes Avaliadas

- Before: https://www.w3.org/WAI/demos/bad/before/survey.html
- After: https://www.w3.org/WAI/demos/bad/after/survey.html
- Relatorio before da W3C: https://www.w3.org/WAI/demos/bad/before/reports/survey.html
- Relatorio after da W3C: https://www.w3.org/WAI/demos/bad/after/reports/survey.html
- WCAG 2.2: https://www.w3.org/TR/WCAG22/

## Observacao Sobre WCAG

A demonstracao W3C BAD foi criada com referencia a WCAG 2.0. Neste projeto, os achados sao comparados com a WCAG 2.2 antes de citar criterio atual. Os criterios citados abaixo continuam existindo na WCAG 2.2.

## Como Interpretar A Suite Before

As verificacoes da versao before sao caracterizacoes de barreiras conhecidas. Quando um teste before passa, a leitura correta e: a barreira esperada foi detectada na pagina avaliada.

Esse resultado nao significa que a pagina before esteja aprovada em acessibilidade. Se a W3C corrigir uma dessas barreiras, o teste que esperava encontra-la pode falhar por uma mudanca positiva e exigir revisao do achado.

## Recorte De Achados

| ID | Versao | Evidencia | Impacto | WCAG 2.2 relacionada | Prioridade | Recomendacao | Status |
| -- | ------ | --------- | ------- | -------------------- | ---------- | ------------ | ------ |
| A11Y-001 | Before | Radio buttons do parque sem labels programaticos | Pessoas usando leitor de tela podem ouvir controles sem nome util e nao entender a opcao | 1.3.1, 3.3.2, 4.1.2 | Alta | Associar cada input a um label visivel e programatico | Aberto |
| A11Y-002 | Before | Campos de nome/e-mail sem labels associados | Usuario pode nao entender qual campo preencher, especialmente com tecnologia assistiva | 1.3.1, 3.3.2 | Alta | Usar label for/id ou label envolvendo o input | Aberto |
| A11Y-003 | Before | Grupos de radio sem fieldset/legend | A pergunta pode se desconectar das opcoes quando a pagina e navegada fora do layout visual | 1.3.1 | Media | Agrupar controles relacionados com fieldset e legend | Aberto |
| A11Y-004 | After | Skip links internos e foco operavel por teclado | Reduz esforco de navegacao e ajuda a pessoa a chegar ao conteudo principal | 2.1.1, 2.4.1, 2.4.7 | Positivo | Manter skip links e validar foco visivel em revisoes manuais | Validado |

## Achado Explicado Do Comeco Ao Fim

### A11Y-001 - Radio buttons sem labels programaticos na versao before

**Causa:** na versao before, as opcoes de parque aparecem como inputs radio em uma tabela, mas sem associacao programatica com texto por `label for/id`, `aria-label` ou mecanismo equivalente.

**Como foi evidenciado:** a suite Robot verifica que a versao before nao expoe radio por nome acessivel `Central Park`, enquanto a versao after permite localizar e acionar `role=radio[name="Central Park"]`.

**Impacto para a pessoa usuaria:** quem navega com leitor de tela ou depende de nomes acessiveis pode encontrar controles com pouca ou nenhuma informacao util. Isso dificulta compreender qual opcao esta sendo marcada e aumenta o risco de erro no preenchimento.

**Criterios relacionados:** WCAG 2.2 1.3.1 Info and Relationships, 3.3.2 Labels or Instructions e 4.1.2 Name, Role, Value.

**Recomendacao:** cada opcao deve ter nome acessivel claro e persistente. A solucao da versao after, com labels associados aos radios e agrupamento por `fieldset`/`legend`, e uma referencia adequada para este recorte.

**Evidencias:**

- Teste Robot: `Versao Com Barreiras Evidencia Falta De Rotulos E Grupos Semanticos`.
- Teste Robot: `Preencher Campos Da Versao Corrigida Aceita Entradas Esperadas`.
- Relatorio W3C before cita falha relacionada a associacao programatica entre labels e controles em 1.3.1/4.1.2.

## Evidencias Automatizadas

Gerar evidencias Robot:

```bash
python -m robot --outputdir results/w3c --include accessibility tests/accessibility
```

Execucao seletiva por versao:

```bash
python -m robot --outputdir results/w3c-before tests/accessibility/w3c_survey_before_accessibility.robot
python -m robot --outputdir results/w3c-after tests/accessibility/w3c_survey_after_accessibility.robot
```

Gerar evidencias axe-core:

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
