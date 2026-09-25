# Estudo de usabilidade e acessibilidade do formulário W3C BAD

Projeto pessoal de QA que investiga como diferenças na estrutura de um formulário afetam sua operação e a clareza da tarefa. O estudo compara as versões com barreiras intencionais e com correções da página Survey da demonstração Before and After Demonstration (BAD), mantida pela W3C.

O projeto combina inspeção de usabilidade, verificações automatizadas com Robot Framework Browser e triagem de acessibilidade com axe-core. Seu objetivo é relacionar cada achado a uma evidência observável, explicar seu possível impacto e mostrar quais verificações podem ser repetidas ao longo do tempo.

Este é um estudo individual. A avaliação heurística e o percurso cognitivo foram conduzidos pela autora, sem sessões com participantes. As conclusões de usabilidade são resultados dessa inspeção.

- [Formulário com barreiras](https://www.w3.org/WAI/demos/bad/before/survey.html)
- [Formulário com correções](https://www.w3.org/WAI/demos/bad/after/survey.html)
- [Sobre a demonstração BAD](https://www.w3.org/WAI/demos/bad/)

## O Que Este Projeto Demonstra

- Planejamento de um estudo com pergunta, tarefa e escopo definidos.
- Automação em Robot Framework Browser para caracterizar barreiras conhecidas e verificar comportamentos da versão corrigida.
- Análise de acessibilidade que relaciona testes, resultados do axe-core, critérios WCAG e impacto possível para quem usa o formulário.
- Inspeção individual de usabilidade com avaliação heurística e percurso cognitivo documentados.
- Organização de evidências e comunicação de achados para apoiar decisões de melhoria.

**Exemplo de investigação:** as opções de parque na versão Before não expõem o nome acessível esperado. A suíte registra essa condição; a versão After permite localizar e selecionar `Central Park` pelo nome acessível. O [achado A11Y-001](docs/accessibility-findings.md) explica a evidência, o impacto possível e a recomendação.

## Origem Acadêmica

A ideia deste projeto surgiu dos estudos da disciplina **Testes de Usabilidade e Acessibilidade**, da minha pós-graduação em **Engenharia de Qualidade e Teste de Software - PUC Minas**.

## Pergunta Norteadora

Uma pessoa consegue encontrar, compreender e preencher o formulário usando mouse e teclado, sem perder a orientação sobre os campos e suas instruções?

## Por Que Comparar Before E After?

A versão Before contém barreiras introduzidas na demonstração. Ela permite verificar se os testes conseguem detectar condições problemáticas conhecidas, como a falta de nomes acessíveis em controles selecionados.

A versão After permite examinar as soluções correspondentes e percorrer a mesma tarefa por controles identificados de forma acessível.

Um teste aprovado na suíte Before significa que a condição esperada foi observada. Ele não representa aprovação da acessibilidade daquela página. Como o projeto examina um site externo, mudanças nas páginas exigem nova análise antes de atualizar as expectativas dos testes.

| Suíte | O que verifica | O que significa um teste aprovado |
| --- | --- | --- |
| Before | Presença de características problemáticas conhecidas, como controles sem nome acessível ou ausência de skip link interno | A barreira esperada foi detectada naquela página |
| After | Presença e funcionamento das correções escolhidas para o estudo | O comportamento definido no teste foi observado |
| axe-core | Regras automáticas aplicadas às duas páginas | Foi gerada uma triagem técnica para investigação |

Por isso, as suítes Before funcionam como verificações de referência ou caracterização de barreiras. Se a W3C corrigir uma barreira da versão Before, o teste que esperava encontrá-la poderá falhar por uma mudança positiva. A palavra regressão fica reservada aos comportamentos acompanhados continuamente.

## Métodos Usados

| Método | Aplicação neste projeto |
| --- | --- |
| Avaliação heurística | Inspeção do formulário com princípios de usabilidade como guia para identificar possíveis problemas de interface. |
| Percurso cognitivo | Análise passo a passo da tarefa de responder à pesquisa, considerando o que uma pessoa nova no site precisaria perceber e entender. |
| Robot Framework Browser | Verificação repetível de elementos, nomes acessíveis e comportamentos definidos para as duas versões. Também apoia o registro de evidências da tarefa. |
| axe-core | Execução de regras automáticas para indicar pontos que precisam de triagem e interpretação. |

A inspeção foi feita pela autora. As verificações automatizadas cobrem condições específicas definidas nos testes. 

## Conceitos Em Poucas Palavras

**W3C:** World Wide Web Consortium, organização internacional que desenvolve padrões para a Web. Sua iniciativa WAI trabalha com padrões e materiais de apoio para acessibilidade.

**WCAG 2.2:** Web Content Accessibility Guidelines, recomendações da W3C com critérios verificáveis para tornar conteúdo Web mais acessível. A demonstração BAD foi construída com referência à WCAG 2.0. Os achados selecionados neste estudo são relacionados à WCAG 2.2 por análise dos critérios correspondentes.

**axe-core:** motor de testes automáticos de acessibilidade para interfaces Web. Aqui ele é executado por meio de `@axe-core/playwright` para gerar resultados das duas páginas. Foi escolhido por permitir incorporar regras automáticas ao fluxo de testes e guardar os resultados para triagem.

**Avaliação heurística:** inspeção da interface orientada por princípios de usabilidade. O registro explica a observação, o princípio relacionado e uma possível melhoria.

**Percurso cognitivo:** inspeção dos passos de uma tarefa sob a perspectiva de alguém que usa a interface pela primeira vez. Em cada passo, a avaliadora examina se a ação necessária pode ser descoberta e se seu resultado pode ser compreendido.

## Resultados em Usabilidade

A inspeção de usabilidade foi registrada em `docs/usability-inspection.md` e usa duas técnicas complementares: avaliação heurística, guiada pelas heurísticas de Nielsen, e percurso cognitivo da tarefa `responder a pesquisa sobre parques`.

| Achado | Comparação before/after | Evidência |
| --- | --- | --- |
| Opções de parque dependem mais do layout na versão before | Before mostra radios e textos próximos, mas sem labels programáticos; after associa cada opção ao texto clicável e ao nome acessível. | `docs/evidence/usability-before-form.png`, `docs/evidence/usability-after-park-selected.png` e suítes Robot |
| Cidade exige menos inferência na versão after | Before usa tabela visual para aproximar pergunta e select; after agrupa a pergunta em `fieldset`/`legend` e organiza a lista com `optgroup`. | Suítes Robot `w3c_survey_before_usability.robot` e `w3c_survey_after_usability.robot` |
| Newsletter opcional fica mais compreensível na versão after | Before desalinha campos e textos, deixando a relação entre instrução e input mais fraca; after informa opcionalidade e mantém labels próximos dos campos. | `docs/evidence/usability-after-newsletter-filled.png` |
| Feedback de término melhora na versão after | Before navega para `survey.php`, mas mostra resultados sem confirmação clara; after exibe mensagem explícita de sucesso e nota sobre a demonstração. | `docs/evidence/usability-before-submit-result.png` e `docs/evidence/usability-after-submit-result.png` |

## Resultados em Acessibilidade

Os achados de acessibilidade foram registrados em `docs/accessibility-findings.md` e relacionam barreiras selecionadas, impactos possíveis, critérios WCAG associados e evidências automatizadas do recorte avaliado.

| Achado | Impacto | Evidência |
| --- | --- | --- |
| Before não possui labels no formulário da pesquisa | Campos e opções podem ser anunciados sem nome acessível | Suite Robot `w3c_survey_before_accessibility.robot` |
| Before não agrupa opções relacionadas com fieldset/legend | A pergunta pode se desconectar das opções para leitor de tela | Suite Robot `w3c_survey_before_accessibility.robot` |
| After permite preenchimento por nomes acessíveis | O mesmo fluxo fica mais robusto para teclado e tecnologia assistiva | Suite Robot `Preencher Campos Da Versao Corrigida Aceita Entradas Esperadas` |
| Skip link e destino | Reduz esforço de navegação por teclado e leva ao conteúdo principal | Resultado do teste Robot `Skip Link Interno Leva Ao Conteudo Do Formulario Corrigido` |

## Varredura Automática

A execução local registrada em [docs/axe-summary.md](docs/axe-summary.md) em 2026-09-25 usou axe-core 4.13.0 via `@axe-core/playwright`, com viewport 1366x768 e URLs efetivas das páginas W3C. Ela registrou 7 violações na versão before e 4 na versão after, com 1 item incompleto em cada página.

Regras com violações na versão before: `html-has-lang`, `image-alt`, `label`, `landmark-one-main`, `link-name`, `region`, `select-name`.

Regras com violações na versão after: `empty-table-header`, `label-title-only`, `landmark-one-main`, `region`.

Esse resultado é tratado como triagem automática, não como conclusão final de conformidade. As duas páginas tiveram violações detectadas e exigem interpretação. A execução do axe usou as tags `wcag2a`, `wcag2aa`, `wcag21a`, `wcag21aa` e `best-practice`; os achados selecionados são relacionados à WCAG 2.2 por análise, não por uma varredura automática completa de toda a WCAG 2.2.

## Sugestões de Melhoria

1. Deixar claro o nome e a função de cada campo, para que a pessoa saiba o que preencher mesmo fora do contexto visual da página. Associar todo input a um label programático.
2. Aproximar perguntas e opções relacionadas, para que a pessoa entenda qual conjunto de respostas pertence a cada pergunta. Agrupar radios e checkboxes com `fieldset` e `legend`.
3. Facilitar a navegação por teclado até as áreas importantes da página, reduzindo o esforço para chegar ao conteúdo principal. Manter skip links apontando para regiões úteis.
4. Destacar visualmente onde está o foco durante a navegação por teclado, para que a pessoa não perca orientação durante a tarefa. 
5. Manter instruções próximas dos campos, para que a pessoa não precise procurar em outra parte da tela o que deve fazer. Posicionar textos de ajuda junto aos controles relacionados.
6. Informar claramente o resultado de ações importantes, como o envio do formulário, para que a pessoa saiba se a tarefa foi concluída. Exibir uma mensagem de confirmação objetiva após o submit.


## Guia Dos Documentos

| Documento | O que você encontrará |
| --- | --- |
| [Plano do estudo](docs/study-plan.md) | Pergunta, tarefa, escopo e limites da investigação. |
| [Inspeção de usabilidade](docs/usability-inspection.md) | Avaliação heurística e percurso cognitivo das duas versões. |
| [Achados de acessibilidade](docs/accessibility-findings.md) | Barreiras selecionadas, impactos possíveis e critérios relacionados. |
| [Triagem do axe-core](docs/axe-triage.md) | Leitura dos resultados automáticos e pontos que exigem investigação. |
| [Resumo da varredura axe](docs/axe-summary.md) | Resultado estável da execução usada como referência no README. |
| [Evidências selecionadas](docs/evidence/) | Capturas estáveis para navegação no GitHub. Os resultados completos continuam em `results/`. |

## Arquitetura

O projeto separa intenção do teste, orquestração do fluxo e detalhes da página. Assim, os cenários ficam legíveis para QA e os seletores ficam concentrados em um único lugar.

```text
tests/
  -> resources/flows/
    -> resources/pages/
      -> resources/common/
        -> Robot Framework Browser
          -> Playwright
            -> páginas W3C BAD
```

| Camada | Responsabilidade |
| --- | --- |
| `tests/` | Declara os cenários do estudo, separados por domínio e versão. Não contém locators. |
| `resources/flows/` | Orquestra passos da tarefa, como abrir a página, preencher o formulário e registrar evidências. |
| `resources/pages/` | Centraliza locators, ações e verificações específicas da página Survey. |
| `resources/common/` | Mantém infraestrutura compartilhada, como abertura de browser, contexto de teste e captura de evidências. |
| `variables/runtime.py` e `config/` | Resolvem ambiente, URLs e diretórios usados nas execuções. |
| `scripts/` | Executa ferramentas auxiliares, como a varredura axe-core com Playwright. |

Na prática, um cenário Robot descreve **o que** deve ser observado; os fluxos dizem **como** a tarefa é percorrida; os page resources guardam **onde** cada elemento está na interface. Essa separação reduz duplicação e facilita revisar mudanças no site externo.

## Estrutura Atual

```text
config/                 configuração do estudo W3C
resources/common/       ciclo de browser, contexto e evidências
resources/pages/        locators e verificações da página Survey
resources/flows/        fluxos do estudo para before/after
tests/accessibility/    suítes Robot de acessibilidade separadas por before/after
tests/usability/        suítes Robot de usabilidade separadas por before/after
docs/                   plano, triagem, achados detalhados e evidências selecionadas
scripts/                execução axe-core
results/                relatórios gerados, não versionados
```

## Pré-Requisitos

- Python 3.12 ou superior, com `venv` e `pip` disponíveis.
- Node.js 22, 24 ou 26 LTS, com `npm` disponível.
- Acesso à internet para instalar dependências e executar os testes contra as páginas W3C BAD.
- Dependências Python do projeto instaladas com `python -m pip install -e ".[dev]"`:
  `robotframework`, `robotframework-browser`, `robotframework-pabot`, `PyYAML`, `ruff` e `robocop`.
- Inicialização da Browser Library executada com `python -m Browser.entry init chromium`.
- Dependências Node instaladas com `npm install`: `playwright` e `@axe-core/playwright`.
- Navegador Chromium do Playwright instalado com `npx playwright install chromium`.

Os comandos completos estão na seção de instalação abaixo.

## Instalação

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

Se o comando `python` não existir no seu PATH mesmo com a venv ativada, use explicitamente:

```powershell
.\.venv\Scripts\python.exe -m robot --outputdir results/w3c --include accessibility tests/accessibility
```

## Configuração

O ambiente principal é `w3c`. Ele já é o padrão em `variables/runtime.py`, mas pode ser definido explicitamente:

```bash
ENV=w3c
```

No PowerShell:

```powershell
$env:ENV = "w3c"
```

As URLs avaliadas podem ser sobrescritas por `W3C_BEFORE_URL` e `W3C_AFTER_URL`, caso seja necessário apontar para uma cópia controlada das páginas.

## Execução Robot

Todas as verificações de acessibilidade:

```bash
python -m robot --outputdir results/w3c --include accessibility tests/accessibility
```

Somente acessibilidade da versão com barreiras:

```bash
python -m robot --outputdir results/w3c-before tests/accessibility/w3c_survey_before_accessibility.robot
```

Somente acessibilidade da versão corrigida:

```bash
python -m robot --outputdir results/w3c-after tests/accessibility/w3c_survey_after_accessibility.robot
```

Todas as verificações de usabilidade:

```bash
python -m robot --outputdir results/usability tests/usability
```

Somente usabilidade da versão com barreiras:

```bash
python -m robot --outputdir results/usability-before tests/usability/w3c_survey_before_usability.robot
```

Somente usabilidade da versão corrigida:

```bash
python -m robot --outputdir results/usability-after tests/usability/w3c_survey_after_usability.robot
```

Execução paralela:

```powershell
.\.venv\Scripts\python.exe -m pabot.pabot --command .\.venv\Scripts\python.exe -m robot --end-command --processes 4 --outputdir results/project-parallel tests
```

## Axe-Core

O axe-core gera evidência automática complementar. Ele não substitui avaliação manual de teclado, foco, entendimento e contexto. A W3C ressalta que ferramentas não conseguem verificar todos os aspectos automaticamente, exigem julgamento humano e podem produzir resultados falsos ou enganosos.

```bash
npm run a11y:axe
```

Saídas:

- `results/axe/before.json`
- `results/axe/after.json`
- `results/axe/summary.md`

Resumo versionável da execução usada neste README:

- `docs/axe-summary.md`

Para falhar o comando quando houver violações:

```bash
AXE_FAIL_ON_VIOLATIONS=true npm run a11y:axe
```

Esse modo usa a existência de qualquer violação como critério de saída. Como o script analisa as versões Before e After, violações em qualquer uma das duas páginas fazem o comando terminar com falha. Use essa opção quando a intenção for bloquear a execução diante de violações automatizadas; para triagem comparativa, leia os JSONs e o resumo em `docs/axe-summary.md`, com data, URL efetiva, versão da ferramenta e regras detectadas.

## Evidências

`results/` guarda relatórios completos, logs e capturas geradas localmente. Essa pasta não é versionada.

`docs/evidence/` reúne poucas capturas selecionadas, estáveis e sem dados sensíveis para que quem navega pelo GitHub consiga ver exemplos do material usado na inspeção.

## Lint

```bash
python -m ruff check variables scripts
python -m robocop check tests resources variables
```

## Debug

```bash
HEADLESS=false python -m robot --loglevel DEBUG --outputdir results/w3c --include accessibility tests/accessibility
```

Evidências Robot ficam em `results/`, incluindo `output.xml`, `log.html`, `report.html` e screenshots em falhas.

## Limites Do Estudo

- A demonstração W3C BAD foi criada com referência à WCAG 2.0.
- Antes de citar um critério atual, conferir correspondência com a WCAG 2.2.
- Um resultado sem violações detectadas por ferramenta automática deve ser descrito como `sem violações detectadas pela ferramenta`, não como conformidade integral com WCAG.
- O estudo inicial aprofunda quatro diferenças: labels, agrupamento semântico, teclado/foco e skip links.
- Esta versão é um estudo pessoal apoiado por automação, inspeção própria e triagem crítica dos resultados.
- As suítes Robot de usabilidade apoiam e registram evidências da inspeção. A execução delas, sozinha, não avalia se uma pessoa compreenderia a interface.
- O estudo não apresenta uma declaração de conformidade integral com a WCAG.

## CI

O workflow `.github/workflows/tests.yml` executa lint, verificações W3C com Robot e axe-core em Pull Requests. Em `main` ou schedule, também executa suítes `regression` via Pabot.

## Como Criar Novas Verificações

1. Identifique a barreira ou comportamento observável.
2. Registre o achado em `docs/accessibility-findings.md`.
3. Crie ou atualize keyword de página em `resources/pages/`.
4. Orquestre o fluxo do estudo em `resources/flows/`.
5. Escreva cenário em `tests/` sem locators diretos.
6. Rode lint, Robot e, quando aplicável, axe-core.

## Boas Práticas

- Use assertions retryable do Browser Library em vez de `Sleep`.
- Mantenha testes independentes e executáveis em qualquer ordem.
- Não use SeleniumLibrary.
- Evite XPath absoluto, seletores posicionais e classes CSS dinâmicas.
- Diferencie achado automatizado de achado manual.
- Não trate axe-core como prova completa de conformidade WCAG.
