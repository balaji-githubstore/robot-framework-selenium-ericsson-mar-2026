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
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.salesforce.com/form/signup/elf-v2-login/?d=70130000000Enyk

    Run Keyword And Ignore Error    Click Element    id=onetrust-accept-btn-handler

    Input Text    name=UserFirstName    john
    Input Text    name=UserLastName    wick
    Select From List By Label    name=CompanyEmployees      21 - 200 employees
#    Select From List By Value    name=CompanyEmployee   100
#    Select From List By Index    name=CompanyEmployee   2
    
#    country as United kingdom
    Select From List By Label    name=CompanyCountry    Germany

#   checkbox
    Click Element    xpath=(//div[@class='checkbox-ui'])[2]
# click on start my trial
    Scroll Element Into View    name=start my free trial
    Click Element    name=start my free trial
    
    ${actual_header}    Get Text    xpath=//span[contains(text(),'Start your free')]
    Log To Console    ${actual_header}
    Should Be Equal As Strings     ${actual_header}    Start your free trial today.
#    //span[contains(text(),'valid email')]
    Sleep    3s
    Close Browser
    

