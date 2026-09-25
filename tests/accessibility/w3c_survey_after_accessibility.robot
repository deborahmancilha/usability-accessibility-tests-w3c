*** Settings ***
Documentation       Verificacoes objetivas de acessibilidade da versao corrigida do formulario W3C BAD.
Variables           ../../variables/runtime.py
Resource            ../../resources/common/browser.resource
Resource            ../../resources/flows/w3c_survey_accessibility.resource

Suite Setup         Abrir Browser Da Suite
Suite Teardown      Fechar Browser Da Suite
Test Teardown       Fechar Contexto De Teste


*** Test Cases ***
Abrir A Pesquisa Corrigida Carrega Conteudo Principal
    [Tags]    accessibility    regression    w3c    after    opening
    Dado Que Abro O Formulario W3C Corrigido
    Entao A Pesquisa Deve Exibir Conteudo Principal

Localizar O Formulario Corrigido Exibe Elementos Necessarios Para A Tarefa
    [Tags]    accessibility    regression    usability    w3c    after    form-discovery
    Dado Que Abro O Formulario W3C Corrigido
    Entao Os Elementos Necessarios Da Tarefa Devem Estar Presentes
    E A Versao Corrigida Deve Ter Suporte Basico A Acessibilidade Do Formulario

Preencher Campos Da Versao Corrigida Aceita Entradas Esperadas
    [Tags]    usability    accessibility    e2e    w3c    after    form-fill
    Dado Que Abro O Formulario W3C Corrigido
    Quando Preencho O Formulario Corrigido Por Nomes Acessiveis
    Entao Os Dados Devem Permanecer Preenchidos No Formulario Corrigido

Skip Link Interno Leva Ao Conteudo Do Formulario Corrigido
    [Tags]    usability    keyboard    accessibility    w3c    after    skip-link
    Dado Que Abro O Formulario W3C Corrigido
    Quando Aciono O Skip Link Interno Para Chegar Ao Conteudo
    Entao O Skip Link Deve Levar Ao Conteudo Principal

Percorrer O Formulario Corrigido Por Teclado Mantem Orientacao De Foco
    [Tags]    usability    keyboard    accessibility    w3c    after    focus-order
    Dado Que Abro O Formulario W3C Corrigido
    Quando Percorro O Formulario Corrigido Por Teclado
    Entao O Foco E Os Dados Devem Confirmar O Percurso Por Teclado
