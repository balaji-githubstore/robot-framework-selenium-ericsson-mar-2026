*** Settings ***
Documentation   Resource file contains create session for gitapi, petstoreapi
...     use this session for testing api endpoints
Library     RequestsLibrary

*** Variables ***
${API_KEY}      xxx


*** Keywords ***
Create Session with Bearer Token
    &{headers_dic}      Create Dictionary       Authorization=Bearer ${API_KEY}
    ...     Accept=application/vnd.github+json      X-GitHub-Api-Version=2026-03-10

    Create Session    alias=gitapi    url=https://api.github.com    headers=${headers_dic}

Create Session with Basic Auth
    @{auth_list}    Create List     dbala-cloud     ${API_KEY}
    Create Session    alias=gitapi    url=https://api.github.com        auth=${auth_list}

Create Session with client Cert
    ${cert_path}=    Set Variable    /home/certs/client.pem
    ${key_path}=     Set Variable    /home/certs/key.pem
    @{client_certs}=    Create List    ${cert_path}    ${key_path}

    # Create the session, specifying the client_certs argument
    Create Client Cert Session    my_alias    https://api.server    client_certs=@{client_certs}    verify=${FALSE}
