*** Settings ***
Library    Collections


*** Variables ***
${BROWSER_NAME}     chrome
@{COLORS}   red   green   yellow  blue
&{EMPLOYEE_DETAIL}  name=john   salary=5000   role=trainer

*** Test Cases ***
TC1
    Log To Console    ${BROWSER_NAME}

TC2
    Log To Console    ${BROWSER_NAME}
    Log To Console    ${COLORS}
    Log To Console    ${COLORS}[0]
    ${item_count}  Get Length    ${COLORS}
    Log To Console    ${item_count}

TC3
    Log To Console    ${EMPLOYEE_DETAIL}[salary]

TC4
   @{fruits}   Create List     mango   orange  grapes
   Log To Console    ${fruits}
   Append To List   ${fruits}   watermelon

#   insert apple at index 0
    Insert Into List    ${fruits}    0    apple
    Log To Console    ${fruits}
#   remove orange
    Remove Values From List    ${fruits}    orange
#   print final list
    Log To Console    ${fruits}


