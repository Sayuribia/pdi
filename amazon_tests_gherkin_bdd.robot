*** Settings ***
Documentation    Este suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***

Test Case 1 - Acesso ao menu "Mais Vendidos"
    [Documentation]    Este teste verifica o menu Mais Vendidos do site Amazon.com.br
    ...                e verifica a categoria Novidades na Amazon
    [Tags]                 menus     categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Mais Vendidos"
    Entâo o título da página deve ficar "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    E o texto "Novidades na Amazon" deve ser exibido na página



Test Case 2 - Pesquisa de um Produto
    [Documentation]        Este teste verifica a busca de um produto
    ...
    [Tags]                 busca_produtos    lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br: Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

Test Case 03 - Verificar se o carrinho está vazio
    [Documentation]        Este teste verifica se não tem itens no carrinho
    ...
    [Tags]                 carrinho    
    Acessar a home page do site Amazon.com.br
    Clicar no ícone do carrinho
    Verificar se aparece a descrição "Seu carrinho da Amazon está vazio"

Caso de Teste 04 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
 
Caso de Teste 05 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio