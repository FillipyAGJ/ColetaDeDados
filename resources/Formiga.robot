*** Settings ***
Library     Browser
Library     String
Library     Collections
Library     CSVLibrary


*** Keywords ***
Site Formiga está aberto
    New Page    https://formiga.iqm.unicamp.br/

Pega os integrantes da equipe
    Wait For Elements State    //section[contains(@id, 'two')]    stable
    ${funcionarios}=    Get Elements    //div[contains(@class, 'box person')]

    FOR    ${element}    IN    @{funcionarios}
        ${nome}=    Get Text    ${element} >> h3
        ${unidade}=    Get Text    ${element} >> p
        ${unidade}=    Replace String    ${unidade}    \n    ${SPACE}
        ${unidade}=    Replace String    ${unidade}    <br>    ${SPACE}

        ${list}=    Create List
        ...    Nanotecnologia
        ...    Grupo do Formiga - Fotossíntese Artificial
        ...    ${EMPTY}
        ...    ${nome}
        ...    ${unidade}
        Append To Csv File    pesquisa4.csv    ${list}
    END
