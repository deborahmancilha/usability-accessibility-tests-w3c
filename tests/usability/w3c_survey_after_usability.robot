*** Settings ***
Documentation       Inspecao de usabilidade da versao corrigida do formulario W3C BAD.
Variables           ../../variables/runtime.py
Resource            ../../resources/common/browser.resource
Resource            ../../resources/flows/w3c_survey_usability.resource

Suite Setup         Abrir Browser Da Suite
Suite Teardown      Fechar Browser Da Suite
Test Teardown       Fechar Contexto De Teste


*** Test Cases ***
Avaliacao Heuristica Da Versao After Registra Correcoes Do Formulario
    [Tags]    usability    heuristic    w3c    after    evidence
    Dado Que Abro O Formulario W3C Corrigido Para Usabilidade
    Quando Registro A Tela Do Formulario    usability-after-form
    Entao A Versao Corrigida Deve Apoiar A Avaliacao Heuristica

Percurso Cognitivo Da Versao Corrigida Completa A Pesquisa Sobre Parques
    [Tags]    usability    cognitive-walkthrough    w3c    after    e2e
    Dado Que Abro O Formulario W3C Corrigido Para Usabilidade
    Quando Respondo A Pesquisa Sobre Parques Na Versao Corrigida
    Entao O Percurso Cognitivo Deve Concluir Com Resultado Esperado
