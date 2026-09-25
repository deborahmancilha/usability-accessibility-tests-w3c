*** Settings ***
Documentation       Inspecao de usabilidade da versao com barreiras do formulario W3C BAD.
Variables           ../../variables/runtime.py
Resource            ../../resources/common/browser.resource
Resource            ../../resources/flows/w3c_survey_usability.resource

Suite Setup         Abrir Browser Da Suite
Suite Teardown      Fechar Browser Da Suite
Test Teardown       Fechar Contexto De Teste


*** Test Cases ***
Avaliacao Heuristica Da Versao Before Registra Barreiras Do Formulario
    [Tags]    usability    heuristic    w3c    before    evidence
    Dado Que Abro O Formulario W3C Com Barreiras Para Usabilidade
    Quando Registro A Tela Do Formulario    usability-before-form
    Entao A Versao Com Barreiras Deve Apoiar A Avaliacao Heuristica

Percurso Cognitivo Da Versao Before Evidencia Barreiras Ao Responder A Pesquisa
    [Tags]    usability    cognitive-walkthrough    w3c    before    e2e    barrier
    Dado Que Abro O Formulario W3C Com Barreiras Para Usabilidade
    Quando Respondo A Pesquisa Sobre Parques Na Versao Com Barreiras
    Entao O Percurso Cognitivo Deve Evidenciar Barreiras De Orientacao
