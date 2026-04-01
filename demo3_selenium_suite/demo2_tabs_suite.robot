*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1 Switch Tab Using Title
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://opensource-demo.orangehrmlive.com/
    Click Element    xpath=//a[contains(@href,'facebook.com')]
    Switch Window   OrangeHRM - World's Most Popular Opensource HRIS | Secaucus NJ | Facebook
    Click Element    xpath=//span[contains(text(),'Forgotten password')]
    Switch Window   Facebook
    Input Text    xpath=//span[contains(text(),'Enter your mobile number')]/following::input    hello@gmail.com
    Switch Window   OrangeHRM
    Log Title
    Sleep    3s
    Close Browser

TC2 Switch Tab Using NEW and MAIN
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://opensource-demo.orangehrmlive.com/
    Click Element    xpath=//a[contains(@href,'facebook.com')]
    Switch Window   NEW
    Click Element    xpath=//span[contains(text(),'Forgotten password')]
    Switch Window   NEW
    Input Text    xpath=//span[contains(text(),'Enter your mobile number')]/following::input    hello@gmail.com
    Switch Window   MAIN
    Log Title
    Sleep    3s
    Close Browser
