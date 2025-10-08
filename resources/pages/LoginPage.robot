*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BOTAO_LOGIN}         //span[@id='nav-link-accountList-nav-line-1']
${EMAIL_INPUT}         //input[@id='ap_email_login']
${BOTAO_CONTINUAR}     //input[@type='submit']
${SENHA_INPUT}         //input[@id='ap_password']
${BOTAO_SUBMIT}        //input[@id='signInSubmit']
${MENSAGEM_BEM_VINDO}  Olá, user
${MENSAGEM_SENHA_ERRADA}    Sua senha está incorreta

*** Keywords ***

Fazer login com usuário válido
    Click Element    ${BOTAO_LOGIN}
    Wait Until Page Contains    Insira um número de celular ou e-mail
    Input Text       ${EMAIL_INPUT}    usertest_pdi@outlook.com
    Click Element    ${BOTAO_CONTINUAR}
    Input Text       ${SENHA_INPUT}    hashira's
    Click Element    ${BOTAO_SUBMIT}
    Wait Until Page Contains    ${MENSAGEM_BEM_VINDO}

Fazer login com senha incorreta
    Click Element    ${BOTAO_LOGIN}
    Wait Until Page Contains    Insira um número de celular ou e-mail
    Input Text       ${EMAIL_INPUT}    usertest_pdi@outlook.com
    Click Element    ${BOTAO_CONTINUAR}
    Input Text       ${SENHA_INPUT}    senha_errada
    Click Element    ${BOTAO_SUBMIT}
    Wait Until Page Contains    ${MENSAGEM_SENHA_ERRADA}

Verificar que estou logado
    Page Should Contain    ${MENSAGEM_BEM_VINDO}

# === Aliases BDD ===

Quando eu fizer login com usuário válido
    Fazer login com usuário válido

Quando eu fizer login com senha incorreta
    Fazer login com senha incorreta

Então devo ver a mensagem "${MENSAGEM}"
    Page Should Contain    ${MENSAGEM}

E que estou logado
    Verificar que estou logado