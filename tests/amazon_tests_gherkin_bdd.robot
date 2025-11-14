*** Settings ***
Documentation    Testes da Amazon.com.br no estilo BDD
Resource         ../resources/Common.robot
Resource         ../resources/pages/HomePage.robot
Resource         ../resources/pages/SearchPage.robot
Resource         ../resources/pages/ProductPage.robot
Resource         ../resources/pages/CartPage.robot
Resource         ../resources/pages/LoginPage.robot
Resource         ../resources/pages/ListPage.robot

Suite Setup      Abrir o navegador
Suite Teardown   Fechar o navegador

*** Test Cases ***

Acessar o menu "Mais Vendidos"
    Dado que estou na home page
    Quando eu acessar o menu "Mais Vendidos"
    Então o título da página deve ser "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    E o texto "Novidades na Amazon" deve estar presente

Pesquisar por um produto
    Dado que estou na home page
    Quando eu pesquisar por "Xbox Series S"
    Então o título da página deve ser "Amazon.com.br : Xbox Series S"
    E o produto "Console Xbox Series S" deve ser exibido

Adicionar e remover produto do carrinho
    Dado que estou na home page
    Quando eu pesquisar por "Xbox Series S"
    E adicionar o produto "Console Xbox Series S" ao carrinho
    Então o produto "Console Xbox Series S" deve estar no carrinho
    Quando eu remover o produto do carrinho
    Então o carrinho deve estar vazio 

Login com senha incorreta
    Dado que estou na home page
    Quando eu fizer login com senha incorreta
    Então devo ver a mensagem "Sua senha está incorreta"

Login com sucesso
    Dado que estou na home page
    Quando eu fizer login com usuário válido
    Então devo ver a mensagem "Olá, user"

Criar lista de desejos
    Dado que estou na home page
    Quando eu fizer login com usuário válido
    E Clicar em Contas e Listas
    Quando eu acessar "Suas Listas"
    E inserir o nome da lista
    E criar uma nova lista
    Então a lista deve ser criada com sucesso