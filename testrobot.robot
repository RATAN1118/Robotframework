*** Settings ***
Documentation           This is a simple test with Robot Framework
Library                 SeleniumLibrary

*** Variables ***
${SERVER}               https://www.saucedemo.com/
${BROWSER}              Chrome
${DELAY}                0
${user_name}            standard_user
${user_pass}            secret_sauce
${link}                 https://www.saucedemo.com/inventory.html


*** Keywords ***

*** Test Cases ***
Valid Login
   Open Browser         ${SERVER}   ${BROWSER}
   Maximize Browser Window
   Input Text   id:user-name    ${user_name}
   Input Text   id:password    ${user_pass}
   Click Button    id:login-button
   Set Selenium Speed   ${DELAY}
   Page Should Contain    Products
   Close Browser
Invalid Login
   Open Browser         ${SERVER}   ${BROWSER}
   Maximize Browser Window
   Input Text   id:user-name    locked_out
   Input Text   id:password    ${user_pass}
   Click Button    id:login-button
   Page Should Contain    Products
   Set Selenium Speed   ${DELAY}
[Teardown].             Close Browser