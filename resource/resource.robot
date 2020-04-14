*** Keywords ***
Open by Chrome
    Open browser    https://web.tenshoku-dev.scrum-dev.com/    Chrome
Log in
    [Arguments]    ${username}   ${password}
    Click Element     class:log-in-btn
    Click Element  class:icon-company
    sleep  3
    Input text   username   ${username}
    Input password    password    ${password}
    Click Button    xpath://*[@id="login-page"]/div[2]/div/form/button
    SLEEP  2
Verify empty
    [Arguments]     ${locator}    ${expected}
    open by chrome
    open company register
    sleep   2
    click element    ${locator}       ${EMPTY}
    click button   xpath://*[@id="company-registration-page"]/div[2]/div/form/button
    Element Text Should Be  class:error-message   ${expected}
    close browser