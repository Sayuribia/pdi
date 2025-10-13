*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br

*** Keywords ***
Abrir o navegador
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys, selenium.webdriver.chrome.options
    ${args}=    Create List    --headless    --no-sandbox    --disable-dev-shm-usage    --window-size=1920,1080
    FOR    ${arg}    IN    @{args}
        Call Method    ${options}    add_argument    ${arg}
    END
    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}



Fechar o navegador 
    Close Browser
