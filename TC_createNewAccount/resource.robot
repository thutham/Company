*** Keywords ***
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

