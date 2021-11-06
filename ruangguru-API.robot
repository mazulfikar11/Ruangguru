*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    OperatingSystem
Library    DataDriver   test_case.csv
Test Template    APITest

*** Variables ***
${API_Base_Endpoint}    https://skillacademy.com

*** Keywords ***
APITest
    [Arguments]       ${i}    ${page}     ${pageSize}    ${searchQuery}    ${minPrice}    ${maxPrice}    ${minDuration}    ${maxDuration}    ${sortBy}    ${orderBy}

    ${params}         Create Dictionary        page=${page}   pageSize=${pageSize}    searchQuery=${searchQuery}    minPrice=${minPrice}    maxPrice=${maxPrice}    minDuration=${minDuration}    maxDuration=${maxDuration}    sortBy=${sortBy}    orderBy=${orderBy}

    Create Session          API_Testing           ${API_Base_Endpoint}
    ${Get_Response}         GET On Session        API_Testing    /api/skillacademy/discovery/search    ${params}

    ${json}                 To JSON               ${Get_Response.content}  pretty_print=True
    ${content}              convert to string     ${Get_Response.content}
    
    Log              ${json}  console=yes
    [Return]         ${json}


*** Test Cases ***
APITest With     ${i}    ${page}     ${pageSize}    ${searchQuery}    ${minPrice}    ${maxPrice}    ${minDuration}    ${maxDuration}    ${sortBy}    ${orderBy}