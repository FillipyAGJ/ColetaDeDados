*** Settings ***
Library     Browser
Library     String
Library     Collections
Library     CSVLibrary


# Não finalizado

*** Keywords ***
Site Formiga está aberto
    New Page    https://www.lte.ib.unicamp.br/portal/current_team.php

Pega os integrantes da equipe
    Wait For Elements State    //div[contains(@id, 'k-body')]    stable
    ${funcionarios}=    Get Elements    //div[contains(@class, 'leadership-wrapper')]

    FOR    ${element}    IN    @{funcionarios}
        ${nome}=    Get Text    ${element} >> div >> h1
        ${instituicao}=    Get Text    ${element} >> div >>    
        ${cargo}=    Get Text    ${element} >> div >> h1 >> small

        ${list}=    Create List
        ...    Nanotecnologia
        ...    Grupo do Formiga - Fotossíntese Artificial
        ...    ${EMPTY}
        ...    ${nome}
        ...    ${instituicao}
        ...    ${cargo}
        Append To Csv File    pesquisa4.csv    ${list}
    END