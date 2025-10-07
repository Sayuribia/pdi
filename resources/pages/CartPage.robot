*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ADICIONAR_ITEM_CARRINHO}       add-to-cart-button
${SEM_GARANTIA}                  //input[@aria-labelledby='attachSiNoCoverage-announce']
${CARRINHO}                      nav-cart
${EXCLUIR_ITEM}                  //span[@class='a-icon a-icon-small-trash']

*** Keywords ***

Adicionar o produto "${PRODUTO}" ao carrinho
    # Clica no produto na lista de resultados
    Click Element    //a[contains(@href, '/Microsoft-Console-Xbox-Series-S')]
    Wait Until Page Contains    Entrega GRÁTIS
    Click Element    id=${ADICIONAR_ITEM_CARRINHO}
    Sleep    2s
    Click Element    ${SEM_GARANTIA}
    Sleep    2s
    Click Element    ${CARRINHO}

Verificar que o produto "${PRODUTO}" está no carrinho
    Wait Until Page Contains    ${PRODUTO}
    Page Should Contain         Subtotal (1 produto):

Remover o produto do carrinho
    Click Element    ${EXCLUIR_ITEM}
    Sleep    2s

Verificar que o carrinho está vazio
    Page Should Contain    foi removido de Carrinho de compras
    Wait Until Page Contains    foi removido de Carrinho de compras

# ---- Aliases BDD ----


E adicionar o produto "${PRODUTO}" ao carrinho
    Adicionar o produto "${PRODUTO}" ao carrinho

Então o produto "${PRODUTO}" deve estar no carrinho
    Verificar que o produto "${PRODUTO}" está no carrinho

Quando eu remover o produto do carrinho
    Remover o produto do carrinho

Então o carrinho deve estar vazio
    Verificar que o carrinho está vazio