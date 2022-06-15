*** Settings ***
Documentation           This is a simple test with Robot Framework
Library                 SeleniumLibrary

*** Variables ***
${SERVER}               https://www.saucedemo.com/
${BROWSER}              Chrome
${DELAY}                0
${user_name}            standard_user
${user_pass}            secret_sauce


*** Keywords ***

*** Test Cases ***
Valid Login
   Open Browser         ${SERVER}   ${BROWSER}
   Maximize Browser Window
   Input Text   id:user-name    ${user_name}
   Input Text   id:password    ${user_pass}
   Click Button    id:login-button
   Set Selenium Speed   ${DELAY}
Invalid Login
   Open Browser         ${SERVER}   ${BROWSER}
   Maximize Browser Window
   Input Text   id:user-name    locked_out_user
   Input Text   id:password    ${user_pass}
   Click Button    id:login-button
   Set Selenium Speed   ${DELAY}
[Teardown].             Close Browser