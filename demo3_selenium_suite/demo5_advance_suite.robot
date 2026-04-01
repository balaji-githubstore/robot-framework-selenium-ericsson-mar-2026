*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1 Upload
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Choose File    xpath=//input[@type='file']    file_path=C:\\AutomationSession\\demo.pdf
    Sleep    3s
    Close Browser

TC2 Upload
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Choose File    xpath=//input[@type='file']    file_path=${EXECDIR}${/}files${/}demo.pdf
    Sleep    3s
    Close Browser

TC3 CSS Selector
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://demo.openemr.io/b/openemr/interface/login/login.php?site=default
    Input Text    css=#authUser    admin
    Input Password    css=#clearPass    pass
    Select From List By Label    css=select[name='languageChoice']      Arabic
    Sleep    3s
    Close Browser