*** Settings ***
Library     Browser    timeout=${BROWSER_TIMEOUT}    enable_playwright_debug=${False}


*** Variables ***
${SURVEY_FORM}                     css=form[action="survey.php"]
${SURVEY_PAGE_BODY}                css=body
${SURVEY_LABELS}                   css=form[action="survey.php"] label
${SURVEY_FIELDSETS}                css=form[action="survey.php"] fieldset
${SURVEY_LEGENDS}                  css=form[action="survey.php"] legend
${SURVEY_SKIP_TO_CONTENT_LINK}     role=link[name="Skip to content (within demo page)"]
${SURVEY_SKIP_TO_NAV_LINK}         role=link[name="Skip to navigation (within demo page)"]
${PARK_NONE_RADIO}                 role=radio[name="None"]
${PARK_CENTRAL_RADIO}              role=radio[name="Central Park"]
${BEFORE_PARK_CENTRAL_RADIO}       css=form[action="survey.php"] input[name="res"][value="2"]
${TITLE_MR_RADIO}                  role=radio[name="Mr."]
${BEFORE_TITLE_MR_RADIO}           css=form[action="survey.php"] input[name="t"][value="mr"]
${CITY_SELECT}                     css=form[action="survey.php"] select[name="cc"]
${CITY_OPTGROUPS}                  css=form[action="survey.php"] select[name="cc"] optgroup
${NAME_FIELD}                      role=textbox[name="Name:"]
${EMAIL_FIELD}                     role=textbox[name="eMail Address:"]
${EMAIL_CONFIRMATION_FIELD}        role=textbox[name="Retype eMail:"]
${BEFORE_NAME_FIELD}               css=form[action="survey.php"] input[name="n"]
${BEFORE_EMAIL_FIELD}              css=form[action="survey.php"] input[name="em"]
${BEFORE_EMAIL_CONFIRMATION_FIELD}    css=form[action="survey.php"] input[name="ev"]
${SUBMIT_BUTTON}                   css=form[action="survey.php"] input[type="submit"]
${SURVEY_REQUIRED_NOTE}            text="Fields are required if not otherwise noted."
${SURVEY_NEWSLETTER_LEGEND}        text="Free Newsletter (optional)"
${SURVEY_RESULTS_HEADING}          css=#surveyresults
${SURVEY_COMPLETED_HEADING}        role=heading[name="Citylights Survey - Submission Completed"]
${SURVEY_RESULTS_TEXT}             Last Weeks's Survey Results
${SURVEY_SUCCESS_MESSAGE}          Thank you for submitting your vote, it has been successfully recorded.
${SURVEY_DEMO_SUBMISSION_NOTE}     Note: this submission is part of the Demo;
${BEFORE_SURVEY_VISUAL_TITLE}      css=#main .headline >> nth=0
${BEFORE_META_SKIP_LINK}           role=link[name="Skip to inaccessible demo page"]
${BEFORE_PARK_RADIOS}              css=form[action="survey.php"] input[name="res"]
${BEFORE_TITLE_RADIOS}             css=form[action="survey.php"] input[name="t"]
${CONTENT_FRAGMENT}                \#content
${KEYBOARD_NAME}                   Ana Teclado
${KEYBOARD_EMAIL}                  teclado@example.com
${USABILITY_NAME}                  Ana Usabilidade
${USABILITY_EMAIL}                 usabilidade@example.com
${BEFORE_CITY_OPTION}              Brazil, Brasilia


*** Keywords ***
Conteudo Principal Da Pesquisa Deve Estar Disponivel
    Get Text    role=heading[name="Citylights Survey"]    ==    Citylights Survey
    Get Element Count    ${SURVEY_FORM}    ==    1

Pagina Do Formulario Deve Estar Carregada
    Get Element Count    ${SURVEY_FORM}    ==    1

Conteudo Visual Da Pesquisa Com Barreiras Deve Estar Disponivel
    Get Text    ${BEFORE_SURVEY_VISUAL_TITLE}    ==    Citylights Survey
    Get Element Count    ${SURVEY_FORM}    ==    1
    Get Element Count    role=heading[name="Citylights Survey"]    ==    0

Elementos Necessarios Para A Tarefa Devem Estar Presentes
    Get Element Count    ${PARK_CENTRAL_RADIO}    ==    1
    Get Element Count    ${CITY_SELECT}    ==    1
    Get Element Count    ${NAME_FIELD}    ==    1
    Get Element Count    ${EMAIL_FIELD}    ==    1
    Get Element Count    ${EMAIL_CONFIRMATION_FIELD}    ==    1
    Get Element Count    ${SUBMIT_BUTTON}    ==    1

Formulario Corrigido Deve Expor Estrutura Semantica
    Conteudo Principal Da Pesquisa Deve Estar Disponivel
    Get Element Count    ${SURVEY_SKIP_TO_CONTENT_LINK}    ==    1
    Get Element Count    ${SURVEY_SKIP_TO_NAV_LINK}    ==    1
    ${labels}=    Get Element Count    ${SURVEY_LABELS}
    Should Be True    ${labels} >= 10
    Get Element Count    ${SURVEY_FIELDSETS}    ==    3
    Get Text    css=#park legend    ==    Favorite Park
    Get Text    css=#city legend    ==    Greenest City

Formulario Com Barreiras Deve Evidenciar Falta De Rotulos
    Pagina Do Formulario Deve Estar Carregada
    Get Element Count    ${SURVEY_LABELS}    ==    0
    Get Element Count    ${SURVEY_FIELDSETS}    ==    0
    Get Element Count    ${SURVEY_LEGENDS}    ==    0
    Get Element Count    ${PARK_CENTRAL_RADIO}    ==    0

Elementos Necessarios Com Barreiras Devem Estar Presentes Sem Nomes Acessiveis
    Elementos Tecnicos Com Barreiras Devem Estar Presentes
    Nomes Acessiveis Do Formulario Com Barreiras Devem Estar Ausentes

Elementos Tecnicos Com Barreiras Devem Estar Presentes
    Get Element Count    ${BEFORE_PARK_RADIOS}    ==    6
    Get Element Count    ${CITY_SELECT}    ==    1
    Get Element Count    ${BEFORE_TITLE_RADIOS}    ==    2
    Get Element Count    ${BEFORE_NAME_FIELD}    ==    1
    Get Element Count    ${BEFORE_EMAIL_FIELD}    ==    1
    Get Element Count    ${BEFORE_EMAIL_CONFIRMATION_FIELD}    ==    1
    Get Element Count    ${SUBMIT_BUTTON}    ==    1

Nomes Acessiveis Do Formulario Com Barreiras Devem Estar Ausentes
    Get Element Count    ${PARK_CENTRAL_RADIO}    ==    0
    Get Element Count    ${NAME_FIELD}    ==    0
    Get Element Count    ${EMAIL_FIELD}    ==    0
    Get Element Count    ${EMAIL_CONFIRMATION_FIELD}    ==    0

Formulario Com Barreiras Deve Evidenciar Que Nomes Acessiveis Nao Suportam Preenchimento
    Get Element Count    ${BEFORE_PARK_CENTRAL_RADIO}    ==    1
    Get Element Count    ${PARK_CENTRAL_RADIO}    ==    0
    Get Element Count    ${BEFORE_NAME_FIELD}    ==    1
    Get Element Count    ${NAME_FIELD}    ==    0
    Get Element Count    ${BEFORE_EMAIL_FIELD}    ==    1
    Get Element Count    ${EMAIL_FIELD}    ==    0
    Get Element Count    ${BEFORE_EMAIL_CONFIRMATION_FIELD}    ==    1
    Get Element Count    ${EMAIL_CONFIRMATION_FIELD}    ==    0

Formulario Com Barreiras Nao Deve Expor Skip Link Interno Para Conteudo
    Get Element Count    ${BEFORE_META_SKIP_LINK}    ==    1
    Get Element Count    ${SURVEY_SKIP_TO_CONTENT_LINK}    ==    0

Focar Controle Do Formulario Com Barreiras
    Focus    ${BEFORE_PARK_CENTRAL_RADIO}

Controle Com Barreiras Deve Manter Foco Sem Orientacao Semantica
    Elemento Deve Estar Com Foco    ${BEFORE_PARK_CENTRAL_RADIO}
    Get Element Count    ${PARK_CENTRAL_RADIO}    ==    0
    Get Element Count    ${SURVEY_FIELDSETS}    ==    0
    Get Element Count    ${SURVEY_LEGENDS}    ==    0

Formulario Com Barreiras Deve Evidenciar Problemas De Usabilidade
    Pagina Do Formulario Deve Estar Carregada
    Get Element Count    ${SURVEY_LABELS}    ==    0
    Get Element Count    ${SURVEY_FIELDSETS}    ==    0
    Get Element Count    ${PARK_CENTRAL_RADIO}    ==    0
    Get Element Count    ${BEFORE_PARK_CENTRAL_RADIO}    ==    1
    Get Element Count    ${BEFORE_NAME_FIELD}    ==    1
    Get Element Count    ${BEFORE_EMAIL_FIELD}    ==    1
    Get Element Count    ${BEFORE_EMAIL_CONFIRMATION_FIELD}    ==    1

Formulario Corrigido Deve Evidenciar Melhorias De Usabilidade
    Formulario Corrigido Deve Expor Estrutura Semantica
    Get Element Count    ${PARK_CENTRAL_RADIO}    ==    1
    Get Element Count    ${SURVEY_REQUIRED_NOTE}    ==    1
    Get Element Count    ${SURVEY_NEWSLETTER_LEGEND}    ==    1
    ${optgroups}=    Get Element Count    ${CITY_OPTGROUPS}
    Should Be True    ${optgroups} >= 20

Preencher Formulario Corrigido Com Locators Acessiveis
    Click    ${PARK_CENTRAL_RADIO}
    Select Options By    ${CITY_SELECT}    text    Brasilia, Brazil
    Click    ${TITLE_MR_RADIO}
    Fill Text    ${NAME_FIELD}    Ana Testadora
    Fill Text    ${EMAIL_FIELD}    ana.testadora@example.com
    Fill Text    ${EMAIL_CONFIRMATION_FIELD}    ana.testadora@example.com

Dados Do Formulario Corrigido Devem Permanecer Preenchidos
    Get Checkbox State    ${PARK_CENTRAL_RADIO}    ==    checked
    ${selected_city}=    Get Selected Options    ${CITY_SELECT}    text
    Should Contain    ${selected_city}    Brasilia, Brazil
    Get Checkbox State    ${TITLE_MR_RADIO}    ==    checked
    Get Property    ${NAME_FIELD}    value    ==    Ana Testadora
    Get Property    ${EMAIL_FIELD}    value    ==    ana.testadora@example.com
    Get Property    ${EMAIL_CONFIRMATION_FIELD}    value    ==    ana.testadora@example.com

Responder Pesquisa Com Barreiras Por Seletores Tecnicos
    Click    ${BEFORE_PARK_CENTRAL_RADIO}
    Select Options By    ${CITY_SELECT}    text    ${BEFORE_CITY_OPTION}
    Click    ${BEFORE_TITLE_MR_RADIO}
    Fill Text    ${BEFORE_NAME_FIELD}    ${USABILITY_NAME}
    Fill Text    ${BEFORE_EMAIL_FIELD}    ${USABILITY_EMAIL}
    Fill Text    ${BEFORE_EMAIL_CONFIRMATION_FIELD}    ${USABILITY_EMAIL}

Dados Do Formulario Com Barreiras Devem Ficar Preenchidos Por Seletores Tecnicos
    Get Checkbox State    ${BEFORE_PARK_CENTRAL_RADIO}    ==    checked
    ${selected_city}=    Get Selected Options    ${CITY_SELECT}    text
    Should Contain    ${selected_city}    ${BEFORE_CITY_OPTION}
    Get Checkbox State    ${BEFORE_TITLE_MR_RADIO}    ==    checked
    Get Property    ${BEFORE_NAME_FIELD}    value    ==    ${USABILITY_NAME}
    Get Property    ${BEFORE_EMAIL_FIELD}    value    ==    ${USABILITY_EMAIL}
    Get Property    ${BEFORE_EMAIL_CONFIRMATION_FIELD}    value    ==    ${USABILITY_EMAIL}

Percurso Cognitivo Com Barreiras Deve Manter Problemas De Orientacao
    Dados Do Formulario Com Barreiras Devem Ficar Preenchidos Por Seletores Tecnicos
    Get Element Count    ${SURVEY_LABELS}    ==    0
    Get Element Count    ${SURVEY_FIELDSETS}    ==    0
    Get Element Count    ${PARK_CENTRAL_RADIO}    ==    0

Escolher Parque Corrigido Para Percurso Cognitivo
    Click    ${PARK_CENTRAL_RADIO}

Escolha De Parque Deve Ficar Perceptivel
    Get Checkbox State    ${PARK_CENTRAL_RADIO}    ==    checked

Escolher Cidade Corrigida Para Percurso Cognitivo
    Select Options By    ${CITY_SELECT}    text    Brasilia, Brazil

Escolha De Cidade Deve Ficar Perceptivel
    ${selected_city}=    Get Selected Options    ${CITY_SELECT}    text
    Should Contain    ${selected_city}    Brasilia, Brazil

Preencher Newsletter Corrigida Para Percurso Cognitivo
    Click    ${TITLE_MR_RADIO}
    Fill Text    ${NAME_FIELD}    ${USABILITY_NAME}
    Fill Text    ${EMAIL_FIELD}    ${USABILITY_EMAIL}
    Fill Text    ${EMAIL_CONFIRMATION_FIELD}    ${USABILITY_EMAIL}

Dados Da Newsletter Devem Ficar Perceptiveis
    Get Checkbox State    ${TITLE_MR_RADIO}    ==    checked
    Get Property    ${NAME_FIELD}    value    ==    ${USABILITY_NAME}
    Get Property    ${EMAIL_FIELD}    value    ==    ${USABILITY_EMAIL}
    Get Property    ${EMAIL_CONFIRMATION_FIELD}    value    ==    ${USABILITY_EMAIL}

Enviar Pesquisa Corrigida
    Click    ${SUBMIT_BUTTON}
    Wait For Load State    domcontentloaded

Enviar Pesquisa Com Barreiras
    Click    ${SUBMIT_BUTTON}
    Wait For Load State    domcontentloaded

Envio Deve Manter A Pessoa No Resultado Esperado
    ${url}=    Get Url
    Should Contain    ${url}    survey.php
    ${body_text}=    Get Text    ${SURVEY_PAGE_BODY}
    Get Element Count    ${SURVEY_COMPLETED_HEADING}    ==    1
    Should Contain    ${body_text}    ${SURVEY_SUCCESS_MESSAGE}
    Should Contain    ${body_text}    ${SURVEY_DEMO_SUBMISSION_NOTE}

Envio Com Barreiras Deve Levar A Resultado Sem Confirmacao Clara
    ${url}=    Get Url
    Should Contain    ${url}    survey.php
    ${body_text}=    Get Text    ${SURVEY_PAGE_BODY}
    Should Contain    ${body_text}    ${SURVEY_RESULTS_TEXT}
    Should Not Contain    ${body_text}    ${SURVEY_SUCCESS_MESSAGE}

Capturar Tela Do Formulario
    [Arguments]    ${nome_arquivo}
    Evaluate JavaScript    ${SURVEY_FORM}    (element) => element.scrollIntoView({block: 'start'})
    Take Screenshot
    ...    filename=${RESULTS_DIR}${/}screenshots${/}${nome_arquivo}.png
    ...    fullPage=${True}

Capturar Tela Da Pagina
    [Arguments]    ${nome_arquivo}
    Take Screenshot
    ...    filename=${RESULTS_DIR}${/}screenshots${/}${nome_arquivo}.png
    ...    fullPage=${True}

Acionar Skip Link Interno Para Conteudo
    Focus    ${SURVEY_SKIP_TO_CONTENT_LINK}
    Keyboard Key    press    Enter

Destino Do Skip Link Deve Ser O Conteudo Principal
    ${url}=    Get Url
    Should End With    ${url}    ${CONTENT_FRAGMENT}

Percorrer Formulario Corrigido Por Teclado
    Selecionar Parque Pelo Teclado
    Avancar Para Cidade E Titulo Pelo Teclado
    Preencher Campos Textuais Pelo Teclado

Selecionar Parque Pelo Teclado
    Focus    ${PARK_NONE_RADIO}
    Elemento Deve Estar Com Foco    ${PARK_NONE_RADIO}
    Keyboard Key    press    ArrowDown
    Get Checkbox State    ${PARK_CENTRAL_RADIO}    ==    checked

Avancar Para Cidade E Titulo Pelo Teclado
    Keyboard Key    press    Tab
    Elemento Deve Estar Com Foco    ${CITY_SELECT}
    Keyboard Key    press    Tab
    Elemento Deve Estar Com Foco    ${TITLE_MR_RADIO}
    Keyboard Key    press    Space
    Get Checkbox State    ${TITLE_MR_RADIO}    ==    checked

Preencher Campos Textuais Pelo Teclado
    Keyboard Key    press    Tab
    Elemento Deve Estar Com Foco    ${NAME_FIELD}
    Keyboard Input    type    ${KEYBOARD_NAME}
    Get Property    ${NAME_FIELD}    value    ==    ${KEYBOARD_NAME}
    Keyboard Key    press    Tab
    Elemento Deve Estar Com Foco    ${EMAIL_FIELD}
    Keyboard Input    type    ${KEYBOARD_EMAIL}

Resultado Do Percurso Por Teclado Deve Estar Correto
    Elemento Deve Estar Com Foco    ${EMAIL_FIELD}
    Get Checkbox State    ${PARK_CENTRAL_RADIO}    ==    checked
    Get Checkbox State    ${TITLE_MR_RADIO}    ==    checked
    Get Property    ${NAME_FIELD}    value    ==    ${KEYBOARD_NAME}
    Get Property    ${EMAIL_FIELD}    value    ==    ${KEYBOARD_EMAIL}

Elemento Deve Estar Com Foco
    [Arguments]    ${selector}
    ${has_focus}=    Evaluate JavaScript    ${selector}    (element) => document.activeElement === element
    Should Be True    ${has_focus}
