*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  String
Library    Collections
Resource    ../resource/resource.robot
Resource    ../TC_createNewAccount/resource.robot
*** Test Cases ***
Email is already registered
    open by Chrome
    open company register
    sleep   3
    Input valid fields  mario@yopmail.com
    Verify email have registed yet
    Close browser