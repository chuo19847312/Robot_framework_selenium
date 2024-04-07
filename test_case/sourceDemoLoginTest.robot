*** settings ***
Library     Selenium2Library
resource    ../keywords/sourceDemoLoginKeyword.robot
resource    ../variables/variables.robot

test setup      open source demo homepage with "Chrome" browser
test teardown   Close Browser


*** test cases ***
01_signInStandardUser
    login account with "standard_user" and "secret_sauce"
    should display title successfully after login

02_signInLockOutUser
    login account with "locked_out_user" and "secret_sauce"
    should display lockout message

03_signInProblemUser
    login account with "problem_user" and "secret_sauce"
    click about
    should display error with problem user

04_checkInventoryWithoutLogin
    visit inventory page
    should display error without login