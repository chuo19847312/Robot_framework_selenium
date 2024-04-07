resource    ../variables/variables.robot

*** keywords ***
open source demo homepage with "${browser}" browser
    Open Browser    ${base_url}    ${browser}

login account with "${account}" and "${password}"
    Wait Until Page Contains Element    //input[@placeholder='Username']    ${timeout}
    Input Text    //input[@placeholder='Username']    ${account}
    Wait Until Page Contains Element    //input[@placeholder='Password']    ${timeout}
    Input password    //input[@placeholder='Password']    ${password}
    Click Element    //input[@name='login-button']

should display title successfully after login
    Wait Until Page Contains Element    //div[contains(text(), 'Swag Labs')]    ${timeout}

should display lockout message
    Wait Until Page Contains Element    //h3[contains(text(),'Epic sadface: Sorry, this user has been locked out.')]    ${timeout}

click about
    Wait Until Page Contains Element    //button[contains(text(), 'Open Menu')]    ${timeout}
    Click Element    //button[contains(text(), 'Open Menu')]
    Wait Until Element Is Visible    //a[contains(text(), 'About')]   ${timeout}
    Click Element    //a[contains(text(), 'About')]

should display error with problem user
    Wait Until Page Contains Element    //h2[contains(text(), 'Uh oh! This page got lost in the web.')]    ${timeout}

visit inventory page
    Go To    ${base_url}/inventory.html

should display error without login
    Wait Until Page Contains Element    //h3[contains(text(),"Epic sadface: You can only access '/inventory.html' when you are logged in.")]    ${timeout}