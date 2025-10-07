*** Settings ***
Library    SeleniumLibrary    timeout=10s

*** Variables ***
${URL}    https://www.amazon.com.br

*** Keywords ***

Abrir o navegador
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Fechar o navegador
    Close Browser

# Estou na home page
#     Go To    ${URL}
#     Wait Until Page Contains Element    //input[@id='twotabsearchtextbox']