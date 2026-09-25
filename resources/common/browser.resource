*** Settings ***
Library     OperatingSystem
Library     String
Library     Browser    timeout=${BROWSER_TIMEOUT}    enable_playwright_debug=${False}


*** Keywords ***
Abrir Browser Da Suite
    [Documentation]    Abre um processo de browser por suite; cada teste recebe contexto isolado.
    Create Directory    ${RESULTS_DIR}
    Create Directory    ${RESULTS_DIR}${/}screenshots
    New Browser    browser=${BROWSER}    headless=${HEADLESS}

Abrir Nova Pagina De Teste
    [Documentation]    Cria contexto e pagina isolados para cada teste.
    [Arguments]    ${url}=${BASE_URL}
    New Context
    ...    locale=${LOCALE}
    ...    viewport={'width': ${VIEWPORT_WIDTH}, 'height': ${VIEWPORT_HEIGHT}}
    New Page    ${url}
    Wait For Load State    domcontentloaded

Fechar Contexto De Teste
    [Documentation]    Coleta evidencia em falha e encerra somente o contexto do teste.
    Run Keyword If Test Failed    Capturar Evidencia De Falha
    Close Context

Fechar Browser Da Suite
    Close Browser

Capturar Evidencia De Falha
    ${safe_test_name}=    Replace String    ${TEST NAME}    ${SPACE}    _
    Take Screenshot
    ...    filename=${RESULTS_DIR}${/}screenshots${/}${safe_test_name}.png
    ...    fullPage=${True}
