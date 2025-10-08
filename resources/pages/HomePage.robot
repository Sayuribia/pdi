*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MENU_MAIS_VENDIDOS}    (//a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'])[1]
${DESCRICAO_MAIS_VENDIDOS}    //*[@id="zg_banner_subtext"]

*** Keywords ***
Dado que estou na home page
    Go To    https://www.amazon.com.br
    Wait Until Page Contains Element    ${MENU_MAIS_VENDIDOS}

Quando eu acessar o menu "Mais Vendidos"
    Click Element    ${MENU_MAIS_VENDIDOS}

Verificar que a página "Mais Vendidos" foi exibida
    Wait Until Element Is Visible    ${DESCRICAO_MAIS_VENDIDOS}

Então o título da página deve ser "${TITULO}"
    Title Should Be    title=${TITULO}

E o texto "${TEXTO}" deve estar presente
    Wait Until Page Contains    ${TEXTO}