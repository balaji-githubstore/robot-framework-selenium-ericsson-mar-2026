*** Settings ***
Library    DateTime
Library    String


*** Test Cases ***
TC1
    Log To Console    message=hello world
    Log To Console    Welcome to robot framework session
    
TC2
    ${my_name}  Set Variable  balaji
    Log To Console    ${my_name}
    Set Local Variable    ${number}     4500

TC3
    ${radius}   Set Variable    45
    ${output}    Evaluate    3.14*${radius}*${radius} 
    Log To Console    ${output}

TC4
    ${current_date}    Get Current Date
    Log To Console    ${current_date}

TC5
    ${num1}  Set Variable  $710,000
    ${num2}  Set Variable  $60,000
    ${num1}     Remove String  ${num1}  $   , 
    ${num2}     Remove String  ${num2}  $   , 
    Log To Console    ${num1}
    ${output}    Evaluate    ${num1}+${num2}
    Log To Console    ${output}

