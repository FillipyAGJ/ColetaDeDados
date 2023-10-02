*** Settings ***
Library     Browser
Library     String
Library     Collections
Library     CSVLibrary
Library     XML


*** Keywords ***
Site inct está aberto
    New Page    https://www.inctnanocarbono.com/c%C3%B3pia-membros

Pega nome dos integrantes da equipe
    Wait For Elements State    //div[contains(@data-mesh-id, 'ContainerwhgqeinlineContent-gridContainer')]    stable
    ${membrosNome}=    Get Elements
    ...    //span[contains(@style, 'font-size:16px') and contains(@class, 'wixui-rich-text__text')]
    ${nomesInstituicao}=    Get Elements
    ...    //div[contains(@data-testid, 'richTextElement')]//p[contains(@style, 'text-align:center') and @class="font_9 wixui-rich-text__text"][1]

    FOR    ${membroElement}    ${instituicaoElement}    IN ZIP    ${membrosNome}    ${nomesInstituicao}
        ${membro}=    Get Text    ${membroElement}
        ${membro}=    Replace String    ${membro}    \n    ${SPACE}
        ${instituicao}=    Get Text    ${instituicaoElement}
        @{words}=    Split String    ${instituicao}    \n


        ${list}=    Create List
        ...    Nanotecnologia
        ...    INCT Nanocarbono
        ...    ${EMPTY}
        ...    ${membro}
        ...    ${words}[0]

        Append To Csv File    pesquisa2.csv    ${list}
    END 