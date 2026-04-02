*** Comments ***
PersonID int PRIMARY KEY,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Address varchar(255),
  City varchar(255)


*** Settings ***
Library     DatabaseLibrary
Library    SeleniumLibrary

Suite Setup     Connect To Database     db_module=pymysql   db_name=sql8821965    db_user=sql8821965
...   db_password=QTwZRZ7Un3    db_host=sql8.freesqldatabase.com       db_port=3306       alias=db1

Suite Teardown      Disconnect From All Databases

Test Setup    Open Browser      browser=chrome
Test Teardown  Close Browser


*** Test Cases ***
TC1
    Table Must Exist    table_name=Persons

   ${row_count}     Row Count    select * from Persons
   Log To Console    ${row_count}

   Should Be Equal As Integers    ${row_count}    12
   
   Check Row Count    select * from Persons    ==    12


TC2 Update   
    Execute Sql String    Update Persons set LastName='john' where PersonID=10
    Check Row Count    select * from Persons where PersonID=10 and LastName='john'  ==    1
   
TC3 Delete
    Execute Sql String    Delete from Persons where PersonID=10
    Check Row Count    select * from Persons where PersonID=10   ==    0

TC4 Insert
    Execute Sql String    Insert into Persons values (102,'wick','john','2 anna','chennai')
    Check Row Count    select * from Persons where PersonID=102   ==    1

TC5 Select
    ${output}     Query    select * from Persons
    Log    ${output}
    ${row_count}     Get Length    ${output}
    Log    ${row_count}
    
   #  go to first row and 5th cell 
    Log    ${output}[0][4]

TC6 Select
    ${output}     Query    select * from Persons where city='New york'
    Log    ${output}
    ${row_count}     Get Length    ${output}
    Log    ${row_count}
    
   #  go to first row and 5th cell 
    Log    ${output}[0][4]