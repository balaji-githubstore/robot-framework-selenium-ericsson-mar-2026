*** Settings ***
Library     FakerLibrary

*** Test Cases ***
TC1
    ${address_data}  FakerLibrary.Address
    Log To Console    ${address_data}
TC1
    ${address_data}  FakerLibrary.Credit Card Full
    Log To Console    ${address_data}