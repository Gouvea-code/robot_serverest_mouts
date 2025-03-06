*** Settings ***
Documentation     Testes de API para os endpoints de Produtos e Carrinhos do ServerRest
Resource          ../../resources/keywords/common_keywords.robot
Resource          ../../resources/keywords/usuarios_keywords.robot
Resource          ../../resources/keywords/login_keywords.robot
Resource          ../../resources/keywords/produtos_keywords.robot

*** Test Cases ***
Cenario 01: Cadastrar e Consultar Um Produto
    [Documentation]    Este teste faz login como admin, cadastra um produto e verifica se foi criado
    [Tags]    produtos    regressao
    
    # Setup
    Criar Sessao
    ${EMAIL}=    Gerar Email Aleatorio
    
    # Criando usuário admin para o teste
    ${ID_USUARIO}=    Cadastrar Um Novo Usuario
    ...    nome=Admin Teste    
    ...    email=${EMAIL}    
    ...    password=teste123    
    ...    administrador=true
    
    # Login
    ${TOKEN}=    Fazer Login    ${EMAIL}    teste123
    
    # Cadastro do produto - corrigindo o formato dos valores
    ${NOME_PRODUTO}=    Set Variable    Produto Robot Framework
    ${ID_PRODUTO}=    Cadastrar Um Novo Produto
    ...    token=${TOKEN}
    ...    nome=${NOME_PRODUTO}
    ...    preco=99
    ...    descricao=Produto criado pelo teste automatizado
    ...    quantidade=10
    
    # Consulta do produto
    ${PRODUTO}=    Buscar Produto Por ID    ${ID_PRODUTO}
    
    # Verificações
    Should Be Equal As Strings    ${PRODUTO["nome"]}    ${NOME_PRODUTO}
    Should Be Equal    ${PRODUTO["preco"]}    ${99}
    Should Be Equal As Strings    ${PRODUTO["descricao"]}    Produto criado pelo teste automatizado
    Should Be Equal    ${PRODUTO["quantidade"]}    ${10}
    
    # Limpeza
    Excluir Usuario    ${ID_USUARIO}

Cenario 02: Criar Um Carrinho de Compras
    [Documentation]    Este teste cria um usuário, cadastra um produto e cria um carrinho
    [Tags]    carrinhos    regressao
    
    # Setup
    Criar Sessao
    ${EMAIL}=    Gerar Email Aleatorio
    
    # Criando usuário admin para o teste
    ${ID_USUARIO}=    Cadastrar Um Novo Usuario
    ...    nome=Admin Carrinho    
    ...    email=${EMAIL}    
    ...    password=teste123    
    ...    administrador=true
    
    # Login
    ${TOKEN}=    Fazer Login    ${EMAIL}    teste123
    
    # Cadastro do produto - corrigindo o formato dos valores
    ${NOME_PRODUTO}=    Set Variable    Produto para Carrinho
    ${ID_PRODUTO}=    Cadastrar Um Novo Produto
    ...    token=${TOKEN}
    ...    nome=${NOME_PRODUTO}
    ...    preco=150
    ...    descricao=Produto para teste de carrinho
    ...    quantidade=5
    
    # Criação do carrinho
    ${ID_CARRINHO}=    Criar Um Carrinho
    ...    token=${TOKEN}
    ...    id_produto=${ID_PRODUTO}
    ...    quantidade=2
    
    # Verificações
    Should Not Be Empty    ${ID_CARRINHO}
    
    # Limpeza
    Excluir Usuario    ${ID_USUARIO}

    