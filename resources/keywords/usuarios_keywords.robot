*** Settings ***
Documentation     Keywords para testes de usuários do ServerRest
Resource          ../keywords/common_keywords.robot

*** Keywords ***
Cadastrar Um Novo Usuario
    [Arguments]    ${nome}    ${email}    ${password}    ${administrador}
    ${BODY}=    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=${password}
    ...    administrador=${administrador}
    
    ${RESP}=    POST On Session    
    ...    serverest    
    ...    /usuarios    
    ...    json=${BODY}    
    ...    expected_status=201
    
    Should Be Equal As Strings    ${RESP.json()["message"]}    Cadastro realizado com sucesso
    RETURN    ${RESP.json()["_id"]}

Buscar Usuario Por ID
    [Arguments]    ${id_usuario}
    ${RESP}=    GET On Session    
    ...    serverest    
    ...    /usuarios/${id_usuario}    
    ...    expected_status=200
    
    Should Not Be Empty    ${RESP.json()}
    RETURN    ${RESP.json()}

Excluir Usuario
    [Arguments]    ${id_usuario}
    ${RESP}=    DELETE On Session    
    ...    serverest    
    ...    /usuarios/${id_usuario}    
    ...    expected_status=200
    
    Should Be Equal As Strings    ${RESP.json()["message"]}    Registro excluído com sucesso