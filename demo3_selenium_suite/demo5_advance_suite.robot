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

TC4 Javascript Option 1 Using QuerySelector
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://demo.openemr.io/b/openemr/interface/login/login.php?site=default

    Execute Javascript  document.querySelector('#authUser').value='jack'
    Sleep    3s
    Close Browser

TC4 Javascript Option 2 Using QuerySelector
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://demo.openemr.io/b/openemr/interface/login/login.php?site=default
    ${ele}      Get WebElement    xpath=//input[@id='authUser']

    Execute Javascript  arguments[0].value='jack'   ARGUMENTS   ${ele}
    Sleep    3s
    Close Browser


TC5 JS In RealTime
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.malaysiaairlines.com/in/en/home.html
    Click Element    xpath=//span[text()='Accept all cookies']

     ${ele}      Get WebElement    xpath=//div[@id='book-flight']//input[@name='dateDeparture']
     Execute Javascript  arguments[0].value='26 Apr 2026'   ARGUMENTS   ${ele}

