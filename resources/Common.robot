*** Settings ***
Library    SeleniumLibrary    timeout=10s

*** Variables ***
${URL}    https://www.amazon.com.br

*** Keywords ***
Abrir o navegador
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size=1920,1080
    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}

Fechar o navegador
    Close Browser
