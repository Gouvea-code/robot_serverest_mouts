*** Settings ***
Documentation     Testes de API para o ServerRest
Library           RequestsLibrary
Library           Collections
Library           String
Library           OperatingSystem

*** Variables ***
${API_URL}        https://serverest.dev
${EMAIL_RANDOM}   ${EMPTY}