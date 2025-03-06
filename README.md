# Projeto de Automação ServeRest

Este projeto contém testes automatizados para a aplicação ServeRest, utilizando Robot Framework.

## Estrutura do Projeto

```
├── README.md
├── frontend/
│   └── tests/
│       └── frontend_tests.robot
├── api/
│   └── tests/
│       └── api_tests.robot
└── resources/
    └── common.robot
```

## Pré-requisitos

- Python 3.7+
- Robot Framework (`pip install robotframework`)
- SeleniumLibrary (`pip install robotframework-seleniumlibrary`)
- RequestsLibrary (`pip install robotframework-requests`)
- Webdriver para o navegador escolhido (Chrome/Firefox)

## Instalação

1. Clone este repositório:
```bash
git clone https://github.com/seu-usuario/serverest-automation.git
cd serverest-automation
```

2. Instale as dependências:
```bash
pip install -r requirements.txt
```

3. Certifique-se de que o webdriver está no PATH do sistema ou especifique seu caminho nos testes.

## Execução dos Testes

### Testes de API

```bash
robot -d results api/tests/api_tests.robot
```

### Testes de Frontend

```bash
robot -d results frontend/tests/frontend_tests.robot
```

### Todos os Testes

```bash
robot -d results api/tests frontend/tests
```

### Executar por Tags

```bash
robot -d results -i positivo api/tests frontend/tests
```

## Cenários de Teste

### API
1. Cadastrar um novo usuário
2. Buscar usuário cadastrado por ID
3. Excluir usuário cadastrado

### Frontend
1. Cadastrar novo usuário e fazer login
2. Adicionar produto ao carrinho
3. Cadastrar novo produto (apenas para administradores)

## Boas Práticas Implementadas

1. **Organização do Código**
   - Separação entre testes de frontend e API
   - Recursos compartilhados em arquivos comuns

2. **Padrões de Projeto**
   - Page Object Model (implícito na estrutura)
   - Keywords reutilizáveis
   - Variáveis centralizadas

3. **Qualidade do Código**
   - Documentação detalhada
   - Nomes descritivos para keywords e variáveis
   - Tratamento adequado de timeouts

4. **Robustez**
   - Geração de dados dinâmicos para evitar conflitos
   - Verificações completas após cada ação
   - Capturas de tela em caso de falha

5. **Outros Recursos**
   - Tags para execução seletiva
   - Relatórios detalhados
   - Setup e Teardown adequados

## Autor

Seu Nome - [seu-email@example.com](mailto:seu-email@example.com)