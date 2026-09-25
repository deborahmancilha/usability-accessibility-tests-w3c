# Guia Para Agentes De Codigo

Este repositorio contem um estudo de usabilidade e acessibilidade do formulario W3C BAD, com Robot Framework Browser, Playwright e axe-core. Preserve a arquitetura abaixo salvo justificativa tecnica objetiva.

## Estrutura

```text
tests/                  cenarios e verificacoes repetiveis separados por dominio e versao
resources/flows/        fluxos do estudo e keywords de orquestracao
resources/pages/        locators, acoes e assertions de paginas
resources/common/       infraestrutura coesa e pequena
variables/runtime.py    resolucao de ambiente, URLs e paths
config/                 defaults e ambiente W3C
docs/                   plano, roteiro, triagem, achados e relatorio
scripts/                ferramentas auxiliares, incluindo axe-core
results/                artefatos gerados, nao versionados
```

## Regras

- Nao utilizar `Sleep` para sincronizacao normal.
- Nao adicionar `SeleniumLibrary`.
- Nao adicionar XPath absoluto.
- Nao colocar locators nos casos de teste.
- Nao criar dependencia entre testes.
- Nao criar wrappers de Browser Library sem necessidade.
- Nao transformar `common` ou page resources em arquivos gigantes.
- Nao esconder falhas com retries amplos ou `try/except` generico.
- Separar achados humanos de achados automatizados.
- Nao dizer que axe-core prova conformidade WCAG completa.
- Executar lint e testes antes de concluir alteracoes.

## Comandos

Instalacao:

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -e ".[dev]"
python -m Browser.entry init chromium
npm install
npx playwright install chromium
```

Lint:

```bash
python -m ruff check variables scripts
python -m robocop check tests resources variables
```

W3C accessibility:

```bash
ENV=w3c HEADLESS=true python -m robot --outputdir results/w3c --include accessibility tests/accessibility
```

W3C usability:

```bash
ENV=w3c HEADLESS=true python -m robot --outputdir results/usability tests/usability
```

Axe-core:

```bash
npm run a11y:axe
```

Paralelo:

```bash
.\.venv\Scripts\python.exe -m pabot.pabot --command .\.venv\Scripts\python.exe -m robot --end-command --processes 4 --outputdir results/project-parallel tests
```

## Definition Of Done

- Robot Framework e Browser Library instalados.
- `python -m Browser.entry init chromium` executado no ambiente.
- `npm install` e `npx playwright install chromium` executados quando axe-core for usado.
- Testes W3C executados com sucesso.
- Lint Python e Robot executados.
- Evidencias de acessibilidade atualizadas em `docs/` quando houver novo achado.
- `docs/study-plan.md`, `docs/axe-triage.md` e `docs/accessibility-findings.md` mantidos coerentes com o recorte avaliado.
- Sem `Sleep` como sincronizacao.
- Sem locators dentro de `tests/`.
- `results/` usado para relatorios e evidencias.
- README atualizado quando comandos, arquitetura ou convencoes mudarem.
