*** Settings ***
Documentation     Keywords comuns para testes de API do ServerRest
Library           RequestsLibrary
Library           Collections
Library           String
Library           OperatingSystem

*** Variables ***
${API_URL}        https://serverest.dev
${EMAIL_RANDOM}   ${EMPTY}

*** Keywords ***
Gerar Email Aleatorio
    ${RANDOM_STRING}=    Generate Random String    8    [LOWER]
    ${EMAIL_RANDOM}=    Set Variable    ${RANDOM_STRING}@teste.com
    Set Test Variable    ${EMAIL_RANDOM}
    RETURN    ${EMAIL_RANDOM}

Criar Sessao
    Create Session    serverest    ${API_URL}    verify=True