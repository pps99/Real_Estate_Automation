*** Settings ***
Library     AppiumLibrary

*** Variables ***
${DismissButton} =    xpath=//android.widget.TextView[@resource-id="x:id/banner.dismiss_button.text"]

*** Keywords ***
Dismiss Policy By Clicking Button
    Wait Until Page Contains Element    ${DismissButton}
    Click Element    ${DismissButton}