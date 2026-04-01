*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Test Cases ***
API Client Cert Test
    ${cert_path}=    Set Variable    /home/certs/client.pem
    ${key_path}=     Set Variable    /home/certs/key.pem
    @{client_certs}=    Create List    ${cert_path}    ${key_path}

    # Create the session, specifying the client_certs argument
    Create Client Cert Session    my_alias    https://api.server    client_certs=@{client_certs}    verify=${FALSE}

    # Make a GET request using the created session
    ${resp}=    GET On Session    my_alias    /extension/uri/

    # Assert the status code
    Should Be Equal As Strings    ${resp.status_code}    200