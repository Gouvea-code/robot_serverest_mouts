*** Settings ***
Library           SeleniumLibrary
Resource          ../../resources/keywords_frontend.robot

*** Variables ***
${NOME}         Usuario Teste
${SENHA}        senha123

*** Test Cases ***
Teste de Cadastro com Email Aleatório
    [Documentation]    Teste para validar o cadastro de um novo usuário com email único.
    Realizar Cadastro    ${NOME}    ${SENHA}
    [Teardown]    Close Browser
