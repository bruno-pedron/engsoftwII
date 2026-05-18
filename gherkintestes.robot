*** Settings ***
Documentation       Esta suite de testes verifica o funcionamento de requerimentos
            ...     gerais na Secretaria On-line usando Gherkin BDD
Resource            resources.robot
Test Setup          Abrir o Navegador
Test Teardown       Fechar o Navegador

*** Test Cases ***
CT1 Gherkin: Realizar requerimento geral como aluno
    [Tags]    aluno    requerimento
    Given O aluno está logado na Secretaria On-line
    When Clicar em "Abrir Nova Solicitação"
    And Selecionar o tipo de solicitação "Requerimento Geral"
    And Preencher o campo da solicitação - sem arquivo
    And Clicar em "Salvar"
    Then A solicitação criada deve aparecer na lista de solicitações do aluno
