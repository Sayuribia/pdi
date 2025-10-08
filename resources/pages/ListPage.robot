*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${SUAS_LISTAS}          //h2[normalize-space()='Suas Listas']
${CRIAR_LISTA_LINK}     //a[@id='createList']
${BOTAO_CRIAR_LISTA}    //input[@aria-labelledby='lists-desktop-create-list-label']
${TEXTO_LISTA_CRIADA}   Lista de Compras
${BOTAO_LOGIN} 
${CAMPO_INSERIR_NOME}        //input[@id='list-name']

*** Keywords ***

Clicar em Contas e Listas
    Click Element     ${BOTAO_LOGIN} 
Acessar "Suas Listas"
    Click Element    ${SUAS_LISTAS}

Inserir o nome da lista
    Click Element    ${CRIAR_LISTA_LINK}
    Sleep     5s
    Click Element    ${CAMPO_INSERIR_NOME}
    Clear Element Text    ${CAMPO_INSERIR_NOME}
    ${nome_lista}    Generate Random String    6    [LETTERS]
    Set Global Variable    ${nome}    ${nome_lista}
    Input Text    ${CAMPO_INSERIR_NOME}    ${nome}

Criar uma nova lista
    Click Element    ${BOTAO_CRIAR_LISTA}

Verificar que a lista foi criada com sucesso
    Wait Until Page Contains    ${nome}

# === Aliases BDD ===

E Clicar em Contas e Listas
    Clicar em Contas e Listas 
Quando eu acessar "Suas Listas"
    Acessar "Suas Listas"

E inserir o nome da lista
    Inserir o nome da lista

E criar uma nova lista
    Criar uma nova lista

Então a lista deve ser criada com sucesso
    Verificar que a lista foi criada com sucesso

