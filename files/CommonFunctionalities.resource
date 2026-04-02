*** Settings ***
Documentation      Manages the all the common functionalities such as
...     browser, report, customized keywords to support Web UI automation

Library     SeleniumLibrary


*** Variables ***
${BROWSER_NAME}     chrome
${URL}      https://opensource-demo.orangehrmlive.com/

*** Keywords ***
Launch Browser And Navigate To Url
    [Documentation]     Use this keyword to launch browser and navigate to url \n
    ...     Example \n
    ...     | Launch Browser And Navigate To Url |
    Open Browser    browser=${BROWSER_NAME}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Set Selenium Timeout    30s
    Go To    ${URL}


Click Interactable Element
    [Documentation]     Use this keyword to click on interactable element \n

    ...     Example \n
    ...     | Click Interactable Element |  xpath=//button[@id='email'] |  30s |
    [Arguments]     ${locator}   ${timeout}=30s
    Wait Until Page Contains Element    ${locator}      ${timeout}
    Wait Until Element Is Visible    ${locator}      ${timeout}
    Wait Until Element Is Enabled    ${locator}      ${timeout}
    Click Element    ${locator}

Click Until Element Succeed
    [Documentation]     Use this keyword to click on interactable element \n
        ...    with retries
        ...     | Click Until Element Succeed |  xpath=//button[@id='email'] |  30s |  1s |
        ...     | Click Until Element Succeed |  xpath=//button[@id='email'] |
    [Arguments]     ${locator}      ${retry}=30s    ${retry_interval}=0.5s
    Wait Until Keyword Succeeds    ${retry}     ${retry_interval}     Click Element    ${locator}

    