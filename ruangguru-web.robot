*** Settings ***
Library           Selenium2Library

*** Variables ***
#Your Browser
${Browser}        chrome
#Testing URL
${SiteUrl}        https://skillacademy.com/
#Description
${desc}           Keyword
#Time Delay
${Delay}          5s

*** Keywords ***
Open page
    open browser     ${SiteUrl}    ${browser}
    Maximize Browser Window

Search Function
    Input Text       xpath=//input[@placeholder='Kamu ingin menguasai skill apa hari ini?']    ${desc}
    Click Element    xpath=//img[@alt='Search Black']
    Sleep            ${Delay}
    [Teardown]       Close Browser

*** Test Cases ***
Flow Application 
    Open Page
    Search Function

