*** Settings ***
Library     Browser
Library     String
Library     Collections
Library     CSVLibrary
Library    Process


*** Keywords ***
Site TeraNano está aberto
    New Page    http://www.teranano.ufu.br/pt-br/participantes/pesquisadores

Pega os membros da equipe
    Wait For Elements State    //table    stable
    ${pesquisadoresNomes}=    Get Elements    //table/tbody/tr/td[1]/a
    ${pesquisadoresInstituicao}    Get Elements    //table/tbody/tr/td[2]/a

    ${proximo}=    Set Variable    ${True}

    WHILE    ${proximo}
        FOR    ${membroElement}    ${instituicaoElement}    IN ZIP    ${pesquisadoresNomes}    ${pesquisadoresInstituicao}
            ${nome}=    Get Text    ${membroElement}
            ${universidade}=    Get Text    ${instituicaoElement}

            Set Browser Timeout    5s

            ${list}=    Create List
            ...    Nanotecnologia
            ...    INCT-TeraNano
            ...    ${EMPTY}
            ...    ${universidade}
            ...    ${nome}
            Append To Csv File    pesquisa6.csv    ${list}
        END
        TRY
            Get Classes    //ul[contains(@class, "pagination")]/li[contains(@class, 'next')]    contains    disabled
            ${proximo}    Set Variable    ${False} 
        EXCEPT
            Click    //li//a[contains(@title, 'Ir para a próxima página')] 
            Wait Until Network Is Idle 
            
        END
    END