*** Settings ***
Library    Selenium2Library

*** Variables ***
${MyWebsite_URL}    https://www.website.com/sign-in/
${Browser}    chrome

${txt_username_locator}    //*[@id="username"]
${txt_password_locator}    //*[@id="password"]

${btn_login_locator}    //*[@id="signin-submit2"]
${btn_logout_locator}    //*[@id="site-menu"]/li[5]

${element_logo_website}    //*[@id="site-logo"]
${element_text_website}    //*[@id="manageSites"]/h1

${set_username}    qatest
${set_password}    Q1234a5678

*** Keyword ***
Input Username
    [Arguments]    ${username}
    Input Text    ${txt_username_locator}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${txt_password_locator}    ${password}

Click Login
    Click Element    ${btn_login_locator}

Verify Logo Website
    Page Should Contain Element    ${element_logo_website} 

Verify Text Website
    Page Should Contain Element    ${element_text_website}

Click Logout
    Click Element    ${btn_logout_locator}

Close My Website
    Close Browser

*** Test Cases ***

TC_01_Login website using User: qatest, Password: Q1234a5678
    Open Browser    ${MyWebsite_URL}    ${Browser}
    Sleep    1s

    Input Username    ${set_username}
    Input Password    ${set_password}
    Wait Until Element Is Visible    ${txt_password_locator}
    Sleep    2s

    Click Login
    Sleep    1s

TC_02_Verify Logo and Text Website.
    Verify Logo Website
    Verify Text Website
    Sleep    5s

TC_03_Logout Website.
    Click Logout
    Sleep    2s

TC_04_Close My Website
    Close My Website
