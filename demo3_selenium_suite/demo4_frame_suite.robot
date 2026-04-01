*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1 Frame
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking
    Select Frame    xpath=//frame[@name='login_page']
    Input Text    name=fldLoginUserId    john123
    Click Element    link=CONTINUE
    Unselect Frame
    Sleep    3s
    Close Browser
