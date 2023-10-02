*** Settings ***
Library     Browser
Library     String
Library     Collections
Library     CSVLibrary
Library     XML

*** Keywords ***
Site da embrapa está aberto
    New Page    https://www.embrapa.br/equipe

Coloca em ordem alfabética e aumenta paginação
    Click    //a[contains(text(), "alfabética")]
    Wait Until Network Is Idle
    Click    (//a[contains(@class, "dropdown-toggle")])[2]
    Click    //a/span[contains(text(), "75")]
    Sleep    5s
    Wait Until Network Is Idle

Pega nome dos funcionarios
    Wait For Elements State    //tbody[contains(@class, "table-data")]    stable
    ${funcionarios}=    Get Elements    //tr[contains(@class, " ")]

    ${proximo}=    Set Variable    ${True}
    WHILE    ${proximo}
        FOR    ${element}    IN    @{funcionarios}
            ${nome}=    Get Text    ${element} >> div.titulo
            ${unidade}=    Get Text    ${element} >> span.unidade-empregado

            ${list}=    Create List
            ...    Agrária
            ...    Empresa Brasileira de Pesquisa Agropecuária (EMBRAPA)
            ...    ${EMPTY}
            ...    ${unidade}
            ...    ${nome}
            Append To Csv File    pesquisa.csv    ${list}

        END
        
        TRY
            Get Classes    //ul[contains(@class, "pager lfr-pagination-buttons")]/li[3]    contains    disabled
            ${proximo}    Set Variable    ${False} 
        EXCEPT
            Click    //li[contains(@class, "")]/a[contains(text(), "Próximo")]
            Wait Until Network Is Idle 
            
        END
    END
