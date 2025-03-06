*** Keywords ***
Adicionar Produto Ao Carrinho
    [Arguments]    ${produto}
    # Aguarda o produto estar visível na lista
    Wait Until Element Is Visible    xpath=//h5[contains(text(),"${produto}")]    timeout=5s
    # Clica no botão "Adicionar à Lista" do produto desejado
    Click Button    xpath=//*[@id="root"]/div/div/div[2]/div/section/div[1]/div/div/a[2]/button
    # Aguarda e clica no botão "Adicionar ao Carrinho"
    Wait Until Element Is Visible    xpath=//button[@data-testid="adicionar carrinho"]    timeout=5s
    Click Button    xpath=//button[@data-testid="adicionar carrinho"]
    # Aguarda a tela de "Em Construção, Aguarde" aparecer para validar fluxo
    Wait Until Element Is Visible    xpath=//h1[contains(text(),"Em construção aguarde")]    timeout=5s
    Capture Page Screenshot

Realizar Login
    [Arguments]    ${email}    ${senha}
    Open Browser    https://front.serverest.dev/    chrome
    Maximize Browser Window
    Input Text    id=email    ${email}
    Input Text    id=password    ${senha}
    Click Button    xpath=//button[text()='Entrar']
    Wait Until Element Is Visible    xpath=//h1[contains(text(),'Serverest Store')]    timeout=10s
    Capture Page Screenshot

Realizar Cadastro
    [Arguments]    ${nome}    ${senha}
    ${randomNumber}=    Evaluate    random.randint(1000, 9999)    modules=random
    ${email}=           Set Variable    usuario${randomNumber}@example.com
    Log    Criando usuário com email: ${email}
    Open Browser    https://front.serverest.dev/    chrome
    Maximize Browser Window
    Click Element    xpath=//a[text()='Cadastre-se']
    Input Text    id=nome    ${nome}
    Input Text    id=email   ${email}
    Input Text    id=password   ${senha}
    Click Button    xpath=//button[text()='Cadastrar']
    # Aguarda a mensagem de sucesso
    Wait Until Element Is Visible    css:.alert-link    timeout=3s
    ${mensagem}=    Get Text    css:.alert-link
    Log    Mensagem capturada: ${mensagem}
    Capture Page Screenshot

