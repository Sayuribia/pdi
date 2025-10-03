*** Settings ***
Documentation    Este suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***


Test Case 1 - Acesso ao menu "Mais Vendidos"
    [Documentation]    Este teste verifica o menu Mais Vendidos do site Amazon.com.br
    ...                e verifica a categoria Novidades na Amazon
    [Tags]             menus categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Mais vendidos"
    Verificiar se aparece a frase "Mais Vendidos"
    Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    Verificar se aparece a categoria "Novidades na Amazon"


Test Case 2 - Pesquisa de um Produto
    [Documentation]        Este teste verifica a busca de um produto
    ...
    [Tags]                 busca_produtos    lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão da pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Test Case 3 - Verificar se o carrinho está vazio
    [Documentation]        Este teste verifica se não tem itens no carrinho
    ...
    [Tags]                 carrinho    
    Acessar a home page do site Amazon.com.br
    Clicar no ícone do carrinho
    Verificar se aparece a descrição "Seu carrinho da Amazon está vazio"
 
 Caso de Teste 4 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão da pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
 


Caso de Teste 6 - Login
    [Documentation]    Esse é um teste de autenticação
    [Tags]             login
    Acessar a home page do site Amazon.com.br
    Clicar no botão "Olá, faça seu login"
    Inserir o email
    Clicar no botão "Continuar"
    Inserir a senha
    Clicar no botão "Fazer login"
    Verificar se o login foi realizado com sucesso

Caso de Teste 7 - Lista de Desejos
    [Documentation]    Esse é um teste para criar uma lista de desejos
    [Tags]             lista_desejo
    Acessar a home page do site Amazon.com.br
    Clicar no botão "Olá, faça seu login"
    Clicar em "Suas Listas"
    Clicar em "Criar uma Lista"
    INserir o nome da lsita
    Clicar no botão "Criar"
    Verificar se a lista foi criada com sucesso
