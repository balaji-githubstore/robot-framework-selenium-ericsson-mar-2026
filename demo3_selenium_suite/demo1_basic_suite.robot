*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    url=https://www.facebook.com/
#    get the title and print
    ${actual_title}    Get Title
    Log To Console    ${actual_title}
    Input Text    name=email    hello123@gmail.com
    Input Password    name=pass    password
    Click Element    xpath=//span[text()='Log in']
    Sleep    5s
    Close Browser

TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    url=https://www.salesforce.com/form/signup/elf-v2-login/?d=70130000000Enyk
#    accept the cookies
    Click Element    id=onetrust-accept-btn-handler
#    enter firstname as john
#   enter lastname as wick
#   select 21 - 200 employees from dropdown
    Sleep    5s
    Close Browser

