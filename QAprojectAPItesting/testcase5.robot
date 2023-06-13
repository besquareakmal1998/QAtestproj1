*** Settings ***

Documentation  single test for login
Library  SeleniumLibrary

*** Variables ***

${tokenName}   akmalmohd
${nulltokenName}   


*** Keywords ***


Login
    Open Browser  https://app.deriv.com/  chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button
    Click Element    dt_login_button
    Wait Until Page Contains Element  txtEmail
    Input Text    txtEmail    mohamad.akmal@besquare.com.my
    Input Password    txtPass   55113366Aa*.+
    Click Element    //button[@name="login"]

NavigateApi
    Wait Until Element Is Visible  //*[@class="dc-icon"]
    Wait Until Element Is Visible  //*[@href="/account/personal-details"]
    Click Element  //*[@href="/account/personal-details"]
    Wait Until Element Is Visible  //*[@href="/account/api-token"]
    Click Element  //*[@href="/account/api-token"]
    Wait Until Element Is Visible  //*[@class="da-article"]
    Sleep  5

CannotGenerateNull
     Wait Until Element Is Visible  //*[@name="read"]//parent::label
    Click Element  //*[@name="read"]//parent::label
    Wait Until Element Is Visible  //*[@class="dc-input__field"]
    Input Text  //*[@class="dc-input__field"]  ${nulltokenName}
    Press Keys  //*[@class="dc-input__field"]  SPACEBAR
    Wait Until Element Is Visible  //*[contains(text(),"Please enter a token name")]
    Wait Until Element Is Visible  //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
    Click Element  //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]  
    Sleep  6

*** Test Cases ***
 TestCase5:Verify that a user cannot generate a null token name
     Login
     NavigateApi
     CannotGenerateNull
 