*** Settings ***
Documentation     Testes de API para o endpoint de Login do ServerRest
Resource          ../../resources/keywords/common_keywords.robot
Resource          ../../resources/keywords/usuarios_keywords.robot
Resource          ../../resources/keywords/login_keywords.robot

*** Test Cases ***
Cenario 01: Realizar Login com Sucesso
    [Documentation]    Este teste cria um usuário e realiza login com as credenciais
    [Tags]    login    regressao
    
    # Setup
    Criar Sessao
    ${EMAIL}=    Gerar Email Aleatorio
    
    # Criando usuário para o teste
    ${ID_USUARIO}=    Cadastrar Um Novo Usuario
    ...    nome=Usuario Login    
    ...    email=${EMAIL}    
    ...    password=teste123    
    ...    administrador=false
    
    # Fazer login
    ${TOKEN}=    Fazer Login    ${EMAIL}    teste123
    
    # Verificações
    Should Not Be Empty    ${TOKEN}
    
    # Limpeza
    Excluir Usuario    ${ID_USUARIO}