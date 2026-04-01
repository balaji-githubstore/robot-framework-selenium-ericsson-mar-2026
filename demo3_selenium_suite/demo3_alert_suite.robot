*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1 Switch Tab Using Title
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
#    click on Go