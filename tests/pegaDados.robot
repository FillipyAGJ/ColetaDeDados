*** Settings ***
Resource    ../resources/embrapaEquipe.resource
Resource    ../resources/inctNanoCarbonoMembros.resource
Resource    ../resources/Formiga.robot
Resource    ../resources/LaQuiMoBio.resource
Resource    ../resources/teranano.resource
Suite Setup    New Browser    browser=chromium    headless=${False}
Test Setup   New Context    viewport={'width': 1920, 'height': 1080}
Test Teardown    Close Context
Suite Teardown    Close Browser

*** Test Cases ***
Pega dados e preenche a planilha
    Site da embrapa está aberto
    Coloca em ordem alfabética e aumenta paginação
    Pega nome dos funcionarios

Pega dados inct nanocarbono e preenche a planilha
    Site inct está aberto
    Pega nome dos integrantes da equipe

Pega dados Formiga e preenche a planilha
    Site Formiga está aberto
    Pega os integrantes da equipe

Pega dados LaQuiMoBio e preenche a planilha
    Site LaQuiMoBio está aberto
    Pega os membros atuais da equipe

Pega dados TeraNano e preenche a planilha
    Site TeraNano está aberto
    Pega os membros da equipe