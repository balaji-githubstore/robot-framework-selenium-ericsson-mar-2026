*** Settings ***
Documentation       Hardcoded all logics here for simple understanding
Library     RequestsLibrary

Suite Setup     Create Session    alias=gitapi    url=https://api.github.com

Suite Teardown      Delete All Sessions

*** Variables ***
${API_KEY}      xxx

*** Test Cases ***
TC1 Verify List Repo For UnAuth User
    GET On Session      alias=gitapi    url=user/repos     expected_status=401


TC2 Verify List Repo For Auth User Using Bearer
    &{headers_dic}      Create Dictionary       Authorization=Bearer ${API_KEY}
    ...     Accept=application/vnd.github+json      X-GitHub-Api-Version=2026-03-10
    ${response}  GET On Session      alias=gitapi    url=user/repos     headers=${headers_dic}     expected_status=200
    Log    ${response}
    Log    ${response.json()}[0][name]

TC2 Verify List Repo For Auth User Using Basic Auth
    @{auth_list}    Create List     dbala-cloud     ${API_KEY}
    Create Session    alias=gitapi    url=https://api.github.com        auth=${auth_list}

    ${response}  GET On Session      alias=gitapi    url=user/repos     expected_status=200
    Log    ${response}
    Log    ${response.json()}[0][name]