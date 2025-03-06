*** Settings ***
Documentation     Testes de API para o endpoint de Usuários do ServerRest
Resource          ../../resources/keywords/common_keywords.robot
Resource          ../../resources/keywords/usuarios_keywords.robot

*** Test Cases ***
Cenario 01: Cadastrar, Consultar e Excluir Um Usuario
    [Documentation]    Este teste cadastra um novo usuário, consulta-o e depois o exclui
    [Tags]    usuarios    regressao
    
    # Setup
    Criar Sessao
    ${EMAIL}=    Gerar Email Aleatorio
    
    # Execução
    ${ID_USUARIO}=    Cadastrar Um Novo Usuario
    ...    nome=Usuario Teste    
    ...    email=${EMAIL}    
    ...    password=teste123    
    ...    administrador=true
    
    ${USUARIO}=    Buscar Usuario Por ID    ${ID_USUARIO}
    
    # Verificações
    Should Be Equal As Strings    ${USUARIO["nome"]}    Usuario Teste
    Should Be Equal As Strings    ${USUARIO["email"]}    ${EMAIL}
    Should Be Equal As Strings    ${USUARIO["administrador"]}    true
    
    # Limpeza
    Excluir Usuario    ${ID_USUARIO}