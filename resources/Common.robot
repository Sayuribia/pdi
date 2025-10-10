*** Settings ***
Library    SeleniumLibrary    timeout=10s

*** Variables ***
${URL}    https://www.amazon.com.br
@{chrome_args}    --headless    --no-sandbox    --disable-dev-shm-usage    --window-size=1920,1080

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    chrome    options=${chrome_args}
    Maximize Browser Window

Fechar o navegador
    Close Browser
