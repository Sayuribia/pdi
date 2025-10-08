*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ADICIONAR_ITEM_CARRINHO}    add-to-cart-button
${SEM_GARANTIA}               //input[@aria-labelledby='attachSiNoCoverage-announce']

*** Keywords ***

Selecionar o produto "${PRODUTO}" nos resultados
    Click Element    //span[contains(text(),"${PRODUTO}")]/ancestor::div[contains(@class, 's-result-item')]//a
    Wait Until Page Contains    Entrega GRÁTIS

Adicionar produto ao carrinho
    Click Element    id=${ADICIONAR_ITEM_CARRINHO}
    Wait Until Page Contains    Adicionar ao seu pedido
    Click Element    ${SEM_GARANTIA}
    Sleep    2s