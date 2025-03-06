*** Settings ***
Library           SeleniumLibrary
Resource          ../../resources/keywords_frontend.robot

*** Variables ***
${URL}            https://front.serverest.dev/

*** Test Cases ***
Adicionar Produto Monitor 24 Ao Carrinho
    [Documentation]    Teste para adicionar o produto Monitor 24 ao carrinho.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    # Realiza o login
    Input Text    id=email       usuario_teste@example.com
    Input Text    id=password    senha123
    Click Button  xpath=//button[text()='Entrar']
    Wait Until Element Is Visible    xpath=//h1[contains(text(),"Serverest Store")]    timeout=10s
    # Navega até a página de produtos
    # Usa a keyword para adicionar o produto ao carrinho
    Adicionar Produto Ao Carrinho    Monitor 24
    [Teardown]    Close Browser
