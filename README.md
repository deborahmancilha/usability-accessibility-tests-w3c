# W3C | Testes de usabilidade e acessibilidade

Estudo pessoal de usabilidade e acessibilidade no preenchimento de formularios, comparando duas versoes da mesma pagina da demonstracao W3C Before and After Demonstration.

- Formulario com barreiras: https://www.w3.org/WAI/demos/bad/before/survey.html
- Formulario com correcoes: https://www.w3.org/WAI/demos/bad/after/survey.html
- Overview W3C BAD: https://www.w3.org/WAI/demos/bad/Overview.html

A W3C apresenta o BAD como um recurso multi-pagina que mostra um site inacessivel e uma versao corrigida. O proprio material observa que a demonstracao cobre apenas parte das barreiras possiveis, entao este projeto combina estudo pessoal, automacao e analise critica dos resultados.

## Origem Academica

A ideia deste projeto surgiu dos estudos da disciplina **Testes de Usabilidade e Acessibilidade**, da minha pos-graduacao em **Engenharia de Qualidade e Teste de Software | PUC Minas**, em andamento, iniciada em 2025.

## Pergunta Norteadora

Uma pessoa consegue encontrar, compreender e preencher o formulario usando mouse e teclado, sem perder a orientacao sobre os campos e suas instrucoes?

## Entregas Do Projeto

| Parte | O que sera feito | Evidencia |
| ----- | ---------------- | --------- |
| Planejamento | Definir objetivo, roteiro, recorte e limites | `docs/study-plan.md` |
| Inspecao de usabilidade | Avaliacao heuristica e percurso cognitivo do formulario | `docs/usability-inspection.md` e `tests/usability/` |
| Avaliacao de acessibilidade | Inspecionar labels, teclado, foco, grupos e axe-core | `docs/accessibility-findings.md` e `results/axe/` |
| Automacao | Repetir verificacoes objetivas nas duas versoes | Suites Robot, logs, screenshots e relatorios |
| Triagem automatica | Interpretar resultados axe-core sem afirmar conformidade integral | `docs/axe-triage.md` |
| Comunicacao | Explicar impacto, prioridade e recomendacoes | `docs/portfolio-report.md` |

## Arquitetura

```text
Test cases
  -> Study flow keywords
  -> Page/component keywords
  -> Robot Framework Browser
  -> Playwright
```

Os testes em `tests/` expressam comportamento verificavel. Locators e detalhes de interface ficam em `resources/pages/`. Fluxos do estudo ficam em `resources/flows/`. Configuracao de ambiente e URLs ficam em `config/` e `variables/runtime.py`.

## Estrutura Atual

```text
config/                 configuracao do estudo W3C
resources/common/       ciclo de browser, contexto e evidencias
resources/pages/        locators e verificacoes da pagina Survey
resources/flows/        fluxos do estudo para before/after
tests/accessibility/    suites Robot de acessibilidade separadas por before/after
tests/usability/        suites Robot de usabilidade separadas por before/after
docs/                   plano, triagem, achados e relatorio
scripts/                execucao axe-core
results/                relatorios gerados, nao versionados
```

## Pre-requisitos

- Python 3.12 ou superior.
- Node.js 22, 24 ou 26 LTS.
- Navegadores Playwright instalados via Browser Library.

## Instalacao

Com `venv` e `pip`:

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -e ".[dev]"
python -m Browser.entry init chromium
npm install
npx playwright install chromium
```

No Windows PowerShell:

```powershell
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -e ".[dev]"
python -m Browser.entry init chromium
npm install
npx playwright install chromium
```

Se o comando `python` nao existir no seu PATH mesmo com a venv ativada, use explicitamente:

```powershell
.\.venv\Scripts\python.exe -m robot --outputdir results/w3c --include accessibility tests/accessibility
```

## Configuracao

O ambiente principal e `w3c`. Ele ja e o padrao em `variables/runtime.py`, mas pode ser definido explicitamente:

```bash
ENV=w3c
```

No PowerShell:

```powershell
$env:ENV = "w3c"
```

As URLs avaliadas podem ser sobrescritas por `W3C_BEFORE_URL` e `W3C_AFTER_URL`, caso seja necessario apontar para uma copia controlada das paginas.

## Execucao Robot

Todas as verificacoes de acessibilidade:

```bash
python -m robot --outputdir results/w3c --include accessibility tests/accessibility
```

Somente acessibilidade da versao com barreiras:

```bash
python -m robot --outputdir results/w3c-before tests/accessibility/w3c_survey_before_accessibility.robot
```

Somente acessibilidade da versao corrigida:

```bash
python -m robot --outputdir results/w3c-after tests/accessibility/w3c_survey_after_accessibility.robot
```

Todas as verificacoes de usabilidade:

```bash
python -m robot --outputdir results/usability tests/usability
```

Somente usabilidade da versao com barreiras:

```bash
python -m robot --outputdir results/usability-before tests/usability/w3c_survey_before_usability.robot
```

Somente usabilidade da versao corrigida:

```bash
python -m robot --outputdir results/usability-after tests/usability/w3c_survey_after_usability.robot
```

Execucao paralela:

```powershell
.\.venv\Scripts\python.exe -m pabot.pabot --command .\.venv\Scripts\python.exe -m robot --end-command --processes 4 --outputdir results/project-parallel tests
```

## Axe-Core

O axe-core gera evidencia automatica complementar. Ele nao substitui avaliacao manual de teclado, foco, entendimento e contexto. A W3C ressalta que ferramentas nao conseguem verificar todos os aspectos automaticamente, exigem julgamento humano e podem produzir resultados falsos ou enganosos.

```bash
npm run a11y:axe
```

Saidas:

- `results/axe/before.json`
- `results/axe/after.json`
- `results/axe/summary.md`

Para falhar o comando quando houver violacoes:

```bash
AXE_FAIL_ON_VIOLATIONS=true npm run a11y:axe
```

## Lint

```bash
python -m ruff check variables scripts
python -m robocop check tests resources variables
```

## Debug

```bash
HEADLESS=false python -m robot --loglevel DEBUG --outputdir results/w3c --include accessibility tests/accessibility
```

Evidencias Robot ficam em `results/`, incluindo `output.xml`, `log.html`, `report.html` e screenshots em falhas.

## Limites Do Estudo

- A demonstracao W3C BAD foi criada com referencia a WCAG 2.0.
- Antes de citar um criterio atual, conferir correspondencia com a WCAG 2.2.
- Um resultado sem violacoes detectadas por ferramenta automatica deve ser descrito como `sem violacoes detectadas pela ferramenta`, nao como conformidade integral com WCAG.
- O estudo inicial aprofunda quatro diferencas: labels, agrupamento semantico, teclado/foco e skip links.
- Esta versao e um estudo pessoal apoiado por automacao, inspecao propria e triagem critica dos resultados.

## CI

O workflow `.github/workflows/tests.yml` executa lint, verificacoes W3C com Robot e axe-core em Pull Requests. Em `main` ou schedule, tambem executa suites `regression` via Pabot.

## Como Criar Novas Verificacoes

1. Identifique a barreira ou comportamento observavel.
2. Registre o achado em `docs/accessibility-findings.md`.
3. Crie ou atualize keyword de pagina em `resources/pages/`.
4. Orquestre o fluxo do estudo em `resources/flows/`.
5. Escreva cenario em `tests/` sem locators diretos.
6. Rode lint, Robot e, quando aplicavel, axe-core.

## Boas Praticas

- Use assertions retryable do Browser Library em vez de `Sleep`.
- Mantenha testes independentes e executaveis em qualquer ordem.
- Nao use SeleniumLibrary.
- Evite XPath absoluto, seletores posicionais e classes CSS dinamicas.
- Diferencie achado automatizado de achado manual.
- Nao trate axe-core como prova completa de conformidade WCAG.
