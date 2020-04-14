*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  String
Library    Collections
Resource    ../resource/resource.robot
Resource    ../TC_createNewAccount/resource.robot
*** Test Cases ***
Empty president name
    verify empty  presidentName      この項目は必須です。
Empty company name
    verify empty  companyName  この項目は必須です。
Empty email
    verify empty  email    あなたのメールアドレスを入力してください
Empty password
    verify empty  password    この項目は必須です。
Empty birthday
    verify empty     xpath://*[@id="company-registration-page"]/div[2]/div/form/div[5]/div     この項目は必須です。
Empty answerHow
    verify empty  answerHow    この項目は必須です。