*** Settings ***
Library     Browser
Library     String
Library     Collections
Library     CSVLibrary
Library     XML

#Não finalizado

*** Keywords ***
Site UEM-GMPC está aberto
    New Page    https://uem-gmpc.wixsite.com/gmpc/

Acessa menu de Integrantes e acessa Pesquisadores
    Site UEM-GMPC está aberto
    Wait Until Network Is Idle
    Click    //p[contains(@class, 'PQXLTr') and contains(text(), 'INTEGRANTES')]
    Click    //a/span[contains(text(), "Pesquisadores")]
    Wait Until Network Is Idle
    Pega nome dos integrantes da equipe Pesquisadores

Acessa menu de Integrantes e acessa Professores
    Site UEM-GMPC está aberto
    Go To    https://uem-gmpc.wixsite.com/gmpc/professores
    Pega nome dos integrantes da equipe Professores

Pega nome dos integrantes da equipe Pesquisadores
    Wait For Elements State    //div[contains(@class, 'FVGvCX')]    stable
    ${membrosNomePesquisadores}=    Get Elements
    ...    //div[3]/div[1]/div/div/div/p/strong/em/strike/u[contains(@style, 'text-decoration:none;')]
    ${nomesInstituicaoPesquisadores}=    Get Elements
    ...    //div[3]/div[2]/div/div/div/p/strong/em/strike/u[contains(@style, 'text-decoration:none;')]

    FOR    ${membroPesquisadorElement}    ${instituicaoPesquisadorElement}    IN ZIP    ${membrosNomePesquisadores}    ${nomesInstituicaoPesquisadores}
        ${membroPesquisador}=    Get Text    ${membroPesquisadorElement}

        ${instituicaoPesquisador}=    Get Text    ${instituicaoPesquisadorElement}

        ${listPesquisadores}=    Create List
        ...    Nanotecnologia
        ...    UEM - GMPC
        ...    ${EMPTY}
        ...    ${membroPesquisador}
        ...    ${instituicaoPesquisador}

        Append To Csv File    pesquisa3.csv    ${listPesquisadores}
    END

Pega nome dos integrantes da equipe Professores
    Wait For Elements State    //div[contains(@class, 'HT5ybB')]    stable
    ${membrosNomeProfessores}=    Get Elements
    ...    //div[3]/div[1]/div/div/div/p/strong/em/strike/u[contains(@style, 'text-decoration:none;')]
    ${nomesInstituicaoProfessores}=    Get Element
    ...    //*[@id="TeamListView_i6fex53s440_dup_i6krlro2619_dup_i6qm3p5p329_dup_i6uu2ne8143_dup_i70h8y01197_dup_i7gal7zy256_dup_i9ec8hna613_je5vcn03_k6ktq1w3_Array__0"]/div/div/div/div[1]/div[1]/div/div[3]/div[3]/div[3]/div/div/div/p[9]

    FOR    ${membroElementProfessor}   IN    ${membrosNomeProfessores}
        ${membroProfessor}=    Get Text    ${membroElementProfessor}

        ${instituicaoProfessor}=    Get Text    ${nomesInstituicaoProfessores}

        ${listProfessores}=    Create List
        ...    Nanotecnologia
        ...    UEM - GMPC
        ...    ${EMPTY}
        ...    ${membroProfessor}
        ...    ${instituicaoProfessor}

        Append To Csv File    pesquisa3.csv    ${listProfessores}
    END