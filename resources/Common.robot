*** Settings ***
Library    SeleniumLibrary    timeout=10s

*** Variables ***
${URL}    https://www.amazon.com.br

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    chrome    options=add_argument(--headless);add_argument(--no-sandbox);add_argument(--disable-dev-shm-usage)
    Maximize Browser Window

Fechar o navegador
    Close Browser
