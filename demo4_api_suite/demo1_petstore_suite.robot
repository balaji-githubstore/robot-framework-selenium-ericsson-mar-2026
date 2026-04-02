*** Settings ***
Library     RequestsLibrary

Suite Setup     Create Session    alias=petstore    url=https://petstore.swagger.io/v2
Suite Teardown      Delete All Sessions

*** Test Cases ***
TC1 Verify Valid PetId
    ${response}    GET On Session      alias=petstore      url=/pet/605       expected_status=200
    Log    ${response.json()}
    Log    ${response.json()}[id]
    Log    ${response.json()}[name]
#    log id inside tags key from json
    Log    ${response.json()}[tags][0][id]

    ${actual_id}     Convert To String    ${response.json()}[id]
    Should Be Equal As Strings     ${actual_id}     605
    Should Contain    ${response.text}    605

TC2 Verify Invalid PetId
    ${response}    GET On Session      alias=petstore      url=/pet/5777   expected_status=404
    Status Should Be    404
#    print the message from the json
    Log     ${response.json()}[message]
    Should Be Equal As Strings    ${response.json()}[message]    Pet not found

TC3 Get Pet By Status
    ${response}    GET On Session      alias=petstore      url=/pet/findByStatus?status=available   expected_status=200
    Log     ${response.json()}[0][status]
#    get status of first pet and log it

   ${item_count}  Get Length    ${response.json()}

   FOR    ${i}    IN RANGE    0    ${item_count}
#       Log To Console    ${response.json()}[${i}][status]
    Should Be Equal As Strings    ${response.json()}[${i}][status]    available
   END