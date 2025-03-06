*** Settings ***
Documentation     Keywords para testes de produtos e carrinhos do ServerRest
Resource          ../keywords/common_keywords.robot

*** Keywords ***
Cadastrar Um Novo Produto
    [Arguments]    ${token}    ${nome}    ${preco}    ${descricao}    ${quantidade}
    # Convertendo explicitamente para números
    ${PRECO_NUM}=    Convert To Number    ${preco}
    ${QUANTIDADE_NUM}=    Convert To Number    ${quantidade}
    
    ${BODY}=    Create Dictionary
    ...    nome=${nome}
    ...    preco=${PRECO_NUM}
    ...    descricao=${descricao}
    ...    quantidade=${QUANTIDADE_NUM}
    
    ${HEADERS}=    Create Dictionary    
    ...    Authorization=${token}    
    ...    Content-Type=application/json
    
    ${RESP}=    POST On Session    
    ...    serverest    
    ...    /produtos    
    ...    json=${BODY}
    ...    headers=${HEADERS}    
    ...    expected_status=201
    
    Log    Resposta: ${RESP.text}
    Should Be Equal As Strings    ${RESP.json()["message"]}    Cadastro realizado com sucesso
    RETURN    ${RESP.json()["_id"]}

Buscar Produto Por ID
    [Arguments]    ${id_produto}
    ${RESP}=    GET On Session    
    ...    serverest    
    ...    /produtos/${id_produto}    
    ...    expected_status=200
    
    Should Not Be Empty    ${RESP.json()}
    RETURN    ${RESP.json()}

Criar Um Carrinho
    [Arguments]    ${token}    ${id_produto}    ${quantidade}
    # Convertendo explicitamente para número
    ${QUANTIDADE_NUM}=    Convert To Number    ${quantidade}
    
    ${PRODUTO}=    Create Dictionary    
    ...    idProduto=${id_produto}    
    ...    quantidade=${QUANTIDADE_NUM}
    
    ${PRODUTOS}=    Create List    ${PRODUTO}
    ${BODY}=    Create Dictionary    produtos=${PRODUTOS}
    
    ${HEADERS}=    Create Dictionary    
    ...    Authorization=${token}    
    ...    Content-Type=application/json
    
    # Adicionando log para depuração
    Log    Enviando requisição para criar carrinho: ${BODY}
    
    ${RESP}=    POST On Session    
    ...    serverest    
    ...    /carrinhos    
    ...    json=${BODY}
    ...    headers=${HEADERS}    
    ...    expected_status=201
    
    # Log da resposta para ajudar na depuração
    Log    Resposta: ${RESP.text}
    
    Should Be Equal As Strings    ${RESP.json()["message"]}    Cadastro realizado com sucesso
    RETURN    ${RESP.json()["_id"]}

    Diagnosticar Erro Produto
    [Arguments]    ${token}    ${nome}    ${preco}    ${descricao}    ${quantidade}
    # Convertendo explicitamente para números
    ${PRECO_NUM}=    Convert To Number    ${preco}
    ${QUANTIDADE_NUM}=    Convert To Number    ${quantidade}
    
    ${BODY}=    Create Dictionary
    ...    nome=${nome}
    ...    preco=${PRECO_NUM}
    ...    descricao=${descricao}
    ...    quantidade=${QUANTIDADE_NUM}
    
    ${HEADERS}=    Create Dictionary    
    ...    Authorization=${token}    
    ...    Content-Type=application/json
    
    # Log detalhado antes da requisição
    Log    Enviando requisição para cadastrar produto com:
    Log    URL: https://serverest.dev/produtos
    Log    Headers: ${HEADERS}
    Log    Body: ${BODY}
    
    # Tentando fazer a requisição sem validar o status code
    ${RESP}=    POST On Session    
    ...    serverest    
    ...    /produtos    
    ...    json=${BODY}
    ...    headers=${HEADERS}    
    ...    expected_status=any
    
    # Log detalhado da resposta
    Log    Status Code: ${RESP.status_code}
    Log    Resposta completa: ${RESP.text}
    
    # Retorna a resposta para análise
    RETURN    ${RESP}