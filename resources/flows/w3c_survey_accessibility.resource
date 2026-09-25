*** Settings ***
Variables    ../../variables/runtime.py
Resource    ../common/browser.resource
Resource    ../pages/w3c_survey_page.resource


*** Keywords ***
Dado Que Abro O Formulario W3C Corrigido
    Abrir Nova Pagina De Teste    ${W3C_AFTER_URL}
    Pagina Do Formulario Deve Estar Carregada

Dado Que Abro O Formulario W3C Com Barreiras
    Abrir Nova Pagina De Teste    ${W3C_BEFORE_URL}
    Pagina Do Formulario Deve Estar Carregada

Entao A Pesquisa Deve Exibir Conteudo Principal
    Conteudo Principal Da Pesquisa Deve Estar Disponivel

Entao A Pesquisa Com Barreiras Deve Exibir Conteudo Visual Sem Heading Principal Semantico
    Conteudo Visual Da Pesquisa Com Barreiras Deve Estar Disponivel

Entao Os Elementos Necessarios Da Tarefa Devem Estar Presentes
    Elementos Necessarios Para A Tarefa Devem Estar Presentes

Entao Os Elementos Necessarios Com Barreiras Devem Estar Presentes Sem Nomes Acessiveis
    Elementos Necessarios Com Barreiras Devem Estar Presentes Sem Nomes Acessiveis

E A Versao Corrigida Deve Ter Suporte Basico A Acessibilidade Do Formulario
    Formulario Corrigido Deve Expor Estrutura Semantica

Entao A Versao Com Barreiras Deve Registrar Problemas Objetivos De Rotulagem
    Formulario Com Barreiras Deve Evidenciar Falta De Rotulos

Entao A Versao Com Barreiras Deve Evidenciar Que Nomes Acessiveis Nao Suportam Preenchimento
    Formulario Com Barreiras Deve Evidenciar Que Nomes Acessiveis Nao Suportam Preenchimento

Quando Preencho O Formulario Corrigido Por Nomes Acessiveis
    Preencher Formulario Corrigido Com Locators Acessiveis

Entao Os Dados Devem Permanecer Preenchidos No Formulario Corrigido
    Dados Do Formulario Corrigido Devem Permanecer Preenchidos

Quando Aciono O Skip Link Interno Para Chegar Ao Conteudo
    Acionar Skip Link Interno Para Conteudo

Entao O Skip Link Deve Levar Ao Conteudo Principal
    Destino Do Skip Link Deve Ser O Conteudo Principal

Entao A Versao Com Barreiras Nao Deve Expor Skip Link Interno Para Conteudo
    Formulario Com Barreiras Nao Deve Expor Skip Link Interno Para Conteudo

Quando Percorro O Formulario Corrigido Por Teclado
    Percorrer Formulario Corrigido Por Teclado

Entao O Foco E Os Dados Devem Confirmar O Percurso Por Teclado
    Resultado Do Percurso Por Teclado Deve Estar Correto

Quando Foco Um Controle Do Formulario Com Barreiras
    Focar Controle Do Formulario Com Barreiras

Entao O Controle Com Barreiras Deve Evidenciar Falta De Orientacao Semantica
    Controle Com Barreiras Deve Manter Foco Sem Orientacao Semantica
