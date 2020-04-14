*** Settings ***
Documentation    Suite description
Library  Selenium2Library
*** Test Cases ***
create new account with all valid fields
    open by Chrome
    Open company register
    sleep   5
    Input valid fields  comp1@yopmail.com
    Verify register successfully    Mario Company
    Close browser
Email is already registered
    open by Chrome
    open company register
    sleep   3
    Input valid fields  mario@yopmail.com
    Verify email have registed yet
    Close browser
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
*** Keywords ***
Open by Chrome
    Open browser    https://web.tenshoku-dev.scrum-dev.com/    Chrome
Verify empty
    [Arguments]     ${locator}    ${expected}
    open by chrome
    open company register
    sleep   2
    click element    ${locator}       ${EMPTY}
    click button   xpath://*[@id="company-registration-page"]/div[2]/div/form/button
    Element Text Should Be  class:error-message   ${expected}
    close browser
Button register is disable
    Element Should Be Disabled  xpath://*[@id="company-registration-page"]/div[2]/div/form/button
Open company register
    click element  class:sign-up-btn
    sleep  2
    click element  class:icon-company
Input valid fields
    [Arguments]    ${email}
    input text    presidentName  Thu Tham
    input text  companyName   Mario Company
    input text  email  ${email}
    input text  password   123456
    click element  xpath://*[@id="company-registration-page"]/div[2]/div/form/div[5]/div
    click element   xpath=//span[@aria-label='3月 13, 2002']
    click element  answerHow
    Select From List by Value    answerHow    6cuy8hDYgn
    click button  xpath://*[@id="company-registration-page"]/div[2]/div/form/button
Verify register successfully
    [Arguments]    ${companyname}
    Element Text Should Be  class:company-name  ${companyname}
    Close browser
Verify email have registed yet
    sleep   3
    Element Text Should Be  class:system-error  このメールアドレスはすでに登録されています






