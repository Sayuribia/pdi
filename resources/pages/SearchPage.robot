*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${INPUT_PESQUISA}     //input[@id='twotabsearchtextbox']
${BOTAO_PESQUISA}     //input[@id='nav-search-submit-button']

*** Keywords ***

Pesquisar por "${PRODUTO}"
    Click Element    ${INPUT_PESQUISA}
    Input Text       ${INPUT_PESQUISA}    ${PRODUTO}
    Click Element    ${BOTAO_PESQUISA}
    Wait Until Page Contains    Resultados

Verificar que o produto "${PRODUTO}" aparece nos resultados
    Wait Until Page Contains Element    //span[contains(., "${PRODUTO}")]
    
Quando eu pesquisar por "${PRODUTO}"
    Pesquisar por "${PRODUTO}"

E o produto "${PRODUTO}" deve ser exibido
    Verificar que o produto "${PRODUTO}" aparece nos resultados