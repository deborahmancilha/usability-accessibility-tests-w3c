*** Settings ***
Documentation       Verificacoes objetivas de acessibilidade da versao com barreiras do formulario W3C BAD.
Variables           ../../variables/runtime.py
Resource            ../../resources/common/browser.resource
Resource            ../../resources/flows/w3c_survey_accessibility.resource

Suite Setup         Abrir Browser Da Suite
Suite Teardown      Fechar Browser Da Suite
Test Teardown       Fechar Contexto De Teste


*** Test Cases ***
Abrir A Pesquisa Com Barreiras Carrega Conteudo Visual Sem Heading Principal Semantico
    [Tags]    accessibility    regression    w3c    before    opening    barrier
    Dado Que Abro O Formulario W3C Com Barreiras
    Entao A Pesquisa Com Barreiras Deve Exibir Conteudo Visual Sem Heading Principal Semantico

Localizar O Formulario Com Barreiras Exibe Elementos Sem Nomes Acessiveis
    [Tags]    accessibility    regression    w3c    before    form-discovery    barrier
    Dado Que Abro O Formulario W3C Com Barreiras
    Entao Os Elementos Necessarios Com Barreiras Devem Estar Presentes Sem Nomes Acessiveis

Preencher Campos Da Versao Com Barreiras Nao E Suportado Por Nomes Acessiveis
    [Tags]    accessibility    e2e    w3c    before    form-fill    barrier
    Dado Que Abro O Formulario W3C Com Barreiras
    Entao A Versao Com Barreiras Deve Evidenciar Que Nomes Acessiveis Nao Suportam Preenchimento

Skip Link Interno Para Conteudo Nao Esta Disponivel Na Versao Com Barreiras
    [Tags]    keyboard    accessibility    w3c    before    skip-link    barrier
    Dado Que Abro O Formulario W3C Com Barreiras
    Entao A Versao Com Barreiras Nao Deve Expor Skip Link Interno Para Conteudo

Foco No Formulario Com Barreiras Evidencia Falta De Orientacao Semantica
    [Tags]    keyboard    accessibility    w3c    before    focus-order    barrier
    Dado Que Abro O Formulario W3C Com Barreiras
    Quando Foco Um Controle Do Formulario Com Barreiras
    Entao O Controle Com Barreiras Deve Evidenciar Falta De Orientacao Semantica

Versao Com Barreiras Evidencia Falta De Rotulos E Grupos Semanticos
    [Tags]    accessibility    regression    w3c    before    barrier
    Dado Que Abro O Formulario W3C Com Barreiras
    Entao A Versao Com Barreiras Deve Registrar Problemas Objetivos De Rotulagem
