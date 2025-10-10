*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    chrome    options=--headless,--no-sandbox,--disable-dev-shm-usage,--window-size=1920,1080
    Maximize Browser Window

Fechar o navegador
    Close Browser
