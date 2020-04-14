*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  String
Library    Collections
Resource    ../resource/resource.robot
Resource    ../TC_UpdateProfile/resource.robot
*** Test Cases ***
Verify the basic infors in profile is same as them on edit pop up
    open by chrome
    log in  mario@yopmail.com   123456
    open company profile
    @{infor1}   get basic infors in profile
    @{infor2}   get basic infors in edit pop up
    SHOULD BE EQUAL  ${infor1}  ${infor2}
    close browser