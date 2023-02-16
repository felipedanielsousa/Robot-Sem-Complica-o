*** Settings ***
Documentation    Robot Framework Sem Complicação
Library          SeleniumLibrary    timeout=500

*** Variables ***
${url}            https://www.demoblaze.com
${navegador}      chrome

*** Keywords ***
addToCart
    Open Browser                     ${url}    ${navegador} 
    Maximize Browser Window
    Click Link                       Laptops
    Wait Until Element Is Visible    link=MacBook Pro
    Click Link                       MacBook Pro
    Wait Until Element Is Visible    xpath=//div[2]//a
    Click Element                    xpath=//a[@onclick="addToCart(15)"]
    Alert Should Be Present
finalizarCompra
    Click Link                       Cart
    Click Button                     css=.btn-success
    Wait Until Element Is Visible    id=name
    Input Text                       id=name       Felipe Daniel
    Input Text                       id=country    Brasil
    Input Text                       id=city       Fortaleza
    Input Text                       id=card       12345678
    Input Text                       id=month      07
    Input Text                       id=year      2031
    Click Button                     xpath=//button[text()='Purchase']
    Element Text Should Be           css=.sweet-alert > h2    Thank you for your purchase!
    Click Button                     css=.confirm

limparCarrinho
    Click Link                       Cart
    Wait Until Element Is Enabled    xpath=//a[text()='Delete']
    Click Element                    xpath=//a[text()='Delete']
*** Test Cases ***
Finalizar uma compra 
    addToCart
    finalizarCompra

Limpar Carrinho
    addToCart
    limparCarrinho
    Wait Until Element Is Enabled    xpath=//a[text()='Delete']
   

   


