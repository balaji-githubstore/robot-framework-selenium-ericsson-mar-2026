*** Comments ***
JSON expression very important

*** Settings ***
Library     RPA.JSON


*** Test Cases ***
TC1
    ${json}  Load JSON from file    ${EXECDIR}${/}config${/}data.json
    Log To Console    ${json}[id]
    ${output}   Get values from JSON    ${json}    $
    Log To Console     ${output}
    ${output}   Get values from JSON    ${json}    $.id
    Log To Console     ${output}
    ${output}   Get values from JSON    ${json}    $.photoUrls
    Log To Console     ${output}
    ${output}   Get values from JSON    ${json}    $..id
    Log To Console     ${output}
    ${output}   Get values from JSON    ${json}    $.tags[?(@.id>11)]
    Log To Console     ${output}
