*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  String
Library    Collections
Resource    ../resource/resource.robot
Resource    ../TC_UpdateProfile/resource.robot
*** Test Cases ***
Verify the user can update company-infor with all valid information
    open by chrome
    log in  mario@yopmail.com   123456
    open company profile
    update company infor with new account
    close browser
#Verify company-info in profile are same as company-info in edit pop up
#    open by chrome
#    log in  mario@yopmail.com   123456
#    open company profile
#    @{infor1}   get company-info in profile
#    @{infor2}   get infor in company infor pop up
#    SHOULD BE EQUAL  ${infor1}  ${infor2}
#    close browser
#Verify the 社員数 list on dropdown in company infor is correctly
#    open by chrome
#    log in  mario2@yopmail.com  123456
#    open company profile
#    open 会社基本情報の編集 pop up
#    verify 社員数
#    close browser
#verify 業界 list in company infor is correctly
#    open by chrome
#    log in  mario2@yopmail.com  123456
#    open company profile
#    open 会社基本情報の編集 pop up
#    verify 業界
#    close browser
#
#verify 事業所 list in company infor is correctly
#    open by chrome
#    log in  mario2@yopmail.com  123456
#    open company profile
#    open 会社基本情報の編集 pop up
#    verify 事業所
#verify 本社所在地
#    open by chrome
#    log in  mario2@yopmail.com  123456
#    open company profile
#    open 会社基本情報の編集 pop up
#    Verify 本社所在地
#    close browser