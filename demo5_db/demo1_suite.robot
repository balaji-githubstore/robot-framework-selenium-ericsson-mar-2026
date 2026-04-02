*** Settings ***
Library     DatabaseLibrary

Suite Setup     Connect To Database     db_module=pymysql   db_name=sql8821965    db_user=sql8821965
...   db_password=QTwZRZ7Un3    db_host=sql8.freesqldatabase.com       db_port=3306

Suite Teardown      Disconnect From All Databases


*** Test Cases ***
TC1
   ${row_count}     Row Count    select * from Persons
   Log To Console    ${row_count}