*** Settings ***
Variables    ../../variables/runtime.py
Resource    ../common/browser.resource
Resource    ../pages/w3c_survey_page.resource


*** Keywords ***
Dado Que Abro O Formulario W3C Corrigido Para Usabilidade
    Abrir Nova Pagina De Teste    ${W3C_AFTER_URL}
    Pagina Do Formulario Deve Estar Carregada

Dado Que Abro O Formulario W3C Com Barreiras Para Usabilidade
    Abrir Nova Pagina De Teste    ${W3C_BEFORE_URL}
    Pagina Do Formulario Deve Estar Carregada

Quando Registro A Tela Do Formulario
    [Arguments]    ${nome_arquivo}
    Capturar Tela Do Formulario    ${nome_arquivo}

Entao A Versao Com Barreiras Deve Apoiar A Avaliacao Heuristica
    Formulario Com Barreiras Deve Evidenciar Problemas De Usabilidade

Entao A Versao Corrigida Deve Apoiar A Avaliacao Heuristica
    Formulario Corrigido Deve Evidenciar Melhorias De Usabilidade

Quando Respondo A Pesquisa Sobre Parques Na Versao Com Barreiras
    Responder Pesquisa Com Barreiras Por Seletores Tecnicos
    Capturar Tela Do Formulario    usability-before-filled
    Percurso Cognitivo Com Barreiras Deve Manter Problemas De Orientacao
    Enviar Pesquisa Com Barreiras
    Capturar Tela Da Pagina    usability-before-submit-result

Entao O Percurso Cognitivo Deve Evidenciar Barreiras De Orientacao
    Envio Com Barreiras Deve Levar A Resultado Sem Confirmacao Clara

Quando Escolho Um Parque Na Versao Corrigida
    Escolher Parque Corrigido Para Percurso Cognitivo

Entao A Escolha Do Parque Deve Ficar Clara
    Escolha De Parque Deve Ficar Perceptivel

Quando Escolho Uma Cidade Na Versao Corrigida
    Escolher Cidade Corrigida Para Percurso Cognitivo

Entao A Escolha Da Cidade Deve Ficar Clara
    Escolha De Cidade Deve Ficar Perceptivel

Quando Preencho A Newsletter Opcional Na Versao Corrigida
    Preencher Newsletter Corrigida Para Percurso Cognitivo

Entao Os Dados Da Newsletter Devem Ficar Claros
    Dados Da Newsletter Devem Ficar Perceptiveis

Quando Finalizo A Pesquisa Na Versao Corrigida
    Enviar Pesquisa Corrigida
    Capturar Tela Da Pagina    usability-after-submit-result

Entao O Termino Da Tarefa Deve Levar Ao Resultado Esperado
    Envio Deve Manter A Pessoa No Resultado Esperado

Quando Respondo A Pesquisa Sobre Parques Na Versao Corrigida
    Escolher Parque Corrigido Para Percurso Cognitivo
    Escolha De Parque Deve Ficar Perceptivel
    Capturar Tela Do Formulario    usability-after-park-selected
    Escolher Cidade Corrigida Para Percurso Cognitivo
    Escolha De Cidade Deve Ficar Perceptivel
    Preencher Newsletter Corrigida Para Percurso Cognitivo
    Dados Da Newsletter Devem Ficar Perceptiveis
    Capturar Tela Do Formulario    usability-after-newsletter-filled
    Enviar Pesquisa Corrigida
    Capturar Tela Da Pagina    usability-after-submit-result

Entao O Percurso Cognitivo Deve Concluir Com Resultado Esperado
    Entao O Termino Da Tarefa Deve Levar Ao Resultado Esperado
