*** Settings ***
Library     RequestsLibrary

Suite Setup     Create Session    alias=petstore    url=https://petstore.swagger.io/v2
Suite Teardown      Delete All Sessions


*** Test Cases ***
TC1 Add Valid Pet
    ${json_body}    Get File For Streaming Upload    path=${EXECDIR}${/}files${/}new_pet.json

    &{headers}   Create Dictionary       Content-Type=application/json       api_key=8728878237
    ${response}     POST On Session     alias=petstore      url=pet     headers=${headers}
    ...     data=${json_body}       expected_status=200
    Log    ${response.json()}


TC2 Update Valid Pet
    ${json_body}    Get File For Streaming Upload    path=${EXECDIR}${/}files${/}update_pet.json

    &{headers}   Create Dictionary       Content-Type=application/json       api_key=8728878237
    ${response}     Put On Session     alias=petstore      url=pet     headers=${headers}
    ...     data=${json_body}       expected_status=200
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.json()}[name]    dog-605

#TC3 Delete Valid Pet
