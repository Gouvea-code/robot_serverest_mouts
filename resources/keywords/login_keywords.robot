*** Settings ***
Documentation     Keywords para testes de login do ServerRest
Resource          ../keywords/common_keywords.robot

*** Keywords ***
Fazer Login
    [Arguments]    ${email}    ${password}
    ${BODY}=    Create Dictionary
    ...    email=${email}
    ...    password=${password}
    
    ${RESP}=    POST On Session    
    ...    serverest    
    ...    /login    
    ...    json=${BODY}    
    ...    expected_status=200
    
    Should Be Equal As Strings    ${RESP.json()["message"]}    Login realizado com sucesso
    RETURN    ${RESP.json()["authorization"]}