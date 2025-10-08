*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SUAS_LISTAS}          //h2[normalize-space()='Suas Listas']
${CRIAR_LISTA_LINK}     (//a[normalize-space()='Criar uma lista'])[1]
${BOTAO_CRIAR_LISTA}    //input[@aria-labelledby='lists-desktop-create-list-label']
${TEXTO_LISTA_CRIADA}   Lista de Compras
${BOTAO_LOGIN} 

*** Keywords ***

Clicar em Contas e Listas
    Click Element     ${BOTAO_LOGIN} 
Acessar "Suas Listas"
    Click Element    ${SUAS_LISTAS}

Criar uma nova lista
    Click Element    ${CRIAR_LISTA_LINK}
    Sleep    2s
    Click Element    ${BOTAO_CRIAR_LISTA}

Verificar que a lista foi criada com sucesso
    Wait Until Page Contains    ${TEXTO_LISTA_CRIADA}

# === Aliases BDD ===

E Clicar em Contas e Listas
    Clicar em Contas e Listas 
Quando eu acessar "Suas Listas"
    Acessar "Suas Listas"

E criar uma nova lista
    Criar uma nova lista

Então a lista deve ser criada com sucesso
    Verificar que a lista foi criada com sucesso

