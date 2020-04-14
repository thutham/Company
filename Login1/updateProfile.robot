*** Settings ***
Library  Selenium2Library
Library  String
Library    Collections
Resource    ../resource/resource.robot
*** Test Cases ***
Verify the basic infors in profile is same as them on edit pop up
    open by chrome
    log in  mario@yopmail.com   123456
    open company profile
    @{infor1}   get basic infors in profile
    @{infor2}   get basic infors in edit pop up
    SHOULD BE EQUAL  ${infor1}  ${infor2}
    close browser
#Verify the user can update company-infor with all valid information
#    open by chrome
#    log in  mario@yopmail.com   123456
#    open company profile
#    update company infor with new account
Verify company-info in profile are same as company-info in edit pop up
    open by chrome
    log in  mario@yopmail.com   123456
    open company profile
    @{infor1}   get company-info in profile
    @{infor2}   get infor in company infor pop up
    SHOULD BE EQUAL  ${infor1}  ${infor2}
    close browser
Verify the 社員数 list on dropdown in company infor is correctly
    open by chrome
    log in  mario2@yopmail.com  123456
    open company profile
    open 会社基本情報の編集 pop up
    verify 社員数
    close browser
verify 業界 list in company infor is correctly
    open by chrome
    log in  mario2@yopmail.com  123456
    open company profile
    open 会社基本情報の編集 pop up
    verify 業界
    close browser

verify 事業所 list in company infor is correctly
    open by chrome
    log in  mario2@yopmail.com  123456
    open company profile
    open 会社基本情報の編集 pop up
    verify 事業所
verify 本社所在地
    open by chrome
    log in  mario2@yopmail.com  123456
    open company profile
    open 会社基本情報の編集 pop up
    Verify 本社所在地
    close browser
Verify the account has not confirmed yet
    open by chrome
    log in  mario2@yopmail.com  123456
    open company profile
    page should contain  未承認のメールアドレス

*** Keywords ***
Get basic infors in profile
    ${name}     Selenium2Library.Get Text   class:company-name
    ${tag}      Selenium2Library.Get Text   class:company-tag
    ${intro}    Selenium2Library.Get Text    class:company-introductions
    ${weblink}  Selenium2Library.Get Text    class:company-web-link
    ${basic_infor}     create list  ${name}    ${tag}  ${intro}    ${weblink}
    [return]  ${basic_infor}
Get basic infors in edit pop up
    click element   xpath://*[@id="profile-container"]/div[3]/div[1]/div[1]
    ${companyName}     Get value   name:companyName
    ${website}     Get value   name:companyWebsite
    ${introduce}     Get value   name:companyIntroduction
    ${tag}     Get Text   class:css-12jo7m5
    ${basic_infor}     create list  ${companyName}    ${tag}  ${introduce}    ${website}
    [return]  ${basic_infor}

update company infor with new account
    open 会社基本情報の編集 pop up
    Wait Until Element Is Visible   xpath://*[@id="edit-company-profile"]/div/div[3]/form/div[1]/div[1]/div/div/div[1]
    click element   xpath://*[@id="edit-company-profile"]/div/div[3]/form/div[1]/div[1]/div/div/div[1]
    click element   id:react-select-2-option-4
    input text  name:capital    Tokyo
    Click element   css:.flatpickr-input
    select from list by label   css:.flatpickr-monthDropdown-months     5月
    input text      aofSales    2000$
    {aofSales}=     2000$
    Select From List by label     nofEmployees    11~30
    click element   css:.input-group:nth-child(6) .css-1pcexqc-container
    click element   id:react-select-3-option-0
    click element   css:.modal-content
    click element   css:.input-group:nth-child(7) .css-1pcexqc-container
    click element   id:react-select-4-option-0
    sleep   2
    double click element   css:.modal-content
    sleep   2
    click element  xpath://*[@id="edit-company-profile"]/div/div[3]/form/div[8]/button
Get company-info in profile
    open company profile
    ${infortext}    create list
    ${infor}    Get Webelements    class:table-data
    FOR  ${i}  IN  @{infor}
        ${i}    set variable  ${i.text}
        APPEND TO LIST  ${infortext}    ${i}
    END
#    @{infor2}   get infor in company infor pop up
#    SHOULD BE EQUAL  ${infortext}  ${infor2}
    [Return]        ${infortext}
Get infor in company infor pop up
    open 会社基本情報の編集 pop up
    sleep  1
    @{infor2}   create list
    sleep  2
    ${headquater}    Get WebElement     class:css-dvua67-singleValue
    ${headquater}   Set Variable   ${headquater.text}
    ${capital}     Get value   name:capital
    ${aofSales}     Get value   name:aofSales
    ${establish}    Set Variable    2020年05月
    ${nofemployees}     Get selected list label      name:nofEmployees
    ${infors}   create list  ${headquater}  ${establish}    ${capital}    ${aofSales}   ${nofemployees}
    ${officer_business}      Get WebElements  class:css-12jo7m5
    FOR  ${i}  IN  @{officer_business}
        Append To List  ${infors}    ${i.text}
    END
    Remove space of text  ${infors}     ${infor2}
    [Return]  ${infor2}
verify 社員数
    ${ExpectednofEmployees}   create list   社員数     ~10     11~30      31~50   51~100  101~200     201~500     501~1000    1001以上
    @{RESPONSE_LIST}    create list
    ${actualEmployees}  Get List Items    nofEmployees
    remove space of text  ${actualEmployees}  ${RESPONSE_LIST}
    Verify result list of select    ${RESPONSE_LIST}    ${ExpectednofEmployees}
Verify 本社所在地
    ${Expected}   create list   東京\n大阪\n京都\n兵庫\n奈良\n滋賀\n和歌山\n三重\n北海道\n青森\n岩手\n宮城\n秋田\n山形\n福島\n茨城\n栃木\n群馬\n埼玉\n千葉\n神奈川\n新潟\n富山\n石川\n福井\n山梨\n長野\n岐阜\n静岡\n愛知\n鳥取\n島根\n岡山\n広島\n山口\n徳島\n香川\n愛媛\n高知\n福岡\n佐賀\n長崎\n熊本\n大分\n宮崎\n鹿児島\n沖縄\n海外
    @{actual}   get child web elements passing parent and child as locator  xpath://*[@id="edit-company-profile"]/div/div[3]/form/div[1]/div[1]/div/div/div[1]    class:css-kj6f9i-menu
    Verify result list of select  ${actual}     ${Expected}
    click element   css:.modal-content

Verify 事業所
    ${Expected}   create list   東海\n四国\n関西\n東北\n関東\n北海道\n北信越\n海外\n中国\n九州\n沖縄
    @{actual}   get child web elements passing parent and child as locator  css:.input-group:nth-child(6) .css-1pcexqc-container    class:css-kj6f9i-menu
    Verify result list of select  ${actual}     ${Expected}
    click element   css:.modal-content
Verify 業界
    @{Expected}   create list   流通・小売\nホテル・レジャー\n人材・教育\n旅行\nサービス\n繊維\n広告\n化粧品・医薬\n保険\n住宅・建設\nインフラ\n電機・自動車\nアパレル\nマスコミ\nIT\n証券\n化学・石油\n出版・印刷\n鉄道・航空\nソフトウェア\nゲーム\nコンサルティング\n商社\n銀行・信金\n運輸・物流\n不動産\nクレジットカード\n官公庁\n食品・飲料\n農林・水産\nメーカー\n動画制作\n飲料業界\n航空業界
    @{actual}   get child web elements passing parent and child as locator  css:.input-group:nth-child(7) .css-1pcexqc-container    class:css-kj6f9i-menu
    Verify result list of select  ${actual}     ${Expected}
    click element   css:.modal-content

open company profile
    click element   class:fullname
    click element   class:link
open 会社基本情報の編集 pop up
    sleep  2
    click element   xpath://*[@id="profile-container"]/div[3]/div[3]/div[1]/img
    sleep   2

Get list Items from select
    [Arguments]    ${var}   ${select_name}
    ${var}=     Get List Items    ${select_name}
Remove space of text
    [Arguments]    ${listname}  ${RESPONSE_LIST}
    FOR     ${i}    IN  @{listname}
        ${contains}=    Run Keyword And Return Status    Should Contain    ${i}    ${space}
        ${i}=   Run Keyword If  ${contains} is ${True}  Replace String     ${i}  ${space}    ${empty}
                ...    ELSE    Set Variable    ${i}
        Append To List  ${RESPONSE_LIST}    ${i}
    END
Verify result list of select
    [Arguments]    ${RESPONSE_LIST}    ${ExpectednofEmployees}
    should be equal    ${RESPONSE_LIST}   ${ExpectednofEmployees}
Get Child Web Elements Passing Parent And Child As Locator
    [Arguments]    ${locator_list}  ${locator_menu}
    click element   ${locator_list}
    @{RESPONSE_LIST}    create list
    @{childs}=    Get Child WebElements   ${locator_menu}
    FOR  ${i}  IN  @{childs}
        Append To List  ${RESPONSE_LIST}    ${i.text}
    END
    log many  ${RESPONSE_LIST}
    [Return]       ${RESPONSE_LIST}
Get Child WebElements
    [Arguments]    ${locator}

    ${element}    Get WebElement    ${locator}
    ${children}     Call Method
    ...                ${element}
    ...                find_elements
    ...                  by=xpath    value=child::*

    [Return]      ${children}
Logout
    click element   class:close-button
    click element   class:fullname
    sleep  2
    click element   class:item log-out