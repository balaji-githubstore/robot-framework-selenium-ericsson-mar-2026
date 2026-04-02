*** Settings ***
Documentation       Using setup.resource for accessing the available session

Resource    setup.resource

Suite Setup     Create Session with Bearer Token
Suite Teardown      Delete All Sessions

*** Test Cases ***
TC1 Verify List Repo For Valid User
    ${response}   GET On Session      alias=gitapi    url=user/repos    expected_status=200
    Log    ${response}
    Log    ${response.json()}[0][name]