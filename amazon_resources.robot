*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    http://amazon.com.br
${MENU_MAIS_VENDIDOS}    (//a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'])[1]
${DESCRICAO_MAIS_VENDIDOS}    //*[@id="zg_banner_subtext"]
${INPUT_PESQUISA}    //input[@id='twotabsearchtextbox']
${BOTAO_PESQUISA}    (//input[@id='nav-search-submit-button'])[1]
${CARRINHO}         nav-cart
${ADICIONAR_ITEM_CARRINHO}              add-to-cart-button
${SEM_GARANTIA}         //input[@aria-labelledby='attachSiNoCoverage-announce']
${EXCLUIR_ITEM}                locator=//span[@class='a-icon a-icon-small-trash']
${BOTAO_CONTINUAR_COMPRANDO}    body > div > div.a-row.a-spacing-double-large > div.a-section > div > div > form > div > div > span > span
${BOTAO_LOGIN}            //span[@id='nav-link-accountList-nav-line-1']
*** Keywords ***

   
Abrir o navegador
    Open Browser   browser=chrome  options=add_experimental_option("detach", True)
    Maximize Browser Window
    ${bloqueado}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${BOTAO_CONTINUAR_COMPRANDO}    5s
    Run Keyword If    ${bloqueado}    Click Element    ${BOTAO_CONTINUAR_COMPRANDO}
    Run Keyword If    ${bloqueado}    Wait Until Element Is Visible    ${MENU_MAIS_VENDIDOS}    10s

Fechar o navegador
    Capture Page Screenshot    
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To     url=${URL}
    Wait Until Element Is Visible    locator=${MENU_MAIS_VENDIDOS}

Entrar no menu "Mais vendidos"
    Click Element    locator=${MENU_MAIS_VENDIDOS}

Verificiar se aparece a frase "${FRASE}"
    Wait Until Page Contains   text=${FRASE}
    Wait Until Element Is Visible    locator=${DESCRICAO_MAIS_VENDIDOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${FRASE}"
    Wait Until Page Contains   text=${FRASE}

Digitar o nome de produto "${PESQUISA}" no campo de Pesquisa
    Click Element    locator=${INPUT_PESQUISA}
    Input Text    locator=${INPUT_PESQUISA}    text=${PESQUISA}

Clicar no botão da pesquisa
    Click Element    locator=${BOTAO_PESQUISA}
    Wait Until Page Contains    text=Resultados

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"    
    Wait Until Element Is Visible   locator=(//span[normalize-space()='${PRODUTO}'])[1]

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    

Quando acessar o menu "Mais Vendidos"
    Entrar no menu "Mais vendidos"
    Verificiar se aparece a frase "Mais Vendidos"

Entâo o título da página deve ficar "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"

E o texto "Novidades na Amazon" deve ser exibido na página
    Verificar se aparece a categoria "Novidades na Amazon"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão da pesquisa

Então o título da página deve ficar "Amazon.com.br: Xbox Series S"
    Clicar no botão da pesquisa

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Clicar no ícone do carrinho
    Click Element    locator=${CARRINHO}

Verificar se aparece a descrição "${FRASE}"
    Wait Until Page Contains    text=${FRASE}

Adicionar o produto "Console Xbox Series S" no carrinho
    #Adicionar produto
    Click Element    locator=//div[@class='s-widget-container s-spacing-small s-widget-container-height-small celwidget slot=MAIN template=SEARCH_RESULTS widgetId=search-results_1']//a[@class='a-link-normal s-line-clamp-4 s-link-style a-text-normal']    
    Wait Until Page Contains    text=Entrega GRÁTIS
    Click Element    locator=${ADICIONAR_ITEM_CARRINHO}
    Sleep    5s
    Wait Until Page Contains    text= Adicionar ao seu pedido 
    #Escolher sem garantia
    Click Element    locator=${SEM_GARANTIA}
    #Ir para o carrinho
    Sleep    5s
    Click Element     locator=${CARRINHO}

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso    
    Wait Until Page Contains    text=Em estoque

Remover o produto "Console Xbox Series S" do carrinho
    Sleep    5s
    Click Element    locator=${EXCLUIR_ITEM}

Verificar se o carrinho fica vazio
    Sleep    5s
    Page Should Contain    text= foi removido de Carrinho de compras. 
    Wait Until Page Contains    text= Seu carrinho da Amazon está vazio

Clicar no botão "Olá, faça seu login"
    Click Element    locator=${BOTAO_LOGIN}

Inserir o email
    Wait Until Page Contains    text= Insira um número de celular ou e-mail
    Input Text    locator=//input[@id='ap_email_login']    text=usertest_pdi@outlook.com

Clicar no botão "Continuar"    
    Click Element    locator=//input[@type='submit']

Inserir a senha       
    Input Text    locator=//input[@id='ap_password']    text=hashira's 

Clicar no botão "Fazer login"
    Click Element    locator=//input[@id='signInSubmit']

Verificar se o login foi realizado com sucesso
    Wait Until Page Contains    text= Olá, user

Clicar em "Suas Listas"
    Click Element      locator=//h2[normalize-space()='Suas Listas']

Clicar em "Criar uma Lista"
    Click Element    locator=(//a[normalize-space()='Criar uma lista'])[1]

Clicar no botão "Criar"
    Sleep     5s
    Click Element    locator=//input[@aria-labelledby='lists-desktop-create-list-label']
Verificar se a lista foi criada com sucesso
    Wait Until Page Contains    text= Lista de Compras 2