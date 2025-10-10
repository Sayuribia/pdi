*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Testar abrir navegador headless
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys, selenium.webdriver.chrome.options
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size=1920x1080
    Set Attribute    ${options}    binary_location    /usr/bin/chromium
    Create WebDriver    Chrome    options=${options}
    Go To    https://www.google.com
    Capture Page Screenshot
    [Teardown]    Close Browser
