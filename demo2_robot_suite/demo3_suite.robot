
*** Test Cases ***
TC1
    Log To Console    C:\\AutomationSession\\demo.pdf
    Log To Console    C:${/}AutomationSession${/}demo.pdf
    Log To Console    ${EXECDIR}
    Log To Console    ${CURDIR}
    Log To Console    ${OUTPUT_DIR}
    Log To Console    ${TEMPDIR}
    Log To Console    ${TEST_NAME}
    Log To Console    ${SUITE_NAME}

TC2 For loop
   @{fruits}   Create List     mango   orange  grapes   jackfruit    tomato
   ${item_count}  Get Length    ${fruits}
    
   FOR    ${i}    IN RANGE    0    ${item_count}
       Log To Console    ${fruits}[${i}]
   END

   