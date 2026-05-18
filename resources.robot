*** Settings ***
Documentation     Implementação das keywords dos casos de uso de teste da Secretaria On-line

Library     SeleniumLibrary

*** Variables ***
${BROWSER}            chrome
${URL}                http://200.236.3.198:28080/secretariaonline2/home
${TEXTO_PAG_LOGIN}    //h3[contains(.,'Secretaria On-line do SEPT - Login')]
${TEXTO_PAG_INICIAL}  //h2[contains(.,'Solicitações')]
${GRR_ALUNO}          GRR11111111  
${SENHA_ALUNO}        123

*** Keywords ***
Abrir o Navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o Navegador
    Capture Page Screenshot
    Close Browser

Acessar secretaria on-line como ALUNO
    Go To    ${URL}
    Waint Until Element Is Visible     ${TEXTO_PAG_LOGIN}
    Logar com "${GRR_ALUNO}" "${SENHA_ALUNO}"

Logar com "${USUARIO}" "${SENHA}"
    #Insere e-mail e senha de acesso válidos e clica no botão submeter
    #Espera título da página de solicitações aparecer
    Input Text     email    ${USUARIO}
    Input Text     senha    ${SENHA}
    Click Button     submit
    Wait Until Element Is Visible   ${TEXTO_PAG_INICIAL}

Clicar em "Abrir Nova Solicitação"
    #Clica para abrir uma nova solicitação e espera título da página aparecer
    Click Button     //a[contains(.,'Abrir Nova Solicitação')]
    Wait Until Element Is Visible   //h3[contains(.,'Nova Solicitação')]

Selecionar o tipo de solicitação "Requerimento Geral"