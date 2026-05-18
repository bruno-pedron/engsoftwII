*** Settings ***
Documentation       Esta suíte de testes verifica o funcionamento de requerimentos
            ...     gerais na Secretaria On-line
Resource           resources.robot
Test Setup          Abrir o Navegador
Test Teardown       Fechar o Navegador

*** Test Cases ***
Caso de Teste 1: Realizar um requerimento geral como aluno
    [Tags]    aluno    requerimento
    Acessar secretaria on-line como ALUNO
    Clicar em "Abrir Nova Solicitação"
    Selecionar o tipo de solicitação "Requerimento Geral"
    Preencher o campo da solicitação - sem arquivo
    Clicar em "Salvar"
    A solicitação criada deve aparecer na lista de solicitações do aluno