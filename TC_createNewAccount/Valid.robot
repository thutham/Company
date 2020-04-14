*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  String
Library    Collections
Resource    ../resource/resource.robot
Resource    ../TC_createNewAccount/resource.robot
*** Test Cases ***
create new account with all valid fields
    open by Chrome
    Open company register
    sleep   5
    Input valid fields  comp1@yopmail.com
    Verify register successfully    Mario Company
    Close browser