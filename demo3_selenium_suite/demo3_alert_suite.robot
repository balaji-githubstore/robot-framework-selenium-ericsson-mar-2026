*** Settings ***
Library     SeleniumLibrary

Test Setup      Open Browser    browser=chrome
Test Teardown       Close Browser

*** Test Cases ***
TC1 Javascript Alert
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
    Click Element    xpath=//img[@alt='Go']
    ${actual_alert_text}    Handle Alert    action=ACCEPT   timeout=20s
    Log To Console    ${actual_alert_text}
    Should Be Equal As Strings    ${actual_alert_text}    Customer ID${SPACE}${SPACE}cannot be left blank.
    Sleep    3s
    Close Browser

TC1 Javascript Alert2
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
    Click Element    xpath=//img[@alt='Go']
    Alert Should Be Present    text=Customer ID${SPACE}${SPACE}cannot be left blank.    action=ACCEPT   timeout=20s

    Sleep    3s
    Close Browser