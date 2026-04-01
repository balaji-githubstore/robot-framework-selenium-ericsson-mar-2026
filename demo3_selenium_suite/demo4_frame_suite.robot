*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1 Javascript Alert
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking
#    enter userid as john123