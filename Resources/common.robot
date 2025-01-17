*** Settings ***
Library     AppiumLibrary
Resource    ../Data/device_info.robot

*** Keywords ***
Open Real Estate Application
    Open Application    http://127.0.0.1:${APPIUM-PORT}
    ...    platformName=Android
    ...    udid=${EMULATOR}
    ...    appPackage=ca.crea.app.consumer
    ...    appActivity=ca.crea.app.consumer.MainActivity
    ...    automationName=UiAutomator2
    ...    appium:systemPort=${APPIUM-SYSTEM-PORT}
    ...    appium:addPort=${APPIUM-ADDPORT}
    ...    appium:newCommandTimeout=0

Close Real Estate Application
    Close Application