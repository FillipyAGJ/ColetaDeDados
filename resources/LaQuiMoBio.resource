*** Settings ***
Library     Browser
Library     String
Library     Collections
Library     CSVLibrary


*** Keywords ***
Site LaQuiMoBio está aberto
    New Page    https://carezende.github.io/home/stable/people/#Technical-Support:

Pega os membros atuais da equipe
    Wait For Elements State    //div[contains(@class, 'docs-main')]    stable
    ${funcionarios}=    Get Elements    //h2[contains(@id, "Current-members")]/following-sibling::ul/li

    FOR    ${element}    IN    @{funcionarios}
        ${nome}=    Get Text    ${element}
        ${nome}=    Split String    ${nome}    (

        ${list}=    Create List
        ...    Nanotecnologia
        ...    LaQuiMoBio
        ...    ${EMPTY}
        ...    Unicamp
        ...    ${nome}
        Append To Csv File    pesquisa5.csv    ${list}
    END