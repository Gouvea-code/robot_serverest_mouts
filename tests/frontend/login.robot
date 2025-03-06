*** Settings ***
Library           SeleniumLibrary
Resource          ../../resources/keywords_frontend.robot

*** Variables ***
${EMAIL}         usuario_teste@example.com
${SENHA}         senha123

*** Test Cases ***
Teste de Login Válido
    [Documentation]    Teste para validar login com credenciais corretas.
    Realizar Login    ${EMAIL}    ${SENHA}
    [Teardown]    Close Browser
